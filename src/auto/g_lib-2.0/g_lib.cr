# Dependencies

# C lib declaration
require "./lib_g_lib.cr"

# Wrappers
require "./bytes.cr"
require "./error.cr"
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
  ANALYZER_ANALYZING = 1
  # A good size for a buffer to be passed into g_ascii_dtostr().
  # It is guaranteed to be enough for all output of that function
  # on systems with 64bit IEEE-compatible doubles.
  #
  # The typical usage would be something like:
  # |[<!-- language="C" -->
  #   char buf[G_ASCII_DTOSTR_BUF_SIZE];
  #
  #   fprintf (out, "value=%s\n", g_ascii_dtostr (buf, sizeof (buf), value));
  # ]|
  ASCII_DTOSTR_BUF_SIZE = 39
  # Specifies one of the possible types of byte order.
  # See %G_BYTE_ORDER.
  BIG_ENDIAN = 4321
  # The set of uppercase ASCII alphabet characters.
  # Used for specifying valid identifier characters
  # in #GScannerConfig.
  CSET_A_2_Z = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  # The set of ASCII digits.
  # Used for specifying valid identifier characters
  # in #GScannerConfig.
  CSET_DIGITS = "0123456789"
  # The set of lowercase ASCII alphabet characters.
  # Used for specifying valid identifier characters
  # in #GScannerConfig.
  CSET_a_2_z = "abcdefghijklmnopqrstuvwxyz"
  # A bitmask that restricts the possible flags passed to
  # g_datalist_set_flags(). Passing a flags value where
  # flags & ~G_DATALIST_FLAGS_MASK != 0 is an error.
  DATALIST_FLAGS_MASK = 3
  # Represents an invalid #GDateDay.
  DATE_BAD_DAY = 0
  # Represents an invalid Julian day number.
  DATE_BAD_JULIAN = 0
  # Represents an invalid year.
  DATE_BAD_YEAR = 0
  # The directory separator character.
  # This is '/' on UNIX machines and '\' under Windows.
  DIR_SEPARATOR = 47
  # The directory separator as a string.
  # This is "/" on UNIX machines and "\" under Windows.
  DIR_SEPARATOR_S = "/"
  # The base of natural logarithms.
  E = 2.718282
  # This is the platform dependent conversion specifier for scanning and
  # printing values of type #gint16. It is a string literal, but doesn't
  # include the percent-sign, such that you can add precision and length
  # modifiers between percent-sign and conversion specifier.
  #
  # |[<!-- language="C" -->
  # gint16 in;
  # gint32 out;
  # sscanf ("42", "%" G_GINT16_FORMAT, &in)
  # out = in * 1000;
  # g_print ("%" G_GINT32_FORMAT, out);
  # ]|
  GINT16_FORMAT = "hi"
  # The platform dependent length modifier for conversion specifiers
  # for scanning and printing values of type #gint16 or #guint16. It
  # is a string literal, but doesn't include the percent-sign, such
  # that you can add precision and length modifiers between percent-sign
  # and conversion specifier and append a conversion specifier.
  #
  # The following example prints "0x7b";
  # |[<!-- language="C" -->
  # gint16 value = 123;
  # g_print ("%#" G_GINT16_MODIFIER "x", value);
  # ]|
  GINT16_MODIFIER = "h"
  # This is the platform dependent conversion specifier for scanning
  # and printing values of type #gint32. See also %G_GINT16_FORMAT.
  GINT32_FORMAT = "i"
  # The platform dependent length modifier for conversion specifiers
  # for scanning and printing values of type #gint32 or #guint32. It
  # is a string literal. See also %G_GINT16_MODIFIER.
  GINT32_MODIFIER = ""
  # This is the platform dependent conversion specifier for scanning
  # and printing values of type #gint64. See also %G_GINT16_FORMAT.
  #
  # Some platforms do not support scanning and printing 64-bit integers,
  # even though the types are supported. On such platforms %G_GINT64_FORMAT
  # is not defined. Note that scanf() may not support 64-bit integers, even
  # if %G_GINT64_FORMAT is defined. Due to its weak error handling, scanf()
  # is not recommended for parsing anyway; consider using g_ascii_strtoull()
  # instead.
  GINT64_FORMAT = "li"
  # The platform dependent length modifier for conversion specifiers
  # for scanning and printing values of type #gint64 or #guint64.
  # It is a string literal.
  #
  # Some platforms do not support printing 64-bit integers, even
  # though the types are supported. On such platforms %G_GINT64_MODIFIER
  # is not defined.
  GINT64_MODIFIER = "l"
  # This is the platform dependent conversion specifier for scanning
  # and printing values of type #gintptr.
  GINTPTR_FORMAT = "li"
  # The platform dependent length modifier for conversion specifiers
  # for scanning and printing values of type #gintptr or #guintptr.
  # It is a string literal.
  GINTPTR_MODIFIER = "l"
  # Expands to "" on all modern compilers, and to  __FUNCTION__ on gcc
  # version 2.x. Don't use it.
  GNUC_FUNCTION = ""
  # Expands to "" on all modern compilers, and to __PRETTY_FUNCTION__
  # on gcc version 2.x. Don't use it.
  GNUC_PRETTY_FUNCTION = ""
  # This is the platform dependent conversion specifier for scanning
  # and printing values of type #gsize. See also %G_GINT16_FORMAT.
  GSIZE_FORMAT = "lu"
  # The platform dependent length modifier for conversion specifiers
  # for scanning and printing values of type #gsize. It
  # is a string literal.
  GSIZE_MODIFIER = "l"
  # This is the platform dependent conversion specifier for scanning
  # and printing values of type #gssize. See also %G_GINT16_FORMAT.
  GSSIZE_FORMAT = "li"
  # The platform dependent length modifier for conversion specifiers
  # for scanning and printing values of type #gssize. It
  # is a string literal.
  GSSIZE_MODIFIER = "l"
  # This is the platform dependent conversion specifier for scanning
  # and printing values of type #guint16. See also %G_GINT16_FORMAT
  GUINT16_FORMAT = "hu"
  # This is the platform dependent conversion specifier for scanning
  # and printing values of type #guint32. See also %G_GINT16_FORMAT.
  GUINT32_FORMAT = "u"
  # This is the platform dependent conversion specifier for scanning
  # and printing values of type #guint64. See also %G_GINT16_FORMAT.
  #
  # Some platforms do not support scanning and printing 64-bit integers,
  # even though the types are supported. On such platforms %G_GUINT64_FORMAT
  # is not defined.  Note that scanf() may not support 64-bit integers, even
  # if %G_GINT64_FORMAT is defined. Due to its weak error handling, scanf()
  # is not recommended for parsing anyway; consider using g_ascii_strtoull()
  # instead.
  GUINT64_FORMAT = "lu"
  # This is the platform dependent conversion specifier
  # for scanning and printing values of type #guintptr.
  GUINTPTR_FORMAT   = "lu"
  HAVE_GINT64       = 1
  HAVE_GNUC_VARARGS = 1
  # Defined to 1 if gcc-style visibility handling is supported.
  HAVE_GNUC_VISIBILITY = 1
  HAVE_GROWING_STACK   = 0
  HAVE_ISO_VARARGS     = 1
  # The position of the first bit which is not reserved for internal
  # use be the #GHook implementation, i.e.
  # `1 << G_HOOK_FLAG_USER_SHIFT` is the first
  # bit which can be used for application-defined flags.
  HOOK_FLAG_USER_SHIFT = 4
  # The bias by which exponents in double-precision floats are offset.
  IEEE754_DOUBLE_BIAS = 1023
  # The bias by which exponents in single-precision floats are offset.
  IEEE754_FLOAT_BIAS = 127
  # The name of the main group of a desktop entry file, as defined in the
  # [Desktop Entry Specification](http://freedesktop.org/Standards/desktop-entry-spec).
  # Consult the specification for more
  # details about the meanings of the keys below.
  KEY_FILE_DESKTOP_GROUP = "Desktop Entry"
  # A key under %G_KEY_FILE_DESKTOP_GROUP, whose value is a string list
  # giving the available application actions.
  KEY_FILE_DESKTOP_KEY_ACTIONS = "Actions"
  # A key under %G_KEY_FILE_DESKTOP_GROUP, whose value is a list
  # of strings giving the categories in which the desktop entry
  # should be shown in a menu.
  KEY_FILE_DESKTOP_KEY_CATEGORIES = "Categories"
  # A key under %G_KEY_FILE_DESKTOP_GROUP, whose value is a localized
  # string giving the tooltip for the desktop entry.
  KEY_FILE_DESKTOP_KEY_COMMENT = "Comment"
  # A key under %G_KEY_FILE_DESKTOP_GROUP, whose value is a boolean
  # set to true if the application is D-Bus activatable.
  KEY_FILE_DESKTOP_KEY_DBUS_ACTIVATABLE = "DBusActivatable"
  # A key under %G_KEY_FILE_DESKTOP_GROUP, whose value is a string
  # giving the command line to execute. It is only valid for desktop
  # entries with the `Application` type.
  KEY_FILE_DESKTOP_KEY_EXEC = "Exec"
  # A key under %G_KEY_FILE_DESKTOP_GROUP, whose value is a localized
  # string giving the generic name of the desktop entry.
  KEY_FILE_DESKTOP_KEY_GENERIC_NAME   = "GenericName"
  KEY_FILE_DESKTOP_KEY_GETTEXT_DOMAIN = "X-SUSE-Gettext-Domain"
  # A key under %G_KEY_FILE_DESKTOP_GROUP, whose value is a boolean
  # stating whether the desktop entry has been deleted by the user.
  KEY_FILE_DESKTOP_KEY_HIDDEN = "Hidden"
  # A key under %G_KEY_FILE_DESKTOP_GROUP, whose value is a localized
  # string giving the name of the icon to be displayed for the desktop
  # entry.
  KEY_FILE_DESKTOP_KEY_ICON = "Icon"
  # A key under %G_KEY_FILE_DESKTOP_GROUP, whose value is a list
  # of strings giving the MIME types supported by this desktop entry.
  KEY_FILE_DESKTOP_KEY_MIME_TYPE = "MimeType"
  # A key under %G_KEY_FILE_DESKTOP_GROUP, whose value is a localized
  # string giving the specific name of the desktop entry.
  KEY_FILE_DESKTOP_KEY_NAME = "Name"
  # A key under %G_KEY_FILE_DESKTOP_GROUP, whose value is a list of
  # strings identifying the environments that should not display the
  # desktop entry.
  KEY_FILE_DESKTOP_KEY_NOT_SHOW_IN = "NotShowIn"
  # A key under %G_KEY_FILE_DESKTOP_GROUP, whose value is a boolean
  # stating whether the desktop entry should be shown in menus.
  KEY_FILE_DESKTOP_KEY_NO_DISPLAY = "NoDisplay"
  # A key under %G_KEY_FILE_DESKTOP_GROUP, whose value is a list of
  # strings identifying the environments that should display the
  # desktop entry.
  KEY_FILE_DESKTOP_KEY_ONLY_SHOW_IN = "OnlyShowIn"
  # A key under %G_KEY_FILE_DESKTOP_GROUP, whose value is a string
  # containing the working directory to run the program in. It is only
  # valid for desktop entries with the `Application` type.
  KEY_FILE_DESKTOP_KEY_PATH = "Path"
  # A key under %G_KEY_FILE_DESKTOP_GROUP, whose value is a boolean
  # stating whether the application supports the
  # [Startup Notification Protocol Specification](http://www.freedesktop.org/Standards/startup-notification-spec).
  KEY_FILE_DESKTOP_KEY_STARTUP_NOTIFY = "StartupNotify"
  # A key under %G_KEY_FILE_DESKTOP_GROUP, whose value is string
  # identifying the WM class or name hint of a window that the application
  # will create, which can be used to emulate Startup Notification with
  # older applications.
  KEY_FILE_DESKTOP_KEY_STARTUP_WM_CLASS = "StartupWMClass"
  # A key under %G_KEY_FILE_DESKTOP_GROUP, whose value is a boolean
  # stating whether the program should be run in a terminal window.
  #
  # It is only valid for desktop entries with the `Application` type.
  KEY_FILE_DESKTOP_KEY_TERMINAL = "Terminal"
  # A key under %G_KEY_FILE_DESKTOP_GROUP, whose value is a string
  # giving the file name of a binary on disk used to determine if the
  # program is actually installed. It is only valid for desktop entries
  # with the `Application` type.
  KEY_FILE_DESKTOP_KEY_TRY_EXEC = "TryExec"
  # A key under %G_KEY_FILE_DESKTOP_GROUP, whose value is a string
  # giving the type of the desktop entry.
  #
  # Usually %G_KEY_FILE_DESKTOP_TYPE_APPLICATION,
  # %G_KEY_FILE_DESKTOP_TYPE_LINK, or
  # %G_KEY_FILE_DESKTOP_TYPE_DIRECTORY.
  KEY_FILE_DESKTOP_KEY_TYPE = "Type"
  # A key under %G_KEY_FILE_DESKTOP_GROUP, whose value is a string
  # giving the URL to access. It is only valid for desktop entries
  # with the `Link` type.
  KEY_FILE_DESKTOP_KEY_URL = "URL"
  # A key under %G_KEY_FILE_DESKTOP_GROUP, whose value is a string
  # giving the version of the Desktop Entry Specification used for
  # the desktop entry file.
  KEY_FILE_DESKTOP_KEY_VERSION = "Version"
  # The value of the %G_KEY_FILE_DESKTOP_KEY_TYPE, key for desktop
  # entries representing applications.
  KEY_FILE_DESKTOP_TYPE_APPLICATION = "Application"
  # The value of the %G_KEY_FILE_DESKTOP_KEY_TYPE, key for desktop
  # entries representing directories.
  KEY_FILE_DESKTOP_TYPE_DIRECTORY = "Directory"
  # The value of the %G_KEY_FILE_DESKTOP_KEY_TYPE, key for desktop
  # entries representing links to documents.
  KEY_FILE_DESKTOP_TYPE_LINK = "Link"
  # Specifies one of the possible types of byte order.
  # See %G_BYTE_ORDER.
  LITTLE_ENDIAN = 1234
  # The natural logarithm of 10.
  LN10 = 2.302585
  # The natural logarithm of 2.
  LN2 = 0.693147
  # Multiplying the base 2 exponent by this number yields the base 10 exponent.
  LOG_2_BASE_10 = 0.30103
  # Defines the log domain. See [Log Domains](#log-domains).
  #
  # Libraries should define this so that any messages
  # which they log can be differentiated from messages from other
  # libraries and application code. But be careful not to define
  # it in any public header files.
  #
  # Log domains must be unique, and it is recommended that they are the
  # application or library name, optionally followed by a hyphen and a sub-domain
  # name. For example, `bloatpad` or `bloatpad-io`.
  #
  # If undefined, it defaults to the default %NULL (or `""`) log domain; this is
  # not advisable, as it cannot be filtered against using the `G_MESSAGES_DEBUG`
  # environment variable.
  #
  # For example, GTK+ uses this in its `Makefile.am`:
  # |[
  # AM_CPPFLAGS = -DG_LOG_DOMAIN=\"Gtk\"
  # ]|
  #
  # Applications can choose to leave it as the default %NULL (or `""`)
  # domain. However, defining the domain offers the same advantages as
  # above.
  LOG_DOMAIN = 0_i8
  # GLib log levels that are considered fatal by default.
  #
  # This is not used if structured logging is enabled; see
  # [Using Structured Logging][using-structured-logging].
  LOG_FATAL_MASK = 5
  # Log levels below 1<<G_LOG_LEVEL_USER_SHIFT are used by GLib.
  # Higher bits can be used for user-defined log levels.
  LOG_LEVEL_USER_SHIFT = 8
  # The major version number of the GLib library.
  #
  # Like #glib_major_version, but from the headers used at
  # application compile time, rather than from the library
  # linked against at application run time.
  MAJOR_VERSION = 2
  # The maximum value which can be held in a #gint16.
  MAXINT16 = 32767_i16
  # The maximum value which can be held in a #gint32.
  MAXINT32 = 2147483647
  # The maximum value which can be held in a #gint64.
  MAXINT64 = 9223372036854775807_i64
  # The maximum value which can be held in a #gint8.
  MAXINT8 = 127_i8
  # The maximum value which can be held in a #guint16.
  MAXUINT16 = 65535_u16
  # The maximum value which can be held in a #guint32.
  MAXUINT32 = 4294967295_u32
  # The maximum value which can be held in a #guint64.
  MAXUINT64 = 18446744073709551615_u64
  # The maximum value which can be held in a #guint8.
  MAXUINT8 = 255_u8
  # The micro version number of the GLib library.
  #
  # Like #gtk_micro_version, but from the headers used at
  # application compile time, rather than from the library
  # linked against at application run time.
  MICRO_VERSION = 5
  # The minimum value which can be held in a #gint16.
  MININT16 = -32768_i16
  # The minimum value which can be held in a #gint32.
  MININT32 = -2147483648
  # The minimum value which can be held in a #gint64.
  MININT64 = -9223372036854775808_i64
  # The minimum value which can be held in a #gint8.
  MININT8 = -128_i8
  # The minor version number of the GLib library.
  #
  # Like #gtk_minor_version, but from the headers used at
  # application compile time, rather than from the library
  # linked against at application run time.
  MINOR_VERSION = 70
  MODULE_SUFFIX = "so"
  # If a long option in the main group has this name, it is not treated as a
  # regular option. Instead it collects all non-option arguments which would
  # otherwise be left in `argv`. The option must be of type
  # %G_OPTION_ARG_CALLBACK, %G_OPTION_ARG_STRING_ARRAY
  # or %G_OPTION_ARG_FILENAME_ARRAY.
  #
  #
  # Using #G_OPTION_REMAINING instead of simply scanning `argv`
  # for leftover arguments has the advantage that GOption takes care of
  # necessary encoding conversions for strings or filenames.
  OPTION_REMAINING = ""
  # Specifies one of the possible types of byte order
  # (currently unused). See %G_BYTE_ORDER.
  PDP_ENDIAN = 3412
  # The value of pi (ratio of circle's circumference to its diameter).
  PI = 3.141593
  # A format specifier that can be used in printf()-style format strings
  # when printing a #GPid.
  PID_FORMAT = "i"
  # Pi divided by 2.
  PI_2 = 1.570796
  # Pi divided by 4.
  PI_4 = 0.785398
  # A format specifier that can be used in printf()-style format strings
  # when printing the @fd member of a #GPollFD.
  POLLFD_FORMAT = "%d"
  # Use this for default priority event sources.
  #
  # In GLib this priority is used when adding timeout functions
  # with g_timeout_add(). In GDK this priority is used for events
  # from the X server.
  PRIORITY_DEFAULT = 0
  # Use this for default priority idle functions.
  #
  # In GLib this priority is used when adding idle functions with
  # g_idle_add().
  PRIORITY_DEFAULT_IDLE = 200
  # Use this for high priority event sources.
  #
  # It is not used within GLib or GTK+.
  PRIORITY_HIGH = -100
  # Use this for high priority idle functions.
  #
  # GTK+ uses #G_PRIORITY_HIGH_IDLE + 10 for resizing operations,
  # and #G_PRIORITY_HIGH_IDLE + 20 for redrawing operations. (This is
  # done to ensure that any pending resizes are processed before any
  # pending redraws, so that widgets are not redrawn twice unnecessarily.)
  PRIORITY_HIGH_IDLE = 100
  # Use this for very low priority background tasks.
  #
  # It is not used within GLib or GTK+.
  PRIORITY_LOW = 300
  # The search path separator character.
  # This is ':' on UNIX machines and ';' under Windows.
  SEARCHPATH_SEPARATOR = 58
  # The search path separator as a string.
  # This is ":" on UNIX machines and ";" under Windows.
  SEARCHPATH_SEPARATOR_S = ":"
  SIZEOF_LONG            = 8
  SIZEOF_SIZE_T          = 8
  SIZEOF_SSIZE_T         = 8
  SIZEOF_VOID_P          = 8
  # Use this macro as the return value of a #GSourceFunc to leave
  # the #GSource in the main loop.
  SOURCE_CONTINUE = true
  # Use this macro as the return value of a #GSourceFunc to remove
  # the #GSource from the main loop.
  SOURCE_REMOVE = true
  # The square root of two.
  SQRT2 = 1.414214
  # The standard delimiters, used in g_strdelimit().
  STR_DELIMITERS       = "_-|> <."
  SYSDEF_AF_INET       =  2
  SYSDEF_AF_INET6      = 10
  SYSDEF_AF_UNIX       =  1
  SYSDEF_MSG_DONTROUTE =  4
  SYSDEF_MSG_OOB       =  1
  SYSDEF_MSG_PEEK      =  2
  # Creates a unique temporary directory for each unit test and uses
  # g_set_user_dirs() to set XDG directories to point into subdirectories of it
  # for the duration of the unit test. The directory tree is cleaned up after the
  # test finishes successfully. Note that this doesn’t take effect until
  # g_test_run() is called, so calls to (for example) g_get_user_home_dir() will
  # return the system-wide value when made in a test program’s main() function.
  #
  # The following functions will return subdirectories of the temporary directory
  # when this option is used. The specific subdirectory paths in use are not
  # guaranteed to be stable API — always use a getter function to retrieve them.
  #
  #  - g_get_home_dir()
  #  - g_get_user_cache_dir()
  #  - g_get_system_config_dirs()
  #  - g_get_user_config_dir()
  #  - g_get_system_data_dirs()
  #  - g_get_user_data_dir()
  #  - g_get_user_runtime_dir()
  #
  # The subdirectories may not be created by the test harness; as with normal
  # calls to functions like g_get_user_cache_dir(), the caller must be prepared
  # to create the directory if it doesn’t exist.
  TEST_OPTION_ISOLATE_DIRS = "isolate_dirs"
  # Evaluates to a time span of one day.
  TIME_SPAN_DAY = 86400000000_i64
  # Evaluates to a time span of one hour.
  TIME_SPAN_HOUR = 3600000000_i64
  # Evaluates to a time span of one millisecond.
  TIME_SPAN_MILLISECOND = 1000_i64
  # Evaluates to a time span of one minute.
  TIME_SPAN_MINUTE = 60000000_i64
  # Evaluates to a time span of one second.
  TIME_SPAN_SECOND = 1000000_i64
  # The maximum length (in codepoints) of a compatibility or canonical
  # decomposition of a single Unicode character.
  #
  # This is as defined by Unicode 6.1.
  UNICHAR_MAX_DECOMPOSITION_LENGTH = 18
  # Generic delimiters characters as defined in
  # [RFC 3986](https://tools.ietf.org/html/rfc3986). Includes `:/?#[]@`.
  URI_RESERVED_CHARS_GENERIC_DELIMITERS = ":/?#[]@"
  # Subcomponent delimiter characters as defined in
  # [RFC 3986](https://tools.ietf.org/html/rfc3986). Includes `!$&'()*+,;=`.
  URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS = "!$&'()*+,;="
  # Number of microseconds in one second (1 million).
  # This macro is provided for code readability.
  USEC_PER_SEC     = 1000000
  VA_COPY_AS_ARRAY =       1
  # A macro that should be defined by the user prior to including
  # the glib.h header.
  # The definition should be one of the predefined GLib version
  # macros: %GLIB_VERSION_2_26, %GLIB_VERSION_2_28,...
  #
  # This macro defines the earliest version of GLib that the package is
  # required to be able to compile against.
  #
  # If the compiler is configured to warn about the use of deprecated
  # functions, then using functions that were deprecated in version
  # %GLIB_VERSION_MIN_REQUIRED or earlier will cause warnings (but
  # using functions deprecated in later releases will not).
  VERSION_MIN_REQUIRED =        2
  WIN32_MSG_HANDLE     = 19981206
  macro__has_attribute___noreturn__ = 0

  # Base class for all errors in this module.
  class GLibError < RuntimeError
    # :nodoc:
    def initialize(error : Pointer(LibGLib::Error))
      message_ptr = error.value.message
      super(String.new(message_ptr)) unless message_ptr.null?
      LibGLib.g_error_free(error)
    end
  end

  # Enums

  # The hashing algorithm to be used by #GChecksum when performing the
  # digest of some data.
  #
  # Note that the #GChecksumType enumeration may be extended at a later
  # date to include new hashing algorithm types.
  enum ChecksumType : UInt32
    # Use the MD5 hashing algorithm
    Md5 = 0
    # Use the SHA-1 hashing algorithm
    Sha1 = 1
    # Use the SHA-256 hashing algorithm
    Sha256 = 2
    # Use the SHA-512 hashing algorithm (Since: 2.36)
    Sha512 = 3
    # Use the SHA-384 hashing algorithm (Since: 2.51)
    Sha384 = 4
  end

  # This enumeration isn't used in the API, but may be useful if you need
  # to mark a number as a day, month, or year.
  enum DateDMY : UInt32
    # a day
    Day = 0
    # a month
    Month = 1
    # a year
    Year = 2
  end

  # Enumeration representing a month; values are %G_DATE_JANUARY,
  # %G_DATE_FEBRUARY, etc. %G_DATE_BAD_MONTH is the invalid value.
  enum DateMonth : UInt32
    # invalid value
    BadMonth = 0
    # January
    January = 1
    # February
    February = 2
    # March
    March = 3
    # April
    April = 4
    # May
    May = 5
    # June
    June = 6
    # July
    July = 7
    # August
    August = 8
    # September
    September = 9
    # October
    October = 10
    # November
    November = 11
    # December
    December = 12
  end

  # Enumeration representing a day of the week; %G_DATE_MONDAY,
  # %G_DATE_TUESDAY, etc. %G_DATE_BAD_WEEKDAY is an invalid weekday.
  enum DateWeekday : UInt32
    # invalid value
    BadWeekday = 0
    # Monday
    Monday = 1
    # Tuesday
    Tuesday = 2
    # Wednesday
    Wednesday = 3
    # Thursday
    Thursday = 4
    # Friday
    Friday = 5
    # Saturday
    Saturday = 6
    # Sunday
    Sunday = 7
  end

  # The possible errors, used in the @v_error field
  # of #GTokenValue, when the token is a %G_TOKEN_ERROR.
  enum ErrorType : UInt32
    # unknown error
    Unknown = 0
    # unexpected end of file
    UnexpEof = 1
    # unterminated string constant
    UnexpEofInString = 2
    # unterminated comment
    UnexpEofInComment = 3
    # non-digit character in a number
    NonDigitInConst = 4
    # digit beyond radix in a number
    DigitRadix = 5
    # non-decimal floating point number
    FloatRadix = 6
    # malformed floating point number
    FloatMalformed = 7
  end

  # #GIOError is only used by the deprecated functions
  # g_io_channel_read(), g_io_channel_write(), and g_io_channel_seek().
  enum IOError : UInt32
    # no error
    None = 0
    # an EAGAIN error occurred
    Again = 1
    # an EINVAL error occurred
    Inval = 2
    # another error occurred
    Unknown = 3
  end

  # Statuses returned by most of the #GIOFuncs functions.
  enum IOStatus : UInt32
    # An error occurred.
    Error = 0
    # Success.
    Normal = 1
    # End of file.
    Eof = 2
    # Resource temporarily unavailable.
    Again = 3
  end

  # Return values from #GLogWriterFuncs to indicate whether the given log entry
  # was successfully handled by the writer, or whether there was an error in
  # handling it (and hence a fallback writer should be used).
  #
  # If a #GLogWriterFunc ignores a log entry, it should return
  # %G_LOG_WRITER_HANDLED.
  enum LogWriterOutput : UInt32
    # Log writer has handled the log entry.
    Handled = 1
    # Log writer could not handle the log entry.
    Unhandled = 0
  end

  # Defines how a Unicode string is transformed in a canonical
  # form, standardizing such issues as whether a character with
  # an accent is represented as a base character and combining
  # accent or as a single precomposed character. Unicode strings
  # should generally be normalized before comparing them.
  enum NormalizeMode : UInt32
    # standardize differences that do not affect the
    #     text content, such as the above-mentioned accent representation
    Default = 0
    # another name for %G_NORMALIZE_DEFAULT
    Nfd = 0
    # like %G_NORMALIZE_DEFAULT, but with
    #     composed forms rather than a maximally decomposed form
    DefaultCompose = 1
    # another name for %G_NORMALIZE_DEFAULT_COMPOSE
    Nfc = 1
    # beyond %G_NORMALIZE_DEFAULT also standardize the
    #     "compatibility" characters in Unicode, such as SUPERSCRIPT THREE
    #     to the standard forms (in this case DIGIT THREE). Formatting
    #     information may be lost but for most text operations such
    #     characters should be considered the same
    All = 2
    # another name for %G_NORMALIZE_ALL
    Nfkd = 2
    # like %G_NORMALIZE_ALL, but with composed
    #     forms rather than a maximally decomposed form
    AllCompose = 3
    # another name for %G_NORMALIZE_ALL_COMPOSE
    Nfkc = 3
  end

  # The possible statuses of a one-time initialization function
  # controlled by a #GOnce struct.
  enum OnceStatus : UInt32
    # the function has not been called yet.
    Notcalled = 0
    # the function call is currently in progress.
    Progress = 1
    # the function has been called.
    Ready = 2
  end

  # The #GOptionArg enum values determine which type of extra argument the
  # options expect to find. If an option expects an extra argument, it can
  # be specified in several ways; with a short option: `-x arg`, with a long
  # option: `--name arg` or combined in a single argument: `--name=arg`.
  enum OptionArg : UInt32
    # No extra argument. This is useful for simple flags.
    None = 0
    # The option takes a UTF-8 string argument.
    String = 1
    # The option takes an integer argument.
    Int = 2
    # The option provides a callback (of type
    #     #GOptionArgFunc) to parse the extra argument.
    Callback = 3
    # The option takes a filename as argument, which will
    #        be in the GLib filename encoding rather than UTF-8.
    Filename = 4
    # The option takes a string argument, multiple
    #     uses of the option are collected into an array of strings.
    StringArray = 5
    # The option takes a filename as argument,
    #     multiple uses of the option are collected into an array of strings.
    FilenameArray = 6
    # The option takes a double argument. The argument
    #     can be formatted either for the user's locale or for the "C" locale.
    #     Since 2.12
    Double = 7
    # The option takes a 64-bit integer. Like
    #     %G_OPTION_ARG_INT but for larger numbers. The number can be in
    #     decimal base, or in hexadecimal (when prefixed with `0x`, for
    #     example, `0xffffffff`). Since 2.12
    Int64 = 8
  end

  # An enumeration specifying the base position for a
  # g_io_channel_seek_position() operation.
  enum SeekType : UInt32
    # the current position in the file.
    Cur = 0
    # the start of the file.
    Set = 1
    # the end of the file.
    End = 2
  end

  enum SliceConfig : UInt32
    AlwaysMalloc      = 1
    BypassMagazines   = 2
    WorkingSetMsecs   = 3
    ColorIncrement    = 4
    ChunkSizes        = 5
    ContentionCounter = 6
  end

  # The type of file to return the filename for, when used with
  # g_test_build_filename().
  #
  # These two options correspond rather directly to the 'dist' and
  # 'built' terminology that automake uses and are explicitly used to
  # distinguish between the 'srcdir' and 'builddir' being separate.  All
  # files in your project should either be dist (in the
  # `EXTRA_DIST` or `dist_schema_DATA`
  # sense, in which case they will always be in the srcdir) or built (in
  # the `BUILT_SOURCES` sense, in which case they will
  # always be in the builddir).
  #
  # Note: as a general rule of automake, files that are generated only as
  # part of the build-from-git process (but then are distributed with the
  # tarball) always go in srcdir (even if doing a srcdir != builddir
  # build from git) and are considered as distributed files.
  enum TestFileType : UInt32
    # a file that was included in the distribution tarball
    Dist = 0
    # a file that was built on the compiling machine
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

  # Disambiguates a given time in two ways.
  #
  # First, specifies if the given time is in universal or local time.
  #
  # Second, if the time is in local time, specifies if it is local
  # standard time or local daylight time.  This is important for the case
  # where the same local time occurs twice (during daylight savings time
  # transitions, for example).
  enum TimeType : UInt32
    # the time is in local standard time
    Standard = 0
    # the time is in local daylight time
    Daylight = 1
    # the time is in UTC
    Universal = 2
  end

  # The possible types of token returned from each
  # g_scanner_get_next_token() call.
  enum TokenType : UInt32
    # the end of the file
    Eof = 0
    # a '(' character
    LeftParen = 40
    # a ')' character
    RightParen = 41
    # a '{' character
    LeftCurly = 123
    # a '}' character
    RightCurly = 125
    # a '[' character
    LeftBrace = 91
    # a ']' character
    RightBrace = 93
    # a '=' character
    EqualSign = 61
    # a ',' character
    Comma = 44
    # not a token
    None = 256
    # an error occurred
    Error = 257
    # a character
    Char = 258
    # a binary integer
    Binary = 259
    # an octal integer
    Octal = 260
    # an integer
    Int = 261
    # a hex integer
    Hex = 262
    # a floating point number
    Float = 263
    # a string
    String = 264
    # a symbol
    Symbol = 265
    # an identifier
    Identifier = 266
    # a null identifier
    IdentifierNull = 267
    # one line comment
    CommentSingle = 268
    # multi line comment
    CommentMulti = 269
  end

  # Specifies the type of traversal performed by g_tree_traverse(),
  # g_node_traverse() and g_node_find(). The different orders are
  # illustrated here:
  # - In order: A, B, C, D, E, F, G, H, I
  #   ![](Sorted_binary_tree_inorder.svg)
  # - Pre order: F, B, A, D, C, E, G, I, H
  #   ![](Sorted_binary_tree_preorder.svg)
  # - Post order: A, C, E, D, B, H, I, G, F
  #   ![](Sorted_binary_tree_postorder.svg)
  # - Level order: F, B, G, A, D, I, C, E, H
  #   ![](Sorted_binary_tree_breadth-first_traversal.svg)
  enum TraverseType : UInt32
    # vists a node's left child first, then the node itself,
    #              then its right child. This is the one to use if you
    #              want the output sorted according to the compare
    #              function.
    InOrder = 0
    # visits a node, then its children.
    PreOrder = 1
    # visits the node's children, then the node itself.
    PostOrder = 2
    # is not implemented for
    #              [balanced binary trees][glib-Balanced-Binary-Trees].
    #              For [n-ary trees][glib-N-ary-Trees], it
    #              vists the root node first, then its children, then
    #              its grandchildren, and so on. Note that this is less
    #              efficient than the other orders.
    LevelOrder = 3
  end

  # These are the possible line break classifications.
  #
  # Since new unicode versions may add new types here, applications should be ready
  # to handle unknown values. They may be regarded as %G_UNICODE_BREAK_UNKNOWN.
  #
  # See [Unicode Line Breaking Algorithm](http://www.unicode.org/unicode/reports/tr14/).
  enum UnicodeBreakType : UInt32
    # Mandatory Break (BK)
    Mandatory = 0
    # Carriage Return (CR)
    CarriageReturn = 1
    # Line Feed (LF)
    LineFeed = 2
    # Attached Characters and Combining Marks (CM)
    CombiningMark = 3
    # Surrogates (SG)
    Surrogate = 4
    # Zero Width Space (ZW)
    ZeroWidthSpace = 5
    # Inseparable (IN)
    Inseparable = 6
    # Non-breaking ("Glue") (GL)
    NonBreakingGlue = 7
    # Contingent Break Opportunity (CB)
    Contingent = 8
    # Space (SP)
    Space = 9
    # Break Opportunity After (BA)
    After = 10
    # Break Opportunity Before (BB)
    Before = 11
    # Break Opportunity Before and After (B2)
    BeforeAndAfter = 12
    # Hyphen (HY)
    Hyphen = 13
    # Nonstarter (NS)
    NonStarter = 14
    # Opening Punctuation (OP)
    OpenPunctuation = 15
    # Closing Punctuation (CL)
    ClosePunctuation = 16
    # Ambiguous Quotation (QU)
    Quotation = 17
    # Exclamation/Interrogation (EX)
    Exclamation = 18
    # Ideographic (ID)
    Ideographic = 19
    # Numeric (NU)
    Numeric = 20
    # Infix Separator (Numeric) (IS)
    InfixSeparator = 21
    # Symbols Allowing Break After (SY)
    Symbol = 22
    # Ordinary Alphabetic and Symbol Characters (AL)
    Alphabetic = 23
    # Prefix (Numeric) (PR)
    Prefix = 24
    # Postfix (Numeric) (PO)
    Postfix = 25
    # Complex Content Dependent (South East Asian) (SA)
    ComplexContext = 26
    # Ambiguous (Alphabetic or Ideographic) (AI)
    Ambiguous = 27
    # Unknown (XX)
    Unknown = 28
    # Next Line (NL)
    NextLine = 29
    # Word Joiner (WJ)
    WordJoiner = 30
    # Hangul L Jamo (JL)
    HangulLJamo = 31
    # Hangul V Jamo (JV)
    HangulVJamo = 32
    # Hangul T Jamo (JT)
    HangulTJamo = 33
    # Hangul LV Syllable (H2)
    HangulLvSyllable = 34
    # Hangul LVT Syllable (H3)
    HangulLvtSyllable = 35
    # Closing Parenthesis (CP). Since 2.28. Deprecated: 2.70: Use %G_UNICODE_BREAK_CLOSE_PARENTHESIS instead.
    CloseParanthesis = 36
    # Closing Parenthesis (CP). Since 2.70
    CloseParenthesis = 36
    # Conditional Japanese Starter (CJ). Since: 2.32
    ConditionalJapaneseStarter = 37
    # Hebrew Letter (HL). Since: 2.32
    HebrewLetter = 38
    # Regional Indicator (RI). Since: 2.36
    RegionalIndicator = 39
    # Emoji Base (EB). Since: 2.50
    EmojiBase = 40
    # Emoji Modifier (EM). Since: 2.50
    EmojiModifier = 41
    # Zero Width Joiner (ZWJ). Since: 2.50
    ZeroWidthJoiner = 42
  end

  # The #GUnicodeScript enumeration identifies different writing
  # systems. The values correspond to the names as defined in the
  # Unicode standard. The enumeration has been added in GLib 2.14,
  # and is interchangeable with #PangoScript.
  #
  # Note that new types may be added in the future. Applications
  # should be ready to handle unknown values.
  # See [Unicode Standard Annex #24: Script names](http://www.unicode.org/reports/tr24/).
  enum UnicodeScript : Int32
    # a value never returned from g_unichar_get_script()
    InvalidCode = -1
    # a character used by multiple different scripts
    Common = 0
    # a mark glyph that takes its script from the
    #                               base glyph to which it is attached
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
    # New Tai Lue
    NewTaiLue = 54
    # Buginese
    Buginese = 55
    # Glagolitic
    Glagolitic = 56
    # Tifinagh
    Tifinagh = 57
    # Syloti Nagri
    SylotiNagri = 58
    # Old Persian
    OldPersian = 59
    # Kharoshthi
    Kharoshthi = 60
    # an unassigned code point
    Unknown = 61
    # Balinese
    Balinese = 62
    # Cuneiform
    Cuneiform = 63
    # Phoenician
    Phoenician = 64
    # Phags-pa
    PhagsPa = 65
    # N'Ko
    Nko = 66
    # Kayah Li. Since 2.16.3
    KayahLi = 67
    # Lepcha. Since 2.16.3
    Lepcha = 68
    # Rejang. Since 2.16.3
    Rejang = 69
    # Sundanese. Since 2.16.3
    Sundanese = 70
    # Saurashtra. Since 2.16.3
    Saurashtra = 71
    # Cham. Since 2.16.3
    Cham = 72
    # Ol Chiki. Since 2.16.3
    OlChiki = 73
    # Vai. Since 2.16.3
    Vai = 74
    # Carian. Since 2.16.3
    Carian = 75
    # Lycian. Since 2.16.3
    Lycian = 76
    # Lydian. Since 2.16.3
    Lydian = 77
    # Avestan. Since 2.26
    Avestan = 78
    # Bamum. Since 2.26
    Bamum = 79
    # Egyptian Hieroglpyhs. Since 2.26
    EgyptianHieroglyphs = 80
    # Imperial Aramaic. Since 2.26
    ImperialAramaic = 81
    # Inscriptional Pahlavi. Since 2.26
    InscriptionalPahlavi = 82
    # Inscriptional Parthian. Since 2.26
    InscriptionalParthian = 83
    # Javanese. Since 2.26
    Javanese = 84
    # Kaithi. Since 2.26
    Kaithi = 85
    # Lisu. Since 2.26
    Lisu = 86
    # Meetei Mayek. Since 2.26
    MeeteiMayek = 87
    # Old South Arabian. Since 2.26
    OldSouthArabian = 88
    # Old Turkic. Since 2.28
    OldTurkic = 89
    # Samaritan. Since 2.26
    Samaritan = 90
    # Tai Tham. Since 2.26
    TaiTham = 91
    # Tai Viet. Since 2.26
    TaiViet = 92
    # Batak. Since 2.28
    Batak = 93
    # Brahmi. Since 2.28
    Brahmi = 94
    # Mandaic. Since 2.28
    Mandaic = 95
    # Chakma. Since: 2.32
    Chakma = 96
    # Meroitic Cursive. Since: 2.32
    MeroiticCursive = 97
    # Meroitic Hieroglyphs. Since: 2.32
    MeroiticHieroglyphs = 98
    # Miao. Since: 2.32
    Miao = 99
    # Sharada. Since: 2.32
    Sharada = 100
    # Sora Sompeng. Since: 2.32
    SoraSompeng = 101
    # Takri. Since: 2.32
    Takri = 102
    # Bassa. Since: 2.42
    BassaVah = 103
    # Caucasian Albanian. Since: 2.42
    CaucasianAlbanian = 104
    # Duployan. Since: 2.42
    Duployan = 105
    # Elbasan. Since: 2.42
    Elbasan = 106
    # Grantha. Since: 2.42
    Grantha = 107
    # Kjohki. Since: 2.42
    Khojki = 108
    # Khudawadi, Sindhi. Since: 2.42
    Khudawadi = 109
    # Linear A. Since: 2.42
    LinearA = 110
    # Mahajani. Since: 2.42
    Mahajani = 111
    # Manichaean. Since: 2.42
    Manichaean = 112
    # Mende Kikakui. Since: 2.42
    MendeKikakui = 113
    # Modi. Since: 2.42
    Modi = 114
    # Mro. Since: 2.42
    Mro = 115
    # Nabataean. Since: 2.42
    Nabataean = 116
    # Old North Arabian. Since: 2.42
    OldNorthArabian = 117
    # Old Permic. Since: 2.42
    OldPermic = 118
    # Pahawh Hmong. Since: 2.42
    PahawhHmong = 119
    # Palmyrene. Since: 2.42
    Palmyrene = 120
    # Pau Cin Hau. Since: 2.42
    PauCinHau = 121
    # Psalter Pahlavi. Since: 2.42
    PsalterPahlavi = 122
    # Siddham. Since: 2.42
    Siddham = 123
    # Tirhuta. Since: 2.42
    Tirhuta = 124
    # Warang Citi. Since: 2.42
    WarangCiti = 125
    # Ahom. Since: 2.48
    Ahom = 126
    # Anatolian Hieroglyphs. Since: 2.48
    AnatolianHieroglyphs = 127
    # Hatran. Since: 2.48
    Hatran = 128
    # Multani. Since: 2.48
    Multani = 129
    # Old Hungarian. Since: 2.48
    OldHungarian = 130
    # Signwriting. Since: 2.48
    Signwriting = 131
    # Adlam. Since: 2.50
    Adlam = 132
    # Bhaiksuki. Since: 2.50
    Bhaiksuki = 133
    # Marchen. Since: 2.50
    Marchen = 134
    # Newa. Since: 2.50
    Newa = 135
    # Osage. Since: 2.50
    Osage = 136
    # Tangut. Since: 2.50
    Tangut = 137
    # Masaram Gondi. Since: 2.54
    MasaramGondi = 138
    # Nushu. Since: 2.54
    Nushu = 139
    # Soyombo. Since: 2.54
    Soyombo = 140
    # Zanabazar Square. Since: 2.54
    ZanabazarSquare = 141
    # Dogra. Since: 2.58
    Dogra = 142
    # Gunjala Gondi. Since: 2.58
    GunjalaGondi = 143
    # Hanifi Rohingya. Since: 2.58
    HanifiRohingya = 144
    # Makasar. Since: 2.58
    Makasar = 145
    # Medefaidrin. Since: 2.58
    Medefaidrin = 146
    # Old Sogdian. Since: 2.58
    OldSogdian = 147
    # Sogdian. Since: 2.58
    Sogdian = 148
    # Elym. Since: 2.62
    Elymaic = 149
    # Nand. Since: 2.62
    Nandinagari = 150
    # Rohg. Since: 2.62
    NyiakengPuachueHmong = 151
    # Wcho. Since: 2.62
    Wancho = 152
    # Chorasmian. Since: 2.66
    Chorasmian = 153
    # Dives Akuru. Since: 2.66
    DivesAkuru = 154
    # Khitan small script. Since: 2.66
    KhitanSmallScript = 155
    # Yezidi. Since: 2.66
    Yezidi = 156
  end

  # These are the possible character classifications from the
  # Unicode specification.
  # See [Unicode Character Database](http://www.unicode.org/reports/tr44/#General_Category_Values).
  enum UnicodeType : UInt32
    # General category "Other, Control" (Cc)
    Control = 0
    # General category "Other, Format" (Cf)
    Format = 1
    # General category "Other, Not Assigned" (Cn)
    Unassigned = 2
    # General category "Other, Private Use" (Co)
    PrivateUse = 3
    # General category "Other, Surrogate" (Cs)
    Surrogate = 4
    # General category "Letter, Lowercase" (Ll)
    LowercaseLetter = 5
    # General category "Letter, Modifier" (Lm)
    ModifierLetter = 6
    # General category "Letter, Other" (Lo)
    OtherLetter = 7
    # General category "Letter, Titlecase" (Lt)
    TitlecaseLetter = 8
    # General category "Letter, Uppercase" (Lu)
    UppercaseLetter = 9
    # General category "Mark, Spacing" (Mc)
    SpacingMark = 10
    # General category "Mark, Enclosing" (Me)
    EnclosingMark = 11
    # General category "Mark, Nonspacing" (Mn)
    NonSpacingMark = 12
    # General category "Number, Decimal Digit" (Nd)
    DecimalNumber = 13
    # General category "Number, Letter" (Nl)
    LetterNumber = 14
    # General category "Number, Other" (No)
    OtherNumber = 15
    # General category "Punctuation, Connector" (Pc)
    ConnectPunctuation = 16
    # General category "Punctuation, Dash" (Pd)
    DashPunctuation = 17
    # General category "Punctuation, Close" (Pe)
    ClosePunctuation = 18
    # General category "Punctuation, Final quote" (Pf)
    FinalPunctuation = 19
    # General category "Punctuation, Initial quote" (Pi)
    InitialPunctuation = 20
    # General category "Punctuation, Other" (Po)
    OtherPunctuation = 21
    # General category "Punctuation, Open" (Ps)
    OpenPunctuation = 22
    # General category "Symbol, Currency" (Sc)
    CurrencySymbol = 23
    # General category "Symbol, Modifier" (Sk)
    ModifierSymbol = 24
    # General category "Symbol, Math" (Sm)
    MathSymbol = 25
    # General category "Symbol, Other" (So)
    OtherSymbol = 26
    # General category "Separator, Line" (Zl)
    LineSeparator = 27
    # General category "Separator, Paragraph" (Zp)
    ParagraphSeparator = 28
    # General category "Separator, Space" (Zs)
    SpaceSeparator = 29
  end

  # These are logical ids for special directories which are defined
  # depending on the platform used. You should use g_get_user_special_dir()
  # to retrieve the full path associated to the logical id.
  #
  # The #GUserDirectory enumeration can be extended at later date. Not
  # every platform has a directory for every logical id in this
  # enumeration.
  enum UserDirectory : UInt32
    # the user's Desktop directory
    DirectoryDesktop = 0
    # the user's Documents directory
    DirectoryDocuments = 1
    # the user's Downloads directory
    DirectoryDownload = 2
    # the user's Music directory
    DirectoryMusic = 3
    # the user's Pictures directory
    DirectoryPictures = 4
    # the user's shared directory
    DirectoryPublicShare = 5
    # the user's Templates directory
    DirectoryTemplates = 6
    # the user's Movies directory
    DirectoryVideos = 7
    # the number of enum values
    NDirectories = 8
  end

  # The range of possible top-level types of #GVariant instances.
  enum VariantClass : UInt32
    # The #GVariant is a boolean.
    Boolean = 98
    # The #GVariant is a byte.
    Byte = 121
    # The #GVariant is a signed 16 bit integer.
    Int16 = 110
    # The #GVariant is an unsigned 16 bit integer.
    Uint16 = 113
    # The #GVariant is a signed 32 bit integer.
    Int32 = 105
    # The #GVariant is an unsigned 32 bit integer.
    Uint32 = 117
    # The #GVariant is a signed 64 bit integer.
    Int64 = 120
    # The #GVariant is an unsigned 64 bit integer.
    Uint64 = 116
    # The #GVariant is a file handle index.
    Handle = 104
    # The #GVariant is a double precision floating
    #                          point value.
    Double = 100
    # The #GVariant is a normal string.
    String = 115
    # The #GVariant is a D-Bus object path
    #                               string.
    ObjectPath = 111
    # The #GVariant is a D-Bus signature string.
    Signature = 103
    # The #GVariant is a variant.
    Variant = 118
    # The #GVariant is a maybe-typed value.
    Maybe = 109
    # The #GVariant is an array.
    Array = 97
    # The #GVariant is a tuple.
    Tuple = 40
    # The #GVariant is a dictionary entry.
    DictEntry = 123
  end

  # Flags
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

  def self.bit_nth_lsf(mask : UInt64, nth_bit : Int32) : Int32
    # g_bit_nth_lsf: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGLib.g_bit_nth_lsf(mask, nth_bit)

    # Return value handling

    _retval
  end

  def self.bit_nth_msf(mask : UInt64, nth_bit : Int32) : Int32
    # g_bit_nth_msf: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGLib.g_bit_nth_msf(mask, nth_bit)

    # Return value handling

    _retval
  end

  def self.bit_storage(number : UInt64) : UInt32
    # g_bit_storage: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGLib.g_bit_storage(number)

    # Return value handling

    _retval
  end

  def self.check_version(required_major : UInt32, required_minor : UInt32, required_micro : UInt32) : ::String?
    # glib_check_version: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGLib.glib_check_version(required_major, required_minor, required_micro)

    # Return value handling

    ::String.new(_retval) unless _retval.null?
  end

  def self.format_size_for_display(size : Int64) : ::String
    # g_format_size_for_display: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGLib.g_format_size_for_display(size)

    # Return value handling

    GICrystal.transfer_full(_retval)
  end

  def self.application_name : ::String?
    # g_get_application_name: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGLib.g_get_application_name

    # Return value handling

    ::String.new(_retval) unless _retval.null?
  end

  def self.os_info(key_name : ::String) : ::String?
    # g_get_os_info: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGLib.g_get_os_info(key_name)

    # Return value handling

    GICrystal.transfer_full(_retval) unless _retval.null?
  end

  def self.prgname : ::String?
    # g_get_prgname: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGLib.g_get_prgname

    # Return value handling

    ::String.new(_retval) unless _retval.null?
  end

  def self.system_config_dirs : Enumerable(::String)
    # g_get_system_config_dirs: (None)
    # Returns: (transfer none) (array zero-terminated=1 element-type Filename)

    # C call
    _retval = LibGLib.g_get_system_config_dirs

    # Return value handling

    GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
  end

  def self.system_data_dirs : Enumerable(::String)
    # g_get_system_data_dirs: (None)
    # Returns: (transfer none) (array zero-terminated=1 element-type Filename)

    # C call
    _retval = LibGLib.g_get_system_data_dirs

    # Return value handling

    GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
  end

  def self.user_cache_dir : ::Path
    # g_get_user_cache_dir: (None)
    # Returns: (transfer none Filename)

    # C call
    _retval = LibGLib.g_get_user_cache_dir

    # Return value handling

    ::Path.new(::String.new(_retval))
  end

  def self.user_config_dir : ::Path
    # g_get_user_config_dir: (None)
    # Returns: (transfer none Filename)

    # C call
    _retval = LibGLib.g_get_user_config_dir

    # Return value handling

    ::Path.new(::String.new(_retval))
  end

  def self.user_data_dir : ::Path
    # g_get_user_data_dir: (None)
    # Returns: (transfer none Filename)

    # C call
    _retval = LibGLib.g_get_user_data_dir

    # Return value handling

    ::Path.new(::String.new(_retval))
  end

  def self.user_runtime_dir : ::Path
    # g_get_user_runtime_dir: (None)
    # Returns: (transfer none Filename)

    # C call
    _retval = LibGLib.g_get_user_runtime_dir

    # Return value handling

    ::Path.new(::String.new(_retval))
  end

  def self.user_special_dir(directory : GLib::UserDirectory) : ::Path?
    # g_get_user_special_dir: (None)
    # Returns: (transfer none Filename)

    # C call
    _retval = LibGLib.g_get_user_special_dir(directory)

    # Return value handling

    ::Path.new(::String.new(_retval)) unless _retval.null?
  end

  def self.idle_remove_by_data(data : Pointer(Void)?) : Bool
    # g_idle_remove_by_data: (None)
    # @data: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    data = if data.nil?
             Pointer(Void).null
           else
             data.to_unsafe
           end

    # C call
    _retval = LibGLib.g_idle_remove_by_data(data)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.idle_source_new : GLib::Source
    # g_idle_source_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGLib.g_idle_source_new

    # Return value handling

    GLib::Source.new(_retval, GICrystal::Transfer::Full)
  end

  def self.main_context_default : GLib::MainContext
    # g_main_context_default: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGLib.g_main_context_default

    # Return value handling

    GLib::MainContext.new(_retval, GICrystal::Transfer::None)
  end

  def self.main_context_get_thread_default : GLib::MainContext?
    # g_main_context_get_thread_default: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGLib.g_main_context_get_thread_default

    # Return value handling

    GLib::MainContext.new(_retval, GICrystal::Transfer::None) unless _retval.null?
  end

  def self.main_context_ref_thread_default : GLib::MainContext
    # g_main_context_ref_thread_default: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGLib.g_main_context_ref_thread_default

    # Return value handling

    GLib::MainContext.new(_retval, GICrystal::Transfer::Full)
  end

  def self.main_current_source : GLib::Source?
    # g_main_current_source: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGLib.g_main_current_source

    # Return value handling

    GLib::Source.new(_retval, GICrystal::Transfer::None) unless _retval.null?
  end

  def self.main_depth : Int32
    # g_main_depth: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGLib.g_main_depth

    # Return value handling

    _retval
  end

  def self.markup_escape_text(text : ::String, length : Int64) : ::String
    # g_markup_escape_text: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGLib.g_markup_escape_text(text, length)

    # Return value handling

    GICrystal.transfer_full(_retval)
  end

  def self.on_error_query(prg_name : ::String) : Nil
    # g_on_error_query: (None)
    # Returns: (transfer none)

    # C call
    LibGLib.g_on_error_query(prg_name)

    # Return value handling
  end

  def self.on_error_stack_trace(prg_name : ::String) : Nil
    # g_on_error_stack_trace: (None)
    # Returns: (transfer none)

    # C call
    LibGLib.g_on_error_stack_trace(prg_name)

    # Return value handling
  end

  def self.quark_from_string(string : ::String?) : UInt32
    # g_quark_from_string: (None)
    # @string: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    string = if string.nil?
               Pointer(LibC::Char).null
             else
               string.to_unsafe
             end

    # C call
    _retval = LibGLib.g_quark_from_string(string)

    # Return value handling

    _retval
  end

  def self.quark_to_string(quark : UInt32) : ::String
    # g_quark_to_string: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGLib.g_quark_to_string(quark)

    # Return value handling

    ::String.new(_retval)
  end

  def self.quark_try_string(string : ::String?) : UInt32
    # g_quark_try_string: (None)
    # @string: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    string = if string.nil?
               Pointer(LibC::Char).null
             else
               string.to_unsafe
             end

    # C call
    _retval = LibGLib.g_quark_try_string(string)

    # Return value handling

    _retval
  end

  def self.reload_user_special_dirs_cache : Nil
    # g_reload_user_special_dirs_cache: (None)
    # Returns: (transfer none)

    # C call
    LibGLib.g_reload_user_special_dirs_cache

    # Return value handling
  end

  def self.application_name=(application_name : ::String) : Nil
    # g_set_application_name: (None)
    # Returns: (transfer none)

    # C call
    LibGLib.g_set_application_name(application_name)

    # Return value handling
  end

  def self.prgname=(prgname : ::String) : Nil
    # g_set_prgname: (None)
    # Returns: (transfer none)

    # C call
    LibGLib.g_set_prgname(prgname)

    # Return value handling
  end

  def self.source_remove(tag : UInt32) : Bool
    # g_source_remove: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGLib.g_source_remove(tag)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.source_set_name_by_id(tag : UInt32, name : ::String) : Nil
    # g_source_set_name_by_id: (None)
    # Returns: (transfer none)

    # C call
    LibGLib.g_source_set_name_by_id(tag, name)

    # Return value handling
  end

  def self.spaced_primes_closest(num : UInt32) : UInt32
    # g_spaced_primes_closest: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGLib.g_spaced_primes_closest(num)

    # Return value handling

    _retval
  end

  def self.timeout_source_new(interval : UInt32) : GLib::Source
    # g_timeout_source_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGLib.g_timeout_source_new(interval)

    # Return value handling

    GLib::Source.new(_retval, GICrystal::Transfer::Full)
  end

  def self.timeout_source_new_seconds(interval : UInt32) : GLib::Source
    # g_timeout_source_new_seconds: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGLib.g_timeout_source_new_seconds(interval)

    # Return value handling

    GLib::Source.new(_retval, GICrystal::Transfer::Full)
  end

  def self.variant_get_gtype : UInt64
    # g_variant_get_gtype: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGLib.g_variant_get_gtype

    # Return value handling

    _retval
  end

  def self.variant_is_object_path(string : ::String) : Bool
    # g_variant_is_object_path: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGLib.g_variant_is_object_path(string)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.variant_is_signature(string : ::String) : Bool
    # g_variant_is_signature: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGLib.g_variant_is_signature(string)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def variant_parse(type : GLib::VariantType?, text : ::String, limit : ::String?, endptr : ::String?) : GLib::Variant
    # g_variant_parse: (Throws)
    # @type: (nullable)
    # @limit: (nullable)
    # @endptr: (nullable)
    # Returns: (transfer full)

    _error = Pointer(LibGLib::Error).null

    # Generator::NullableArrayPlan
    type = if type.nil?
             Pointer(Void).null
           else
             type.to_unsafe
           end

    # Generator::NullableArrayPlan
    limit = if limit.nil?
              Pointer(LibC::Char).null
            else
              limit.to_unsafe
            end

    # Generator::NullableArrayPlan
    endptr = if endptr.nil?
               Pointer(LibC::Char).null
             else
               endptr.to_unsafe
             end

    # C call
    _retval = LibGLib.g_variant_parse(type, text, limit, endptr, pointerof(_error))

    # Error check
    GLib.raise_exception(_error) unless _error.null?

    # Return value handling

    GLib::Variant.new(_retval, GICrystal::Transfer::Full)
  end

  def self.variant_parse_error_print_context(error : GLib::Error, source_str : ::String) : ::String
    # g_variant_parse_error_print_context: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGLib.g_variant_parse_error_print_context(error, source_str)

    # Return value handling

    GICrystal.transfer_full(_retval)
  end

  def self.variant_parse_error_quark : UInt32
    # g_variant_parse_error_quark: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGLib.g_variant_parse_error_quark

    # Return value handling

    _retval
  end

  def self.variant_parser_get_error_quark : UInt32
    # g_variant_parser_get_error_quark: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGLib.g_variant_parser_get_error_quark

    # Return value handling

    _retval
  end

  def self.variant_type_checked_(arg0 : ::String) : GLib::VariantType
    # g_variant_type_checked_: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGLib.g_variant_type_checked_(arg0)

    # Return value handling

    GLib::VariantType.new(_retval, GICrystal::Transfer::None)
  end

  def self.variant_type_string_get_depth_(type_string : ::String) : UInt64
    # g_variant_type_string_get_depth_: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGLib.g_variant_type_string_get_depth_(type_string)

    # Return value handling

    _retval
  end

  def self.variant_type_string_is_valid(type_string : ::String) : Bool
    # g_variant_type_string_is_valid: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGLib.g_variant_type_string_is_valid(type_string)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.variant_type_string_scan(string : ::String, limit : ::String?) : Bool
    # g_variant_type_string_scan: (None)
    # @limit: (nullable)
    # @endptr: (out) (transfer full) (optional)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    limit = if limit.nil?
              Pointer(LibC::Char).null
            else
              limit.to_unsafe
            end

    # Generator::OutArgUsedInReturnPlan
    endptr = Pointer(Pointer(LibC::Char)).null

    # C call
    _retval = LibGLib.g_variant_type_string_scan(string, limit, endptr)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  # Errors

  # Error codes returned by bookmark file parsing.
  class BookmarkFileError < GLibError
    class InvalidUri < BookmarkFileError
      def code : Int32
        0
      end
    end

    class InvalidValue < BookmarkFileError
      def code : Int32
        1
      end
    end

    class AppNotRegistered < BookmarkFileError
      def code : Int32
        2
      end
    end

    class UriNotFound < BookmarkFileError
      def code : Int32
        3
      end
    end

    class Read < BookmarkFileError
      def code : Int32
        4
      end
    end

    class UnknownEncoding < BookmarkFileError
      def code : Int32
        5
      end
    end

    class Write < BookmarkFileError
      def code : Int32
        6
      end
    end

    class FileNotFound < BookmarkFileError
      def code : Int32
        7
      end
    end
  end

  # Error codes returned by character set conversion routines.
  class ConvertError < GLibError
    class NoConversion < ConvertError
      def code : Int32
        0
      end
    end

    class IllegalSequence < ConvertError
      def code : Int32
        1
      end
    end

    class Failed < ConvertError
      def code : Int32
        2
      end
    end

    class PartialInput < ConvertError
      def code : Int32
        3
      end
    end

    class BadUri < ConvertError
      def code : Int32
        4
      end
    end

    class NotAbsolutePath < ConvertError
      def code : Int32
        5
      end
    end

    class NoMemory < ConvertError
      def code : Int32
        6
      end
    end

    class EmbeddedNul < ConvertError
      def code : Int32
        7
      end
    end
  end

  # Values corresponding to @errno codes returned from file operations
  # on UNIX. Unlike @errno codes, GFileError values are available on
  # all systems, even Windows. The exact meaning of each code depends
  # on what sort of file operation you were performing; the UNIX
  # documentation gives more details. The following error code descriptions
  # come from the GNU C Library manual, and are under the copyright
  # of that manual.
  #
  # It's not very portable to make detailed assumptions about exactly
  # which errors will be returned from a given operation. Some errors
  # don't occur on some systems, etc., sometimes there are subtle
  # differences in when a system will report a given error, etc.
  class FileError < GLibError
    class Exist < FileError
      def code : Int32
        0
      end
    end

    class Isdir < FileError
      def code : Int32
        1
      end
    end

    class Acces < FileError
      def code : Int32
        2
      end
    end

    class Nametoolong < FileError
      def code : Int32
        3
      end
    end

    class Noent < FileError
      def code : Int32
        4
      end
    end

    class Notdir < FileError
      def code : Int32
        5
      end
    end

    class Nxio < FileError
      def code : Int32
        6
      end
    end

    class Nodev < FileError
      def code : Int32
        7
      end
    end

    class Rofs < FileError
      def code : Int32
        8
      end
    end

    class Txtbsy < FileError
      def code : Int32
        9
      end
    end

    class Fault < FileError
      def code : Int32
        10
      end
    end

    class Loop < FileError
      def code : Int32
        11
      end
    end

    class Nospc < FileError
      def code : Int32
        12
      end
    end

    class Nomem < FileError
      def code : Int32
        13
      end
    end

    class Mfile < FileError
      def code : Int32
        14
      end
    end

    class Nfile < FileError
      def code : Int32
        15
      end
    end

    class Badf < FileError
      def code : Int32
        16
      end
    end

    class Inval < FileError
      def code : Int32
        17
      end
    end

    class Pipe < FileError
      def code : Int32
        18
      end
    end

    class Again < FileError
      def code : Int32
        19
      end
    end

    class Intr < FileError
      def code : Int32
        20
      end
    end

    class Io < FileError
      def code : Int32
        21
      end
    end

    class Perm < FileError
      def code : Int32
        22
      end
    end

    class Nosys < FileError
      def code : Int32
        23
      end
    end

    class Failed < FileError
      def code : Int32
        24
      end
    end
  end

  # Error codes returned by #GIOChannel operations.
  class IOChannelError < GLibError
    class Fbig < IOChannelError
      def code : Int32
        0
      end
    end

    class Inval < IOChannelError
      def code : Int32
        1
      end
    end

    class Io < IOChannelError
      def code : Int32
        2
      end
    end

    class Isdir < IOChannelError
      def code : Int32
        3
      end
    end

    class Nospc < IOChannelError
      def code : Int32
        4
      end
    end

    class Nxio < IOChannelError
      def code : Int32
        5
      end
    end

    class Overflow < IOChannelError
      def code : Int32
        6
      end
    end

    class Pipe < IOChannelError
      def code : Int32
        7
      end
    end

    class Failed < IOChannelError
      def code : Int32
        8
      end
    end
  end

  # Error codes returned by key file parsing.
  class KeyFileError < GLibError
    class UnknownEncoding < KeyFileError
      def code : Int32
        0
      end
    end

    class Parse < KeyFileError
      def code : Int32
        1
      end
    end

    class NotFound < KeyFileError
      def code : Int32
        2
      end
    end

    class KeyNotFound < KeyFileError
      def code : Int32
        3
      end
    end

    class GroupNotFound < KeyFileError
      def code : Int32
        4
      end
    end

    class InvalidValue < KeyFileError
      def code : Int32
        5
      end
    end
  end

  # Error codes returned by markup parsing.
  class MarkupError < GLibError
    class BadUtf8 < MarkupError
      def code : Int32
        0
      end
    end

    class Empty < MarkupError
      def code : Int32
        1
      end
    end

    class Parse < MarkupError
      def code : Int32
        2
      end
    end

    class UnknownElement < MarkupError
      def code : Int32
        3
      end
    end

    class UnknownAttribute < MarkupError
      def code : Int32
        4
      end
    end

    class InvalidContent < MarkupError
      def code : Int32
        5
      end
    end

    class MissingAttribute < MarkupError
      def code : Int32
        6
      end
    end
  end

  # Error codes returned by functions converting a string to a number.
  class NumberParserError < GLibError
    class Invalid < NumberParserError
      def code : Int32
        0
      end
    end

    class OutOfBounds < NumberParserError
      def code : Int32
        1
      end
    end
  end

  # Error codes returned by option parsing.
  class OptionError < GLibError
    class UnknownOption < OptionError
      def code : Int32
        0
      end
    end

    class BadValue < OptionError
      def code : Int32
        1
      end
    end

    class Failed < OptionError
      def code : Int32
        2
      end
    end
  end

  # Error codes returned by regular expressions functions.
  class RegexError < GLibError
    class Compile < RegexError
      def code : Int32
        0
      end
    end

    class Optimize < RegexError
      def code : Int32
        1
      end
    end

    class Replace < RegexError
      def code : Int32
        2
      end
    end

    class Match < RegexError
      def code : Int32
        3
      end
    end

    class Internal < RegexError
      def code : Int32
        4
      end
    end

    class StrayBackslash < RegexError
      def code : Int32
        101
      end
    end

    class MissingControlChar < RegexError
      def code : Int32
        102
      end
    end

    class UnrecognizedEscape < RegexError
      def code : Int32
        103
      end
    end

    class QuantifiersOutOfOrder < RegexError
      def code : Int32
        104
      end
    end

    class QuantifierTooBig < RegexError
      def code : Int32
        105
      end
    end

    class UnterminatedCharacterClass < RegexError
      def code : Int32
        106
      end
    end

    class InvalidEscapeInCharacterClass < RegexError
      def code : Int32
        107
      end
    end

    class RangeOutOfOrder < RegexError
      def code : Int32
        108
      end
    end

    class NothingToRepeat < RegexError
      def code : Int32
        109
      end
    end

    class UnrecognizedCharacter < RegexError
      def code : Int32
        112
      end
    end

    class PosixNamedClassOutsideClass < RegexError
      def code : Int32
        113
      end
    end

    class UnmatchedParenthesis < RegexError
      def code : Int32
        114
      end
    end

    class InexistentSubpatternReference < RegexError
      def code : Int32
        115
      end
    end

    class UnterminatedComment < RegexError
      def code : Int32
        118
      end
    end

    class ExpressionTooLarge < RegexError
      def code : Int32
        120
      end
    end

    class MemoryError < RegexError
      def code : Int32
        121
      end
    end

    class VariableLengthLookbehind < RegexError
      def code : Int32
        125
      end
    end

    class MalformedCondition < RegexError
      def code : Int32
        126
      end
    end

    class TooManyConditionalBranches < RegexError
      def code : Int32
        127
      end
    end

    class AssertionExpected < RegexError
      def code : Int32
        128
      end
    end

    class UnknownPosixClassName < RegexError
      def code : Int32
        130
      end
    end

    class PosixCollatingElementsNotSupported < RegexError
      def code : Int32
        131
      end
    end

    class HexCodeTooLarge < RegexError
      def code : Int32
        134
      end
    end

    class InvalidCondition < RegexError
      def code : Int32
        135
      end
    end

    class SingleByteMatchInLookbehind < RegexError
      def code : Int32
        136
      end
    end

    class InfiniteLoop < RegexError
      def code : Int32
        140
      end
    end

    class MissingSubpatternNameTerminator < RegexError
      def code : Int32
        142
      end
    end

    class DuplicateSubpatternName < RegexError
      def code : Int32
        143
      end
    end

    class MalformedProperty < RegexError
      def code : Int32
        146
      end
    end

    class UnknownProperty < RegexError
      def code : Int32
        147
      end
    end

    class SubpatternNameTooLong < RegexError
      def code : Int32
        148
      end
    end

    class TooManySubpatterns < RegexError
      def code : Int32
        149
      end
    end

    class InvalidOctalValue < RegexError
      def code : Int32
        151
      end
    end

    class TooManyBranchesInDefine < RegexError
      def code : Int32
        154
      end
    end

    class DefineRepetion < RegexError
      def code : Int32
        155
      end
    end

    class InconsistentNewlineOptions < RegexError
      def code : Int32
        156
      end
    end

    class MissingBackReference < RegexError
      def code : Int32
        157
      end
    end

    class InvalidRelativeReference < RegexError
      def code : Int32
        158
      end
    end

    class BacktrackingControlVerbArgumentForbidden < RegexError
      def code : Int32
        159
      end
    end

    class UnknownBacktrackingControlVerb < RegexError
      def code : Int32
        160
      end
    end

    class NumberTooBig < RegexError
      def code : Int32
        161
      end
    end

    class MissingSubpatternName < RegexError
      def code : Int32
        162
      end
    end

    class MissingDigit < RegexError
      def code : Int32
        163
      end
    end

    class InvalidDataCharacter < RegexError
      def code : Int32
        164
      end
    end

    class ExtraSubpatternName < RegexError
      def code : Int32
        165
      end
    end

    class BacktrackingControlVerbArgumentRequired < RegexError
      def code : Int32
        166
      end
    end

    class InvalidControlChar < RegexError
      def code : Int32
        168
      end
    end

    class MissingName < RegexError
      def code : Int32
        169
      end
    end

    class NotSupportedInClass < RegexError
      def code : Int32
        171
      end
    end

    class TooManyForwardReferences < RegexError
      def code : Int32
        172
      end
    end

    class NameTooLong < RegexError
      def code : Int32
        175
      end
    end

    class CharacterValueTooLarge < RegexError
      def code : Int32
        176
      end
    end
  end

  # Error codes returned by shell functions.
  class ShellError < GLibError
    class BadQuoting < ShellError
      def code : Int32
        0
      end
    end

    class EmptyString < ShellError
      def code : Int32
        1
      end
    end

    class Failed < ShellError
      def code : Int32
        2
      end
    end
  end

  # Error codes returned by spawning processes.
  class SpawnError < GLibError
    class Fork < SpawnError
      def code : Int32
        0
      end
    end

    class Read < SpawnError
      def code : Int32
        1
      end
    end

    class Chdir < SpawnError
      def code : Int32
        2
      end
    end

    class Acces < SpawnError
      def code : Int32
        3
      end
    end

    class Perm < SpawnError
      def code : Int32
        4
      end
    end

    class TooBig < SpawnError
      def code : Int32
        5
      end
    end

    class G2big < SpawnError
      def code : Int32
        5
      end
    end

    class Noexec < SpawnError
      def code : Int32
        6
      end
    end

    class Nametoolong < SpawnError
      def code : Int32
        7
      end
    end

    class Noent < SpawnError
      def code : Int32
        8
      end
    end

    class Nomem < SpawnError
      def code : Int32
        9
      end
    end

    class Notdir < SpawnError
      def code : Int32
        10
      end
    end

    class Loop < SpawnError
      def code : Int32
        11
      end
    end

    class Txtbusy < SpawnError
      def code : Int32
        12
      end
    end

    class Io < SpawnError
      def code : Int32
        13
      end
    end

    class Nfile < SpawnError
      def code : Int32
        14
      end
    end

    class Mfile < SpawnError
      def code : Int32
        15
      end
    end

    class Inval < SpawnError
      def code : Int32
        16
      end
    end

    class Isdir < SpawnError
      def code : Int32
        17
      end
    end

    class Libbad < SpawnError
      def code : Int32
        18
      end
    end

    class Failed < SpawnError
      def code : Int32
        19
      end
    end
  end

  # Possible errors of thread related functions.
  class ThreadError < GLibError
    class ThreadErrorAgain < ThreadError
      def code : Int32
        0
      end
    end
  end

  # Error codes returned by #GUri methods.
  class UriError < GLibError
    class Failed < UriError
      def code : Int32
        0
      end
    end

    class BadScheme < UriError
      def code : Int32
        1
      end
    end

    class BadUser < UriError
      def code : Int32
        2
      end
    end

    class BadPassword < UriError
      def code : Int32
        3
      end
    end

    class BadAuthParams < UriError
      def code : Int32
        4
      end
    end

    class BadHost < UriError
      def code : Int32
        5
      end
    end

    class BadPort < UriError
      def code : Int32
        6
      end
    end

    class BadPath < UriError
      def code : Int32
        7
      end
    end

    class BadQuery < UriError
      def code : Int32
        8
      end
    end

    class BadFragment < UriError
      def code : Int32
        9
      end
    end
  end

  # Error codes returned by parsing text-format GVariants.
  class VariantParseError < GLibError
    class Failed < VariantParseError
      def code : Int32
        0
      end
    end

    class BasicTypeExpected < VariantParseError
      def code : Int32
        1
      end
    end

    class CannotInferType < VariantParseError
      def code : Int32
        2
      end
    end

    class DefiniteTypeExpected < VariantParseError
      def code : Int32
        3
      end
    end

    class InputNotAtEnd < VariantParseError
      def code : Int32
        4
      end
    end

    class InvalidCharacter < VariantParseError
      def code : Int32
        5
      end
    end

    class InvalidFormatString < VariantParseError
      def code : Int32
        6
      end
    end

    class InvalidObjectPath < VariantParseError
      def code : Int32
        7
      end
    end

    class InvalidSignature < VariantParseError
      def code : Int32
        8
      end
    end

    class InvalidTypeString < VariantParseError
      def code : Int32
        9
      end
    end

    class NoCommonType < VariantParseError
      def code : Int32
        10
      end
    end

    class NumberOutOfRange < VariantParseError
      def code : Int32
        11
      end
    end

    class NumberTooBig < VariantParseError
      def code : Int32
        12
      end
    end

    class TypeError < VariantParseError
      def code : Int32
        13
      end
    end

    class UnexpectedToken < VariantParseError
      def code : Int32
        14
      end
    end

    class UnknownKeyword < VariantParseError
      def code : Int32
        15
      end
    end

    class UnterminatedStringConstant < VariantParseError
      def code : Int32
        16
      end
    end

    class ValueExpected < VariantParseError
      def code : Int32
        17
      end
    end

    class Recursion < VariantParseError
      def code : Int32
        18
      end
    end
  end

  # :nodoc:
  def raise_exception(error : Pointer(LibGLib::Error))
    error_domain = error.value.domain
    error_code = error.value.code

    if error_domain == LibGLib.g_quark_try_string("g-bookmark-file-error-quark")
      raise BookmarkFileError::InvalidUri.new(error) if error_code == 0
      raise BookmarkFileError::InvalidValue.new(error) if error_code == 1
      raise BookmarkFileError::AppNotRegistered.new(error) if error_code == 2
      raise BookmarkFileError::UriNotFound.new(error) if error_code == 3
      raise BookmarkFileError::Read.new(error) if error_code == 4
      raise BookmarkFileError::UnknownEncoding.new(error) if error_code == 5
      raise BookmarkFileError::Write.new(error) if error_code == 6
      raise BookmarkFileError::FileNotFound.new(error) if error_code == 7
    end

    if error_domain == LibGLib.g_quark_try_string("g_convert_error")
      raise ConvertError::NoConversion.new(error) if error_code == 0
      raise ConvertError::IllegalSequence.new(error) if error_code == 1
      raise ConvertError::Failed.new(error) if error_code == 2
      raise ConvertError::PartialInput.new(error) if error_code == 3
      raise ConvertError::BadUri.new(error) if error_code == 4
      raise ConvertError::NotAbsolutePath.new(error) if error_code == 5
      raise ConvertError::NoMemory.new(error) if error_code == 6
      raise ConvertError::EmbeddedNul.new(error) if error_code == 7
    end

    if error_domain == LibGLib.g_quark_try_string("g-file-error-quark")
      raise FileError::Exist.new(error) if error_code == 0
      raise FileError::Isdir.new(error) if error_code == 1
      raise FileError::Acces.new(error) if error_code == 2
      raise FileError::Nametoolong.new(error) if error_code == 3
      raise FileError::Noent.new(error) if error_code == 4
      raise FileError::Notdir.new(error) if error_code == 5
      raise FileError::Nxio.new(error) if error_code == 6
      raise FileError::Nodev.new(error) if error_code == 7
      raise FileError::Rofs.new(error) if error_code == 8
      raise FileError::Txtbsy.new(error) if error_code == 9
      raise FileError::Fault.new(error) if error_code == 10
      raise FileError::Loop.new(error) if error_code == 11
      raise FileError::Nospc.new(error) if error_code == 12
      raise FileError::Nomem.new(error) if error_code == 13
      raise FileError::Mfile.new(error) if error_code == 14
      raise FileError::Nfile.new(error) if error_code == 15
      raise FileError::Badf.new(error) if error_code == 16
      raise FileError::Inval.new(error) if error_code == 17
      raise FileError::Pipe.new(error) if error_code == 18
      raise FileError::Again.new(error) if error_code == 19
      raise FileError::Intr.new(error) if error_code == 20
      raise FileError::Io.new(error) if error_code == 21
      raise FileError::Perm.new(error) if error_code == 22
      raise FileError::Nosys.new(error) if error_code == 23
      raise FileError::Failed.new(error) if error_code == 24
    end

    if error_domain == LibGLib.g_quark_try_string("g-io-channel-error-quark")
      raise IOChannelError::Fbig.new(error) if error_code == 0
      raise IOChannelError::Inval.new(error) if error_code == 1
      raise IOChannelError::Io.new(error) if error_code == 2
      raise IOChannelError::Isdir.new(error) if error_code == 3
      raise IOChannelError::Nospc.new(error) if error_code == 4
      raise IOChannelError::Nxio.new(error) if error_code == 5
      raise IOChannelError::Overflow.new(error) if error_code == 6
      raise IOChannelError::Pipe.new(error) if error_code == 7
      raise IOChannelError::Failed.new(error) if error_code == 8
    end

    if error_domain == LibGLib.g_quark_try_string("g-key-file-error-quark")
      raise KeyFileError::UnknownEncoding.new(error) if error_code == 0
      raise KeyFileError::Parse.new(error) if error_code == 1
      raise KeyFileError::NotFound.new(error) if error_code == 2
      raise KeyFileError::KeyNotFound.new(error) if error_code == 3
      raise KeyFileError::GroupNotFound.new(error) if error_code == 4
      raise KeyFileError::InvalidValue.new(error) if error_code == 5
    end

    if error_domain == LibGLib.g_quark_try_string("g-markup-error-quark")
      raise MarkupError::BadUtf8.new(error) if error_code == 0
      raise MarkupError::Empty.new(error) if error_code == 1
      raise MarkupError::Parse.new(error) if error_code == 2
      raise MarkupError::UnknownElement.new(error) if error_code == 3
      raise MarkupError::UnknownAttribute.new(error) if error_code == 4
      raise MarkupError::InvalidContent.new(error) if error_code == 5
      raise MarkupError::MissingAttribute.new(error) if error_code == 6
    end

    if error_domain == LibGLib.g_quark_try_string("g-number-parser-error-quark")
      raise NumberParserError::Invalid.new(error) if error_code == 0
      raise NumberParserError::OutOfBounds.new(error) if error_code == 1
    end

    if error_domain == LibGLib.g_quark_try_string("g-option-context-error-quark")
      raise OptionError::UnknownOption.new(error) if error_code == 0
      raise OptionError::BadValue.new(error) if error_code == 1
      raise OptionError::Failed.new(error) if error_code == 2
    end

    if error_domain == LibGLib.g_quark_try_string("g-regex-error-quark")
      raise RegexError::Compile.new(error) if error_code == 0
      raise RegexError::Optimize.new(error) if error_code == 1
      raise RegexError::Replace.new(error) if error_code == 2
      raise RegexError::Match.new(error) if error_code == 3
      raise RegexError::Internal.new(error) if error_code == 4
      raise RegexError::StrayBackslash.new(error) if error_code == 101
      raise RegexError::MissingControlChar.new(error) if error_code == 102
      raise RegexError::UnrecognizedEscape.new(error) if error_code == 103
      raise RegexError::QuantifiersOutOfOrder.new(error) if error_code == 104
      raise RegexError::QuantifierTooBig.new(error) if error_code == 105
      raise RegexError::UnterminatedCharacterClass.new(error) if error_code == 106
      raise RegexError::InvalidEscapeInCharacterClass.new(error) if error_code == 107
      raise RegexError::RangeOutOfOrder.new(error) if error_code == 108
      raise RegexError::NothingToRepeat.new(error) if error_code == 109
      raise RegexError::UnrecognizedCharacter.new(error) if error_code == 112
      raise RegexError::PosixNamedClassOutsideClass.new(error) if error_code == 113
      raise RegexError::UnmatchedParenthesis.new(error) if error_code == 114
      raise RegexError::InexistentSubpatternReference.new(error) if error_code == 115
      raise RegexError::UnterminatedComment.new(error) if error_code == 118
      raise RegexError::ExpressionTooLarge.new(error) if error_code == 120
      raise RegexError::MemoryError.new(error) if error_code == 121
      raise RegexError::VariableLengthLookbehind.new(error) if error_code == 125
      raise RegexError::MalformedCondition.new(error) if error_code == 126
      raise RegexError::TooManyConditionalBranches.new(error) if error_code == 127
      raise RegexError::AssertionExpected.new(error) if error_code == 128
      raise RegexError::UnknownPosixClassName.new(error) if error_code == 130
      raise RegexError::PosixCollatingElementsNotSupported.new(error) if error_code == 131
      raise RegexError::HexCodeTooLarge.new(error) if error_code == 134
      raise RegexError::InvalidCondition.new(error) if error_code == 135
      raise RegexError::SingleByteMatchInLookbehind.new(error) if error_code == 136
      raise RegexError::InfiniteLoop.new(error) if error_code == 140
      raise RegexError::MissingSubpatternNameTerminator.new(error) if error_code == 142
      raise RegexError::DuplicateSubpatternName.new(error) if error_code == 143
      raise RegexError::MalformedProperty.new(error) if error_code == 146
      raise RegexError::UnknownProperty.new(error) if error_code == 147
      raise RegexError::SubpatternNameTooLong.new(error) if error_code == 148
      raise RegexError::TooManySubpatterns.new(error) if error_code == 149
      raise RegexError::InvalidOctalValue.new(error) if error_code == 151
      raise RegexError::TooManyBranchesInDefine.new(error) if error_code == 154
      raise RegexError::DefineRepetion.new(error) if error_code == 155
      raise RegexError::InconsistentNewlineOptions.new(error) if error_code == 156
      raise RegexError::MissingBackReference.new(error) if error_code == 157
      raise RegexError::InvalidRelativeReference.new(error) if error_code == 158
      raise RegexError::BacktrackingControlVerbArgumentForbidden.new(error) if error_code == 159
      raise RegexError::UnknownBacktrackingControlVerb.new(error) if error_code == 160
      raise RegexError::NumberTooBig.new(error) if error_code == 161
      raise RegexError::MissingSubpatternName.new(error) if error_code == 162
      raise RegexError::MissingDigit.new(error) if error_code == 163
      raise RegexError::InvalidDataCharacter.new(error) if error_code == 164
      raise RegexError::ExtraSubpatternName.new(error) if error_code == 165
      raise RegexError::BacktrackingControlVerbArgumentRequired.new(error) if error_code == 166
      raise RegexError::InvalidControlChar.new(error) if error_code == 168
      raise RegexError::MissingName.new(error) if error_code == 169
      raise RegexError::NotSupportedInClass.new(error) if error_code == 171
      raise RegexError::TooManyForwardReferences.new(error) if error_code == 172
      raise RegexError::NameTooLong.new(error) if error_code == 175
      raise RegexError::CharacterValueTooLarge.new(error) if error_code == 176
    end

    if error_domain == LibGLib.g_quark_try_string("g-shell-error-quark")
      raise ShellError::BadQuoting.new(error) if error_code == 0
      raise ShellError::EmptyString.new(error) if error_code == 1
      raise ShellError::Failed.new(error) if error_code == 2
    end

    if error_domain == LibGLib.g_quark_try_string("g-exec-error-quark")
      raise SpawnError::Fork.new(error) if error_code == 0
      raise SpawnError::Read.new(error) if error_code == 1
      raise SpawnError::Chdir.new(error) if error_code == 2
      raise SpawnError::Acces.new(error) if error_code == 3
      raise SpawnError::Perm.new(error) if error_code == 4
      raise SpawnError::TooBig.new(error) if error_code == 5
      raise SpawnError::G2big.new(error) if error_code == 5
      raise SpawnError::Noexec.new(error) if error_code == 6
      raise SpawnError::Nametoolong.new(error) if error_code == 7
      raise SpawnError::Noent.new(error) if error_code == 8
      raise SpawnError::Nomem.new(error) if error_code == 9
      raise SpawnError::Notdir.new(error) if error_code == 10
      raise SpawnError::Loop.new(error) if error_code == 11
      raise SpawnError::Txtbusy.new(error) if error_code == 12
      raise SpawnError::Io.new(error) if error_code == 13
      raise SpawnError::Nfile.new(error) if error_code == 14
      raise SpawnError::Mfile.new(error) if error_code == 15
      raise SpawnError::Inval.new(error) if error_code == 16
      raise SpawnError::Isdir.new(error) if error_code == 17
      raise SpawnError::Libbad.new(error) if error_code == 18
      raise SpawnError::Failed.new(error) if error_code == 19
    end

    if error_domain == LibGLib.g_quark_try_string("g_thread_error")
      raise ThreadError::ThreadErrorAgain.new(error) if error_code == 0
    end

    if error_domain == LibGLib.g_quark_try_string("g-uri-quark")
      raise UriError::Failed.new(error) if error_code == 0
      raise UriError::BadScheme.new(error) if error_code == 1
      raise UriError::BadUser.new(error) if error_code == 2
      raise UriError::BadPassword.new(error) if error_code == 3
      raise UriError::BadAuthParams.new(error) if error_code == 4
      raise UriError::BadHost.new(error) if error_code == 5
      raise UriError::BadPort.new(error) if error_code == 6
      raise UriError::BadPath.new(error) if error_code == 7
      raise UriError::BadQuery.new(error) if error_code == 8
      raise UriError::BadFragment.new(error) if error_code == 9
    end

    if error_domain == LibGLib.g_quark_try_string("g-variant-parse-error-quark")
      raise VariantParseError::Failed.new(error) if error_code == 0
      raise VariantParseError::BasicTypeExpected.new(error) if error_code == 1
      raise VariantParseError::CannotInferType.new(error) if error_code == 2
      raise VariantParseError::DefiniteTypeExpected.new(error) if error_code == 3
      raise VariantParseError::InputNotAtEnd.new(error) if error_code == 4
      raise VariantParseError::InvalidCharacter.new(error) if error_code == 5
      raise VariantParseError::InvalidFormatString.new(error) if error_code == 6
      raise VariantParseError::InvalidObjectPath.new(error) if error_code == 7
      raise VariantParseError::InvalidSignature.new(error) if error_code == 8
      raise VariantParseError::InvalidTypeString.new(error) if error_code == 9
      raise VariantParseError::NoCommonType.new(error) if error_code == 10
      raise VariantParseError::NumberOutOfRange.new(error) if error_code == 11
      raise VariantParseError::NumberTooBig.new(error) if error_code == 12
      raise VariantParseError::TypeError.new(error) if error_code == 13
      raise VariantParseError::UnexpectedToken.new(error) if error_code == 14
      raise VariantParseError::UnknownKeyword.new(error) if error_code == 15
      raise VariantParseError::UnterminatedStringConstant.new(error) if error_code == 16
      raise VariantParseError::ValueExpected.new(error) if error_code == 17
      raise VariantParseError::Recursion.new(error) if error_code == 18
    end
  end

  extend self
end

# Extra includes
require "../../../lib/gi-crystal/src/bindings/g_lib/list.cr"
require "../../../lib/gi-crystal/src/bindings/g_lib/slist.cr"
require "../../../lib/gi-crystal/src/bindings/g_lib/timeout.cr"
require "../../../lib/gi-crystal/src/bindings/g_lib/variant.cr"
