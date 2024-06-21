package Wikibase::Datatype::Print::Texts;

use base qw(Exporter);
use strict;
use warnings;

use Readonly;

Readonly::Array our @EXPORT_OK => qw(text_keys texts);
Readonly::Hash our %TEXTS => (
	'en' => {
		'aliases' => 'Aliases',
		'data_type' => 'Data type',
		'date_of_modification' => 'Date of modification',
		'description' => 'Description',
		'forms' => 'Forms',
		'glosses' => 'Glosses',
		'grammatical_features' => 'Grammatical features',
		'id' => 'Id',
		'label' => 'Label',
		'language' => 'Language',
		'last_revision_id' => 'Last revision id',
		'lemmas' => 'Lemmas',
		'lexical_category' => 'Lexical category',
		'ns' => 'NS',
		'page_id' => 'Page id',
		'rank_deprecated' => 'deprecated',
		'rank_normal' => 'normal',
		'rank_preferred' => 'preferred',
		'references' => 'References',
		'representation' => 'Representation',
		'senses' => 'Senses',
		'sitelinks' => 'Sitelinks',
		'statements' => 'Statements',
		'title' => 'Title',
		'value_no' => 'no value',
		'value_unknown' => 'unknown value',
	},
);

our $VERSION = 0.17;

sub text_keys {
	return sort keys %{$TEXTS{'en'}};
}

sub texts {
	my $lang = shift;

	if (! defined $lang
		|| ! exists $TEXTS{$lang}) {

		$lang = 'en';
	}

	return $TEXTS{$lang};
}

1;
