#!/usr/bin/env perl

use strict;
use warnings;

# ==========================================
# variables and blocks
# ==========================================
use constant ABNORMAL_STATE => 2;
use constant LOG_FILE => "/proj/tgf_ro/executions/egugwen/csi.pc/scripts/working/learnpl.log";
#constant $ABNORMAL_STATE = 2;
#constant $ERROR_MSG = "Error occurred:";

my $year = 2021;
my @weeks = 3,5,7;
my @weeks = (3,5,7,9,11);
#my @weeks = <3,5,7>;
my $weeks_total = $#weeks + 1;

#say "This year is $year";
print ("This year is ", $year, "\n");
say("This year is $year"); # defined below
print (@weeks, "\n");
print (@weeks[0], "\n");
print (@weeks[1], "\n");
print ($weeks[1], "\n");
print ($#weeks, "\n");
print ("We have ", $#weeks + 1, " weeks\n");
print ($weeks_total, "\n");

say("Here are weeks:");
foreach (@weeks) {
    say($_);
}

say("Here are also weeks:");
foreach my $week (@weeks) {
    say($week);
    say("OK, this is 5th week") if $week == 5;
    say("NO, this is not 5th week") unless $week == 5;
}

say("Here are weeks again:");
my $week_index = 0;
while ($week_index <= $#weeks){
    say($weeks[$week_index]);
    $week_index++;
}

say("Here are weeks again:");
$week_index = 0;
until ($week_index > $#weeks){
    say("weeks[$week_index/$#weeks] $weeks[$week_index]");
    $week_index++;
}

# ==========================================
# subroutines
# ==========================================
# print given message in console and log file
sub say {
    my $msg = shift;
    print($msg, "\n");
}

# next is continue, and last is break
sub read_log {
    my $log_file = shift;
    my $line_number = 0;
    while (<$log_file>) {
        $line_number++;
        my $head = substr $_,0,4;
        next if $head eq "Here";
        print($line_number.":".$_);
        last if $line_number > 10;
    }
}

sub log_info{
    my $msg = shift;
    print($msg, "\n");

    open my $log_file, ">>", LOG_FILE;
    print $log_file "$msg\n";
}

sub try{
    print(@_);
}

try("yes ", "no\n");

sub cal{
    say(@_[0] + @_[1]);
}

cal(1, 2);
cal(1000000000000000000, 20000000000000000000000000000000000);


sub getopts {
    say("To get options of this script");
    say(%ENV)
}

getopts();

# ==========================================
# hashes
# ==========================================
my %pupils = ("name", "Bruce", "age", "41");
foreach my $key (keys %pupils) {
    say("$key = $pupils{$key}");
}
my %teachers = (
    name => "Alice",
    age => 36
);
foreach my $key (keys %teachers) {
    say("$key = $teachers{$key}");
}

# print all environment variables
foreach my $key (keys %ENV) {
    log_info("$key = $ENV{$key}");
}

# read from log file
say ("To read logs:");
open my $log_file, "<", LOG_FILE;
read_log $log_file
