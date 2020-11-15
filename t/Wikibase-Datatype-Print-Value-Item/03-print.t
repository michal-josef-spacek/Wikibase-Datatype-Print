use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikibase::Datatype::Value::Item;
use Wikibase::Datatype::Print::Value::Item;

# Test.
my $obj = Wikibase::Datatype::Value::Item->new(
	'value' => 'Q497',
);
my $ret = Wikibase::Datatype::Print::Value::Item::print($obj);
is($ret, 'Q497', 'Get printed value.');

# Test.
eval {
	Wikibase::Datatype::Print::Value::Item::print('bad');
};
is($EVAL_ERROR, "Object isn't 'Wikibase::Datatype::Value::Item'.\n",
	"Object isn't 'Wikibase::Datatype::Value::Item'.");
clean();
