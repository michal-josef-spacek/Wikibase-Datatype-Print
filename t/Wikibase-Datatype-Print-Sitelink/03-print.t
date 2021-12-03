use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikibase::Datatype::Sitelink;
use Wikibase::Datatype::Value::Item;
use Wikibase::Datatype::Print::Sitelink;

# Test.
my $obj = Wikibase::Datatype::Sitelink->new(
	'badges' => [
		Wikibase::Datatype::Value::Item->new(
			'value' => 'Q123',
		),
		Wikibase::Datatype::Value::Item->new(
			'value' => 'Q321',
		),
	],
	'site' => 'enwiki',
	'title' => 'Title',
);
my $ret = Wikibase::Datatype::Print::Sitelink::print($obj);
is($ret, 'Title (enwiki) [Q123 Q321]', 'Print sitelink.');
