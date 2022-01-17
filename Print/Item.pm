package Wikibase::Datatype::Print::Item;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;
use Wikibase::Datatype::Print::Sitelink;
use Wikibase::Datatype::Print::Statement;
use Wikibase::Datatype::Print::Value::Monolingual;

Readonly::Array our @EXPORT_OK => qw(print);

our $VERSION = 0.01;

sub print {
	my ($obj, $opts_hr) = @_;

	if (! defined $opts_hr || ! exists $opts_hr->{'lang'}) {
		$opts_hr->{'lang'} = 'en';
	}

	if (! $obj->isa('Wikibase::Datatype::Item')) {
		err "Object isn't 'Wikibase::Datatype::Item'.";
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

	# Aliases.
	my @aliases = grep { $_->language eq $opts_hr->{'lang'} } @{$obj->aliases};
	if (@aliases) {
		push @ret, (
			'Aliases:',
		);
		foreach my $alias (@aliases) {
			push @ret, map { '  '.$_ }
				Wikibase::Datatype::Print::Value::Monolingual::print($alias);
		}
	}

	# Sitelinks.
	my @sitelinks = @{$obj->sitelinks};
	if (@sitelinks) {
		push @ret, (
			'Sitelinks:',
		);
		foreach my $sitelink (@sitelinks) {
			push @ret, map { '  '.$_ }
				Wikibase::Datatype::Print::Sitelink::print($sitelink);
		}
	}

	# Statements.
	my @statements;
	foreach my $statement (@{$obj->statements}) {
		push @statements, map { '  '.$_ } Wikibase::Datatype::Print::Statement::print($statement, $opts_hr);
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
