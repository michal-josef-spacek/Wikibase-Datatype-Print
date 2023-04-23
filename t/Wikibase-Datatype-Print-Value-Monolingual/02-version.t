use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikibase::Datatype::Print::Value::Monolingual;

# Test.
is($Wikibase::Datatype::Print::Value::Monolingual::VERSION, 0.11, 'Version.');
