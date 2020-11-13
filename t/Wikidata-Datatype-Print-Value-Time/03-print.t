use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Time;
use Wikidata::Datatype::Print::Value::Time;

# Test.
my $obj = Wikidata::Datatype::Value::Time->new(
	'value' => '+2020-09-01T00:00:00Z',
);
my $ret = Wikidata::Datatype::Print::Value::Time::print($obj);
is($ret, '01 September 2020 (Gregorian)', 'Get printed value.');

# Test.
eval {
	Wikidata::Datatype::Print::Value::Time::print('bad');
};
is($EVAL_ERROR, "Object isn't 'Wikidata::Datatype::Value::Time'.\n",
	"Object isn't 'Wikidata::Datatype::Value::Time'.");
clean();
