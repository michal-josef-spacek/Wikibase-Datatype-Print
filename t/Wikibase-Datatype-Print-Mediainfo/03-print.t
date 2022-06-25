use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Test::Shared::Fixture::Wikibase::Datatype::Mediainfo::Commons::ImageOfHuman;
use Wikibase::Datatype::Print::Mediainfo;

# Test.
my $obj = Test::Shared::Fixture::Wikibase::Datatype::Mediainfo::Commons::ImageOfHuman->new;
my $ret = Wikibase::Datatype::Print::Mediainfo::print($obj);
my $right_ret = <<'END';
Label: Portrait of Douglas Adams (en)
Statements:
  P180: Q42 (normal)
END
chomp $right_ret;
is($ret, $right_ret, 'Get printed value.');
