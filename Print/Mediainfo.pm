package Wikibase::Datatype::Print::Mediainfo;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;
use Wikibase::Datatype::Print::Statement;
use Wikibase::Datatype::Print::Value::Monolingual;

Readonly::Array our @EXPORT_OK => qw(print);

our $VERSION = 0.01;

sub print {
	my ($obj, $opts_hr) = @_;

	if (! defined $opts_hr) {
		$opts_hr->{'lang'} = 'en';
	}

	if (! $obj->isa('Wikibase::Datatype::Mediainfo')) {
		err "Object isn't 'Wikibase::Datatype::Mediainfo'.";
	}

	my @ret;
	my ($label) = grep { $_->language eq $opts_hr->{'lang'} } @{$obj->labels};
	push @ret, $label->value;
	# TODO
	foreach my $statement (@{$obj->statements}) {
		push @ret, Wikibase::Datatype::Print::Statement::print($statement);
	}

	return wantarray ? @ret : (join "\n", @ret);
}

1;

__END__
