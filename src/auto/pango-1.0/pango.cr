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
  ANALYSIS_FLAG_CENTERED_BASELINE =              1
  ANALYSIS_FLAG_IS_ELLIPSIS       =              2
  ANALYSIS_FLAG_NEED_HYPHEN       =              4
  ATTR_INDEX_FROM_TEXT_BEGINNING  =          0_u32
  ATTR_INDEX_TO_TEXT_END          = 4294967295_u32
  GLYPH_EMPTY                     =  268435455_u32
  GLYPH_INVALID_INPUT             = 4294967295_u32
  GLYPH_UNKNOWN_FLAG              =  268435456_u32
  SCALE                           =           1024
  VERSION_MAJOR                   =              1
  VERSION_MICRO                   =             10
  VERSION_MINOR                   =             48
  VERSION_STRING                  = "1.48.10"

  enum Alignment : UInt32
    Left   = 0
    Center = 1
    Right  = 2
  end

  enum AttrType : UInt32
    Invalid            =  0
    Language           =  1
    Family             =  2
    Style              =  3
    Weight             =  4
    Variant            =  5
    Stretch            =  6
    Size               =  7
    FontDesc           =  8
    Foreground         =  9
    Background         = 10
    Underline          = 11
    Strikethrough      = 12
    Rise               = 13
    Shape              = 14
    Scale              = 15
    Fallback           = 16
    LetterSpacing      = 17
    UnderlineColor     = 18
    StrikethroughColor = 19
    AbsoluteSize       = 20
    Gravity            = 21
    GravityHint        = 22
    FontFeatures       = 23
    ForegroundAlpha    = 24
    BackgroundAlpha    = 25
    AllowBreaks        = 26
    Show               = 27
    InsertHyphens      = 28
    Overline           = 29
    OverlineColor      = 30
  end

  enum BidiType : UInt32
    L   =  0
    Lre =  1
    Lro =  2
    R   =  3
    Al  =  4
    Rle =  5
    Rlo =  6
    Pdf =  7
    En  =  8
    Es  =  9
    Et  = 10
    An  = 11
    Cs  = 12
    Nsm = 13
    Bn  = 14
    B   = 15
    S   = 16
    Ws  = 17
    On  = 18
    Lri = 19
    Rli = 20
    Fsi = 21
    Pdi = 22
  end

  enum CoverageLevel : UInt32
    None        = 0
    Fallback    = 1
    Approximate = 2
    Exact       = 3
  end

  enum Direction : UInt32
    Ltr     = 0
    Rtl     = 1
    TtbLtr  = 2
    TtbRtl  = 3
    WeakLtr = 4
    WeakRtl = 5
    Neutral = 6
  end

  enum EllipsizeMode : UInt32
    None   = 0
    Start  = 1
    Middle = 2
    End    = 3
  end

  enum Gravity : UInt32
    South = 0
    East  = 1
    North = 2
    West  = 3
    Auto  = 4
  end

  enum GravityHint : UInt32
    Natural = 0
    Strong  = 1
    Line    = 2
  end

  enum Overline : UInt32
    None   = 0
    Single = 1
  end

  enum RenderPart : UInt32
    Foreground    = 0
    Background    = 1
    Underline     = 2
    Strikethrough = 3
    Overline      = 4
  end

  enum Script : Int32
    InvalidCode          =  -1
    Common               =   0
    Inherited            =   1
    Arabic               =   2
    Armenian             =   3
    Bengali              =   4
    Bopomofo             =   5
    Cherokee             =   6
    Coptic               =   7
    Cyrillic             =   8
    Deseret              =   9
    Devanagari           =  10
    Ethiopic             =  11
    Georgian             =  12
    Gothic               =  13
    Greek                =  14
    Gujarati             =  15
    Gurmukhi             =  16
    Han                  =  17
    Hangul               =  18
    Hebrew               =  19
    Hiragana             =  20
    Kannada              =  21
    Katakana             =  22
    Khmer                =  23
    Lao                  =  24
    Latin                =  25
    Malayalam            =  26
    Mongolian            =  27
    Myanmar              =  28
    Ogham                =  29
    OldItalic            =  30
    Oriya                =  31
    Runic                =  32
    Sinhala              =  33
    Syriac               =  34
    Tamil                =  35
    Telugu               =  36
    Thaana               =  37
    Thai                 =  38
    Tibetan              =  39
    CanadianAboriginal   =  40
    Yi                   =  41
    Tagalog              =  42
    Hanunoo              =  43
    Buhid                =  44
    Tagbanwa             =  45
    Braille              =  46
    Cypriot              =  47
    Limbu                =  48
    Osmanya              =  49
    Shavian              =  50
    LinearB              =  51
    TaiLe                =  52
    Ugaritic             =  53
    NewTaiLue            =  54
    Buginese             =  55
    Glagolitic           =  56
    Tifinagh             =  57
    SylotiNagri          =  58
    OldPersian           =  59
    Kharoshthi           =  60
    Unknown              =  61
    Balinese             =  62
    Cuneiform            =  63
    Phoenician           =  64
    PhagsPa              =  65
    Nko                  =  66
    KayahLi              =  67
    Lepcha               =  68
    Rejang               =  69
    Sundanese            =  70
    Saurashtra           =  71
    Cham                 =  72
    OlChiki              =  73
    Vai                  =  74
    Carian               =  75
    Lycian               =  76
    Lydian               =  77
    Batak                =  78
    Brahmi               =  79
    Mandaic              =  80
    Chakma               =  81
    MeroiticCursive      =  82
    MeroiticHieroglyphs  =  83
    Miao                 =  84
    Sharada              =  85
    SoraSompeng          =  86
    Takri                =  87
    BassaVah             =  88
    CaucasianAlbanian    =  89
    Duployan             =  90
    Elbasan              =  91
    Grantha              =  92
    Khojki               =  93
    Khudawadi            =  94
    LinearA              =  95
    Mahajani             =  96
    Manichaean           =  97
    MendeKikakui         =  98
    Modi                 =  99
    Mro                  = 100
    Nabataean            = 101
    OldNorthArabian      = 102
    OldPermic            = 103
    PahawhHmong          = 104
    Palmyrene            = 105
    PauCinHau            = 106
    PsalterPahlavi       = 107
    Siddham              = 108
    Tirhuta              = 109
    WarangCiti           = 110
    Ahom                 = 111
    AnatolianHieroglyphs = 112
    Hatran               = 113
    Multani              = 114
    OldHungarian         = 115
    Signwriting          = 116
  end

  enum Stretch : UInt32
    UltraCondensed = 0
    ExtraCondensed = 1
    Condensed      = 2
    SemiCondensed  = 3
    Normal         = 4
    SemiExpanded   = 5
    Expanded       = 6
    ExtraExpanded  = 7
    UltraExpanded  = 8
  end

  enum Style : UInt32
    Normal  = 0
    Oblique = 1
    Italic  = 2
  end

  enum TabAlign : UInt32
    Left = 0
  end

  enum Underline : UInt32
    None       = 0
    Single     = 1
    Double     = 2
    Low        = 3
    Error      = 4
    SingleLine = 5
    DoubleLine = 6
    ErrorLine  = 7
  end

  enum Variant : UInt32
    Normal    = 0
    SmallCaps = 1
  end

  enum Weight : UInt32
    Thin       =  100
    Ultralight =  200
    Light      =  300
    Semilight  =  350
    Book       =  380
    Normal     =  400
    Medium     =  500
    Semibold   =  600
    Bold       =  700
    Ultrabold  =  800
    Heavy      =  900
    Ultraheavy = 1000
  end

  enum WrapMode : UInt32
    Word     = 0
    Char     = 1
    WordChar = 2
  end

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

  extend self
end

# Extra includes
