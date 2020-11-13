use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Print::Value::Time;

# Test.
is($Wikidata::Datatype::Print::Value::Time::VERSION, 0.01, 'Version.');
