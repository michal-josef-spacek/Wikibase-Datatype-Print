use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 6;
use Test::NoWarnings;
use Wikibase::Datatype::Value::Quantity;
use Wikibase::Datatype::Print::Value::Quantity;

# Test.
my $obj = Wikibase::Datatype::Value::Quantity->new(
	'value' => 10,
);
my $ret = Wikibase::Datatype::Print::Value::Quantity::print($obj);
is($ret, 10, 'Get printed value.');

# Test.
eval {
	Wikibase::Datatype::Print::Value::Quantity::print('bad');
};
is($EVAL_ERROR, "Object isn't 'Wikibase::Datatype::Value::Quantity'.\n",
	"Object isn't 'Wikibase::Datatype::Value::Quantity'.");
clean();

# Test.
$obj = Wikibase::Datatype::Value::Quantity->new(
	'unit' => 'Q174728',
	'value' => 10,
);
$ret = Wikibase::Datatype::Print::Value::Quantity::print($obj);
is($ret, '10 (centimetre)', 'Get printed value. Default printing.');

# Test.
$obj = Wikibase::Datatype::Value::Quantity->new(
	'unit' => 'Q174728',
	'value' => 10,
);
$ret = Wikibase::Datatype::Print::Value::Quantity::print($obj, {}, {});
is($ret, '10 (Q174728)', 'Get printed value. Only QID.');

# Test.
$obj = Wikibase::Datatype::Value::Quantity->new(
	'unit' => 'Q174728',
	'value' => 10,
);
$ret = Wikibase::Datatype::Print::Value::Quantity::print($obj, {
	'Q174728' => 'foo',
}, {
	'print_name' => 1,
});
is($ret, '10 (foo)', 'Get printed value. With explicit mapping.');
