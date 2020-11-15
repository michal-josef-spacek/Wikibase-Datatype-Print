package Wikibase::Datatype::Print::Statement;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;
use Wikibase::Datatype::Statement;
use Wikibase::Datatype::Print::Reference;
use Wikibase::Datatype::Print::Snak;
use Wikibase::Datatype::Struct::Utils qw(obj_array_ref2struct struct2snaks_array_ref);

Readonly::Array our @EXPORT_OK => qw(print);

our $VERSION = 0.01;

sub print {
	my $obj = shift;

	if (! $obj->isa('Wikibase::Datatype::Statement')) {
		err "Object isn't 'Wikibase::Datatype::Statement'.";
	}

	my @ret = (
		Wikibase::Datatype::Print::Snak::print($obj->snak).' (normal)',
	);
#	my $struct_hr = {
#		'mainsnak' => Wikibase::Datatype::Struct::Snak::obj2struct($obj->snak),
#		@{$obj->property_snaks} ? (
#			%{obj_array_ref2struct($obj->property_snaks, 'qualifiers')},
#		) : (),
#		'rank' => $obj->rank,
#		@{$obj->references} ? (
#			'references' => [
#				map { Wikibase::Datatype::Struct::Reference::obj2struct($_); }
#				@{$obj->references},
#			],
#		) : (),
#		'type' => 'statement',
#	};

	return @ret;
}

1;

__END__
