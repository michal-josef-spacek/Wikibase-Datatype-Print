package Wikibase::Datatype::Print::Lexeme;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;
use Wikibase::Datatype::Print::Form;
use Wikibase::Datatype::Print::Sense;
use Wikibase::Datatype::Print::Statement;
use Wikibase::Datatype::Print::Utils qw(print_statements);
use Wikibase::Datatype::Print::Value::Monolingual;

Readonly::Array our @EXPORT_OK => qw(print);

our $VERSION = 0.01;

sub print {
	my ($obj, $opts_hr) = @_;

	if (! defined $opts_hr) {
		$opts_hr = {};
	}

	if (! $obj->isa('Wikibase::Datatype::Lexeme')) {
		err "Object isn't 'Wikibase::Datatype::Lexeme'.";
	}

	my @ret = (
		'Title: '.$obj->title,
	);

	# Lemmas.
	my ($lemma) = @{$obj->lemmas};
	if (defined $lemma) {
		push @ret, 'Lemmas: '.
			Wikibase::Datatype::Print::Value::Monolingual::print($lemma, $opts_hr);
	}

	# Language.
	if ($obj->language) {
		push @ret, (
			'Language: '.$obj->language,
		);
	}

	# Lexical category.
	if ($obj->lexical_category) {
		push @ret, (
			'Lexical category: '.$obj->lexical_category,
		);
	}

	# Statements.
	push @ret, print_statements($obj, $opts_hr,
		\&Wikibase::Datatype::Print::Statement::print);

	# Senses.
	my @senses;
	foreach my $sense (@{$obj->senses}) {
		push @senses, map { '  '.$_ } Wikibase::Datatype::Print::Sense::print($sense, $opts_hr);
	}
	if (@senses) {
		push @ret, (
			'Senses:',
			@senses,
		);
	}

	# Forms.
	my @forms;
	foreach my $form (@{$obj->forms}) {
		push @forms, map { '  '.$_ } Wikibase::Datatype::Print::Form::print($form, $opts_hr);
	}
	if (@forms) {
		push @ret, (
			'Forms:',
			@forms,
		);
	}

	return wantarray ? @ret : (join "\n", @ret);
}

1;

__END__
