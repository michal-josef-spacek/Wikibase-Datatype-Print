use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikidata::Datatype::Value::String;
use Wikidata::Datatype::Print::Value::String;

# Test.
my $obj = Wikidata::Datatype::Value::String->new(
	'value' => 'Text',
);
my $ret = Wikidata::Datatype::Print::Value::String::print($obj);
is($ret, 'Text', 'Get printed value.');

# Test.
eval {
	Wikidata::Datatype::Print::Value::String::print('bad');
};
is($EVAL_ERROR, "Object isn't 'Wikidata::Datatype::Value::String'.\n",
	"Object isn't 'Wikidata::Datatype::Value::String'.");
clean();
