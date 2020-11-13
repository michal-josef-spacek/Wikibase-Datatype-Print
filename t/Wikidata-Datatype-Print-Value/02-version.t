use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Print::Value;

# Test.
is($Wikidata::Datatype::Print::Value::VERSION, 0.01, 'Version.');
