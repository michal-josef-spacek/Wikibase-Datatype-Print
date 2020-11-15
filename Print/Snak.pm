package Wikibase::Datatype::Print::Snak;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;
use Wikibase::Datatype::Print::Value;

Readonly::Array our @EXPORT_OK => qw(print);

our $VERSION = 0.01;

sub print {
	my $obj = shift;

	if (! $obj->isa('Wikibase::Datatype::Snak')) {
		err "Object isn't 'Wikibase::Datatype::Snak'.";
	}

	my $ret = $obj->property.': ';
	if ($obj->snaktype eq 'value') {
		$ret .= Wikibase::Datatype::Print::Value::print($obj->datavalue);
	} elsif ($obj->snaktype eq 'novalue') {
		$ret .= 'no value';
	} elsif ($obj->snaktype eq 'somevalue') {
		$ret .= 'unknown value';
	}
	return $ret;
}

1;

__END__
