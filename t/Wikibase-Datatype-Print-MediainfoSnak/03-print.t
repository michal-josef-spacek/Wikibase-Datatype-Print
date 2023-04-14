use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 5;
use Test::NoWarnings;
use Test::Shared::Fixture::Wikibase::Datatype::MediainfoSnak::Commons::Depicts::Human;
use Wikibase::Datatype::MediainfoSnak;
use Wikibase::Datatype::Print::MediainfoSnak;

# Test.
my $obj = Test::Shared::Fixture::Wikibase::Datatype::MediainfoSnak::Commons::Depicts::Human->new;
my $ret = Wikibase::Datatype::Print::MediainfoSnak::print($obj);
is($ret, 'P180: Q42', 'Get snak value (depicts: human fixture).');

# Test.
eval {
	Wikibase::Datatype::Print::MediainfoSnak::print('bad');
};
is($EVAL_ERROR, "Object isn't 'Wikibase::Datatype::MediainfoSnak'.\n",
	"Object isn't 'Wikibase::Datatype::MediainfoSnak'.");
clean();

# Test.
$obj = Wikibase::Datatype::MediainfoSnak->new(
	'datatype' => 'string',
	'property' => 'P11',
	'snaktype' => 'novalue',
);
$ret = Wikibase::Datatype::Print::MediainfoSnak::print($obj);
is($ret, 'P11: no value', 'Get snak no value.');

# Test.
$obj = Wikibase::Datatype::MediainfoSnak->new(
	'datatype' => 'string',
	'property' => 'P11',
	'snaktype' => 'somevalue',
);
$ret = Wikibase::Datatype::Print::MediainfoSnak::print($obj);
is($ret, 'P11: unknown value', 'Get snak somevalue.');
