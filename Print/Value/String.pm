package Wikidata::Datatype::Print::Value::String;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;

Readonly::Array our @EXPORT_OK => qw(print);

our $VERSION = 0.01;

sub print {
	my $obj = shift;

	if (! $obj->isa('Wikidata::Datatype::Value::String')) {
		err "Object isn't 'Wikidata::Datatype::Value::String'.";
	}

	return $obj->value;
}

1;

__END__
