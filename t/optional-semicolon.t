#!/usr/bin/perl
use strict;
use warnings;

use Test::More;

use Sub::Auto;

autosub /^take_(.*)/ {
    my ( $what, @args ) = @_;
    return "Took a $what";
  }

  autosub wibble /^do_the_.*$/ {
    my ( $what, @args ) = @_;
    return join "," => $what, @args;
  }

  diag "can tests";

ok( __PACKAGE__->can('take_blah'),  'take_blah' );
ok( __PACKAGE__->can('do_the_'),    'do_the_' );
ok( __PACKAGE__->can('do_the_job'), 'do_the_job' );
ok( __PACKAGE__->can('wibble'),     "Can wibble" ), 'wibble';

is( take_foo(),                'Took a foo',             'capture x1' );
is( do_the_fandango('grimly'), 'do_the_fandango,grimly', 'All match' );

# check that 'wibble' above was installed properly
is( wibble( 'wobble', 'GRAH' ), 'wobble,GRAH', 'sub installation ok normally' );

done_testing;
