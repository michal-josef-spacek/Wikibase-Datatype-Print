package Wikidata::Datatype::Print::Value::Quantity;

use base qw(Exporter);
use strict;
use warnings;

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
			'Q174728' => 'centimetre',
			'Q11573' => 'metre',
			'Q828224' => 'kilometre',
			'Q3710' => 'foot',
			'Q174789' => 'milimetre',
			'Q218593' => 'inch',
			'Q253276' => 'mile',
			'Q200323' => 'decimetre',
			'Q844338' => 'hectometre',
			'Q848856' => 'decametre',
			'Q355198' => 'pixel',
			'Q178674' => 'nanometre',
			'Q7673190' => 'table cell',
			'Q70280567' => 'Prussian foot',
		};
	}

	# Default options.
	if (! defined $opts_hr) {
		$opts_hr = {
			'print_name' => 1,
		};
	}

	if (! $obj->isa('Wikidata::Datatype::Value::Quantity')) {
		err "Object isn't 'Wikidata::Datatype::Value::Quantity'.";
	}

	# Unit.
	my $unit;
	if ($obj->unit) {
		if (exists $opts_hr->{'print_name'} && $opts_hr->{'print_name'}) {
			$unit = $q_map_hr->{$obj->unit} || $obj->unit;
		} else {
			$unit = $obj->unit;
		}
	}

	# Output.
	my $ret = $obj->value;
	if ($unit) {
		$ret .= ' ('.$unit.')';
	}

	return $ret;
}

1;

__END__
