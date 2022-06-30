package Wikibase::Datatype::Print::Sense;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;
use Wikibase::Datatype::Print::Statement;
use Wikibase::Datatype::Print::Utils qw(print_statements);
use Wikibase::Datatype::Print::Value::Monolingual;

Readonly::Array our @EXPORT_OK => qw(print);

our $VERSION = 0.01;

sub print {
	my ($obj, $opts_hr) = @_;

	if (! $obj->isa('Wikibase::Datatype::Sense')) {
		err "Object isn't 'Wikibase::Datatype::Sense'.";
	}

	# Id.
	my @ret = (
		'Id: '.$obj->id,
	);

	# Glosses.
	my @glosses;
	foreach my $glosse (@{$obj->glosses}) {
		push @glosses, map { '  '.$_ }
			Wikibase::Datatype::Print::Value::Monolingual::print($glosse, $opts_hr);
	}
	if (@glosses) {
		push @ret, (
			'Glosses:',
			@glosses,
		);
	}

	# Statements.
	push @ret, print_statements($obj, $opts_hr,
		\&Wikibase::Datatype::Print::Statement::print);

	return wantarray ? @ret : (join "\n", @ret);
}

1;

__END__
