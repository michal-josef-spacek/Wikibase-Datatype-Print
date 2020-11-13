use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Print::Statement;

# Test.
is($Wikidata::Datatype::Print::Statement::VERSION, 0.01, 'Version.');
