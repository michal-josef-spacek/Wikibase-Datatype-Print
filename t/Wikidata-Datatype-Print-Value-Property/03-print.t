use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Property;
use Wikidata::Datatype::Print::Value::Property;

# Test.
my $obj = Wikidata::Datatype::Value::Property->new(
	'value' => 'P123',
);
my $ret = Wikidata::Datatype::Print::Value::Property::print($obj);
is($ret, 'P123', 'Get printed value.');

# Test.
eval {
	Wikidata::Datatype::Print::Value::Property::print('bad');
};
is($EVAL_ERROR, "Object isn't 'Wikidata::Datatype::Value::Property'.\n",
	"Object isn't 'Wikidata::Datatype::Value::Property'.");
clean();
