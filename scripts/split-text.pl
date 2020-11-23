#!/bin/env perl

use strict;
use vars qw($opt_l);
use Getopt::Std;
getopts('l:');

my $max  = $opt_l || 100;
my $file = shift(@ARGV);

if ($file=~/\.gz$/){
    open S,"gzip -cd <$file |" || die "cannot open $file";
}
else{ open S,"<$file" || die "cannot open $file"; }

my $srcdoc = '<BEG> ';
my $srccount = 0;

while (<>){
    chomp;
    my @srctok = split(/\s+/);
    if ($srccount+@srctok > $max){
	$srcdoc .= '<BRK>';
	print $srcdoc,"\n";
	$srcdoc = '<CNT> ';
	$srccount = 0;
    }
    if ( @srctok == 0 ){
	$srcdoc .= '<END>';
	print $srcdoc,"\n";
	$srcdoc = '<BEG> ';
	$srccount = 0;
	next;
    }
    $srcdoc .= join(' ',@srctok);
    $srcdoc .= ' <SEP> ';
    $srccount += @srctok;
}

print $srcdoc,"\n" if ($srcdoc);

