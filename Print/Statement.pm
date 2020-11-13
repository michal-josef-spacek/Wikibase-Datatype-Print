package Wikidata::Datatype::Print::Statement;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;
use Wikidata::Datatype::Statement;
use Wikidata::Datatype::Print::Reference;
use Wikidata::Datatype::Print::Snak;
use Wikidata::Datatype::Struct::Utils qw(obj_array_ref2struct struct2snaks_array_ref);

Readonly::Array our @EXPORT_OK => qw(print);

our $VERSION = 0.01;

sub print {
	my $obj = shift;

	if (! $obj->isa('Wikidata::Datatype::Statement')) {
		err "Object isn't 'Wikidata::Datatype::Statement'.";
	}

	my @ret = (
		Wikidata::Datatype::Print::Snak::print($obj->snak).' (normal)',
	);
#	my $struct_hr = {
#		'mainsnak' => Wikidata::Datatype::Struct::Snak::obj2struct($obj->snak),
#		@{$obj->property_snaks} ? (
#			%{obj_array_ref2struct($obj->property_snaks, 'qualifiers')},
#		) : (),
#		'rank' => $obj->rank,
#		@{$obj->references} ? (
#			'references' => [
#				map { Wikidata::Datatype::Struct::Reference::obj2struct($_); }
#				@{$obj->references},
#			],
#		) : (),
#		'type' => 'statement',
#	};

	return @ret;
}

1;

__END__
