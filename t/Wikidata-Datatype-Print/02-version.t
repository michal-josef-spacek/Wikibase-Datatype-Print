use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Print;

# Test.
is($Wikidata::Datatype::Print::VERSION, 0.01, 'Version.');
