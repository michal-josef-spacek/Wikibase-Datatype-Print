package Wikidata::Datatype::Print::Reference;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;
use Wikidata::Datatype::Reference;
use Wikidata::Datatype::Struct::Utils qw(obj_array_ref2struct struct2snaks_array_ref);

Readonly::Array our @EXPORT_OK => qw(print);

our $VERSION = 0.01;

sub print {
	my $obj = shift;

	if (! $obj->isa('Wikidata::Datatype::Reference')) {
		err "Object isn't 'Wikidata::Datatype::Reference'.";
	}

	my @ret;
#	my $struct_hr = obj_array_ref2struct($obj->snaks, 'snaks');

	return @ret;
}

1;

__END__
