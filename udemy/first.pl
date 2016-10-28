#!/usr/bin/env perl
use strict;
use warnings;

use LWP::Simple;
use HTML::Parser;
use HTTP::Status qw(:constants :is status_message);

sub file_check {
    scalar @_ == 1 or die "Argument expected!";
    my $file = shift;
    if (-f $file) {
        print "File found\n";
    } else {
        print "File not found\n";
    }
}

sub files_check {
    my @files = @_;

    for(@files) {
        file_check($_);
    };

    foreach my $file (@files) {
        file_check($file);
    }
}

sub change_file {
    my ($file, $query, $substitute) = @_;
    open my $fh, '<', $file or die "Input file $file not found.\n";

    foreach my $line (<$fh>) {
        $line =~ s/$query/$substitute/ig;   #replaces query with substitute word
        print $line;
    }
}

sub main {
    print "Downloading ...\n";
    my $text = 'http://www.archive.org/sitemap/sitemap_00000.xml.gz';
    my $filename = 'sitemap_00000.xml.gz';
    my $hstatus = 0;

    $hstatus = LWP::Simple->getstore ( $text, $filename );

    if ($hstatus != HTTP_OK) {
        print "$hstatus: ", status_message($hstatus), "\n";
    }
    print "Finished.\n";
}

#main();
#files_check('/Users/ajamwal/Workspace/mojdu/udemy/first.pl',
#    '/Users/ajamwal/Workspace/mojdu/udemy/none.pl',
#    '/Users/ajamwal/Workspace/mojdu/udemy/learn.pl');

change_file('/Users/ajamwal/Workspace/mojdu/udemy/learn.pl', 'you', 'YOU' );