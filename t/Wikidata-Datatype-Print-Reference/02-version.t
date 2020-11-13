use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Print::Reference;

# Test.
is($Wikidata::Datatype::Print::Reference::VERSION, 0.01, 'Version.');
