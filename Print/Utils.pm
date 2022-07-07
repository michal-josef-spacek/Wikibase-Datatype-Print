package Wikibase::Datatype::Print::Utils;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;

Readonly::Array our @EXPORT_OK => qw(print_common print_forms print_glosses
	print_sitelinks print_statements);

our $VERSION = 0.01;

sub print_common {
	my ($obj, $opts_hr, $list_method, $print_cb, $title) = @_;

	my @ret;
	my @values;
	foreach my $list_item (@{$obj->$list_method}) {
		push @values, map { '  '.$_ } $print_cb->($list_item, $opts_hr);
	}
	if (@values) {
		push @ret, (
			$title.':',
			@values,
		);
	}

	return @ret;
}

sub print_forms {
	my ($obj, $opts_hr, $forms_cb) = @_;

	return print_common($obj, $opts_hr, 'forms', $forms_cb,
		'Forms');
}

sub print_glosses {
	my ($obj, $opts_hr, $glosses_cb) = @_;

	return print_common($obj, $opts_hr, 'glosses', $glosses_cb,
		'Glosses');
}

sub print_sitelinks {
	my ($obj, $opts_hr, $sitelink_cb) = @_;

	return print_common($obj, $opts_hr, 'sitelinks', $sitelink_cb,
		'Sitelinks');
}

sub print_statements {
	my ($obj, $opts_hr, $statement_cb) = @_;

	return print_common($obj, $opts_hr, 'statements', $statement_cb,
		'Statements');
}

1;

__END__