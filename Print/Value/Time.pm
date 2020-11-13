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
	my ($obj, $q_map_hr, $opts_hr) = @_;

	# Default mapping.
	if (! defined $q_map_hr) {
		# TODO Dat do nejakeho souboru Wikidata::Const.
		$q_map_hr = {
			'Q1985727' => 'Gregorian',
			'Q1985786' => 'Julian',
		};
	}

	# Default options.
	if (! defined $opts_hr) {
		$opts_hr = {
			'print_name' => 1,
		};
	}

	if (! $obj->isa('Wikidata::Datatype::Value::Time')) {
		err "Object isn't 'Wikidata::Datatype::Value::Time'.";
	}

	# Calendar.
	my $calendar;
	if (exists $opts_hr->{'print_name'} && $opts_hr->{'print_name'}) {
		$calendar = $q_map_hr->{$obj->calendarmodel} || $obj->calendarmodel;
	} else {
		$calendar = $obj->calendarmodel;
	}

	my $dt = DateTime::Format::ISO8601->parse_datetime((substr $obj->value, 1));

	# TODO Precision
	# TODO other?

	# TODO %d 01 -> 1
	return $dt->strftime("%d %B %Y").' ('.$calendar.')';
}

1;

__END__
