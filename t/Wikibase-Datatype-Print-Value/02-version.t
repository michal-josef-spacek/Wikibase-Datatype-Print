use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikibase::Datatype::Print::Value;

# Test.
is($Wikibase::Datatype::Print::Value::VERSION, 0.19, 'Version.');
