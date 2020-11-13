package Wikidata::Datatype::Print::Value::Quantity;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;

Readonly::Array our @EXPORT_OK => qw(print);

our $VERSION = 0.01;

sub print {
	my $obj = shift;

	if (! $obj->isa('Wikidata::Datatype::Value::Quantity')) {
		err "Object isn't 'Wikidata::Datatype::Value::Quantity'.";
	}

	my $ret = $obj->value;
	if ($obj->unit) {
		$ret .= ' ('.$obj->unit.')';
	}

	return $ret;
}

1;

__END__
