use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikibase::Datatype::Print::MediainfoStatement;

# Test.
is($Wikibase::Datatype::Print::MediainfoStatement::VERSION, 0.19, 'Version.');
