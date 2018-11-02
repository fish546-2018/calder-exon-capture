#!/usr/bin/perl -w
#
############################################################################################
#
# idcontig.pl
#
# identify files with one or more contigs and put file with one contig in a folder, two or more contigs in another folder
# 
# input one folder named species, output two folder with one contig or above two contigs.
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
   my $folder = $species."_geneious";
   
   my ($outfolder1, $outfolder2);
   $outfolder1 = $species . "_geneious1";
   $outfolder2 = $species . "_geneious2";
   
   `mkdir ./$outfolder1`;
   `mkdir ./$outfolder2`;
   
   opendir (DIR, $folder) or die $!; #open folder containing all gene data file

   while (my $file = readdir (DIR)) { #read all gene file under species folder
       next if ($file =~ /^\./); #skip files beginning with 
      
       my $INFILE;      
       my $infile = "$folder/$file";
       open ($INFILE, "<$infile") or die "Can't open the fasta file!!!";
       
       #print "$file\n";
       
       my $numofcon = 0;
       
       while (my $line = readline ($INFILE)) {
          chomp $line;
          if ($line =~ /^>\S+/) {
                $numofcon ++ ;
          }
       }
       
       if ($numofcon eq 1) {
           `mv $infile ./$outfolder1/$file`;
       } else {
          `mv $infile ./$outfolder2/$file`;
       }
          
       
       close ($INFILE) or die "Can't close the outfile";
          
    }
    
    closedir (DIR);
  
}