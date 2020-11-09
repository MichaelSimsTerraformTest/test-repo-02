#!/usr/bin/perl

use strict;
use warnings;

my @dirs = (".");
do {
	my @dirsToProcess = @dirs;
	@dirs = ();
	foreach my $dir (@dirsToProcess) {
		my @lines = `./commands \"cls -l --sort=name $dir; bye\"`;
		for my $line (@lines) {
			print $line;
			if ($line =~ /^d.*\s(\S+)$/) {
				push(@dirsToProcess, $1);
			}
		}
	}
} while (scalar @dirs > 0)