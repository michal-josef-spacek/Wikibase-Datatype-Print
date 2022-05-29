use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Test::Shared::Fixture::Wikibase::Datatype::Property::Wikidata::InstanceOf;
use Unicode::UTF8 qw(decode_utf8);
use Wikibase::Datatype::Print::Property;

# Test.
my $obj = Test::Shared::Fixture::Wikibase::Datatype::Property::Wikidata::InstanceOf->new;
my $ret = Wikibase::Datatype::Print::Property::print($obj);
my $right_ret = decode_utf8(<<'END');
Data type: wikibase-item
Label: instance of (en)
Description: that class of which this subject is a particular example and member (en)
Statements:
  P31: Q32753077 (normal)
END
chomp $right_ret;
is($ret, $right_ret, 'Get printed value.');
