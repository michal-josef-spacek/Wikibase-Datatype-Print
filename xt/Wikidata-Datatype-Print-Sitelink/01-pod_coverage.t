use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Wikidata::Datatype::Print::Sitelink', 'Wikidata::Datatype::Print::Sitelink is covered.');
