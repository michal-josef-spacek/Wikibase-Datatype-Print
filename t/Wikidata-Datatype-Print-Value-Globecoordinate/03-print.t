use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikidata::Datatype::Value::Globecoordinate;
use Wikidata::Datatype::Print::Value::Globecoordinate;

# Test.
my $obj = Wikidata::Datatype::Value::Globecoordinate->new(
	'value' => [49.6398383, 18.1484031],
);
my $ret = Wikidata::Datatype::Print::Value::Globecoordinate::print($obj);
is($ret, 'TODO', 'Get printed value.');

# Test.
eval {
	Wikidata::Datatype::Print::Value::Globecoordinate::print('bad');
};
is($EVAL_ERROR, "Object isn't 'Wikidata::Datatype::Value::Globecoordinate'.\n",
	"Object isn't 'Wikidata::Datatype::Value::Globecoordinate'.");
clean();
