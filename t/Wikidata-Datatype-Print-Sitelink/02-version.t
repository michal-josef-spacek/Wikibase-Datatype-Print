use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikidata::Datatype::Print::Sitelink;

# Test.
is($Wikidata::Datatype::Print::Sitelink::VERSION, 0.01, 'Version.');
