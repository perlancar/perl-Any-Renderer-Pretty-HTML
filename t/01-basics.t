#!perl

use 5.010;
use strict;
use warnings;

use Any::Renderer;
use Test::More 0.96;

require_ok('Any::Renderer::Pretty::HTML');

my $r = Any::Renderer->new(
    'Pretty::HTML',
    {table_column_orders=>[[qw/b a c/]]});

my $d = [{a=>1, b=>2, c=>3}];
my $s = $r->render($d);

like($s, qr!<table>!sxi, "output");

done_testing();
