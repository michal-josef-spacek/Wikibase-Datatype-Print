package Wikibase::Datatype::Print::Mediainfo;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;
use Wikibase::Datatype::Print::MediainfoStatement;
use Wikibase::Datatype::Print::Value::Monolingual;

Readonly::Array our @EXPORT_OK => qw(print);

our $VERSION = 0.01;

sub print {
	my ($obj, $opts_hr) = @_;

	if (! defined $opts_hr) {
		$opts_hr = {};
	}

	if (! exists $opts_hr->{'lang'}) {
		$opts_hr->{'lang'} = 'en';
	}

	if (! $obj->isa('Wikibase::Datatype::Mediainfo')) {
		err "Object isn't 'Wikibase::Datatype::Mediainfo'.";
	}

	my @ret;

	# Label.
	my ($label) = grep { $_->language eq $opts_hr->{'lang'} } @{$obj->labels};
	if (defined $label) {
		push @ret, 'Label: '.
			Wikibase::Datatype::Print::Value::Monolingual::print($label);
	}

	# Description.
	my ($description) = grep { $_->language eq $opts_hr->{'lang'} } @{$obj->descriptions};
	if (defined $description) {
		push @ret, 'Description: '.
			Wikibase::Datatype::Print::Value::Monolingual::print($description);
	}

	# Statements.
	my @statements;
	foreach my $statement (@{$obj->statements}) {
		push @statements, map { '  '.$_ } Wikibase::Datatype::Print::MediainfoStatement::print($statement, $opts_hr);
	}
	if (@statements) {
		push @ret, (
			'Statements:',
			@statements,
		);
	}

	return wantarray ? @ret : (join "\n", @ret);
}

1;

__END__
