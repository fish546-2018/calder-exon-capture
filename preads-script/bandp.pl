#!/usr/bin/perl -w
#
###################################################################################################
#
# Name: bandp.pl
#
# This script is used to blast the query to non-redundant reads and parse the reads for different 
# genes for each subject species.
#
# Datafile: fasta file query, local blast data base of the reads, indexed fastq files
#
# Input: the name of the query file
#
# Output: blastall output file and fastq reads file for different genes under each species
#
# Written by 
#                 Chenhong Li
#                 Shanghai Ocean University, Shanghai, China.
#                 Created on Oct 2013
#                 Last modified on Aug 2016 by Hao Yuan
#                 New Traits: split query files first, then blast them against subject in parallel
#
###################################################################################################

use strict;
use warnings;
use Getopt::Long;   # include the module for input
use Parallel::ForkManager;

my $query; #variable for store query species name
my $subject; #list of subject name
my $E = 0.0001; # E-value for blast, the default is 0.0001
my $max = 2; #for store the maximum number of processes/forks
my $help;

my $opt = GetOptions( 'query:s', \$query,
                      'subject:s', \$subject,
                      'E:f', \$E,
                      'fork:s', \$max,
                      'help!', \$help); #set command line options
                      

if (!($opt && $query) || $help) {#check for the required inputs
   print STDERR "\nExample usage:\n";
   print STDERR "\n$0 -query=\"Oreochromis_niloticus\" -subject=\"Rhyacichthys_aspro Odontobutis_potamophila\"\n\n";
   print STDERR "Options:\n";
   print STDERR "        -query = name of the query species \n";
   print STDERR "        -subject = a list of subject species, use underscore to link genus and\n";
   print STDERR "                     species name; taxa seperated by one space\n\n";
   print STDERR "For more optional parameters, see README.txt\n\n";
   exit;
}


my @subgenome = split (/\s/, $subject); #split the names of suber genomes
my @sortedsubgenome = sort @subgenome;
 
my $pm = Parallel::ForkManager->new($max); 

my $queryfile = "$query.fas"; #get the name of blast query file

# split query file for parallelisation;
my $QUERYFILE;
open $QUERYFILE ,"<$queryfile" or die "can't open $queryfile";
my $string = do { local $/; <$QUERYFILE>; }; # read all context from $queryfile
my @count_seq = $string =~ />/g; # get the number of seq
my $count_seq = scalar @count_seq;

my (@out) = $string =~ />\S+\n{1}\S+\n{1}/g; # split id and seq into array

my $aver_seq = $count_seq / $max; # average number of seq in each splited file
my $int_aver_seq = int ($aver_seq); # integer of average number
my $last_aver_seq = $count_seq - ($max - 1) * $int_aver_seq; # number of seq in last file

for (my $i = 0; $i < ($max - 1); $i++) { # create $max-1 files (1st - ($max-1)th) and write $int_aver_seq seqs

	my $OUT_NEWFILE;
	my $out_newfile = $query . "|" . $i . ".fas";
	open ($OUT_NEWFILE, ">$out_newfile") or die "can't write $out_newfile ";
	for (my $j = 0; $j < $int_aver_seq; $j++) {
	my $id_seq = shift @out;
	print $OUT_NEWFILE "$id_seq";
	}
	close ($OUT_NEWFILE);

}

my $OUT_NEWFILE; # create $max th file and type in $last_aver_seq seqs
my $last = $max - 1;
my $last_out_newfile = $query . "|" . $last . ".fas";
open ($OUT_NEWFILE, ">$last_out_newfile") or die "can't write $last_out_newfile ";
	for (my $j = 0; $j < $last_aver_seq; $j++) {
	my $id_seq = shift @out;
	print $OUT_NEWFILE "$id_seq";
	}
close ($OUT_NEWFILE);
close ($QUERYFILE);


