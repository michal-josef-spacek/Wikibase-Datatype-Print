package Wikibase::Datatype::Print::Sitelink;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;
use Wikibase::Datatype::Sitelink;
use Wikibase::Datatype::Value::Item;

Readonly::Array our @EXPORT_OK => qw(print);

our $VERSION = 0.01;

sub print {
	my $obj = shift;

	if (! $obj->isa('Wikibase::Datatype::Sitelink')) {
		err "Object isn't 'Wikibase::Datatype::Sitelink'.";
	}

	my $struct_hr = {
		'badges' => [
			map { $_->value } @{$obj->badges},
		],
		'site' => $obj->site,
		'title' => $obj->title,
	};

	return $struct_hr;
}

1;

__END__
