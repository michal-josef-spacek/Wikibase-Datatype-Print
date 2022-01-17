package Wikibase::Datatype::Print::Statement;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;
use Wikibase::Datatype::Print::Reference;
use Wikibase::Datatype::Print::Snak;

Readonly::Array our @EXPORT_OK => qw(print);

our $VERSION = 0.01;

sub print {
	my ($obj, $opts_hr) = @_;

	if (! $obj->isa('Wikibase::Datatype::Statement')) {
		err "Object isn't 'Wikibase::Datatype::Statement'.";
	}

	my @ret = (
		Wikibase::Datatype::Print::Snak::print($obj->snak, $opts_hr).' ('.$obj->rank.')',
	);
	foreach my $property_snak (@{$obj->property_snaks}) {
		push @ret, ' '.Wikibase::Datatype::Print::Snak::print($property_snak, $opts_hr);
	}
	my @ref;
	foreach my $reference (@{$obj->references}) {
		push @ref, map { '  '.$_ } Wikibase::Datatype::Print::Reference::print($reference, $opts_hr);
	}
	if (@ref) {
		push @ret, (
			' References',
			@ref,
		);
	}

	return wantarray ? @ret : (join "\n", @ret);
}

1;

__END__
