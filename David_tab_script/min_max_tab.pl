#!/usr/bin/env perl
#yeahyeah
use strict;
use warnings;

my $fileNombre = $ARGV[0];

my %hMinmax = ();
my %hSBnuclescore = ();


my $sbnuclescore = "New_Results_NucleScore_50_strains_from_various_bacteria.txt";


my $results = "resultats.txt";


open (NUC, "<", $sbnuclescore) or die " error open file $!:";
		while(<NUC>) {
			chomp($_);
			#$_ =~ s/\r//g;
			#$_ =~ s/\s*//;
				my @infoListNuclescore = split(/\t/, $_);
				my $shifted = shift(@infoListNuclescore);
				my $min = min(@infoListNuclescore);
				my $max = max(@infoListNuclescore);
				$hSBnuclescore{$shifted} = "min: $min\t max: $max";
				#print "$infoListNuclescore[0] => $hSBnuclescore{$infoListNuclescore[0]}\n";
		}
	
close(NUC) or die "close file error : $!";

open (RES, ">", $results) or die "error open file $!:";
	
foreach my $k (keys(%hSBnuclescore)) {
   print RES "Clef=$k Valeur=$hSBnuclescore{$k}\n"; 
}

close(RES) or die "close file error : $!";

#my $beginCasCluster = min(@tabPositions);
#my $endCasCluster = max(@tabPositions);

#-fonctions-------------------------------------
sub max {
    splice(@_, ($_[0] > $_[1]) ? 1 : 0, 1);
    return ($#_ == 0) ? $_[0] : max(@_);
}

sub min {
    splice(@_, ($_[0] > $_[1]) ? 0 : 1, 1);
    return ($#_ == 0) ? $_[0] : min(@_);
}
