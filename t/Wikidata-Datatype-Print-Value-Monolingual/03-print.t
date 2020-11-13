use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);
use Wikidata::Datatype::Value::Monolingual;
use Wikidata::Datatype::Print::Value::Monolingual;

# Test.
my $obj = Wikidata::Datatype::Value::Monolingual->new(
	'language' => 'cs',
	'value' => decode_utf8('Příklad.'),
);
my $ret = Wikidata::Datatype::Print::Value::Monolingual::print($obj);
is($ret, decode_utf8('Příklad. (cs)'), 'Get printed value.');

# Test.
eval {
	Wikidata::Datatype::Print::Value::Monolingual::print('bad');
};
is($EVAL_ERROR, "Object isn't 'Wikidata::Datatype::Value::Monolingual'.\n",
	"Object isn't 'Wikidata::Datatype::Value::Monolingual'.");
clean();