foreach my $sub (@sortedsubgenome) {    

    my $dir = $sub . "_results";
    `mkdir $dir`;
    
    #open the index file and fastq data file for retrieving late
    my $INDEX_FILE1;
    my $indexfile1 = $sub . "_rmrep_R1.index";
    open ($INDEX_FILE1, "<$indexfile1") or die "Cannot open $indexfile1 for reading ($!)";
    #read the index1 file
    my %index1;
    my $id1;
    while (my $line = readline ($INDEX_FILE1)) {
    	chomp $line;
    	my ($id1, $position1) = split /\t/, $line;# the id in index file is longer than in embl file
    	$index1{$id1} = $position1;
    }

    my $INDEX_FILE2;
    my $indexfile2 = $sub . "_rmrep_R2.index";
    open ($INDEX_FILE2, "<$indexfile2") or die "Cannot open $indexfile2 for reading ($!)";
    #read the index2 file
    my %index2;
    my $id2;
    while (my $line = readline ($INDEX_FILE2)) {
    	chomp $line;
    	my ($id2, $position2) = split /\t/, $line;# the id in index file is longer than in embl file
    	$index2{$id2} = $position2;
    }
    
    close ($INDEX_FILE1) or die "Can't close the index file!!!";
    close ($INDEX_FILE2) or die "Can't close the index file!!!";
    
	my $newfile = $sub . ".fas";
	`makeblastdb -dbtype nucl -in "$newfile" -out "$sub" -max_file_sz 2GB`; #make a blast database for the splited fasta file of sub

    # push name of splited files into array
    my @split_fas;
    for (my $i = 0; $i < $max; $i++){
    my $split_fas = $query . "|" . $i;
    push @split_fas, $split_fas;
    }   
            
        # parallelised blast
		DATA_LOOP:
		foreach my $query (@split_fas) {
		$pm->start and next DATA_LOOP;  
		
		my $query_file = $query . ".fas";
		my $blastout = $query . "." . $sub . ".blast.txt";
		print "Blasting, $query against $sub...\n";
		`blastn -query "$query_file" -task blastn -db "$sub" -out "$blastout" -word_size 7 -gapopen 5 -gapextend 2 -penalty -1 -reward 1 -evalue $E -outfmt 6 -max_target_seqs 1000000000`; # blast splited fasta file of sub against query      
		print "$query against $sub is done\n";
		
	    $pm->finish;
		}
	    $pm->wait_all_children();
	    
	    my $merged_blast_out = $query . "." .  $sub . ".blast.txt";
	    
	    `cat $query"|"*.$sub.blast.txt > $merged_blast_out `; # merge the blast results of all splited file
	    
	    my $blastout = $merged_blast_out; 
	    
	    #now we need parse the blast results and extract original reads and bin them by query gene name for each species
		my ($SEQ_FILE1, $SEQ_FILE2);
		my $seqfile1 = $sub . "_rmrep_R1.fq";
        my $seqfile2 = $sub . "_rmrep_R2.fq";
		open ($SEQ_FILE1, "<$seqfile1") or die "Cannot open $seqfile1 for reading ($!)";
		open ($SEQ_FILE2, "<$seqfile2") or die "Cannot open $seqfile2 for reading ($!)";

		my ($BLASTOUT, %saveid, $OUTFILE);
		my $geneidlag = "huanghuanghuhu";
	    
	    #parse blast output files 
		open ($BLASTOUT, "<$blastout") or die "Can't open the $blastout file!!!"; #open blastout file for each subject
		while (my $line = readline ($BLASTOUT)){

		my ($geneid, $hitidfr, $start, $end) = $line =~ /(\S+)\s+(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S+\s+\S+/;
		my ($hitid, $fr) = $hitidfr =~ /(\S+)\.(\w)/;
	
		if (($geneid ne $geneidlag) && ($geneidlag ne "huanghuanghuhu")){ # if all the blast result of $geneidlag are read
		close ($OUTFILE); 
		}
	
		if ($geneid ne $geneidlag){ # if current $geneid differs from $geneidlag, open a new file for current $geneid
		my $outfile = $dir . "/" . "$geneid" . "." . "fq";
		open ($OUTFILE, ">$outfile") or die "Can't open the $outfile!!!";  
		}
	  
	       # if reads id doesn't exist in hash, then retrieve the reads and paired reads, else skip
		   if (!($saveid{$hitid})){
	   
		   my $hitidf = $hitid . ".f";
		   seek $SEQ_FILE1, $index1{$hitidf}, 0;  # let’s jump to our seq
		   my $firstf = readline($SEQ_FILE1);  # first line is header, skip
		   my $secondf = readline($SEQ_FILE1);	# second line is the whole sequence
		   chomp $secondf;    
		   my $thirdf = readline($SEQ_FILE1);	# third line is "+"
		   my $fourthf = readline($SEQ_FILE1);	# fourth line is the quality score                
		   chomp $fourthf;
				
		   my $hitidr = $hitid . ".r";
		   seek $SEQ_FILE2, $index2{$hitidr}, 0;  # let’s jump to our seq
		   my $firstr = readline($SEQ_FILE2);  # first line is header, skip
		   my $secondr = readline($SEQ_FILE2);	# second line is the whole sequence
		   chomp $secondr; 
		   my $thirdr = readline($SEQ_FILE2);	# third line is "+"
		   my $fourthr = readline($SEQ_FILE2);	# fourth line is the quality score
		   chomp $fourthr;
			
				if ($fr eq "f" ){ # if front seq is forword then the rear seq is reversed, vice versa
					
						if ($start < $end){ 
						$secondr = reverse $secondr;
						$secondr =~ tr/ATCGatcg/TAGCtagc/;
						$fourthr = reverse $fourthr;
						}else{
						$secondf = reverse $secondf;
						$secondf =~ tr/ATCGatcg/TAGCtagc/;
						$fourthf = reverse $fourthf;
						}
				
					}else{
					
						if ($start < $end){
						$secondf = reverse $secondf;
						$secondf =~ tr/ATCGatcg/TAGCtagc/;
						$fourthf = reverse $fourthf;
						}else{
						$secondr = reverse $secondr;
						$secondr =~ tr/ATCGatcg/TAGCtagc/;
						$fourthr = reverse $fourthr;
						}
				
					}
				
			 my $seqf = "$firstf" . "$secondf\n" . "$thirdf" . "$fourthf\n";
			 print $OUTFILE "$seqf";
				
			 my $seqr = "$firstr" . "$secondr\n" . "$thirdr" . "$fourthr\n";
			 print $OUTFILE "$seqr";
				
		   $saveid{$hitid} = "huanghuanghuhu"; # save reads id into hash, for skipping these reads if we meet them later
	   
		   }
	   
		$geneidlag = $geneid; # save current $geneid as $geneidlag
	
		}
		close ($OUTFILE);
		close ($BLASTOUT);
	
# 		my $number = scalar keys %saveid;
	
		close ($SEQ_FILE1) or die "Can't close the new file!!!";
		close ($SEQ_FILE2) or die "Can't close the new file!!!";
        
        `rm "$sub"_rmrep_R*.index`; #remove index
        `rm "$sub".fas`; # remove database
        `rm "$sub".nhr`;
        `rm "$sub".nin`;
        `rm "$sub".nsq`;
        `rm "$query""|"*."$sub".blast.txt` ; # remove splited query and blast output

}

`rm "$query""|"*.fas`;
