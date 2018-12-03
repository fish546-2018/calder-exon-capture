#!/usr/bin/perl -w

###################################################################################################
#
# Name: rmrep.pl
#
# This program is used to exclude duplicate sequences in fastq file, make a fasta file, index the
# fasta file and the non-redundant fastq files, and run formatdb for the fasta file for blast.
#
# Data files: the fastq files should be pe reads in paired files, named as nameoftaxon_R1.fq
# and nameoftaxon_R2.fq.
#
# Input: name of taxa.
#
# Output: a new fasta file with duplicate reads removed and read1 and read2 combined in consecutive
# lines ( e.g., C026_1.fas). new fastq files with duplicate reads removed. Both the fasta file and 
# fastq files are indexed. The last step is to format the fasta file for blast search.
#
# Author: Chenhong Li                                                                     
#         Shanghai Ocean University                                               
#         Shanghai, China, 201306                                                               
#                                                                                         
# Created by:  Oct 4, 2013                                                              
#                                                                                         
# Last modified by: Aug 2016 by Hao Yuan
# New Traits: 1) make database of sub later in bandp.pl
# 			  2) split fasta file of sub into $max file (prepare for parallelised blast in bandp.pl) 
#             3) New way of I/O         
#             4) print reads number before and after rmrep in STDOUT                                                      
#
###################################################################################################

use strict;
use warnings;
use Getopt::Long;   # include the module for input
use data;
use Parallel::ForkManager;

my $taxalist; #the input taxon list
my $max = 2; #maximum number of forks
my $opt = GetOptions( 'taxalist:s', \$taxalist,
                      'fork:s', \$max); #set command line options
my $help;

if (!($opt && $taxalist) || $help) {#check for the required inputs
   print STDERR "\nExample usage:\n";
   print STDERR "\n$0 -taxalist=\"Danio_rerio Tetraodon_nigroviridis\" -fork=10 -split=48 \n\n";
   print STDERR "Options:\n";
   print STDERR "    -taxalist = a list of subject species, use underscore to link genus and\n";
   print STDERR "                species name; the names should be separated by one space.\n\n";
   exit;
}

my @taxa = split(/\s/, $taxalist);

my %startcode; # relate $taxon with a unique number. it's convenient for calling $pid and $taxon in following subroutine
my $count = 0;
foreach (@taxa) {
$startcode{$_} = $count;
$count ++;
}

my $pm = Parallel::ForkManager->new($max);

$pm->run_on_finish(
sub { my ($pid, $exit_code, $ident) = @_;
  print "** $taxa[$ident] just got out of the pool ".
	"with PID $pid and exit code: $exit_code\n";
}
);

$pm->run_on_start(
sub { my ($pid,$ident)=@_;
  print "** $taxa[$ident] started, pid: $pid\n";
}
);

# $pm->run_on_wait(
# sub {
#   print "** Have to wait for one children ...\n"
# },
# 0.5
# );

