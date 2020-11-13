use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Wikidata::Datatype::Print::Value::String', 'Wikidata::Datatype::Print::Value::String is covered.');
