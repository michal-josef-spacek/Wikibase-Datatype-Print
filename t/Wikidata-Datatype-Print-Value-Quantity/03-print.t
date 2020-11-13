use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 4;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Quantity;
use Wikidata::Datatype::Print::Value::Quantity;

# Test.
my $obj = Wikidata::Datatype::Value::Quantity->new(
	'value' => 10,
);
my $ret = Wikidata::Datatype::Print::Value::Quantity::print($obj);
is($ret, 10, 'Get printed value.');

# Test.
eval {
	Wikidata::Datatype::Print::Value::Quantity::print('bad');
};
is($EVAL_ERROR, "Object isn't 'Wikidata::Datatype::Value::Quantity'.\n",
	"Object isn't 'Wikidata::Datatype::Value::Quantity'.");
clean();

# Test.
$obj = Wikidata::Datatype::Value::Quantity->new(
	'unit' => 'Q190900',
	'value' => 10,
);
$ret = Wikidata::Datatype::Print::Value::Quantity::print($obj);
is($ret, '10 (Q190900)', 'Get printed value.');
