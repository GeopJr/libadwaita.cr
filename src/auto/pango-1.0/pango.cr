# Dependencies
require "../cairo-1.0/cairo.cr"
require "../harf_buzz-0.0/harf_buzz.cr"
require "../g_object-2.0/g_object.cr"

# C lib declaration
require "./lib_pango.cr"

# Wrappers
require "./analysis.cr"
require "./attr_class.cr"
require "./attr_color.cr"
require "./attr_float.cr"
require "./attr_font_desc.cr"
require "./attr_font_features.cr"
require "./attr_int.cr"
require "./attr_iterator.cr"
require "./attr_language.cr"
require "./attr_list.cr"
require "./attr_shape.cr"
require "./attr_size.cr"
require "./attr_string.cr"
require "./attribute.cr"
require "./color.cr"
require "./context.cr"
require "./coverage.cr"
require "./font.cr"
require "./font_description.cr"
require "./font_face.cr"
require "./font_family.cr"
require "./font_map.cr"
require "./font_metrics.cr"
require "./fontset.cr"
require "./fontset_simple.cr"
require "./glyph_geometry.cr"
require "./glyph_info.cr"
require "./glyph_item.cr"
require "./glyph_item_iter.cr"
require "./glyph_string.cr"
require "./glyph_vis_attr.cr"
require "./item.cr"
require "./language.cr"
require "./layout.cr"
require "./layout_iter.cr"
require "./layout_line.cr"
require "./log_attr.cr"
require "./matrix.cr"
require "./rectangle.cr"
require "./renderer.cr"
require "./renderer_private.cr"
require "./script_iter.cr"
require "./tab_array.cr"

