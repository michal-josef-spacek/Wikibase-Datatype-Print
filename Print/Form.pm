package Wikibase::Datatype::Print::Form;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;
use Wikibase::Datatype::Print::Statement;
use Wikibase::Datatype::Print::Value::Item;
use Wikibase::Datatype::Print::Value::Monolingual;

Readonly::Array our @EXPORT_OK => qw(print);

our $VERSION = 0.01;

sub print {
	my ($obj, $opts_hr) = @_;

	if (! defined $opts_hr) {
		$opts_hr->{'lang'} = 'en';
	}

	if (! $obj->isa('Wikibase::Datatype::Form')) {
		err "Object isn't 'Wikibase::Datatype::Form'.";
	}

	my @ret = (
		'Id: '.$obj->id,
	);

	# Representation.
	# XXX In every time one?
	my ($representation) = @{$obj->representations};
	if (defined $representation) {
		push @ret, 'Representation: '.
			Wikibase::Datatype::Print::Value::Monolingual::print($representation);
	}

	# Grammatical features
	my @gr_features;
	foreach my $gr_feature (@{$obj->grammatical_features}) {
		push @gr_features,
			Wikibase::Datatype::Print::Value::Item::print($gr_feature, $opts_hr);
	}
	if (@gr_features) {
		push @ret, 'Grammatical features: '.(join ', ', @gr_features);
	}

	# Statements.
	my @statements;
	foreach my $statement (@{$obj->statements}) {
		push @statements, map { '  '.$_ } Wikibase::Datatype::Print::Statement::print($statement);
	}
	if (@statements) {
		push @ret, (
			'Statements:',
			@statements,
		);
	}

	return wantarray ? @ret : (join "\n", @ret);
}

1;

__END__
