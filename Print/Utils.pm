package Wikibase::Datatype::Print::Utils;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;

Readonly::Array our @EXPORT_OK => qw(print_statements);

our $VERSION = 0.01;

sub print_statements {
	my ($obj, $opts_hr, $statement_cb) = @_;

	my @ret;
	my @statements;
	foreach my $statement (@{$obj->statements}) {
		push @statements, map { '  '.$_ } $statement_cb->($statement, $opts_hr);
	}
	if (@statements) {
		push @ret, (
			'Statements:',
			@statements,
		);
	}

	return @ret;
}

1;

__END__
