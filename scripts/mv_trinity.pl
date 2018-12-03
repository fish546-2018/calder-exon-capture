#!/usr/bin/perl -w

###################################################
#
#   mv_.Trinity.pl
#   
#   This script is used to move fasta file after .Trinity
#   
#   Input: .Trinity output file
#
#   Output: all fasta file in corresponding folder
#
#   Written by 
#                 Hao Yuan
#                 Shanghai Ocean University, China.
#                 Created on July 2015
#                 Last modified at
#
####################################################

use strict;
use warnings;

use Getopt::Long;   # include the module for input

my ($speciesname, $outdir);

my $opt = GetOptions( 'species:s', \$speciesname,
                      'outdir:s' , \$outdir     ); #set command line options

my @species = split (/\s/, $speciesname); #split the names of folder(species)

my @sortedspecies = sort @species;

`mkdir ./$outdir`;

foreach my $species (@sortedspecies) {

my $folder_geneious = "$species" . "_geneious";
`mkdir ./$outdir/$folder_geneious/`;

my $folder_path = "./" . $species. "_results";   
`mv $folder_path/*0.Trinity.fasta ./$outdir/$folder_geneious`;
`mv $folder_path/*1.Trinity.fasta ./$outdir/$folder_geneious`;
`mv $folder_path/*2.Trinity.fasta ./$outdir/$folder_geneious`;
`mv $folder_path/*3.Trinity.fasta ./$outdir/$folder_geneious`;
`mv $folder_path/*4.Trinity.fasta ./$outdir/$folder_geneious`;
`mv $folder_path/*5.Trinity.fasta ./$outdir/$folder_geneious`;
`mv $folder_path/*6.Trinity.fasta ./$outdir/$folder_geneious`;
`mv $folder_path/*7.Trinity.fasta ./$outdir/$folder_geneious`;
`mv $folder_path/*8.Trinity.fasta ./$outdir/$folder_geneious`;
`mv $folder_path/*9.Trinity.fasta ./$outdir/$folder_geneious`;
}