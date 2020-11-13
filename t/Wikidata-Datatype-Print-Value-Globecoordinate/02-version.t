use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Print::Value::Globecoordinate;

# Test.
is($Wikidata::Datatype::Print::Value::Globecoordinate::VERSION, 0.01, 'Version.');
