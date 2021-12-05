use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);
use Wikibase::Datatype::Lexeme;
use Wikibase::Datatype::Form;
use Wikibase::Datatype::Print::Lexeme;
use Wikibase::Datatype::Reference;
use Wikibase::Datatype::Sense;
use Wikibase::Datatype::Snak;
use Wikibase::Datatype::Statement;
use Wikibase::Datatype::Value::Item;
use Wikibase::Datatype::Value::Monolingual;
use Wikibase::Datatype::Value::String;
use Wikibase::Datatype::Value::Time;

# Test.
my $statement1 = Wikibase::Datatype::Statement->new(
        # instance of (P31) human (Q5)
        'snak' => Wikibase::Datatype::Snak->new(
                 'datatype' => 'wikibase-item',
                 'datavalue' => Wikibase::Datatype::Value::Item->new(
                         'value' => 'Q5',
                 ),
                 'property' => 'P31',
        ),
        'property_snaks' => [
                # of (P642) alien (Q474741)
                Wikibase::Datatype::Snak->new(
                         'datatype' => 'wikibase-item',
                         'datavalue' => Wikibase::Datatype::Value::Item->new(
                                 'value' => 'Q474741',
                         ),
                         'property' => 'P642',
                ),
        ],
        'references' => [
                 Wikibase::Datatype::Reference->new(
                         'snaks' => [
                                 # stated in (P248) Virtual International Authority File (Q53919)
                                 Wikibase::Datatype::Snak->new(
                                          'datatype' => 'wikibase-item',
                                          'datavalue' => Wikibase::Datatype::Value::Item->new(
                                                  'value' => 'Q53919',
                                          ),
                                          'property' => 'P248',
                                 ),

                                 # VIAF ID (P214) 113230702
                                 Wikibase::Datatype::Snak->new(
                                          'datatype' => 'external-id',
                                          'datavalue' => Wikibase::Datatype::Value::String->new(
                                                  'value' => '113230702',
                                          ),
                                          'property' => 'P214',
                                 ),

                                 # retrieved (P813) 7 December 2013
                                 Wikibase::Datatype::Snak->new(
                                          'datatype' => 'time',
                                          'datavalue' => Wikibase::Datatype::Value::Time->new(
                                                  'value' => '+2013-12-07T00:00:00Z',
                                          ),
                                          'property' => 'P813',
                                 ),
                         ],
                 ),
        ],
);
my $statement2 = Wikibase::Datatype::Statement->new(
        # sex or gender (P21) male (Q6581097)
        'snak' => Wikibase::Datatype::Snak->new(
                 'datatype' => 'wikibase-item',
                 'datavalue' => Wikibase::Datatype::Value::Item->new(
                         'value' => 'Q6581097',
                 ),
                 'property' => 'P21',
        ),
        'references' => [
                 Wikibase::Datatype::Reference->new(
                         'snaks' => [
                                 # stated in (P248) Virtual International Authority File (Q53919)
                                 Wikibase::Datatype::Snak->new(
                                          'datatype' => 'wikibase-item',
                                          'datavalue' => Wikibase::Datatype::Value::Item->new(
                                                  'value' => 'Q53919',
                                          ),
                                          'property' => 'P248',
                                 ),

                                 # VIAF ID (P214) 113230702
                                 Wikibase::Datatype::Snak->new(
                                          'datatype' => 'external-id',
                                          'datavalue' => Wikibase::Datatype::Value::String->new(
                                                  'value' => '113230702',
                                          ),
                                          'property' => 'P214',
                                 ),

                                 # retrieved (P813) 7 December 2013
                                 Wikibase::Datatype::Snak->new(
                                          'datatype' => 'time',
                                          'datavalue' => Wikibase::Datatype::Value::Time->new(
                                                  'value' => '+2013-12-07T00:00:00Z',
                                          ),
                                          'property' => 'P813',
                                 ),
                         ],
                 ),
        ],
);
my $statement_item = Wikibase::Datatype::Statement->new(
        # item for this sense (P5137) dog (Q144)
        'snak' => Wikibase::Datatype::Snak->new(
                 'datatype' => 'wikibase-item',
                 'datavalue' => Wikibase::Datatype::Value::Item->new(
                         'value' => 'Q144',
                 ),
                 'property' => 'P5137',
        ),
);
my $statement_image = Wikibase::Datatype::Statement->new(
        # image (P5137) 'Canadian Inuit Dog.jpg'
        'snak' => Wikibase::Datatype::Snak->new(
                 'datatype' => 'commonsMedia',
                 'datavalue' => Wikibase::Datatype::Value::String->new(
                         'value' => 'Canadian Inuit Dog.jpg',
                 ),
                 'property' => 'P18',
        ),
);
my $sense = Wikibase::Datatype::Sense->new(
        'glosses' => [
                Wikibase::Datatype::Value::Monolingual->new(
                         'language' => 'en',
                         'value' => 'domesticated mammal related to the wolf',
                ),
                Wikibase::Datatype::Value::Monolingual->new(
                         'language' => 'cs',
                         'value' => decode_utf8('psovitá šelma chovaná jako domácí zvíře'),
                ),
        ],
	# https://www.wikidata.org/wiki/Lexeme:L469
        'id' => 'L469-S1',
        'statements' => [
                $statement_item,
                $statement_image,
        ],
);
my $form = Wikibase::Datatype::Form->new(
        'grammatical_features' => [
                # singular
                Wikibase::Datatype::Value::Item->new(
                        'value' => 'Q110786',
                ),
                # nominative case
                Wikibase::Datatype::Value::Item->new(
                        'value' => 'Q131105',
                ),
        ],
        'id' => 'L469-F1',
        'representations' => [
                Wikibase::Datatype::Value::Monolingual->new(
                        'language' => 'cs',
                        'value' => 'pes',
                ),
        ],
        'statements' => [
                Wikibase::Datatype::Statement->new(
                        'snak' => Wikibase::Datatype::Snak->new(
                                'datatype' => 'string',
                                'datavalue' => Wikibase::Datatype::Value::String->new(
                                       'value' => decode_utf8('pɛs'),
                                ),
                                'property' => 'P898',
                        ),
                ),
        ],
);
my $obj = Wikibase::Datatype::Lexeme->new(
	'forms' => [
		$form,
	],
	'language' => 'Q9056',
	'lexical_category' => 'Q1084',
        'lemmas' => [
                Wikibase::Datatype::Value::Monolingual->new(
                        'language' => 'cs',
                        'value' => 'pes',
                ),
        ],
	'senses' => [
		$sense,
	],
        'statements' => [
                $statement1,
                $statement2,
        ],
        'title' => 'Lexeme:L469',
);
my $ret = Wikibase::Datatype::Print::Lexeme::print($obj);
my $right_ret = decode_utf8(<<'END');
Title: Lexeme:L469
Lemmas: pes (cs)
Language: Q9056
Lexical category: Q1084
Statements:
  P31: Q5 (normal)
   P642: Q474741
   References
    P248: Q53919
    P214: 113230702
    P813: 07 December 2013 (Gregorian)
  P21: Q6581097 (normal)
   References
    P248: Q53919
    P214: 113230702
    P813: 07 December 2013 (Gregorian)
Senses:
  Id: L469-S1
  Glosses:
    domesticated mammal related to the wolf (en)
    psovitá šelma chovaná jako domácí zvíře (cs)
  Statements:
    P5137: Q144 (normal)
    P18: Canadian Inuit Dog.jpg (normal)
Forms:
  Id: L469-F1
  Representation: pes (cs)
  Grammatical features: Q110786, Q131105
  Statements:
    P898: pɛs (normal)
END
chomp $right_ret;
is($ret, $right_ret, 'Get printed value.');
