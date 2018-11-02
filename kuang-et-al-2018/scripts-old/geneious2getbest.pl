#!/usr/bin/perl -w
#
############################################################################################
#
# geneious2getbest.pl
#
# This script is used to :
# (1) cat the file with same gene in geneious output first (the folder containing these files 
# should be named by their species ID)
# (2) unwrap the sequence in the file with only one contig
# (3) merge the processed files in (1) and (2) together according to the sample ID
# 
# input: species ID, a folder containing speciesID_geneious1, and another folder containing geneious output
# output: a folder named "merge" including all the assembled contigs for each sample
# usage: ./geneious2getbest.pl -species="sp1 sp2 ..." -geneious=foldername1(contain files in (2))  
# -geneiousout=foldername2(contain files in (1))
#
# by Ting Kuang,Hao Yuan Shanghai Ocean University, Nov. 2015
#
############################################################################################

use strict;
use warnings;

use Getopt::Long;   # include the module for input

my ($speciesname, $dir_geneious, $dir_geneiousout); #list of species name

my $opt = GetOptions( 'species:s', \$speciesname,
                      'geneious1:s', \$dir_geneious,
                      'geneious2:s', \$dir_geneiousout,
                      ); #set command line options

my @species = split (/\s/, $speciesname); #split the names of folder(species)

my @sortedspecies = sort @species;

# cat the file with same gene name
foreach my $species (@sortedspecies) {
   my $folder = "./$dir_geneiousout/$species";
   my $newfolder = "./$dir_geneiousout/" . $species . "_geneious1";
   `mkdir ./$newfolder`;

   opendir (DIR, $folder) or die $!; 
   
   my $nextfile = "a";
   my $nextgene = "b";
   
   while (my $file = readdir (DIR)) { 
       next if ($file =~ /^\./); 
       #print "$gene, $file, $nextfile, $nextgene\n";
             if ((my $gene) = $file =~ /(\S+)\.Trinity*/) {
             if ($gene eq $nextgene) {
                `cat "./$folder/$file" "./$folder/$nextfile" > ./$newfolder/$gene.Trinity.fasta`;
                `rm "./$folder/$file" "./$folder/$nextfile"`;
             }
             $nextgene = $gene;
             $nextfile = $file; 
         }
   }  

 
   closedir (DIR);
   
}

foreach my $species (@sortedspecies) {
   my $folder = "./$dir_geneiousout/$species";
   my $newfolder = "./$dir_geneiousout/" . $species . "_geneious1";
   
   opendir (DIR, $newfolder) or die $!; #open folder containing all gene data file
   
   while (my $file = readdir (DIR)) { 
       next if ($file =~ /^\./); 
       `mv ./$newfolder/$file ./$folder`;   
    }        
   closedir (DIR);
   `rmdir ./$newfolder`;
}


# rename the file as "gene name.Trinity.fasta"

foreach my $species (@sortedspecies) {
   my $path = "./$dir_geneiousout/$species";
   opendir (DIR, $path) or die $!; 
   #print "$species\n";
   
   while (my $file = readdir (DIR)) { 
       next if ($file =~ /^\./); 
          if ((my $gene) = $file =~ /(\S+)\s+./) {
            #print "$gene\n";
              my $newfile = "./$path/" . $gene . ".fasta";
              $file =  "./$path/" . $file;
              #print "$file, $newfile\n";
              rename $file,$newfile;
          }
             
    }
   closedir (DIR);
   
}

# unwrap the sequence in the file with only one contig

`mkdir ./$dir_geneious/unwrap`;
foreach my $species (@sortedspecies) {
my $path = "$dir_geneious/" . $species . "_geneious1";
`mkdir ./$dir_geneious/unwrap/$species`;
opendir (DIR, $path) or die $!; 
   while (my $infile = readdir (DIR)) {
     my (%hash, @order);   
     next if($infile =~ /^\./);
     my $file = $path . "/" . $infile;
     my $FILE;
     open ($FILE , "<$file") or die "can't open $file for reading!!!";
         while (my $line = readline ($FILE)){
         chomp $line;
             if ($line =~ /^>/) {
             $hash{$line} = "";
	         push @order , $line;
	         } else {
	         $hash{$order[-1]} .= $line;
	         }
         }
         close ($FILE);

         my $outfile = "$dir_geneious/unwrap/$species/$infile"; 
         my $OUTFILE;
             open ($OUTFILE , ">$outfile") or die "can't open $outfile for writing!!!";
             foreach (@order){
             print $OUTFILE "$_\n$hash{$_}\n";
             } 
         close ($OUTFILE);
         }
         closedir (DIR);
}

# merge processed files above together according their sample ID 

my $merge =  "merged_" . $dir_geneious . "_" . $dir_geneiousout;

`mkdir ./$merge`;
foreach my $species (@sortedspecies) {
`mkdir ./$merge/$species`;
`mv ./$dir_geneious/unwrap/$species/*1.Trinity.fasta ./$merge/$species/`;
`mv ./$dir_geneious/unwrap/$species/*2.Trinity.fasta ./$merge/$species/`;
`mv ./$dir_geneious/unwrap/$species/*3.Trinity.fasta ./$merge/$species/`;
`mv ./$dir_geneious/unwrap/$species/*4.Trinity.fasta ./$merge/$species/`;
`mv ./$dir_geneious/unwrap/$species/*5.Trinity.fasta ./$merge/$species/`;
`mv ./$dir_geneious/unwrap/$species/*6.Trinity.fasta ./$merge/$species/`;
`mv ./$dir_geneious/unwrap/$species/*7.Trinity.fasta ./$merge/$species/`;
`mv ./$dir_geneious/unwrap/$species/*8.Trinity.fasta ./$merge/$species/`;
`mv ./$dir_geneious/unwrap/$species/*9.Trinity.fasta ./$merge/$species/`;
`mv ./$dir_geneious/unwrap/$species/*0.Trinity.fasta ./$merge/$species/`;
`mv ./$dir_geneiousout/$species/*1.Trinity.fasta ./$merge/$species/`;
`mv ./$dir_geneiousout/$species/*2.Trinity.fasta ./$merge/$species/`;
`mv ./$dir_geneiousout/$species/*3.Trinity.fasta ./$merge/$species/`;
`mv ./$dir_geneiousout/$species/*4.Trinity.fasta ./$merge/$species/`;
`mv ./$dir_geneiousout/$species/*5.Trinity.fasta ./$merge/$species/`;
`mv ./$dir_geneiousout/$species/*6.Trinity.fasta ./$merge/$species/`;
`mv ./$dir_geneiousout/$species/*7.Trinity.fasta ./$merge/$species/`;
`mv ./$dir_geneiousout/$species/*8.Trinity.fasta ./$merge/$species/`;
`mv ./$dir_geneiousout/$species/*9.Trinity.fasta ./$merge/$species/`;
`mv ./$dir_geneiousout/$species/*0.Trinity.fasta ./$merge/$species/`;
`rmdir ./$dir_geneious/unwrap/$species`;
}

`rmdir ./$dir_geneious/unwrap`;

