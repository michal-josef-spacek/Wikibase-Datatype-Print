use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 5;
use Test::NoWarnings;
use Wikidata::Datatype::Snak;
use Wikidata::Datatype::Value::String;
use Wikidata::Datatype::Print::Snak;

# Test.
my $obj = Wikidata::Datatype::Snak->new(
	'datatype' => 'string',
	'datavalue' => Wikidata::Datatype::Value::String->new(
		'value' => '1.1',
	),
	'property' => 'P11',
);
my $ret = Wikidata::Datatype::Print::Snak::print($obj);
is($ret, 'P11: 1.1', 'Get snak value.');

# Test.
$obj = Wikidata::Datatype::Snak->new(
	'datatype' => 'string',
	'property' => 'P11',
	'snaktype' => 'novalue',
);
$ret = Wikidata::Datatype::Print::Snak::print($obj);
is($ret, 'P11: no value', 'Get snak no value.');

# Test.
$obj = Wikidata::Datatype::Snak->new(
	'datatype' => 'string',
	'property' => 'P11',
	'snaktype' => 'somevalue',
);
$ret = Wikidata::Datatype::Print::Snak::print($obj);
is($ret, 'P11: unknown value', 'Get snak somevalue.');

# Test.
eval {
	Wikidata::Datatype::Print::Snak::print('bad');
};
is($EVAL_ERROR, "Object isn't 'Wikidata::Datatype::Snak'.\n",
	"Object isn't 'Wikidata::Datatype::Snak'.");
clean();
