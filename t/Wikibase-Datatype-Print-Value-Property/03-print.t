use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikibase::Datatype::Value::Property;
use Wikibase::Datatype::Print::Value::Property;

# Test.
my $obj = Wikibase::Datatype::Value::Property->new(
	'value' => 'P123',
);
my $ret = Wikibase::Datatype::Print::Value::Property::print($obj);
is($ret, 'P123', 'Get printed value.');

# Test.
eval {
	Wikibase::Datatype::Print::Value::Property::print('bad');
};
is($EVAL_ERROR, "Object isn't 'Wikibase::Datatype::Value::Property'.\n",
	"Object isn't 'Wikibase::Datatype::Value::Property'.");
clean();