DATA_LOOP:
foreach my $taxon (@taxa) {
my $pid = $pm->start($startcode{$taxon}) and next DATA_LOOP;

    my $infile1 = $taxon . "_R1.fq";
    my $infile2 = $taxon . "_R2.fq";
    my $newfile = $taxon . ".fas";
    my $newfile1 = $taxon . "_rmrep_R1.fq";
    my $newfile2 = $taxon . "_rmrep_R2.fq";


    my ($INFILE1, $INFILE2, $NEWFILE, $NEWFILE1, $NEWFILE2);

    open $INFILE1, "<$infile1" or die ("Cannot open $infile1 for reading ($!)");
    open $INFILE2, "<$infile2" or die ("Cannot open $infile2 for reading ($!)");
    open $NEWFILE, ">$newfile" or die ("Cannot open $newfile for writing ($!)");
    open $NEWFILE1, ">$newfile1" or die ("Cannot open $newfile1 for writing ($!)");
    open $NEWFILE2, ">$newfile2" or die ("Cannot open $newfile2 for writing ($!)");

    my ($id1, $id2);
    
    my %uniseq; #hash for storing unique sequence, hash key: 20bp first read + 20bp second read
    my ($key1, $key2, $key, $seq1, $seq2, $quality1, $quality2, $quality);

    while (my $line1 = readline ($INFILE1)) {
    
        chomp $line1;
        if ($line1 =~ /^@\S+\s+\S+/) { # if we find @
            if ($id1) { # if id exists we first need to write old information
                $key = "$key1" . "$key2";
                $quality = "$quality1" . "$quality2";
                if ($uniseq{$key}) {
                    my $qold = $uniseq{$key}->{quality};
                    my $qnew = &data::averq($quality);
                    if ($qold < $qnew) {
                        $uniseq{$key} = { id => $id1,
                                          quality => $qnew,
#                                           seq1 => $seq1,
#                                           seq2 => $seq2
                                        };
                    }
                }
                else {
                    if ($id1 eq $id2) {
                        $quality = &data::averq($quality);
                        $uniseq{$key} = { id => $id1,
                                          quality => $quality,
#                                           seq1 => $seq1,
#                                           seq2 => $seq2
                                        };
                    }
                    else {
                    print "The two read files in $taxon are not consistent\n";
                    $pm->finish($startcode{$taxon});
                    next DATA_LOOP;
                    }
                }
            }
            ($id1) = $line1 =~ /^@(\S+)/; #extract the new id
        	$seq1 = readline ($INFILE1); #extract the sequence line as key for hash
        	chomp $seq1;
        	$key1 = substr($seq1, 0, 20); #get the first 20 nucleotides as key
        	readline ($INFILE1);
        	$quality1 = readline ($INFILE1);
        	chomp $quality1;
        }
        
        #now we read INFILE2    
        my $line2 = readline ($INFILE2);
        chomp $line2;
        if ($line2 =~ /^@\S+\s+\S+/) { # if we find @
            ($id2) = $line2 =~ /^@(\S+)/; #extract the new id
        	$seq2 = readline ($INFILE2); #use the sequence line as key for hash
        	chomp $seq2;
        	$key2 = substr($seq2, 0, 20); #get the first 20 nucleotides as key
        	readline ($INFILE2);
        	$quality2 = readline ($INFILE2);
        	chomp $quality2;
        }
    
    }

    
    my $index1 = $taxon . "_R1.index";
    my $index2 = $taxon . "_R2.index";
    
	&data::indexfastq($infile1, $index1); #index the read1 fastq
	&data::indexfastq($infile2, $index2); #index the read2 fastq

        #open the index file and fastq data file for retrieving late
    my $INDEX_FILE1;
    my $indexfile1 = $taxon . "_R1.index";
    open ($INDEX_FILE1, "<$indexfile1") or die "Cannot open $indexfile1 for reading ($!)";
    #read the index1 file
    my %index1;
    my $index_id1;
    my $count_reads1 = 0;
    while (my $line = readline ($INDEX_FILE1)) {
    	chomp $line;
    	$count_reads1 ++;
    	my ($index_id1, $position1) = split /\t/, $line;# the id in index file is longer than in embl file
    	$index1{$index_id1} = $position1;
    }

    my $INDEX_FILE2;
    my $indexfile2 = $taxon . "_R2.index";
    open ($INDEX_FILE2, "<$indexfile2") or die "Cannot open $indexfile2 for reading ($!)";
    #read the index2 file
    my %index2;
    my $index_id2;
    my $count_reads2 = 0;
    while (my $line = readline ($INDEX_FILE2)) {
    	chomp $line;
    	$count_reads2 ++;
    	my ($index_id2, $position2) = split /\t/, $line;# the id in index file is longer than in embl file
    	$index2{$index_id2} = $position2;
    }
    
    close ($INDEX_FILE1) or die "Can't close the index file!!!";
    close ($INDEX_FILE2) or die "Can't close the index file!!!";


##     now make the fasta file without duplicats
    my @keys = keys (%uniseq);
    my $reads_number = scalar @keys;
    my $rmrep_reads = $reads_number * 2;
    my $ori_total_reads = $count_reads1 + $count_reads2;
    print "$taxon\t$ori_total_reads\t$rmrep_reads\n";
    my @sortedkeys = sort (@keys);
    foreach my $key (@sortedkeys) {
        my $id = $uniseq{$key}->{id};
        
		seek $INFILE1, $index1{$id}, 0;  # let’s jump to our seq
		readline($INFILE1);  # first line is header, skip
		my $seq1 = readline($INFILE1);	# second line is the whole sequence
		chomp $seq1;    
		readline($INFILE1);	# third line is "+"
		my $q1 = readline($INFILE1);	# fourth line is the quality score                
		chomp $q1;

        seek $INFILE2, $index2{$id}, 0;  # let’s jump to our seq
		readline($INFILE2);  # first line is header, skip
		my $seq2 = readline($INFILE2);	# second line is the whole sequence
		chomp $seq2;    
		readline($INFILE2);	# third line is "+"
		my $q2 = readline($INFILE2);	# fourth line is the quality score                
		chomp $q2;
        
        print $NEWFILE ">$id" . ".f\n$seq1\n>$id" . ".r\n$seq2\n";
        print $NEWFILE1 "\@$id.f\n$seq1\n\+\n$q1\n";
        print $NEWFILE2 "\@$id.r\n$seq2\n\+\n$q2\n";
        
    }
    
    close ($INFILE1) or die "Can't close the new file!!!";
    close ($INFILE2) or die "Can't close the new file!!!";
    close ($NEWFILE) or die "Can't close the new file!!!";
    close ($NEWFILE1) or die "Can't close the new file!!!";
    close ($NEWFILE2) or die "Can't close the new file!!!";
        
    `rm $taxon"_"R*.index`;

	my $index_rmrep1 = $taxon . "_rmrep_R1.index";
	
	my $index_rmrep2 = $taxon . "_rmrep_R2.index";	
	
	&data::indexfastq($newfile1, $index_rmrep1); #index the read1 fastq

	&data::indexfastq($newfile2, $index_rmrep2); #index the read2 fastq
    
$pm->finish($startcode{$taxon});
}
$pm->wait_all_children();
