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

my $speciesname; #list of species name

my $opt = GetOptions( 'species:s', \$speciesname,); #set command line options

my @species = split (/\s/, $speciesname); #split the names of folder(species)

my @sortedspecies = sort @species;

foreach my $species (@sortedspecies) {
   my $folder = $species . "_results";
   my @genelist;
   
   opendir (DIR, $folder) or die $!; #open folder containing all gene data file
   
   while (my $file = readdir (DIR)) { #read all gene file under species folder
       next if ($file =~ /^\./); #skip files beginning with 
       (my $gene) = $file =~ /(\S+)\.fq/;
       push (@genelist, $gene);
   }   
   closedir (DIR);
       #print "@genelist\n";
   
   
   foreach my $gene (@genelist) { #read all gene file under species folder
   
       my $file = $gene . ".fq";
       `./Trinity --seqType fq --JM 10G --single ./$folder/$file --run_as_paired --CPU 10 --no_bowtie --output ./$folder/$gene --min_contig_length 100 --full_cleanup `;
   }
   print "$species is done\n";
}
