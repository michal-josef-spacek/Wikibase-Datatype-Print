package Wikibase::Datatype::Print::Value::Item;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;

Readonly::Array our @EXPORT_OK => qw(print);

our $VERSION = 0.01;

sub print {
	my $obj = shift;

	if (! $obj->isa('Wikibase::Datatype::Value::Item')) {
		err "Object isn't 'Wikibase::Datatype::Value::Item'.";
	}

	return $obj->value;
}

1;

__END__
