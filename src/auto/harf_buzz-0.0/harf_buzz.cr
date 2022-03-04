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
  # Used when getting or setting AAT feature selectors. Indicates that
  # there is no selector index corresponding to the selector of interest.
  AAT_LAYOUT_NO_SELECTOR_INDEX = 65535
  # The default code point for replacing invalid characters in a given encoding.
  # Set to U+FFFD REPLACEMENT CHARACTER.
  BUFFER_REPLACEMENT_CODEPOINT_DEFAULT = 65533
  # Special setting for #hb_feature_t.start to apply the feature from the start
  # of the buffer.
  FEATURE_GLOBAL_START = 0
  # An unset #hb_language_t.
  LANGUAGE_INVALID = 0 # Interface constants not supported!
  # Unset #hb_map_t value.
  MAP_VALUE_INVALID = 4294967295_u32
  # Special value for language index indicating default or unsupported language.
  OT_LAYOUT_DEFAULT_LANGUAGE_INDEX = 65535
  # Special value for feature index indicating unsupported feature.
  OT_LAYOUT_NO_FEATURE_INDEX = 65535
  # Special value for script index indicating unsupported script.
  OT_LAYOUT_NO_SCRIPT_INDEX = 65535
  # Special value for variations index indicating unsupported variation.
  OT_LAYOUT_NO_VARIATIONS_INDEX = -1
  # Maximum number of OpenType tags that can correspond to a give #hb_language_t.
  OT_MAX_TAGS_PER_LANGUAGE = 3
  # Maximum number of OpenType tags that can correspond to a give #hb_script_t.
  OT_MAX_TAGS_PER_SCRIPT = 3
  # Do not use.
  OT_VAR_NO_AXIS_INDEX = -1
  # Unset #hb_set_t value.
  SET_VALUE_INVALID = 4294967295_u32
  # Maximum valid Unicode code point.
  UNICODE_MAX = 1114111
  # See Unicode 6.1 for details on the maximum decomposition length.
  UNICODE_MAX_DECOMPOSITION_LEN = 19
  # The major component of the library version available at compile-time.
  VERSION_MAJOR = 2
  # The micro component of the library version available at compile-time.
  VERSION_MICRO = 1
  # The minor component of the library version available at compile-time.
  VERSION_MINOR = 9
  # A string literal containing the library version available at compile-time.
  VERSION_STRING = "2.9.1"

  # Base class for all errors in this module.
  class HarfBuzzError < RuntimeError
    # :nodoc:
    def initialize(error : Pointer(LibGLib::Error))
      message_ptr = error.value.message
      super(String.new(message_ptr)) unless message_ptr.null?
      LibGLib.g_error_free(error)
    end
  end

  # Enums

  # The selectors defined for specifying AAT feature settings.
  enum AatLayoutFeatureSelectorT : UInt32
    # Initial, unset feature selector
    Invalid = 65535
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ALL_TYPOGRAPHIC
    AllTypeFeaturesOn = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ALL_TYPOGRAPHIC
    AllTypeFeaturesOff = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    RequiredLigaturesOn = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    RequiredLigaturesOff = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    CommonLigaturesOn = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    CommonLigaturesOff = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    RareLigaturesOn = 4
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    RareLigaturesOff = 5
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    LogosOn = 6
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    LogosOff = 7
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    RebusPicturesOn = 8
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    RebusPicturesOff = 9
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    DiphthongLigaturesOn = 10
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    DiphthongLigaturesOff = 11
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    SquaredLigaturesOn = 12
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    SquaredLigaturesOff = 13
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    AbbrevSquaredLigaturesOn = 14
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    AbbrevSquaredLigaturesOff = 15
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    SymbolLigaturesOn = 16
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    SymbolLigaturesOff = 17
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    ContextualLigaturesOn = 18
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    ContextualLigaturesOff = 19
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    HistoricalLigaturesOn = 20
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    HistoricalLigaturesOff = 21
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    Unconnected = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    PartiallyConnected = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
    Cursive = 2
    # Deprecated
    UpperAndLowerCase = 0
    # Deprecated
    AllCaps = 1
    # Deprecated
    AllLowerCase = 2
    # Deprecated
    SmallCaps = 3
    # Deprecated
    InitialCaps = 4
    # Deprecated
    InitialCapsAndSmallCaps = 5
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_SUBSTITUTION
    SubstituteVerticalFormsOn = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_SUBSTITUTION
    SubstituteVerticalFormsOff = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LINGUISTIC_REARRANGEMENT
    LinguisticRearrangementOn = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LINGUISTIC_REARRANGEMENT
    LinguisticRearrangementOff = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING
    MonospacedNumbers = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING
    ProportionalNumbers = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING
    ThirdWidthNumbers = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING
    QuarterWidthNumbers = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
    WordInitialSwashesOn = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
    WordInitialSwashesOff = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
    WordFinalSwashesOn = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
    WordFinalSwashesOff = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
    LineInitialSwashesOn = 4
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
    LineInitialSwashesOff = 5
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
    LineFinalSwashesOn = 6
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
    LineFinalSwashesOff = 7
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
    NonFinalSwashesOn = 8
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
    NonFinalSwashesOff = 9
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_DIACRITICS_TYPE
    ShowDiacritics = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_DIACRITICS_TYPE
    HideDiacritics = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_DIACRITICS_TYPE
    DecomposeDiacritics = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
    NormalPosition = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
    Superiors = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
    Inferiors = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
    Ordinals = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
    ScientificInferiors = 4
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_FRACTIONS
    NoFractions = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_FRACTIONS
    VerticalFractions = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_FRACTIONS
    DiagonalFractions = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_OVERLAPPING_CHARACTERS_TYPE
    PreventOverlapOn = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_OVERLAPPING_CHARACTERS_TYPE
    PreventOverlapOff = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
    HyphensToEmDashOn = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
    HyphensToEmDashOff = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
    HyphenToEnDashOn = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
    HyphenToEnDashOff = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
    SlashedZeroOn = 4
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
    SlashedZeroOff = 5
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
    FormInterrobangOn = 6
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
    FormInterrobangOff = 7
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
    SmartQuotesOn = 8
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
    SmartQuotesOff = 9
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
    PeriodsToEllipsisOn = 10
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
    PeriodsToEllipsisOff = 11
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
    HyphenToMinusOn = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
    HyphenToMinusOff = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
    AsteriskToMultiplyOn = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
    AsteriskToMultiplyOff = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
    SlashToDivideOn = 4
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
    SlashToDivideOff = 5
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
    InequalityLigaturesOn = 6
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
    InequalityLigaturesOff = 7
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
    ExponentsOn = 8
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
    ExponentsOff = 9
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
    MathematicalGreekOn = 10
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
    MathematicalGreekOff = 11
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
    NoOrnaments = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
    Dingbats = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
    PiCharacters = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
    Fleurons = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
    DecorativeBorders = 4
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
    InternationalSymbols = 5
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
    MathSymbols = 6
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_ALTERNATIVES
    NoAlternates = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
    DesignLevel1 = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
    DesignLevel2 = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
    DesignLevel3 = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
    DesignLevel4 = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
    DesignLevel5 = 4
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
    NoStyleOptions = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
    DisplayText = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
    EngravedText = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
    IlluminatedCaps = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
    TitlingCaps = 4
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
    TallCaps = 5
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
    TraditionalCharacters = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
    SimplifiedCharacters = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
    Jis1978Characters = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
    Jis1983Characters = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
    Jis1990Characters = 4
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
    TraditionalAltOne = 5
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
    TraditionalAltTwo = 6
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
    TraditionalAltThree = 7
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
    TraditionalAltFour = 8
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
    TraditionalAltFive = 9
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
    ExpertCharacters = 10
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
    Jis2004Characters = 11
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
    HojoCharacters = 12
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
    Nlccharacters = 13
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
    TraditionalNamesCharacters = 14
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_CASE
    LowerCaseNumbers = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_CASE
    UpperCaseNumbers = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
    ProportionalText = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
    MonospacedText = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
    HalfWidthText = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
    ThirdWidthText = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
    QuarterWidthText = 4
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
    AltProportionalText = 5
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
    AltHalfWidthText = 6
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
    NoTransliteration = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
    HanjaToHangul = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
    HiraganaToKatakana = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
    KatakanaToHiragana = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
    KanaToRomanization = 4
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
    RomanizationToHiragana = 5
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
    RomanizationToKatakana = 6
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
    HanjaToHangulAltOne = 7
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
    HanjaToHangulAltTwo = 8
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
    HanjaToHangulAltThree = 9
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
    NoAnnotation = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
    BoxAnnotation = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
    RoundedBoxAnnotation = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
    CircleAnnotation = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
    InvertedCircleAnnotation = 4
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
    ParenthesisAnnotation = 5
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
    PeriodAnnotation = 6
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
    RomanNumeralAnnotation = 7
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
    DiamondAnnotation = 8
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
    InvertedBoxAnnotation = 9
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
    InvertedRoundedBoxAnnotation = 10
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_KANA_SPACING_TYPE
    FullWidthKana = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_KANA_SPACING_TYPE
    ProportionalKana = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_SPACING_TYPE
    FullWidthIdeographs = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_SPACING_TYPE
    ProportionalIdeographs = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_SPACING_TYPE
    HalfWidthIdeographs = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
    CanonicalCompositionOn = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
    CanonicalCompositionOff = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
    CompatibilityCompositionOn = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
    CompatibilityCompositionOff = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
    TranscodingCompositionOn = 4
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
    TranscodingCompositionOff = 5
    # Deprecated; use #HB_AAT_LAYOUT_FEATURE_SELECTOR_RUBY_KANA_OFF instead
    NoRubyKana = 0
    # Deprecated; use #HB_AAT_LAYOUT_FEATURE_SELECTOR_RUBY_KANA_ON instead
    RubyKana = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_RUBY_KANA
    RubyKanaOn = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_RUBY_KANA
    RubyKanaOff = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
    NoCjkSymbolAlternatives = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
    CjkSymbolAltOne = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
    CjkSymbolAltTwo = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
    CjkSymbolAltThree = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
    CjkSymbolAltFour = 4
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
    CjkSymbolAltFive = 5
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
    NoIdeographicAlternatives = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
    IdeographicAltOne = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
    IdeographicAltTwo = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
    IdeographicAltThree = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
    IdeographicAltFour = 4
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
    IdeographicAltFive = 5
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_VERTICAL_ROMAN_PLACEMENT_TYPE
    CjkVerticalRomanCentered = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_VERTICAL_ROMAN_PLACEMENT_TYPE
    CjkVerticalRomanHbaseline = 1
    # Deprecated; use #HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_ITALIC_ROMAN_OFF instead
    NoCjkItalicRoman = 0
    # Deprecated; use #HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_ITALIC_ROMAN_ON instead
    CjkItalicRoman = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ITALIC_CJK_ROMAN
    CjkItalicRomanOn = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ITALIC_CJK_ROMAN
    CjkItalicRomanOff = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT
    CaseSensitiveLayoutOn = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT
    CaseSensitiveLayoutOff = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT
    CaseSensitiveSpacingOn = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT
    CaseSensitiveSpacingOff = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA
    AlternateHorizKanaOn = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA
    AlternateHorizKanaOff = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA
    AlternateVertKanaOn = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA
    AlternateVertKanaOff = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    NoStylisticAlternates = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltOneOn = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltOneOff = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltTwoOn = 4
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltTwoOff = 5
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltThreeOn = 6
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltThreeOff = 7
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltFourOn = 8
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltFourOff = 9
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltFiveOn = 10
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltFiveOff = 11
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltSixOn = 12
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltSixOff = 13
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltSevenOn = 14
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltSevenOff = 15
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltEightOn = 16
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltEightOff = 17
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltNineOn = 18
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltNineOff = 19
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltTenOn = 20
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltTenOff = 21
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltElevenOn = 22
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltElevenOff = 23
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltTwelveOn = 24
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltTwelveOff = 25
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltThirteenOn = 26
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltThirteenOff = 27
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltFourteenOn = 28
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltFourteenOff = 29
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltFifteenOn = 30
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltFifteenOff = 31
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltSixteenOn = 32
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltSixteenOff = 33
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltSeventeenOn = 34
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltSeventeenOff = 35
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltEighteenOn = 36
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltEighteenOff = 37
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltNineteenOn = 38
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltNineteenOff = 39
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltTwentyOn = 40
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
    StylisticAltTwentyOff = 41
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
    ContextualAlternatesOn = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
    ContextualAlternatesOff = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
    SwashAlternatesOn = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
    SwashAlternatesOff = 3
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
    ContextualSwashAlternatesOn = 4
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
    ContextualSwashAlternatesOff = 5
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LOWER_CASE
    DefaultLowerCase = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LOWER_CASE
    LowerCaseSmallCaps = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_LOWER_CASE
    LowerCasePetiteCaps = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_UPPER_CASE
    DefaultUpperCase = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_UPPER_CASE
    UpperCaseSmallCaps = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_UPPER_CASE
    UpperCasePetiteCaps = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE
    HalfWidthCjkRoman = 0
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE
    ProportionalCjkRoman = 1
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE
    DefaultCjkRoman = 2
    # for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE
    FullWidthCjkRoman = 3
  end

  # The possible feature types defined for AAT shaping, from Apple [Font Feature Registry](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html).
  enum AatLayoutFeatureTypeT : UInt32
    # Initial, unset feature type
    Invalid = 65535
    # [All Typographic Features](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type0)
    AllTypographic = 0
    # [Ligatures](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type1)
    Ligatures = 1
    # [Cursive Connection](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type2)
    CurisveConnection = 2
    # [Letter Case](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type3)
    LetterCase = 3
    # [Vertical Substitution](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type4)
    VerticalSubstitution = 4
    # [Linguistic Rearrangement](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type5)
    LinguisticRearrangement = 5
    # [Number Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type6)
    NumberSpacing = 6
    # [Smart Swash](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type8)
    SmartSwashType = 8
    # [Diacritics](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type9)
    DiacriticsType = 9
    # [Vertical Position](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type10)
    VerticalPosition = 10
    # [Fractions](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type11)
    Fractions = 11
    # [Overlapping Characters](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type13)
    OverlappingCharactersType = 13
    # [Typographic Extras](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type14)
    TypographicExtras = 14
    # [Mathematical Extras](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type15)
    MathematicalExtras = 15
    # [Ornament Sets](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type16)
    OrnamentSetsType = 16
    # [Character Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type17)
    CharacterAlternatives = 17
    # [Design Complexity](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type18)
    DesignComplexityType = 18
    # [Style Options](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type19)
    StyleOptions = 19
    # [Character Shape](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type20)
    CharacterShape = 20
    # [Number Case](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type21)
    NumberCase = 21
    # [Text Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type22)
    TextSpacing = 22
    # [Transliteration](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type23)
    Transliteration = 23
    # [Annotation](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type24)
    AnnotationType = 24
    # [Kana Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type25)
    KanaSpacingType = 25
    # [Ideographic Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type26)
    IdeographicSpacingType = 26
    # [Unicode Decomposition](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type27)
    UnicodeDecompositionType = 27
    # [Ruby Kana](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type28)
    RubyKana = 28
    # [CJK Symbol Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type29)
    CjkSymbolAlternativesType = 29
    # [Ideographic Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type30)
    IdeographicAlternativesType = 30
    # [CJK Vertical Roman Placement](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type31)
    CjkVerticalRomanPlacementType = 31
    # [Italic CJK Roman](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type32)
    ItalicCjkRoman = 32
    # [Case Sensitive Layout](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type33)
    CaseSensitiveLayout = 33
    # [Alternate Kana](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type34)
    AlternateKana = 34
    # [Stylistic Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type35)
    StylisticAlternatives = 35
    # [Contextual Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type36)
    ContextualAlternatives = 36
    # [Lower Case](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type37)
    LowerCase = 37
    # [Upper Case](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type38)
    UpperCase = 38
    # [Language Tag](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type39)
    LanguageTagType = 39
    # [CJK Roman Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type103)
    CjkRomanSpacingType = 103
  end

  # Data type for holding HarfBuzz's clustering behavior options. The cluster level
  # dictates one aspect of how HarfBuzz will treat non-base characters
  # during shaping.
  #
  # In @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES, non-base
  # characters are merged into the cluster of the base character that precedes them.
  #
  # In @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS, non-base characters are initially
  # assigned their own cluster values, which are not merged into preceding base
  # clusters. This allows HarfBuzz to perform additional operations like reorder
  # sequences of adjacent marks.
  #
  # @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES is the default, because it maintains
  # backward compatibility with older versions of HarfBuzz. New client programs that
  # do not need to maintain such backward compatibility are recommended to use
  # @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS instead of the default.
  enum BufferClusterLevelT : UInt32
    # Return cluster values grouped by graphemes into
    #   monotone order.
    MonotoneGraphemes = 0
    # Return cluster values grouped into monotone order.
    MonotoneCharacters = 1
    # Don't group cluster values.
    Characters = 2
    # Default cluster level,
    #   equal to @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES.
    Default = 0
  end

  # The type of #hb_buffer_t contents.
  enum BufferContentTypeT : UInt32
    # Initial value for new buffer.
    Invalid = 0
    # The buffer contains input characters (before shaping).
    Unicode = 1
    # The buffer contains output glyphs (after shaping).
    Glyphs = 2
  end

  # The buffer serialization and de-serialization format used in
  # hb_buffer_serialize_glyphs() and hb_buffer_deserialize_glyphs().
  enum BufferSerializeFormatT : UInt32
    # a human-readable, plain text format.
    Text = 1413830740
    # a machine-readable JSON format.
    Json = 1246973774
    # invalid format.
    Invalid = 0
  end

  # The direction of a text segment or buffer.
  #
  # A segment can also be tested for horizontal or vertical
  # orientation (irrespective of specific direction) with
  # HB_DIRECTION_IS_HORIZONTAL() or HB_DIRECTION_IS_VERTICAL().
  enum DirectionT : UInt32
    # Initial, unset direction.
    Invalid = 0
    # Text is set horizontally from left to right.
    Ltr = 4
    # Text is set horizontally from right to left.
    Rtl = 5
    # Text is set vertically from top to bottom.
    Ttb = 6
    # Text is set vertically from bottom to top.
    Btt = 7
  end

  # Data type holding the memory modes available to
  # client programs.
  #
  # Regarding these various memory-modes:
  #
  # - In no case shall the HarfBuzz client modify memory
  #   that is passed to HarfBuzz in a blob.  If there is
  #   any such possibility, @HB_MEMORY_MODE_DUPLICATE should be used
  #   such that HarfBuzz makes a copy immediately,
  #
  # - Use @HB_MEMORY_MODE_READONLY otherwise, unless you really really
  #   really know what you are doing,
  #
  # - @HB_MEMORY_MODE_WRITABLE is appropriate if you really made a
  #   copy of data solely for the purpose of passing to
  #   HarfBuzz and doing that just once (no reuse!),
  #
  # - If the font is mmap()ed, it's okay to use
  #   @HB_MEMORY_READONLY_MAY_MAKE_WRITABLE, however, using that mode
  #   correctly is very tricky.  Use @HB_MEMORY_MODE_READONLY instead.
  enum MemoryModeT : UInt32
    # HarfBuzz immediately makes a copy of the data.
    Duplicate = 0
    # HarfBuzz client will never modify the data,
    #     and HarfBuzz will never modify the data.
    Readonly = 1
    # HarfBuzz client made a copy of the data solely
    #     for HarfBuzz, so HarfBuzz may modify the data.
    Writable = 2
    # See above
    ReadonlyMayMakeWritable = 3
  end

  # Baseline tags from [Baseline Tags](https://docs.microsoft.com/en-us/typography/opentype/spec/baselinetags) registry.
  enum OtLayoutBaselineTagT : UInt32
    # The baseline used by alphabetic scripts such as Latin, Cyrillic and Greek.
    # In vertical writing mode, the alphabetic baseline for characters rotated 90 degrees clockwise.
    # (This would not apply to alphabetic characters that remain upright in vertical writing mode, since these
    # characters are not rotated.)
    Roman = 1919905134
    # The hanging baseline. In horizontal direction, this is the horizontal
    # line from which syllables seem, to hang in Tibetan and other similar scripts. In vertical writing mode,
    # for Tibetan (or some other similar script) characters rotated 90 degrees clockwise.
    Hanging = 1751215719
    # Ideographic character face bottom or left edge,
    # if the direction is horizontal or vertical, respectively.
    IdeoFaceBottomOrLeft = 1768121954
    # Ideographic character face top or right edge,
    # if the direction is horizontal or vertical, respectively.
    IdeoFaceTopOrRight = 1768121972
    # Ideographic em-box bottom or left edge,
    # if the direction is horizontal or vertical, respectively.
    IdeoEmboxBottomOrLeft = 1768187247
    # Ideographic em-box top or right edge baseline,
    # if the direction is horizontal or vertical, respectively.
    IdeoEmboxTopOrRight = 1768191088
    # The baseline about which mathematical characters are centered.
    # In vertical writing mode when mathematical characters rotated 90 degrees clockwise, are centered.
    Math = 1835103336
  end

  # The GDEF classes defined for glyphs.
  enum OtLayoutGlyphClassT : UInt32
    # Glyphs not matching the other classifications
    Unclassified = 0
    # Spacing, single characters, capable of accepting marks
    BaseGlyph = 1
    # Glyphs that represent ligation of multiple characters
    Ligature = 2
    # Non-spacing, combining glyphs that represent marks
    Mark = 3
    # Spacing glyphs that represent part of a single character
    Component = 4
  end

  # The 'MATH' table constants, refer to
  # [OpenType documentation](https://docs.microsoft.com/en-us/typography/opentype/spec/math#mathconstants-table)
  # For more explanations.
  enum OtMathConstantT : UInt32
    # scriptPercentScaleDown
    ScriptPercentScaleDown = 0
    # scriptScriptPercentScaleDown
    ScriptScriptPercentScaleDown = 1
    # delimitedSubFormulaMinHeight
    DelimitedSubFormulaMinHeight = 2
    # displayOperatorMinHeight
    DisplayOperatorMinHeight = 3
    # mathLeading
    MathLeading = 4
    # axisHeight
    AxisHeight = 5
    # accentBaseHeight
    AccentBaseHeight = 6
    # flattenedAccentBaseHeight
    FlattenedAccentBaseHeight = 7
    # subscriptShiftDown
    SubscriptShiftDown = 8
    # subscriptTopMax
    SubscriptTopMax = 9
    # subscriptBaselineDropMin
    SubscriptBaselineDropMin = 10
    # superscriptShiftUp
    SuperscriptShiftUp = 11
    # superscriptShiftUpCramped
    SuperscriptShiftUpCramped = 12
    # superscriptBottomMin
    SuperscriptBottomMin = 13
    # superscriptBaselineDropMax
    SuperscriptBaselineDropMax = 14
    # subSuperscriptGapMin
    SubSuperscriptGapMin = 15
    # superscriptBottomMaxWithSubscript
    SuperscriptBottomMaxWithSubscript = 16
    # spaceAfterScript
    SpaceAfterScript = 17
    # upperLimitGapMin
    UpperLimitGapMin = 18
    # upperLimitBaselineRiseMin
    UpperLimitBaselineRiseMin = 19
    # lowerLimitGapMin
    LowerLimitGapMin = 20
    # lowerLimitBaselineDropMin
    LowerLimitBaselineDropMin = 21
    # stackTopShiftUp
    StackTopShiftUp = 22
    # stackTopDisplayStyleShiftUp
    StackTopDisplayStyleShiftUp = 23
    # stackBottomShiftDown
    StackBottomShiftDown = 24
    # stackBottomDisplayStyleShiftDown
    StackBottomDisplayStyleShiftDown = 25
    # stackGapMin
    StackGapMin = 26
    # stackDisplayStyleGapMin
    StackDisplayStyleGapMin = 27
    # stretchStackTopShiftUp
    StretchStackTopShiftUp = 28
    # stretchStackBottomShiftDown
    StretchStackBottomShiftDown = 29
    # stretchStackGapAboveMin
    StretchStackGapAboveMin = 30
    # stretchStackGapBelowMin
    StretchStackGapBelowMin = 31
    # fractionNumeratorShiftUp
    FractionNumeratorShiftUp = 32
    # fractionNumeratorDisplayStyleShiftUp
    FractionNumeratorDisplayStyleShiftUp = 33
    # fractionDenominatorShiftDown
    FractionDenominatorShiftDown = 34
    # fractionDenominatorDisplayStyleShiftDown
    FractionDenominatorDisplayStyleShiftDown = 35
    # fractionNumeratorGapMin
    FractionNumeratorGapMin = 36
    # fractionNumDisplayStyleGapMin
    FractionNumDisplayStyleGapMin = 37
    # fractionRuleThickness
    FractionRuleThickness = 38
    # fractionDenominatorGapMin
    FractionDenominatorGapMin = 39
    # fractionDenomDisplayStyleGapMin
    FractionDenomDisplayStyleGapMin = 40
    # skewedFractionHorizontalGap
    SkewedFractionHorizontalGap = 41
    # skewedFractionVerticalGap
    SkewedFractionVerticalGap = 42
    # overbarVerticalGap
    OverbarVerticalGap = 43
    # overbarRuleThickness
    OverbarRuleThickness = 44
    # overbarExtraAscender
    OverbarExtraAscender = 45
    # underbarVerticalGap
    UnderbarVerticalGap = 46
    # underbarRuleThickness
    UnderbarRuleThickness = 47
    # underbarExtraDescender
    UnderbarExtraDescender = 48
    # radicalVerticalGap
    RadicalVerticalGap = 49
    # radicalDisplayStyleVerticalGap
    RadicalDisplayStyleVerticalGap = 50
    # radicalRuleThickness
    RadicalRuleThickness = 51
    # radicalExtraAscender
    RadicalExtraAscender = 52
    # radicalKernBeforeDegree
    RadicalKernBeforeDegree = 53
    # radicalKernAfterDegree
    RadicalKernAfterDegree = 54
    # radicalDegreeBottomRaisePercent
    RadicalDegreeBottomRaisePercent = 55
  end

  # The math kerning-table types defined for the four corners
  # of a glyph.
  enum OtMathKernT : UInt32
    # The top right corner of the glyph.
    TopRight = 0
    # The top left corner of the glyph.
    TopLeft = 1
    # The bottom right corner of the glyph.
    BottomRight = 2
    # The bottom left corner of the glyph.
    BottomLeft = 3
  end

  # Known metadata tags from https://docs.microsoft.com/en-us/typography/opentype/spec/meta
  enum OtMetaTagT : UInt32
    # Design languages. Text, using only
    # Basic Latin (ASCII) characters. Indicates languages and/or scripts
    # for the user audiences that the font was primarily designed for.
    DesignLanguages = 1684827751
    # Supported languages. Text, using
    # only Basic Latin (ASCII) characters. Indicates languages and/or scripts
    # that the font is declared to be capable of supporting.
    SupportedLanguages = 1936485991
  end

  # Metric tags corresponding to [MVAR Value
  # Tags](https://docs.microsoft.com/en-us/typography/opentype/spec/mvar#value-tags)
  enum OtMetricsTagT : UInt32
    # horizontal ascender.
    HorizontalAscender = 1751216995
    # horizontal descender.
    HorizontalDescender = 1751413603
    # horizontal line gap.
    HorizontalLineGap = 1751934832
    # horizontal clipping ascent.
    HorizontalClippingAscent = 1751346273
    # horizontal clipping descent.
    HorizontalClippingDescent = 1751346276
    # vertical ascender.
    VerticalAscender = 1986098019
    # vertical descender.
    VerticalDescender = 1986294627
    # vertical line gap.
    VerticalLineGap = 1986815856
    # horizontal caret rise.
    HorizontalCaretRise = 1751347827
    # horizontal caret run.
    HorizontalCaretRun = 1751347822
    # horizontal caret offset.
    HorizontalCaretOffset = 1751347046
    # vertical caret rise.
    VerticalCaretRise = 1986228851
    # vertical caret run.
    VerticalCaretRun = 1986228846
    # vertical caret offset.
    VerticalCaretOffset = 1986228070
    # x height.
    XHeight = 2020108148
    # cap height.
    CapHeight = 1668311156
    # subscript em x size.
    SubscriptEmXSize = 1935833203
    # subscript em y size.
    SubscriptEmYSize = 1935833459
    # subscript em x offset.
    SubscriptEmXOffset = 1935833199
    # subscript em y offset.
    SubscriptEmYOffset = 1935833455
    # superscript em x size.
    SuperscriptEmXSize = 1936750707
    # superscript em y size.
    SuperscriptEmYSize = 1936750963
    # superscript em x offset.
    SuperscriptEmXOffset = 1936750703
    # superscript em y offset.
    SuperscriptEmYOffset = 1936750959
    # strikeout size.
    StrikeoutSize = 1937011315
    # strikeout offset.
    StrikeoutOffset = 1937011311
    # underline size.
    UnderlineSize = 1970168947
    # underline offset.
    UnderlineOffset = 1970168943
  end

  # Data type for scripts. Each #hb_script_t's value is an #hb_tag_t corresponding
  # to the four-letter values defined by [ISO 15924](https://unicode.org/iso15924/).
  #
  # See also the Script (sc) property of the Unicode Character Database.
  enum ScriptT : UInt32
    # `Zyyy`
    Common = 1517910393
    # `Zinh`
    Inherited = 1516858984
    # `Zzzz`
    Unknown = 1517976186
    # `Arab`
    Arabic = 1098015074
    # `Armn`
    Armenian = 1098018158
    # `Beng`
    Bengali = 1113943655
    # `Cyrl`
    Cyrillic = 1132032620
    # `Deva`
    Devanagari = 1147500129
    # `Geor`
    Georgian = 1197830002
    # `Grek`
    Greek = 1198679403
    # `Gujr`
    Gujarati = 1198877298
    # `Guru`
    Gurmukhi = 1198879349
    # `Hang`
    Hangul = 1214344807
    # `Hani`
    Han = 1214344809
    # `Hebr`
    Hebrew = 1214603890
    # `Hira`
    Hiragana = 1214870113
    # `Knda`
    Kannada = 1265525857
    # `Kana`
    Katakana = 1264676449
    # `Laoo`
    Lao = 1281453935
    # `Latn`
    Latin = 1281455214
    # `Mlym`
    Malayalam = 1298954605
    # `Orya`
    Oriya = 1332902241
    # `Taml`
    Tamil = 1415671148
    # `Telu`
    Telugu = 1415933045
    # `Thai`
    Thai = 1416126825
    # `Tibt`
    Tibetan = 1416192628
    # `Bopo`
    Bopomofo = 1114599535
    # `Brai`
    Braille = 1114792297
    # `Cans`
    CanadianSyllabics = 1130458739
    # `Cher`
    Cherokee = 1130915186
    # `Ethi`
    Ethiopic = 1165256809
    # `Khmr`
    Khmer = 1265134962
    # `Mong`
    Mongolian = 1299148391
    # `Mymr`
    Myanmar = 1299803506
    # `Ogam`
    Ogham = 1332175213
    # `Runr`
    Runic = 1383427698
    # `Sinh`
    Sinhala = 1399418472
    # `Syrc`
    Syriac = 1400468067
    # `Thaa`
    Thaana = 1416126817
    # `Yiii`
    Yi = 1500080489
    # `Dsrt`
    Deseret = 1148416628
    # `Goth`
    Gothic = 1198486632
    # `Ital`
    OldItalic = 1232363884
    # `Buhd`
    Buhid = 1114990692
    # `Hano`
    Hanunoo = 1214344815
    # `Tglg`
    Tagalog = 1416064103
    # `Tagb`
    Tagbanwa = 1415669602
    # `Cprt`
    Cypriot = 1131442804
    # `Limb`
    Limbu = 1281977698
    # `Linb`
    LinearB = 1281977954
    # `Osma`
    Osmanya = 1332964705
    # `Shaw`
    Shavian = 1399349623
    # `Tale`
    TaiLe = 1415670885
    # `Ugar`
    Ugaritic = 1432838514
    # `Bugi`
    Buginese = 1114990441
    # `Copt`
    Coptic = 1131376756
    # `Glag`
    Glagolitic = 1198285159
    # `Khar`
    Kharoshthi = 1265131890
    # `Talu`
    NewTaiLue = 1415670901
    # `Xpeo`
    OldPersian = 1483761007
    # `Sylo`
    SylotiNagri = 1400466543
    # `Tfng`
    Tifinagh = 1415999079
    # `Bali`
    Balinese = 1113681001
    # `Xsux`
    Cuneiform = 1483961720
    # `Nkoo`
    Nko = 1315663727
    # `Phag`
    PhagsPa = 1349017959
    # `Phnx`
    Phoenician = 1349021304
    # `Cari`
    Carian = 1130459753
    # `Cham`
    Cham = 1130914157
    # `Kali`
    KayahLi = 1264675945
    # `Lepc`
    Lepcha = 1281716323
    # `Lyci`
    Lycian = 1283023721
    # `Lydi`
    Lydian = 1283023977
    # `Olck`
    OlChiki = 1332503403
    # `Rjng`
    Rejang = 1382706791
    # `Saur`
    Saurashtra = 1398895986
    # `Sund`
    Sundanese = 1400204900
    # `Vaii`
    Vai = 1449224553
    # `Avst`
    Avestan = 1098281844
    # `Bamu`
    Bamum = 1113681269
    # `Egyp`
    EgyptianHieroglyphs = 1164409200
    # `Armi`
    ImperialAramaic = 1098018153
    # `Phli`
    InscriptionalPahlavi = 1349020777
    # `Prti`
    InscriptionalParthian = 1349678185
    # `Java`
    Javanese = 1247901281
    # `Kthi`
    Kaithi = 1265920105
    # `Lisu`
    Lisu = 1281979253
    # `Mtei`
    MeeteiMayek = 1299473769
    # `Sarb`
    OldSouthArabian = 1398895202
    # `Orkh`
    OldTurkic = 1332898664
    # `Samr`
    Samaritan = 1398893938
    # `Lana`
    TaiTham = 1281453665
    # `Tavt`
    TaiViet = 1415673460
    # `Batk`
    Batak = 1113683051
    # `Brah`
    Brahmi = 1114792296
    # `Mand`
    Mandaic = 1298230884
    # `Cakm`
    Chakma = 1130457965
    # `Merc`
    MeroiticCursive = 1298494051
    # `Mero`
    MeroiticHieroglyphs = 1298494063
    # `Plrd`
    Miao = 1349284452
    # `Shrd`
    Sharada = 1399353956
    # `Sora`
    SoraSompeng = 1399812705
    # `Takr`
    Takri = 1415670642
    # `Bass`, Since: 0.9.30
    BassaVah = 1113682803
    # `Aghb`, Since: 0.9.30
    CaucasianAlbanian = 1097295970
    # `Dupl`, Since: 0.9.30
    Duployan = 1148547180
    # `Elba`, Since: 0.9.30
    Elbasan = 1164730977
    # `Gran`, Since: 0.9.30
    Grantha = 1198678382
    # `Khoj`, Since: 0.9.30
    Khojki = 1265135466
    # `Sind`, Since: 0.9.30
    Khudawadi = 1399418468
    # `Lina`, Since: 0.9.30
    LinearA = 1281977953
    # `Mahj`, Since: 0.9.30
    Mahajani = 1298229354
    # `Mani`, Since: 0.9.30
    Manichaean = 1298230889
    # `Mend`, Since: 0.9.30
    MendeKikakui = 1298493028
    # `Modi`, Since: 0.9.30
    Modi = 1299145833
    # `Mroo`, Since: 0.9.30
    Mro = 1299345263
    # `Nbat`, Since: 0.9.30
    Nabataean = 1315070324
    # `Narb`, Since: 0.9.30
    OldNorthArabian = 1315009122
    # `Perm`, Since: 0.9.30
    OldPermic = 1348825709
    # `Hmng`, Since: 0.9.30
    PahawhHmong = 1215131239
    # `Palm`, Since: 0.9.30
    Palmyrene = 1348562029
    # `Pauc`, Since: 0.9.30
    PauCinHau = 1348564323
    # `Phlp`, Since: 0.9.30
    PsalterPahlavi = 1349020784
    # `Sidd`, Since: 0.9.30
    Siddham = 1399415908
    # `Tirh`, Since: 0.9.30
    Tirhuta = 1416196712
    # `Wara`, Since: 0.9.30
    WarangCiti = 1466004065
    # `Ahom`, Since: 0.9.30
    Ahom = 1097363309
    # `Hluw`, Since: 0.9.30
    AnatolianHieroglyphs = 1215067511
    # `Hatr`, Since: 0.9.30
    Hatran = 1214346354
    # `Mult`, Since: 0.9.30
    Multani = 1299541108
    # `Hung`, Since: 0.9.30
    OldHungarian = 1215655527
    # `Sgnw`, Since: 0.9.30
    Signwriting = 1399287415
    # `Adlm`, Since: 1.3.0
    Adlam = 1097100397
    # `Bhks`, Since: 1.3.0
    Bhaiksuki = 1114139507
    # `Marc`, Since: 1.3.0
    Marchen = 1298231907
    # `Osge`, Since: 1.3.0
    Osage = 1332963173
    # `Tang`, Since: 1.3.0
    Tangut = 1415671399
    # `Newa`, Since: 1.3.0
    Newa = 1315272545
    # `Gonm`, Since: 1.6.0
    MasaramGondi = 1198485101
    # `Nshu`, Since: 1.6.0
    Nushu = 1316186229
    # `Soyo`, Since: 1.6.0
    Soyombo = 1399814511
    # `Zanb`, Since: 1.6.0
    ZanabazarSquare = 1516334690
    # `Dogr`, Since: 1.8.0
    Dogra = 1148151666
    # `Gong`, Since: 1.8.0
    GunjalaGondi = 1198485095
    # `Rohg`, Since: 1.8.0
    HanifiRohingya = 1383032935
    # `Maka`, Since: 1.8.0
    Makasar = 1298230113
    # `Medf`, Since: 1.8.0
    Medefaidrin = 1298490470
    # `Sogo`, Since: 1.8.0
    OldSogdian = 1399809903
    # `Sogd`, Since: 1.8.0
    Sogdian = 1399809892
    # `Elym`, Since: 2.4.0
    Elymaic = 1164736877
    # `Nand`, Since: 2.4.0
    Nandinagari = 1315008100
    # `Hmnp`, Since: 2.4.0
    NyiakengPuachueHmong = 1215131248
    # `Wcho`, Since: 2.4.0
    Wancho = 1466132591
    # `Chrs`, Since: 2.6.7
    Chorasmian = 1130918515
    # `Diak`, Since: 2.6.7
    DivesAkuru = 1147756907
    # `Kits`, Since: 2.6.7
    KhitanSmallScript = 1265202291
    # `Yezi`, Since: 2.6.7
    Yezidi = 1499822697
    # No script set
    Invalid = 0
  end

  # Data type for the Canonical_Combining_Class (ccc) property
  # from the Unicode Character Database.
  #
  # <note>Note: newer versions of Unicode may add new values.
  # Client programs should be ready to handle any value in the 0..254 range
  # being returned from hb_unicode_combining_class().</note>
  enum UnicodeCombiningClassT : UInt32
    # Spacing and enclosing marks; also many vowel and consonant signs, even if nonspacing
    NotReordered = 0
    # Marks which overlay a base letter or symbol
    Overlay = 1
    # Diacritic nukta marks in Brahmi-derived scripts
    Nukta = 7
    # Hiragana/Katakana voicing marks
    KanaVoicing = 8
    # Viramas
    Virama = 9
    # [Hebrew]
    Ccc10 = 10
    # [Hebrew]
    Ccc11 = 11
    # [Hebrew]
    Ccc12 = 12
    # [Hebrew]
    Ccc13 = 13
    # [Hebrew]
    Ccc14 = 14
    # [Hebrew]
    Ccc15 = 15
    # [Hebrew]
    Ccc16 = 16
    # [Hebrew]
    Ccc17 = 17
    # [Hebrew]
    Ccc18 = 18
    # [Hebrew]
    Ccc19 = 19
    # [Hebrew]
    Ccc20 = 20
    # [Hebrew]
    Ccc21 = 21
    # [Hebrew]
    Ccc22 = 22
    # [Hebrew]
    Ccc23 = 23
    # [Hebrew]
    Ccc24 = 24
    # [Hebrew]
    Ccc25 = 25
    # [Hebrew]
    Ccc26 = 26
    # [Arabic]
    Ccc27 = 27
    # [Arabic]
    Ccc28 = 28
    # [Arabic]
    Ccc29 = 29
    # [Arabic]
    Ccc30 = 30
    # [Arabic]
    Ccc31 = 31
    # [Arabic]
    Ccc32 = 32
    # [Arabic]
    Ccc33 = 33
    # [Arabic]
    Ccc34 = 34
    # [Arabic]
    Ccc35 = 35
    # [Syriac]
    Ccc36 = 36
    # [Telugu]
    Ccc84 = 84
    # [Telugu]
    Ccc91 = 91
    # [Thai]
    Ccc103 = 103
    # [Thai]
    Ccc107 = 107
    # [Lao]
    Ccc118 = 118
    # [Lao]
    Ccc122 = 122
    # [Tibetan]
    Ccc129 = 129
    # [Tibetan]
    Ccc130 = 130
    # [Tibetan]
    Ccc133 = 132
    # Marks attached at the bottom left
    AttachedBelowLeft = 200
    # Marks attached directly below
    AttachedBelow = 202
    # Marks attached directly above
    AttachedAbove = 214
    # Marks attached at the top right
    AttachedAboveRight = 216
    # Distinct marks at the bottom left
    BelowLeft = 218
    # Distinct marks directly below
    Below = 220
    # Distinct marks at the bottom right
    BelowRight = 222
    # Distinct marks to the left
    Left = 224
    # Distinct marks to the right
    Right = 226
    # Distinct marks at the top left
    AboveLeft = 228
    # Distinct marks directly above
    Above = 230
    # Distinct marks at the top right
    AboveRight = 232
    # Distinct marks subtending two bases
    DoubleBelow = 233
    # Distinct marks extending above two bases
    DoubleAbove = 234
    # Greek iota subscript only
    IotaSubscript = 240
    # Invalid combining class
    Invalid = 255
  end

  # Data type for the "General_Category" (gc) property from
  # the Unicode Character Database.
  enum UnicodeGeneralCategoryT : UInt32
    # [Cc]
    Control = 0
    # [Cf]
    Format = 1
    # [Cn]
    Unassigned = 2
    # [Co]
    PrivateUse = 3
    # [Cs]
    Surrogate = 4
    # [Ll]
    LowercaseLetter = 5
    # [Lm]
    ModifierLetter = 6
    # [Lo]
    OtherLetter = 7
    # [Lt]
    TitlecaseLetter = 8
    # [Lu]
    UppercaseLetter = 9
    # [Mc]
    SpacingMark = 10
    # [Me]
    EnclosingMark = 11
    # [Mn]
    NonSpacingMark = 12
    # [Nd]
    DecimalNumber = 13
    # [Nl]
    LetterNumber = 14
    # [No]
    OtherNumber = 15
    # [Pc]
    ConnectPunctuation = 16
    # [Pd]
    DashPunctuation = 17
    # [Pe]
    ClosePunctuation = 18
    # [Pf]
    FinalPunctuation = 19
    # [Pi]
    InitialPunctuation = 20
    # [Po]
    OtherPunctuation = 21
    # [Ps]
    OpenPunctuation = 22
    # [Sc]
    CurrencySymbol = 23
    # [Sk]
    ModifierSymbol = 24
    # [Sm]
    MathSymbol = 25
    # [So]
    OtherSymbol = 26
    # [Zl]
    LineSeparator = 27
    # [Zp]
    ParagraphSeparator = 28
    # [Zs]
    SpaceSeparator = 29
  end

  # Flags
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

  # Errors

  # :nodoc:
  def raise_exception(error : Pointer(LibGLib::Error))
    GObject.raise_exception(error)
  end

  extend self
end

# Extra includes
