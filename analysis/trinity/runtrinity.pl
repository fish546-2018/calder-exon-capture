#!/usr/bin/perl -w
#
############################################################################################
#
# runtrinity.pl
#
# read species folder and do trinity for each file in the folder.
# 
# input species name, output trinity fasta file.
#
# by Ting, Shanghai Ocean University, June. 2014
#
############################################################################################

use strict;
use warnings;
use Getopt::Long;   # include the module for input
use Parallel::ForkManager;

my ($speciesname, $outdir); #list of species name
my $max = 8; #for store the maximum number of processes/forks

my $opt = GetOptions( 'species:s', \$speciesname,
                      'outdir:s', \$outdir,
                      'fork:s', \$max); #set command line options
                      
`mkdir $outdir`;

my @species = split (/\s/, $speciesname); #split the names of folder(species)

my @sortedspecies = sort @species;

foreach my $species (@sortedspecies) {

my $folder = $species . "_results";
my @genelist;
`mkdir "$species"_log`;

	opendir (DIR, $folder) or die "can't open $folder before assemble!!!"; #open folder containing all gene data file

	while (my $file = readdir (DIR)) { #read all gene file under species folder
		next if ($file =~ /^\./); #skip files beginning with 
		(my $gene) = $file =~ /(\S+)\.fq/;
		push (@genelist, $gene);
	}
	   
	closedir (DIR);
	   #print "@genelist\n";
   
	my $pm = Parallel::ForkManager->new($max); 
    
	DATA_LOOP:
	foreach my $gene (@genelist) { #read all gene file under species folder
    $pm->start and next DATA_LOOP;
    
	my $file = $gene . ".fq";
	my $out = $gene . "_trinity";
	my $log = $species . "_log/" .  $gene . ".log.txt";
	{exec("{ time Trinity --seqType fq --max_memory 1G --single ./$folder/$file --no_version_check --run_as_paired --CPU 1 --no_bowtie --output ./$folder/$out --min_contig_length 100 --full_cleanup --bflyCPU 1 --bflyHeapSpaceMax 800M --bflyHeapSpaceInit 500M; } 2>$log") and $pm->finish};
	}

    $pm->wait_all_children();

print "$species is done\n";

my $species_folder = $species . "_geneious";

`mkdir $outdir/$species_folder`;

opendir (DIR, $folder) or die "can't open $folder after assemble!!!"; #open folder containing all gene data file
	
	while (my $file = readdir (DIR)){
    next if ($file !~ /\S+_trinity.Trinity.fasta/);
    my ($gene) = $file =~ /(\S+)_trinity.Trinity.fasta/;
    my $outfile = $gene . ".Trinity.fasta";
    `mv ./$folder/$file ./$outdir/$species_folder/$outfile`;
	}
	
close (DIR);
	
}
