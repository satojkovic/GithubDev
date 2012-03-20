#!/usr/bin/perl

use strict;
use warnings;

use WebService::Simple;

my $service = WebService::Simple->new(
    base_url => 'https://api.github.com/',
    response_parser => 'JSON'
);

my $single_user = $service->get( "users/satojkovic" );
my $res_single_user = $single_user->parse_response;
print "\n*** Single User ***\n";
foreach my $key (sort keys %{ $res_single_user } ) {
    my $val = defined($res_single_user->{$key}) ? $res_single_user->{$key} : "";
    print "$key : $val\n";
}

my $follower = $service->get( "users/satojkovic/followers" );
my $res_follower = $follower->parse_response;
print "\n*** List followers ***\n";
foreach my $list (@{ $res_follower }) {
    foreach my $key (keys %{ $list }) {
        print "$key : $list->{$key}\n";
    }
}

my $following = $service->get( "users/satojkovic/following" );
my $res_following = $following->parse_response;
print "\n*** List following ***\n";
foreach my $list (@{ $res_following }) {
    foreach my $key (keys %{ $list }) {
        print "$key : $list->{$key}\n";
    }
}




