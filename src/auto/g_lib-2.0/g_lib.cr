# Dependencies

# C lib declaration
require "./lib_g_lib.cr"

# Wrappers
require "./error.cr"
require "./key_file.cr"
require "./main_context.cr"
require "./main_loop.cr"
require "./mapped_file.cr"
require "./markup_parse_context.cr"
require "./markup_parser.cr"
require "./source.cr"
require "./source_callback_funcs.cr"
require "./source_funcs.cr"
require "./variant_builder.cr"
require "./variant_dict.cr"
require "./variant_type.cr"

module GLib
  ANALYZER_ANALYZING                         =    1
  ASCII_DTOSTR_BUF_SIZE                      =   39
  BIG_ENDIAN                                 = 4321
  CSET_A_2_Z                                 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  CSET_DIGITS                                = "0123456789"
  CSET_a_2_z                                 = "abcdefghijklmnopqrstuvwxyz"
  DATALIST_FLAGS_MASK                        =  3
  DATE_BAD_DAY                               =  0
  DATE_BAD_JULIAN                            =  0
  DATE_BAD_YEAR                              =  0
  DIR_SEPARATOR                              = 47
  DIR_SEPARATOR_S                            = "/"
  E                                          = 2.718282
  GINT16_FORMAT                              = "hi"
  GINT16_MODIFIER                            = "h"
  GINT32_FORMAT                              = "i"
  GINT32_MODIFIER                            = ""
  GINT64_FORMAT                              = "li"
  GINT64_MODIFIER                            = "l"
  GINTPTR_FORMAT                             = "li"
  GINTPTR_MODIFIER                           = "l"
  GNUC_FUNCTION                              = ""
  GNUC_PRETTY_FUNCTION                       = ""
  GSIZE_FORMAT                               = "lu"
  GSIZE_MODIFIER                             = "l"
  GSSIZE_FORMAT                              = "li"
  GSSIZE_MODIFIER                            = "l"
  GUINT16_FORMAT                             = "hu"
  GUINT32_FORMAT                             = "u"
  GUINT64_FORMAT                             = "lu"
  GUINTPTR_FORMAT                            = "lu"
  HAVE_GINT64                                =    1
  HAVE_GNUC_VARARGS                          =    1
  HAVE_GNUC_VISIBILITY                       =    1
  HAVE_GROWING_STACK                         =    0
  HAVE_ISO_VARARGS                           =    1
  HOOK_FLAG_USER_SHIFT                       =    4
  IEEE754_DOUBLE_BIAS                        = 1023
  IEEE754_FLOAT_BIAS                         =  127
  KEY_FILE_DESKTOP_GROUP                     = "Desktop Entry"
  KEY_FILE_DESKTOP_KEY_ACTIONS               = "Actions"
  KEY_FILE_DESKTOP_KEY_CATEGORIES            = "Categories"
  KEY_FILE_DESKTOP_KEY_COMMENT               = "Comment"
  KEY_FILE_DESKTOP_KEY_DBUS_ACTIVATABLE      = "DBusActivatable"
  KEY_FILE_DESKTOP_KEY_EXEC                  = "Exec"
  KEY_FILE_DESKTOP_KEY_GENERIC_NAME          = "GenericName"
  KEY_FILE_DESKTOP_KEY_HIDDEN                = "Hidden"
  KEY_FILE_DESKTOP_KEY_ICON                  = "Icon"
  KEY_FILE_DESKTOP_KEY_MIME_TYPE             = "MimeType"
  KEY_FILE_DESKTOP_KEY_NAME                  = "Name"
  KEY_FILE_DESKTOP_KEY_NOT_SHOW_IN           = "NotShowIn"
  KEY_FILE_DESKTOP_KEY_NO_DISPLAY            = "NoDisplay"
  KEY_FILE_DESKTOP_KEY_ONLY_SHOW_IN          = "OnlyShowIn"
  KEY_FILE_DESKTOP_KEY_PATH                  = "Path"
  KEY_FILE_DESKTOP_KEY_STARTUP_NOTIFY        = "StartupNotify"
  KEY_FILE_DESKTOP_KEY_STARTUP_WM_CLASS      = "StartupWMClass"
  KEY_FILE_DESKTOP_KEY_TERMINAL              = "Terminal"
  KEY_FILE_DESKTOP_KEY_TRY_EXEC              = "TryExec"
  KEY_FILE_DESKTOP_KEY_TYPE                  = "Type"
  KEY_FILE_DESKTOP_KEY_URL                   = "URL"
  KEY_FILE_DESKTOP_KEY_VERSION               = "Version"
  KEY_FILE_DESKTOP_TYPE_APPLICATION          = "Application"
  KEY_FILE_DESKTOP_TYPE_DIRECTORY            = "Directory"
  KEY_FILE_DESKTOP_TYPE_LINK                 = "Link"
  LITTLE_ENDIAN                              =                     1234
  LN10                                       =                 2.302585
  LN2                                        =                 0.693147
  LOG_2_BASE_10                              =                  0.30103
  LOG_DOMAIN                                 =                     0_i8
  LOG_FATAL_MASK                             =                        5
  LOG_LEVEL_USER_SHIFT                       =                        8
  MAJOR_VERSION                              =                        2
  MAXINT16                                   =                32767_i16
  MAXINT32                                   =               2147483647
  MAXINT64                                   =  9223372036854775807_i64
  MAXINT8                                    =                   127_i8
  MAXUINT16                                  =                65535_u16
  MAXUINT32                                  =           4294967295_u32
  MAXUINT64                                  = 18446744073709551615_u64
  MAXUINT8                                   =                   255_u8
  MICRO_VERSION                              =                        0
  MININT16                                   =               -32768_i16
  MININT32                                   =              -2147483648
  MININT64                                   = -9223372036854775808_i64
  MININT8                                    =                  -128_i8
  MINOR_VERSION                              =                       70
  MODULE_SUFFIX                              = "so"
  OPTION_REMAINING                           = ""
  PDP_ENDIAN                                 =     3412
  PI                                         = 3.141593
  PID_FORMAT                                 = "i"
  PI_2                                       = 1.570796
  PI_4                                       = 0.785398
  POLLFD_FORMAT                              = "%d"
  PRIORITY_DEFAULT                           =    0
  PRIORITY_DEFAULT_IDLE                      =  200
  PRIORITY_HIGH                              = -100
  PRIORITY_HIGH_IDLE                         =  100
  PRIORITY_LOW                               =  300
  SEARCHPATH_SEPARATOR                       =   58
  SEARCHPATH_SEPARATOR_S                     = ":"
  SIZEOF_LONG                                = 8
  SIZEOF_SIZE_T                              = 8
  SIZEOF_SSIZE_T                             = 8
  SIZEOF_VOID_P                              = 8
  SOURCE_CONTINUE                            = true
  SOURCE_REMOVE                              = true
  SQRT2                                      = 1.414214
  STR_DELIMITERS                             = "_-|> <."
  SYSDEF_AF_INET                             =  2
  SYSDEF_AF_INET6                            = 10
  SYSDEF_AF_UNIX                             =  1
  SYSDEF_MSG_DONTROUTE                       =  4
  SYSDEF_MSG_OOB                             =  1
  SYSDEF_MSG_PEEK                            =  2
  TEST_OPTION_ISOLATE_DIRS                   = "isolate_dirs"
  TIME_SPAN_DAY                              = 86400000000_i64
  TIME_SPAN_HOUR                             =  3600000000_i64
  TIME_SPAN_MILLISECOND                      =        1000_i64
  TIME_SPAN_MINUTE                           =    60000000_i64
  TIME_SPAN_SECOND                           =     1000000_i64
  UNICHAR_MAX_DECOMPOSITION_LENGTH           =              18
  URI_RESERVED_CHARS_GENERIC_DELIMITERS      = ":/?#[]@"
  URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS = "!$&'()*+,;="
  USEC_PER_SEC                               =  1000000
  VA_COPY_AS_ARRAY                           =        1
  VERSION_MIN_REQUIRED                       =        2
  WIN32_MSG_HANDLE                           = 19981206
  macro__has_attribute___noreturn__ = 0

  enum BookmarkFileError : UInt32
    InvalidUri       = 0
    InvalidValue     = 1
    AppNotRegistered = 2
    UriNotFound      = 3
    Read             = 4
    UnknownEncoding  = 5
    Write            = 6
    FileNotFound     = 7
  end

  enum ChecksumType : UInt32
    Md5    = 0
    Sha1   = 1
    Sha256 = 2
    Sha512 = 3
    Sha384 = 4
  end

  enum ConvertError : UInt32
    NoConversion    = 0
    IllegalSequence = 1
    Failed          = 2
    PartialInput    = 3
    BadUri          = 4
    NotAbsolutePath = 5
    NoMemory        = 6
    EmbeddedNul     = 7
  end

  enum DateDMY : UInt32
    Day   = 0
    Month = 1
    Year  = 2
  end

  enum DateMonth : UInt32
    BadMonth  =  0
    January   =  1
    February  =  2
    March     =  3
    April     =  4
    May       =  5
    June      =  6
    July      =  7
    August    =  8
    September =  9
    October   = 10
    November  = 11
    December  = 12
  end

  enum DateWeekday : UInt32
    BadWeekday = 0
    Monday     = 1
    Tuesday    = 2
    Wednesday  = 3
    Thursday   = 4
    Friday     = 5
    Saturday   = 6
    Sunday     = 7
  end

  enum ErrorType : UInt32
    Unknown           = 0
    UnexpEof          = 1
    UnexpEofInString  = 2
    UnexpEofInComment = 3
    NonDigitInConst   = 4
    DigitRadix        = 5
    FloatRadix        = 6
    FloatMalformed    = 7
  end

  enum FileError : UInt32
    Exist       =  0
    Isdir       =  1
    Acces       =  2
    Nametoolong =  3
    Noent       =  4
    Notdir      =  5
    Nxio        =  6
    Nodev       =  7
    Rofs        =  8
    Txtbsy      =  9
    Fault       = 10
    Loop        = 11
    Nospc       = 12
    Nomem       = 13
    Mfile       = 14
    Nfile       = 15
    Badf        = 16
    Inval       = 17
    Pipe        = 18
    Again       = 19
    Intr        = 20
    Io          = 21
    Perm        = 22
    Nosys       = 23
    Failed      = 24
  end

  enum IOChannelError : UInt32
    Fbig     = 0
    Inval    = 1
    Io       = 2
    Isdir    = 3
    Nospc    = 4
    Nxio     = 5
    Overflow = 6
    Pipe     = 7
    Failed   = 8
  end

  enum IOError : UInt32
    None    = 0
    Again   = 1
    Inval   = 2
    Unknown = 3
  end

  enum IOStatus : UInt32
    Error  = 0
    Normal = 1
    Eof    = 2
    Again  = 3
  end

  enum KeyFileError : UInt32
    UnknownEncoding = 0
    Parse           = 1
    NotFound        = 2
    KeyNotFound     = 3
    GroupNotFound   = 4
    InvalidValue    = 5
  end

  enum LogWriterOutput : UInt32
    Handled   = 1
    Unhandled = 0
  end

  enum MarkupError : UInt32
    BadUtf8          = 0
    Empty            = 1
    Parse            = 2
    UnknownElement   = 3
    UnknownAttribute = 4
    InvalidContent   = 5
    MissingAttribute = 6
  end

  enum NormalizeMode : UInt32
    Default        = 0
    Nfd            = 0
    DefaultCompose = 1
    Nfc            = 1
    All            = 2
    Nfkd           = 2
    AllCompose     = 3
    Nfkc           = 3
  end

  enum NumberParserError : UInt32
    Invalid     = 0
    OutOfBounds = 1
  end

  enum OnceStatus : UInt32
    Notcalled = 0
    Progress  = 1
    Ready     = 2
  end

  enum OptionArg : UInt32
    None          = 0
    String        = 1
    Int           = 2
    Callback      = 3
    Filename      = 4
    StringArray   = 5
    FilenameArray = 6
    Double        = 7
    Int64         = 8
  end

  enum OptionError : UInt32
    UnknownOption = 0
    BadValue      = 1
    Failed        = 2
  end

  enum RegexError : UInt32
    Compile                                  =   0
    Optimize                                 =   1
    Replace                                  =   2
    Match                                    =   3
    Internal                                 =   4
    StrayBackslash                           = 101
    MissingControlChar                       = 102
    UnrecognizedEscape                       = 103
    QuantifiersOutOfOrder                    = 104
    QuantifierTooBig                         = 105
    UnterminatedCharacterClass               = 106
    InvalidEscapeInCharacterClass            = 107
    RangeOutOfOrder                          = 108
    NothingToRepeat                          = 109
    UnrecognizedCharacter                    = 112
    PosixNamedClassOutsideClass              = 113
    UnmatchedParenthesis                     = 114
    InexistentSubpatternReference            = 115
    UnterminatedComment                      = 118
    ExpressionTooLarge                       = 120
    MemoryError                              = 121
    VariableLengthLookbehind                 = 125
    MalformedCondition                       = 126
    TooManyConditionalBranches               = 127
    AssertionExpected                        = 128
    UnknownPosixClassName                    = 130
    PosixCollatingElementsNotSupported       = 131
    HexCodeTooLarge                          = 134
    InvalidCondition                         = 135
    SingleByteMatchInLookbehind              = 136
    InfiniteLoop                             = 140
    MissingSubpatternNameTerminator          = 142
    DuplicateSubpatternName                  = 143
    MalformedProperty                        = 146
    UnknownProperty                          = 147
    SubpatternNameTooLong                    = 148
    TooManySubpatterns                       = 149
    InvalidOctalValue                        = 151
    TooManyBranchesInDefine                  = 154
    DefineRepetion                           = 155
    InconsistentNewlineOptions               = 156
    MissingBackReference                     = 157
    InvalidRelativeReference                 = 158
    BacktrackingControlVerbArgumentForbidden = 159
    UnknownBacktrackingControlVerb           = 160
    NumberTooBig                             = 161
    MissingSubpatternName                    = 162
    MissingDigit                             = 163
    InvalidDataCharacter                     = 164
    ExtraSubpatternName                      = 165
    BacktrackingControlVerbArgumentRequired  = 166
    InvalidControlChar                       = 168
    MissingName                              = 169
    NotSupportedInClass                      = 171
    TooManyForwardReferences                 = 172
    NameTooLong                              = 175
    CharacterValueTooLarge                   = 176
  end

  enum SeekType : UInt32
    Cur = 0
    Set = 1
    End = 2
  end

  enum ShellError : UInt32
    BadQuoting  = 0
    EmptyString = 1
    Failed      = 2
  end

  enum SliceConfig : UInt32
    AlwaysMalloc      = 1
    BypassMagazines   = 2
    WorkingSetMsecs   = 3
    ColorIncrement    = 4
    ChunkSizes        = 5
    ContentionCounter = 6
  end

  enum SpawnError : UInt32
    Fork        =  0
    Read        =  1
    Chdir       =  2
    Acces       =  3
    Perm        =  4
    TooBig      =  5
    G2big       =  5
    Noexec      =  6
    Nametoolong =  7
    Noent       =  8
    Nomem       =  9
    Notdir      = 10
    Loop        = 11
    Txtbusy     = 12
    Io          = 13
    Nfile       = 14
    Mfile       = 15
    Inval       = 16
    Isdir       = 17
    Libbad      = 18
    Failed      = 19
  end

  enum TestFileType : UInt32
    Dist  = 0
    Built = 1
  end

  enum TestLogType : UInt32
    None        =  0
    Error       =  1
    StartBinary =  2
    ListCase    =  3
    SkipCase    =  4
    StartCase   =  5
    StopCase    =  6
    MinResult   =  7
    MaxResult   =  8
    Message     =  9
    StartSuite  = 10
    StopSuite   = 11
  end

  enum TestResult : UInt32
    Success    = 0
    Skipped    = 1
    Failure    = 2
    Incomplete = 3
  end

  enum ThreadError : UInt32
    ThreadErrorAgain = 0
  end

  enum TimeType : UInt32
    Standard  = 0
    Daylight  = 1
    Universal = 2
  end

  enum TokenType : UInt32
    Eof            =   0
    LeftParen      =  40
    RightParen     =  41
    LeftCurly      = 123
    RightCurly     = 125
    LeftBrace      =  91
    RightBrace     =  93
    EqualSign      =  61
    Comma          =  44
    None           = 256
    Error          = 257
    Char           = 258
    Binary         = 259
    Octal          = 260
    Int            = 261
    Hex            = 262
    Float          = 263
    String         = 264
    Symbol         = 265
    Identifier     = 266
    IdentifierNull = 267
    CommentSingle  = 268
    CommentMulti   = 269
  end

  enum TraverseType : UInt32
    InOrder    = 0
    PreOrder   = 1
    PostOrder  = 2
    LevelOrder = 3
  end

  enum UnicodeBreakType : UInt32
    Mandatory                  =  0
    CarriageReturn             =  1
    LineFeed                   =  2
    CombiningMark              =  3
    Surrogate                  =  4
    ZeroWidthSpace             =  5
    Inseparable                =  6
    NonBreakingGlue            =  7
    Contingent                 =  8
    Space                      =  9
    After                      = 10
    Before                     = 11
    BeforeAndAfter             = 12
    Hyphen                     = 13
    NonStarter                 = 14
    OpenPunctuation            = 15
    ClosePunctuation           = 16
    Quotation                  = 17
    Exclamation                = 18
    Ideographic                = 19
    Numeric                    = 20
    InfixSeparator             = 21
    Symbol                     = 22
    Alphabetic                 = 23
    Prefix                     = 24
    Postfix                    = 25
    ComplexContext             = 26
    Ambiguous                  = 27
    Unknown                    = 28
    NextLine                   = 29
    WordJoiner                 = 30
    HangulLJamo                = 31
    HangulVJamo                = 32
    HangulTJamo                = 33
    HangulLvSyllable           = 34
    HangulLvtSyllable          = 35
    CloseParanthesis           = 36
    CloseParenthesis           = 36
    ConditionalJapaneseStarter = 37
    HebrewLetter               = 38
    RegionalIndicator          = 39
    EmojiBase                  = 40
    EmojiModifier              = 41
    ZeroWidthJoiner            = 42
  end

  enum UnicodeScript : Int32
    InvalidCode           =  -1
    Common                =   0
    Inherited             =   1
    Arabic                =   2
    Armenian              =   3
    Bengali               =   4
    Bopomofo              =   5
    Cherokee              =   6
    Coptic                =   7
    Cyrillic              =   8
    Deseret               =   9
    Devanagari            =  10
    Ethiopic              =  11
    Georgian              =  12
    Gothic                =  13
    Greek                 =  14
    Gujarati              =  15
    Gurmukhi              =  16
    Han                   =  17
    Hangul                =  18
    Hebrew                =  19
    Hiragana              =  20
    Kannada               =  21
    Katakana              =  22
    Khmer                 =  23
    Lao                   =  24
    Latin                 =  25
    Malayalam             =  26
    Mongolian             =  27
    Myanmar               =  28
    Ogham                 =  29
    OldItalic             =  30
    Oriya                 =  31
    Runic                 =  32
    Sinhala               =  33
    Syriac                =  34
    Tamil                 =  35
    Telugu                =  36
    Thaana                =  37
    Thai                  =  38
    Tibetan               =  39
    CanadianAboriginal    =  40
    Yi                    =  41
    Tagalog               =  42
    Hanunoo               =  43
    Buhid                 =  44
    Tagbanwa              =  45
    Braille               =  46
    Cypriot               =  47
    Limbu                 =  48
    Osmanya               =  49
    Shavian               =  50
    LinearB               =  51
    TaiLe                 =  52
    Ugaritic              =  53
    NewTaiLue             =  54
    Buginese              =  55
    Glagolitic            =  56
    Tifinagh              =  57
    SylotiNagri           =  58
    OldPersian            =  59
    Kharoshthi            =  60
    Unknown               =  61
    Balinese              =  62
    Cuneiform             =  63
    Phoenician            =  64
    PhagsPa               =  65
    Nko                   =  66
    KayahLi               =  67
    Lepcha                =  68
    Rejang                =  69
    Sundanese             =  70
    Saurashtra            =  71
    Cham                  =  72
    OlChiki               =  73
    Vai                   =  74
    Carian                =  75
    Lycian                =  76
    Lydian                =  77
    Avestan               =  78
    Bamum                 =  79
    EgyptianHieroglyphs   =  80
    ImperialAramaic       =  81
    InscriptionalPahlavi  =  82
    InscriptionalParthian =  83
    Javanese              =  84
    Kaithi                =  85
    Lisu                  =  86
    MeeteiMayek           =  87
    OldSouthArabian       =  88
    OldTurkic             =  89
    Samaritan             =  90
    TaiTham               =  91
    TaiViet               =  92
    Batak                 =  93
    Brahmi                =  94
    Mandaic               =  95
    Chakma                =  96
    MeroiticCursive       =  97
    MeroiticHieroglyphs   =  98
    Miao                  =  99
    Sharada               = 100
    SoraSompeng           = 101
    Takri                 = 102
    BassaVah              = 103
    CaucasianAlbanian     = 104
    Duployan              = 105
    Elbasan               = 106
    Grantha               = 107
    Khojki                = 108
    Khudawadi             = 109
    LinearA               = 110
    Mahajani              = 111
    Manichaean            = 112
    MendeKikakui          = 113
    Modi                  = 114
    Mro                   = 115
    Nabataean             = 116
    OldNorthArabian       = 117
    OldPermic             = 118
    PahawhHmong           = 119
    Palmyrene             = 120
    PauCinHau             = 121
    PsalterPahlavi        = 122
    Siddham               = 123
    Tirhuta               = 124
    WarangCiti            = 125
    Ahom                  = 126
    AnatolianHieroglyphs  = 127
    Hatran                = 128
    Multani               = 129
    OldHungarian          = 130
    Signwriting           = 131
    Adlam                 = 132
    Bhaiksuki             = 133
    Marchen               = 134
    Newa                  = 135
    Osage                 = 136
    Tangut                = 137
    MasaramGondi          = 138
    Nushu                 = 139
    Soyombo               = 140
    ZanabazarSquare       = 141
    Dogra                 = 142
    GunjalaGondi          = 143
    HanifiRohingya        = 144
    Makasar               = 145
    Medefaidrin           = 146
    OldSogdian            = 147
    Sogdian               = 148
    Elymaic               = 149
    Nandinagari           = 150
    NyiakengPuachueHmong  = 151
    Wancho                = 152
    Chorasmian            = 153
    DivesAkuru            = 154
    KhitanSmallScript     = 155
    Yezidi                = 156
  end

  enum UnicodeType : UInt32
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

  enum UriError : UInt32
    Failed        = 0
    BadScheme     = 1
    BadUser       = 2
    BadPassword   = 3
    BadAuthParams = 4
    BadHost       = 5
    BadPort       = 6
    BadPath       = 7
    BadQuery      = 8
    BadFragment   = 9
  end

  enum UserDirectory : UInt32
    DirectoryDesktop     = 0
    DirectoryDocuments   = 1
    DirectoryDownload    = 2
    DirectoryMusic       = 3
    DirectoryPictures    = 4
    DirectoryPublicShare = 5
    DirectoryTemplates   = 6
    DirectoryVideos      = 7
    NDirectories         = 8
  end

  enum VariantClass : UInt32
    Boolean    =  98
    Byte       = 121
    Int16      = 110
    Uint16     = 113
    Int32      = 105
    Uint32     = 117
    Int64      = 120
    Uint64     = 116
    Handle     = 104
    Double     = 100
    String     = 115
    ObjectPath = 111
    Signature  = 103
    Variant    = 118
    Maybe      = 109
    Array      =  97
    Tuple      =  40
    DictEntry  = 123
  end

  enum VariantParseError : UInt32
    Failed                     =  0
    BasicTypeExpected          =  1
    CannotInferType            =  2
    DefiniteTypeExpected       =  3
    InputNotAtEnd              =  4
    InvalidCharacter           =  5
    InvalidFormatString        =  6
    InvalidObjectPath          =  7
    InvalidSignature           =  8
    InvalidTypeString          =  9
    NoCommonType               = 10
    NumberOutOfRange           = 11
    NumberTooBig               = 12
    TypeError                  = 13
    UnexpectedToken            = 14
    UnknownKeyword             = 15
    UnterminatedStringConstant = 16
    ValueExpected              = 17
    Recursion                  = 18
  end

  @[Flags]
  enum AsciiType : UInt32
    Alnum  =    1
    Alpha  =    2
    Cntrl  =    4
    Digit  =    8
    Graph  =   16
    Lower  =   32
    Print  =   64
    Punct  =  128
    Space  =  256
    Upper  =  512
    Xdigit = 1024
  end

  @[Flags]
  enum FileSetContentsFlags : UInt32
    Consistent   = 1
    Durable      = 2
    OnlyExisting = 4
  end

  @[Flags]
  enum FileTest : UInt32
    IsRegular    =  1
    IsSymlink    =  2
    IsDir        =  4
    IsExecutable =  8
    Exists       = 16
  end

  @[Flags]
  enum FormatSizeFlags : UInt32
    Default    = 0
    LongFormat = 1
    IecUnits   = 2
    Bits       = 4
  end

  @[Flags]
  enum HookFlagMask : UInt32
    Active =  1
    InCall =  2
    Mask   = 15
  end

  @[Flags]
  enum IOCondition : UInt32
    In   =  1
    Out  =  4
    Pri  =  2
    Err  =  8
    Hup  = 16
    Nval = 32

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGLib.g_io_condition_get_type
    end
  end

  @[Flags]
  enum IOFlags : UInt32
    Append      =  1
    Nonblock    =  2
    IsReadable  =  4
    IsWritable  =  8
    IsWriteable =  8
    IsSeekable  = 16
    Mask        = 31
    GetMask     = 31
    SetMask     =  3
  end

  @[Flags]
  enum KeyFileFlags : UInt32
    KeepComments     = 1
    KeepTranslations = 2
  end

  @[Flags]
  enum LogLevelFlags : Int32
    FlagRecursion =   1
    FlagFatal     =   2
    LevelError    =   4
    LevelCritical =   8
    LevelWarning  =  16
    LevelMessage  =  32
    LevelInfo     =  64
    LevelDebug    = 128
    LevelMask     =  -4
  end

  @[Flags]
  enum MarkupCollectType : UInt32
    Invalid  =     0
    String   =     1
    Strdup   =     2
    Boolean  =     3
    Tristate =     4
    Optional = 65536
  end

  @[Flags]
  enum MarkupParseFlags : UInt32
    DoNotUseThisUnsupportedFlag = 1
    TreatCdataAsText            = 2
    PrefixErrorPosition         = 4
    IgnoreQualified             = 8
  end

  @[Flags]
  enum OptionFlags : UInt32
    Hidden      =  1
    InMain      =  2
    Reverse     =  4
    NoArg       =  8
    Filename    = 16
    OptionalArg = 32
    Noalias     = 64
  end

  @[Flags]
  enum RegexCompileFlags : UInt32
    Caseless         =        1
    Multiline        =        2
    Dotall           =        4
    Extended         =        8
    Anchored         =       16
    DollarEndonly    =       32
    Ungreedy         =      512
    Raw              =     2048
    NoAutoCapture    =     4096
    Optimize         =     8192
    Firstline        =   262144
    Dupnames         =   524288
    NewlineCr        =  1048576
    NewlineLf        =  2097152
    NewlineCrlf      =  3145728
    NewlineAnycrlf   =  5242880
    BsrAnycrlf       =  8388608
    JavascriptCompat = 33554432
  end

  @[Flags]
  enum RegexMatchFlags : UInt32
    Anchored        =        16
    Notbol          =       128
    Noteol          =       256
    Notempty        =      1024
    Partial         =     32768
    NewlineCr       =   1048576
    NewlineLf       =   2097152
    NewlineCrlf     =   3145728
    NewlineAny      =   4194304
    NewlineAnycrlf  =   5242880
    BsrAnycrlf      =   8388608
    BsrAny          =  16777216
    PartialSoft     =     32768
    PartialHard     = 134217728
    NotemptyAtstart = 268435456
  end

  @[Flags]
  enum SpawnFlags : UInt32
    Default              =   0
    LeaveDescriptorsOpen =   1
    DoNotReapChild       =   2
    SearchPath           =   4
    StdoutToDevNull      =   8
    StderrToDevNull      =  16
    ChildInheritsStdin   =  32
    FileAndArgvZero      =  64
    SearchPathFromEnvp   = 128
    CloexecPipes         = 256
  end

  @[Flags]
  enum TestSubprocessFlags : UInt32
    Stdin  = 1
    Stdout = 2
    Stderr = 4
  end

  @[Flags]
  enum TestTrapFlags : UInt32
    SilenceStdout = 128
    SilenceStderr = 256
    InheritStdin  = 512
  end

  @[Flags]
  enum TraverseFlags : UInt32
    Leaves    = 1
    NonLeaves = 2
    Mask      = 3
    Leafs     = 1
    NonLeafs  = 2
  end

  @[Flags]
  enum UriFlags : UInt32
    ParseRelaxed    =   1
    HasPassword     =   2
    HasAuthParams   =   4
    Encoded         =   8
    NonDns          =  16
    EncodedQuery    =  32
    EncodedPath     =  64
    EncodedFragment = 128
    SchemeNormalize = 256
  end

  @[Flags]
  enum UriHideFlags : UInt32
    Userinfo   =  1
    Password   =  2
    AuthParams =  4
    Query      =  8
    Fragment   = 16
  end

  @[Flags]
  enum UriParamsFlags : UInt32
    CaseInsensitive = 1
    WwwForm         = 2
    ParseRelaxed    = 4
  end

  extend self
end

# Extra includes
require "./includes/closure_data_manager.cr"
require "./includes/list.cr"
require "./includes/slist.cr"
require "./includes/timeout.cr"
require "./includes/util.cr"
require "./includes/variant.cr"
