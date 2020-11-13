use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;

BEGIN {

	# Test.
	use_ok('Wikidata::Datatype::Print::Value::Quantity');
}

# Test.
require_ok('Wikidata::Datatype::Print::Value::Quantity');
