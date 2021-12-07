use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);
use Wikibase::Datatype::Print::Item;
use Wikibase::Datatype::Item;
use Wikibase::Datatype::Snak;
use Wikibase::Datatype::Statement;
use Wikibase::Datatype::Value::Item;
use Wikibase::Datatype::Value::Monolingual;
use Wikibase::Datatype::Value::String;

# Test.
my $obj = Wikibase::Datatype::Item->new(
	'aliases' => [
		Wikibase::Datatype::Value::Monolingual->new(
			'language' => 'en',
			'value' => 'domestic dog',
		),
		Wikibase::Datatype::Value::Monolingual->new(
			'language' => 'en',
			'value' => 'Canis lupus familiaris',
		),
		Wikibase::Datatype::Value::Monolingual->new(
			'language' => 'en',
			'value' => 'Canis familiaris',
		),
		Wikibase::Datatype::Value::Monolingual->new(
			'language' => 'en',
			'value' => 'dogs',
		),
		Wikibase::Datatype::Value::Monolingual->new(
			'language' => 'en',
			'value' => decode_utf8('🐶'),
		),
		Wikibase::Datatype::Value::Monolingual->new(
			'language' => 'en',
			'value' => decode_utf8('🐕'),
		),
	],
	'descriptions' => [
		Wikibase::Datatype::Value::Monolingual->new(
			'language' => 'en',
			'value' => 'domestic animal',
		),
	],
	'labels' => [
		Wikibase::Datatype::Value::Monolingual->new(
			'language' => 'en',
			'value' => 'dog',
		),
	],
	'id' => 'Q144',
	'lastrevid' => 1539465460,
	'modified' => '2021-12-06T14:48:31Z',
	'ns' => 0,
	'page_id' => 280,
	'sitelinks' => [
		Wikibase::Datatype::Sitelink->new(
			'site' => 'enwiki',
			'title' => 'Dog',
		),
	],
	'statements' => [
		Wikibase::Datatype::Statement->new(
			'snak' => Wikibase::Datatype::Snak->new(
				'datatype' => 'wikibase-item',
				'datavalue' => Wikibase::Datatype::Value::Item->new(
					'value' => 'Q55983715',
				),
				'property' => 'P31',
			),
			'property_snaks' => [
				Wikibase::Datatype::Snak->new(
					'datatype' => 'wikibase-item',
					'datavalue' => Wikibase::Datatype::Value::Item->new(
						'value' => 'Q20717272',
					),
					'property' => 'P642',
				),
				Wikibase::Datatype::Snak->new(
					'datatype' => 'wikibase-item',
					'datavalue' => Wikibase::Datatype::Value::Item->new(
						'value' => 'Q26972265',
					),
					'property' => 'P642',
				),
			],
		),
	],
	'title' => 'Q144',
);
my $ret = Wikibase::Datatype::Print::Item::print($obj);
my $right_ret = decode_utf8(<<'END');
Label: dog (en)
Description: domestic animal (en)
Aliases:
  domestic dog (en)
  Canis lupus familiaris (en)
  Canis familiaris (en)
  dogs (en)
  🐶 (en)
  🐕 (en)
Sitelinks:
  Dog (enwiki)
Statements:
  P31: Q55983715 (normal)
   P642: Q20717272
   P642: Q26972265
END
chomp $right_ret;
is($ret, $right_ret, 'Get printed value.');
