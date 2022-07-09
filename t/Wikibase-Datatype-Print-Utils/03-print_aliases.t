use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Test::Shared::Fixture::Wikibase::Datatype::Item::Wikidata::Dog;
use Unicode::UTF8 qw(decode_utf8);
use Wikibase::Datatype::Print::Utils qw(print_aliases);
use Wikibase::Datatype::Print::Value::Monolingual;

# Test.
my $obj = Test::Shared::Fixture::Wikibase::Datatype::Item::Wikidata::Dog->new;
my @ret = print_aliases($obj, {'lang' => 'cs'},
	\&Wikibase::Datatype::Print::Value::Monolingual::print);
is_deeply(
	\@ret,
	[
		'Aliases:',
		'  pes (cs)',
	],
	'Print aliases test.',
);
