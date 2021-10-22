#!/usr/bin/perl

use strict;
use warnings;


my $fileCardio = $ARGV[0];

my %hMerge = ();
my %hCardio = ();
my %hRespi = ();
my %hDrepano = ();
my %hGlobal = ();


my $cardio = "cardio.txt";
my $respi = "respi.txt";
my $drepano = "drepano.txt";
my $global = "global.txt";
my $pm10 = "pm10.txt";

my $results = "resultats.txt";

open (PM, "<", $pm10) or die " error open file $!:";
		while(<PM>) {
			chomp($_);
			$_ =~ s/\r//g;
			$_ =~ s/\s*//;
				my @infoList = split(/\t/, $_);
				$hMerge{$infoList[0]} = $infoList[1];
				print "$infoList[0] => $hMerge{$infoList[0]}\n";
		}
	
close(PM) or die "close file error : $!";

open (CARDIO, "<", $cardio) or die " error open file $!:";
		while(<CARDIO>) {
			chomp($_);
			$_ =~ s/\r//g;
			$_ =~ s/\s*//;
				my @infoListCardio = split(/\t/, $_);
				$hCardio{$infoListCardio[0]} = $infoListCardio[1];
				print "$infoListCardio[0] => $hCardio{$infoListCardio[0]}\n";
			
		}
close(CARDIO) or die "close file error : $!";

open (RESPI, "<", $respi) or die " error open file $!:";
		while(<RESPI>) {
			chomp($_);
			$_ =~ s/\r//g;
			$_ =~ s/\s*//;
				my @infoListRespi = split(/\t/, $_);
				$hRespi{$infoListRespi[0]} = $infoListRespi[1];
				print "$infoListRespi[0] => $hRespi{$infoListRespi[0]}\n";
			
		}
close(RESPI) or die "close file error : $!";

open (DREPANO, "<", $respi) or die " error open file $!:";
		while(<DREPANO>) {
			chomp($_);
			$_ =~ s/\r//g;
			$_ =~ s/\s*//;
				my @infoListDrepano = split(/\t/, $_);
				$hDrepano{$infoListDrepano[0]} = $infoListDrepano[1];
				print "$infoListDrepano[0] => $hDrepano{$infoListDrepano[0]}\n";
			
		}
close(DREPANO) or die "close file error : $!";

open (GLOBAL, "<", $global) or die " error open file $!:";
		while(<GLOBAL>) {
			chomp($_);
			$_ =~ s/\r//g;
			$_ =~ s/\s*//;
				my @infoListGlobal = split(/\t/, $_);
				$hGlobal{$infoListGlobal[0]} = $infoListGlobal[1];
				print "$infoListGlobal[0] => $hGlobal{$infoListGlobal[0]}\n";
			
		}
close(GLOBAL) or die "close file error : $!";


#Affichage resultat final
open(SUM, ">", $results) or die " error open file : $!";
print SUM "Date\tPM10\tRespi\tCardio\tDrepano\tGlobal\n";

foreach my $key (sort keys %hMerge) {
	if($hMerge{$key}){
	}
	else{
	  $hMerge{$key} = "NA";
	}
	if($hRespi{$key}){
	}
	else{
	  $hRespi{$key} = "NA";
	}
	if($hCardio{$key}){
	}
	else{
	  $hCardio{$key} = "NA";
	}
	if($hDrepano{$key}){
	}
	else{
	  $hDrepano{$key} = "NA";
	}
	if($hGlobal{$key}){
	}
	else{
	  $hGlobal{$key} = "NA";
	}
	
print SUM "$key\t$hMerge{$key}\t$hRespi{$key}\t$hCardio{$key}\t$hDrepano{$key}\t$hGlobal{$key}\n";

}
close(SUM) or die "close file error : $!";















