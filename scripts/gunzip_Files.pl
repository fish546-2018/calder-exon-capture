#!/usr/bin/perl -w
use warnings;
use Getopt::Long;

my $dirname;

my $opt = GetOptions( 'dir:s', \$dirname );

opendir(my $DIR1, $dirname) or die "Error in opening dir $dirname!!!\n";


while ($foldname=readdir($DIR1)){
     next if ($foldname =~ /^\./); #skip files beginning with .
    opendir(my $DIR2, "$dirname/$foldname") or die "Error in opening dir $foldname!!!\n";
    while  ($filename=readdir($DIR2)){
         next if ($filename !~ /gz$/gi); #skip files beginning with .
         my ($unzip_filename) = $filename =~ /(\S+)\.gz/;
        `gunzip -c $dirname/$foldname/$filename > $dirname/$unzip_filename`;

    }
    closedir($DIR2);
}
closedir($DIR1);




