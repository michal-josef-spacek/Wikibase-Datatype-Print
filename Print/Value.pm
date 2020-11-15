package Wikibase::Datatype::Print::Value;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;
use Wikibase::Datatype::Print::Value::Globecoordinate;
use Wikibase::Datatype::Print::Value::Item;
use Wikibase::Datatype::Print::Value::Monolingual;
use Wikibase::Datatype::Print::Value::Property;
use Wikibase::Datatype::Print::Value::Quantity;
use Wikibase::Datatype::Print::Value::String;
use Wikibase::Datatype::Print::Value::Time;

Readonly::Array our @EXPORT_OK => qw(print);

our $VERSION = 0.01;

sub print {
	my $obj = shift;

	if (! $obj->isa('Wikibase::Datatype::Value')) {
		err "Object isn't 'Wikibase::Datatype::Value'.";
	}

	my $type = $obj->type;
	my $ret;
	if ($type eq 'globecoordinate') {
		$ret = Wikibase::Datatype::Print::Value::Globecoordinate::print($obj);
	} elsif ($type eq 'item') {
		$ret = Wikibase::Datatype::Print::Value::Item::print($obj);
	} elsif ($type eq 'monolingualtext') {
		$ret = Wikibase::Datatype::Print::Value::Monolingual::print($obj);
	} elsif ($type eq 'property') {
		$ret = Wikibase::Datatype::Print::Value::Property::print($obj);
	} elsif ($type eq 'quantity') {
		$ret = Wikibase::Datatype::Print::Value::Quantity::print($obj);
	} elsif ($type eq 'string') {
		$ret = Wikibase::Datatype::Print::Value::String::print($obj);
	} elsif ($type eq 'time') {
		$ret = Wikibase::Datatype::Print::Value::Time::print($obj);
	} else {
		err "Type '$type' is unsupported.";
	}

	return $ret;
}

1;

__END__
