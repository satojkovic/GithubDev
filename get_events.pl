#!perl

use strict;
use warnings;

use Net::GitHub::V3;
use Config::Pit;

my $conf = pit_get("api.gihtub.com", require => {
    "username" => "username on github",
    "password" => "password on github"
});

my $gh = Net::GitHub::V3->new(
    login => $conf->{username}, pass => $conf->{password},
);

my $event = $gh->event();
my @events = $event->user_public_events($conf->{username});

foreach my $ev (@events) {
    print "----\n";
    foreach my $key (keys $ev) {
        if( ref($ev->{$key}) ne 'HASH' ) {
            print "$key: $ev->{$key}\n";
        }
    }
}



