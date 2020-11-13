package Wikidata::Datatype::Print::Value::Time;

use base qw(Exporter);
use strict;
use warnings;

use DateTime::Format::ISO8601;
use Error::Pure qw(err);
use Readonly;

Readonly::Array our @EXPORT_OK => qw(print);

our $VERSION = 0.01;

sub print {
	my $obj = shift;

	if (! $obj->isa('Wikidata::Datatype::Value::Time')) {
		err "Object isn't 'Wikidata::Datatype::Value::Time'.";
	}

	# Calendar.
	my $calendar;
	# TODO Zjistit ostatni
	if ($obj->calendarmodel eq 'Q1985727') {
		$calendar = 'Gregorian';
	} elsif ($obj->calendarmodel eq 'Q1985786') {
		$calendar = 'Julian';
	} else {
		err "Calendar model '".$obj->calendarmodel."' doesn't supported.";
	}

	my $dt = DateTime::Format::ISO8601->parse_datetime((substr $obj->value, 1));

	# TODO Precision
	# TODO other?

	# TODO %d 01 -> 1
	return $dt->strftime("%d %B %Y").' ('.$calendar.')';
}

1;

__END__
