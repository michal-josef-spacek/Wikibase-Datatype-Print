use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 4;
use Test::NoWarnings;
use Wikidata::Datatype::Snak;
use Wikidata::Datatype::Statement;
use Wikidata::Datatype::Reference;
use Wikidata::Datatype::Value::String;
use Wikidata::Datatype::Print::Statement;

# Test.
my $obj = Wikidata::Datatype::Statement->new(
	'entity' => 'Q42',
	'snak' => Wikidata::Datatype::Snak->new(
		'datatype' => 'string',
		'datavalue' => Wikidata::Datatype::Value::String->new(
			'value' => '1.1',
		),
		'property' => 'P11',
	),
	'rank' => 'normal',
);
my @ret = Wikidata::Datatype::Print::Statement::print($obj);
is_deeply(
	\@ret,
	[
		'P11: 1.1 (normal)',
	],
	'Get printed value.',
);

# Test.
eval {
	Wikidata::Datatype::Print::Statement::print('bad');
};
is($EVAL_ERROR, "Object isn't 'Wikidata::Datatype::Statement'.\n",
	"Object isn't 'Wikidata::Datatype::Statement'.");
clean();

# Test.
$obj = Wikidata::Datatype::Statement->new(
	'entity' => 'Q42',
	'property_snaks' => [
		Wikidata::Datatype::Snak->new(
			'datatype' => 'wikibase-item',
			'datavalue' => Wikidata::Datatype::Value::Item->new(
				'value' => 'Q474741',
			),
			'property' => 'P642',
		),
	],
	'snak' => Wikidata::Datatype::Snak->new(
		'datatype' => 'string',
		'datavalue' => Wikidata::Datatype::Value::String->new(
			'value' => '1.1',
		),
		'property' => 'P11',
	),
	'rank' => 'normal',
	'references' => [
		 Wikidata::Datatype::Reference->new(
			 'snaks' => [
				 # stated in (P248) Virtual International Authority File (Q53919)
				 Wikidata::Datatype::Snak->new(
					  'datatype' => 'wikibase-item',
					  'datavalue' => Wikidata::Datatype::Value::Item->new(
						  'value' => 'Q53919',
					  ),
					  'property' => 'P248',
				 ),

				 # VIAF ID (P214) 113230702
				 Wikidata::Datatype::Snak->new(
					  'datatype' => 'external-id',
					  'datavalue' => Wikidata::Datatype::Value::String->new(
						  'value' => '113230702',
					  ),
					  'property' => 'P214',
				 ),

				 # retrieved (P813) 7 December 2013
				 Wikidata::Datatype::Snak->new(
					  'datatype' => 'time',
					  'datavalue' => Wikidata::Datatype::Value::Time->new(
						  'value' => '+2013-12-07T00:00:00Z',
					  ),
					  'property' => 'P813',
				 ),
			 ],
		 ),
	],
);
@ret = Wikidata::Datatype::Print::Statement::print($obj);
is_deeply(
	\@ret,
	[
		'P11: 1.1 (normal)',
		'- P642: Q474741',
		'- ref[0]: P248: Q53919',
		'- ref[0]: P214: 113230702',
		'- ref[0]: P813: 07 december 2013 (Gregorian)',
	],
	'Get printed value.',
);