module Pango
  # Whether the segment should be shifted to center around the baseline.
  #
  # This is mainly used in vertical writing directions.
  ANALYSIS_FLAG_CENTERED_BASELINE = 1
  # Whether this run holds ellipsized text.
  ANALYSIS_FLAG_IS_ELLIPSIS = 2
  # Whether to add a hyphen at the end of the run during shaping.
  ANALYSIS_FLAG_NEED_HYPHEN = 4
  # Value for @start_index in `PangoAttribute` that indicates
  # the beginning of the text.
  ATTR_INDEX_FROM_TEXT_BEGINNING = 0_u32
  # Value for @end_index in `PangoAttribute` that indicates
  # the end of the text.
  ATTR_INDEX_TO_TEXT_END = 4294967295_u32
  # A `PangoGlyph` value that indicates a zero-width empty glpyh.
  #
  # This is useful for example in shaper modules, to use as the glyph for
  # various zero-width Unicode characters (those passing `#is_zero_width?`).
  GLYPH_EMPTY = 268435455_u32
  # A `PangoGlyph` value for invalid input.
  #
  # `PangoLayout` produces one such glyph per invalid input UTF-8 byte and such
  # a glyph is rendered as a crossed box.
  #
  # Note that this value is defined such that it has the %PANGO_GLYPH_UNKNOWN_FLAG
  # set.
  GLYPH_INVALID_INPUT = 4294967295_u32
  # Flag used in `PangoGlyph` to turn a `gunichar` value of a valid Unicode
  # character into an unknown-character glyph for that `gunichar`.
  #
  # Such unknown-character glyphs may be rendered as a 'hex box'.
  GLYPH_UNKNOWN_FLAG = 268435456_u32
  # The scale between dimensions used for Pango distances and device units.
  #
  # The definition of device units is dependent on the output device; it will
  # typically be pixels for a screen, and points for a printer. %PANGO_SCALE is
  # currently 1024, but this may be changed in the future.
  #
  # When setting font sizes, device units are always considered to be
  # points (as in "12 point font"), rather than pixels.
  SCALE = 1024
  # The major component of the version of Pango available at compile-time.
  VERSION_MAJOR = 1
  # The micro component of the version of Pango available at compile-time.
  VERSION_MICRO = 7
  # The minor component of the version of Pango available at compile-time.
  VERSION_MINOR = 50
  # A string literal containing the version of Pango available at compile-time.
  VERSION_STRING = "1.50.7"

  # Callbacks

  # Type of a function that can duplicate user data for an attribute.
  alias AttrDataCopyFunc = Proc(Pointer(Void))

  # Type of a function filtering a list of attributes.
  alias AttrFilterFunc = Proc(Pango::Attribute, Bool)

  # Callback used when enumerating fonts in a fontset.
  #
  # See `Pango::Fontset#foreach`.
  alias FontsetForeachFunc = Proc(Pango::Fontset, Pango::Font, Bool)

  # Base class for all errors in this module.
  class PangoError < RuntimeError
    # :nodoc:
    def initialize(error : Pointer(LibGLib::Error))
      message_ptr = error.value.message
      super(String.new(message_ptr)) unless message_ptr.null?
      LibGLib.g_error_free(error)
    end
  end

  # Enums

  # `PangoAlignment` describes how to align the lines of a `PangoLayout`
  # within the available space.
  #
  # If the `PangoLayout` is set to justify using `Pango::Layout#justify=`,
  # this only affects partial lines.
  #
  # See `Pango::Layout#auto_dir=` for how text direction affects
  # the interpretation of `PangoAlignment` values.
  enum Alignment : UInt32
    # Put all available space on the right
    Left = 0
    # Center the line within the available space
    Center = 1
    # Put all available space on the left
    Right = 2
  end

  # The `PangoAttrType` distinguishes between different types of attributes.
  #
  # Along with the predefined values, it is possible to allocate additional
  # values for custom attributes using `AttrType#register`. The predefined
  # values are given below. The type of structure used to store the attribute is
  # listed in parentheses after the description.
  enum AttrType : UInt32
    # does not happen
    Invalid = 0
    # language (`Pango#AttrLanguage`)
    Language = 1
    # font family name list (`Pango#AttrString`)
    Family = 2
    # font slant style (`Pango#AttrInt`)
    Style = 3
    # font weight (`Pango#AttrInt`)
    Weight = 4
    # font variant (normal or small caps) (`Pango#AttrInt`)
    Variant = 5
    # font stretch (`Pango#AttrInt`)
    Stretch = 6
    # font size in points scaled by %PANGO_SCALE (`Pango#AttrInt`)
    Size = 7
    # font description (`Pango#AttrFontDesc`)
    FontDesc = 8
    # foreground color (`Pango#AttrColor`)
    Foreground = 9
    # background color (`Pango#AttrColor`)
    Background = 10
    # whether the text has an underline (`Pango#AttrInt`)
    Underline = 11
    # whether the text is struck-through (`Pango#AttrInt`)
    Strikethrough = 12
    # baseline displacement (`Pango#AttrInt`)
    Rise = 13
    # shape (`Pango#AttrShape`)
    Shape = 14
    # font size scale factor (`Pango#AttrFloat`)
    Scale = 15
    # whether fallback is enabled (`Pango#AttrInt`)
    Fallback = 16
    # letter spacing (`#PangoAttrInt`)
    LetterSpacing = 17
    # underline color (`Pango#AttrColor`)
    UnderlineColor = 18
    # strikethrough color (`Pango#AttrColor`)
    StrikethroughColor = 19
    # font size in pixels scaled by %PANGO_SCALE (`Pango#AttrInt`)
    AbsoluteSize = 20
    # base text gravity (`Pango#AttrInt`)
    Gravity = 21
    # gravity hint (`Pango#AttrInt`)
    GravityHint = 22
    # OpenType font features (`Pango#AttrFontFeatures`). Since 1.38
    FontFeatures = 23
    # foreground alpha (`Pango#AttrInt`). Since 1.38
    ForegroundAlpha = 24
    # background alpha (`Pango#AttrInt`). Since 1.38
    BackgroundAlpha = 25
    # whether breaks are allowed (`Pango#AttrInt`). Since 1.44
    AllowBreaks = 26
    # how to render invisible characters (`Pango#AttrInt`). Since 1.44
    Show = 27
    # whether to insert hyphens at intra-word line breaks (`Pango#AttrInt`). Since 1.44
    InsertHyphens = 28
    # whether the text has an overline (`Pango#AttrInt`). Since 1.46
    Overline = 29
    # overline color (`Pango#AttrColor`). Since 1.46
    OverlineColor = 30
    # line height factor (`Pango#AttrFloat`). Since: 1.50
    LineHeight = 31
    # line height (`Pango#AttrInt`). Since: 1.50
    AbsoluteLineHeight = 32
    TextTransform      = 33
    # override segmentation to classify the range of the attribute as a single word (`Pango#AttrInt`). Since 1.50
    Word = 34
    # override segmentation to classify the range of the attribute as a single sentence (`Pango#AttrInt`). Since 1.50
    Sentence = 35
    # baseline displacement (`Pango#AttrInt`). Since 1.50
    BaselineShift = 36
    # font-relative size change (`Pango#AttrInt`). Since 1.50
    FontScale = 37
  end

  # An enumeration that affects baseline shifts between runs.
  enum BaselineShift : UInt32
    # Leave the baseline unchanged
    None = 0
    # Shift the baseline to the superscript position,
    #   relative to the previous run
    Superscript = 1
    # Shift the baseline to the subscript position,
    #   relative to the previous run
    Subscript = 2
  end

  # `PangoBidiType` represents the bidirectional character
  # type of a Unicode character.
  #
  # The values in this enumeration are specified by the
  # [Unicode bidirectional algorithm](http://www.unicode.org/reports/tr9/).
  enum BidiType : UInt32
    # Left-to-Right
    L = 0
    # Left-to-Right Embedding
    Lre = 1
    # Left-to-Right Override
    Lro = 2
    # Right-to-Left
    R = 3
    # Right-to-Left Arabic
    Al = 4
    # Right-to-Left Embedding
    Rle = 5
    # Right-to-Left Override
    Rlo = 6
    # Pop Directional Format
    Pdf = 7
    # European Number
    En = 8
    # European Number Separator
    Es = 9
    # European Number Terminator
    Et = 10
    # Arabic Number
    An = 11
    # Common Number Separator
    Cs = 12
    # Nonspacing Mark
    Nsm = 13
    # Boundary Neutral
    Bn = 14
    # Paragraph Separator
    B = 15
    # Segment Separator
    S = 16
    # Whitespace
    Ws = 17
    # Other Neutrals
    On = 18
    # Left-to-Right isolate. Since 1.48.6
    Lri = 19
    # Right-to-Left isolate. Since 1.48.6
    Rli = 20
    # First strong isolate. Since 1.48.6
    Fsi = 21
    # Pop directional isolate. Since 1.48.6
    Pdi = 22
  end

  # `PangoCoverageLevel` is used to indicate how well a font can
  # represent a particular Unicode character for a particular script.
  #
  # Since 1.44, only %PANGO_COVERAGE_NONE and %PANGO_COVERAGE_EXACT
  # will be returned.
  enum CoverageLevel : UInt32
    # The character is not representable with
    #   the font.
    None = 0
    # The character is represented in a
    #   way that may be comprehensible but is not the correct
    #   graphical form. For instance, a Hangul character represented
    #   as a a sequence of Jamos, or a Latin transliteration of a
    #   Cyrillic word.
    Fallback = 1
    # The character is represented as
    #   basically the correct graphical form, but with a stylistic
    #   variant inappropriate for the current script.
    Approximate = 2
    # The character is represented as the
    #   correct graphical form.
    Exact = 3
  end

  # `PangoDirection` represents a direction in the Unicode bidirectional
  # algorithm.
  #
  # Not every value in this enumeration makes sense for every usage of
  # `PangoDirection`; for example, the return value of `#unichar_direction`
  # and `#find_base_dir` cannot be `PANGO_DIRECTION_WEAK_LTR` or
  # `PANGO_DIRECTION_WEAK_RTL`, since every character is either neutral
  # or has a strong direction; on the other hand `PANGO_DIRECTION_NEUTRAL`
  # doesn't make sense to pass to `#itemize_with_base_dir`.
  #
  # The `PANGO_DIRECTION_TTB_LTR`, `PANGO_DIRECTION_TTB_RTL` values come from
  # an earlier interpretation of this enumeration as the writing direction
  # of a block of text and are no longer used. See `PangoGravity` for how
  # vertical text is handled in Pango.
  #
  # If you are interested in text direction, you should really use fribidi
  # directly. `PangoDirection` is only retained because it is used in some
  # public apis.
  enum Direction : UInt32
    # A strong left-to-right direction
    Ltr = 0
    # A strong right-to-left direction
    Rtl = 1
    # Deprecated value; treated the
    #   same as `PANGO_DIRECTION_RTL`.
    TtbLtr = 2
    # Deprecated value; treated the
    #   same as `PANGO_DIRECTION_LTR`
    TtbRtl = 3
    # A weak left-to-right direction
    WeakLtr = 4
    # A weak right-to-left direction
    WeakRtl = 5
    # No direction specified
    Neutral = 6
  end

  # `PangoEllipsizeMode` describes what sort of ellipsization
  # should be applied to text.
  #
  # In the ellipsization process characters are removed from the
  # text in order to make it fit to a given width and replaced
  # with an ellipsis.
  enum EllipsizeMode : UInt32
    # No ellipsization
    None = 0
    # Omit characters at the start of the text
    Start = 1
    # Omit characters in the middle of the text
    Middle = 2
    # Omit characters at the end of the text
    End = 3
  end

  # An enumeration that affects font sizes for superscript
  # and subscript positioning and for (emulated) Small Caps.
  enum FontScale : UInt32
    # Leave the font size unchanged
    None = 0
    # Change the font to a size suitable for superscripts
    Superscript = 1
    # Change the font to a size suitable for subscripts
    Subscript = 2
    # Change the font to a size suitable for Small Caps
    SmallCaps = 3
  end

  # `PangoGravity` represents the orientation of glyphs in a segment
  # of text.
  #
  # This is useful when rendering vertical text layouts. In those situations,
  # the layout is rotated using a non-identity `Pango#Matrix`, and then
  # glyph orientation is controlled using `PangoGravity`.
  #
  # Not every value in this enumeration makes sense for every usage of
  # `PangoGravity`; for example, %PANGO_GRAVITY_AUTO only can be passed to
  # `Pango::Context#base_gravity=` and can only be returned by
  # `Pango::Context#base_gravity`.
  #
  # See also: `Pango#GravityHint`
  enum Gravity : UInt32
    # Glyphs stand upright (default) <img align="right" valign="center" src="m-south.png">
    South = 0
    # Glyphs are rotated 90 degrees counter-clockwise. <img align="right" valign="center" src="m-east.png">
    East = 1
    # Glyphs are upside-down. <img align="right" valign="cener" src="m-north.png">
    North = 2
    # Glyphs are rotated 90 degrees clockwise. <img align="right" valign="center" src="m-west.png">
    West = 3
    # Gravity is resolved from the context matrix
    Auto = 4
  end

  # `PangoGravityHint` defines how horizontal scripts should behave in a
  # vertical context.
  #
  # That is, English excerpts in a vertical paragraph for example.
  #
  # See also `Pango#Gravity`
  enum GravityHint : UInt32
    # scripts will take their natural gravity based
    #   on the base gravity and the script.  This is the default.
    Natural = 0
    # always use the base gravity set, regardless of
    #   the script.
    Strong = 1
    # for scripts not in their natural direction (eg.
    #   Latin in East gravity), choose per-script gravity such that every script
    #   respects the line progression. This means, Latin and Arabic will take
    #   opposite gravities and both flow top-to-bottom for example.
    Line = 2
  end

  # The `PangoOverline` enumeration is used to specify whether text
  # should be overlined, and if so, the type of line.
  enum Overline : UInt32
    # no overline should be drawn
    None = 0
    # Draw a single line above the ink
    #   extents of the text being underlined.
    Single = 1
  end

  # `PangoRenderPart` defines different items to render for such
  # purposes as setting colors.
  enum RenderPart : UInt32
    # the text itself
    Foreground = 0
    # the area behind the text
    Background = 1
    # underlines
    Underline = 2
    # strikethrough lines
    Strikethrough = 3
    # overlines
    Overline = 4
  end

  # The `PangoScript` enumeration identifies different writing
  # systems.
  #
  # The values correspond to the names as defined in the Unicode standard. See
  # [Unicode Standard Annex 24: Script names](http://www.unicode.org/reports/tr24/)
  #
  # Note that this enumeration is deprecated and will not be updated to include values
  # in newer versions of the Unicode standard. Applications should use the
  # `GLib#UnicodeScript` enumeration instead,
  # whose values are interchangeable with `PangoScript`.
  enum Script : Int32
    # a value never returned from pango_script_for_unichar()
    InvalidCode = -1
    # a character used by multiple different scripts
    Common = 0
    # a mark glyph that takes its script from the
    # base glyph to which it is attached
    Inherited = 1
    # Arabic
    Arabic = 2
    # Armenian
    Armenian = 3
    # Bengali
    Bengali = 4
    # Bopomofo
    Bopomofo = 5
    # Cherokee
    Cherokee = 6
    # Coptic
    Coptic = 7
    # Cyrillic
    Cyrillic = 8
    # Deseret
    Deseret = 9
    # Devanagari
    Devanagari = 10
    # Ethiopic
    Ethiopic = 11
    # Georgian
    Georgian = 12
    # Gothic
    Gothic = 13
    # Greek
    Greek = 14
    # Gujarati
    Gujarati = 15
    # Gurmukhi
    Gurmukhi = 16
    # Han
    Han = 17
    # Hangul
    Hangul = 18
    # Hebrew
    Hebrew = 19
    # Hiragana
    Hiragana = 20
    # Kannada
    Kannada = 21
    # Katakana
    Katakana = 22
    # Khmer
    Khmer = 23
    # Lao
    Lao = 24
    # Latin
    Latin = 25
    # Malayalam
    Malayalam = 26
    # Mongolian
    Mongolian = 27
    # Myanmar
    Myanmar = 28
    # Ogham
    Ogham = 29
    # Old Italic
    OldItalic = 30
    # Oriya
    Oriya = 31
    # Runic
    Runic = 32
    # Sinhala
    Sinhala = 33
    # Syriac
    Syriac = 34
    # Tamil
    Tamil = 35
    # Telugu
    Telugu = 36
    # Thaana
    Thaana = 37
    # Thai
    Thai = 38
    # Tibetan
    Tibetan = 39
    # Canadian Aboriginal
    CanadianAboriginal = 40
    # Yi
    Yi = 41
    # Tagalog
    Tagalog = 42
    # Hanunoo
    Hanunoo = 43
    # Buhid
    Buhid = 44
    # Tagbanwa
    Tagbanwa = 45
    # Braille
    Braille = 46
    # Cypriot
    Cypriot = 47
    # Limbu
    Limbu = 48
    # Osmanya
    Osmanya = 49
    # Shavian
    Shavian = 50
    # Linear B
    LinearB = 51
    # Tai Le
    TaiLe = 52
    # Ugaritic
    Ugaritic = 53
    # New Tai Lue. Since 1.10
    NewTaiLue = 54
    # Buginese. Since 1.10
    Buginese = 55
    # Glagolitic. Since 1.10
    Glagolitic = 56
    # Tifinagh. Since 1.10
    Tifinagh = 57
    # Syloti Nagri. Since 1.10
    SylotiNagri = 58
    # Old Persian. Since 1.10
    OldPersian = 59
    # Kharoshthi. Since 1.10
    Kharoshthi = 60
    # an unassigned code point. Since 1.14
    Unknown = 61
    # Balinese. Since 1.14
    Balinese = 62
    # Cuneiform. Since 1.14
    Cuneiform = 63
    # Phoenician. Since 1.14
    Phoenician = 64
    # Phags-pa. Since 1.14
    PhagsPa = 65
    # N'Ko. Since 1.14
    Nko = 66
    # Kayah Li. Since 1.20.1
    KayahLi = 67
    # Lepcha. Since 1.20.1
    Lepcha = 68
    # Rejang. Since 1.20.1
    Rejang = 69
    # Sundanese. Since 1.20.1
    Sundanese = 70
    # Saurashtra. Since 1.20.1
    Saurashtra = 71
    # Cham. Since 1.20.1
    Cham = 72
    # Ol Chiki. Since 1.20.1
    OlChiki = 73
    # Vai. Since 1.20.1
    Vai = 74
    # Carian. Since 1.20.1
    Carian = 75
    # Lycian. Since 1.20.1
    Lycian = 76
    # Lydian. Since 1.20.1
    Lydian = 77
    # Batak. Since 1.32
    Batak = 78
    # Brahmi. Since 1.32
    Brahmi = 79
    # Mandaic. Since 1.32
    Mandaic = 80
    # Chakma. Since: 1.32
    Chakma = 81
    # Meroitic Cursive. Since: 1.32
    MeroiticCursive = 82
    # Meroitic Hieroglyphs. Since: 1.32
    MeroiticHieroglyphs = 83
    # Miao. Since: 1.32
    Miao = 84
    # Sharada. Since: 1.32
    Sharada = 85
    # Sora Sompeng. Since: 1.32
    SoraSompeng = 86
    # Takri. Since: 1.32
    Takri = 87
    # Bassa. Since: 1.40
    BassaVah = 88
    # Caucasian Albanian. Since: 1.40
    CaucasianAlbanian = 89
    # Duployan. Since: 1.40
    Duployan = 90
    # Elbasan. Since: 1.40
    Elbasan = 91
    # Grantha. Since: 1.40
    Grantha = 92
    # Kjohki. Since: 1.40
    Khojki = 93
    # Khudawadi, Sindhi. Since: 1.40
    Khudawadi = 94
    # Linear A. Since: 1.40
    LinearA = 95
    # Mahajani. Since: 1.40
    Mahajani = 96
    # Manichaean. Since: 1.40
    Manichaean = 97
    # Mende Kikakui. Since: 1.40
    MendeKikakui = 98
    # Modi. Since: 1.40
    Modi = 99
    # Mro. Since: 1.40
    Mro = 100
    # Nabataean. Since: 1.40
    Nabataean = 101
    # Old North Arabian. Since: 1.40
    OldNorthArabian = 102
    # Old Permic. Since: 1.40
    OldPermic = 103
    # Pahawh Hmong. Since: 1.40
    PahawhHmong = 104
    # Palmyrene. Since: 1.40
    Palmyrene = 105
    # Pau Cin Hau. Since: 1.40
    PauCinHau = 106
    # Psalter Pahlavi. Since: 1.40
    PsalterPahlavi = 107
    # Siddham. Since: 1.40
    Siddham = 108
    # Tirhuta. Since: 1.40
    Tirhuta = 109
    # Warang Citi. Since: 1.40
    WarangCiti = 110
    # Ahom. Since: 1.40
    Ahom = 111
    # Anatolian Hieroglyphs. Since: 1.40
    AnatolianHieroglyphs = 112
    # Hatran. Since: 1.40
    Hatran = 113
    # Multani. Since: 1.40
    Multani = 114
    # Old Hungarian. Since: 1.40
    OldHungarian = 115
    # Signwriting. Since: 1.40
    Signwriting = 116
  end

  # An enumeration specifying the width of the font relative to other designs
  # within a family.
  enum Stretch : UInt32
    # ultra condensed width
    UltraCondensed = 0
    # extra condensed width
    ExtraCondensed = 1
    # condensed width
    Condensed = 2
    # semi condensed width
    SemiCondensed = 3
    # the normal width
    Normal = 4
    # semi expanded width
    SemiExpanded = 5
    # expanded width
    Expanded = 6
    # extra expanded width
    ExtraExpanded = 7
    # ultra expanded width
    UltraExpanded = 8
  end

  # An enumeration specifying the various slant styles possible for a font.
  enum Style : UInt32
    # the font is upright.
    Normal = 0
    # the font is slanted, but in a roman style.
    Oblique = 1
    # the font is slanted in an italic style.
    Italic = 2
  end

  # `PangoTabAlign` specifies where the text appears relative to the tab stop
  # position.
  enum TabAlign : UInt32
    # the text appears to the right of the tab stop position
    Left = 0
    # the text appears to the left of the tab stop position
    #   until the available space is filled. Since: 1.50
    Right = 1
    # the text is centered at the tab stop position
    #   until the available space is filled. Since: 1.50
    Center = 2
    # text before the first occurrence of the decimal point
    #   character appears to the left of the tab stop position (until the available
    #   space is filled), the rest to the right. Since: 1.50
    Decimal = 3
  end

  # An enumeration that affects how Pango treats characters during shaping.
  enum TextTransform : UInt32
    # Leave text unchanged
    None = 0
    # Display letters and numbers as lowercase
    Lowercase = 1
    # Display letters and numbers as uppercase
    Uppercase = 2
    # Display the first character of a word
    #   in titlecase
    Capitalize = 3
  end

  # The `PangoUnderline` enumeration is used to specify whether text
  # should be underlined, and if so, the type of underlining.
  enum Underline : UInt32
    # no underline should be drawn
    None = 0
    # a single underline should be drawn
    Single = 1
    # a double underline should be drawn
    Double = 2
    # a single underline should be drawn at a
    #   position beneath the ink extents of the text being
    #   underlined. This should be used only for underlining
    #   single characters, such as for keyboard accelerators.
    #   %PANGO_UNDERLINE_SINGLE should be used for extended
    #   portions of text.
    Low = 3
    # an underline indicating an error should
    #   be drawn below. The exact style of rendering is up to the
    #   `PangoRenderer` in use, but typical styles include wavy
    #   or dotted lines.
    #   This underline is typically used to indicate an error such
    #   as a possible mispelling; in some cases a contrasting color
    #   may automatically be used. This type of underlining is
    #   available since Pango 1.4.
    Error = 4
    # Like @PANGO_UNDERLINE_SINGLE, but
    #   drawn continuously across multiple runs. This type
    #   of underlining is available since Pango 1.46.
    SingleLine = 5
    # Like @PANGO_UNDERLINE_DOUBLE, but
    #   drawn continuously across multiple runs. This type
    #   of underlining is available since Pango 1.46.
    DoubleLine = 6
    # Like @PANGO_UNDERLINE_ERROR, but
    #   drawn continuously across multiple runs. This type
    #   of underlining is available since Pango 1.46.
    ErrorLine = 7
  end

  # An enumeration specifying capitalization variant of the font.
  enum Variant : UInt32
    # A normal font.
    Normal = 0
    # A font with the lower case characters
    #   replaced by smaller variants of the capital characters.
    SmallCaps = 1
    # A font with all characters
    #   replaced by smaller variants of the capital characters. Since: 1.50
    AllSmallCaps = 2
    # A font with the lower case characters
    #   replaced by smaller variants of the capital characters.
    #   Petite Caps can be even smaller than Small Caps. Since: 1.50
    PetiteCaps = 3
    # A font with all characters
    #   replaced by smaller variants of the capital characters.
    #   Petite Caps can be even smaller than Small Caps. Since: 1.50
    AllPetiteCaps = 4
    # A font with the upper case characters
    #   replaced by smaller variants of the capital letters. Since: 1.50
    Unicase = 5
    # A font with capital letters that
    #   are more suitable for all-uppercase titles. Since: 1.50
    TitleCaps = 6
  end

  # An enumeration specifying the weight (boldness) of a font.
  #
  # Weight is specified as a numeric value ranging from 100 to 1000.
  # This enumeration simply provides some common, predefined values.
  enum Weight : UInt32
    # the thin weight (= 100) Since: 1.24
    Thin = 100
    # the ultralight weight (= 200)
    Ultralight = 200
    # the light weight (= 300)
    Light = 300
    # the semilight weight (= 350) Since: 1.36.7
    Semilight = 350
    # the book weight (= 380) Since: 1.24)
    Book = 380
    # the default weight (= 400)
    Normal = 400
    # the normal weight (= 500) Since: 1.24
    Medium = 500
    # the semibold weight (= 600)
    Semibold = 600
    # the bold weight (= 700)
    Bold = 700
    # the ultrabold weight (= 800)
    Ultrabold = 800
    # the heavy weight (= 900)
    Heavy = 900
    # the ultraheavy weight (= 1000) Since: 1.24
    Ultraheavy = 1000
  end

  # `PangoWrapMode` describes how to wrap the lines of a `PangoLayout`
  # to the desired width.
  #
  # For @PANGO_WRAP_WORD, Pango uses break opportunities that are determined
  # by the Unicode line breaking algorithm. For @PANGO_WRAP_CHAR, Pango allows
  # breaking at grapheme boundaries that are determined by the Unicode text
  # segmentation algorithm.
  enum WrapMode : UInt32
    # wrap lines at word boundaries.
    Word = 0
    # wrap lines at character boundaries.
    Char = 1
    # wrap lines at word boundaries, but fall back to
    #   character boundaries if there is not enough space for a full word.
    WordChar = 2
  end

  # Flags
  @[Flags]
  enum FontMask : UInt32
    Family     =   1
    Style      =   2
    Variant    =   4
    Weight     =   8
    Stretch    =  16
    Size       =  32
    Gravity    =  64
    Variations = 128

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_font_mask_get_type
    end
  end
  @[Flags]
  enum LayoutDeserializeFlags : UInt32
    Default = 0
    Context = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_layout_deserialize_flags_get_type
    end
  end
  @[Flags]
  enum LayoutSerializeFlags : UInt32
    Default = 0
    Context = 1
    Output  = 2

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_layout_serialize_flags_get_type
    end
  end
  @[Flags]
  enum ShapeFlags : UInt32
    RoundPositions = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_shape_flags_get_type
    end
  end
  @[Flags]
  enum ShowFlags : UInt32
    Spaces     = 1
    LineBreaks = 2
    Ignorables = 4

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_show_flags_get_type
    end
  end

  def self.attr_allow_breaks_new(allow_breaks : Bool) : Pango::Attribute
    # pango_attr_allow_breaks_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_allow_breaks_new(allow_breaks)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_background_alpha_new(alpha : UInt16) : Pango::Attribute
    # pango_attr_background_alpha_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_background_alpha_new(alpha)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_background_new(red : UInt16, green : UInt16, blue : UInt16) : Pango::Attribute
    # pango_attr_background_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_background_new(red, green, blue)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_baseline_shift_new(shift : Int32) : Pango::Attribute
    # pango_attr_baseline_shift_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_baseline_shift_new(shift)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_break(text : ::String, length : Int32, attr_list : Pango::AttrList, offset : Int32, attrs : Enumerable(Pango::LogAttr)) : Nil
    # pango_attr_break: (None)
    # @attrs: (array length=attrs_len element-type Interface)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    attrs_len = attrs.size # Generator::ArrayArgPlan
    attrs = attrs.to_a.map(&.to_unsafe).to_unsafe

    # C call
    LibPango.pango_attr_break(text, length, attr_list, offset, attrs, attrs_len)

    # Return value handling
  end

  def self.attr_fallback_new(enable_fallback : Bool) : Pango::Attribute
    # pango_attr_fallback_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_fallback_new(enable_fallback)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_family_new(family : ::String) : Pango::Attribute
    # pango_attr_family_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_family_new(family)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_font_desc_new(desc : Pango::FontDescription) : Pango::Attribute
    # pango_attr_font_desc_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_font_desc_new(desc)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_font_features_new(features : ::String) : Pango::Attribute
    # pango_attr_font_features_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_font_features_new(features)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_font_scale_new(scale : Pango::FontScale) : Pango::Attribute
    # pango_attr_font_scale_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_font_scale_new(scale)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_foreground_alpha_new(alpha : UInt16) : Pango::Attribute
    # pango_attr_foreground_alpha_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_foreground_alpha_new(alpha)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_foreground_new(red : UInt16, green : UInt16, blue : UInt16) : Pango::Attribute
    # pango_attr_foreground_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_foreground_new(red, green, blue)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_gravity_hint_new(hint : Pango::GravityHint) : Pango::Attribute
    # pango_attr_gravity_hint_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_gravity_hint_new(hint)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_gravity_new(gravity : Pango::Gravity) : Pango::Attribute
    # pango_attr_gravity_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_gravity_new(gravity)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_insert_hyphens_new(insert_hyphens : Bool) : Pango::Attribute
    # pango_attr_insert_hyphens_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_insert_hyphens_new(insert_hyphens)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_language_new(language : Pango::Language) : Pango::Attribute
    # pango_attr_language_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_language_new(language)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_letter_spacing_new(letter_spacing : Int32) : Pango::Attribute
    # pango_attr_letter_spacing_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_letter_spacing_new(letter_spacing)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_line_height_new(factor : Float64) : Pango::Attribute
    # pango_attr_line_height_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_line_height_new(factor)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_line_height_new_absolute(height : Int32) : Pango::Attribute
    # pango_attr_line_height_new_absolute: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_line_height_new_absolute(height)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_list_from_string(text : ::String) : Pango::AttrList?
    # pango_attr_list_from_string: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_list_from_string(text)

    # Return value handling

    Pango::AttrList.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
  end

  def self.attr_overline_color_new(red : UInt16, green : UInt16, blue : UInt16) : Pango::Attribute
    # pango_attr_overline_color_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_overline_color_new(red, green, blue)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_overline_new(overline : Pango::Overline) : Pango::Attribute
    # pango_attr_overline_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_overline_new(overline)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_rise_new(rise : Int32) : Pango::Attribute
    # pango_attr_rise_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_rise_new(rise)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_scale_new(scale_factor : Float64) : Pango::Attribute
    # pango_attr_scale_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_scale_new(scale_factor)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_sentence_new : Pango::Attribute
    # pango_attr_sentence_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_sentence_new

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_shape_new(ink_rect : Pango::Rectangle, logical_rect : Pango::Rectangle) : Pango::Attribute
    # pango_attr_shape_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_shape_new(ink_rect, logical_rect)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_shape_new_with_data(ink_rect : Pango::Rectangle, logical_rect : Pango::Rectangle, data : Pointer(Void)?, copy_func : Pango::AttrDataCopyFunc?, destroy_func : GLib::DestroyNotify?) : Pango::Attribute
    # pango_attr_shape_new_with_data: (None)
    # @data: (nullable)
    # @copy_func: (nullable)
    # @destroy_func: (nullable)
    # Returns: (transfer full)

    # Generator::NullableArrayPlan
    data = if data.nil?
             Pointer(Void).null
           else
             data.to_unsafe
           end

    # C call
    _retval = LibPango.pango_attr_shape_new_with_data(ink_rect, logical_rect, data, copy_func, destroy_func)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_show_new(flags : Pango::ShowFlags) : Pango::Attribute
    # pango_attr_show_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_show_new(flags)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_size_new(size : Int32) : Pango::Attribute
    # pango_attr_size_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_size_new(size)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_size_new_absolute(size : Int32) : Pango::Attribute
    # pango_attr_size_new_absolute: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_size_new_absolute(size)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_stretch_new(stretch : Pango::Stretch) : Pango::Attribute
    # pango_attr_stretch_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_stretch_new(stretch)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_strikethrough_color_new(red : UInt16, green : UInt16, blue : UInt16) : Pango::Attribute
    # pango_attr_strikethrough_color_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_strikethrough_color_new(red, green, blue)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_strikethrough_new(strikethrough : Bool) : Pango::Attribute
    # pango_attr_strikethrough_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_strikethrough_new(strikethrough)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_style_new(style : Pango::Style) : Pango::Attribute
    # pango_attr_style_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_style_new(style)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_text_transform_new(transform : Pango::TextTransform) : Pango::Attribute
    # pango_attr_text_transform_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_text_transform_new(transform)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_type_get_name(type : Pango::AttrType) : ::String?
    # pango_attr_type_get_name: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_attr_type_get_name(type)

    # Return value handling

    ::String.new(_retval) unless _retval.null?
  end

  def self.attr_type_register(name : ::String) : Pango::AttrType
    # pango_attr_type_register: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_attr_type_register(name)

    # Return value handling

    Pango::AttrType.new(_retval)
  end

  def self.attr_underline_color_new(red : UInt16, green : UInt16, blue : UInt16) : Pango::Attribute
    # pango_attr_underline_color_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_underline_color_new(red, green, blue)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_underline_new(underline : Pango::Underline) : Pango::Attribute
    # pango_attr_underline_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_underline_new(underline)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_variant_new(variant : Pango::Variant) : Pango::Attribute
    # pango_attr_variant_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_variant_new(variant)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_weight_new(weight : Pango::Weight) : Pango::Attribute
    # pango_attr_weight_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_weight_new(weight)

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.attr_word_new : Pango::Attribute
    # pango_attr_word_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_attr_word_new

    # Return value handling

    Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
  end

  def self.bidi_type_for_unichar(ch : UInt32) : Pango::BidiType
    # pango_bidi_type_for_unichar: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_bidi_type_for_unichar(ch)

    # Return value handling

    Pango::BidiType.new(_retval)
  end

  def self.break(text : ::String, length : Int32, analysis : Pango::Analysis, attrs : Enumerable(Pango::LogAttr)) : Nil
    # pango_break: (None)
    # @attrs: (array length=attrs_len element-type Interface)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    attrs_len = attrs.size # Generator::ArrayArgPlan
    attrs = attrs.to_a.map(&.to_unsafe).to_unsafe

    # C call
    LibPango.pango_break(text, length, analysis, attrs, attrs_len)

    # Return value handling
  end

  def self.default_break(text : ::String, length : Int32, analysis : Pango::Analysis?, attrs : Pango::LogAttr, attrs_len : Int32) : Nil
    # pango_default_break: (None)
    # @analysis: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    analysis = if analysis.nil?
                 Pointer(Void).null
               else
                 analysis.to_unsafe
               end

    # C call
    LibPango.pango_default_break(text, length, analysis, attrs, attrs_len)

    # Return value handling
  end

  def self.extents_to_pixels(inclusive : Pango::Rectangle?, nearest : Pango::Rectangle?) : Nil
    # pango_extents_to_pixels: (None)
    # @inclusive: (nullable)
    # @nearest: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    inclusive = if inclusive.nil?
                  Pointer(Void).null
                else
                  inclusive.to_unsafe
                end
    # Generator::NullableArrayPlan
    nearest = if nearest.nil?
                Pointer(Void).null
              else
                nearest.to_unsafe
              end

    # C call
    LibPango.pango_extents_to_pixels(inclusive, nearest)

    # Return value handling
  end

  def self.find_base_dir(text : ::String, length : Int32) : Pango::Direction
    # pango_find_base_dir: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_find_base_dir(text, length)

    # Return value handling

    Pango::Direction.new(_retval)
  end

  def self.find_paragraph_boundary(text : ::String, length : Int32, paragraph_delimiter_index : Int32, next_paragraph_start : Int32) : Nil
    # pango_find_paragraph_boundary: (None)
    # @paragraph_delimiter_index: (out) (transfer full)
    # @next_paragraph_start: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    LibPango.pango_find_paragraph_boundary(text, length, paragraph_delimiter_index, next_paragraph_start)

    # Return value handling
  end

  def self.font_description_from_string(str : ::String) : Pango::FontDescription
    # pango_font_description_from_string: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_font_description_from_string(str)

    # Return value handling

    Pango::FontDescription.new(_retval, GICrystal::Transfer::Full)
  end

  def self.log_attrs(text : ::String, length : Int32, level : Int32, language : Pango::Language, attrs : Enumerable(Pango::LogAttr)) : Nil
    # pango_get_log_attrs: (None)
    # @attrs: (array length=attrs_len element-type Interface)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    attrs_len = attrs.size # Generator::ArrayArgPlan
    attrs = attrs.to_a.map(&.to_unsafe).to_unsafe

    # C call
    LibPango.pango_get_log_attrs(text, length, level, language, attrs, attrs_len)

    # Return value handling
  end

  def self.mirror_char(ch : UInt32, mirrored_ch : Pointer(UInt32)) : Bool
    # pango_get_mirror_char: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_get_mirror_char(ch, mirrored_ch)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.gravity_get_for_matrix(matrix : Pango::Matrix?) : Pango::Gravity
    # pango_gravity_get_for_matrix: (None)
    # @matrix: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    matrix = if matrix.nil?
               Pointer(Void).null
             else
               matrix.to_unsafe
             end

    # C call
    _retval = LibPango.pango_gravity_get_for_matrix(matrix)

    # Return value handling

    Pango::Gravity.new(_retval)
  end

  def self.gravity_get_for_script(script : Pango::Script, base_gravity : Pango::Gravity, hint : Pango::GravityHint) : Pango::Gravity
    # pango_gravity_get_for_script: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_gravity_get_for_script(script, base_gravity, hint)

    # Return value handling

    Pango::Gravity.new(_retval)
  end

  def self.gravity_get_for_script_and_width(script : Pango::Script, wide : Bool, base_gravity : Pango::Gravity, hint : Pango::GravityHint) : Pango::Gravity
    # pango_gravity_get_for_script_and_width: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_gravity_get_for_script_and_width(script, wide, base_gravity, hint)

    # Return value handling

    Pango::Gravity.new(_retval)
  end

  def self.gravity_to_rotation(gravity : Pango::Gravity) : Float64
    # pango_gravity_to_rotation: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_gravity_to_rotation(gravity)

    # Return value handling

    _retval
  end

  def self.is_zero_width(ch : UInt32) : Bool
    # pango_is_zero_width: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_is_zero_width(ch)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.itemize(context : Pango::Context, text : ::String, start_index : Int32, length : Int32, attrs : Pango::AttrList, cached_iter : Pango::AttrIterator?) : GLib::List
    # pango_itemize: (None)
    # @cached_iter: (nullable)
    # Returns: (transfer full)

    # Generator::NullableArrayPlan
    cached_iter = if cached_iter.nil?
                    Pointer(Void).null
                  else
                    cached_iter.to_unsafe
                  end

    # C call
    _retval = LibPango.pango_itemize(context, text, start_index, length, attrs, cached_iter)

    # Return value handling

    GLib::List(Pango::Item).new(_retval, GICrystal::Transfer::Full)
  end

  def self.itemize_with_base_dir(context : Pango::Context, base_dir : Pango::Direction, text : ::String, start_index : Int32, length : Int32, attrs : Pango::AttrList, cached_iter : Pango::AttrIterator?) : GLib::List
    # pango_itemize_with_base_dir: (None)
    # @cached_iter: (nullable)
    # Returns: (transfer full)

    # Generator::NullableArrayPlan
    cached_iter = if cached_iter.nil?
                    Pointer(Void).null
                  else
                    cached_iter.to_unsafe
                  end

    # C call
    _retval = LibPango.pango_itemize_with_base_dir(context, base_dir, text, start_index, length, attrs, cached_iter)

    # Return value handling

    GLib::List(Pango::Item).new(_retval, GICrystal::Transfer::Full)
  end

  def self.language_from_string(language : ::String?) : Pango::Language?
    # pango_language_from_string: (None)
    # @language: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    language = if language.nil?
                 Pointer(LibC::Char).null
               else
                 language.to_unsafe
               end

    # C call
    _retval = LibPango.pango_language_from_string(language)

    # Return value handling

    Pango::Language.new(_retval, GICrystal::Transfer::None) unless _retval.null?
  end

  def self.language_get_default : Pango::Language
    # pango_language_get_default: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_language_get_default

    # Return value handling

    Pango::Language.new(_retval, GICrystal::Transfer::None)
  end

  def self.language_get_preferred : Pango::Language?
    # pango_language_get_preferred: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_language_get_preferred

    # Return value handling

    Pango::Language.new(_retval, GICrystal::Transfer::None) unless _retval.null?
  end

  def self.layout_deserialize_error_quark : UInt32
    # pango_layout_deserialize_error_quark: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_layout_deserialize_error_quark

    # Return value handling

    _retval
  end

  def self.log2vis_get_embedding_levels(text : ::String, length : Int32, pbase_dir : Pango::Direction) : Pointer(UInt8)
    # pango_log2vis_get_embedding_levels: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_log2vis_get_embedding_levels(text, length, pbase_dir)

    # Return value handling

    _retval
  end

  def markup_parser_finish(context : GLib::MarkupParseContext) : Bool
    # pango_markup_parser_finish: (Throws)
    # @attr_list: (out) (transfer full) (optional)
    # @text: (out) (transfer full) (optional)
    # @accel_char: (out) (transfer full) (optional)
    # Returns: (transfer none)

    _error = Pointer(LibGLib::Error).null

    # Generator::OutArgUsedInReturnPlan
    attr_list = Pointer(Pointer(Void)).null  # Generator::OutArgUsedInReturnPlan
    text = Pointer(Pointer(LibC::Char)).null # Generator::OutArgUsedInReturnPlan
    accel_char = Pointer(UInt32).null
    # C call
    _retval = LibPango.pango_markup_parser_finish(context, attr_list, text, accel_char, pointerof(_error))

    # Error check
    Pango.raise_exception(_error) unless _error.null?

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.markup_parser_new(accel_marker : UInt32) : GLib::MarkupParseContext
    # pango_markup_parser_new: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_markup_parser_new(accel_marker)

    # Return value handling

    GLib::MarkupParseContext.new(_retval, GICrystal::Transfer::None)
  end

  def self.parse_enum(type : UInt64, str : ::String?, warn : Bool) : Bool
    # pango_parse_enum: (None)
    # @str: (nullable)
    # @value: (out) (transfer full) (optional)
    # @possible_values: (out) (transfer full) (optional)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    str = if str.nil?
            Pointer(LibC::Char).null
          else
            str.to_unsafe
          end
    # Generator::OutArgUsedInReturnPlan
    value = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
    possible_values = Pointer(Pointer(LibC::Char)).null
    # C call
    _retval = LibPango.pango_parse_enum(type, str, value, warn, possible_values)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def parse_markup(markup_text : ::String, length : Int32, accel_marker : UInt32) : Bool
    # pango_parse_markup: (Throws)
    # @attr_list: (out) (transfer full) (optional)
    # @text: (out) (transfer full) (optional)
    # @accel_char: (out) (transfer full) (optional)
    # Returns: (transfer none)

    _error = Pointer(LibGLib::Error).null

    # Generator::OutArgUsedInReturnPlan
    attr_list = Pointer(Pointer(Void)).null  # Generator::OutArgUsedInReturnPlan
    text = Pointer(Pointer(LibC::Char)).null # Generator::OutArgUsedInReturnPlan
    accel_char = Pointer(UInt32).null
    # C call
    _retval = LibPango.pango_parse_markup(markup_text, length, accel_marker, attr_list, text, accel_char, pointerof(_error))

    # Error check
    Pango.raise_exception(_error) unless _error.null?

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.parse_stretch(str : ::String, stretch : Pango::Stretch, warn : Bool) : Bool
    # pango_parse_stretch: (None)
    # @stretch: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_parse_stretch(str, stretch, warn)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.parse_style(str : ::String, style : Pango::Style, warn : Bool) : Bool
    # pango_parse_style: (None)
    # @style: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_parse_style(str, style, warn)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.parse_variant(str : ::String, variant : Pango::Variant, warn : Bool) : Bool
    # pango_parse_variant: (None)
    # @variant: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_parse_variant(str, variant, warn)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.parse_weight(str : ::String, weight : Pango::Weight, warn : Bool) : Bool
    # pango_parse_weight: (None)
    # @weight: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_parse_weight(str, weight, warn)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.quantize_line_geometry(thickness : Int32, position : Int32) : Nil
    # pango_quantize_line_geometry: (None)
    # @thickness: (inout) (transfer full)
    # @position: (inout) (transfer full)
    # Returns: (transfer none)

    # C call
    LibPango.pango_quantize_line_geometry(thickness, position)

    # Return value handling
  end

  def self.read_line(stream : Pointer(Void)?, str : GLib::String) : Int32
    # pango_read_line: (None)
    # @stream: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    stream = if stream.nil?
               Pointer(Void).null
             else
               stream.to_unsafe
             end

    # C call
    _retval = LibPango.pango_read_line(stream, str)

    # Return value handling

    _retval
  end

  def self.reorder_items(items : GLib::List) : GLib::List
    # pango_reorder_items: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_reorder_items(items)

    # Return value handling

    GLib::List(Pango::Item).new(_retval, GICrystal::Transfer::Full)
  end

  def self.scan_int(pos : ::String, out _out : Int32) : Bool
    # pango_scan_int: (None)
    # @pos: (inout) (transfer full)
    # @out: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_scan_int(pos, _out)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.scan_string(pos : ::String, out _out : GLib::String) : Bool
    # pango_scan_string: (None)
    # @pos: (inout) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_scan_string(pos, _out)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.scan_word(pos : ::String, out _out : GLib::String) : Bool
    # pango_scan_word: (None)
    # @pos: (inout) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_scan_word(pos, _out)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.script_for_unichar(ch : UInt32) : Pango::Script
    # pango_script_for_unichar: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_script_for_unichar(ch)

    # Return value handling

    Pango::Script.new(_retval)
  end

  def self.script_get_sample_language(script : Pango::Script) : Pango::Language?
    # pango_script_get_sample_language: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_script_get_sample_language(script)

    # Return value handling

    Pango::Language.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
  end

  def self.shape(text : ::String, length : Int32, analysis : Pango::Analysis, glyphs : Pango::GlyphString) : Nil
    # pango_shape: (None)
    # Returns: (transfer none)

    # C call
    LibPango.pango_shape(text, length, analysis, glyphs)

    # Return value handling
  end

  def self.shape_full(item_text : ::String, item_length : Int32, paragraph_text : ::String?, paragraph_length : Int32, analysis : Pango::Analysis, glyphs : Pango::GlyphString) : Nil
    # pango_shape_full: (None)
    # @paragraph_text: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    paragraph_text = if paragraph_text.nil?
                       Pointer(LibC::Char).null
                     else
                       paragraph_text.to_unsafe
                     end

    # C call
    LibPango.pango_shape_full(item_text, item_length, paragraph_text, paragraph_length, analysis, glyphs)

    # Return value handling
  end

  def self.shape_item(item : Pango::Item, paragraph_text : ::String?, paragraph_length : Int32, log_attrs : Pango::LogAttr?, glyphs : Pango::GlyphString, flags : Pango::ShapeFlags) : Nil
    # pango_shape_item: (None)
    # @paragraph_text: (nullable)
    # @log_attrs: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    paragraph_text = if paragraph_text.nil?
                       Pointer(LibC::Char).null
                     else
                       paragraph_text.to_unsafe
                     end
    # Generator::NullableArrayPlan
    log_attrs = if log_attrs.nil?
                  Pointer(Void).null
                else
                  log_attrs.to_unsafe
                end

    # C call
    LibPango.pango_shape_item(item, paragraph_text, paragraph_length, log_attrs, glyphs, flags)

    # Return value handling
  end

  def self.shape_with_flags(item_text : ::String, item_length : Int32, paragraph_text : ::String?, paragraph_length : Int32, analysis : Pango::Analysis, glyphs : Pango::GlyphString, flags : Pango::ShapeFlags) : Nil
    # pango_shape_with_flags: (None)
    # @paragraph_text: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    paragraph_text = if paragraph_text.nil?
                       Pointer(LibC::Char).null
                     else
                       paragraph_text.to_unsafe
                     end

    # C call
    LibPango.pango_shape_with_flags(item_text, item_length, paragraph_text, paragraph_length, analysis, glyphs, flags)

    # Return value handling
  end

  def self.skip_space(pos : ::String) : Bool
    # pango_skip_space: (None)
    # @pos: (inout) (transfer full)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_skip_space(pos)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.split_file_list(str : ::String) : Enumerable(::String)
    # pango_split_file_list: (None)
    # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

    # C call
    _retval = LibPango.pango_split_file_list(str)

    # Return value handling

    GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
  end

  def self.tab_array_from_string(text : ::String) : Pango::TabArray?
    # pango_tab_array_from_string: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_tab_array_from_string(text)

    # Return value handling

    Pango::TabArray.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
  end

  def self.tailor_break(text : ::String, length : Int32, analysis : Pango::Analysis, offset : Int32, attrs : Enumerable(Pango::LogAttr)) : Nil
    # pango_tailor_break: (None)
    # @attrs: (array length=attrs_len element-type Interface)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    attrs_len = attrs.size # Generator::ArrayArgPlan
    attrs = attrs.to_a.map(&.to_unsafe).to_unsafe

    # C call
    LibPango.pango_tailor_break(text, length, analysis, offset, attrs, attrs_len)

    # Return value handling
  end

  def self.trim_string(str : ::String) : ::String
    # pango_trim_string: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPango.pango_trim_string(str)

    # Return value handling

    GICrystal.transfer_full(_retval)
  end

  def self.unichar_direction(ch : UInt32) : Pango::Direction
    # pango_unichar_direction: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_unichar_direction(ch)

    # Return value handling

    Pango::Direction.new(_retval)
  end

  def self.units_from_double(d : Float64) : Int32
    # pango_units_from_double: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_units_from_double(d)

    # Return value handling

    _retval
  end

  def self.units_to_double(i : Int32) : Float64
    # pango_units_to_double: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_units_to_double(i)

    # Return value handling

    _retval
  end

  def self.version : Int32
    # pango_version: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_version

    # Return value handling

    _retval
  end

  def self.version_check(required_major : Int32, required_minor : Int32, required_micro : Int32) : ::String?
    # pango_version_check: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_version_check(required_major, required_minor, required_micro)

    # Return value handling

    ::String.new(_retval) unless _retval.null?
  end

  def self.version_string : ::String
    # pango_version_string: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPango.pango_version_string

    # Return value handling

    ::String.new(_retval)
  end

  # Errors

  # Errors that can be returned by `Pango::Layout#deserialize`.
  class LayoutDeserializeError < PangoError
    class Invalid < LayoutDeserializeError
      def code : Int32
        0
      end
    end

    class InvalidValue < LayoutDeserializeError
      def code : Int32
        1
      end
    end

    class MissingValue < LayoutDeserializeError
      def code : Int32
        2
      end
    end
  end

  # :nodoc:
  def raise_exception(error : Pointer(LibGLib::Error))
    error_domain = error.value.domain
    error_code = error.value.code

    if error_domain == LibGLib.g_quark_try_string("pango-layout-deserialize-error-quark")
      raise LayoutDeserializeError::Invalid.new(error) if error_code == 0
      raise LayoutDeserializeError::InvalidValue.new(error) if error_code == 1
      raise LayoutDeserializeError::MissingValue.new(error) if error_code == 2
    end

    Cairo.raise_exception(error)
    HarfBuzz.raise_exception(error)
    GObject.raise_exception(error)
  end

  extend self
end

# Extra includes
