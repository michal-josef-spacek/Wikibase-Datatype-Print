use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Wikibase::Datatype::Print::Value::Sense', 'Wikibase::Datatype::Print::Value::Sense is covered.');
