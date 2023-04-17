package Wikibase::Datatype::Print::Value::Item;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;

Readonly::Array our @EXPORT_OK => qw(print);

our $VERSION = 0.09;

sub print {
	my ($obj, $opts_hr) = @_;

	if (! $obj->isa('Wikibase::Datatype::Value::Item')) {
		err "Object isn't 'Wikibase::Datatype::Value::Item'.";
	}

	if (exists $opts_hr->{'cb'} && ! $opts_hr->{'cb'}->isa('Wikibase::Cache')) {
		err "Option 'cb' must be a instance of Wikibase::Cache.";
	}

	my $item;
	if (exists $opts_hr->{'cb'}) {
		$item = $opts_hr->{'cb'}->get('label', $obj->value) || $obj->value;
	} else {
		$item = $obj->value;
	}

	return $item;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Wikibase::Datatype::Print::Value::Item - Wikibase item value pretty print helpers.

=head1 SYNOPSIS

 use Wikibase::Datatype::Print::Value::Item qw(print);

 my $pretty_print_string = print($obj, $opts_hr);

=head1 SUBROUTINES

=head2 C<print>

 my $pretty_print_string = print($obj, $opts_hr);

Construct pretty print output for L<Wikibase::Datatype::Value::Item>
object.

Returns string.

=head1 ERRORS

 print():
         Object isn't 'Wikibase::Datatype::Value::Item'.
         Option 'cb' must be a instance of Wikibase::Cache.

=head1 EXAMPLE

=for comment filename=create_and_print_value_item.pl

 use strict;
 use warnings;

 use Wikibase::Datatype::Print::Value::Item;
 use Wikibase::Datatype::Value::Item;

 # Object.
 my $obj = Wikibase::Datatype::Value::Item->new(
         'value' => 'Q123',
 );

 # Print.
 print Wikibase::Datatype::Print::Value::Item::print($obj)."\n";

 # Output:
 # Q123

=head1 DEPENDENCIES

L<Error::Pure>,
L<Exporter>,
L<Readonly>.

=head1 SEE ALSO

=over

=item L<Wikibase::Datatype::Value::Item>

Wikibase item value datatype.

=back

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/Wikibase-Datatype-Print>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© 2020-2023 Michal Josef Špaček

BSD 2-Clause License

=head1 VERSION

0.09

=cut
