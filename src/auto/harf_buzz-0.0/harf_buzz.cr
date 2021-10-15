# Dependencies
require "../g_object-2.0/g_object.cr"

# C lib declaration
require "./lib_harf_buzz.cr"

# Wrappers
require "./aat_layout_feature_selector_info_t.cr"
require "./blob_t.cr"
require "./buffer_t.cr"
require "./face_t.cr"
require "./feature_t.cr"
require "./font_extents_t.cr"
require "./font_funcs_t.cr"
require "./font_t.cr"
require "./glyph_extents_t.cr"
require "./glyph_info_t.cr"
require "./glyph_position_t.cr"
require "./language_t.cr"
require "./map_t.cr"
require "./ot_color_layer_t.cr"
require "./ot_math_glyph_part_t.cr"
require "./ot_math_glyph_variant_t.cr"
require "./ot_name_entry_t.cr"
require "./ot_var_axis_info_t.cr"
require "./ot_var_axis_t.cr"
require "./segment_properties_t.cr"
require "./set_t.cr"
require "./shape_plan_t.cr"
require "./unicode_funcs_t.cr"
require "./user_data_key_t.cr"
require "./variation_t.cr"

module HarfBuzz
  AAT_LAYOUT_NO_SELECTOR_INDEX         =          65535
  BUFFER_REPLACEMENT_CODEPOINT_DEFAULT =          65533
  FEATURE_GLOBAL_START                 =              0
  LANGUAGE_INVALID                     =              0 # Interface constants not supported!
  MAP_VALUE_INVALID                    = 4294967295_u32
  OT_LAYOUT_DEFAULT_LANGUAGE_INDEX     =          65535
  OT_LAYOUT_NO_FEATURE_INDEX           =          65535
  OT_LAYOUT_NO_SCRIPT_INDEX            =          65535
  OT_LAYOUT_NO_VARIATIONS_INDEX        =             -1
  OT_MAX_TAGS_PER_LANGUAGE             =              3
  OT_MAX_TAGS_PER_SCRIPT               =              3
  OT_VAR_NO_AXIS_INDEX                 =             -1
  SET_VALUE_INVALID                    = 4294967295_u32
  UNICODE_MAX                          =        1114111
  UNICODE_MAX_DECOMPOSITION_LEN        =             19
  VERSION_MAJOR                        =              3
  VERSION_MICRO                        =              0
  VERSION_MINOR                        =              0
  VERSION_STRING                       = "3.0.0"

  enum AatLayoutFeatureSelectorT : UInt32
    Invalid                      = 65535
    AllTypeFeaturesOn            =     0
    AllTypeFeaturesOff           =     1
    RequiredLigaturesOn          =     0
    RequiredLigaturesOff         =     1
    CommonLigaturesOn            =     2
    CommonLigaturesOff           =     3
    RareLigaturesOn              =     4
    RareLigaturesOff             =     5
    LogosOn                      =     6
    LogosOff                     =     7
    RebusPicturesOn              =     8
    RebusPicturesOff             =     9
    DiphthongLigaturesOn         =    10
    DiphthongLigaturesOff        =    11
    SquaredLigaturesOn           =    12
    SquaredLigaturesOff          =    13
    AbbrevSquaredLigaturesOn     =    14
    AbbrevSquaredLigaturesOff    =    15
    SymbolLigaturesOn            =    16
    SymbolLigaturesOff           =    17
    ContextualLigaturesOn        =    18
    ContextualLigaturesOff       =    19
    HistoricalLigaturesOn        =    20
    HistoricalLigaturesOff       =    21
    Unconnected                  =     0
    PartiallyConnected           =     1
    Cursive                      =     2
    UpperAndLowerCase            =     0
    AllCaps                      =     1
    AllLowerCase                 =     2
    SmallCaps                    =     3
    InitialCaps                  =     4
    InitialCapsAndSmallCaps      =     5
    SubstituteVerticalFormsOn    =     0
    SubstituteVerticalFormsOff   =     1
    LinguisticRearrangementOn    =     0
    LinguisticRearrangementOff   =     1
    MonospacedNumbers            =     0
    ProportionalNumbers          =     1
    ThirdWidthNumbers            =     2
    QuarterWidthNumbers          =     3
    WordInitialSwashesOn         =     0
    WordInitialSwashesOff        =     1
    WordFinalSwashesOn           =     2
    WordFinalSwashesOff          =     3
    LineInitialSwashesOn         =     4
    LineInitialSwashesOff        =     5
    LineFinalSwashesOn           =     6
    LineFinalSwashesOff          =     7
    NonFinalSwashesOn            =     8
    NonFinalSwashesOff           =     9
    ShowDiacritics               =     0
    HideDiacritics               =     1
    DecomposeDiacritics          =     2
    NormalPosition               =     0
    Superiors                    =     1
    Inferiors                    =     2
    Ordinals                     =     3
    ScientificInferiors          =     4
    NoFractions                  =     0
    VerticalFractions            =     1
    DiagonalFractions            =     2
    PreventOverlapOn             =     0
    PreventOverlapOff            =     1
    HyphensToEmDashOn            =     0
    HyphensToEmDashOff           =     1
    HyphenToEnDashOn             =     2
    HyphenToEnDashOff            =     3
    SlashedZeroOn                =     4
    SlashedZeroOff               =     5
    FormInterrobangOn            =     6
    FormInterrobangOff           =     7
    SmartQuotesOn                =     8
    SmartQuotesOff               =     9
    PeriodsToEllipsisOn          =    10
    PeriodsToEllipsisOff         =    11
    HyphenToMinusOn              =     0
    HyphenToMinusOff             =     1
    AsteriskToMultiplyOn         =     2
    AsteriskToMultiplyOff        =     3
    SlashToDivideOn              =     4
    SlashToDivideOff             =     5
    InequalityLigaturesOn        =     6
    InequalityLigaturesOff       =     7
    ExponentsOn                  =     8
    ExponentsOff                 =     9
    MathematicalGreekOn          =    10
    MathematicalGreekOff         =    11
    NoOrnaments                  =     0
    Dingbats                     =     1
    PiCharacters                 =     2
    Fleurons                     =     3
    DecorativeBorders            =     4
    InternationalSymbols         =     5
    MathSymbols                  =     6
    NoAlternates                 =     0
    DesignLevel1                 =     0
    DesignLevel2                 =     1
    DesignLevel3                 =     2
    DesignLevel4                 =     3
    DesignLevel5                 =     4
    NoStyleOptions               =     0
    DisplayText                  =     1
    EngravedText                 =     2
    IlluminatedCaps              =     3
    TitlingCaps                  =     4
    TallCaps                     =     5
    TraditionalCharacters        =     0
    SimplifiedCharacters         =     1
    Jis1978Characters            =     2
    Jis1983Characters            =     3
    Jis1990Characters            =     4
    TraditionalAltOne            =     5
    TraditionalAltTwo            =     6
    TraditionalAltThree          =     7
    TraditionalAltFour           =     8
    TraditionalAltFive           =     9
    ExpertCharacters             =    10
    Jis2004Characters            =    11
    HojoCharacters               =    12
    Nlccharacters                =    13
    TraditionalNamesCharacters   =    14
    LowerCaseNumbers             =     0
    UpperCaseNumbers             =     1
    ProportionalText             =     0
    MonospacedText               =     1
    HalfWidthText                =     2
    ThirdWidthText               =     3
    QuarterWidthText             =     4
    AltProportionalText          =     5
    AltHalfWidthText             =     6
    NoTransliteration            =     0
    HanjaToHangul                =     1
    HiraganaToKatakana           =     2
    KatakanaToHiragana           =     3
    KanaToRomanization           =     4
    RomanizationToHiragana       =     5
    RomanizationToKatakana       =     6
    HanjaToHangulAltOne          =     7
    HanjaToHangulAltTwo          =     8
    HanjaToHangulAltThree        =     9
    NoAnnotation                 =     0
    BoxAnnotation                =     1
    RoundedBoxAnnotation         =     2
    CircleAnnotation             =     3
    InvertedCircleAnnotation     =     4
    ParenthesisAnnotation        =     5
    PeriodAnnotation             =     6
    RomanNumeralAnnotation       =     7
    DiamondAnnotation            =     8
    InvertedBoxAnnotation        =     9
    InvertedRoundedBoxAnnotation =    10
    FullWidthKana                =     0
    ProportionalKana             =     1
    FullWidthIdeographs          =     0
    ProportionalIdeographs       =     1
    HalfWidthIdeographs          =     2
    CanonicalCompositionOn       =     0
    CanonicalCompositionOff      =     1
    CompatibilityCompositionOn   =     2
    CompatibilityCompositionOff  =     3
    TranscodingCompositionOn     =     4
    TranscodingCompositionOff    =     5
    NoRubyKana                   =     0
    RubyKana                     =     1
    RubyKanaOn                   =     2
    RubyKanaOff                  =     3
    NoCjkSymbolAlternatives      =     0
    CjkSymbolAltOne              =     1
    CjkSymbolAltTwo              =     2
    CjkSymbolAltThree            =     3
    CjkSymbolAltFour             =     4
    CjkSymbolAltFive             =     5
    NoIdeographicAlternatives    =     0
    IdeographicAltOne            =     1
    IdeographicAltTwo            =     2
    IdeographicAltThree          =     3
    IdeographicAltFour           =     4
    IdeographicAltFive           =     5
    CjkVerticalRomanCentered     =     0
    CjkVerticalRomanHbaseline    =     1
    NoCjkItalicRoman             =     0
    CjkItalicRoman               =     1
    CjkItalicRomanOn             =     2
    CjkItalicRomanOff            =     3
    CaseSensitiveLayoutOn        =     0
    CaseSensitiveLayoutOff       =     1
    CaseSensitiveSpacingOn       =     2
    CaseSensitiveSpacingOff      =     3
    AlternateHorizKanaOn         =     0
    AlternateHorizKanaOff        =     1
    AlternateVertKanaOn          =     2
    AlternateVertKanaOff         =     3
    NoStylisticAlternates        =     0
    StylisticAltOneOn            =     2
    StylisticAltOneOff           =     3
    StylisticAltTwoOn            =     4
    StylisticAltTwoOff           =     5
    StylisticAltThreeOn          =     6
    StylisticAltThreeOff         =     7
    StylisticAltFourOn           =     8
    StylisticAltFourOff          =     9
    StylisticAltFiveOn           =    10
    StylisticAltFiveOff          =    11
    StylisticAltSixOn            =    12
    StylisticAltSixOff           =    13
    StylisticAltSevenOn          =    14
    StylisticAltSevenOff         =    15
    StylisticAltEightOn          =    16
    StylisticAltEightOff         =    17
    StylisticAltNineOn           =    18
    StylisticAltNineOff          =    19
    StylisticAltTenOn            =    20
    StylisticAltTenOff           =    21
    StylisticAltElevenOn         =    22
    StylisticAltElevenOff        =    23
    StylisticAltTwelveOn         =    24
    StylisticAltTwelveOff        =    25
    StylisticAltThirteenOn       =    26
    StylisticAltThirteenOff      =    27
    StylisticAltFourteenOn       =    28
    StylisticAltFourteenOff      =    29
    StylisticAltFifteenOn        =    30
    StylisticAltFifteenOff       =    31
    StylisticAltSixteenOn        =    32
    StylisticAltSixteenOff       =    33
    StylisticAltSeventeenOn      =    34
    StylisticAltSeventeenOff     =    35
    StylisticAltEighteenOn       =    36
    StylisticAltEighteenOff      =    37
    StylisticAltNineteenOn       =    38
    StylisticAltNineteenOff      =    39
    StylisticAltTwentyOn         =    40
    StylisticAltTwentyOff        =    41
    ContextualAlternatesOn       =     0
    ContextualAlternatesOff      =     1
    SwashAlternatesOn            =     2
    SwashAlternatesOff           =     3
    ContextualSwashAlternatesOn  =     4
    ContextualSwashAlternatesOff =     5
    DefaultLowerCase             =     0
    LowerCaseSmallCaps           =     1
    LowerCasePetiteCaps          =     2
    DefaultUpperCase             =     0
    UpperCaseSmallCaps           =     1
    UpperCasePetiteCaps          =     2
    HalfWidthCjkRoman            =     0
    ProportionalCjkRoman         =     1
    DefaultCjkRoman              =     2
    FullWidthCjkRoman            =     3
  end

  enum AatLayoutFeatureTypeT : UInt32
    Invalid                       = 65535
    AllTypographic                =     0
    Ligatures                     =     1
    CurisveConnection             =     2
    LetterCase                    =     3
    VerticalSubstitution          =     4
    LinguisticRearrangement       =     5
    NumberSpacing                 =     6
    SmartSwashType                =     8
    DiacriticsType                =     9
    VerticalPosition              =    10
    Fractions                     =    11
    OverlappingCharactersType     =    13
    TypographicExtras             =    14
    MathematicalExtras            =    15
    OrnamentSetsType              =    16
    CharacterAlternatives         =    17
    DesignComplexityType          =    18
    StyleOptions                  =    19
    CharacterShape                =    20
    NumberCase                    =    21
    TextSpacing                   =    22
    Transliteration               =    23
    AnnotationType                =    24
    KanaSpacingType               =    25
    IdeographicSpacingType        =    26
    UnicodeDecompositionType      =    27
    RubyKana                      =    28
    CjkSymbolAlternativesType     =    29
    IdeographicAlternativesType   =    30
    CjkVerticalRomanPlacementType =    31
    ItalicCjkRoman                =    32
    CaseSensitiveLayout           =    33
    AlternateKana                 =    34
    StylisticAlternatives         =    35
    ContextualAlternatives        =    36
    LowerCase                     =    37
    UpperCase                     =    38
    LanguageTagType               =    39
    CjkRomanSpacingType           =   103
  end

  enum BufferClusterLevelT : UInt32
    MonotoneGraphemes  = 0
    MonotoneCharacters = 1
    Characters         = 2
    Default            = 0
  end

  enum BufferContentTypeT : UInt32
    Invalid = 0
    Unicode = 1
    Glyphs  = 2
  end

  enum BufferSerializeFormatT : UInt32
    Text    = 1413830740
    Json    = 1246973774
    Invalid =          0
  end

  enum DirectionT : UInt32
    Invalid = 0
    Ltr     = 4
    Rtl     = 5
    Ttb     = 6
    Btt     = 7
  end

  enum MemoryModeT : UInt32
    Duplicate               = 0
    Readonly                = 1
    Writable                = 2
    ReadonlyMayMakeWritable = 3
  end

  enum OtLayoutBaselineTagT : UInt32
    Roman                 = 1919905134
    Hanging               = 1751215719
    IdeoFaceBottomOrLeft  = 1768121954
    IdeoFaceTopOrRight    = 1768121972
    IdeoEmboxBottomOrLeft = 1768187247
    IdeoEmboxTopOrRight   = 1768191088
    Math                  = 1835103336
  end

  enum OtLayoutGlyphClassT : UInt32
    Unclassified = 0
    BaseGlyph    = 1
    Ligature     = 2
    Mark         = 3
    Component    = 4
  end

  enum OtMathConstantT : UInt32
    ScriptPercentScaleDown                   =  0
    ScriptScriptPercentScaleDown             =  1
    DelimitedSubFormulaMinHeight             =  2
    DisplayOperatorMinHeight                 =  3
    MathLeading                              =  4
    AxisHeight                               =  5
    AccentBaseHeight                         =  6
    FlattenedAccentBaseHeight                =  7
    SubscriptShiftDown                       =  8
    SubscriptTopMax                          =  9
    SubscriptBaselineDropMin                 = 10
    SuperscriptShiftUp                       = 11
    SuperscriptShiftUpCramped                = 12
    SuperscriptBottomMin                     = 13
    SuperscriptBaselineDropMax               = 14
    SubSuperscriptGapMin                     = 15
    SuperscriptBottomMaxWithSubscript        = 16
    SpaceAfterScript                         = 17
    UpperLimitGapMin                         = 18
    UpperLimitBaselineRiseMin                = 19
    LowerLimitGapMin                         = 20
    LowerLimitBaselineDropMin                = 21
    StackTopShiftUp                          = 22
    StackTopDisplayStyleShiftUp              = 23
    StackBottomShiftDown                     = 24
    StackBottomDisplayStyleShiftDown         = 25
    StackGapMin                              = 26
    StackDisplayStyleGapMin                  = 27
    StretchStackTopShiftUp                   = 28
    StretchStackBottomShiftDown              = 29
    StretchStackGapAboveMin                  = 30
    StretchStackGapBelowMin                  = 31
    FractionNumeratorShiftUp                 = 32
    FractionNumeratorDisplayStyleShiftUp     = 33
    FractionDenominatorShiftDown             = 34
    FractionDenominatorDisplayStyleShiftDown = 35
    FractionNumeratorGapMin                  = 36
    FractionNumDisplayStyleGapMin            = 37
    FractionRuleThickness                    = 38
    FractionDenominatorGapMin                = 39
    FractionDenomDisplayStyleGapMin          = 40
    SkewedFractionHorizontalGap              = 41
    SkewedFractionVerticalGap                = 42
    OverbarVerticalGap                       = 43
    OverbarRuleThickness                     = 44
    OverbarExtraAscender                     = 45
    UnderbarVerticalGap                      = 46
    UnderbarRuleThickness                    = 47
    UnderbarExtraDescender                   = 48
    RadicalVerticalGap                       = 49
    RadicalDisplayStyleVerticalGap           = 50
    RadicalRuleThickness                     = 51
    RadicalExtraAscender                     = 52
    RadicalKernBeforeDegree                  = 53
    RadicalKernAfterDegree                   = 54
    RadicalDegreeBottomRaisePercent          = 55
  end

  enum OtMathKernT : UInt32
    TopRight    = 0
    TopLeft     = 1
    BottomRight = 2
    BottomLeft  = 3
  end

  enum OtMetaTagT : UInt32
    DesignLanguages    = 1684827751
    SupportedLanguages = 1936485991
  end

  enum OtMetricsTagT : UInt32
    HorizontalAscender        = 1751216995
    HorizontalDescender       = 1751413603
    HorizontalLineGap         = 1751934832
    HorizontalClippingAscent  = 1751346273
    HorizontalClippingDescent = 1751346276
    VerticalAscender          = 1986098019
    VerticalDescender         = 1986294627
    VerticalLineGap           = 1986815856
    HorizontalCaretRise       = 1751347827
    HorizontalCaretRun        = 1751347822
    HorizontalCaretOffset     = 1751347046
    VerticalCaretRise         = 1986228851
    VerticalCaretRun          = 1986228846
    VerticalCaretOffset       = 1986228070
    XHeight                   = 2020108148
    CapHeight                 = 1668311156
    SubscriptEmXSize          = 1935833203
    SubscriptEmYSize          = 1935833459
    SubscriptEmXOffset        = 1935833199
    SubscriptEmYOffset        = 1935833455
    SuperscriptEmXSize        = 1936750707
    SuperscriptEmYSize        = 1936750963
    SuperscriptEmXOffset      = 1936750703
    SuperscriptEmYOffset      = 1936750959
    StrikeoutSize             = 1937011315
    StrikeoutOffset           = 1937011311
    UnderlineSize             = 1970168947
    UnderlineOffset           = 1970168943
  end

  enum ScriptT : UInt32
    Common                = 1517910393
    Inherited             = 1516858984
    Unknown               = 1517976186
    Arabic                = 1098015074
    Armenian              = 1098018158
    Bengali               = 1113943655
    Cyrillic              = 1132032620
    Devanagari            = 1147500129
    Georgian              = 1197830002
    Greek                 = 1198679403
    Gujarati              = 1198877298
    Gurmukhi              = 1198879349
    Hangul                = 1214344807
    Han                   = 1214344809
    Hebrew                = 1214603890
    Hiragana              = 1214870113
    Kannada               = 1265525857
    Katakana              = 1264676449
    Lao                   = 1281453935
    Latin                 = 1281455214
    Malayalam             = 1298954605
    Oriya                 = 1332902241
    Tamil                 = 1415671148
    Telugu                = 1415933045
    Thai                  = 1416126825
    Tibetan               = 1416192628
    Bopomofo              = 1114599535
    Braille               = 1114792297
    CanadianSyllabics     = 1130458739
    Cherokee              = 1130915186
    Ethiopic              = 1165256809
    Khmer                 = 1265134962
    Mongolian             = 1299148391
    Myanmar               = 1299803506
    Ogham                 = 1332175213
    Runic                 = 1383427698
    Sinhala               = 1399418472
    Syriac                = 1400468067
    Thaana                = 1416126817
    Yi                    = 1500080489
    Deseret               = 1148416628
    Gothic                = 1198486632
    OldItalic             = 1232363884
    Buhid                 = 1114990692
    Hanunoo               = 1214344815
    Tagalog               = 1416064103
    Tagbanwa              = 1415669602
    Cypriot               = 1131442804
    Limbu                 = 1281977698
    LinearB               = 1281977954
    Osmanya               = 1332964705
    Shavian               = 1399349623
    TaiLe                 = 1415670885
    Ugaritic              = 1432838514
    Buginese              = 1114990441
    Coptic                = 1131376756
    Glagolitic            = 1198285159
    Kharoshthi            = 1265131890
    NewTaiLue             = 1415670901
    OldPersian            = 1483761007
    SylotiNagri           = 1400466543
    Tifinagh              = 1415999079
    Balinese              = 1113681001
    Cuneiform             = 1483961720
    Nko                   = 1315663727
    PhagsPa               = 1349017959
    Phoenician            = 1349021304
    Carian                = 1130459753
    Cham                  = 1130914157
    KayahLi               = 1264675945
    Lepcha                = 1281716323
    Lycian                = 1283023721
    Lydian                = 1283023977
    OlChiki               = 1332503403
    Rejang                = 1382706791
    Saurashtra            = 1398895986
    Sundanese             = 1400204900
    Vai                   = 1449224553
    Avestan               = 1098281844
    Bamum                 = 1113681269
    EgyptianHieroglyphs   = 1164409200
    ImperialAramaic       = 1098018153
    InscriptionalPahlavi  = 1349020777
    InscriptionalParthian = 1349678185
    Javanese              = 1247901281
    Kaithi                = 1265920105
    Lisu                  = 1281979253
    MeeteiMayek           = 1299473769
    OldSouthArabian       = 1398895202
    OldTurkic             = 1332898664
    Samaritan             = 1398893938
    TaiTham               = 1281453665
    TaiViet               = 1415673460
    Batak                 = 1113683051
    Brahmi                = 1114792296
    Mandaic               = 1298230884
    Chakma                = 1130457965
    MeroiticCursive       = 1298494051
    MeroiticHieroglyphs   = 1298494063
    Miao                  = 1349284452
    Sharada               = 1399353956
    SoraSompeng           = 1399812705
    Takri                 = 1415670642
    BassaVah              = 1113682803
    CaucasianAlbanian     = 1097295970
    Duployan              = 1148547180
    Elbasan               = 1164730977
    Grantha               = 1198678382
    Khojki                = 1265135466
    Khudawadi             = 1399418468
    LinearA               = 1281977953
    Mahajani              = 1298229354
    Manichaean            = 1298230889
    MendeKikakui          = 1298493028
    Modi                  = 1299145833
    Mro                   = 1299345263
    Nabataean             = 1315070324
    OldNorthArabian       = 1315009122
    OldPermic             = 1348825709
    PahawhHmong           = 1215131239
    Palmyrene             = 1348562029
    PauCinHau             = 1348564323
    PsalterPahlavi        = 1349020784
    Siddham               = 1399415908
    Tirhuta               = 1416196712
    WarangCiti            = 1466004065
    Ahom                  = 1097363309
    AnatolianHieroglyphs  = 1215067511
    Hatran                = 1214346354
    Multani               = 1299541108
    OldHungarian          = 1215655527
    Signwriting           = 1399287415
    Adlam                 = 1097100397
    Bhaiksuki             = 1114139507
    Marchen               = 1298231907
    Osage                 = 1332963173
    Tangut                = 1415671399
    Newa                  = 1315272545
    MasaramGondi          = 1198485101
    Nushu                 = 1316186229
    Soyombo               = 1399814511
    ZanabazarSquare       = 1516334690
    Dogra                 = 1148151666
    GunjalaGondi          = 1198485095
    HanifiRohingya        = 1383032935
    Makasar               = 1298230113
    Medefaidrin           = 1298490470
    OldSogdian            = 1399809903
    Sogdian               = 1399809892
    Elymaic               = 1164736877
    Nandinagari           = 1315008100
    NyiakengPuachueHmong  = 1215131248
    Wancho                = 1466132591
    Chorasmian            = 1130918515
    DivesAkuru            = 1147756907
    KhitanSmallScript     = 1265202291
    Yezidi                = 1499822697
    CyproMinoan           = 1131441518
    OldUyghur             = 1333094258
    Tangsa                = 1416524641
    Toto                  = 1416590447
    Vithkuqi              = 1449751656
    Invalid               =          0
  end

  enum StyleTagT : UInt32
    Italic      = 1769234796
    OpticalSize = 1869640570
    SlantAngle  = 1936486004
    SlantRatio  = 1399615092
    Width       = 2003072104
    Weight      = 2003265652
  end

  enum UnicodeCombiningClassT : UInt32
    NotReordered       =   0
    Overlay            =   1
    Nukta              =   7
    KanaVoicing        =   8
    Virama             =   9
    Ccc10              =  10
    Ccc11              =  11
    Ccc12              =  12
    Ccc13              =  13
    Ccc14              =  14
    Ccc15              =  15
    Ccc16              =  16
    Ccc17              =  17
    Ccc18              =  18
    Ccc19              =  19
    Ccc20              =  20
    Ccc21              =  21
    Ccc22              =  22
    Ccc23              =  23
    Ccc24              =  24
    Ccc25              =  25
    Ccc26              =  26
    Ccc27              =  27
    Ccc28              =  28
    Ccc29              =  29
    Ccc30              =  30
    Ccc31              =  31
    Ccc32              =  32
    Ccc33              =  33
    Ccc34              =  34
    Ccc35              =  35
    Ccc36              =  36
    Ccc84              =  84
    Ccc91              =  91
    Ccc103             = 103
    Ccc107             = 107
    Ccc118             = 118
    Ccc122             = 122
    Ccc129             = 129
    Ccc130             = 130
    Ccc133             = 132
    AttachedBelowLeft  = 200
    AttachedBelow      = 202
    AttachedAbove      = 214
    AttachedAboveRight = 216
    BelowLeft          = 218
    Below              = 220
    BelowRight         = 222
    Left               = 224
    Right              = 226
    AboveLeft          = 228
    Above              = 230
    AboveRight         = 232
    DoubleBelow        = 233
    DoubleAbove        = 234
    IotaSubscript      = 240
    Invalid            = 255
  end

  enum UnicodeGeneralCategoryT : UInt32
    Control            =  0
    Format             =  1
    Unassigned         =  2
    PrivateUse         =  3
    Surrogate          =  4
    LowercaseLetter    =  5
    ModifierLetter     =  6
    OtherLetter        =  7
    TitlecaseLetter    =  8
    UppercaseLetter    =  9
    SpacingMark        = 10
    EnclosingMark      = 11
    NonSpacingMark     = 12
    DecimalNumber      = 13
    LetterNumber       = 14
    OtherNumber        = 15
    ConnectPunctuation = 16
    DashPunctuation    = 17
    ClosePunctuation   = 18
    FinalPunctuation   = 19
    InitialPunctuation = 20
    OtherPunctuation   = 21
    OpenPunctuation    = 22
    CurrencySymbol     = 23
    ModifierSymbol     = 24
    MathSymbol         = 25
    OtherSymbol        = 26
    LineSeparator      = 27
    ParagraphSeparator = 28
    SpaceSeparator     = 29
  end

  @[Flags]
  enum BufferDiffFlagsT : UInt32
    Equal               =   0
    ContentTypeMismatch =   1
    LengthMismatch      =   2
    NotdefPresent       =   4
    DottedCirclePresent =   8
    CodepointMismatch   =  16
    ClusterMismatch     =  32
    GlyphFlagsMismatch  =  64
    PositionMismatch    = 128

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibHarfBuzz.hb_gobject_buffer_diff_flags_get_type
    end
  end

  @[Flags]
  enum BufferFlagsT : UInt32
    Default                   =  0
    Bot                       =  1
    Eot                       =  2
    PreserveDefaultIgnorables =  4
    RemoveDefaultIgnorables   =  8
    DoNotInsertDottedCircle   = 16

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibHarfBuzz.hb_gobject_buffer_flags_get_type
    end
  end

  @[Flags]
  enum BufferSerializeFlagsT : UInt32
    Default      =  0
    NoClusters   =  1
    NoPositions  =  2
    NoGlyphNames =  4
    GlyphExtents =  8
    GlyphFlags   = 16
    NoAdvances   = 32

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibHarfBuzz.hb_gobject_buffer_serialize_flags_get_type
    end
  end

  @[Flags]
  enum GlyphFlagsT : UInt32
    UnsafeToBreak = 1
    Defined       = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibHarfBuzz.hb_gobject_glyph_flags_get_type
    end
  end

  @[Flags]
  enum OtColorPaletteFlagsT : UInt32
    Default                   = 0
    UsableWithLightBackground = 1
    UsableWithDarkBackground  = 2

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibHarfBuzz.hb_gobject_ot_color_palette_flags_get_type
    end
  end

  @[Flags]
  enum OtMathGlyphPartFlagsT : UInt32
    Extender = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibHarfBuzz.hb_gobject_ot_math_glyph_part_flags_get_type
    end
  end

  @[Flags]
  enum OtVarAxisFlagsT : UInt32
    Hidden = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibHarfBuzz.hb_gobject_ot_var_axis_flags_get_type
    end
  end

  extend self
end

# Extra includes
