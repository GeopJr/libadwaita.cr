# Dependencies
require "../g_object-2.0/g_object.cr"

# C lib declaration
require "./lib_harf_buzz.cr"

# Wrappers
require "./aat_layout_feature_selector_info_t.cr"
require "./blob_t.cr"
require "./buffer_t.cr"
require "./draw_funcs_t.cr"
require "./draw_state_t.cr"
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
require "./ot_math_kern_entry_t.cr"
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
  VERSION_MAJOR                 =  4
  VERSION_MICRO                 =  1
  VERSION_MINOR                 =  2
  VERSION_STRING                = "4.2.1"

  # Callbacks

  # A callback method for #hb_buffer_t. The method gets called with the
  # #hb_buffer_t it was set on, the #hb_font_t the buffer is shaped with and a
  # message describing what step of the shaping process will be performed.
  # Returning %false from this method will skip this shaping step and move to
  # the next one.
  alias BufferMessageFuncT = Proc(HarfBuzz::BufferT, HarfBuzz::FontT, ::String, Int32)

  # A virtual method for destroy user-data callbacks.
  alias DestroyFuncT = Proc(Nil)

  # A virtual method for the #hb_draw_funcs_t to perform a "close-path" draw
  # operation.
  alias DrawClosePathFuncT = Proc(HarfBuzz::DrawFuncsT, Pointer(Void)?, HarfBuzz::DrawStateT, Nil)

  # A virtual method for the #hb_draw_funcs_t to perform a "cubic-to" draw
  # operation.
  alias DrawCubicToFuncT = Proc(HarfBuzz::DrawFuncsT, Pointer(Void)?, HarfBuzz::DrawStateT, Float32, Float32, Float32, Float32, Float32, Float32, Nil)

  # A virtual method for the #hb_draw_funcs_t to perform a "line-to" draw
  # operation.
  alias DrawLineToFuncT = Proc(HarfBuzz::DrawFuncsT, Pointer(Void)?, HarfBuzz::DrawStateT, Float32, Float32, Nil)

  # A virtual method for the #hb_draw_funcs_t to perform a "move-to" draw
  # operation.
  alias DrawMoveToFuncT = Proc(HarfBuzz::DrawFuncsT, Pointer(Void)?, HarfBuzz::DrawStateT, Float32, Float32, Nil)

  # A virtual method for the #hb_draw_funcs_t to perform a "quadratic-to" draw
  # operation.
  alias DrawQuadraticToFuncT = Proc(HarfBuzz::DrawFuncsT, Pointer(Void)?, HarfBuzz::DrawStateT, Float32, Float32, Float32, Float32, Nil)

  # This method should retrieve the extents for a font.
  alias FontGetFontExtentsFuncT = Proc(HarfBuzz::FontT, Pointer(Void)?, HarfBuzz::FontExtentsT, Int32)

  # A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  #
  # This method should retrieve the advance for a specified glyph. The
  # method must return an #hb_position_t.
  alias FontGetGlyphAdvanceFuncT = Proc(HarfBuzz::FontT, Pointer(Void)?, UInt32, Int32)

  # A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  #
  # This method should retrieve the advances for a sequence of glyphs.
  alias FontGetGlyphAdvancesFuncT = Proc(HarfBuzz::FontT, Pointer(Void)?, UInt32, Pointer(UInt32), UInt32, Int32, UInt32, Nil)

  # A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  #
  # This method should retrieve the (X,Y) coordinates (in font units) for a
  # specified contour point in a glyph. Each coordinate must be returned as
  # an #hb_position_t output parameter.
  alias FontGetGlyphContourPointFuncT = Proc(HarfBuzz::FontT, Pointer(Void)?, UInt32, UInt32, Int32, Int32, Int32)

  # A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  #
  # This method should retrieve the extents for a specified glyph. Extents must be
  # returned in an #hb_glyph_extents output parameter.
  alias FontGetGlyphExtentsFuncT = Proc(HarfBuzz::FontT, Pointer(Void)?, UInt32, HarfBuzz::GlyphExtentsT, Int32)

  # A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  #
  # This method should retrieve the glyph ID that corresponds to a glyph-name
  # string.
  alias FontGetGlyphFromNameFuncT = Proc(HarfBuzz::FontT, Pointer(Void)?, Enumerable(::String), Int32, UInt32, Int32)

  # A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  #
  # This method should retrieve the glyph ID for a specified Unicode code point
  # font, with an optional variation selector.
  alias FontGetGlyphFuncT = Proc(HarfBuzz::FontT, Pointer(Void)?, UInt32, UInt32, UInt32, Int32)

  # This method should retrieve the kerning-adjustment value for a glyph-pair in
  # the specified font, for horizontal text segments.
  alias FontGetGlyphKerningFuncT = Proc(HarfBuzz::FontT, Pointer(Void)?, UInt32, UInt32, Int32)

  # A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  #
  # This method should retrieve the glyph name that corresponds to a
  # glyph ID. The name should be returned in a string output parameter.
  alias FontGetGlyphNameFuncT = Proc(HarfBuzz::FontT, Pointer(Void)?, UInt32, Enumerable(::String), UInt32, Int32)

  # A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  #
  # This method should retrieve the (X,Y) coordinates (in font units) of the
  # origin for a glyph. Each coordinate must be returned in an #hb_position_t
  # output parameter.
  alias FontGetGlyphOriginFuncT = Proc(HarfBuzz::FontT, Pointer(Void)?, UInt32, Int32, Int32, Int32)

  # A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  alias FontGetGlyphShapeFuncT = Proc(HarfBuzz::FontT, Pointer(Void)?, UInt32, HarfBuzz::DrawFuncsT, Pointer(Void)?, Nil)

  # A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  #
  # This method should retrieve the nominal glyph ID for a specified Unicode code
  # point. Glyph IDs must be returned in a #hb_codepoint_t output parameter.
  alias FontGetNominalGlyphFuncT = Proc(HarfBuzz::FontT, Pointer(Void)?, UInt32, UInt32, Int32)

  # A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  #
  # This method should retrieve the nominal glyph IDs for a sequence of
  # Unicode code points. Glyph IDs must be returned in a #hb_codepoint_t
  # output parameter.
  alias FontGetNominalGlyphsFuncT = Proc(HarfBuzz::FontT, Pointer(Void)?, UInt32, Pointer(UInt32), UInt32, UInt32, UInt32, UInt32)

  # A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  #
  # This method should retrieve the glyph ID for a specified Unicode code point
  # followed by a specified Variation Selector code point. Glyph IDs must be
  # returned in a #hb_codepoint_t output parameter.
  alias FontGetVariationGlyphFuncT = Proc(HarfBuzz::FontT, Pointer(Void)?, UInt32, UInt32, UInt32, Int32)

  # Callback function for hb_face_create_for_tables().
  alias ReferenceTableFuncT = Proc(HarfBuzz::FaceT, UInt32, HarfBuzz::BlobT)

  # A virtual method for the #hb_unicode_funcs_t structure.
  #
  # This method should retrieve the Canonical Combining Class (ccc)
  # property for a specified Unicode code point.
  alias UnicodeCombiningClassFuncT = Proc(HarfBuzz::UnicodeFuncsT, UInt32, HarfBuzz::UnicodeCombiningClassT)

  # A virtual method for the #hb_unicode_funcs_t structure.
  #
  # This method should compose a sequence of two input Unicode code
  # points by canonical equivalence, returning the composed code
  # point in a #hb_codepoint_t output parameter (if successful).
  # The method must return an #hb_bool_t indicating the success
  # of the composition.
  alias UnicodeComposeFuncT = Proc(HarfBuzz::UnicodeFuncsT, UInt32, UInt32, UInt32, Int32)

  # Fully decompose @u to its Unicode compatibility decomposition. The codepoints of the decomposition will be written to @decomposed.
  # The complete length of the decomposition will be returned.
  #
  # If @u has no compatibility decomposition, zero should be returned.
  #
  # The Unicode standard guarantees that a buffer of length #HB_UNICODE_MAX_DECOMPOSITION_LEN codepoints will always be sufficient for any
  # compatibility decomposition plus an terminating value of 0.  Consequently, @decompose must be allocated by the caller to be at least this length.  Implementations
  # of this function type must ensure that they do not write past the provided array.
  alias UnicodeDecomposeCompatibilityFuncT = Proc(HarfBuzz::UnicodeFuncsT, UInt32, Pointer(UInt32), UInt32)

  # A virtual method for the #hb_unicode_funcs_t structure.
  #
  # This method should decompose an input Unicode code point,
  # returning the two decomposed code points in #hb_codepoint_t
  # output parameters (if successful). The method must return an
  # #hb_bool_t indicating the success of the composition.
  alias UnicodeDecomposeFuncT = Proc(HarfBuzz::UnicodeFuncsT, UInt32, UInt32, UInt32, Int32)

  # A virtual method for the #hb_unicode_funcs_t structure.
  alias UnicodeEastasianWidthFuncT = Proc(HarfBuzz::UnicodeFuncsT, UInt32, UInt32)

  # A virtual method for the #hb_unicode_funcs_t structure.
  #
  # This method should retrieve the General Category property for
  # a specified Unicode code point.
  alias UnicodeGeneralCategoryFuncT = Proc(HarfBuzz::UnicodeFuncsT, UInt32, HarfBuzz::UnicodeGeneralCategoryT)

  # A virtual method for the #hb_unicode_funcs_t structure.
  #
  # This method should retrieve the Bi-Directional Mirroring Glyph
  # code point for a specified Unicode code point.
  #
  # <note>Note: If a code point does not have a specified
  # Bi-Directional Mirroring Glyph defined, the method should
  # return the original code point.</note>
  alias UnicodeMirroringFuncT = Proc(HarfBuzz::UnicodeFuncsT, UInt32, UInt32)

  # A virtual method for the #hb_unicode_funcs_t structure.
  #
  # This method should retrieve the Script property for a
  # specified Unicode code point.
  alias UnicodeScriptFuncT = Proc(HarfBuzz::UnicodeFuncsT, UInt32, HarfBuzz::ScriptT)

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
    # The center of the ideographic character face. Since: 4.0.0
    IdeoFaceCentral = 1231251043
    # Ideographic em-box bottom or left edge,
    # if the direction is horizontal or vertical, respectively.
    IdeoEmboxBottomOrLeft = 1768187247
    # Ideographic em-box top or right edge baseline,
    IdeoEmboxTopOrRight = 1768191088
    # The center of the ideographic em-box. Since: 4.0.0
    # if the direction is horizontal or vertical, respectively.
    IdeoEmboxCentral = 1231315813
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
    # `Cpmn`, Since: 3.0.0
    CyproMinoan = 1131441518
    # `Ougr`, Since: 3.0.0
    OldUyghur = 1333094258
    # `Tnsa`, Since: 3.0.0
    Tangsa = 1416524641
    # `Toto`, Since: 3.0.0
    Toto = 1416590447
    # `Vith`, Since: 3.0.0
    Vithkuqi = 1449751656
    # `Zmth`, Since: 3.4.0
    Math = 1517122664
    # No script set
    Invalid = 0
  end

  # Defined by [OpenType Design-Variation Axis Tag Registry](https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg).
  enum StyleTagT : UInt32
    # Used to vary between non-italic and italic.
    # A value of 0 can be interpreted as "Roman" (non-italic); a value of 1 can
    # be interpreted as (fully) italic.
    Italic = 1769234796
    # Used to vary design to suit different text sizes.
    # Non-zero. Values can be interpreted as text size, in points.
    OpticalSize = 1869640570
    # Used to vary between upright and slanted text. Values
    # must be greater than -90 and less than +90. Values can be interpreted as
    # the angle, in counter-clockwise degrees, of oblique slant from whatever the
    # designer considers to be upright for that font design. Typical right-leaning
    # Italic fonts have a negative slant angle (typically around -12)
    SlantAngle = 1936486004
    # same as @HB_STYLE_TAG_SLANT_ANGLE expression as ratio.
    # Typical right-leaning Italic fonts have a positive slant ratio (typically around 0.2)
    SlantRatio = 1399615092
    # Used to vary width of text from narrower to wider.
    # Non-zero. Values can be interpreted as a percentage of whatever the font
    # designer considers “normal width” for that font design.
    Width = 2003072104
    # Used to vary stroke thicknesses or other design details
    # to give variation from lighter to blacker. Values can be interpreted in direct
    # comparison to values for usWeightClass in the OS/2 table,
    # or the CSS font-weight property.
    Weight = 2003265652
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
    Verify                    = 32
    ProduceUnsafeToConcat     = 64

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
    UnsafeToBreak  = 1
    UnsafeToConcat = 2
    Defined        = 3

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

  def self.aat_layout_feature_type_get_name_id(face : HarfBuzz::FaceT, feature_type : HarfBuzz::AatLayoutFeatureTypeT) : UInt32
    # hb_aat_layout_feature_type_get_name_id: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_aat_layout_feature_type_get_name_id(face, feature_type)

    # Return value handling

    _retval
  end

  def self.aat_layout_feature_type_get_selector_infos(face : HarfBuzz::FaceT, feature_type : HarfBuzz::AatLayoutFeatureTypeT, start_offset : UInt32) : UInt32
    # hb_aat_layout_feature_type_get_selector_infos: (None)
    # @selector_count: (out) (transfer full) (optional)
    # @selectors: (out) (caller-allocates) (optional) (array length=selector_count element-type Interface)
    # @default_index: (out) (transfer full) (optional)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    selector_count = Pointer(UInt32).null   # Generator::ArrayLengthArgPlan
    selector_count = selectors.size         # Generator::OutArgUsedInReturnPlan
    selectors = Pointer(Pointer(Void)).null # Generator::ArrayArgPlan
    selectors = selectors.to_a.map(&.to_unsafe).to_unsafe
    # Generator::OutArgUsedInReturnPlan
    default_index = Pointer(UInt32).null
    # C call
    _retval = LibHarfBuzz.hb_aat_layout_feature_type_get_selector_infos(face, feature_type, start_offset, selector_count, selectors, default_index)

    # Return value handling

    _retval
  end

  def self.aat_layout_get_feature_types(face : HarfBuzz::FaceT, start_offset : UInt32, features : Enumerable(HarfBuzz::AatLayoutFeatureTypeT)) : UInt32
    # hb_aat_layout_get_feature_types: (None)
    # @feature_count: (out) (transfer full) (optional)
    # @features: (out) (caller-allocates) (array length=feature_count element-type Interface)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    feature_count = Pointer(UInt32).null # Generator::ArrayLengthArgPlan
    feature_count = features.size        # Generator::ArrayArgPlan
    features = features.to_a.map(&.to_unsafe).to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_aat_layout_get_feature_types(face, start_offset, feature_count, features)

    # Return value handling

    _retval
  end

  def self.aat_layout_has_positioning(face : HarfBuzz::FaceT) : Int32
    # hb_aat_layout_has_positioning: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_aat_layout_has_positioning(face)

    # Return value handling

    _retval
  end

  def self.aat_layout_has_substitution(face : HarfBuzz::FaceT) : Int32
    # hb_aat_layout_has_substitution: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_aat_layout_has_substitution(face)

    # Return value handling

    _retval
  end

  def self.aat_layout_has_tracking(face : HarfBuzz::FaceT) : Int32
    # hb_aat_layout_has_tracking: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_aat_layout_has_tracking(face)

    # Return value handling

    _retval
  end

  def self.blob_copy_writable_or_fail(blob : HarfBuzz::BlobT) : HarfBuzz::BlobT
    # hb_blob_copy_writable_or_fail: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_blob_copy_writable_or_fail(blob)

    # Return value handling

    HarfBuzz::BlobT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.blob_create_from_file(file_name : ::String) : HarfBuzz::BlobT
    # hb_blob_create_from_file: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_blob_create_from_file(file_name)

    # Return value handling

    HarfBuzz::BlobT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.blob_create_from_file_or_fail(file_name : ::String) : HarfBuzz::BlobT
    # hb_blob_create_from_file_or_fail: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_blob_create_from_file_or_fail(file_name)

    # Return value handling

    HarfBuzz::BlobT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.blob_create_sub_blob(parent : HarfBuzz::BlobT, offset : UInt32, length : UInt32) : HarfBuzz::BlobT
    # hb_blob_create_sub_blob: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_blob_create_sub_blob(parent, offset, length)

    # Return value handling

    HarfBuzz::BlobT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.blob_get_data(blob : HarfBuzz::BlobT) : Enumerable(::String)
    # hb_blob_get_data: (None)
    # @length: (out) (transfer full)
    # Returns: (transfer none) (array length=length element-type Utf8)

    # Generator::OutArgUsedInReturnPlan
    length = 0_u32
    # C call
    _retval = LibHarfBuzz.hb_blob_get_data(blob, pointerof(length))

    # Return value handling

    GICrystal.transfer_array(_retval, length, GICrystal::Transfer::None)
  end

  def self.blob_get_data_writable(blob : HarfBuzz::BlobT) : Enumerable(::String)
    # hb_blob_get_data_writable: (None)
    # @length: (out) (transfer full)
    # Returns: (transfer none) (array length=length element-type Utf8)

    # Generator::OutArgUsedInReturnPlan
    length = 0_u32
    # C call
    _retval = LibHarfBuzz.hb_blob_get_data_writable(blob, pointerof(length))

    # Return value handling

    GICrystal.transfer_array(_retval, length, GICrystal::Transfer::None)
  end

  def self.blob_get_empty : HarfBuzz::BlobT
    # hb_blob_get_empty: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_blob_get_empty

    # Return value handling

    HarfBuzz::BlobT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.blob_get_length(blob : HarfBuzz::BlobT) : UInt32
    # hb_blob_get_length: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_blob_get_length(blob)

    # Return value handling

    _retval
  end

  def self.blob_is_immutable(blob : HarfBuzz::BlobT) : Int32
    # hb_blob_is_immutable: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_blob_is_immutable(blob)

    # Return value handling

    _retval
  end

  def self.blob_make_immutable(blob : HarfBuzz::BlobT) : Nil
    # hb_blob_make_immutable: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_blob_make_immutable(blob)

    # Return value handling
  end

  def self.buffer_add(buffer : HarfBuzz::BufferT, codepoint : UInt32, cluster : UInt32) : Nil
    # hb_buffer_add: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_buffer_add(buffer, codepoint, cluster)

    # Return value handling
  end

  def self.buffer_add_codepoints(buffer : HarfBuzz::BufferT, text : Enumerable(UInt32), item_offset : UInt32, item_length : Int32) : Nil
    # hb_buffer_add_codepoints: (None)
    # @text: (array length=text_length element-type UInt32)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    text_length = text.size # Generator::ArrayArgPlan
    text = text.to_a.to_unsafe

    # C call
    LibHarfBuzz.hb_buffer_add_codepoints(buffer, text, text_length, item_offset, item_length)

    # Return value handling
  end

  def self.buffer_add_latin1(buffer : HarfBuzz::BufferT, text : Enumerable(UInt8), item_offset : UInt32, item_length : Int32) : Nil
    # hb_buffer_add_latin1: (None)
    # @text: (array length=text_length element-type UInt8)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    text_length = text.size # Generator::ArrayArgPlan
    text = text.to_a.to_unsafe

    # C call
    LibHarfBuzz.hb_buffer_add_latin1(buffer, text, text_length, item_offset, item_length)

    # Return value handling
  end

  def self.buffer_add_utf16(buffer : HarfBuzz::BufferT, text : Enumerable(UInt16), item_offset : UInt32, item_length : Int32) : Nil
    # hb_buffer_add_utf16: (None)
    # @text: (array length=text_length element-type UInt16)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    text_length = text.size # Generator::ArrayArgPlan
    text = text.to_a.to_unsafe

    # C call
    LibHarfBuzz.hb_buffer_add_utf16(buffer, text, text_length, item_offset, item_length)

    # Return value handling
  end

  def self.buffer_add_utf32(buffer : HarfBuzz::BufferT, text : Enumerable(UInt32), item_offset : UInt32, item_length : Int32) : Nil
    # hb_buffer_add_utf32: (None)
    # @text: (array length=text_length element-type UInt32)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    text_length = text.size # Generator::ArrayArgPlan
    text = text.to_a.to_unsafe

    # C call
    LibHarfBuzz.hb_buffer_add_utf32(buffer, text, text_length, item_offset, item_length)

    # Return value handling
  end

  def self.buffer_add_utf8(buffer : HarfBuzz::BufferT, text : Enumerable(UInt8), item_offset : UInt32, item_length : Int32) : Nil
    # hb_buffer_add_utf8: (None)
    # @text: (array length=text_length element-type UInt8)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    text_length = text.size # Generator::ArrayArgPlan
    text = text.to_a.to_unsafe

    # C call
    LibHarfBuzz.hb_buffer_add_utf8(buffer, text, text_length, item_offset, item_length)

    # Return value handling
  end

  def self.buffer_allocation_successful(buffer : HarfBuzz::BufferT) : Int32
    # hb_buffer_allocation_successful: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_buffer_allocation_successful(buffer)

    # Return value handling

    _retval
  end

  def self.buffer_append(buffer : HarfBuzz::BufferT, source : HarfBuzz::BufferT, start : UInt32, end _end : UInt32) : Nil
    # hb_buffer_append: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_buffer_append(buffer, source, start, _end)

    # Return value handling
  end

  def self.buffer_clear_contents(buffer : HarfBuzz::BufferT) : Nil
    # hb_buffer_clear_contents: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_buffer_clear_contents(buffer)

    # Return value handling
  end

  def self.buffer_create : HarfBuzz::BufferT
    # hb_buffer_create: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_buffer_create

    # Return value handling

    HarfBuzz::BufferT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.buffer_create_similar(src : HarfBuzz::BufferT) : HarfBuzz::BufferT
    # hb_buffer_create_similar: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_buffer_create_similar(src)

    # Return value handling

    HarfBuzz::BufferT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.buffer_deserialize_glyphs(buffer : HarfBuzz::BufferT, buf : Enumerable(::String), font : HarfBuzz::FontT?, format : HarfBuzz::BufferSerializeFormatT) : Int32
    # hb_buffer_deserialize_glyphs: (None)
    # @buf: (array length=buf_len element-type Utf8)
    # @end_ptr: (out) (transfer full) (optional)
    # @font: (nullable)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    buf_len = buf.size # Generator::ArrayArgPlan
    buf = buf.to_a.map(&.to_unsafe).to_unsafe
    # Generator::OutArgUsedInReturnPlan
    end_ptr = Pointer(Pointer(LibC::Char)).null # Generator::NullableArrayPlan
    font = if font.nil?
             Pointer(Void).null
           else
             font.to_unsafe
           end

    # C call
    _retval = LibHarfBuzz.hb_buffer_deserialize_glyphs(buffer, buf, buf_len, end_ptr, font, format)

    # Return value handling

    _retval
  end

  def self.buffer_deserialize_unicode(buffer : HarfBuzz::BufferT, buf : Enumerable(::String), format : HarfBuzz::BufferSerializeFormatT) : Int32
    # hb_buffer_deserialize_unicode: (None)
    # @buf: (array length=buf_len element-type Utf8)
    # @end_ptr: (out) (transfer full) (optional)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    buf_len = buf.size # Generator::ArrayArgPlan
    buf = buf.to_a.map(&.to_unsafe).to_unsafe
    # Generator::OutArgUsedInReturnPlan
    end_ptr = Pointer(Pointer(LibC::Char)).null
    # C call
    _retval = LibHarfBuzz.hb_buffer_deserialize_unicode(buffer, buf, buf_len, end_ptr, format)

    # Return value handling

    _retval
  end

  def self.buffer_diff(buffer : HarfBuzz::BufferT, reference : HarfBuzz::BufferT, dottedcircle_glyph : UInt32, position_fuzz : UInt32) : HarfBuzz::BufferDiffFlagsT
    # hb_buffer_diff: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_buffer_diff(buffer, reference, dottedcircle_glyph, position_fuzz)

    # Return value handling

    HarfBuzz::BufferDiffFlagsT.new(_retval)
  end

  def self.buffer_get_cluster_level(buffer : HarfBuzz::BufferT) : HarfBuzz::BufferClusterLevelT
    # hb_buffer_get_cluster_level: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_buffer_get_cluster_level(buffer)

    # Return value handling

    HarfBuzz::BufferClusterLevelT.new(_retval)
  end

  def self.buffer_get_content_type(buffer : HarfBuzz::BufferT) : HarfBuzz::BufferContentTypeT
    # hb_buffer_get_content_type: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_buffer_get_content_type(buffer)

    # Return value handling

    HarfBuzz::BufferContentTypeT.new(_retval)
  end

  def self.buffer_get_direction(buffer : HarfBuzz::BufferT) : HarfBuzz::DirectionT
    # hb_buffer_get_direction: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_buffer_get_direction(buffer)

    # Return value handling

    HarfBuzz::DirectionT.new(_retval)
  end

  def self.buffer_get_empty : HarfBuzz::BufferT
    # hb_buffer_get_empty: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_buffer_get_empty

    # Return value handling

    HarfBuzz::BufferT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.buffer_get_flags(buffer : HarfBuzz::BufferT) : HarfBuzz::BufferFlagsT
    # hb_buffer_get_flags: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_buffer_get_flags(buffer)

    # Return value handling

    HarfBuzz::BufferFlagsT.new(_retval)
  end

  def self.buffer_get_glyph_infos(buffer : HarfBuzz::BufferT) : Enumerable(HarfBuzz::GlyphInfoT)
    # hb_buffer_get_glyph_infos: (None)
    # @length: (out) (transfer full)
    # Returns: (transfer none) (array length=length element-type Interface)

    # Generator::OutArgUsedInReturnPlan
    length = 0_u32
    # C call
    _retval = LibHarfBuzz.hb_buffer_get_glyph_infos(buffer, pointerof(length))

    # Return value handling

    GICrystal.transfer_array(_retval, length, GICrystal::Transfer::None)
  end

  def self.buffer_get_glyph_positions(buffer : HarfBuzz::BufferT) : Enumerable(HarfBuzz::GlyphPositionT)
    # hb_buffer_get_glyph_positions: (None)
    # @length: (out) (transfer full)
    # Returns: (transfer none) (array length=length element-type Interface)

    # Generator::OutArgUsedInReturnPlan
    length = 0_u32
    # C call
    _retval = LibHarfBuzz.hb_buffer_get_glyph_positions(buffer, pointerof(length))

    # Return value handling

    GICrystal.transfer_array(_retval, length, GICrystal::Transfer::None)
  end

  def self.buffer_get_invisible_glyph(buffer : HarfBuzz::BufferT) : UInt32
    # hb_buffer_get_invisible_glyph: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_buffer_get_invisible_glyph(buffer)

    # Return value handling

    _retval
  end

  def self.buffer_get_language(buffer : HarfBuzz::BufferT) : HarfBuzz::LanguageT
    # hb_buffer_get_language: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_buffer_get_language(buffer)

    # Return value handling

    HarfBuzz::LanguageT.new(_retval, GICrystal::Transfer::None)
  end

  def self.buffer_get_length(buffer : HarfBuzz::BufferT) : UInt32
    # hb_buffer_get_length: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_buffer_get_length(buffer)

    # Return value handling

    _retval
  end

  def self.buffer_get_not_found_glyph(buffer : HarfBuzz::BufferT) : UInt32
    # hb_buffer_get_not_found_glyph: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_buffer_get_not_found_glyph(buffer)

    # Return value handling

    _retval
  end

  def self.buffer_get_replacement_codepoint(buffer : HarfBuzz::BufferT) : UInt32
    # hb_buffer_get_replacement_codepoint: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_buffer_get_replacement_codepoint(buffer)

    # Return value handling

    _retval
  end

  def self.buffer_get_script(buffer : HarfBuzz::BufferT) : HarfBuzz::ScriptT
    # hb_buffer_get_script: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_buffer_get_script(buffer)

    # Return value handling

    HarfBuzz::ScriptT.new(_retval)
  end

  def self.buffer_get_segment_properties(buffer : HarfBuzz::BufferT) : HarfBuzz::SegmentPropertiesT
    # hb_buffer_get_segment_properties: (None)
    # @props: (out) (caller-allocates)
    # Returns: (transfer none)

    # Generator::CallerAllocatesPlan
    props = HarfBuzz::SegmentPropertiesT.new
    # C call
    LibHarfBuzz.hb_buffer_get_segment_properties(buffer, props)

    # Return value handling

    props
  end

  def self.buffer_get_unicode_funcs(buffer : HarfBuzz::BufferT) : HarfBuzz::UnicodeFuncsT
    # hb_buffer_get_unicode_funcs: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_buffer_get_unicode_funcs(buffer)

    # Return value handling

    HarfBuzz::UnicodeFuncsT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.buffer_guess_segment_properties(buffer : HarfBuzz::BufferT) : Nil
    # hb_buffer_guess_segment_properties: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_buffer_guess_segment_properties(buffer)

    # Return value handling
  end

  def self.buffer_has_positions(buffer : HarfBuzz::BufferT) : Int32
    # hb_buffer_has_positions: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_buffer_has_positions(buffer)

    # Return value handling

    _retval
  end

  def self.buffer_normalize_glyphs(buffer : HarfBuzz::BufferT) : Nil
    # hb_buffer_normalize_glyphs: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_buffer_normalize_glyphs(buffer)

    # Return value handling
  end

  def self.buffer_pre_allocate(buffer : HarfBuzz::BufferT, size : UInt32) : Int32
    # hb_buffer_pre_allocate: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_buffer_pre_allocate(buffer, size)

    # Return value handling

    _retval
  end

  def self.buffer_reset(buffer : HarfBuzz::BufferT) : Nil
    # hb_buffer_reset: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_buffer_reset(buffer)

    # Return value handling
  end

  def self.buffer_reverse(buffer : HarfBuzz::BufferT) : Nil
    # hb_buffer_reverse: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_buffer_reverse(buffer)

    # Return value handling
  end

  def self.buffer_reverse_clusters(buffer : HarfBuzz::BufferT) : Nil
    # hb_buffer_reverse_clusters: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_buffer_reverse_clusters(buffer)

    # Return value handling
  end

  def self.buffer_reverse_range(buffer : HarfBuzz::BufferT, start : UInt32, end _end : UInt32) : Nil
    # hb_buffer_reverse_range: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_buffer_reverse_range(buffer, start, _end)

    # Return value handling
  end

  def self.buffer_serialize(buffer : HarfBuzz::BufferT, start : UInt32, end _end : UInt32, buf : Enumerable(UInt8), font : HarfBuzz::FontT?, format : HarfBuzz::BufferSerializeFormatT, flags : HarfBuzz::BufferSerializeFlagsT) : UInt32
    # hb_buffer_serialize: (None)
    # @buf: (out) (transfer full) (array length=buf_size element-type UInt8)
    # @buf_size: (out) (transfer full)
    # @buf_consumed: (out) (transfer full) (optional)
    # @font: (nullable)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    buf_size = buf.size # Generator::ArrayArgPlan
    buf = buf.to_a.to_unsafe
    # Generator::OutArgUsedInReturnPlan
    buf_consumed = Pointer(UInt32).null # Generator::NullableArrayPlan
    font = if font.nil?
             Pointer(Void).null
           else
             font.to_unsafe
           end

    # C call
    _retval = LibHarfBuzz.hb_buffer_serialize(buffer, start, _end, buf, buf_size, buf_consumed, font, format, flags)

    # Return value handling

    _retval
  end

  def self.buffer_serialize_format_from_string(str : Enumerable(UInt8)) : HarfBuzz::BufferSerializeFormatT
    # hb_buffer_serialize_format_from_string: (None)
    # @str: (array length=len element-type UInt8)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    len = str.size # Generator::ArrayArgPlan
    str = str.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_buffer_serialize_format_from_string(str, len)

    # Return value handling

    HarfBuzz::BufferSerializeFormatT.new(_retval)
  end

  def self.buffer_serialize_format_from_string(*str : UInt8)
    self.buffer_serialize_format_from_string(str)
  end

  def self.buffer_serialize_format_to_string(format : HarfBuzz::BufferSerializeFormatT) : ::String
    # hb_buffer_serialize_format_to_string: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_buffer_serialize_format_to_string(format)

    # Return value handling

    ::String.new(_retval)
  end

  def self.buffer_serialize_glyphs(buffer : HarfBuzz::BufferT, start : UInt32, end _end : UInt32, buf : Enumerable(UInt8), font : HarfBuzz::FontT?, format : HarfBuzz::BufferSerializeFormatT, flags : HarfBuzz::BufferSerializeFlagsT) : UInt32
    # hb_buffer_serialize_glyphs: (None)
    # @buf: (out) (transfer full) (array length=buf_size element-type UInt8)
    # @buf_size: (out) (transfer full)
    # @buf_consumed: (out) (transfer full) (optional)
    # @font: (nullable)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    buf_size = buf.size # Generator::ArrayArgPlan
    buf = buf.to_a.to_unsafe
    # Generator::OutArgUsedInReturnPlan
    buf_consumed = Pointer(UInt32).null # Generator::NullableArrayPlan
    font = if font.nil?
             Pointer(Void).null
           else
             font.to_unsafe
           end

    # C call
    _retval = LibHarfBuzz.hb_buffer_serialize_glyphs(buffer, start, _end, buf, buf_size, buf_consumed, font, format, flags)

    # Return value handling

    _retval
  end

  def self.buffer_serialize_list_formats : Enumerable(::String)
    # hb_buffer_serialize_list_formats: (None)
    # Returns: (transfer none) (array zero-terminated=1 element-type Utf8)

    # C call
    _retval = LibHarfBuzz.hb_buffer_serialize_list_formats

    # Return value handling

    GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
  end

  def self.buffer_serialize_unicode(buffer : HarfBuzz::BufferT, start : UInt32, end _end : UInt32, buf : Enumerable(UInt8), format : HarfBuzz::BufferSerializeFormatT, flags : HarfBuzz::BufferSerializeFlagsT) : UInt32
    # hb_buffer_serialize_unicode: (None)
    # @buf: (out) (transfer full) (array length=buf_size element-type UInt8)
    # @buf_size: (out) (transfer full)
    # @buf_consumed: (out) (transfer full) (optional)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    buf_size = buf.size # Generator::ArrayArgPlan
    buf = buf.to_a.to_unsafe
    # Generator::OutArgUsedInReturnPlan
    buf_consumed = Pointer(UInt32).null
    # C call
    _retval = LibHarfBuzz.hb_buffer_serialize_unicode(buffer, start, _end, buf, buf_size, buf_consumed, format, flags)

    # Return value handling

    _retval
  end

  def self.buffer_set_cluster_level(buffer : HarfBuzz::BufferT, cluster_level : HarfBuzz::BufferClusterLevelT) : Nil
    # hb_buffer_set_cluster_level: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_buffer_set_cluster_level(buffer, cluster_level)

    # Return value handling
  end

  def self.buffer_set_content_type(buffer : HarfBuzz::BufferT, content_type : HarfBuzz::BufferContentTypeT) : Nil
    # hb_buffer_set_content_type: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_buffer_set_content_type(buffer, content_type)

    # Return value handling
  end

  def self.buffer_set_direction(buffer : HarfBuzz::BufferT, direction : HarfBuzz::DirectionT) : Nil
    # hb_buffer_set_direction: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_buffer_set_direction(buffer, direction)

    # Return value handling
  end

  def self.buffer_set_flags(buffer : HarfBuzz::BufferT, flags : HarfBuzz::BufferFlagsT) : Nil
    # hb_buffer_set_flags: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_buffer_set_flags(buffer, flags)

    # Return value handling
  end

  def self.buffer_set_invisible_glyph(buffer : HarfBuzz::BufferT, invisible : UInt32) : Nil
    # hb_buffer_set_invisible_glyph: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_buffer_set_invisible_glyph(buffer, invisible)

    # Return value handling
  end

  def self.buffer_set_language(buffer : HarfBuzz::BufferT, language : HarfBuzz::LanguageT) : Nil
    # hb_buffer_set_language: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_buffer_set_language(buffer, language)

    # Return value handling
  end

  def self.buffer_set_length(buffer : HarfBuzz::BufferT, length : UInt32) : Int32
    # hb_buffer_set_length: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_buffer_set_length(buffer, length)

    # Return value handling

    _retval
  end

  def self.buffer_set_message_func(buffer : HarfBuzz::BufferT, func : HarfBuzz::BufferMessageFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_buffer_set_message_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_buffer_set_message_func(buffer, func, user_data, destroy)

    # Return value handling
  end

  def self.buffer_set_not_found_glyph(buffer : HarfBuzz::BufferT, not_found : UInt32) : Nil
    # hb_buffer_set_not_found_glyph: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_buffer_set_not_found_glyph(buffer, not_found)

    # Return value handling
  end

  def self.buffer_set_replacement_codepoint(buffer : HarfBuzz::BufferT, replacement : UInt32) : Nil
    # hb_buffer_set_replacement_codepoint: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_buffer_set_replacement_codepoint(buffer, replacement)

    # Return value handling
  end

  def self.buffer_set_script(buffer : HarfBuzz::BufferT, script : HarfBuzz::ScriptT) : Nil
    # hb_buffer_set_script: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_buffer_set_script(buffer, script)

    # Return value handling
  end

  def self.buffer_set_segment_properties(buffer : HarfBuzz::BufferT, props : HarfBuzz::SegmentPropertiesT) : Nil
    # hb_buffer_set_segment_properties: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_buffer_set_segment_properties(buffer, props)

    # Return value handling
  end

  def self.buffer_set_unicode_funcs(buffer : HarfBuzz::BufferT, unicode_funcs : HarfBuzz::UnicodeFuncsT) : Nil
    # hb_buffer_set_unicode_funcs: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_buffer_set_unicode_funcs(buffer, unicode_funcs)

    # Return value handling
  end

  def self.color_get_alpha(color : UInt32) : UInt8
    # hb_color_get_alpha: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_color_get_alpha(color)

    # Return value handling

    _retval
  end

  def self.color_get_blue(color : UInt32) : UInt8
    # hb_color_get_blue: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_color_get_blue(color)

    # Return value handling

    _retval
  end

  def self.color_get_green(color : UInt32) : UInt8
    # hb_color_get_green: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_color_get_green(color)

    # Return value handling

    _retval
  end

  def self.color_get_red(color : UInt32) : UInt8
    # hb_color_get_red: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_color_get_red(color)

    # Return value handling

    _retval
  end

  def self.direction_from_string(str : Enumerable(UInt8)) : HarfBuzz::DirectionT
    # hb_direction_from_string: (None)
    # @str: (array length=len element-type UInt8)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    len = str.size # Generator::ArrayArgPlan
    str = str.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_direction_from_string(str, len)

    # Return value handling

    HarfBuzz::DirectionT.new(_retval)
  end

  def self.direction_from_string(*str : UInt8)
    self.direction_from_string(str)
  end

  def self.direction_to_string(direction : HarfBuzz::DirectionT) : ::String
    # hb_direction_to_string: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_direction_to_string(direction)

    # Return value handling

    ::String.new(_retval)
  end

  def self.draw_close_path(dfuncs : HarfBuzz::DrawFuncsT, draw_data : Pointer(Void)?, st : HarfBuzz::DrawStateT) : Nil
    # hb_draw_close_path: (None)
    # @draw_data: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    draw_data = if draw_data.nil?
                  Pointer(Void).null
                else
                  draw_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_draw_close_path(dfuncs, draw_data, st)

    # Return value handling
  end

  def self.draw_cubic_to(dfuncs : HarfBuzz::DrawFuncsT, draw_data : Pointer(Void)?, st : HarfBuzz::DrawStateT, control1_x : Float32, control1_y : Float32, control2_x : Float32, control2_y : Float32, to_x : Float32, to_y : Float32) : Nil
    # hb_draw_cubic_to: (None)
    # @draw_data: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    draw_data = if draw_data.nil?
                  Pointer(Void).null
                else
                  draw_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_draw_cubic_to(dfuncs, draw_data, st, control1_x, control1_y, control2_x, control2_y, to_x, to_y)

    # Return value handling
  end

  def self.draw_funcs_create : HarfBuzz::DrawFuncsT
    # hb_draw_funcs_create: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_draw_funcs_create

    # Return value handling

    HarfBuzz::DrawFuncsT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.draw_funcs_is_immutable(dfuncs : HarfBuzz::DrawFuncsT) : Int32
    # hb_draw_funcs_is_immutable: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_draw_funcs_is_immutable(dfuncs)

    # Return value handling

    _retval
  end

  def self.draw_funcs_make_immutable(dfuncs : HarfBuzz::DrawFuncsT) : Nil
    # hb_draw_funcs_make_immutable: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_draw_funcs_make_immutable(dfuncs)

    # Return value handling
  end

  def self.draw_funcs_set_close_path_func(dfuncs : HarfBuzz::DrawFuncsT, func : HarfBuzz::DrawClosePathFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_draw_funcs_set_close_path_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_draw_funcs_set_close_path_func(dfuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.draw_funcs_set_cubic_to_func(dfuncs : HarfBuzz::DrawFuncsT, func : HarfBuzz::DrawCubicToFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_draw_funcs_set_cubic_to_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_draw_funcs_set_cubic_to_func(dfuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.draw_funcs_set_line_to_func(dfuncs : HarfBuzz::DrawFuncsT, func : HarfBuzz::DrawLineToFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_draw_funcs_set_line_to_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_draw_funcs_set_line_to_func(dfuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.draw_funcs_set_move_to_func(dfuncs : HarfBuzz::DrawFuncsT, func : HarfBuzz::DrawMoveToFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_draw_funcs_set_move_to_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_draw_funcs_set_move_to_func(dfuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.draw_funcs_set_quadratic_to_func(dfuncs : HarfBuzz::DrawFuncsT, func : HarfBuzz::DrawQuadraticToFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_draw_funcs_set_quadratic_to_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_draw_funcs_set_quadratic_to_func(dfuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.draw_line_to(dfuncs : HarfBuzz::DrawFuncsT, draw_data : Pointer(Void)?, st : HarfBuzz::DrawStateT, to_x : Float32, to_y : Float32) : Nil
    # hb_draw_line_to: (None)
    # @draw_data: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    draw_data = if draw_data.nil?
                  Pointer(Void).null
                else
                  draw_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_draw_line_to(dfuncs, draw_data, st, to_x, to_y)

    # Return value handling
  end

  def self.draw_move_to(dfuncs : HarfBuzz::DrawFuncsT, draw_data : Pointer(Void)?, st : HarfBuzz::DrawStateT, to_x : Float32, to_y : Float32) : Nil
    # hb_draw_move_to: (None)
    # @draw_data: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    draw_data = if draw_data.nil?
                  Pointer(Void).null
                else
                  draw_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_draw_move_to(dfuncs, draw_data, st, to_x, to_y)

    # Return value handling
  end

  def self.draw_quadratic_to(dfuncs : HarfBuzz::DrawFuncsT, draw_data : Pointer(Void)?, st : HarfBuzz::DrawStateT, control_x : Float32, control_y : Float32, to_x : Float32, to_y : Float32) : Nil
    # hb_draw_quadratic_to: (None)
    # @draw_data: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    draw_data = if draw_data.nil?
                  Pointer(Void).null
                else
                  draw_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_draw_quadratic_to(dfuncs, draw_data, st, control_x, control_y, to_x, to_y)

    # Return value handling
  end

  def self.face_builder_add_table(face : HarfBuzz::FaceT, tag : UInt32, blob : HarfBuzz::BlobT) : Int32
    # hb_face_builder_add_table: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_face_builder_add_table(face, tag, blob)

    # Return value handling

    _retval
  end

  def self.face_builder_create : HarfBuzz::FaceT
    # hb_face_builder_create: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_face_builder_create

    # Return value handling

    HarfBuzz::FaceT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.face_collect_unicodes(face : HarfBuzz::FaceT, out _out : HarfBuzz::SetT) : Nil
    # hb_face_collect_unicodes: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_face_collect_unicodes(face, _out)

    # Return value handling
  end

  def self.face_collect_variation_selectors(face : HarfBuzz::FaceT, out _out : HarfBuzz::SetT) : Nil
    # hb_face_collect_variation_selectors: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_face_collect_variation_selectors(face, _out)

    # Return value handling
  end

  def self.face_collect_variation_unicodes(face : HarfBuzz::FaceT, variation_selector : UInt32, out _out : HarfBuzz::SetT) : Nil
    # hb_face_collect_variation_unicodes: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_face_collect_variation_unicodes(face, variation_selector, _out)

    # Return value handling
  end

  def self.face_count(blob : HarfBuzz::BlobT) : UInt32
    # hb_face_count: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_face_count(blob)

    # Return value handling

    _retval
  end

  def self.face_create(blob : HarfBuzz::BlobT, index : UInt32) : HarfBuzz::FaceT
    # hb_face_create: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_face_create(blob, index)

    # Return value handling

    HarfBuzz::FaceT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.face_create_for_tables(reference_table_func : HarfBuzz::ReferenceTableFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : HarfBuzz::FaceT
    # hb_face_create_for_tables: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer full)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    _retval = LibHarfBuzz.hb_face_create_for_tables(reference_table_func, user_data, destroy)

    # Return value handling

    HarfBuzz::FaceT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.face_get_empty : HarfBuzz::FaceT
    # hb_face_get_empty: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_face_get_empty

    # Return value handling

    HarfBuzz::FaceT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.face_get_glyph_count(face : HarfBuzz::FaceT) : UInt32
    # hb_face_get_glyph_count: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_face_get_glyph_count(face)

    # Return value handling

    _retval
  end

  def self.face_get_index(face : HarfBuzz::FaceT) : UInt32
    # hb_face_get_index: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_face_get_index(face)

    # Return value handling

    _retval
  end

  def self.face_get_table_tags(face : HarfBuzz::FaceT, start_offset : UInt32, table_tags : Enumerable(UInt32)) : UInt32
    # hb_face_get_table_tags: (None)
    # @table_count: (out) (transfer full)
    # @table_tags: (out) (transfer full) (array length=table_count element-type UInt32)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    table_count = table_tags.size # Generator::ArrayArgPlan
    table_tags = table_tags.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_face_get_table_tags(face, start_offset, table_count, table_tags)

    # Return value handling

    _retval
  end

  def self.face_get_upem(face : HarfBuzz::FaceT) : UInt32
    # hb_face_get_upem: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_face_get_upem(face)

    # Return value handling

    _retval
  end

  def self.face_is_immutable(face : HarfBuzz::FaceT) : Int32
    # hb_face_is_immutable: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_face_is_immutable(face)

    # Return value handling

    _retval
  end

  def self.face_make_immutable(face : HarfBuzz::FaceT) : Nil
    # hb_face_make_immutable: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_face_make_immutable(face)

    # Return value handling
  end

  def self.face_reference_blob(face : HarfBuzz::FaceT) : HarfBuzz::BlobT
    # hb_face_reference_blob: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_face_reference_blob(face)

    # Return value handling

    HarfBuzz::BlobT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.face_reference_table(face : HarfBuzz::FaceT, tag : UInt32) : HarfBuzz::BlobT
    # hb_face_reference_table: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_face_reference_table(face, tag)

    # Return value handling

    HarfBuzz::BlobT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.face_set_glyph_count(face : HarfBuzz::FaceT, glyph_count : UInt32) : Nil
    # hb_face_set_glyph_count: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_face_set_glyph_count(face, glyph_count)

    # Return value handling
  end

  def self.face_set_index(face : HarfBuzz::FaceT, index : UInt32) : Nil
    # hb_face_set_index: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_face_set_index(face, index)

    # Return value handling
  end

  def self.face_set_upem(face : HarfBuzz::FaceT, upem : UInt32) : Nil
    # hb_face_set_upem: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_face_set_upem(face, upem)

    # Return value handling
  end

  def self.feature_from_string(str : Enumerable(UInt8)) : HarfBuzz::FeatureT
    # hb_feature_from_string: (None)
    # @str: (array length=len element-type UInt8)
    # @feature: (out) (caller-allocates)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    len = str.size # Generator::ArrayArgPlan
    str = str.to_a.to_unsafe
    # Generator::CallerAllocatesPlan
    feature = HarfBuzz::FeatureT.new
    # C call
    _retval = LibHarfBuzz.hb_feature_from_string(str, len, feature)

    # Return value handling

    feature
  end

  def self.feature_from_string(*str : UInt8)
    self.feature_from_string(str)
  end

  def self.feature_to_string(feature : HarfBuzz::FeatureT, buf : Enumerable(::String)) : Nil
    # hb_feature_to_string: (None)
    # @buf: (out) (transfer full) (array length=size element-type Utf8)
    # @size: (out) (transfer full)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    size = buf.size # Generator::ArrayArgPlan
    buf = buf.to_a.map(&.to_unsafe).to_unsafe

    # C call
    LibHarfBuzz.hb_feature_to_string(feature, buf, size)

    # Return value handling
  end

  def self.font_add_glyph_origin_for_direction(font : HarfBuzz::FontT, glyph : UInt32, direction : HarfBuzz::DirectionT, x : Int32, y : Int32) : Nil
    # hb_font_add_glyph_origin_for_direction: (None)
    # @x: (inout) (transfer full)
    # @y: (inout) (transfer full)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_font_add_glyph_origin_for_direction(font, glyph, direction, x, y)

    # Return value handling
  end

  def self.font_create(face : HarfBuzz::FaceT) : HarfBuzz::FontT
    # hb_font_create: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_font_create(face)

    # Return value handling

    HarfBuzz::FontT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.font_create_sub_font(parent : HarfBuzz::FontT) : HarfBuzz::FontT
    # hb_font_create_sub_font: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_font_create_sub_font(parent)

    # Return value handling

    HarfBuzz::FontT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.font_funcs_create : HarfBuzz::FontFuncsT
    # hb_font_funcs_create: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_font_funcs_create

    # Return value handling

    HarfBuzz::FontFuncsT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.font_funcs_get_empty : HarfBuzz::FontFuncsT
    # hb_font_funcs_get_empty: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_font_funcs_get_empty

    # Return value handling

    HarfBuzz::FontFuncsT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.font_funcs_is_immutable(ffuncs : HarfBuzz::FontFuncsT) : Int32
    # hb_font_funcs_is_immutable: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_font_funcs_is_immutable(ffuncs)

    # Return value handling

    _retval
  end

  def self.font_funcs_make_immutable(ffuncs : HarfBuzz::FontFuncsT) : Nil
    # hb_font_funcs_make_immutable: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_font_funcs_make_immutable(ffuncs)

    # Return value handling
  end

  def self.font_funcs_set_font_h_extents_func(ffuncs : HarfBuzz::FontFuncsT, func : HarfBuzz::FontGetFontExtentsFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_font_funcs_set_font_h_extents_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_funcs_set_font_h_extents_func(ffuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.font_funcs_set_font_v_extents_func(ffuncs : HarfBuzz::FontFuncsT, func : HarfBuzz::FontGetFontExtentsFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_font_funcs_set_font_v_extents_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_funcs_set_font_v_extents_func(ffuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.font_funcs_set_glyph_contour_point_func(ffuncs : HarfBuzz::FontFuncsT, func : HarfBuzz::FontGetGlyphContourPointFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_font_funcs_set_glyph_contour_point_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_funcs_set_glyph_contour_point_func(ffuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.font_funcs_set_glyph_extents_func(ffuncs : HarfBuzz::FontFuncsT, func : HarfBuzz::FontGetGlyphExtentsFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_font_funcs_set_glyph_extents_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_funcs_set_glyph_extents_func(ffuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.font_funcs_set_glyph_from_name_func(ffuncs : HarfBuzz::FontFuncsT, func : HarfBuzz::FontGetGlyphFromNameFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_font_funcs_set_glyph_from_name_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_funcs_set_glyph_from_name_func(ffuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.font_funcs_set_glyph_func(ffuncs : HarfBuzz::FontFuncsT, func : HarfBuzz::FontGetGlyphFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_font_funcs_set_glyph_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_funcs_set_glyph_func(ffuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.font_funcs_set_glyph_h_advance_func(ffuncs : HarfBuzz::FontFuncsT, func : HarfBuzz::FontGetGlyphAdvanceFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_font_funcs_set_glyph_h_advance_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_funcs_set_glyph_h_advance_func(ffuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.font_funcs_set_glyph_h_advances_func(ffuncs : HarfBuzz::FontFuncsT, func : HarfBuzz::FontGetGlyphAdvancesFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_font_funcs_set_glyph_h_advances_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_funcs_set_glyph_h_advances_func(ffuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.font_funcs_set_glyph_h_kerning_func(ffuncs : HarfBuzz::FontFuncsT, func : HarfBuzz::FontGetGlyphKerningFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_font_funcs_set_glyph_h_kerning_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_funcs_set_glyph_h_kerning_func(ffuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.font_funcs_set_glyph_h_origin_func(ffuncs : HarfBuzz::FontFuncsT, func : HarfBuzz::FontGetGlyphOriginFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_font_funcs_set_glyph_h_origin_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_funcs_set_glyph_h_origin_func(ffuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.font_funcs_set_glyph_name_func(ffuncs : HarfBuzz::FontFuncsT, func : HarfBuzz::FontGetGlyphNameFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_font_funcs_set_glyph_name_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_funcs_set_glyph_name_func(ffuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.font_funcs_set_glyph_shape_func(ffuncs : HarfBuzz::FontFuncsT, func : HarfBuzz::FontGetGlyphShapeFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_font_funcs_set_glyph_shape_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_funcs_set_glyph_shape_func(ffuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.font_funcs_set_glyph_v_advance_func(ffuncs : HarfBuzz::FontFuncsT, func : HarfBuzz::FontGetGlyphAdvanceFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_font_funcs_set_glyph_v_advance_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_funcs_set_glyph_v_advance_func(ffuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.font_funcs_set_glyph_v_advances_func(ffuncs : HarfBuzz::FontFuncsT, func : HarfBuzz::FontGetGlyphAdvancesFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_font_funcs_set_glyph_v_advances_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_funcs_set_glyph_v_advances_func(ffuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.font_funcs_set_glyph_v_kerning_func(ffuncs : HarfBuzz::FontFuncsT, func : HarfBuzz::FontGetGlyphKerningFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_font_funcs_set_glyph_v_kerning_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_funcs_set_glyph_v_kerning_func(ffuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.font_funcs_set_glyph_v_origin_func(ffuncs : HarfBuzz::FontFuncsT, func : HarfBuzz::FontGetGlyphOriginFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_font_funcs_set_glyph_v_origin_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_funcs_set_glyph_v_origin_func(ffuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.font_funcs_set_nominal_glyph_func(ffuncs : HarfBuzz::FontFuncsT, func : HarfBuzz::FontGetNominalGlyphFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_font_funcs_set_nominal_glyph_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_funcs_set_nominal_glyph_func(ffuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.font_funcs_set_nominal_glyphs_func(ffuncs : HarfBuzz::FontFuncsT, func : HarfBuzz::FontGetNominalGlyphsFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_font_funcs_set_nominal_glyphs_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_funcs_set_nominal_glyphs_func(ffuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.font_funcs_set_variation_glyph_func(ffuncs : HarfBuzz::FontFuncsT, func : HarfBuzz::FontGetVariationGlyphFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_font_funcs_set_variation_glyph_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_funcs_set_variation_glyph_func(ffuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.font_get_empty : HarfBuzz::FontT
    # hb_font_get_empty: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_font_get_empty

    # Return value handling

    HarfBuzz::FontT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.font_get_extents_for_direction(font : HarfBuzz::FontT, direction : HarfBuzz::DirectionT) : HarfBuzz::FontExtentsT
    # hb_font_get_extents_for_direction: (None)
    # @extents: (out) (caller-allocates)
    # Returns: (transfer none)

    # Generator::CallerAllocatesPlan
    extents = HarfBuzz::FontExtentsT.new
    # C call
    LibHarfBuzz.hb_font_get_extents_for_direction(font, direction, extents)

    # Return value handling

    extents
  end

  def self.font_get_face(font : HarfBuzz::FontT) : HarfBuzz::FaceT
    # hb_font_get_face: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_font_get_face(font)

    # Return value handling

    HarfBuzz::FaceT.new(_retval, GICrystal::Transfer::None)
  end

  def self.font_get_glyph(font : HarfBuzz::FontT, unicode : UInt32, variation_selector : UInt32, glyph : UInt32) : Int32
    # hb_font_get_glyph: (None)
    # @glyph: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_font_get_glyph(font, unicode, variation_selector, glyph)

    # Return value handling

    _retval
  end

  def self.font_get_glyph_advance_for_direction(font : HarfBuzz::FontT, glyph : UInt32, direction : HarfBuzz::DirectionT, x : Int32, y : Int32) : Nil
    # hb_font_get_glyph_advance_for_direction: (None)
    # @x: (out) (transfer full)
    # @y: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_font_get_glyph_advance_for_direction(font, glyph, direction, x, y)

    # Return value handling
  end

  def self.font_get_glyph_advances_for_direction(font : HarfBuzz::FontT, direction : HarfBuzz::DirectionT, count : UInt32, first_glyph : Pointer(UInt32), glyph_stride : UInt32, first_advance : Int32, advance_stride : UInt32) : Nil
    # hb_font_get_glyph_advances_for_direction: (None)
    # @first_advance: (out) (transfer full)
    # @advance_stride: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_font_get_glyph_advances_for_direction(font, direction, count, first_glyph, glyph_stride, first_advance, advance_stride)

    # Return value handling
  end

  def self.font_get_glyph_contour_point(font : HarfBuzz::FontT, glyph : UInt32, point_index : UInt32, x : Int32, y : Int32) : Int32
    # hb_font_get_glyph_contour_point: (None)
    # @x: (out) (transfer full)
    # @y: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_font_get_glyph_contour_point(font, glyph, point_index, x, y)

    # Return value handling

    _retval
  end

  def self.font_get_glyph_contour_point_for_origin(font : HarfBuzz::FontT, glyph : UInt32, point_index : UInt32, direction : HarfBuzz::DirectionT, x : Int32, y : Int32) : Int32
    # hb_font_get_glyph_contour_point_for_origin: (None)
    # @x: (out) (transfer full)
    # @y: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_font_get_glyph_contour_point_for_origin(font, glyph, point_index, direction, x, y)

    # Return value handling

    _retval
  end

  def self.font_get_glyph_extents(font : HarfBuzz::FontT, glyph : UInt32) : HarfBuzz::GlyphExtentsT
    # hb_font_get_glyph_extents: (None)
    # @extents: (out) (caller-allocates)
    # Returns: (transfer none)

    # Generator::CallerAllocatesPlan
    extents = HarfBuzz::GlyphExtentsT.new
    # C call
    _retval = LibHarfBuzz.hb_font_get_glyph_extents(font, glyph, extents)

    # Return value handling

    extents
  end

  def self.font_get_glyph_extents_for_origin(font : HarfBuzz::FontT, glyph : UInt32, direction : HarfBuzz::DirectionT) : HarfBuzz::GlyphExtentsT
    # hb_font_get_glyph_extents_for_origin: (None)
    # @extents: (out) (caller-allocates)
    # Returns: (transfer none)

    # Generator::CallerAllocatesPlan
    extents = HarfBuzz::GlyphExtentsT.new
    # C call
    _retval = LibHarfBuzz.hb_font_get_glyph_extents_for_origin(font, glyph, direction, extents)

    # Return value handling

    extents
  end

  def self.font_get_glyph_from_name(font : HarfBuzz::FontT, name : Enumerable(::String), glyph : UInt32) : Int32
    # hb_font_get_glyph_from_name: (None)
    # @name: (array length=len element-type Utf8)
    # @glyph: (out) (transfer full)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    len = name.size # Generator::ArrayArgPlan
    name = name.to_a.map(&.to_unsafe).to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_font_get_glyph_from_name(font, name, len, glyph)

    # Return value handling

    _retval
  end

  def self.font_get_glyph_h_advance(font : HarfBuzz::FontT, glyph : UInt32) : Int32
    # hb_font_get_glyph_h_advance: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_font_get_glyph_h_advance(font, glyph)

    # Return value handling

    _retval
  end

  def self.font_get_glyph_h_advances(font : HarfBuzz::FontT, count : UInt32, first_glyph : Pointer(UInt32), glyph_stride : UInt32, first_advance : Int32, advance_stride : UInt32) : Nil
    # hb_font_get_glyph_h_advances: (None)
    # @first_advance: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_font_get_glyph_h_advances(font, count, first_glyph, glyph_stride, first_advance, advance_stride)

    # Return value handling
  end

  def self.font_get_glyph_h_kerning(font : HarfBuzz::FontT, left_glyph : UInt32, right_glyph : UInt32) : Int32
    # hb_font_get_glyph_h_kerning: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_font_get_glyph_h_kerning(font, left_glyph, right_glyph)

    # Return value handling

    _retval
  end

  def self.font_get_glyph_h_origin(font : HarfBuzz::FontT, glyph : UInt32, x : Int32, y : Int32) : Int32
    # hb_font_get_glyph_h_origin: (None)
    # @x: (out) (transfer full)
    # @y: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_font_get_glyph_h_origin(font, glyph, x, y)

    # Return value handling

    _retval
  end

  def self.font_get_glyph_kerning_for_direction(font : HarfBuzz::FontT, first_glyph : UInt32, second_glyph : UInt32, direction : HarfBuzz::DirectionT, x : Int32, y : Int32) : Nil
    # hb_font_get_glyph_kerning_for_direction: (None)
    # @x: (out) (transfer full)
    # @y: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_font_get_glyph_kerning_for_direction(font, first_glyph, second_glyph, direction, x, y)

    # Return value handling
  end

  def self.font_get_glyph_name(font : HarfBuzz::FontT, glyph : UInt32, name : Enumerable(::String)) : Int32
    # hb_font_get_glyph_name: (None)
    # @name: (out) (transfer full) (array length=size element-type Utf8)
    # @size: (out) (transfer full)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    size = name.size # Generator::ArrayArgPlan
    name = name.to_a.map(&.to_unsafe).to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_font_get_glyph_name(font, glyph, name, size)

    # Return value handling

    _retval
  end

  def self.font_get_glyph_origin_for_direction(font : HarfBuzz::FontT, glyph : UInt32, direction : HarfBuzz::DirectionT, x : Int32, y : Int32) : Nil
    # hb_font_get_glyph_origin_for_direction: (None)
    # @x: (out) (transfer full)
    # @y: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_font_get_glyph_origin_for_direction(font, glyph, direction, x, y)

    # Return value handling
  end

  def self.font_get_glyph_shape(font : HarfBuzz::FontT, glyph : UInt32, dfuncs : HarfBuzz::DrawFuncsT, draw_data : Pointer(Void)?) : Nil
    # hb_font_get_glyph_shape: (None)
    # @draw_data: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    draw_data = if draw_data.nil?
                  Pointer(Void).null
                else
                  draw_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_get_glyph_shape(font, glyph, dfuncs, draw_data)

    # Return value handling
  end

  def self.font_get_glyph_v_advance(font : HarfBuzz::FontT, glyph : UInt32) : Int32
    # hb_font_get_glyph_v_advance: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_font_get_glyph_v_advance(font, glyph)

    # Return value handling

    _retval
  end

  def self.font_get_glyph_v_advances(font : HarfBuzz::FontT, count : UInt32, first_glyph : Pointer(UInt32), glyph_stride : UInt32, first_advance : Int32, advance_stride : UInt32) : Nil
    # hb_font_get_glyph_v_advances: (None)
    # @first_advance: (out) (transfer full)
    # @advance_stride: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_font_get_glyph_v_advances(font, count, first_glyph, glyph_stride, first_advance, advance_stride)

    # Return value handling
  end

  def self.font_get_glyph_v_kerning(font : HarfBuzz::FontT, top_glyph : UInt32, bottom_glyph : UInt32) : Int32
    # hb_font_get_glyph_v_kerning: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_font_get_glyph_v_kerning(font, top_glyph, bottom_glyph)

    # Return value handling

    _retval
  end

  def self.font_get_glyph_v_origin(font : HarfBuzz::FontT, glyph : UInt32, x : Int32, y : Int32) : Int32
    # hb_font_get_glyph_v_origin: (None)
    # @x: (out) (transfer full)
    # @y: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_font_get_glyph_v_origin(font, glyph, x, y)

    # Return value handling

    _retval
  end

  def self.font_get_h_extents(font : HarfBuzz::FontT) : HarfBuzz::FontExtentsT
    # hb_font_get_h_extents: (None)
    # @extents: (out) (caller-allocates)
    # Returns: (transfer none)

    # Generator::CallerAllocatesPlan
    extents = HarfBuzz::FontExtentsT.new
    # C call
    _retval = LibHarfBuzz.hb_font_get_h_extents(font, extents)

    # Return value handling

    extents
  end

  def self.font_get_nominal_glyph(font : HarfBuzz::FontT, unicode : UInt32, glyph : UInt32) : Int32
    # hb_font_get_nominal_glyph: (None)
    # @glyph: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_font_get_nominal_glyph(font, unicode, glyph)

    # Return value handling

    _retval
  end

  def self.font_get_nominal_glyphs(font : HarfBuzz::FontT, count : UInt32, first_unicode : Pointer(UInt32), unicode_stride : UInt32, first_glyph : UInt32, glyph_stride : UInt32) : UInt32
    # hb_font_get_nominal_glyphs: (None)
    # @first_glyph: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_font_get_nominal_glyphs(font, count, first_unicode, unicode_stride, first_glyph, glyph_stride)

    # Return value handling

    _retval
  end

  def self.font_get_parent(font : HarfBuzz::FontT) : HarfBuzz::FontT
    # hb_font_get_parent: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_font_get_parent(font)

    # Return value handling

    HarfBuzz::FontT.new(_retval, GICrystal::Transfer::None)
  end

  def self.font_get_ppem(font : HarfBuzz::FontT, x_ppem : UInt32, y_ppem : UInt32) : Nil
    # hb_font_get_ppem: (None)
    # @x_ppem: (out) (transfer full)
    # @y_ppem: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_font_get_ppem(font, x_ppem, y_ppem)

    # Return value handling
  end

  def self.font_get_ptem(font : HarfBuzz::FontT) : Float32
    # hb_font_get_ptem: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_font_get_ptem(font)

    # Return value handling

    _retval
  end

  def self.font_get_scale(font : HarfBuzz::FontT, x_scale : Int32, y_scale : Int32) : Nil
    # hb_font_get_scale: (None)
    # @x_scale: (out) (transfer full)
    # @y_scale: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_font_get_scale(font, x_scale, y_scale)

    # Return value handling
  end

  def self.font_get_synthetic_slant(font : HarfBuzz::FontT) : Float32
    # hb_font_get_synthetic_slant: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_font_get_synthetic_slant(font)

    # Return value handling

    _retval
  end

  def self.font_get_v_extents(font : HarfBuzz::FontT) : HarfBuzz::FontExtentsT
    # hb_font_get_v_extents: (None)
    # @extents: (out) (caller-allocates)
    # Returns: (transfer none)

    # Generator::CallerAllocatesPlan
    extents = HarfBuzz::FontExtentsT.new
    # C call
    _retval = LibHarfBuzz.hb_font_get_v_extents(font, extents)

    # Return value handling

    extents
  end

  def self.font_get_var_coords_design(font : HarfBuzz::FontT, length : UInt32) : Pointer(Float32)
    # hb_font_get_var_coords_design: (None)
    # @length: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_font_get_var_coords_design(font, length)

    # Return value handling

    _retval
  end

  def self.font_get_var_coords_normalized(font : HarfBuzz::FontT, length : UInt32) : Pointer(Int32)
    # hb_font_get_var_coords_normalized: (None)
    # @length: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_font_get_var_coords_normalized(font, length)

    # Return value handling

    _retval
  end

  def self.font_get_variation_glyph(font : HarfBuzz::FontT, unicode : UInt32, variation_selector : UInt32, glyph : UInt32) : Int32
    # hb_font_get_variation_glyph: (None)
    # @glyph: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_font_get_variation_glyph(font, unicode, variation_selector, glyph)

    # Return value handling

    _retval
  end

  def self.font_glyph_from_string(font : HarfBuzz::FontT, s : Enumerable(UInt8), glyph : UInt32) : Int32
    # hb_font_glyph_from_string: (None)
    # @s: (array length=len element-type UInt8)
    # @glyph: (out) (transfer full)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    len = s.size # Generator::ArrayArgPlan
    s = s.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_font_glyph_from_string(font, s, len, glyph)

    # Return value handling

    _retval
  end

  def self.font_glyph_to_string(font : HarfBuzz::FontT, glyph : UInt32, s : Enumerable(::String)) : Nil
    # hb_font_glyph_to_string: (None)
    # @s: (out) (transfer full) (array length=size element-type Utf8)
    # @size: (out) (transfer full)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    size = s.size # Generator::ArrayArgPlan
    s = s.to_a.map(&.to_unsafe).to_unsafe

    # C call
    LibHarfBuzz.hb_font_glyph_to_string(font, glyph, s, size)

    # Return value handling
  end

  def self.font_is_immutable(font : HarfBuzz::FontT) : Int32
    # hb_font_is_immutable: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_font_is_immutable(font)

    # Return value handling

    _retval
  end

  def self.font_make_immutable(font : HarfBuzz::FontT) : Nil
    # hb_font_make_immutable: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_font_make_immutable(font)

    # Return value handling
  end

  def self.font_set_face(font : HarfBuzz::FontT, face : HarfBuzz::FaceT) : Nil
    # hb_font_set_face: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_font_set_face(font, face)

    # Return value handling
  end

  def self.font_set_funcs(font : HarfBuzz::FontT, klass : HarfBuzz::FontFuncsT, font_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_font_set_funcs: (None)
    # @font_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    font_data = if font_data.nil?
                  Pointer(Void).null
                else
                  font_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_set_funcs(font, klass, font_data, destroy)

    # Return value handling
  end

  def self.font_set_funcs_data(font : HarfBuzz::FontT, font_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_font_set_funcs_data: (None)
    # @font_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    font_data = if font_data.nil?
                  Pointer(Void).null
                else
                  font_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_font_set_funcs_data(font, font_data, destroy)

    # Return value handling
  end

  def self.font_set_parent(font : HarfBuzz::FontT, parent : HarfBuzz::FontT) : Nil
    # hb_font_set_parent: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_font_set_parent(font, parent)

    # Return value handling
  end

  def self.font_set_ppem(font : HarfBuzz::FontT, x_ppem : UInt32, y_ppem : UInt32) : Nil
    # hb_font_set_ppem: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_font_set_ppem(font, x_ppem, y_ppem)

    # Return value handling
  end

  def self.font_set_ptem(font : HarfBuzz::FontT, ptem : Float32) : Nil
    # hb_font_set_ptem: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_font_set_ptem(font, ptem)

    # Return value handling
  end

  def self.font_set_scale(font : HarfBuzz::FontT, x_scale : Int32, y_scale : Int32) : Nil
    # hb_font_set_scale: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_font_set_scale(font, x_scale, y_scale)

    # Return value handling
  end

  def self.font_set_synthetic_slant(font : HarfBuzz::FontT, slant : Float32) : Nil
    # hb_font_set_synthetic_slant: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_font_set_synthetic_slant(font, slant)

    # Return value handling
  end

  def self.font_set_var_coords_design(font : HarfBuzz::FontT, coords : Enumerable(Float32)) : Nil
    # hb_font_set_var_coords_design: (None)
    # @coords: (array length=coords_length element-type Float)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    coords_length = coords.size # Generator::ArrayArgPlan
    coords = coords.to_a.to_unsafe

    # C call
    LibHarfBuzz.hb_font_set_var_coords_design(font, coords, coords_length)

    # Return value handling
  end

  def self.font_set_var_coords_normalized(font : HarfBuzz::FontT, coords : Enumerable(Int32)) : Nil
    # hb_font_set_var_coords_normalized: (None)
    # @coords: (array length=coords_length element-type Int32)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    coords_length = coords.size # Generator::ArrayArgPlan
    coords = coords.to_a.to_unsafe

    # C call
    LibHarfBuzz.hb_font_set_var_coords_normalized(font, coords, coords_length)

    # Return value handling
  end

  def self.font_set_var_named_instance(font : HarfBuzz::FontT, instance_index : UInt32) : Nil
    # hb_font_set_var_named_instance: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_font_set_var_named_instance(font, instance_index)

    # Return value handling
  end

  def self.font_set_variations(font : HarfBuzz::FontT, variations : Enumerable(HarfBuzz::VariationT)) : Nil
    # hb_font_set_variations: (None)
    # @variations: (array length=variations_length element-type Interface)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    variations_length = variations.size # Generator::ArrayArgPlan
    variations = variations.to_a.map(&.to_unsafe).to_unsafe

    # C call
    LibHarfBuzz.hb_font_set_variations(font, variations, variations_length)

    # Return value handling
  end

  def self.font_subtract_glyph_origin_for_direction(font : HarfBuzz::FontT, glyph : UInt32, direction : HarfBuzz::DirectionT, x : Int32, y : Int32) : Nil
    # hb_font_subtract_glyph_origin_for_direction: (None)
    # @x: (inout) (transfer full)
    # @y: (inout) (transfer full)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_font_subtract_glyph_origin_for_direction(font, glyph, direction, x, y)

    # Return value handling
  end

  def self.ft_font_changed(font : HarfBuzz::FontT) : Nil
    # hb_ft_font_changed: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_ft_font_changed(font)

    # Return value handling
  end

  def self.ft_font_get_load_flags(font : HarfBuzz::FontT) : Int32
    # hb_ft_font_get_load_flags: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ft_font_get_load_flags(font)

    # Return value handling

    _retval
  end

  def self.ft_font_set_funcs(font : HarfBuzz::FontT) : Nil
    # hb_ft_font_set_funcs: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_ft_font_set_funcs(font)

    # Return value handling
  end

  def self.ft_font_set_load_flags(font : HarfBuzz::FontT, load_flags : Int32) : Nil
    # hb_ft_font_set_load_flags: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_ft_font_set_load_flags(font, load_flags)

    # Return value handling
  end

  def self.ft_font_unlock_face(font : HarfBuzz::FontT) : Nil
    # hb_ft_font_unlock_face: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_ft_font_unlock_face(font)

    # Return value handling
  end

  def self.glib_blob_create(gbytes : GLib::Bytes) : HarfBuzz::BlobT
    # hb_glib_blob_create: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_glib_blob_create(gbytes)

    # Return value handling

    HarfBuzz::BlobT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.glib_get_unicode_funcs : HarfBuzz::UnicodeFuncsT
    # hb_glib_get_unicode_funcs: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_glib_get_unicode_funcs

    # Return value handling

    HarfBuzz::UnicodeFuncsT.new(_retval, GICrystal::Transfer::None)
  end

  def self.glib_script_from_script(script : HarfBuzz::ScriptT) : GLib::UnicodeScript
    # hb_glib_script_from_script: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_glib_script_from_script(script)

    # Return value handling

    GLib::UnicodeScript.new(_retval)
  end

  def self.glib_script_to_script(script : GLib::UnicodeScript) : HarfBuzz::ScriptT
    # hb_glib_script_to_script: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_glib_script_to_script(script)

    # Return value handling

    HarfBuzz::ScriptT.new(_retval)
  end

  def self.glyph_info_get_glyph_flags(info : HarfBuzz::GlyphInfoT) : HarfBuzz::GlyphFlagsT
    # hb_glyph_info_get_glyph_flags: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_glyph_info_get_glyph_flags(info)

    # Return value handling

    HarfBuzz::GlyphFlagsT.new(_retval)
  end

  def self.language_from_string(str : Enumerable(UInt8)) : HarfBuzz::LanguageT
    # hb_language_from_string: (None)
    # @str: (array length=len element-type UInt8)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    len = str.size # Generator::ArrayArgPlan
    str = str.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_language_from_string(str, len)

    # Return value handling

    HarfBuzz::LanguageT.new(_retval, GICrystal::Transfer::None)
  end

  def self.language_from_string(*str : UInt8)
    self.language_from_string(str)
  end

  def self.language_get_default : HarfBuzz::LanguageT
    # hb_language_get_default: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_language_get_default

    # Return value handling

    HarfBuzz::LanguageT.new(_retval, GICrystal::Transfer::None)
  end

  def self.language_to_string(language : HarfBuzz::LanguageT) : ::String
    # hb_language_to_string: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_language_to_string(language)

    # Return value handling

    ::String.new(_retval)
  end

  def self.map_allocation_successful(map : HarfBuzz::MapT) : Int32
    # hb_map_allocation_successful: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_map_allocation_successful(map)

    # Return value handling

    _retval
  end

  def self.map_clear(map : HarfBuzz::MapT) : Nil
    # hb_map_clear: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_map_clear(map)

    # Return value handling
  end

  def self.map_create : HarfBuzz::MapT
    # hb_map_create: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_map_create

    # Return value handling

    HarfBuzz::MapT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.map_del(map : HarfBuzz::MapT, key : UInt32) : Nil
    # hb_map_del: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_map_del(map, key)

    # Return value handling
  end

  def self.map_get(map : HarfBuzz::MapT, key : UInt32) : UInt32
    # hb_map_get: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_map_get(map, key)

    # Return value handling

    _retval
  end

  def self.map_get_empty : HarfBuzz::MapT
    # hb_map_get_empty: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_map_get_empty

    # Return value handling

    HarfBuzz::MapT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.map_get_population(map : HarfBuzz::MapT) : UInt32
    # hb_map_get_population: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_map_get_population(map)

    # Return value handling

    _retval
  end

  def self.map_has(map : HarfBuzz::MapT, key : UInt32) : Int32
    # hb_map_has: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_map_has(map, key)

    # Return value handling

    _retval
  end

  def self.map_is_empty(map : HarfBuzz::MapT) : Int32
    # hb_map_is_empty: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_map_is_empty(map)

    # Return value handling

    _retval
  end

  def self.map_set(map : HarfBuzz::MapT, key : UInt32, value : UInt32) : Nil
    # hb_map_set: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_map_set(map, key, value)

    # Return value handling
  end

  def self.ot_color_glyph_get_layers(face : HarfBuzz::FaceT, glyph : UInt32, start_offset : UInt32, layers : Enumerable(HarfBuzz::OtColorLayerT)?) : UInt32
    # hb_ot_color_glyph_get_layers: (None)
    # @layer_count: (out) (transfer full) (optional)
    # @layers: (out) (nullable) (caller-allocates) (array length=layer_count element-type Interface)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    layer_count = Pointer(UInt32).null    # Generator::ArrayLengthArgPlan
    layer_count = layers.try(&.size) || 0 # Generator::NullableArrayPlan
    layers = if layers.nil?
               Pointer(Void).null
             else
               layers.to_a.map(&.to_unsafe).to_unsafe
             end

    # C call
    _retval = LibHarfBuzz.hb_ot_color_glyph_get_layers(face, glyph, start_offset, layer_count, layers)

    # Return value handling

    _retval
  end

  def self.ot_color_glyph_reference_png(font : HarfBuzz::FontT, glyph : UInt32) : HarfBuzz::BlobT
    # hb_ot_color_glyph_reference_png: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_ot_color_glyph_reference_png(font, glyph)

    # Return value handling

    HarfBuzz::BlobT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.ot_color_glyph_reference_svg(face : HarfBuzz::FaceT, glyph : UInt32) : HarfBuzz::BlobT
    # hb_ot_color_glyph_reference_svg: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_ot_color_glyph_reference_svg(face, glyph)

    # Return value handling

    HarfBuzz::BlobT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.ot_color_has_layers(face : HarfBuzz::FaceT) : Int32
    # hb_ot_color_has_layers: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_color_has_layers(face)

    # Return value handling

    _retval
  end

  def self.ot_color_has_palettes(face : HarfBuzz::FaceT) : Int32
    # hb_ot_color_has_palettes: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_color_has_palettes(face)

    # Return value handling

    _retval
  end

  def self.ot_color_has_png(face : HarfBuzz::FaceT) : Int32
    # hb_ot_color_has_png: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_color_has_png(face)

    # Return value handling

    _retval
  end

  def self.ot_color_has_svg(face : HarfBuzz::FaceT) : Int32
    # hb_ot_color_has_svg: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_color_has_svg(face)

    # Return value handling

    _retval
  end

  def self.ot_color_palette_color_get_name_id(face : HarfBuzz::FaceT, color_index : UInt32) : UInt32
    # hb_ot_color_palette_color_get_name_id: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_color_palette_color_get_name_id(face, color_index)

    # Return value handling

    _retval
  end

  def self.ot_color_palette_get_colors(face : HarfBuzz::FaceT, palette_index : UInt32, start_offset : UInt32, colors : Enumerable(UInt32)?) : UInt32
    # hb_ot_color_palette_get_colors: (None)
    # @color_count: (out) (transfer full) (optional)
    # @colors: (out) (transfer full) (nullable) (array length=color_count element-type UInt32)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    color_count = Pointer(UInt32).null    # Generator::ArrayLengthArgPlan
    color_count = colors.try(&.size) || 0 # Generator::NullableArrayPlan
    colors = if colors.nil?
               Pointer(UInt32).null
             else
               colors.to_a.to_unsafe
             end

    # C call
    _retval = LibHarfBuzz.hb_ot_color_palette_get_colors(face, palette_index, start_offset, color_count, colors)

    # Return value handling

    _retval
  end

  def self.ot_color_palette_get_count(face : HarfBuzz::FaceT) : UInt32
    # hb_ot_color_palette_get_count: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_color_palette_get_count(face)

    # Return value handling

    _retval
  end

  def self.ot_color_palette_get_flags(face : HarfBuzz::FaceT, palette_index : UInt32) : HarfBuzz::OtColorPaletteFlagsT
    # hb_ot_color_palette_get_flags: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_color_palette_get_flags(face, palette_index)

    # Return value handling

    HarfBuzz::OtColorPaletteFlagsT.new(_retval)
  end

  def self.ot_color_palette_get_name_id(face : HarfBuzz::FaceT, palette_index : UInt32) : UInt32
    # hb_ot_color_palette_get_name_id: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_color_palette_get_name_id(face, palette_index)

    # Return value handling

    _retval
  end

  def self.ot_font_set_funcs(font : HarfBuzz::FontT) : Nil
    # hb_ot_font_set_funcs: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_ot_font_set_funcs(font)

    # Return value handling
  end

  def self.ot_layout_collect_features(face : HarfBuzz::FaceT, table_tag : UInt32, scripts : Pointer(UInt32), languages : Pointer(UInt32), features : Pointer(UInt32)) : HarfBuzz::SetT
    # hb_ot_layout_collect_features: (None)
    # @feature_indexes: (out) (caller-allocates)
    # Returns: (transfer none)

    # Generator::CallerAllocatesPlan
    feature_indexes = HarfBuzz::SetT.new
    # C call
    LibHarfBuzz.hb_ot_layout_collect_features(face, table_tag, scripts, languages, features, feature_indexes)

    # Return value handling

    feature_indexes
  end

  def self.ot_layout_collect_lookups(face : HarfBuzz::FaceT, table_tag : UInt32, scripts : Pointer(UInt32), languages : Pointer(UInt32), features : Pointer(UInt32)) : HarfBuzz::SetT
    # hb_ot_layout_collect_lookups: (None)
    # @lookup_indexes: (out) (caller-allocates)
    # Returns: (transfer none)

    # Generator::CallerAllocatesPlan
    lookup_indexes = HarfBuzz::SetT.new
    # C call
    LibHarfBuzz.hb_ot_layout_collect_lookups(face, table_tag, scripts, languages, features, lookup_indexes)

    # Return value handling

    lookup_indexes
  end

  def self.ot_layout_feature_get_characters(face : HarfBuzz::FaceT, table_tag : UInt32, feature_index : UInt32, start_offset : UInt32, characters : Enumerable(UInt32)) : UInt32
    # hb_ot_layout_feature_get_characters: (None)
    # @char_count: (out) (transfer full) (optional)
    # @characters: (out) (caller-allocates) (array length=char_count element-type UInt32)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    char_count = Pointer(UInt32).null # Generator::ArrayLengthArgPlan
    char_count = characters.size      # Generator::ArrayArgPlan
    characters = characters.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_feature_get_characters(face, table_tag, feature_index, start_offset, char_count, characters)

    # Return value handling

    _retval
  end

  def self.ot_layout_feature_get_lookups(face : HarfBuzz::FaceT, table_tag : UInt32, feature_index : UInt32, start_offset : UInt32, lookup_indexes : Enumerable(UInt32)) : UInt32
    # hb_ot_layout_feature_get_lookups: (None)
    # @lookup_count: (out) (transfer full) (optional)
    # @lookup_indexes: (out) (transfer full) (array length=lookup_count element-type UInt32)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    lookup_count = Pointer(UInt32).null # Generator::ArrayLengthArgPlan
    lookup_count = lookup_indexes.size  # Generator::ArrayArgPlan
    lookup_indexes = lookup_indexes.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_feature_get_lookups(face, table_tag, feature_index, start_offset, lookup_count, lookup_indexes)

    # Return value handling

    _retval
  end

  def self.ot_layout_feature_get_name_ids(face : HarfBuzz::FaceT, table_tag : UInt32, feature_index : UInt32) : Int32
    # hb_ot_layout_feature_get_name_ids: (None)
    # @label_id: (out) (transfer full) (optional)
    # @tooltip_id: (out) (transfer full) (optional)
    # @sample_id: (out) (transfer full) (optional)
    # @num_named_parameters: (out) (transfer full) (optional)
    # @first_param_id: (out) (transfer full) (optional)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    label_id = Pointer(UInt32).null             # Generator::OutArgUsedInReturnPlan
    tooltip_id = Pointer(UInt32).null           # Generator::OutArgUsedInReturnPlan
    sample_id = Pointer(UInt32).null            # Generator::OutArgUsedInReturnPlan
    num_named_parameters = Pointer(UInt32).null # Generator::OutArgUsedInReturnPlan
    first_param_id = Pointer(UInt32).null
    # C call
    _retval = LibHarfBuzz.hb_ot_layout_feature_get_name_ids(face, table_tag, feature_index, label_id, tooltip_id, sample_id, num_named_parameters, first_param_id)

    # Return value handling

    _retval
  end

  def self.ot_layout_feature_with_variations_get_lookups(face : HarfBuzz::FaceT, table_tag : UInt32, feature_index : UInt32, variations_index : UInt32, start_offset : UInt32, lookup_indexes : Enumerable(UInt32)) : UInt32
    # hb_ot_layout_feature_with_variations_get_lookups: (None)
    # @lookup_count: (out) (transfer full) (optional)
    # @lookup_indexes: (out) (transfer full) (array length=lookup_count element-type UInt32)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    lookup_count = Pointer(UInt32).null # Generator::ArrayLengthArgPlan
    lookup_count = lookup_indexes.size  # Generator::ArrayArgPlan
    lookup_indexes = lookup_indexes.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_feature_with_variations_get_lookups(face, table_tag, feature_index, variations_index, start_offset, lookup_count, lookup_indexes)

    # Return value handling

    _retval
  end

  def self.ot_layout_get_attach_points(face : HarfBuzz::FaceT, glyph : UInt32, start_offset : UInt32, point_array : Enumerable(UInt32)) : UInt32
    # hb_ot_layout_get_attach_points: (None)
    # @point_count: (out) (transfer full) (optional)
    # @point_array: (out) (transfer full) (array length=point_count element-type UInt32)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    point_count = Pointer(UInt32).null # Generator::ArrayLengthArgPlan
    point_count = point_array.size     # Generator::ArrayArgPlan
    point_array = point_array.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_get_attach_points(face, glyph, start_offset, point_count, point_array)

    # Return value handling

    _retval
  end

  def self.ot_layout_get_baseline(font : HarfBuzz::FontT, baseline_tag : HarfBuzz::OtLayoutBaselineTagT, direction : HarfBuzz::DirectionT, script_tag : UInt32, language_tag : UInt32, coord : Int32?) : Int32
    # hb_ot_layout_get_baseline: (None)
    # @coord: (out) (transfer full) (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    coord = if coord.nil?
              Int32.null
            else
              coord.to_unsafe
            end

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_get_baseline(font, baseline_tag, direction, script_tag, language_tag, coord)

    # Return value handling

    _retval
  end

  def self.ot_layout_get_baseline_with_fallback(font : HarfBuzz::FontT, baseline_tag : HarfBuzz::OtLayoutBaselineTagT, direction : HarfBuzz::DirectionT, script_tag : UInt32, language_tag : UInt32, coord : Int32) : Nil
    # hb_ot_layout_get_baseline_with_fallback: (None)
    # @coord: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_ot_layout_get_baseline_with_fallback(font, baseline_tag, direction, script_tag, language_tag, coord)

    # Return value handling
  end

  def self.ot_layout_get_glyph_class(face : HarfBuzz::FaceT, glyph : UInt32) : HarfBuzz::OtLayoutGlyphClassT
    # hb_ot_layout_get_glyph_class: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_get_glyph_class(face, glyph)

    # Return value handling

    HarfBuzz::OtLayoutGlyphClassT.new(_retval)
  end

  def self.ot_layout_get_glyphs_in_class(face : HarfBuzz::FaceT, klass : HarfBuzz::OtLayoutGlyphClassT) : HarfBuzz::SetT
    # hb_ot_layout_get_glyphs_in_class: (None)
    # @glyphs: (out) (caller-allocates)
    # Returns: (transfer none)

    # Generator::CallerAllocatesPlan
    glyphs = HarfBuzz::SetT.new
    # C call
    LibHarfBuzz.hb_ot_layout_get_glyphs_in_class(face, klass, glyphs)

    # Return value handling

    glyphs
  end

  def self.ot_layout_get_horizontal_baseline_tag_for_script(script : HarfBuzz::ScriptT) : HarfBuzz::OtLayoutBaselineTagT
    # hb_ot_layout_get_horizontal_baseline_tag_for_script: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_get_horizontal_baseline_tag_for_script(script)

    # Return value handling

    HarfBuzz::OtLayoutBaselineTagT.new(_retval)
  end

  def self.ot_layout_get_ligature_carets(font : HarfBuzz::FontT, direction : HarfBuzz::DirectionT, glyph : UInt32, start_offset : UInt32, caret_array : Enumerable(Int32)) : UInt32
    # hb_ot_layout_get_ligature_carets: (None)
    # @caret_count: (out) (transfer full) (optional)
    # @caret_array: (out) (transfer full) (array length=caret_count element-type Int32)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    caret_count = Pointer(UInt32).null # Generator::ArrayLengthArgPlan
    caret_count = caret_array.size     # Generator::ArrayArgPlan
    caret_array = caret_array.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_get_ligature_carets(font, direction, glyph, start_offset, caret_count, caret_array)

    # Return value handling

    _retval
  end

  def self.ot_layout_get_size_params(face : HarfBuzz::FaceT, design_size : UInt32, subfamily_id : UInt32, subfamily_name_id : UInt32, range_start : UInt32, range_end : UInt32) : Int32
    # hb_ot_layout_get_size_params: (None)
    # @design_size: (out) (transfer full)
    # @subfamily_id: (out) (transfer full)
    # @subfamily_name_id: (out) (transfer full)
    # @range_start: (out) (transfer full)
    # @range_end: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_get_size_params(face, design_size, subfamily_id, subfamily_name_id, range_start, range_end)

    # Return value handling

    _retval
  end

  def self.ot_layout_has_glyph_classes(face : HarfBuzz::FaceT) : Int32
    # hb_ot_layout_has_glyph_classes: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_has_glyph_classes(face)

    # Return value handling

    _retval
  end

  def self.ot_layout_has_positioning(face : HarfBuzz::FaceT) : Int32
    # hb_ot_layout_has_positioning: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_has_positioning(face)

    # Return value handling

    _retval
  end

  def self.ot_layout_has_substitution(face : HarfBuzz::FaceT) : Int32
    # hb_ot_layout_has_substitution: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_has_substitution(face)

    # Return value handling

    _retval
  end

  def self.ot_layout_language_find_feature(face : HarfBuzz::FaceT, table_tag : UInt32, script_index : UInt32, language_index : UInt32, feature_tag : UInt32, feature_index : UInt32) : Int32
    # hb_ot_layout_language_find_feature: (None)
    # @feature_index: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_language_find_feature(face, table_tag, script_index, language_index, feature_tag, feature_index)

    # Return value handling

    _retval
  end

  def self.ot_layout_language_get_feature_indexes(face : HarfBuzz::FaceT, table_tag : UInt32, script_index : UInt32, language_index : UInt32, start_offset : UInt32, feature_indexes : Enumerable(UInt32)) : UInt32
    # hb_ot_layout_language_get_feature_indexes: (None)
    # @feature_count: (out) (transfer full) (optional)
    # @feature_indexes: (out) (transfer full) (array length=feature_count element-type UInt32)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    feature_count = Pointer(UInt32).null # Generator::ArrayLengthArgPlan
    feature_count = feature_indexes.size # Generator::ArrayArgPlan
    feature_indexes = feature_indexes.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_language_get_feature_indexes(face, table_tag, script_index, language_index, start_offset, feature_count, feature_indexes)

    # Return value handling

    _retval
  end

  def self.ot_layout_language_get_feature_tags(face : HarfBuzz::FaceT, table_tag : UInt32, script_index : UInt32, language_index : UInt32, start_offset : UInt32, feature_tags : Enumerable(UInt32)) : UInt32
    # hb_ot_layout_language_get_feature_tags: (None)
    # @feature_count: (out) (transfer full) (optional)
    # @feature_tags: (out) (transfer full) (array length=feature_count element-type UInt32)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    feature_count = Pointer(UInt32).null # Generator::ArrayLengthArgPlan
    feature_count = feature_tags.size    # Generator::ArrayArgPlan
    feature_tags = feature_tags.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_language_get_feature_tags(face, table_tag, script_index, language_index, start_offset, feature_count, feature_tags)

    # Return value handling

    _retval
  end

  def self.ot_layout_language_get_required_feature(face : HarfBuzz::FaceT, table_tag : UInt32, script_index : UInt32, language_index : UInt32, feature_index : UInt32, feature_tag : UInt32) : Int32
    # hb_ot_layout_language_get_required_feature: (None)
    # @feature_index: (out) (transfer full)
    # @feature_tag: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_language_get_required_feature(face, table_tag, script_index, language_index, feature_index, feature_tag)

    # Return value handling

    _retval
  end

  def self.ot_layout_language_get_required_feature_index(face : HarfBuzz::FaceT, table_tag : UInt32, script_index : UInt32, language_index : UInt32, feature_index : UInt32) : Int32
    # hb_ot_layout_language_get_required_feature_index: (None)
    # @feature_index: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_language_get_required_feature_index(face, table_tag, script_index, language_index, feature_index)

    # Return value handling

    _retval
  end

  def self.ot_layout_lookup_collect_glyphs(face : HarfBuzz::FaceT, table_tag : UInt32, lookup_index : UInt32) : HarfBuzz::SetT
    # hb_ot_layout_lookup_collect_glyphs: (None)
    # @glyphs_before: (out) (caller-allocates)
    # @glyphs_input: (out) (caller-allocates)
    # @glyphs_after: (out) (caller-allocates)
    # @glyphs_output: (out) (caller-allocates)
    # Returns: (transfer none)

    # Generator::CallerAllocatesPlan
    glyphs_before = HarfBuzz::SetT.new # Generator::CallerAllocatesPlan
    glyphs_input = HarfBuzz::SetT.new  # Generator::CallerAllocatesPlan
    glyphs_after = HarfBuzz::SetT.new  # Generator::CallerAllocatesPlan
    glyphs_output = HarfBuzz::SetT.new
    # C call
    LibHarfBuzz.hb_ot_layout_lookup_collect_glyphs(face, table_tag, lookup_index, glyphs_before, glyphs_input, glyphs_after, glyphs_output)

    # Return value handling

    glyphs_before
  end

  def self.ot_layout_lookup_get_glyph_alternates(face : HarfBuzz::FaceT, lookup_index : UInt32, glyph : UInt32, start_offset : UInt32, alternate_glyphs : Enumerable(UInt32)) : UInt32
    # hb_ot_layout_lookup_get_glyph_alternates: (None)
    # @alternate_count: (out) (transfer full) (optional)
    # @alternate_glyphs: (out) (caller-allocates) (array length=alternate_count element-type UInt32)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    alternate_count = Pointer(UInt32).null  # Generator::ArrayLengthArgPlan
    alternate_count = alternate_glyphs.size # Generator::ArrayArgPlan
    alternate_glyphs = alternate_glyphs.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_lookup_get_glyph_alternates(face, lookup_index, glyph, start_offset, alternate_count, alternate_glyphs)

    # Return value handling

    _retval
  end

  def self.ot_layout_lookup_substitute_closure(face : HarfBuzz::FaceT, lookup_index : UInt32) : HarfBuzz::SetT
    # hb_ot_layout_lookup_substitute_closure: (None)
    # @glyphs: (out) (caller-allocates)
    # Returns: (transfer none)

    # Generator::CallerAllocatesPlan
    glyphs = HarfBuzz::SetT.new
    # C call
    LibHarfBuzz.hb_ot_layout_lookup_substitute_closure(face, lookup_index, glyphs)

    # Return value handling

    glyphs
  end

  def self.ot_layout_lookup_would_substitute(face : HarfBuzz::FaceT, lookup_index : UInt32, glyphs : Pointer(UInt32), glyphs_length : UInt32, zero_context : Int32) : Int32
    # hb_ot_layout_lookup_would_substitute: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_lookup_would_substitute(face, lookup_index, glyphs, glyphs_length, zero_context)

    # Return value handling

    _retval
  end

  def self.ot_layout_lookups_substitute_closure(face : HarfBuzz::FaceT, lookups : HarfBuzz::SetT) : HarfBuzz::SetT
    # hb_ot_layout_lookups_substitute_closure: (None)
    # @glyphs: (out) (caller-allocates)
    # Returns: (transfer none)

    # Generator::CallerAllocatesPlan
    glyphs = HarfBuzz::SetT.new
    # C call
    LibHarfBuzz.hb_ot_layout_lookups_substitute_closure(face, lookups, glyphs)

    # Return value handling

    glyphs
  end

  def self.ot_layout_script_find_language(face : HarfBuzz::FaceT, table_tag : UInt32, script_index : UInt32, language_tag : UInt32, language_index : Pointer(UInt32)) : Int32
    # hb_ot_layout_script_find_language: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_script_find_language(face, table_tag, script_index, language_tag, language_index)

    # Return value handling

    _retval
  end

  def self.ot_layout_script_get_language_tags(face : HarfBuzz::FaceT, table_tag : UInt32, script_index : UInt32, start_offset : UInt32, language_tags : Enumerable(UInt32)) : UInt32
    # hb_ot_layout_script_get_language_tags: (None)
    # @language_count: (out) (transfer full) (optional)
    # @language_tags: (out) (transfer full) (array length=language_count element-type UInt32)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    language_count = Pointer(UInt32).null # Generator::ArrayLengthArgPlan
    language_count = language_tags.size   # Generator::ArrayArgPlan
    language_tags = language_tags.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_script_get_language_tags(face, table_tag, script_index, start_offset, language_count, language_tags)

    # Return value handling

    _retval
  end

  def self.ot_layout_script_select_language(face : HarfBuzz::FaceT, table_tag : UInt32, script_index : UInt32, language_count : UInt32, language_tags : Pointer(UInt32), language_index : UInt32) : Int32
    # hb_ot_layout_script_select_language: (None)
    # @language_index: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_script_select_language(face, table_tag, script_index, language_count, language_tags, language_index)

    # Return value handling

    _retval
  end

  def self.ot_layout_table_choose_script(face : HarfBuzz::FaceT, table_tag : UInt32, script_tags : Pointer(UInt32), script_index : UInt32, chosen_script : UInt32) : Int32
    # hb_ot_layout_table_choose_script: (None)
    # @script_index: (out) (transfer full)
    # @chosen_script: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_table_choose_script(face, table_tag, script_tags, script_index, chosen_script)

    # Return value handling

    _retval
  end

  def self.ot_layout_table_find_feature_variations(face : HarfBuzz::FaceT, table_tag : UInt32, coords : Pointer(Int32), num_coords : UInt32, variations_index : UInt32) : Int32
    # hb_ot_layout_table_find_feature_variations: (None)
    # @variations_index: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_table_find_feature_variations(face, table_tag, coords, num_coords, variations_index)

    # Return value handling

    _retval
  end

  def self.ot_layout_table_find_script(face : HarfBuzz::FaceT, table_tag : UInt32, script_tag : UInt32, script_index : UInt32) : Int32
    # hb_ot_layout_table_find_script: (None)
    # @script_index: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_table_find_script(face, table_tag, script_tag, script_index)

    # Return value handling

    _retval
  end

  def self.ot_layout_table_get_feature_tags(face : HarfBuzz::FaceT, table_tag : UInt32, start_offset : UInt32, feature_tags : Enumerable(UInt32)) : UInt32
    # hb_ot_layout_table_get_feature_tags: (None)
    # @feature_count: (out) (transfer full) (optional)
    # @feature_tags: (out) (transfer full) (array length=feature_count element-type UInt32)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    feature_count = Pointer(UInt32).null # Generator::ArrayLengthArgPlan
    feature_count = feature_tags.size    # Generator::ArrayArgPlan
    feature_tags = feature_tags.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_table_get_feature_tags(face, table_tag, start_offset, feature_count, feature_tags)

    # Return value handling

    _retval
  end

  def self.ot_layout_table_get_lookup_count(face : HarfBuzz::FaceT, table_tag : UInt32) : UInt32
    # hb_ot_layout_table_get_lookup_count: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_table_get_lookup_count(face, table_tag)

    # Return value handling

    _retval
  end

  def self.ot_layout_table_get_script_tags(face : HarfBuzz::FaceT, table_tag : UInt32, start_offset : UInt32, script_tags : Enumerable(UInt32)) : UInt32
    # hb_ot_layout_table_get_script_tags: (None)
    # @script_count: (out) (transfer full) (optional)
    # @script_tags: (out) (transfer full) (array length=script_count element-type UInt32)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    script_count = Pointer(UInt32).null # Generator::ArrayLengthArgPlan
    script_count = script_tags.size     # Generator::ArrayArgPlan
    script_tags = script_tags.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_ot_layout_table_get_script_tags(face, table_tag, start_offset, script_count, script_tags)

    # Return value handling

    _retval
  end

  def self.ot_layout_table_select_script(face : HarfBuzz::FaceT, table_tag : UInt32, script_count : UInt32, script_tags : Pointer(UInt32)) : Int32
    # hb_ot_layout_table_select_script: (None)
    # @script_index: (out) (transfer full) (optional)
    # @chosen_script: (out) (transfer full) (optional)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    script_index = Pointer(UInt32).null # Generator::OutArgUsedInReturnPlan
    chosen_script = Pointer(UInt32).null
    # C call
    _retval = LibHarfBuzz.hb_ot_layout_table_select_script(face, table_tag, script_count, script_tags, script_index, chosen_script)

    # Return value handling

    _retval
  end

  def self.ot_math_get_constant(font : HarfBuzz::FontT, constant : HarfBuzz::OtMathConstantT) : Int32
    # hb_ot_math_get_constant: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_math_get_constant(font, constant)

    # Return value handling

    _retval
  end

  def self.ot_math_get_glyph_assembly(font : HarfBuzz::FontT, glyph : UInt32, direction : HarfBuzz::DirectionT, start_offset : UInt32, parts : Enumerable(HarfBuzz::OtMathGlyphPartT), italics_correction : Int32) : UInt32
    # hb_ot_math_get_glyph_assembly: (None)
    # @parts_count: (out) (transfer full)
    # @parts: (out) (caller-allocates) (array length=parts_count element-type Interface)
    # @italics_correction: (out) (transfer full)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    parts_count = parts.size # Generator::ArrayArgPlan
    parts = parts.to_a.map(&.to_unsafe).to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_ot_math_get_glyph_assembly(font, glyph, direction, start_offset, parts_count, parts, italics_correction)

    # Return value handling

    _retval
  end

  def self.ot_math_get_glyph_italics_correction(font : HarfBuzz::FontT, glyph : UInt32) : Int32
    # hb_ot_math_get_glyph_italics_correction: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_math_get_glyph_italics_correction(font, glyph)

    # Return value handling

    _retval
  end

  def self.ot_math_get_glyph_kerning(font : HarfBuzz::FontT, glyph : UInt32, kern : HarfBuzz::OtMathKernT, correction_height : Int32) : Int32
    # hb_ot_math_get_glyph_kerning: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_math_get_glyph_kerning(font, glyph, kern, correction_height)

    # Return value handling

    _retval
  end

  def self.ot_math_get_glyph_kernings(font : HarfBuzz::FontT, glyph : UInt32, kern : HarfBuzz::OtMathKernT, start_offset : UInt32, kern_entries : Enumerable(HarfBuzz::OtMathKernEntryT)) : UInt32
    # hb_ot_math_get_glyph_kernings: (None)
    # @entries_count: (out) (transfer full) (optional)
    # @kern_entries: (out) (caller-allocates) (array length=entries_count element-type Interface)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    entries_count = Pointer(UInt32).null # Generator::ArrayLengthArgPlan
    entries_count = kern_entries.size    # Generator::ArrayArgPlan
    kern_entries = kern_entries.to_a.map(&.to_unsafe).to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_ot_math_get_glyph_kernings(font, glyph, kern, start_offset, entries_count, kern_entries)

    # Return value handling

    _retval
  end

  def self.ot_math_get_glyph_top_accent_attachment(font : HarfBuzz::FontT, glyph : UInt32) : Int32
    # hb_ot_math_get_glyph_top_accent_attachment: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_math_get_glyph_top_accent_attachment(font, glyph)

    # Return value handling

    _retval
  end

  def self.ot_math_get_glyph_variants(font : HarfBuzz::FontT, glyph : UInt32, direction : HarfBuzz::DirectionT, start_offset : UInt32, variants : Enumerable(HarfBuzz::OtMathGlyphVariantT)) : UInt32
    # hb_ot_math_get_glyph_variants: (None)
    # @variants_count: (out) (transfer full)
    # @variants: (out) (caller-allocates) (array length=variants_count element-type Interface)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    variants_count = variants.size # Generator::ArrayArgPlan
    variants = variants.to_a.map(&.to_unsafe).to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_ot_math_get_glyph_variants(font, glyph, direction, start_offset, variants_count, variants)

    # Return value handling

    _retval
  end

  def self.ot_math_get_min_connector_overlap(font : HarfBuzz::FontT, direction : HarfBuzz::DirectionT) : Int32
    # hb_ot_math_get_min_connector_overlap: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_math_get_min_connector_overlap(font, direction)

    # Return value handling

    _retval
  end

  def self.ot_math_has_data(face : HarfBuzz::FaceT) : Int32
    # hb_ot_math_has_data: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_math_has_data(face)

    # Return value handling

    _retval
  end

  def self.ot_math_is_glyph_extended_shape(face : HarfBuzz::FaceT, glyph : UInt32) : Int32
    # hb_ot_math_is_glyph_extended_shape: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_math_is_glyph_extended_shape(face, glyph)

    # Return value handling

    _retval
  end

  def self.ot_meta_get_entry_tags(face : HarfBuzz::FaceT, start_offset : UInt32, entries : Enumerable(HarfBuzz::OtMetaTagT)) : UInt32
    # hb_ot_meta_get_entry_tags: (None)
    # @entries_count: (out) (transfer full) (optional)
    # @entries: (out) (caller-allocates) (array length=entries_count element-type Interface)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    entries_count = Pointer(UInt32).null # Generator::ArrayLengthArgPlan
    entries_count = entries.size         # Generator::ArrayArgPlan
    entries = entries.to_a.map(&.to_unsafe).to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_ot_meta_get_entry_tags(face, start_offset, entries_count, entries)

    # Return value handling

    _retval
  end

  def self.ot_meta_reference_entry(face : HarfBuzz::FaceT, meta_tag : HarfBuzz::OtMetaTagT) : HarfBuzz::BlobT
    # hb_ot_meta_reference_entry: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_ot_meta_reference_entry(face, meta_tag)

    # Return value handling

    HarfBuzz::BlobT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.ot_metrics_get_position(font : HarfBuzz::FontT, metrics_tag : HarfBuzz::OtMetricsTagT) : Int32
    # hb_ot_metrics_get_position: (None)
    # @position: (out) (transfer full) (optional)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    position = Pointer(Int32).null
    # C call
    _retval = LibHarfBuzz.hb_ot_metrics_get_position(font, metrics_tag, position)

    # Return value handling

    _retval
  end

  def self.ot_metrics_get_position_with_fallback(font : HarfBuzz::FontT, metrics_tag : HarfBuzz::OtMetricsTagT) : Nil
    # hb_ot_metrics_get_position_with_fallback: (None)
    # @position: (out) (transfer full) (optional)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    position = Pointer(Int32).null
    # C call
    LibHarfBuzz.hb_ot_metrics_get_position_with_fallback(font, metrics_tag, position)

    # Return value handling
  end

  def self.ot_metrics_get_variation(font : HarfBuzz::FontT, metrics_tag : HarfBuzz::OtMetricsTagT) : Float32
    # hb_ot_metrics_get_variation: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_metrics_get_variation(font, metrics_tag)

    # Return value handling

    _retval
  end

  def self.ot_metrics_get_x_variation(font : HarfBuzz::FontT, metrics_tag : HarfBuzz::OtMetricsTagT) : Int32
    # hb_ot_metrics_get_x_variation: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_metrics_get_x_variation(font, metrics_tag)

    # Return value handling

    _retval
  end

  def self.ot_metrics_get_y_variation(font : HarfBuzz::FontT, metrics_tag : HarfBuzz::OtMetricsTagT) : Int32
    # hb_ot_metrics_get_y_variation: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_metrics_get_y_variation(font, metrics_tag)

    # Return value handling

    _retval
  end

  def self.ot_name_get_utf16(face : HarfBuzz::FaceT, name_id : UInt32, language : HarfBuzz::LanguageT, text : Enumerable(UInt16)) : UInt32
    # hb_ot_name_get_utf16: (None)
    # @text_size: (out) (transfer full) (optional)
    # @text: (out) (caller-allocates) (array length=text_size element-type UInt16)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    text_size = Pointer(UInt32).null # Generator::ArrayLengthArgPlan
    text_size = text.size            # Generator::ArrayArgPlan
    text = text.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_ot_name_get_utf16(face, name_id, language, text_size, text)

    # Return value handling

    _retval
  end

  def self.ot_name_get_utf32(face : HarfBuzz::FaceT, name_id : UInt32, language : HarfBuzz::LanguageT, text : Enumerable(UInt32)) : UInt32
    # hb_ot_name_get_utf32: (None)
    # @text_size: (out) (transfer full) (optional)
    # @text: (out) (caller-allocates) (array length=text_size element-type UInt32)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    text_size = Pointer(UInt32).null # Generator::ArrayLengthArgPlan
    text_size = text.size            # Generator::ArrayArgPlan
    text = text.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_ot_name_get_utf32(face, name_id, language, text_size, text)

    # Return value handling

    _retval
  end

  def self.ot_name_get_utf8(face : HarfBuzz::FaceT, name_id : UInt32, language : HarfBuzz::LanguageT, text : Enumerable(::String)) : UInt32
    # hb_ot_name_get_utf8: (None)
    # @text_size: (out) (transfer full) (optional)
    # @text: (out) (caller-allocates) (array length=text_size element-type Utf8)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    text_size = Pointer(UInt32).null # Generator::ArrayLengthArgPlan
    text_size = text.size            # Generator::ArrayArgPlan
    text = text.to_a.map(&.to_unsafe).to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_ot_name_get_utf8(face, name_id, language, text_size, text)

    # Return value handling

    _retval
  end

  def self.ot_name_list_names(face : HarfBuzz::FaceT) : Enumerable(HarfBuzz::OtNameEntryT)
    # hb_ot_name_list_names: (None)
    # @num_entries: (out) (transfer full) (optional)
    # Returns: (transfer none) (array length=num_entries element-type Interface)

    # Generator::OutArgUsedInReturnPlan
    num_entries = 0_u32
    # C call
    _retval = LibHarfBuzz.hb_ot_name_list_names(face, pointerof(num_entries))

    # Return value handling

    GICrystal.transfer_array(_retval, num_entries, GICrystal::Transfer::None)
  end

  def self.ot_shape_glyphs_closure(font : HarfBuzz::FontT, buffer : HarfBuzz::BufferT, features : Enumerable(HarfBuzz::FeatureT)) : HarfBuzz::SetT
    # hb_ot_shape_glyphs_closure: (None)
    # @features: (array length=num_features element-type Interface)
    # @glyphs: (out) (caller-allocates)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    num_features = features.size # Generator::ArrayArgPlan
    features = features.to_a.map(&.to_unsafe).to_unsafe
    # Generator::CallerAllocatesPlan
    glyphs = HarfBuzz::SetT.new
    # C call
    LibHarfBuzz.hb_ot_shape_glyphs_closure(font, buffer, features, num_features, glyphs)

    # Return value handling

    glyphs
  end

  def self.ot_shape_plan_collect_lookups(shape_plan : HarfBuzz::ShapePlanT, table_tag : UInt32) : HarfBuzz::SetT
    # hb_ot_shape_plan_collect_lookups: (None)
    # @lookup_indexes: (out) (caller-allocates)
    # Returns: (transfer none)

    # Generator::CallerAllocatesPlan
    lookup_indexes = HarfBuzz::SetT.new
    # C call
    LibHarfBuzz.hb_ot_shape_plan_collect_lookups(shape_plan, table_tag, lookup_indexes)

    # Return value handling

    lookup_indexes
  end

  def self.ot_tag_from_language(language : HarfBuzz::LanguageT) : UInt32
    # hb_ot_tag_from_language: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_tag_from_language(language)

    # Return value handling

    _retval
  end

  def self.ot_tag_to_language(tag : UInt32) : HarfBuzz::LanguageT?
    # hb_ot_tag_to_language: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_tag_to_language(tag)

    # Return value handling

    HarfBuzz::LanguageT.new(_retval, GICrystal::Transfer::None) unless _retval.null?
  end

  def self.ot_tag_to_script(tag : UInt32) : HarfBuzz::ScriptT
    # hb_ot_tag_to_script: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_tag_to_script(tag)

    # Return value handling

    HarfBuzz::ScriptT.new(_retval)
  end

  def self.ot_tags_from_script(script : HarfBuzz::ScriptT, script_tag_1 : Pointer(UInt32), script_tag_2 : Pointer(UInt32)) : Nil
    # hb_ot_tags_from_script: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_ot_tags_from_script(script, script_tag_1, script_tag_2)

    # Return value handling
  end

  def self.ot_tags_from_script_and_language(script : HarfBuzz::ScriptT, language : HarfBuzz::LanguageT) : Nil
    # hb_ot_tags_from_script_and_language: (None)
    # @script_count: (inout) (transfer full) (optional)
    # @script_tags: (out) (transfer full) (optional)
    # @language_count: (inout) (transfer full) (optional)
    # @language_tags: (out) (transfer full) (optional)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    script_count = Pointer(UInt32).null   # Generator::OutArgUsedInReturnPlan
    script_tags = Pointer(UInt32).null    # Generator::OutArgUsedInReturnPlan
    language_count = Pointer(UInt32).null # Generator::OutArgUsedInReturnPlan
    language_tags = Pointer(UInt32).null
    # C call
    LibHarfBuzz.hb_ot_tags_from_script_and_language(script, language, script_count, script_tags, language_count, language_tags)

    # Return value handling
  end

  def self.ot_tags_to_script_and_language(script_tag : UInt32, language_tag : UInt32) : HarfBuzz::LanguageT
    # hb_ot_tags_to_script_and_language: (None)
    # @script: (out) (transfer full) (optional)
    # @language: (out) (caller-allocates) (optional)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    script = Pointer(UInt32).null          # Generator::OutArgUsedInReturnPlan
    language = Pointer(Pointer(Void)).null # Generator::CallerAllocatesPlan
    language = HarfBuzz::LanguageT.new
    # C call
    LibHarfBuzz.hb_ot_tags_to_script_and_language(script_tag, language_tag, script, language)

    # Return value handling

    language
  end

  def self.ot_var_find_axis(face : HarfBuzz::FaceT, axis_tag : UInt32, axis_index : Pointer(UInt32)) : HarfBuzz::OtVarAxisT
    # hb_ot_var_find_axis: (None)
    # @axis_info: (out) (caller-allocates)
    # Returns: (transfer none)

    # Generator::CallerAllocatesPlan
    axis_info = HarfBuzz::OtVarAxisT.new
    # C call
    _retval = LibHarfBuzz.hb_ot_var_find_axis(face, axis_tag, axis_index, axis_info)

    # Return value handling

    axis_info
  end

  def self.ot_var_find_axis_info(face : HarfBuzz::FaceT, axis_tag : UInt32) : HarfBuzz::OtVarAxisInfoT
    # hb_ot_var_find_axis_info: (None)
    # @axis_info: (out) (caller-allocates)
    # Returns: (transfer none)

    # Generator::CallerAllocatesPlan
    axis_info = HarfBuzz::OtVarAxisInfoT.new
    # C call
    _retval = LibHarfBuzz.hb_ot_var_find_axis_info(face, axis_tag, axis_info)

    # Return value handling

    axis_info
  end

  def self.ot_var_get_axes(face : HarfBuzz::FaceT, start_offset : UInt32, axes_array : Enumerable(HarfBuzz::OtVarAxisT)) : UInt32
    # hb_ot_var_get_axes: (None)
    # @axes_count: (out) (transfer full) (optional)
    # @axes_array: (out) (caller-allocates) (array length=axes_count element-type Interface)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    axes_count = Pointer(UInt32).null # Generator::ArrayLengthArgPlan
    axes_count = axes_array.size      # Generator::ArrayArgPlan
    axes_array = axes_array.to_a.map(&.to_unsafe).to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_ot_var_get_axes(face, start_offset, axes_count, axes_array)

    # Return value handling

    _retval
  end

  def self.ot_var_get_axis_count(face : HarfBuzz::FaceT) : UInt32
    # hb_ot_var_get_axis_count: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_var_get_axis_count(face)

    # Return value handling

    _retval
  end

  def self.ot_var_get_axis_infos(face : HarfBuzz::FaceT, start_offset : UInt32, axes_array : Enumerable(HarfBuzz::OtVarAxisInfoT)) : UInt32
    # hb_ot_var_get_axis_infos: (None)
    # @axes_count: (out) (transfer full) (optional)
    # @axes_array: (out) (caller-allocates) (array length=axes_count element-type Interface)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    axes_count = Pointer(UInt32).null # Generator::ArrayLengthArgPlan
    axes_count = axes_array.size      # Generator::ArrayArgPlan
    axes_array = axes_array.to_a.map(&.to_unsafe).to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_ot_var_get_axis_infos(face, start_offset, axes_count, axes_array)

    # Return value handling

    _retval
  end

  def self.ot_var_get_named_instance_count(face : HarfBuzz::FaceT) : UInt32
    # hb_ot_var_get_named_instance_count: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_var_get_named_instance_count(face)

    # Return value handling

    _retval
  end

  def self.ot_var_has_data(face : HarfBuzz::FaceT) : Int32
    # hb_ot_var_has_data: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_var_has_data(face)

    # Return value handling

    _retval
  end

  def self.ot_var_named_instance_get_design_coords(face : HarfBuzz::FaceT, instance_index : UInt32, coords : Enumerable(Float32)) : UInt32
    # hb_ot_var_named_instance_get_design_coords: (None)
    # @coords_length: (out) (transfer full) (optional)
    # @coords: (out) (transfer full) (array length=coords_length element-type Float)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    coords_length = Pointer(UInt32).null # Generator::ArrayLengthArgPlan
    coords_length = coords.size          # Generator::ArrayArgPlan
    coords = coords.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_ot_var_named_instance_get_design_coords(face, instance_index, coords_length, coords)

    # Return value handling

    _retval
  end

  def self.ot_var_named_instance_get_postscript_name_id(face : HarfBuzz::FaceT, instance_index : UInt32) : UInt32
    # hb_ot_var_named_instance_get_postscript_name_id: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_var_named_instance_get_postscript_name_id(face, instance_index)

    # Return value handling

    _retval
  end

  def self.ot_var_named_instance_get_subfamily_name_id(face : HarfBuzz::FaceT, instance_index : UInt32) : UInt32
    # hb_ot_var_named_instance_get_subfamily_name_id: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_ot_var_named_instance_get_subfamily_name_id(face, instance_index)

    # Return value handling

    _retval
  end

  def self.ot_var_normalize_coords(face : HarfBuzz::FaceT, coords_length : UInt32, design_coords : Pointer(Float32), normalized_coords : Int32) : Nil
    # hb_ot_var_normalize_coords: (None)
    # @normalized_coords: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_ot_var_normalize_coords(face, coords_length, design_coords, normalized_coords)

    # Return value handling
  end

  def self.ot_var_normalize_variations(face : HarfBuzz::FaceT, variations : HarfBuzz::VariationT, variations_length : UInt32, coords : Enumerable(Int32)) : Nil
    # hb_ot_var_normalize_variations: (None)
    # @coords: (out) (transfer full) (array length=coords_length element-type Int32)
    # @coords_length: (out) (transfer full)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    coords_length = coords.size # Generator::ArrayArgPlan
    coords = coords.to_a.to_unsafe

    # C call
    LibHarfBuzz.hb_ot_var_normalize_variations(face, variations, variations_length, coords, coords_length)

    # Return value handling
  end

  def self.script_from_iso15924_tag(tag : UInt32) : HarfBuzz::ScriptT
    # hb_script_from_iso15924_tag: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_script_from_iso15924_tag(tag)

    # Return value handling

    HarfBuzz::ScriptT.new(_retval)
  end

  def self.script_from_string(str : Enumerable(UInt8)) : HarfBuzz::ScriptT
    # hb_script_from_string: (None)
    # @str: (array length=len element-type UInt8)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    len = str.size # Generator::ArrayArgPlan
    str = str.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_script_from_string(str, len)

    # Return value handling

    HarfBuzz::ScriptT.new(_retval)
  end

  def self.script_from_string(*str : UInt8)
    self.script_from_string(str)
  end

  def self.script_get_horizontal_direction(script : HarfBuzz::ScriptT) : HarfBuzz::DirectionT
    # hb_script_get_horizontal_direction: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_script_get_horizontal_direction(script)

    # Return value handling

    HarfBuzz::DirectionT.new(_retval)
  end

  def self.script_to_iso15924_tag(script : HarfBuzz::ScriptT) : UInt32
    # hb_script_to_iso15924_tag: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_script_to_iso15924_tag(script)

    # Return value handling

    _retval
  end

  def self.segment_properties_equal(a : HarfBuzz::SegmentPropertiesT, b : HarfBuzz::SegmentPropertiesT) : Int32
    # hb_segment_properties_equal: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_segment_properties_equal(a, b)

    # Return value handling

    _retval
  end

  def self.segment_properties_hash(p : HarfBuzz::SegmentPropertiesT) : UInt32
    # hb_segment_properties_hash: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_segment_properties_hash(p)

    # Return value handling

    _retval
  end

  def self.segment_properties_overlay(p : HarfBuzz::SegmentPropertiesT, src : HarfBuzz::SegmentPropertiesT) : Nil
    # hb_segment_properties_overlay: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_segment_properties_overlay(p, src)

    # Return value handling
  end

  def self.set_add(set : HarfBuzz::SetT, codepoint : UInt32) : Nil
    # hb_set_add: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_set_add(set, codepoint)

    # Return value handling
  end

  def self.set_add_range(set : HarfBuzz::SetT, first : UInt32, last : UInt32) : Nil
    # hb_set_add_range: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_set_add_range(set, first, last)

    # Return value handling
  end

  def self.set_add_sorted_array(set : HarfBuzz::SetT, sorted_codepoints : Enumerable(UInt32)) : Nil
    # hb_set_add_sorted_array: (None)
    # @sorted_codepoints: (array length=num_codepoints element-type UInt32)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    num_codepoints = sorted_codepoints.size # Generator::ArrayArgPlan
    sorted_codepoints = sorted_codepoints.to_a.to_unsafe

    # C call
    LibHarfBuzz.hb_set_add_sorted_array(set, sorted_codepoints, num_codepoints)

    # Return value handling
  end

  def self.allocation_successful=(set : HarfBuzz::SetT) : Int32
    # hb_set_allocation_successful: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_set_allocation_successful(set)

    # Return value handling

    _retval
  end

  def self.clear=(set : HarfBuzz::SetT) : Nil
    # hb_set_clear: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_set_clear(set)

    # Return value handling
  end

  def self.copy=(set : HarfBuzz::SetT) : HarfBuzz::SetT
    # hb_set_copy: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_set_copy(set)

    # Return value handling

    HarfBuzz::SetT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.set_create : HarfBuzz::SetT
    # hb_set_create: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_set_create

    # Return value handling

    HarfBuzz::SetT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.set_del(set : HarfBuzz::SetT, codepoint : UInt32) : Nil
    # hb_set_del: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_set_del(set, codepoint)

    # Return value handling
  end

  def self.set_del_range(set : HarfBuzz::SetT, first : UInt32, last : UInt32) : Nil
    # hb_set_del_range: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_set_del_range(set, first, last)

    # Return value handling
  end

  def self.set_get_empty : HarfBuzz::SetT
    # hb_set_get_empty: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_set_get_empty

    # Return value handling

    HarfBuzz::SetT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.get_max=(set : HarfBuzz::SetT) : UInt32
    # hb_set_get_max: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_set_get_max(set)

    # Return value handling

    _retval
  end

  def self.get_min=(set : HarfBuzz::SetT) : UInt32
    # hb_set_get_min: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_set_get_min(set)

    # Return value handling

    _retval
  end

  def self.get_population=(set : HarfBuzz::SetT) : UInt32
    # hb_set_get_population: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_set_get_population(set)

    # Return value handling

    _retval
  end

  def self.set_has(set : HarfBuzz::SetT, codepoint : UInt32) : Int32
    # hb_set_has: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_set_has(set, codepoint)

    # Return value handling

    _retval
  end

  def self.set_intersect(set : HarfBuzz::SetT, other : HarfBuzz::SetT) : Nil
    # hb_set_intersect: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_set_intersect(set, other)

    # Return value handling
  end

  def self.invert=(set : HarfBuzz::SetT) : Nil
    # hb_set_invert: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_set_invert(set)

    # Return value handling
  end

  def self.is_empty=(set : HarfBuzz::SetT) : Int32
    # hb_set_is_empty: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_set_is_empty(set)

    # Return value handling

    _retval
  end

  def self.set_is_equal(set : HarfBuzz::SetT, other : HarfBuzz::SetT) : Int32
    # hb_set_is_equal: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_set_is_equal(set, other)

    # Return value handling

    _retval
  end

  def self.set_is_subset(set : HarfBuzz::SetT, larger_set : HarfBuzz::SetT) : Int32
    # hb_set_is_subset: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_set_is_subset(set, larger_set)

    # Return value handling

    _retval
  end

  def self.set_next(set : HarfBuzz::SetT, codepoint : UInt32) : Int32
    # hb_set_next: (None)
    # @codepoint: (inout) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_set_next(set, codepoint)

    # Return value handling

    _retval
  end

  def self.set_next_many(set : HarfBuzz::SetT, codepoint : UInt32, out _out : Enumerable(UInt32)) : UInt32
    # hb_set_next_many: (None)
    # @out: (array length=size element-type UInt32)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    size = _out.size # Generator::ArrayArgPlan
    _out = _out.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_set_next_many(set, codepoint, _out, size)

    # Return value handling

    _retval
  end

  def self.set_next_range(set : HarfBuzz::SetT, first : UInt32, last : UInt32) : Int32
    # hb_set_next_range: (None)
    # @first: (out) (transfer full)
    # @last: (inout) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_set_next_range(set, first, last)

    # Return value handling

    _retval
  end

  def self.set_previous(set : HarfBuzz::SetT, codepoint : UInt32) : Int32
    # hb_set_previous: (None)
    # @codepoint: (inout) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_set_previous(set, codepoint)

    # Return value handling

    _retval
  end

  def self.set_previous_range(set : HarfBuzz::SetT, first : UInt32, last : UInt32) : Int32
    # hb_set_previous_range: (None)
    # @first: (inout) (transfer full)
    # @last: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_set_previous_range(set, first, last)

    # Return value handling

    _retval
  end

  def self.set_set(set : HarfBuzz::SetT, other : HarfBuzz::SetT) : Nil
    # hb_set_set: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_set_set(set, other)

    # Return value handling
  end

  def self.set_subtract(set : HarfBuzz::SetT, other : HarfBuzz::SetT) : Nil
    # hb_set_subtract: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_set_subtract(set, other)

    # Return value handling
  end

  def self.set_symmetric_difference(set : HarfBuzz::SetT, other : HarfBuzz::SetT) : Nil
    # hb_set_symmetric_difference: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_set_symmetric_difference(set, other)

    # Return value handling
  end

  def self.set_union(set : HarfBuzz::SetT, other : HarfBuzz::SetT) : Nil
    # hb_set_union: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_set_union(set, other)

    # Return value handling
  end

  def self.shape(font : HarfBuzz::FontT, buffer : HarfBuzz::BufferT, features : Enumerable(HarfBuzz::FeatureT)?) : Nil
    # hb_shape: (None)
    # @features: (nullable) (array length=num_features element-type Interface)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    num_features = features.try(&.size) || 0 # Generator::NullableArrayPlan
    features = if features.nil?
                 Pointer(Void).null
               else
                 features.to_a.map(&.to_unsafe).to_unsafe
               end

    # C call
    LibHarfBuzz.hb_shape(font, buffer, features, num_features)

    # Return value handling
  end

  def self.shape_full(font : HarfBuzz::FontT, buffer : HarfBuzz::BufferT, features : Enumerable(HarfBuzz::FeatureT)?, shaper_list : Enumerable(::String)?) : Int32
    # hb_shape_full: (None)
    # @features: (nullable) (array length=num_features element-type Interface)
    # @shaper_list: (nullable) (array zero-terminated=1 element-type Utf8)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    num_features = features.try(&.size) || 0 # Generator::NullableArrayPlan
    features = if features.nil?
                 Pointer(Void).null
               else
                 features.to_a.map(&.to_unsafe).to_unsafe
               end
    # Generator::NullableArrayPlan
    shaper_list = if shaper_list.nil?
                    Pointer(Pointer(LibC::Char)).null
                  else
                    shaper_list.to_a.map(&.to_unsafe).to_unsafe
                  end

    # C call
    _retval = LibHarfBuzz.hb_shape_full(font, buffer, features, num_features, shaper_list)

    # Return value handling

    _retval
  end

  def self.shape_list_shapers : Enumerable(::String)
    # hb_shape_list_shapers: (None)
    # Returns: (transfer none) (array zero-terminated=1 element-type Utf8)

    # C call
    _retval = LibHarfBuzz.hb_shape_list_shapers

    # Return value handling

    GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
  end

  def self.shape_plan_create(face : HarfBuzz::FaceT, props : HarfBuzz::SegmentPropertiesT, user_features : Enumerable(HarfBuzz::FeatureT), shaper_list : Enumerable(::String)) : HarfBuzz::ShapePlanT
    # hb_shape_plan_create: (None)
    # @user_features: (array length=num_user_features element-type Interface)
    # @shaper_list: (array zero-terminated=1 element-type Utf8)
    # Returns: (transfer full)

    # Generator::ArrayLengthArgPlan
    num_user_features = user_features.size # Generator::ArrayArgPlan
    user_features = user_features.to_a.map(&.to_unsafe).to_unsafe
    # Generator::ArrayArgPlan
    shaper_list = shaper_list.to_a.map(&.to_unsafe).to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_shape_plan_create(face, props, user_features, num_user_features, shaper_list)

    # Return value handling

    HarfBuzz::ShapePlanT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.shape_plan_create2(face : HarfBuzz::FaceT, props : HarfBuzz::SegmentPropertiesT, user_features : Enumerable(HarfBuzz::FeatureT), coords : Enumerable(Int32), shaper_list : Enumerable(::String)) : HarfBuzz::ShapePlanT
    # hb_shape_plan_create2: (None)
    # @user_features: (array length=num_user_features element-type Interface)
    # @coords: (array length=num_coords element-type Int32)
    # @shaper_list: (array zero-terminated=1 element-type Utf8)
    # Returns: (transfer full)

    # Generator::ArrayLengthArgPlan
    num_user_features = user_features.size # Generator::ArrayArgPlan
    user_features = user_features.to_a.map(&.to_unsafe).to_unsafe
    # Generator::ArrayLengthArgPlan
    num_coords = coords.size # Generator::ArrayArgPlan
    coords = coords.to_a.to_unsafe
    # Generator::ArrayArgPlan
    shaper_list = shaper_list.to_a.map(&.to_unsafe).to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_shape_plan_create2(face, props, user_features, num_user_features, coords, num_coords, shaper_list)

    # Return value handling

    HarfBuzz::ShapePlanT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.shape_plan_create_cached(face : HarfBuzz::FaceT, props : HarfBuzz::SegmentPropertiesT, user_features : Enumerable(HarfBuzz::FeatureT), shaper_list : Enumerable(::String)) : HarfBuzz::ShapePlanT
    # hb_shape_plan_create_cached: (None)
    # @user_features: (array length=num_user_features element-type Interface)
    # @shaper_list: (array zero-terminated=1 element-type Utf8)
    # Returns: (transfer full)

    # Generator::ArrayLengthArgPlan
    num_user_features = user_features.size # Generator::ArrayArgPlan
    user_features = user_features.to_a.map(&.to_unsafe).to_unsafe
    # Generator::ArrayArgPlan
    shaper_list = shaper_list.to_a.map(&.to_unsafe).to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_shape_plan_create_cached(face, props, user_features, num_user_features, shaper_list)

    # Return value handling

    HarfBuzz::ShapePlanT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.shape_plan_create_cached2(face : HarfBuzz::FaceT, props : HarfBuzz::SegmentPropertiesT, user_features : Enumerable(HarfBuzz::FeatureT), coords : Enumerable(Int32), shaper_list : Enumerable(::String)) : HarfBuzz::ShapePlanT
    # hb_shape_plan_create_cached2: (None)
    # @user_features: (array length=num_user_features element-type Interface)
    # @coords: (array length=num_coords element-type Int32)
    # @shaper_list: (array zero-terminated=1 element-type Utf8)
    # Returns: (transfer full)

    # Generator::ArrayLengthArgPlan
    num_user_features = user_features.size # Generator::ArrayArgPlan
    user_features = user_features.to_a.map(&.to_unsafe).to_unsafe
    # Generator::ArrayLengthArgPlan
    num_coords = coords.size # Generator::ArrayArgPlan
    coords = coords.to_a.to_unsafe
    # Generator::ArrayArgPlan
    shaper_list = shaper_list.to_a.map(&.to_unsafe).to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_shape_plan_create_cached2(face, props, user_features, num_user_features, coords, num_coords, shaper_list)

    # Return value handling

    HarfBuzz::ShapePlanT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.shape_plan_execute(shape_plan : HarfBuzz::ShapePlanT, font : HarfBuzz::FontT, buffer : HarfBuzz::BufferT, features : Enumerable(HarfBuzz::FeatureT)) : Int32
    # hb_shape_plan_execute: (None)
    # @features: (array length=num_features element-type Interface)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    num_features = features.size # Generator::ArrayArgPlan
    features = features.to_a.map(&.to_unsafe).to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_shape_plan_execute(shape_plan, font, buffer, features, num_features)

    # Return value handling

    _retval
  end

  def self.shape_plan_get_empty : HarfBuzz::ShapePlanT
    # hb_shape_plan_get_empty: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_shape_plan_get_empty

    # Return value handling

    HarfBuzz::ShapePlanT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.shape_plan_get_shaper(shape_plan : HarfBuzz::ShapePlanT) : ::String
    # hb_shape_plan_get_shaper: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_shape_plan_get_shaper(shape_plan)

    # Return value handling

    ::String.new(_retval)
  end

  def self.style_get_value(font : HarfBuzz::FontT, style_tag : HarfBuzz::StyleTagT) : Float32
    # hb_style_get_value: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_style_get_value(font, style_tag)

    # Return value handling

    _retval
  end

  def self.tag_from_string(str : Enumerable(UInt8)) : UInt32
    # hb_tag_from_string: (None)
    # @str: (array length=len element-type UInt8)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    len = str.size # Generator::ArrayArgPlan
    str = str.to_a.to_unsafe

    # C call
    _retval = LibHarfBuzz.hb_tag_from_string(str, len)

    # Return value handling

    _retval
  end

  def self.tag_from_string(*str : UInt8)
    self.tag_from_string(str)
  end

  def self.tag_to_string(tag : UInt32, buf : Enumerable(UInt8)) : Nil
    # hb_tag_to_string: (None)
    # @buf: (out) (caller-allocates) (array fixed-size=4 element-type UInt8)
    # Returns: (transfer none)

    # Generator::ArrayArgPlan
    raise ArgumentError.new("Enumerable of size < 4") if buf.size < 4

    buf = buf.to_a.to_unsafe

    # C call
    LibHarfBuzz.hb_tag_to_string(tag, buf)

    # Return value handling
  end

  def self.unicode_combining_class(ufuncs : HarfBuzz::UnicodeFuncsT, unicode : UInt32) : HarfBuzz::UnicodeCombiningClassT
    # hb_unicode_combining_class: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_unicode_combining_class(ufuncs, unicode)

    # Return value handling

    HarfBuzz::UnicodeCombiningClassT.new(_retval)
  end

  def self.unicode_compose(ufuncs : HarfBuzz::UnicodeFuncsT, a : UInt32, b : UInt32, ab : UInt32) : Int32
    # hb_unicode_compose: (None)
    # @ab: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_unicode_compose(ufuncs, a, b, ab)

    # Return value handling

    _retval
  end

  def self.unicode_decompose(ufuncs : HarfBuzz::UnicodeFuncsT, ab : UInt32, a : UInt32, b : UInt32) : Int32
    # hb_unicode_decompose: (None)
    # @a: (out) (transfer full)
    # @b: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_unicode_decompose(ufuncs, ab, a, b)

    # Return value handling

    _retval
  end

  def self.unicode_decompose_compatibility(ufuncs : HarfBuzz::UnicodeFuncsT, u : UInt32, decomposed : UInt32) : UInt32
    # hb_unicode_decompose_compatibility: (None)
    # @decomposed: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_unicode_decompose_compatibility(ufuncs, u, decomposed)

    # Return value handling

    _retval
  end

  def self.unicode_eastasian_width(ufuncs : HarfBuzz::UnicodeFuncsT, unicode : UInt32) : UInt32
    # hb_unicode_eastasian_width: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_unicode_eastasian_width(ufuncs, unicode)

    # Return value handling

    _retval
  end

  def self.unicode_funcs_create(parent : HarfBuzz::UnicodeFuncsT?) : HarfBuzz::UnicodeFuncsT
    # hb_unicode_funcs_create: (None)
    # @parent: (nullable)
    # Returns: (transfer full)

    # Generator::NullableArrayPlan
    parent = if parent.nil?
               Pointer(Void).null
             else
               parent.to_unsafe
             end

    # C call
    _retval = LibHarfBuzz.hb_unicode_funcs_create(parent)

    # Return value handling

    HarfBuzz::UnicodeFuncsT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.unicode_funcs_get_default : HarfBuzz::UnicodeFuncsT
    # hb_unicode_funcs_get_default: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_unicode_funcs_get_default

    # Return value handling

    HarfBuzz::UnicodeFuncsT.new(_retval, GICrystal::Transfer::None)
  end

  def self.unicode_funcs_get_empty : HarfBuzz::UnicodeFuncsT
    # hb_unicode_funcs_get_empty: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_unicode_funcs_get_empty

    # Return value handling

    HarfBuzz::UnicodeFuncsT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.unicode_funcs_get_parent(ufuncs : HarfBuzz::UnicodeFuncsT) : HarfBuzz::UnicodeFuncsT
    # hb_unicode_funcs_get_parent: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibHarfBuzz.hb_unicode_funcs_get_parent(ufuncs)

    # Return value handling

    HarfBuzz::UnicodeFuncsT.new(_retval, GICrystal::Transfer::Full)
  end

  def self.unicode_funcs_is_immutable(ufuncs : HarfBuzz::UnicodeFuncsT) : Int32
    # hb_unicode_funcs_is_immutable: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_unicode_funcs_is_immutable(ufuncs)

    # Return value handling

    _retval
  end

  def self.unicode_funcs_make_immutable(ufuncs : HarfBuzz::UnicodeFuncsT) : Nil
    # hb_unicode_funcs_make_immutable: (None)
    # Returns: (transfer none)

    # C call
    LibHarfBuzz.hb_unicode_funcs_make_immutable(ufuncs)

    # Return value handling
  end

  def self.unicode_funcs_set_combining_class_func(ufuncs : HarfBuzz::UnicodeFuncsT, func : HarfBuzz::UnicodeCombiningClassFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_unicode_funcs_set_combining_class_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_unicode_funcs_set_combining_class_func(ufuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.unicode_funcs_set_compose_func(ufuncs : HarfBuzz::UnicodeFuncsT, func : HarfBuzz::UnicodeComposeFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_unicode_funcs_set_compose_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_unicode_funcs_set_compose_func(ufuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.unicode_funcs_set_decompose_compatibility_func(ufuncs : HarfBuzz::UnicodeFuncsT, func : HarfBuzz::UnicodeDecomposeCompatibilityFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_unicode_funcs_set_decompose_compatibility_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_unicode_funcs_set_decompose_compatibility_func(ufuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.unicode_funcs_set_decompose_func(ufuncs : HarfBuzz::UnicodeFuncsT, func : HarfBuzz::UnicodeDecomposeFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_unicode_funcs_set_decompose_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_unicode_funcs_set_decompose_func(ufuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.unicode_funcs_set_eastasian_width_func(ufuncs : HarfBuzz::UnicodeFuncsT, func : HarfBuzz::UnicodeEastasianWidthFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_unicode_funcs_set_eastasian_width_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_unicode_funcs_set_eastasian_width_func(ufuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.unicode_funcs_set_general_category_func(ufuncs : HarfBuzz::UnicodeFuncsT, func : HarfBuzz::UnicodeGeneralCategoryFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_unicode_funcs_set_general_category_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_unicode_funcs_set_general_category_func(ufuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.unicode_funcs_set_mirroring_func(ufuncs : HarfBuzz::UnicodeFuncsT, func : HarfBuzz::UnicodeMirroringFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_unicode_funcs_set_mirroring_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_unicode_funcs_set_mirroring_func(ufuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.unicode_funcs_set_script_func(ufuncs : HarfBuzz::UnicodeFuncsT, func : HarfBuzz::UnicodeScriptFuncT, user_data : Pointer(Void)?, destroy : HarfBuzz::DestroyFuncT?) : Nil
    # hb_unicode_funcs_set_script_func: (None)
    # @user_data: (nullable)
    # @destroy: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibHarfBuzz.hb_unicode_funcs_set_script_func(ufuncs, func, user_data, destroy)

    # Return value handling
  end

  def self.unicode_general_category(ufuncs : HarfBuzz::UnicodeFuncsT, unicode : UInt32) : HarfBuzz::UnicodeGeneralCategoryT
    # hb_unicode_general_category: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_unicode_general_category(ufuncs, unicode)

    # Return value handling

    HarfBuzz::UnicodeGeneralCategoryT.new(_retval)
  end

  def self.unicode_mirroring(ufuncs : HarfBuzz::UnicodeFuncsT, unicode : UInt32) : UInt32
    # hb_unicode_mirroring: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_unicode_mirroring(ufuncs, unicode)

    # Return value handling

    _retval
  end

  def self.unicode_script(ufuncs : HarfBuzz::UnicodeFuncsT, unicode : UInt32) : HarfBuzz::ScriptT
    # hb_unicode_script: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibHarfBuzz.hb_unicode_script(ufuncs, unicode)

    # Return value handling

    HarfBuzz::ScriptT.new(_retval)
  end

  def self.variation_from_string(str : Enumerable(UInt8)) : HarfBuzz::VariationT
    # hb_variation_from_string: (None)
    # @str: (array length=len element-type UInt8)
    # @variation: (out) (caller-allocates)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    len = str.size # Generator::ArrayArgPlan
    str = str.to_a.to_unsafe
    # Generator::CallerAllocatesPlan
    variation = HarfBuzz::VariationT.new
    # C call
    _retval = LibHarfBuzz.hb_variation_from_string(str, len, variation)

    # Return value handling

    variation
  end

  def self.variation_from_string(*str : UInt8)
    self.variation_from_string(str)
  end

  def self.variation_to_string(variation : HarfBuzz::VariationT, buf : Enumerable(::String)) : Nil
    # hb_variation_to_string: (None)
    # @buf: (out) (transfer full) (array length=size element-type Utf8)
    # @size: (out) (transfer full)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    size = buf.size # Generator::ArrayArgPlan
    buf = buf.to_a.map(&.to_unsafe).to_unsafe

    # C call
    LibHarfBuzz.hb_variation_to_string(variation, buf, size)

    # Return value handling
  end

  # Errors

  # :nodoc:
  def raise_exception(error : Pointer(LibGLib::Error))
    GObject.raise_exception(error)
  end

  extend self
end

# Extra includes
