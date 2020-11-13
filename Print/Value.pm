package Wikidata::Datatype::Print::Value;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;
use Wikidata::Datatype::Print::Value::Globecoordinate;
use Wikidata::Datatype::Print::Value::Item;
use Wikidata::Datatype::Print::Value::Monolingual;
use Wikidata::Datatype::Print::Value::Property;
use Wikidata::Datatype::Print::Value::Quantity;
use Wikidata::Datatype::Print::Value::String;
use Wikidata::Datatype::Print::Value::Time;

Readonly::Array our @EXPORT_OK => qw(print);

our $VERSION = 0.01;

sub print {
	my $obj = shift;

	if (! $obj->isa('Wikidata::Datatype::Value')) {
		err "Object isn't 'Wikidata::Datatype::Value'.";
	}

	my $type = $obj->type;
	my $ret;
	if ($type eq 'globecoordinate') {
		$ret = Wikidata::Datatype::Print::Value::Globecoordinate::print($obj);
	} elsif ($type eq 'item') {
		$ret = Wikidata::Datatype::Print::Value::Item::print($obj);
	} elsif ($type eq 'monolingualtext') {
		$ret = Wikidata::Datatype::Print::Value::Monolingual::print($obj);
	} elsif ($type eq 'property') {
		$ret = Wikidata::Datatype::Print::Value::Property::print($obj);
	} elsif ($type eq 'quantity') {
		$ret = Wikidata::Datatype::Print::Value::Quantity::print($obj);
	} elsif ($type eq 'string') {
		$ret = Wikidata::Datatype::Print::Value::String::print($obj);
	} elsif ($type eq 'time') {
		$ret = Wikidata::Datatype::Print::Value::Time::print($obj);
	} else {
		err "Type '$type' is unsupported.";
	}

	return $ret;
}

1;

__END__
