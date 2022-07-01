use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Test::Shared::Fixture::Wikibase::Datatype::Form::Wikidata::DogCzechSingular;
use Unicode::UTF8 qw(decode_utf8);
use Wikibase::Datatype::Print::Utils qw(print_common);
use Wikibase::Datatype::Print::Statement;

# Test.
my $obj = Test::Shared::Fixture::Wikibase::Datatype::Form::Wikidata::DogCzechSingular->new;
my @ret = print_common($obj, {},
	'statements',
	\&Wikibase::Datatype::Print::Statement::print,
	'Statements');
is_deeply(
	\@ret,
	[
		'Statements:',
		decode_utf8('  P898: pɛs (normal)'),
	],
	'Print commons test (statements).',
);
