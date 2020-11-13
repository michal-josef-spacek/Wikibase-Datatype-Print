use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Item;
use Wikidata::Datatype::Print::Value::Item;

# Test.
my $obj = Wikidata::Datatype::Value::Item->new(
	'value' => 'Q497',
);
my $ret = Wikidata::Datatype::Print::Value::Item::print($obj);
is($ret, 'Q497', 'Get printed value.');

# Test.
eval {
	Wikidata::Datatype::Print::Value::Item::print('bad');
};
is($EVAL_ERROR, "Object isn't 'Wikidata::Datatype::Value::Item'.\n",
	"Object isn't 'Wikidata::Datatype::Value::Item'.");
clean();
