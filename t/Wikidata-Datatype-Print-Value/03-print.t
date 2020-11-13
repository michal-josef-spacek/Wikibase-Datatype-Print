use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 7;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);
use Wikidata::Datatype::Value::Item;
use Wikidata::Datatype::Value::Monolingual;
use Wikidata::Datatype::Value::String;
use Wikidata::Datatype::Value::Time;
use Wikidata::Datatype::Print::Value;

# Test.
my $obj = Wikidata::Datatype::Value::Item->new(
	'value' => 'Q497',
);
my $ret = Wikidata::Datatype::Print::Value::print($obj);
is($ret, 'Q497', 'Get printed value for item.');

# Test.
$obj = Wikidata::Datatype::Value::Monolingual->new(
	'language' => 'cs',
	'value' => decode_utf8('Příklad.'),
);
$ret = Wikidata::Datatype::Print::Value::print($obj);
is($ret, decode_utf8('Příklad. (cs)'), 'Get printed value for monolingual.');

# Test.
$obj = Wikidata::Datatype::Value::String->new(
	'value' => 'Text',
);
$ret = Wikidata::Datatype::Print::Value::print($obj);
is($ret, 'Text', 'Get printed value for string.');

# Test.
$obj = Wikidata::Datatype::Value::Time->new(
	'value' => '+2020-09-01T00:00:00Z',
);
$ret = Wikidata::Datatype::Print::Value::print($obj);
is($ret, '01 September 2020 (Gregorian)', 'Get printed value for time.');

# Test.
$obj = Wikidata::Datatype::Value->new(
	'value' => 'text',
	'type' => 'bad',
);
eval {
	Wikidata::Datatype::Print::Value::print($obj);
};
is($EVAL_ERROR, "Type 'bad' is unsupported.\n",
	"Type 'bad' is unsupported.");
clean();

# Test.
eval {
	Wikidata::Datatype::Print::Value::print('bad');
};
is($EVAL_ERROR, "Object isn't 'Wikidata::Datatype::Value'.\n",
	"Object isn't 'Wikidata::Datatype::Value'.");
clean();
