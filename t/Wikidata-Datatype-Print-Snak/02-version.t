use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Print::Snak;

# Test.
is($Wikidata::Datatype::Print::Snak::VERSION, 0.01, 'Version.');
