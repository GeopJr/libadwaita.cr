@[Link("gobject-2.0", pkg_config: "gobject-2.0")]
@[Link("glib-2.0", pkg_config: "glib-2.0")]

lib LibGLib
  # Functions not declared by GObj Introspection

  # Memory related functions
  fun g_malloc0(size : LibC::SizeT) : Void*
  fun g_free(mem : Void*)

  # GList
  fun g_list_length(list : List*) : UInt32
  fun g_list_free(list : List*)
  fun g_list_free_full(list : List*, free_func : Proc(Void*, Nil))
  fun g_list_first(list : List*) : List*
  fun g_list_last(list : List*) : List*
  fun g_list_nth(list : List*, n : UInt32) : List*

  # GSList
  fun g_slist_length(list : SList*) : UInt32
  fun g_slist_nth(list : SList*, n : UInt32) : SList*
  fun g_slist_free(list : SList*)
  fun g_slist_free_full(list : SList*, free_func : Proc(Void*, Nil))

  # Flags
  type AsciiType = UInt32
  type FileSetContentsFlags = UInt32
  type FileTest = UInt32
  type FormatSizeFlags = UInt32
  type HookFlagMask = UInt32
  type IOCondition = UInt32
  type IOFlags = UInt32
  type KeyFileFlags = UInt32
  type LogLevelFlags = Int32
  type MarkupCollectType = UInt32
  type MarkupParseFlags = UInt32
  type OptionFlags = UInt32
  type RegexCompileFlags = UInt32
  type RegexMatchFlags = UInt32
  type SpawnFlags = UInt32
  type TestSubprocessFlags = UInt32
  type TestTrapFlags = UInt32
  type TraverseFlags = UInt32
  type UriFlags = UInt32
  type UriHideFlags = UInt32
  type UriParamsFlags = UInt32

  # Enums
  type BookmarkFileError = UInt32
  type ChecksumType = UInt32
  type ConvertError = UInt32
  type DateDMY = UInt32
  type DateMonth = UInt32
  type DateWeekday = UInt32
  type ErrorType = UInt32
  type FileError = UInt32
  type IOChannelError = UInt32
  type IOError = UInt32
  type IOStatus = UInt32
  type KeyFileError = UInt32
  type LogWriterOutput = UInt32
  type MarkupError = UInt32
  type NormalizeMode = UInt32
  type NumberParserError = UInt32
  type OnceStatus = UInt32
  type OptionArg = UInt32
  type OptionError = UInt32
  type RegexError = UInt32
  type SeekType = UInt32
  type ShellError = UInt32
  type SliceConfig = UInt32
  type SpawnError = UInt32
  type TestFileType = UInt32
  type TestLogType = UInt32
  type TestResult = UInt32
  type ThreadError = UInt32
  type TimeType = UInt32
  type TokenType = UInt32
  type TraverseType = UInt32
  type UnicodeBreakType = UInt32
  type UnicodeScript = Int32
  type UnicodeType = UInt32
  type UriError = UInt32
  type UserDirectory = UInt32
  type VariantClass = UInt32
  type VariantParseError = UInt32

  # Callbacks
  alias ChildWatchFunc = Int32, Int32, Pointer(Void) -> Void
  alias ClearHandleFunc = UInt32 -> Void
  alias CompareDataFunc = Pointer(Void), Pointer(Void), Pointer(Void) -> Int32
  alias CompareFunc = Pointer(Void), Pointer(Void) -> Int32
  alias CopyFunc = Pointer(Void), Pointer(Void) -> Pointer(Void)
  alias DataForeachFunc = UInt32, Pointer(Void), Pointer(Void) -> Void
  alias DestroyNotify = Pointer(Void) -> Void
  alias DuplicateFunc = Pointer(Void), Pointer(Void) -> Pointer(Void)
  alias EqualFunc = Pointer(Void), Pointer(Void) -> LibC::Int
  alias ErrorClearFunc = Pointer(Void) -> Void
  alias ErrorCopyFunc = Pointer(Void), Pointer(Void) -> Void
  alias ErrorInitFunc = Pointer(Void) -> Void
  alias FreeFunc = Pointer(Void) -> Void
  alias Func = Pointer(Void), Pointer(Void) -> Void
  alias HFunc = Pointer(Void), Pointer(Void), Pointer(Void) -> Void
  alias HRFunc = Pointer(Void), Pointer(Void), Pointer(Void) -> LibC::Int
  alias HashFunc = Pointer(Void) -> UInt32
  alias HookCheckFunc = Pointer(Void) -> LibC::Int
  alias HookCheckMarshaller = Pointer(LibGLib::Hook), Pointer(Void) -> LibC::Int
  alias HookCompareFunc = Pointer(LibGLib::Hook), Pointer(LibGLib::Hook) -> Int32
  alias HookFinalizeFunc = Pointer(LibGLib::HookList), Pointer(LibGLib::Hook) -> Void
  alias HookFindFunc = Pointer(LibGLib::Hook), Pointer(Void) -> LibC::Int
  alias HookFunc = Pointer(Void) -> Void
  alias HookMarshaller = Pointer(LibGLib::Hook), Pointer(Void) -> Void
  alias IOFunc = Pointer(LibGLib::IOChannel), UInt32, Pointer(Void) -> LibC::Int
  alias LogFunc = Pointer(LibC::Char), Int32, Pointer(LibC::Char), Pointer(Void) -> Void
  alias LogWriterFunc = Int32, Pointer(Void), UInt64, Pointer(Void) -> UInt32
  alias NodeForeachFunc = Pointer(LibGLib::Node), Pointer(Void) -> Void
  alias NodeTraverseFunc = Pointer(LibGLib::Node), Pointer(Void) -> LibC::Int
  alias OptionArgFunc = Pointer(LibC::Char), Pointer(LibC::Char), Pointer(Void) -> LibC::Int
  alias OptionErrorFunc = Pointer(LibGLib::OptionContext), Pointer(LibGLib::OptionGroup), Pointer(Void) -> Void
  alias OptionParseFunc = Pointer(LibGLib::OptionContext), Pointer(LibGLib::OptionGroup), Pointer(Void) -> LibC::Int
  alias PollFunc = Pointer(LibGLib::PollFD), UInt32, Int32 -> Int32
  alias PrintFunc = Pointer(LibC::Char) -> Void
  alias RegexEvalCallback = Pointer(LibGLib::MatchInfo), Pointer(LibGLib::String), Pointer(Void) -> LibC::Int
  alias ScannerMsgFunc = Pointer(LibGLib::Scanner), Pointer(LibC::Char), LibC::Int -> Void
  alias SequenceIterCompareFunc = Pointer(LibGLib::SequenceIter), Pointer(LibGLib::SequenceIter), Pointer(Void) -> Int32
  alias SourceDisposeFunc = Pointer(LibGLib::Source) -> Void
  alias SourceDummyMarshal = -> Void
  alias SourceFunc = Pointer(Void) -> LibC::Int
  alias SpawnChildSetupFunc = Pointer(Void) -> Void
  alias TestDataFunc = Pointer(Void) -> Void
  alias TestFixtureFunc = Pointer(Void), Pointer(Void) -> Void
  alias TestFunc = -> Void
  alias TestLogFatalFunc = Pointer(LibC::Char), Int32, Pointer(LibC::Char), Pointer(Void) -> LibC::Int
  alias ThreadFunc = Pointer(Void) -> Pointer(Void)
  alias TranslateFunc = Pointer(LibC::Char), Pointer(Void) -> Pointer(LibC::Char)
  alias TraverseFunc = Pointer(Void), Pointer(Void), Pointer(Void) -> LibC::Int
  alias TraverseNodeFunc = Pointer(LibGLib::TreeNode), Pointer(Void) -> LibC::Int
  alias UnixFDSourceFunc = Int32, UInt32, Pointer(Void) -> LibC::Int
  alias VoidFunc = -> Void

  # Interface types

  # Structs

  struct Array # 16 bytes long
    data : Pointer(LibC::Char)
    len : UInt32
  end

  type AsyncQueue = Void # Struct with zero bytes

  type BookmarkFile = Void # Struct with zero bytes

  struct ByteArray # 16 bytes long
    data : Pointer(UInt8)
    len : UInt32
  end

  type Bytes = Void # Struct with zero bytes

  type Checksum = Void # Struct with zero bytes

  struct Cond # 16 bytes long
    p : Pointer(Void)
    i : UInt32[2]
  end

  type Data = Void # Struct with zero bytes

  struct Date # 24 bytes long
    julian_days : UInt32
    julian : UInt32
    dmy : UInt32
    day : UInt32
    month : UInt32
    year : UInt32
  end

  type DateTime = Void # Struct with zero bytes

  struct DebugKey # 16 bytes long
    key : Pointer(LibC::Char)
    value : UInt32
  end

  type Dir = Void # Struct with zero bytes

  struct Error # 16 bytes long
    domain : UInt32
    code : Int32
    message : Pointer(LibC::Char)
  end

  type HashTable = Void # Struct with zero bytes

  struct HashTableIter # 40 bytes long
    dummy1 : Pointer(Void)
    dummy2 : Pointer(Void)
    dummy3 : Pointer(Void)
    dummy4 : Int32
    dummy5 : LibC::Int
    dummy6 : Pointer(Void)
  end

  type Hmac = Void # Struct with zero bytes

  struct Hook # 64 bytes long
    data : Pointer(Void)
    _next : Pointer(LibGLib::Hook)
    prev : Pointer(LibGLib::Hook)
    ref_count : UInt32
    hook_id : UInt64
    flags : UInt32
    func : Pointer(Void)
    destroy : Void*
  end

  struct HookList # 56 bytes long
    seq_id : UInt64
    hook_size : UInt32
    is_setup : UInt32
    hooks : Pointer(LibGLib::Hook)
    dummy3 : Pointer(Void)
    finalize_hook : Void*
    dummy : Pointer(Void)[2]
  end

  struct IOChannel # 136 bytes long
    ref_count : Int32
    funcs : Pointer(LibGLib::IOFuncs)
    encoding : Pointer(LibC::Char)
    read_cd : Pointer(Void)
    write_cd : Pointer(Void)
    line_term : Pointer(LibC::Char)
    line_term_len : UInt32
    buf_size : UInt64
    read_buf : Pointer(LibGLib::String)
    encoded_read_buf : Pointer(LibGLib::String)
    write_buf : Pointer(LibGLib::String)
    partial_write_buf : Int8[6]
    use_buffer : UInt32
    do_encode : UInt32
    close_on_unref : UInt32
    is_readable : UInt32
    is_writeable : UInt32
    is_seekable : UInt32
    reserved1 : Pointer(Void)
    reserved2 : Pointer(Void)
  end

  struct IOFuncs # 64 bytes long
    io_read : Void*
    io_write : Void*
    io_seek : Void*
    io_close : Void*
    io_create_watch : Void*
    io_free : Void*
    io_set_flags : Void*
    io_get_flags : Void*
  end

  type KeyFile = Void # Struct with zero bytes

  struct List # 24 bytes long
    data : Pointer(Void)
    _next : Pointer(LibGLib::List)
    prev : Pointer(LibGLib::List)
  end

  struct LogField # 24 bytes long
    key : Pointer(LibC::Char)
    value : Pointer(Void)
    length : Int64
  end

  type MainContext = Void # Struct with zero bytes

  type MainLoop = Void # Struct with zero bytes

  type MappedFile = Void # Struct with zero bytes

  type MarkupParseContext = Void # Struct with zero bytes

  struct MarkupParser # 40 bytes long
    start_element : Void*
    end_element : Void*
    text : Void*
    passthrough : Void*
    error : Void*
  end

  type MatchInfo = Void # Struct with zero bytes

  struct MemVTable # 48 bytes long
    malloc : Void*
    realloc : Void*
    free : Void*
    calloc : Void*
    try_malloc : Void*
    try_realloc : Void*
  end

  struct Node # 40 bytes long
    data : Pointer(Void)
    _next : Pointer(LibGLib::Node)
    prev : Pointer(LibGLib::Node)
    parent : Pointer(LibGLib::Node)
    children : Pointer(LibGLib::Node)
  end

  struct Once # 16 bytes long
    status : UInt32
    retval : Pointer(Void)
  end

  type OptionContext = Void # Struct with zero bytes

  struct OptionEntry # 48 bytes long
    long_name : Pointer(LibC::Char)
    short_name : Int8
    flags : Int32
    arg : UInt32
    arg_data : Pointer(Void)
    description : Pointer(LibC::Char)
    arg_description : Pointer(LibC::Char)
  end

  type OptionGroup = Void # Struct with zero bytes

  type PatternSpec = Void # Struct with zero bytes

  struct PollFD # 8 bytes long
    fd : Int32
    events : UInt16
    revents : UInt16
  end

  struct Private # 32 bytes long
    p : Pointer(Void)
    notify : Void*
    future : Pointer(Void)[2]
  end

  struct PtrArray # 16 bytes long
    pdata : Pointer(Void)
    len : UInt32
  end

  struct Queue # 24 bytes long
    head : Pointer(LibGLib::List)
    tail : Pointer(LibGLib::List)
    length : UInt32
  end

  struct RWLock # 16 bytes long
    p : Pointer(Void)
    i : UInt32[2]
  end

  type Rand = Void # Struct with zero bytes

  struct RecMutex # 16 bytes long
    p : Pointer(Void)
    i : UInt32[2]
  end

  type Regex = Void # Struct with zero bytes

  struct SList # 16 bytes long
    data : Pointer(Void)
    _next : Pointer(LibGLib::SList)
  end

  struct Scanner # 144 bytes long
    user_data : Pointer(Void)
    max_parse_errors : UInt32
    parse_errors : UInt32
    input_name : Pointer(LibC::Char)
    qdata : Pointer(LibGLib::Data)
    config : Pointer(LibGLib::ScannerConfig)
    token : UInt32
    value : LibGLib::TokenValue
    line : UInt32
    position : UInt32
    next_token : UInt32
    next_value : LibGLib::TokenValue
    next_line : UInt32
    next_position : UInt32
    symbol_table : Pointer(Void)
    input_fd : Int32
    text : Pointer(LibC::Char)
    text_end : Pointer(LibC::Char)
    buffer : Pointer(LibC::Char)
    scope_id : UInt32
    msg_handler : Void*
  end

  struct ScannerConfig # 128 bytes long
    cset_skip_characters : Pointer(LibC::Char)
    cset_identifier_first : Pointer(LibC::Char)
    cset_identifier_nth : Pointer(LibC::Char)
    cpair_comment_single : Pointer(LibC::Char)
    case_sensitive : UInt32
    skip_comment_multi : UInt32
    skip_comment_single : UInt32
    scan_comment_multi : UInt32
    scan_identifier : UInt32
    scan_identifier_1char : UInt32
    scan_identifier_NULL : UInt32
    scan_symbols : UInt32
    scan_binary : UInt32
    scan_octal : UInt32
    scan_float : UInt32
    scan_hex : UInt32
    scan_hex_dollar : UInt32
    scan_string_sq : UInt32
    scan_string_dq : UInt32
    numbers_2_int : UInt32
    int_2_float : UInt32
    identifier_2_string : UInt32
    char_2_token : UInt32
    symbol_2_token : UInt32
    scope_0_fallback : UInt32
    store_int64 : UInt32
    padding_dummy : UInt32
  end

  type Sequence = Void # Struct with zero bytes

  type SequenceIter = Void # Struct with zero bytes

  struct Source # 96 bytes long
    callback_data : Pointer(Void)
    callback_funcs : Pointer(LibGLib::SourceCallbackFuncs)
    source_funcs : Pointer(LibGLib::SourceFuncs)
    ref_count : UInt32
    context : Pointer(LibGLib::MainContext)
    priority : Int32
    flags : UInt32
    source_id : UInt32
    poll_fds : Pointer(LibGLib::SList)
    prev : Pointer(LibGLib::Source)
    _next : Pointer(LibGLib::Source)
    name : Pointer(LibC::Char)
    priv : Pointer(LibGLib::SourcePrivate)
  end

  struct SourceCallbackFuncs # 24 bytes long
    ref : Void*
    unref : Void*
    get : Pointer(Void)
  end

  struct SourceFuncs # 48 bytes long
    prepare : Void*
    check : Void*
    dispatch : Pointer(Void)
    finalize : Void*
    closure_callback : Void*
    closure_marshal : Void*
  end

  type SourcePrivate = Void # Struct with zero bytes

  type StatBuf = Void # Struct with zero bytes

  struct String # 24 bytes long
    str : Pointer(LibC::Char)
    len : UInt64
    allocated_len : UInt64
  end

  type StringChunk = Void # Struct with zero bytes

  type StrvBuilder = Void # Struct with zero bytes

  type TestCase = Void # Struct with zero bytes

  struct TestConfig # 24 bytes long
    test_initialized : LibC::Int
    test_quick : LibC::Int
    test_perf : LibC::Int
    test_verbose : LibC::Int
    test_quiet : LibC::Int
    test_undefined : LibC::Int
  end

  struct TestLogBuffer # 16 bytes long
    data : Pointer(LibGLib::String)
    msgs : Pointer(LibGLib::SList)
  end

  struct TestLogMsg # 32 bytes long
    log_type : UInt32
    n_strings : UInt32
    strings : Pointer(LibC::Char)
    n_nums : UInt32
    nums : Pointer(Void)
  end

  type TestSuite = Void # Struct with zero bytes

  type Thread = Void # Struct with zero bytes

  struct ThreadPool # 24 bytes long
    func : Void*
    user_data : Pointer(Void)
    exclusive : LibC::Int
  end

  struct TimeVal # 16 bytes long
    tv_sec : Int64
    tv_usec : Int64
  end

  type TimeZone = Void # Struct with zero bytes

  type Timer = Void # Struct with zero bytes

  struct TrashStack # 8 bytes long
    _next : Pointer(LibGLib::TrashStack)
  end

  type Tree = Void # Struct with zero bytes

  type TreeNode = Void # Struct with zero bytes

  type Uri = Void # Struct with zero bytes

  struct UriParamsIter # 280 bytes long
    dummy0 : Int32
    dummy1 : Pointer(Void)
    dummy2 : Pointer(Void)
    dummy3 : UInt8[256]
  end

  type Variant = Void # Struct with zero bytes

  type VariantBuilder = Void # Struct with zero bytes

  type VariantDict = Void # Struct with zero bytes

  type VariantType = Void # Struct with zero bytes

  # Unions

  union DoubleIEEE754 # 8 bytes
    v_double : Float64
  end

  union FloatIEEE754 # 4 bytes
    v_float : Float32
  end

  union Mutex # 8 bytes
    p : Pointer(Void)
    i : UInt32[2]
  end

  union TokenValue # 8 bytes
    v_symbol : Pointer(Void)
    v_identifier : Pointer(LibC::Char)
    v_binary : UInt64
    v_octal : UInt64
    v_int : UInt64
    v_int64 : UInt64
    v_float : Float64
    v_hex : UInt64
    v_string : Pointer(LibC::Char)
    v_comment : Pointer(LibC::Char)
    v_char : UInt8
    v_error : UInt32
  end

  # Objects

  # All C Functions
  fun g_access(filename : Pointer(LibC::Char), mode : Int32) : Int32
  fun g_array_get_type : UInt64
  fun g_ascii_digit_value(c : Int8) : Int32
  fun g_ascii_dtostr(buffer : Pointer(LibC::Char), buf_len : Int32, d : Float64) : Pointer(LibC::Char)
  fun g_ascii_formatd(buffer : Pointer(LibC::Char), buf_len : Int32, format : Pointer(LibC::Char), d : Float64) : Pointer(LibC::Char)
  fun g_ascii_strcasecmp(s1 : Pointer(LibC::Char), s2 : Pointer(LibC::Char)) : Int32
  fun g_ascii_strdown(str : Pointer(LibC::Char), len : Int64) : Pointer(LibC::Char)
  fun g_ascii_string_to_signed(str : Pointer(LibC::Char), base : UInt32, min : Int64, max : Int64, out_num : Pointer(Int64), error : LibGLib::Error**) : LibC::Int
  fun g_ascii_string_to_unsigned(str : Pointer(LibC::Char), base : UInt32, min : UInt64, max : UInt64, out_num : Pointer(UInt64), error : LibGLib::Error**) : LibC::Int
  fun g_ascii_strncasecmp(s1 : Pointer(LibC::Char), s2 : Pointer(LibC::Char), n : UInt64) : Int32
  fun g_ascii_strtod(nptr : Pointer(LibC::Char), endptr : Pointer(Pointer(LibC::Char))) : Float64
  fun g_ascii_strtoll(nptr : Pointer(LibC::Char), endptr : Pointer(Pointer(LibC::Char)), base : UInt32) : Int64
  fun g_ascii_strtoull(nptr : Pointer(LibC::Char), endptr : Pointer(Pointer(LibC::Char)), base : UInt32) : UInt64
  fun g_ascii_strup(str : Pointer(LibC::Char), len : Int64) : Pointer(LibC::Char)
  fun g_ascii_tolower(c : Int8) : Int8
  fun g_ascii_toupper(c : Int8) : Int8
  fun g_ascii_xdigit_value(c : Int8) : Int32
  fun g_assert_warning(log_domain : Pointer(LibC::Char), file : Pointer(LibC::Char), line : Int32, pretty_function : Pointer(LibC::Char), expression : Pointer(LibC::Char)) : Void
  fun g_assertion_message(domain : Pointer(LibC::Char), file : Pointer(LibC::Char), line : Int32, func : Pointer(LibC::Char), message : Pointer(LibC::Char)) : Void
  fun g_assertion_message_cmpstr(domain : Pointer(LibC::Char), file : Pointer(LibC::Char), line : Int32, func : Pointer(LibC::Char), expr : Pointer(LibC::Char), arg1 : Pointer(LibC::Char), cmp : Pointer(LibC::Char), arg2 : Pointer(LibC::Char)) : Void
  fun g_assertion_message_cmpstrv(domain : Pointer(LibC::Char), file : Pointer(LibC::Char), line : Int32, func : Pointer(LibC::Char), expr : Pointer(LibC::Char), arg1 : Pointer(LibC::Char), arg2 : Pointer(LibC::Char), first_wrong_idx : UInt64) : Void
  fun g_assertion_message_error(domain : Pointer(LibC::Char), file : Pointer(LibC::Char), line : Int32, func : Pointer(LibC::Char), expr : Pointer(LibC::Char), error : Pointer(Void), error_domain : UInt32, error_code : Int32) : Void
  fun g_async_queue_length(this : Void*) : Int32
  fun g_async_queue_length_unlocked(this : Void*) : Int32
  fun g_async_queue_lock(this : Void*) : Void
  fun g_async_queue_pop(this : Void*) : Pointer(Void)
  fun g_async_queue_pop_unlocked(this : Void*) : Pointer(Void)
  fun g_async_queue_push(this : Void*, data : Pointer(Void)) : Void
  fun g_async_queue_push_front(this : Void*, item : Pointer(Void)) : Void
  fun g_async_queue_push_front_unlocked(this : Void*, item : Pointer(Void)) : Void
  fun g_async_queue_push_unlocked(this : Void*, data : Pointer(Void)) : Void
  fun g_async_queue_ref_unlocked(this : Void*) : Void
  fun g_async_queue_remove(this : Void*, item : Pointer(Void)) : LibC::Int
  fun g_async_queue_remove_unlocked(this : Void*, item : Pointer(Void)) : LibC::Int
  fun g_async_queue_timed_pop(this : Void*, end_time : Pointer(Void)) : Pointer(Void)
  fun g_async_queue_timed_pop_unlocked(this : Void*, end_time : Pointer(Void)) : Pointer(Void)
  fun g_async_queue_timeout_pop(this : Void*, timeout : UInt64) : Pointer(Void)
  fun g_async_queue_timeout_pop_unlocked(this : Void*, timeout : UInt64) : Pointer(Void)
  fun g_async_queue_try_pop(this : Void*) : Pointer(Void)
  fun g_async_queue_try_pop_unlocked(this : Void*) : Pointer(Void)
  fun g_async_queue_unlock(this : Void*) : Void
  fun g_async_queue_unref(this : Void*) : Void
  fun g_async_queue_unref_and_unlock(this : Void*) : Void
  fun g_atexit(func : Void*) : Void
  fun g_atomic_int_add(atomic : Pointer(Int32), val : Int32) : Int32
  fun g_atomic_int_and(atomic : Pointer(UInt32), val : UInt32) : UInt32
  fun g_atomic_int_compare_and_exchange(atomic : Pointer(Int32), oldval : Int32, newval : Int32) : LibC::Int
  fun g_atomic_int_dec_and_test(atomic : Pointer(Int32)) : LibC::Int
  fun g_atomic_int_exchange_and_add(atomic : Pointer(Int32), val : Int32) : Int32
  fun g_atomic_int_get(atomic : Pointer(Int32)) : Int32
  fun g_atomic_int_inc(atomic : Pointer(Int32)) : Void
  fun g_atomic_int_or(atomic : Pointer(UInt32), val : UInt32) : UInt32
  fun g_atomic_int_set(atomic : Pointer(Int32), newval : Int32) : Void
  fun g_atomic_int_xor(atomic : Pointer(UInt32), val : UInt32) : UInt32
  fun g_atomic_pointer_add(atomic : Pointer(Void), val : Int64) : Int64
  fun g_atomic_pointer_and(atomic : Pointer(Void), val : UInt64) : UInt64
  fun g_atomic_pointer_compare_and_exchange(atomic : Pointer(Void), oldval : Pointer(Void), newval : Pointer(Void)) : LibC::Int
  fun g_atomic_pointer_get(atomic : Pointer(Void)) : Pointer(Void)
  fun g_atomic_pointer_or(atomic : Pointer(Void), val : UInt64) : UInt64
  fun g_atomic_pointer_set(atomic : Pointer(Void), newval : Pointer(Void)) : Void
  fun g_atomic_pointer_xor(atomic : Pointer(Void), val : UInt64) : UInt64
  fun g_atomic_rc_box_acquire(mem_block : Pointer(Void)) : Pointer(Void)
  fun g_atomic_rc_box_alloc(block_size : UInt64) : Pointer(Void)
  fun g_atomic_rc_box_alloc0(block_size : UInt64) : Pointer(Void)
  fun g_atomic_rc_box_dup(block_size : UInt64, mem_block : Pointer(Void)) : Pointer(Void)
  fun g_atomic_rc_box_get_size(mem_block : Pointer(Void)) : UInt64
  fun g_atomic_rc_box_release(mem_block : Pointer(Void)) : Void
  fun g_atomic_rc_box_release_full(mem_block : Pointer(Void), clear_func : Void*) : Void
  fun g_atomic_ref_count_compare(arc : Pointer(Int32), val : Int32) : LibC::Int
  fun g_atomic_ref_count_dec(arc : Pointer(Int32)) : LibC::Int
  fun g_atomic_ref_count_inc(arc : Pointer(Int32)) : Void
  fun g_atomic_ref_count_init(arc : Pointer(Int32)) : Void
  fun g_base64_decode(text : Pointer(LibC::Char), out_len : Pointer(UInt64)) : Pointer(UInt8)
  fun g_base64_decode_inplace(text : Pointer(Pointer(UInt8)), out_len : Pointer(UInt64)) : Pointer(UInt8)
  fun g_base64_encode(data : Pointer(UInt8), len : UInt64) : Pointer(LibC::Char)
  fun g_base64_encode_close(break_lines : LibC::Int, _out : Pointer(Pointer(UInt8)), state : Pointer(Int32), save : Pointer(Int32)) : UInt64
  fun g_base64_encode_step(_in : Pointer(UInt8), len : UInt64, break_lines : LibC::Int, _out : Pointer(Pointer(UInt8)), state : Pointer(Int32), save : Pointer(Int32)) : UInt64
  fun g_basename(file_name : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_bit_lock(address : Pointer(Int32), lock_bit : Int32) : Void
  fun g_bit_nth_lsf(mask : UInt64, nth_bit : Int32) : Int32
  fun g_bit_nth_msf(mask : UInt64, nth_bit : Int32) : Int32
  fun g_bit_storage(number : UInt64) : UInt32
  fun g_bit_trylock(address : Pointer(Int32), lock_bit : Int32) : LibC::Int
  fun g_bit_unlock(address : Pointer(Int32), lock_bit : Int32) : Void
  fun g_bookmark_file_add_application(this : Void*, uri : Pointer(LibC::Char), name : Pointer(LibC::Char), exec : Pointer(LibC::Char)) : Void
  fun g_bookmark_file_add_group(this : Void*, uri : Pointer(LibC::Char), group : Pointer(LibC::Char)) : Void
  fun g_bookmark_file_error_quark : UInt32
  fun g_bookmark_file_error_quark : UInt32
  fun g_bookmark_file_free(this : Void*) : Void
  fun g_bookmark_file_get_added(this : Void*, uri : Pointer(LibC::Char), error : LibGLib::Error**) : Int64
  fun g_bookmark_file_get_added_date_time(this : Void*, uri : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_bookmark_file_get_app_info(this : Void*, uri : Pointer(LibC::Char), name : Pointer(LibC::Char), exec : Pointer(Pointer(LibC::Char)), count : Pointer(UInt32), stamp : Pointer(Int64), error : LibGLib::Error**) : LibC::Int
  fun g_bookmark_file_get_application_info(this : Void*, uri : Pointer(LibC::Char), name : Pointer(LibC::Char), exec : Pointer(Pointer(LibC::Char)), count : Pointer(UInt32), stamp : Pointer(Pointer(Void)), error : LibGLib::Error**) : LibC::Int
  fun g_bookmark_file_get_applications(this : Void*, uri : Pointer(LibC::Char), length : Pointer(UInt64), error : LibGLib::Error**) : Pointer(Pointer(LibC::Char))
  fun g_bookmark_file_get_description(this : Void*, uri : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_bookmark_file_get_groups(this : Void*, uri : Pointer(LibC::Char), length : Pointer(UInt64), error : LibGLib::Error**) : Pointer(Pointer(LibC::Char))
  fun g_bookmark_file_get_icon(this : Void*, uri : Pointer(LibC::Char), href : Pointer(Pointer(LibC::Char)), mime_type : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : LibC::Int
  fun g_bookmark_file_get_is_private(this : Void*, uri : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_bookmark_file_get_mime_type(this : Void*, uri : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_bookmark_file_get_modified(this : Void*, uri : Pointer(LibC::Char), error : LibGLib::Error**) : Int64
  fun g_bookmark_file_get_modified_date_time(this : Void*, uri : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_bookmark_file_get_size(this : Void*) : Int32
  fun g_bookmark_file_get_title(this : Void*, uri : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_bookmark_file_get_uris(this : Void*, length : Pointer(UInt64)) : Pointer(Pointer(LibC::Char))
  fun g_bookmark_file_get_visited(this : Void*, uri : Pointer(LibC::Char), error : LibGLib::Error**) : Int64
  fun g_bookmark_file_get_visited_date_time(this : Void*, uri : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_bookmark_file_has_application(this : Void*, uri : Pointer(LibC::Char), name : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_bookmark_file_has_group(this : Void*, uri : Pointer(LibC::Char), group : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_bookmark_file_has_item(this : Void*, uri : Pointer(LibC::Char)) : LibC::Int
  fun g_bookmark_file_load_from_data(this : Void*, data : Pointer(UInt8), length : UInt64, error : LibGLib::Error**) : LibC::Int
  fun g_bookmark_file_load_from_data_dirs(this : Void*, file : Pointer(LibC::Char), full_path : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : LibC::Int
  fun g_bookmark_file_load_from_file(this : Void*, filename : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_bookmark_file_move_item(this : Void*, old_uri : Pointer(LibC::Char), new_uri : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_bookmark_file_remove_application(this : Void*, uri : Pointer(LibC::Char), name : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_bookmark_file_remove_group(this : Void*, uri : Pointer(LibC::Char), group : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_bookmark_file_remove_item(this : Void*, uri : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_bookmark_file_set_added(this : Void*, uri : Pointer(LibC::Char), added : Int64) : Void
  fun g_bookmark_file_set_added_date_time(this : Void*, uri : Pointer(LibC::Char), added : Pointer(Void)) : Void
  fun g_bookmark_file_set_app_info(this : Void*, uri : Pointer(LibC::Char), name : Pointer(LibC::Char), exec : Pointer(LibC::Char), count : Int32, stamp : Int64, error : LibGLib::Error**) : LibC::Int
  fun g_bookmark_file_set_application_info(this : Void*, uri : Pointer(LibC::Char), name : Pointer(LibC::Char), exec : Pointer(LibC::Char), count : Int32, stamp : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_bookmark_file_set_description(this : Void*, uri : Pointer(LibC::Char), description : Pointer(LibC::Char)) : Void
  fun g_bookmark_file_set_groups(this : Void*, uri : Pointer(LibC::Char), groups : Pointer(Pointer(LibC::Char)), length : UInt64) : Void
  fun g_bookmark_file_set_icon(this : Void*, uri : Pointer(LibC::Char), href : Pointer(LibC::Char), mime_type : Pointer(LibC::Char)) : Void
  fun g_bookmark_file_set_is_private(this : Void*, uri : Pointer(LibC::Char), is_private : LibC::Int) : Void
  fun g_bookmark_file_set_mime_type(this : Void*, uri : Pointer(LibC::Char), mime_type : Pointer(LibC::Char)) : Void
  fun g_bookmark_file_set_modified(this : Void*, uri : Pointer(LibC::Char), modified : Int64) : Void
  fun g_bookmark_file_set_modified_date_time(this : Void*, uri : Pointer(LibC::Char), modified : Pointer(Void)) : Void
  fun g_bookmark_file_set_title(this : Void*, uri : Pointer(LibC::Char), title : Pointer(LibC::Char)) : Void
  fun g_bookmark_file_set_visited(this : Void*, uri : Pointer(LibC::Char), visited : Int64) : Void
  fun g_bookmark_file_set_visited_date_time(this : Void*, uri : Pointer(LibC::Char), visited : Pointer(Void)) : Void
  fun g_bookmark_file_to_data(this : Void*, length : Pointer(UInt64), error : LibGLib::Error**) : Pointer(UInt8)
  fun g_bookmark_file_to_file(this : Void*, filename : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_build_filenamev(args : Pointer(Pointer(LibC::Char))) : Pointer(LibC::Char)
  fun g_build_pathv(separator : Pointer(LibC::Char), args : Pointer(Pointer(LibC::Char))) : Pointer(LibC::Char)
  fun g_byte_array_free(array : Pointer(UInt8), free_segment : LibC::Int) : Pointer(UInt8)
  fun g_byte_array_free(array : Pointer(UInt8), free_segment : LibC::Int) : Pointer(UInt8)
  fun g_byte_array_free_to_bytes(array : Pointer(UInt8)) : Pointer(Void)
  fun g_byte_array_free_to_bytes(array : Pointer(UInt8)) : Pointer(Void)
  fun g_byte_array_get_type : UInt64
  fun g_byte_array_new : Pointer(UInt8)
  fun g_byte_array_new : Pointer(UInt8)
  fun g_byte_array_new_take(data : Pointer(UInt8), len : UInt64) : Pointer(UInt8)
  fun g_byte_array_new_take(data : Pointer(UInt8), len : UInt64) : Pointer(UInt8)
  fun g_byte_array_steal(array : Pointer(UInt8), len : Pointer(UInt64)) : Pointer(UInt8)
  fun g_byte_array_steal(array : Pointer(UInt8), len : Pointer(UInt64)) : Pointer(UInt8)
  fun g_byte_array_unref(array : Pointer(UInt8)) : Void
  fun g_byte_array_unref(array : Pointer(UInt8)) : Void
  fun g_bytes_compare(this : Void*, bytes2 : Pointer(Void)) : Int32
  fun g_bytes_equal(this : Void*, bytes2 : Pointer(Void)) : LibC::Int
  fun g_bytes_get_data(this : Void*, size : Pointer(UInt64)) : Pointer(UInt8)
  fun g_bytes_get_region(this : Void*, element_size : UInt64, offset : UInt64, n_elements : UInt64) : Pointer(Void)
  fun g_bytes_get_size(this : Void*) : UInt64
  fun g_bytes_get_type : UInt64
  fun g_bytes_hash(this : Void*) : UInt32
  fun g_bytes_new(data : Pointer(UInt8), size : UInt64) : Pointer(Void)
  fun g_bytes_new_from_bytes(this : Void*, offset : UInt64, length : UInt64) : Pointer(Void)
  fun g_bytes_new_take(data : Pointer(UInt8), size : UInt64) : Pointer(Void)
  fun g_bytes_ref(this : Void*) : Pointer(Void)
  fun g_bytes_unref(this : Void*) : Void
  fun g_bytes_unref_to_array(this : Void*) : Pointer(UInt8)
  fun g_bytes_unref_to_data(this : Void*, size : Pointer(UInt64)) : Pointer(UInt8)
  fun g_canonicalize_filename(filename : Pointer(LibC::Char), relative_to : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_chdir(path : Pointer(LibC::Char)) : Int32
  fun g_checksum_copy(this : Void*) : Pointer(Void)
  fun g_checksum_free(this : Void*) : Void
  fun g_checksum_get_string(this : Void*) : Pointer(LibC::Char)
  fun g_checksum_get_type : UInt64
  fun g_checksum_new(checksum_type : UInt32) : Pointer(Void)
  fun g_checksum_reset(this : Void*) : Void
  fun g_checksum_type_get_length(checksum_type : UInt32) : Int64
  fun g_checksum_type_get_length(checksum_type : UInt32) : Int64
  fun g_checksum_update(this : Void*, data : Pointer(UInt8), length : Int64) : Void
  fun g_child_watch_add_full(priority : Int32, pid : Int32, function : Void*, data : Pointer(Void), notify : Void*) : UInt32
  fun g_child_watch_source_new(pid : Int32) : Pointer(Void)
  fun g_clear_error(error : LibGLib::Error**) : Void
  fun g_close(fd : Int32, error : LibGLib::Error**) : LibC::Int
  fun g_compute_checksum_for_bytes(checksum_type : UInt32, data : Pointer(Void)) : Pointer(LibC::Char)
  fun g_compute_checksum_for_data(checksum_type : UInt32, data : Pointer(UInt8), length : UInt64) : Pointer(LibC::Char)
  fun g_compute_checksum_for_string(checksum_type : UInt32, str : Pointer(LibC::Char), length : Int64) : Pointer(LibC::Char)
  fun g_compute_hmac_for_bytes(digest_type : UInt32, key : Pointer(Void), data : Pointer(Void)) : Pointer(LibC::Char)
  fun g_compute_hmac_for_data(digest_type : UInt32, key : Pointer(UInt8), key_len : UInt64, data : Pointer(UInt8), length : UInt64) : Pointer(LibC::Char)
  fun g_compute_hmac_for_string(digest_type : UInt32, key : Pointer(UInt8), key_len : UInt64, str : Pointer(LibC::Char), length : Int64) : Pointer(LibC::Char)
  fun g_cond_broadcast(this : Void*) : Void
  fun g_cond_clear(this : Void*) : Void
  fun g_cond_init(this : Void*) : Void
  fun g_cond_signal(this : Void*) : Void
  fun g_cond_wait(this : Void*, mutex : Pointer(Mutex)) : Void
  fun g_cond_wait_until(this : Void*, mutex : Pointer(Mutex), end_time : Int64) : LibC::Int
  fun g_convert(str : Pointer(UInt8), len : Int64, to_codeset : Pointer(LibC::Char), from_codeset : Pointer(LibC::Char), bytes_read : Pointer(UInt64), bytes_written : Pointer(UInt64), error : LibGLib::Error**) : Pointer(UInt8)
  fun g_convert_error_quark : UInt32
  fun g_convert_with_fallback(str : Pointer(UInt8), len : Int64, to_codeset : Pointer(LibC::Char), from_codeset : Pointer(LibC::Char), fallback : Pointer(LibC::Char), bytes_read : Pointer(UInt64), bytes_written : Pointer(UInt64), error : LibGLib::Error**) : Pointer(UInt8)
  fun g_datalist_foreach(datalist : Pointer(Void), func : Void*, user_data : Pointer(Void)) : Void
  fun g_datalist_get_data(datalist : Pointer(Void), key : Pointer(LibC::Char)) : Pointer(Void)
  fun g_datalist_get_flags(datalist : Pointer(Void)) : UInt32
  fun g_datalist_id_get_data(datalist : Pointer(Void), key_id : UInt32) : Pointer(Void)
  fun g_datalist_set_flags(datalist : Pointer(Void), flags : UInt32) : Void
  fun g_datalist_unset_flags(datalist : Pointer(Void), flags : UInt32) : Void
  fun g_dataset_destroy(dataset_location : Pointer(Void)) : Void
  fun g_dataset_foreach(dataset_location : Pointer(Void), func : Void*, user_data : Pointer(Void)) : Void
  fun g_dataset_id_get_data(dataset_location : Pointer(Void), key_id : UInt32) : Pointer(Void)
  fun g_date_add_days(this : Void*, n_days : UInt32) : Void
  fun g_date_add_months(this : Void*, n_months : UInt32) : Void
  fun g_date_add_years(this : Void*, n_years : UInt32) : Void
  fun g_date_clamp(this : Void*, min_date : Pointer(Void), max_date : Pointer(Void)) : Void
  fun g_date_clear(this : Void*, n_dates : UInt32) : Void
  fun g_date_compare(this : Void*, rhs : Pointer(Void)) : Int32
  fun g_date_copy(this : Void*) : Pointer(Void)
  fun g_date_days_between(this : Void*, date2 : Pointer(Void)) : Int32
  fun g_date_free(this : Void*) : Void
  fun g_date_get_day(this : Void*) : UInt8
  fun g_date_get_day_of_year(this : Void*) : UInt32
  fun g_date_get_days_in_month(month : UInt32, year : UInt16) : UInt8
  fun g_date_get_days_in_month(month : UInt32, year : UInt16) : UInt8
  fun g_date_get_iso8601_week_of_year(this : Void*) : UInt32
  fun g_date_get_julian(this : Void*) : UInt32
  fun g_date_get_monday_week_of_year(this : Void*) : UInt32
  fun g_date_get_monday_weeks_in_year(year : UInt16) : UInt8
  fun g_date_get_monday_weeks_in_year(year : UInt16) : UInt8
  fun g_date_get_month(this : Void*) : UInt32
  fun g_date_get_sunday_week_of_year(this : Void*) : UInt32
  fun g_date_get_sunday_weeks_in_year(year : UInt16) : UInt8
  fun g_date_get_sunday_weeks_in_year(year : UInt16) : UInt8
  fun g_date_get_type : UInt64
  fun g_date_get_weekday(this : Void*) : UInt32
  fun g_date_get_year(this : Void*) : UInt16
  fun g_date_is_first_of_month(this : Void*) : LibC::Int
  fun g_date_is_last_of_month(this : Void*) : LibC::Int
  fun g_date_is_leap_year(year : UInt16) : LibC::Int
  fun g_date_is_leap_year(year : UInt16) : LibC::Int
  fun g_date_new : Pointer(Void)
  fun g_date_new_dmy(day : UInt8, month : UInt32, year : UInt16) : Pointer(Void)
  fun g_date_new_julian(julian_day : UInt32) : Pointer(Void)
  fun g_date_order(this : Void*, date2 : Pointer(Void)) : Void
  fun g_date_set_day(this : Void*, day : UInt8) : Void
  fun g_date_set_dmy(this : Void*, day : UInt8, month : UInt32, y : UInt16) : Void
  fun g_date_set_julian(this : Void*, julian_date : UInt32) : Void
  fun g_date_set_month(this : Void*, month : UInt32) : Void
  fun g_date_set_parse(this : Void*, str : Pointer(LibC::Char)) : Void
  fun g_date_set_time(this : Void*, time_ : Int32) : Void
  fun g_date_set_time_t(this : Void*, timet : Int64) : Void
  fun g_date_set_time_val(this : Void*, timeval : Pointer(Void)) : Void
  fun g_date_set_year(this : Void*, year : UInt16) : Void
  fun g_date_strftime(s : Pointer(LibC::Char), slen : UInt64, format : Pointer(LibC::Char), date : Pointer(Void)) : UInt64
  fun g_date_strftime(s : Pointer(LibC::Char), slen : UInt64, format : Pointer(LibC::Char), date : Pointer(Void)) : UInt64
  fun g_date_subtract_days(this : Void*, n_days : UInt32) : Void
  fun g_date_subtract_months(this : Void*, n_months : UInt32) : Void
  fun g_date_subtract_years(this : Void*, n_years : UInt32) : Void
  fun g_date_time_add(this : Void*, timespan : Int64) : Pointer(Void)
  fun g_date_time_add_days(this : Void*, days : Int32) : Pointer(Void)
  fun g_date_time_add_full(this : Void*, years : Int32, months : Int32, days : Int32, hours : Int32, minutes : Int32, seconds : Float64) : Pointer(Void)
  fun g_date_time_add_hours(this : Void*, hours : Int32) : Pointer(Void)
  fun g_date_time_add_minutes(this : Void*, minutes : Int32) : Pointer(Void)
  fun g_date_time_add_months(this : Void*, months : Int32) : Pointer(Void)
  fun g_date_time_add_seconds(this : Void*, seconds : Float64) : Pointer(Void)
  fun g_date_time_add_weeks(this : Void*, weeks : Int32) : Pointer(Void)
  fun g_date_time_add_years(this : Void*, years : Int32) : Pointer(Void)
  fun g_date_time_compare(this : Void*, dt2 : Pointer(Void)) : Int32
  fun g_date_time_difference(this : Void*, _begin : Pointer(Void)) : Int64
  fun g_date_time_equal(this : Void*, dt2 : Pointer(Void)) : LibC::Int
  fun g_date_time_format(this : Void*, format : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_date_time_format_iso8601(this : Void*) : Pointer(LibC::Char)
  fun g_date_time_get_day_of_month(this : Void*) : Int32
  fun g_date_time_get_day_of_week(this : Void*) : Int32
  fun g_date_time_get_day_of_year(this : Void*) : Int32
  fun g_date_time_get_hour(this : Void*) : Int32
  fun g_date_time_get_microsecond(this : Void*) : Int32
  fun g_date_time_get_minute(this : Void*) : Int32
  fun g_date_time_get_month(this : Void*) : Int32
  fun g_date_time_get_second(this : Void*) : Int32
  fun g_date_time_get_seconds(this : Void*) : Float64
  fun g_date_time_get_timezone(this : Void*) : Pointer(Void)
  fun g_date_time_get_timezone_abbreviation(this : Void*) : Pointer(LibC::Char)
  fun g_date_time_get_type : UInt64
  fun g_date_time_get_utc_offset(this : Void*) : Int64
  fun g_date_time_get_week_numbering_year(this : Void*) : Int32
  fun g_date_time_get_week_of_year(this : Void*) : Int32
  fun g_date_time_get_year(this : Void*) : Int32
  fun g_date_time_get_ymd(this : Void*, year : Pointer(Int32), month : Pointer(Int32), day : Pointer(Int32)) : Void
  fun g_date_time_hash(this : Void*) : UInt32
  fun g_date_time_is_daylight_savings(this : Void*) : LibC::Int
  fun g_date_time_new(tz : Pointer(Void), year : Int32, month : Int32, day : Int32, hour : Int32, minute : Int32, seconds : Float64) : Pointer(Void)
  fun g_date_time_new_from_iso8601(text : Pointer(LibC::Char), default_tz : Pointer(Void)) : Pointer(Void)
  fun g_date_time_new_from_timeval_local(tv : Pointer(Void)) : Pointer(Void)
  fun g_date_time_new_from_timeval_utc(tv : Pointer(Void)) : Pointer(Void)
  fun g_date_time_new_from_unix_local(t : Int64) : Pointer(Void)
  fun g_date_time_new_from_unix_utc(t : Int64) : Pointer(Void)
  fun g_date_time_new_local(year : Int32, month : Int32, day : Int32, hour : Int32, minute : Int32, seconds : Float64) : Pointer(Void)
  fun g_date_time_new_now(tz : Pointer(Void)) : Pointer(Void)
  fun g_date_time_new_now_local : Pointer(Void)
  fun g_date_time_new_now_utc : Pointer(Void)
  fun g_date_time_new_utc(year : Int32, month : Int32, day : Int32, hour : Int32, minute : Int32, seconds : Float64) : Pointer(Void)
  fun g_date_time_ref(this : Void*) : Pointer(Void)
  fun g_date_time_to_local(this : Void*) : Pointer(Void)
  fun g_date_time_to_timeval(this : Void*, tv : Pointer(Void)) : LibC::Int
  fun g_date_time_to_timezone(this : Void*, tz : Pointer(Void)) : Pointer(Void)
  fun g_date_time_to_unix(this : Void*) : Int64
  fun g_date_time_to_utc(this : Void*) : Pointer(Void)
  fun g_date_time_unref(this : Void*) : Void
  fun g_date_to_struct_tm(this : Void*, tm : Pointer(Void)) : Void
  fun g_date_valid(this : Void*) : LibC::Int
  fun g_date_valid_day(day : UInt8) : LibC::Int
  fun g_date_valid_day(day : UInt8) : LibC::Int
  fun g_date_valid_dmy(day : UInt8, month : UInt32, year : UInt16) : LibC::Int
  fun g_date_valid_dmy(day : UInt8, month : UInt32, year : UInt16) : LibC::Int
  fun g_date_valid_julian(julian_date : UInt32) : LibC::Int
  fun g_date_valid_julian(julian_date : UInt32) : LibC::Int
  fun g_date_valid_month(month : UInt32) : LibC::Int
  fun g_date_valid_month(month : UInt32) : LibC::Int
  fun g_date_valid_weekday(weekday : UInt32) : LibC::Int
  fun g_date_valid_weekday(weekday : UInt32) : LibC::Int
  fun g_date_valid_year(year : UInt16) : LibC::Int
  fun g_date_valid_year(year : UInt16) : LibC::Int
  fun g_dcgettext(domain : Pointer(LibC::Char), msgid : Pointer(LibC::Char), category : Int32) : Pointer(LibC::Char)
  fun g_dgettext(domain : Pointer(LibC::Char), msgid : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_dir_close(this : Void*) : Void
  fun g_dir_make_tmp(tmpl : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_dir_make_tmp(tmpl : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_dir_read_name(this : Void*) : Pointer(LibC::Char)
  fun g_dir_rewind(this : Void*) : Void
  fun g_direct_equal(v1 : Pointer(Void), v2 : Pointer(Void)) : LibC::Int
  fun g_direct_hash(v : Pointer(Void)) : UInt32
  fun g_dngettext(domain : Pointer(LibC::Char), msgid : Pointer(LibC::Char), msgid_plural : Pointer(LibC::Char), n : UInt64) : Pointer(LibC::Char)
  fun g_double_equal(v1 : Pointer(Void), v2 : Pointer(Void)) : LibC::Int
  fun g_double_hash(v : Pointer(Void)) : UInt32
  fun g_dpgettext(domain : Pointer(LibC::Char), msgctxtid : Pointer(LibC::Char), msgidoffset : UInt64) : Pointer(LibC::Char)
  fun g_dpgettext2(domain : Pointer(LibC::Char), context : Pointer(LibC::Char), msgid : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_environ_getenv(envp : Pointer(Pointer(LibC::Char)), variable : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_environ_setenv(envp : Pointer(Pointer(LibC::Char)), variable : Pointer(LibC::Char), value : Pointer(LibC::Char), overwrite : LibC::Int) : Pointer(Pointer(LibC::Char))
  fun g_environ_unsetenv(envp : Pointer(Pointer(LibC::Char)), variable : Pointer(LibC::Char)) : Pointer(Pointer(LibC::Char))
  fun g_error_copy(this : Void*) : Pointer(Void)
  fun g_error_free(this : Void*) : Void
  fun g_error_get_type : UInt64
  fun g_error_matches(this : Void*, domain : UInt32, code : Int32) : LibC::Int
  fun g_error_new_literal(domain : UInt32, code : Int32, message : Pointer(LibC::Char)) : Pointer(Void)
  fun g_file_error_from_errno(err_no : Int32) : UInt32
  fun g_file_error_quark : UInt32
  fun g_file_get_contents(filename : Pointer(LibC::Char), contents : Pointer(Pointer(UInt8)), length : Pointer(UInt64), error : LibGLib::Error**) : LibC::Int
  fun g_file_open_tmp(tmpl : Pointer(LibC::Char), name_used : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : Int32
  fun g_file_read_link(filename : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_file_set_contents(filename : Pointer(LibC::Char), contents : Pointer(UInt8), length : Int64, error : LibGLib::Error**) : LibC::Int
  fun g_file_set_contents_full(filename : Pointer(LibC::Char), contents : Pointer(UInt8), length : Int64, flags : UInt32, mode : Int32, error : LibGLib::Error**) : LibC::Int
  fun g_file_test(filename : Pointer(LibC::Char), test : UInt32) : LibC::Int
  fun g_filename_display_basename(filename : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_filename_display_name(filename : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_filename_from_uri(uri : Pointer(LibC::Char), hostname : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_filename_from_utf8(utf8string : Pointer(LibC::Char), len : Int64, bytes_read : Pointer(UInt64), bytes_written : Pointer(UInt64), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_filename_to_uri(filename : Pointer(LibC::Char), hostname : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_filename_to_utf8(opsysstring : Pointer(LibC::Char), len : Int64, bytes_read : Pointer(UInt64), bytes_written : Pointer(UInt64), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_find_program_in_path(program : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_format_size(size : UInt64) : Pointer(LibC::Char)
  fun g_format_size_for_display(size : Int64) : Pointer(LibC::Char)
  fun g_format_size_full(size : UInt64, flags : UInt32) : Pointer(LibC::Char)
  fun g_free(mem : Pointer(Void)) : Void
  fun g_get_application_name : Pointer(LibC::Char)
  fun g_get_charset(charset : Pointer(Pointer(LibC::Char))) : LibC::Int
  fun g_get_codeset : Pointer(LibC::Char)
  fun g_get_console_charset(charset : Pointer(Pointer(LibC::Char))) : LibC::Int
  fun g_get_current_dir : Pointer(LibC::Char)
  fun g_get_current_time(result : Pointer(Void)) : Void
  fun g_get_environ : Pointer(Pointer(LibC::Char))
  fun g_get_filename_charsets(filename_charsets : Pointer(Pointer(Pointer(LibC::Char)))) : LibC::Int
  fun g_get_home_dir : Pointer(LibC::Char)
  fun g_get_host_name : Pointer(LibC::Char)
  fun g_get_language_names : Pointer(Pointer(LibC::Char))
  fun g_get_language_names_with_category(category_name : Pointer(LibC::Char)) : Pointer(Pointer(LibC::Char))
  fun g_get_locale_variants(locale : Pointer(LibC::Char)) : Pointer(Pointer(LibC::Char))
  fun g_get_monotonic_time : Int64
  fun g_get_num_processors : UInt32
  fun g_get_os_info(key_name : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_get_prgname : Pointer(LibC::Char)
  fun g_get_real_name : Pointer(LibC::Char)
  fun g_get_real_time : Int64
  fun g_get_system_config_dirs : Pointer(Pointer(LibC::Char))
  fun g_get_system_data_dirs : Pointer(Pointer(LibC::Char))
  fun g_get_tmp_dir : Pointer(LibC::Char)
  fun g_get_user_cache_dir : Pointer(LibC::Char)
  fun g_get_user_config_dir : Pointer(LibC::Char)
  fun g_get_user_data_dir : Pointer(LibC::Char)
  fun g_get_user_name : Pointer(LibC::Char)
  fun g_get_user_runtime_dir : Pointer(LibC::Char)
  fun g_get_user_special_dir(directory : UInt32) : Pointer(LibC::Char)
  fun g_getenv(variable : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_gstring_get_type : UInt64
  fun g_hash_table_add(hash_table : Pointer(Void), key : Pointer(Void)) : LibC::Int
  fun g_hash_table_add(hash_table : Pointer(Void), key : Pointer(Void)) : LibC::Int
  fun g_hash_table_contains(hash_table : Pointer(Void), key : Pointer(Void)) : LibC::Int
  fun g_hash_table_contains(hash_table : Pointer(Void), key : Pointer(Void)) : LibC::Int
  fun g_hash_table_destroy(hash_table : Pointer(Void)) : Void
  fun g_hash_table_destroy(hash_table : Pointer(Void)) : Void
  fun g_hash_table_get_type : UInt64
  fun g_hash_table_insert(hash_table : Pointer(Void), key : Pointer(Void), value : Pointer(Void)) : LibC::Int
  fun g_hash_table_insert(hash_table : Pointer(Void), key : Pointer(Void), value : Pointer(Void)) : LibC::Int
  fun g_hash_table_iter_init(this : Void*, hash_table : Pointer(Void)) : Void
  fun g_hash_table_iter_next(this : Void*, key : Pointer(Pointer(Void)), value : Pointer(Pointer(Void))) : LibC::Int
  fun g_hash_table_iter_remove(this : Void*) : Void
  fun g_hash_table_iter_replace(this : Void*, value : Pointer(Void)) : Void
  fun g_hash_table_iter_steal(this : Void*) : Void
  fun g_hash_table_lookup(hash_table : Pointer(Void), key : Pointer(Void)) : Pointer(Void)
  fun g_hash_table_lookup(hash_table : Pointer(Void), key : Pointer(Void)) : Pointer(Void)
  fun g_hash_table_lookup_extended(hash_table : Pointer(Void), lookup_key : Pointer(Void), orig_key : Pointer(Pointer(Void)), value : Pointer(Pointer(Void))) : LibC::Int
  fun g_hash_table_lookup_extended(hash_table : Pointer(Void), lookup_key : Pointer(Void), orig_key : Pointer(Pointer(Void)), value : Pointer(Pointer(Void))) : LibC::Int
  fun g_hash_table_remove(hash_table : Pointer(Void), key : Pointer(Void)) : LibC::Int
  fun g_hash_table_remove(hash_table : Pointer(Void), key : Pointer(Void)) : LibC::Int
  fun g_hash_table_remove_all(hash_table : Pointer(Void)) : Void
  fun g_hash_table_remove_all(hash_table : Pointer(Void)) : Void
  fun g_hash_table_replace(hash_table : Pointer(Void), key : Pointer(Void), value : Pointer(Void)) : LibC::Int
  fun g_hash_table_replace(hash_table : Pointer(Void), key : Pointer(Void), value : Pointer(Void)) : LibC::Int
  fun g_hash_table_size(hash_table : Pointer(Void)) : UInt32
  fun g_hash_table_size(hash_table : Pointer(Void)) : UInt32
  fun g_hash_table_steal(hash_table : Pointer(Void), key : Pointer(Void)) : LibC::Int
  fun g_hash_table_steal(hash_table : Pointer(Void), key : Pointer(Void)) : LibC::Int
  fun g_hash_table_steal_all(hash_table : Pointer(Void)) : Void
  fun g_hash_table_steal_all(hash_table : Pointer(Void)) : Void
  fun g_hash_table_steal_extended(hash_table : Pointer(Void), lookup_key : Pointer(Void), stolen_key : Pointer(Pointer(Void)), stolen_value : Pointer(Pointer(Void))) : LibC::Int
  fun g_hash_table_steal_extended(hash_table : Pointer(Void), lookup_key : Pointer(Void), stolen_key : Pointer(Pointer(Void)), stolen_value : Pointer(Pointer(Void))) : LibC::Int
  fun g_hash_table_unref(hash_table : Pointer(Void)) : Void
  fun g_hash_table_unref(hash_table : Pointer(Void)) : Void
  fun g_hmac_get_digest(this : Void*, buffer : Pointer(UInt8), digest_len : Pointer(UInt64)) : Void
  fun g_hmac_get_string(this : Void*) : Pointer(LibC::Char)
  fun g_hmac_unref(this : Void*) : Void
  fun g_hmac_update(this : Void*, data : Pointer(UInt8), length : Int64) : Void
  fun g_hook_compare_ids(this : Void*, sibling : Pointer(Void)) : Int32
  fun g_hook_destroy(hook_list : Pointer(Void), hook_id : UInt64) : LibC::Int
  fun g_hook_destroy(hook_list : Pointer(Void), hook_id : UInt64) : LibC::Int
  fun g_hook_destroy_link(hook_list : Pointer(Void), hook : Pointer(Void)) : Void
  fun g_hook_destroy_link(hook_list : Pointer(Void), hook : Pointer(Void)) : Void
  fun g_hook_free(hook_list : Pointer(Void), hook : Pointer(Void)) : Void
  fun g_hook_free(hook_list : Pointer(Void), hook : Pointer(Void)) : Void
  fun g_hook_insert_before(hook_list : Pointer(Void), sibling : Pointer(Void), hook : Pointer(Void)) : Void
  fun g_hook_insert_before(hook_list : Pointer(Void), sibling : Pointer(Void), hook : Pointer(Void)) : Void
  fun g_hook_list_clear(this : Void*) : Void
  fun g_hook_list_init(this : Void*, hook_size : UInt32) : Void
  fun g_hook_list_invoke(this : Void*, may_recurse : LibC::Int) : Void
  fun g_hook_list_invoke_check(this : Void*, may_recurse : LibC::Int) : Void
  fun g_hook_prepend(hook_list : Pointer(Void), hook : Pointer(Void)) : Void
  fun g_hook_prepend(hook_list : Pointer(Void), hook : Pointer(Void)) : Void
  fun g_hook_unref(hook_list : Pointer(Void), hook : Pointer(Void)) : Void
  fun g_hook_unref(hook_list : Pointer(Void), hook : Pointer(Void)) : Void
  fun g_hostname_is_ascii_encoded(hostname : Pointer(LibC::Char)) : LibC::Int
  fun g_hostname_is_ip_address(hostname : Pointer(LibC::Char)) : LibC::Int
  fun g_hostname_is_non_ascii(hostname : Pointer(LibC::Char)) : LibC::Int
  fun g_hostname_to_ascii(hostname : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_hostname_to_unicode(hostname : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_idle_add_full(priority : Int32, function : Void*, data : Pointer(Void), notify : Void*) : UInt32
  fun g_idle_remove_by_data(data : Pointer(Void)) : LibC::Int
  fun g_idle_source_new : Pointer(Void)
  fun g_int64_equal(v1 : Pointer(Void), v2 : Pointer(Void)) : LibC::Int
  fun g_int64_hash(v : Pointer(Void)) : UInt32
  fun g_int_equal(v1 : Pointer(Void), v2 : Pointer(Void)) : LibC::Int
  fun g_int_hash(v : Pointer(Void)) : UInt32
  fun g_intern_static_string(string : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_intern_string(string : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_io_add_watch_full(channel : Pointer(Void), priority : Int32, condition : UInt32, func : Void*, user_data : Pointer(Void), notify : Void*) : UInt32
  fun g_io_channel_close(this : Void*) : Void
  fun g_io_channel_error_from_errno(en : Int32) : UInt32
  fun g_io_channel_error_from_errno(en : Int32) : UInt32
  fun g_io_channel_error_quark : UInt32
  fun g_io_channel_error_quark : UInt32
  fun g_io_channel_flush(this : Void*, error : LibGLib::Error**) : UInt32
  fun g_io_channel_get_buffer_condition(this : Void*) : UInt32
  fun g_io_channel_get_buffer_size(this : Void*) : UInt64
  fun g_io_channel_get_buffered(this : Void*) : LibC::Int
  fun g_io_channel_get_close_on_unref(this : Void*) : LibC::Int
  fun g_io_channel_get_encoding(this : Void*) : Pointer(LibC::Char)
  fun g_io_channel_get_flags(this : Void*) : UInt32
  fun g_io_channel_get_line_term(this : Void*, length : Pointer(Int32)) : Pointer(LibC::Char)
  fun g_io_channel_get_type : UInt64
  fun g_io_channel_init(this : Void*) : Void
  fun g_io_channel_new_file(filename : Pointer(LibC::Char), mode : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_io_channel_read(this : Void*, buf : Pointer(LibC::Char), count : UInt64, bytes_read : Pointer(UInt64)) : UInt32
  fun g_io_channel_read_chars(this : Void*, buf : Pointer(Pointer(UInt8)), count : UInt64, bytes_read : Pointer(UInt64), error : LibGLib::Error**) : UInt32
  fun g_io_channel_read_line(this : Void*, str_return : Pointer(Pointer(LibC::Char)), length : Pointer(UInt64), terminator_pos : Pointer(UInt64), error : LibGLib::Error**) : UInt32
  fun g_io_channel_read_line_string(this : Void*, buffer : Pointer(Void), terminator_pos : Pointer(UInt64), error : LibGLib::Error**) : UInt32
  fun g_io_channel_read_to_end(this : Void*, str_return : Pointer(Pointer(UInt8)), length : Pointer(UInt64), error : LibGLib::Error**) : UInt32
  fun g_io_channel_read_unichar(this : Void*, thechar : Pointer(UInt32), error : LibGLib::Error**) : UInt32
  fun g_io_channel_ref(this : Void*) : Pointer(Void)
  fun g_io_channel_seek(this : Void*, offset : Int64, type : UInt32) : UInt32
  fun g_io_channel_seek_position(this : Void*, offset : Int64, type : UInt32, error : LibGLib::Error**) : UInt32
  fun g_io_channel_set_buffer_size(this : Void*, size : UInt64) : Void
  fun g_io_channel_set_buffered(this : Void*, buffered : LibC::Int) : Void
  fun g_io_channel_set_close_on_unref(this : Void*, do_close : LibC::Int) : Void
  fun g_io_channel_set_encoding(this : Void*, encoding : Pointer(LibC::Char), error : LibGLib::Error**) : UInt32
  fun g_io_channel_set_flags(this : Void*, flags : UInt32, error : LibGLib::Error**) : UInt32
  fun g_io_channel_set_line_term(this : Void*, line_term : Pointer(LibC::Char), length : Int32) : Void
  fun g_io_channel_shutdown(this : Void*, flush : LibC::Int, error : LibGLib::Error**) : UInt32
  fun g_io_channel_unix_get_fd(this : Void*) : Int32
  fun g_io_channel_unix_new(fd : Int32) : Pointer(Void)
  fun g_io_channel_unref(this : Void*) : Void
  fun g_io_channel_write(this : Void*, buf : Pointer(LibC::Char), count : UInt64, bytes_written : Pointer(UInt64)) : UInt32
  fun g_io_channel_write_chars(this : Void*, buf : Pointer(UInt8), count : Int64, bytes_written : Pointer(UInt64), error : LibGLib::Error**) : UInt32
  fun g_io_channel_write_unichar(this : Void*, thechar : UInt32, error : LibGLib::Error**) : UInt32
  fun g_io_create_watch(channel : Pointer(Void), condition : UInt32) : Pointer(Void)
  fun g_key_file_error_quark : UInt32
  fun g_key_file_error_quark : UInt32
  fun g_key_file_get_boolean(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_key_file_get_boolean_list(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), length : Pointer(UInt64), error : LibGLib::Error**) : Pointer(LibC::Int)
  fun g_key_file_get_comment(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_key_file_get_double(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), error : LibGLib::Error**) : Float64
  fun g_key_file_get_double_list(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), length : Pointer(UInt64), error : LibGLib::Error**) : Pointer(Float64)
  fun g_key_file_get_groups(this : Void*, length : Pointer(UInt64)) : Pointer(Pointer(LibC::Char))
  fun g_key_file_get_int64(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), error : LibGLib::Error**) : Int64
  fun g_key_file_get_integer(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), error : LibGLib::Error**) : Int32
  fun g_key_file_get_integer_list(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), length : Pointer(UInt64), error : LibGLib::Error**) : Pointer(Int32)
  fun g_key_file_get_keys(this : Void*, group_name : Pointer(LibC::Char), length : Pointer(UInt64), error : LibGLib::Error**) : Pointer(Pointer(LibC::Char))
  fun g_key_file_get_locale_for_key(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), locale : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_key_file_get_locale_string(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), locale : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_key_file_get_locale_string_list(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), locale : Pointer(LibC::Char), length : Pointer(UInt64), error : LibGLib::Error**) : Pointer(Pointer(LibC::Char))
  fun g_key_file_get_start_group(this : Void*) : Pointer(LibC::Char)
  fun g_key_file_get_string(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_key_file_get_string_list(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), length : Pointer(UInt64), error : LibGLib::Error**) : Pointer(Pointer(LibC::Char))
  fun g_key_file_get_type : UInt64
  fun g_key_file_get_uint64(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), error : LibGLib::Error**) : UInt64
  fun g_key_file_get_value(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_key_file_has_group(this : Void*, group_name : Pointer(LibC::Char)) : LibC::Int
  fun g_key_file_load_from_bytes(this : Void*, bytes : Pointer(Void), flags : UInt32, error : LibGLib::Error**) : LibC::Int
  fun g_key_file_load_from_data(this : Void*, data : Pointer(LibC::Char), length : UInt64, flags : UInt32, error : LibGLib::Error**) : LibC::Int
  fun g_key_file_load_from_data_dirs(this : Void*, file : Pointer(LibC::Char), full_path : Pointer(Pointer(LibC::Char)), flags : UInt32, error : LibGLib::Error**) : LibC::Int
  fun g_key_file_load_from_dirs(this : Void*, file : Pointer(LibC::Char), search_dirs : Pointer(Pointer(LibC::Char)), full_path : Pointer(Pointer(LibC::Char)), flags : UInt32, error : LibGLib::Error**) : LibC::Int
  fun g_key_file_load_from_file(this : Void*, file : Pointer(LibC::Char), flags : UInt32, error : LibGLib::Error**) : LibC::Int
  fun g_key_file_new : Pointer(Void)
  fun g_key_file_remove_comment(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_key_file_remove_group(this : Void*, group_name : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_key_file_remove_key(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_key_file_save_to_file(this : Void*, filename : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_key_file_set_boolean(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), value : LibC::Int) : Void
  fun g_key_file_set_boolean_list(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), list : Pointer(LibC::Int), length : UInt64) : Void
  fun g_key_file_set_comment(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), comment : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_key_file_set_double(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), value : Float64) : Void
  fun g_key_file_set_double_list(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), list : Pointer(Float64), length : UInt64) : Void
  fun g_key_file_set_int64(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), value : Int64) : Void
  fun g_key_file_set_integer(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), value : Int32) : Void
  fun g_key_file_set_integer_list(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), list : Pointer(Int32), length : UInt64) : Void
  fun g_key_file_set_list_separator(this : Void*, separator : Int8) : Void
  fun g_key_file_set_locale_string(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), locale : Pointer(LibC::Char), string : Pointer(LibC::Char)) : Void
  fun g_key_file_set_locale_string_list(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), locale : Pointer(LibC::Char), list : Pointer(Pointer(LibC::Char)), length : UInt64) : Void
  fun g_key_file_set_string(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), string : Pointer(LibC::Char)) : Void
  fun g_key_file_set_string_list(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), list : Pointer(Pointer(LibC::Char)), length : UInt64) : Void
  fun g_key_file_set_uint64(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), value : UInt64) : Void
  fun g_key_file_set_value(this : Void*, group_name : Pointer(LibC::Char), key : Pointer(LibC::Char), value : Pointer(LibC::Char)) : Void
  fun g_key_file_to_data(this : Void*, length : Pointer(UInt64), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_key_file_unref(this : Void*) : Void
  fun g_listenv : Pointer(Pointer(LibC::Char))
  fun g_locale_from_utf8(utf8string : Pointer(LibC::Char), len : Int64, bytes_read : Pointer(UInt64), bytes_written : Pointer(UInt64), error : LibGLib::Error**) : Pointer(UInt8)
  fun g_locale_to_utf8(opsysstring : Pointer(UInt8), len : Int64, bytes_read : Pointer(UInt64), bytes_written : Pointer(UInt64), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_log_default_handler(log_domain : Pointer(LibC::Char), log_level : Int32, message : Pointer(LibC::Char), unused_data : Pointer(Void)) : Void
  fun g_log_remove_handler(log_domain : Pointer(LibC::Char), handler_id : UInt32) : Void
  fun g_log_set_always_fatal(fatal_mask : Int32) : Int32
  fun g_log_set_fatal_mask(log_domain : Pointer(LibC::Char), fatal_mask : Int32) : Int32
  fun g_log_set_handler_full(log_domain : Pointer(LibC::Char), log_levels : Int32, log_func : Void*, user_data : Pointer(Void), destroy : Void*) : UInt32
  fun g_log_set_writer_func(func : Void*, user_data : Pointer(Void), user_data_free : Void*) : Void
  fun g_log_structured_array(log_level : Int32, fields : Pointer(Void), n_fields : UInt64) : Void
  fun g_log_variant(log_domain : Pointer(LibC::Char), log_level : Int32, fields : Pointer(Void)) : Void
  fun g_log_writer_default(log_level : Int32, fields : Pointer(Void), n_fields : UInt64, user_data : Pointer(Void)) : UInt32
  fun g_log_writer_default_set_use_stderr(use_stderr : LibC::Int) : Void
  fun g_log_writer_default_would_drop(log_level : Int32, log_domain : Pointer(LibC::Char)) : LibC::Int
  fun g_log_writer_format_fields(log_level : Int32, fields : Pointer(Void), n_fields : UInt64, use_color : LibC::Int) : Pointer(LibC::Char)
  fun g_log_writer_is_journald(output_fd : Int32) : LibC::Int
  fun g_log_writer_journald(log_level : Int32, fields : Pointer(Void), n_fields : UInt64, user_data : Pointer(Void)) : UInt32
  fun g_log_writer_standard_streams(log_level : Int32, fields : Pointer(Void), n_fields : UInt64, user_data : Pointer(Void)) : UInt32
  fun g_log_writer_supports_color(output_fd : Int32) : LibC::Int
  fun g_main_context_acquire(this : Void*) : LibC::Int
  fun g_main_context_add_poll(this : Void*, fd : Pointer(Void), priority : Int32) : Void
  fun g_main_context_check(this : Void*, max_priority : Int32, fds : Pointer(Void), n_fds : Int32) : LibC::Int
  fun g_main_context_default : Pointer(Void)
  fun g_main_context_default : Pointer(Void)
  fun g_main_context_dispatch(this : Void*) : Void
  fun g_main_context_find_source_by_funcs_user_data(this : Void*, funcs : Pointer(Void), user_data : Pointer(Void)) : Pointer(Void)
  fun g_main_context_find_source_by_id(this : Void*, source_id : UInt32) : Pointer(Void)
  fun g_main_context_find_source_by_user_data(this : Void*, user_data : Pointer(Void)) : Pointer(Void)
  fun g_main_context_get_thread_default : Pointer(Void)
  fun g_main_context_get_thread_default : Pointer(Void)
  fun g_main_context_get_type : UInt64
  @[Raises]
  fun g_main_context_invoke_full(this : Void*, priority : Int32, function : Void*, data : Pointer(Void), notify : Void*) : Void
  fun g_main_context_is_owner(this : Void*) : LibC::Int
  fun g_main_context_iteration(this : Void*, may_block : LibC::Int) : LibC::Int
  fun g_main_context_new : Pointer(Void)
  fun g_main_context_pending(this : Void*) : LibC::Int
  fun g_main_context_pop_thread_default(this : Void*) : Void
  fun g_main_context_prepare(this : Void*, priority : Pointer(Int32)) : LibC::Int
  fun g_main_context_push_thread_default(this : Void*) : Void
  fun g_main_context_query(this : Void*, max_priority : Int32, timeout_ : Pointer(Int32), fds : Pointer(Pointer(Void)), n_fds : Int32) : Int32
  fun g_main_context_ref(this : Void*) : Pointer(Void)
  fun g_main_context_ref_thread_default : Pointer(Void)
  fun g_main_context_ref_thread_default : Pointer(Void)
  fun g_main_context_release(this : Void*) : Void
  fun g_main_context_remove_poll(this : Void*, fd : Pointer(Void)) : Void
  fun g_main_context_unref(this : Void*) : Void
  fun g_main_context_wait(this : Void*, cond : Pointer(Void), mutex : Pointer(Mutex)) : LibC::Int
  fun g_main_context_wakeup(this : Void*) : Void
  fun g_main_current_source : Pointer(Void)
  fun g_main_depth : Int32
  fun g_main_loop_get_context(this : Void*) : Pointer(Void)
  fun g_main_loop_get_type : UInt64
  fun g_main_loop_is_running(this : Void*) : LibC::Int
  fun g_main_loop_new(context : Pointer(Void), is_running : LibC::Int) : Pointer(Void)
  fun g_main_loop_quit(this : Void*) : Void
  fun g_main_loop_ref(this : Void*) : Pointer(Void)
  @[Raises]
  fun g_main_loop_run(this : Void*) : Void
  fun g_main_loop_unref(this : Void*) : Void
  fun g_malloc(n_bytes : UInt64) : Pointer(Void)
  fun g_malloc0(n_bytes : UInt64) : Pointer(Void)
  fun g_malloc0_n(n_blocks : UInt64, n_block_bytes : UInt64) : Pointer(Void)
  fun g_malloc_n(n_blocks : UInt64, n_block_bytes : UInt64) : Pointer(Void)
  fun g_mapped_file_free(this : Void*) : Void
  fun g_mapped_file_get_bytes(this : Void*) : Pointer(Void)
  fun g_mapped_file_get_contents(this : Void*) : Pointer(LibC::Char)
  fun g_mapped_file_get_length(this : Void*) : UInt64
  fun g_mapped_file_get_type : UInt64
  fun g_mapped_file_new(filename : Pointer(LibC::Char), writable : LibC::Int, error : LibGLib::Error**) : Pointer(Void)
  fun g_mapped_file_new_from_fd(fd : Int32, writable : LibC::Int, error : LibGLib::Error**) : Pointer(Void)
  fun g_mapped_file_ref(this : Void*) : Pointer(Void)
  fun g_mapped_file_unref(this : Void*) : Void
  fun g_markup_error_quark : UInt32
  fun g_markup_escape_text(text : Pointer(LibC::Char), length : Int64) : Pointer(LibC::Char)
  fun g_markup_parse_context_end_parse(this : Void*, error : LibGLib::Error**) : LibC::Int
  fun g_markup_parse_context_free(this : Void*) : Void
  fun g_markup_parse_context_get_element(this : Void*) : Pointer(LibC::Char)
  fun g_markup_parse_context_get_position(this : Void*, line_number : Pointer(Int32), char_number : Pointer(Int32)) : Void
  fun g_markup_parse_context_get_type : UInt64
  fun g_markup_parse_context_get_user_data(this : Void*) : Pointer(Void)
  fun g_markup_parse_context_new(parser : Pointer(Void), flags : UInt32, user_data : Pointer(Void), user_data_dnotify : Void*) : Pointer(Void)
  fun g_markup_parse_context_parse(this : Void*, text : Pointer(LibC::Char), text_len : Int64, error : LibGLib::Error**) : LibC::Int
  fun g_markup_parse_context_pop(this : Void*) : Pointer(Void)
  fun g_markup_parse_context_push(this : Void*, parser : Pointer(Void), user_data : Pointer(Void)) : Void
  fun g_markup_parse_context_ref(this : Void*) : Pointer(Void)
  fun g_markup_parse_context_unref(this : Void*) : Void
  fun g_match_info_expand_references(this : Void*, string_to_expand : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_match_info_fetch(this : Void*, match_num : Int32) : Pointer(LibC::Char)
  fun g_match_info_fetch_all(this : Void*) : Pointer(Pointer(LibC::Char))
  fun g_match_info_fetch_named(this : Void*, name : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_match_info_fetch_named_pos(this : Void*, name : Pointer(LibC::Char), start_pos : Pointer(Int32), end_pos : Pointer(Int32)) : LibC::Int
  fun g_match_info_fetch_pos(this : Void*, match_num : Int32, start_pos : Pointer(Int32), end_pos : Pointer(Int32)) : LibC::Int
  fun g_match_info_free(this : Void*) : Void
  fun g_match_info_get_match_count(this : Void*) : Int32
  fun g_match_info_get_regex(this : Void*) : Pointer(Void)
  fun g_match_info_get_string(this : Void*) : Pointer(LibC::Char)
  fun g_match_info_get_type : UInt64
  fun g_match_info_is_partial_match(this : Void*) : LibC::Int
  fun g_match_info_matches(this : Void*) : LibC::Int
  fun g_match_info_next(this : Void*, error : LibGLib::Error**) : LibC::Int
  fun g_match_info_ref(this : Void*) : Pointer(Void)
  fun g_match_info_unref(this : Void*) : Void
  fun g_mem_is_system_malloc : LibC::Int
  fun g_mem_profile : Void
  fun g_mem_set_vtable(vtable : Pointer(Void)) : Void
  fun g_memdup(mem : Pointer(Void), byte_size : UInt32) : Pointer(Void)
  fun g_memdup2(mem : Pointer(Void), byte_size : UInt64) : Pointer(Void)
  fun g_mkdir_with_parents(pathname : Pointer(LibC::Char), mode : Int32) : Int32
  fun g_node_child_index(this : Void*, data : Pointer(Void)) : Int32
  fun g_node_child_position(this : Void*, child : Pointer(Void)) : Int32
  fun g_node_depth(this : Void*) : UInt32
  fun g_node_destroy(this : Void*) : Void
  fun g_node_is_ancestor(this : Void*, descendant : Pointer(Void)) : LibC::Int
  fun g_node_max_height(this : Void*) : UInt32
  fun g_node_n_children(this : Void*) : UInt32
  fun g_node_n_nodes(this : Void*, flags : UInt32) : UInt32
  fun g_node_reverse_children(this : Void*) : Void
  fun g_node_unlink(this : Void*) : Void
  fun g_nullify_pointer(nullify_location : Pointer(Void)) : Void
  fun g_number_parser_error_quark : UInt32
  fun g_on_error_query(prg_name : Pointer(LibC::Char)) : Void
  fun g_on_error_stack_trace(prg_name : Pointer(LibC::Char)) : Void
  fun g_once_init_enter(location : Pointer(Void)) : LibC::Int
  fun g_once_init_enter(location : Pointer(Void)) : LibC::Int
  fun g_once_init_leave(location : Pointer(Void), result : UInt64) : Void
  fun g_once_init_leave(location : Pointer(Void), result : UInt64) : Void
  fun g_option_context_add_group(this : Void*, group : Pointer(Void)) : Void
  fun g_option_context_add_main_entries(this : Void*, entries : Pointer(Void), translation_domain : Pointer(LibC::Char)) : Void
  fun g_option_context_free(this : Void*) : Void
  fun g_option_context_get_description(this : Void*) : Pointer(LibC::Char)
  fun g_option_context_get_help(this : Void*, main_help : LibC::Int, group : Pointer(Void)) : Pointer(LibC::Char)
  fun g_option_context_get_help_enabled(this : Void*) : LibC::Int
  fun g_option_context_get_ignore_unknown_options(this : Void*) : LibC::Int
  fun g_option_context_get_main_group(this : Void*) : Pointer(Void)
  fun g_option_context_get_strict_posix(this : Void*) : LibC::Int
  fun g_option_context_get_summary(this : Void*) : Pointer(LibC::Char)
  fun g_option_context_parse(this : Void*, argc : Pointer(Int32), argv : Pointer(Pointer(Pointer(LibC::Char))), error : LibGLib::Error**) : LibC::Int
  fun g_option_context_parse_strv(this : Void*, arguments : Pointer(Pointer(Pointer(LibC::Char))), error : LibGLib::Error**) : LibC::Int
  fun g_option_context_set_description(this : Void*, description : Pointer(LibC::Char)) : Void
  fun g_option_context_set_help_enabled(this : Void*, help_enabled : LibC::Int) : Void
  fun g_option_context_set_ignore_unknown_options(this : Void*, ignore_unknown : LibC::Int) : Void
  fun g_option_context_set_main_group(this : Void*, group : Pointer(Void)) : Void
  fun g_option_context_set_strict_posix(this : Void*, strict_posix : LibC::Int) : Void
  fun g_option_context_set_summary(this : Void*, summary : Pointer(LibC::Char)) : Void
  fun g_option_context_set_translate_func(this : Void*, func : Void*, data : Pointer(Void), destroy_notify : Void*) : Void
  fun g_option_context_set_translation_domain(this : Void*, domain : Pointer(LibC::Char)) : Void
  fun g_option_error_quark : UInt32
  fun g_option_group_add_entries(this : Void*, entries : Pointer(Void)) : Void
  fun g_option_group_free(this : Void*) : Void
  fun g_option_group_get_type : UInt64
  fun g_option_group_new(name : Pointer(LibC::Char), description : Pointer(LibC::Char), help_description : Pointer(LibC::Char), user_data : Pointer(Void), destroy : Void*) : Pointer(Void)
  fun g_option_group_ref(this : Void*) : Pointer(Void)
  fun g_option_group_set_translate_func(this : Void*, func : Void*, data : Pointer(Void), destroy_notify : Void*) : Void
  fun g_option_group_set_translation_domain(this : Void*, domain : Pointer(LibC::Char)) : Void
  fun g_option_group_unref(this : Void*) : Void
  fun g_parse_debug_string(string : Pointer(LibC::Char), keys : Pointer(Void), nkeys : UInt32) : UInt32
  fun g_path_get_basename(file_name : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_path_get_dirname(file_name : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_path_is_absolute(file_name : Pointer(LibC::Char)) : LibC::Int
  fun g_path_skip_root(file_name : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_pattern_match_simple(pattern : Pointer(LibC::Char), string : Pointer(LibC::Char)) : LibC::Int
  fun g_pattern_spec_copy(this : Void*) : Pointer(Void)
  fun g_pattern_spec_equal(this : Void*, pspec2 : Pointer(Void)) : LibC::Int
  fun g_pattern_spec_free(this : Void*) : Void
  fun g_pattern_spec_get_type : UInt64
  fun g_pattern_spec_match(this : Void*, string_length : UInt64, string : Pointer(LibC::Char), string_reversed : Pointer(LibC::Char)) : LibC::Int
  fun g_pattern_spec_match_string(this : Void*, string : Pointer(LibC::Char)) : LibC::Int
  fun g_pattern_spec_new(pattern : Pointer(LibC::Char)) : Pointer(Void)
  fun g_pointer_bit_lock(address : Pointer(Void), lock_bit : Int32) : Void
  fun g_pointer_bit_trylock(address : Pointer(Void), lock_bit : Int32) : LibC::Int
  fun g_pointer_bit_unlock(address : Pointer(Void), lock_bit : Int32) : Void
  fun g_poll(fds : Pointer(Void), nfds : UInt32, timeout : Int32) : Int32
  fun g_pollfd_get_type : UInt64
  fun g_prefix_error_literal(err : Pointer(Void), prefix : Pointer(LibC::Char)) : Void
  fun g_private_get(this : Void*) : Pointer(Void)
  fun g_private_replace(this : Void*, value : Pointer(Void)) : Void
  fun g_private_set(this : Void*, value : Pointer(Void)) : Void
  fun g_propagate_error(dest : Pointer(Pointer(Void)), src : Pointer(Void)) : Void
  fun g_ptr_array_get_type : UInt64
  fun g_quark_from_static_string(string : Pointer(LibC::Char)) : UInt32
  fun g_quark_from_string(string : Pointer(LibC::Char)) : UInt32
  fun g_quark_to_string(quark : UInt32) : Pointer(LibC::Char)
  fun g_quark_try_string(string : Pointer(LibC::Char)) : UInt32
  fun g_queue_clear(this : Void*) : Void
  fun g_queue_clear_full(this : Void*, free_func : Void*) : Void
  fun g_queue_free(this : Void*) : Void
  fun g_queue_free_full(this : Void*, free_func : Void*) : Void
  fun g_queue_get_length(this : Void*) : UInt32
  fun g_queue_index(this : Void*, data : Pointer(Void)) : Int32
  fun g_queue_init(this : Void*) : Void
  fun g_queue_is_empty(this : Void*) : LibC::Int
  fun g_queue_peek_head(this : Void*) : Pointer(Void)
  fun g_queue_peek_nth(this : Void*, n : UInt32) : Pointer(Void)
  fun g_queue_peek_tail(this : Void*) : Pointer(Void)
  fun g_queue_pop_head(this : Void*) : Pointer(Void)
  fun g_queue_pop_nth(this : Void*, n : UInt32) : Pointer(Void)
  fun g_queue_pop_tail(this : Void*) : Pointer(Void)
  fun g_queue_push_head(this : Void*, data : Pointer(Void)) : Void
  fun g_queue_push_nth(this : Void*, data : Pointer(Void), n : Int32) : Void
  fun g_queue_push_tail(this : Void*, data : Pointer(Void)) : Void
  fun g_queue_remove(this : Void*, data : Pointer(Void)) : LibC::Int
  fun g_queue_remove_all(this : Void*, data : Pointer(Void)) : UInt32
  fun g_queue_reverse(this : Void*) : Void
  fun g_rand_double(this : Void*) : Float64
  fun g_rand_double_range(this : Void*, _begin : Float64, _end : Float64) : Float64
  fun g_rand_free(this : Void*) : Void
  fun g_rand_int(this : Void*) : UInt32
  fun g_rand_int_range(this : Void*, _begin : Int32, _end : Int32) : Int32
  fun g_rand_set_seed(this : Void*, seed : UInt32) : Void
  fun g_rand_set_seed_array(this : Void*, seed : Pointer(UInt32), seed_length : UInt32) : Void
  fun g_random_double : Float64
  fun g_random_double_range(_begin : Float64, _end : Float64) : Float64
  fun g_random_int : UInt32
  fun g_random_int_range(_begin : Int32, _end : Int32) : Int32
  fun g_random_set_seed(seed : UInt32) : Void
  fun g_rc_box_acquire(mem_block : Pointer(Void)) : Pointer(Void)
  fun g_rc_box_alloc(block_size : UInt64) : Pointer(Void)
  fun g_rc_box_alloc0(block_size : UInt64) : Pointer(Void)
  fun g_rc_box_dup(block_size : UInt64, mem_block : Pointer(Void)) : Pointer(Void)
  fun g_rc_box_get_size(mem_block : Pointer(Void)) : UInt64
  fun g_rc_box_release(mem_block : Pointer(Void)) : Void
  fun g_rc_box_release_full(mem_block : Pointer(Void), clear_func : Void*) : Void
  fun g_realloc(mem : Pointer(Void), n_bytes : UInt64) : Pointer(Void)
  fun g_realloc_n(mem : Pointer(Void), n_blocks : UInt64, n_block_bytes : UInt64) : Pointer(Void)
  fun g_rec_mutex_clear(this : Void*) : Void
  fun g_rec_mutex_init(this : Void*) : Void
  fun g_rec_mutex_lock(this : Void*) : Void
  fun g_rec_mutex_trylock(this : Void*) : LibC::Int
  fun g_rec_mutex_unlock(this : Void*) : Void
  fun g_ref_count_compare(rc : Pointer(Int32), val : Int32) : LibC::Int
  fun g_ref_count_dec(rc : Pointer(Int32)) : LibC::Int
  fun g_ref_count_inc(rc : Pointer(Int32)) : Void
  fun g_ref_count_init(rc : Pointer(Int32)) : Void
  fun g_ref_string_acquire(str : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_ref_string_length(str : Pointer(LibC::Char)) : UInt64
  fun g_ref_string_new(str : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_ref_string_new_intern(str : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_ref_string_new_len(str : Pointer(LibC::Char), len : Int64) : Pointer(LibC::Char)
  fun g_ref_string_release(str : Pointer(LibC::Char)) : Void
  fun g_regex_check_replacement(replacement : Pointer(LibC::Char), has_references : Pointer(LibC::Int), error : LibGLib::Error**) : LibC::Int
  fun g_regex_check_replacement(replacement : Pointer(LibC::Char), has_references : Pointer(LibC::Int), error : LibGLib::Error**) : LibC::Int
  fun g_regex_error_quark : UInt32
  fun g_regex_error_quark : UInt32
  fun g_regex_escape_nul(string : Pointer(LibC::Char), length : Int32) : Pointer(LibC::Char)
  fun g_regex_escape_nul(string : Pointer(LibC::Char), length : Int32) : Pointer(LibC::Char)
  fun g_regex_escape_string(string : Pointer(Pointer(LibC::Char)), length : Int32) : Pointer(LibC::Char)
  fun g_regex_escape_string(string : Pointer(Pointer(LibC::Char)), length : Int32) : Pointer(LibC::Char)
  fun g_regex_get_capture_count(this : Void*) : Int32
  fun g_regex_get_compile_flags(this : Void*) : UInt32
  fun g_regex_get_has_cr_or_lf(this : Void*) : LibC::Int
  fun g_regex_get_match_flags(this : Void*) : UInt32
  fun g_regex_get_max_backref(this : Void*) : Int32
  fun g_regex_get_max_lookbehind(this : Void*) : Int32
  fun g_regex_get_pattern(this : Void*) : Pointer(LibC::Char)
  fun g_regex_get_string_number(this : Void*, name : Pointer(LibC::Char)) : Int32
  fun g_regex_get_type : UInt64
  fun g_regex_match(this : Void*, string : Pointer(LibC::Char), match_options : UInt32, match_info : Pointer(Pointer(Void))) : LibC::Int
  fun g_regex_match_all(this : Void*, string : Pointer(LibC::Char), match_options : UInt32, match_info : Pointer(Pointer(Void))) : LibC::Int
  fun g_regex_match_all_full(this : Void*, string : Pointer(Pointer(LibC::Char)), string_len : Int64, start_position : Int32, match_options : UInt32, match_info : Pointer(Pointer(Void)), error : LibGLib::Error**) : LibC::Int
  fun g_regex_match_full(this : Void*, string : Pointer(Pointer(LibC::Char)), string_len : Int64, start_position : Int32, match_options : UInt32, match_info : Pointer(Pointer(Void)), error : LibGLib::Error**) : LibC::Int
  fun g_regex_match_simple(pattern : Pointer(LibC::Char), string : Pointer(LibC::Char), compile_options : UInt32, match_options : UInt32) : LibC::Int
  fun g_regex_match_simple(pattern : Pointer(LibC::Char), string : Pointer(LibC::Char), compile_options : UInt32, match_options : UInt32) : LibC::Int
  fun g_regex_new(pattern : Pointer(LibC::Char), compile_options : UInt32, match_options : UInt32, error : LibGLib::Error**) : Pointer(Void)
  fun g_regex_ref(this : Void*) : Pointer(Void)
  fun g_regex_replace(this : Void*, string : Pointer(Pointer(LibC::Char)), string_len : Int64, start_position : Int32, replacement : Pointer(LibC::Char), match_options : UInt32, error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_regex_replace_literal(this : Void*, string : Pointer(Pointer(LibC::Char)), string_len : Int64, start_position : Int32, replacement : Pointer(LibC::Char), match_options : UInt32, error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_regex_split(this : Void*, string : Pointer(LibC::Char), match_options : UInt32) : Pointer(Pointer(LibC::Char))
  fun g_regex_split_full(this : Void*, string : Pointer(Pointer(LibC::Char)), string_len : Int64, start_position : Int32, match_options : UInt32, max_tokens : Int32, error : LibGLib::Error**) : Pointer(Pointer(LibC::Char))
  fun g_regex_split_simple(pattern : Pointer(LibC::Char), string : Pointer(LibC::Char), compile_options : UInt32, match_options : UInt32) : Pointer(Pointer(LibC::Char))
  fun g_regex_split_simple(pattern : Pointer(LibC::Char), string : Pointer(LibC::Char), compile_options : UInt32, match_options : UInt32) : Pointer(Pointer(LibC::Char))
  fun g_regex_unref(this : Void*) : Void
  fun g_reload_user_special_dirs_cache : Void
  fun g_rmdir(filename : Pointer(LibC::Char)) : Int32
  fun g_rw_lock_clear(this : Void*) : Void
  fun g_rw_lock_init(this : Void*) : Void
  fun g_rw_lock_reader_lock(this : Void*) : Void
  fun g_rw_lock_reader_trylock(this : Void*) : LibC::Int
  fun g_rw_lock_reader_unlock(this : Void*) : Void
  fun g_rw_lock_writer_lock(this : Void*) : Void
  fun g_rw_lock_writer_trylock(this : Void*) : LibC::Int
  fun g_rw_lock_writer_unlock(this : Void*) : Void
  fun g_scanner_cur_line(this : Void*) : UInt32
  fun g_scanner_cur_position(this : Void*) : UInt32
  fun g_scanner_cur_token(this : Void*) : UInt32
  fun g_scanner_destroy(this : Void*) : Void
  fun g_scanner_eof(this : Void*) : LibC::Int
  fun g_scanner_get_next_token(this : Void*) : UInt32
  fun g_scanner_input_file(this : Void*, input_fd : Int32) : Void
  fun g_scanner_input_text(this : Void*, text : Pointer(LibC::Char), text_len : UInt32) : Void
  fun g_scanner_lookup_symbol(this : Void*, symbol : Pointer(LibC::Char)) : Pointer(Void)
  fun g_scanner_peek_next_token(this : Void*) : UInt32
  fun g_scanner_scope_add_symbol(this : Void*, scope_id : UInt32, symbol : Pointer(LibC::Char), value : Pointer(Void)) : Void
  fun g_scanner_scope_lookup_symbol(this : Void*, scope_id : UInt32, symbol : Pointer(LibC::Char)) : Pointer(Void)
  fun g_scanner_scope_remove_symbol(this : Void*, scope_id : UInt32, symbol : Pointer(LibC::Char)) : Void
  fun g_scanner_set_scope(this : Void*, scope_id : UInt32) : UInt32
  fun g_scanner_sync_file_offset(this : Void*) : Void
  fun g_scanner_unexp_token(this : Void*, expected_token : UInt32, identifier_spec : Pointer(LibC::Char), symbol_spec : Pointer(LibC::Char), symbol_name : Pointer(LibC::Char), message : Pointer(LibC::Char), is_error : Int32) : Void
  fun g_sequence_append(this : Void*, data : Pointer(Void)) : Pointer(Void)
  fun g_sequence_free(this : Void*) : Void
  fun g_sequence_get(iter : Pointer(Void)) : Pointer(Void)
  fun g_sequence_get(iter : Pointer(Void)) : Pointer(Void)
  fun g_sequence_get_begin_iter(this : Void*) : Pointer(Void)
  fun g_sequence_get_end_iter(this : Void*) : Pointer(Void)
  fun g_sequence_get_iter_at_pos(this : Void*, pos : Int32) : Pointer(Void)
  fun g_sequence_get_length(this : Void*) : Int32
  fun g_sequence_insert_before(iter : Pointer(Void), data : Pointer(Void)) : Pointer(Void)
  fun g_sequence_insert_before(iter : Pointer(Void), data : Pointer(Void)) : Pointer(Void)
  fun g_sequence_is_empty(this : Void*) : LibC::Int
  fun g_sequence_iter_compare(this : Void*, b : Pointer(Void)) : Int32
  fun g_sequence_iter_get_position(this : Void*) : Int32
  fun g_sequence_iter_get_sequence(this : Void*) : Pointer(Void)
  fun g_sequence_iter_is_begin(this : Void*) : LibC::Int
  fun g_sequence_iter_is_end(this : Void*) : LibC::Int
  fun g_sequence_iter_move(this : Void*, delta : Int32) : Pointer(Void)
  fun g_sequence_iter_next(this : Void*) : Pointer(Void)
  fun g_sequence_iter_prev(this : Void*) : Pointer(Void)
  fun g_sequence_move(src : Pointer(Void), dest : Pointer(Void)) : Void
  fun g_sequence_move(src : Pointer(Void), dest : Pointer(Void)) : Void
  fun g_sequence_move_range(dest : Pointer(Void), _begin : Pointer(Void), _end : Pointer(Void)) : Void
  fun g_sequence_move_range(dest : Pointer(Void), _begin : Pointer(Void), _end : Pointer(Void)) : Void
  fun g_sequence_prepend(this : Void*, data : Pointer(Void)) : Pointer(Void)
  fun g_sequence_range_get_midpoint(_begin : Pointer(Void), _end : Pointer(Void)) : Pointer(Void)
  fun g_sequence_range_get_midpoint(_begin : Pointer(Void), _end : Pointer(Void)) : Pointer(Void)
  fun g_sequence_remove(iter : Pointer(Void)) : Void
  fun g_sequence_remove(iter : Pointer(Void)) : Void
  fun g_sequence_remove_range(_begin : Pointer(Void), _end : Pointer(Void)) : Void
  fun g_sequence_remove_range(_begin : Pointer(Void), _end : Pointer(Void)) : Void
  fun g_sequence_set(iter : Pointer(Void), data : Pointer(Void)) : Void
  fun g_sequence_set(iter : Pointer(Void), data : Pointer(Void)) : Void
  fun g_sequence_swap(a : Pointer(Void), b : Pointer(Void)) : Void
  fun g_sequence_swap(a : Pointer(Void), b : Pointer(Void)) : Void
  fun g_set_application_name(application_name : Pointer(LibC::Char)) : Void
  fun g_set_error_literal(err : Pointer(Pointer(Void)), domain : UInt32, code : Int32, message : Pointer(LibC::Char)) : Void
  fun g_set_prgname(prgname : Pointer(LibC::Char)) : Void
  fun g_setenv(variable : Pointer(LibC::Char), value : Pointer(LibC::Char), overwrite : LibC::Int) : LibC::Int
  fun g_shell_error_quark : UInt32
  fun g_shell_parse_argv(command_line : Pointer(LibC::Char), argcp : Pointer(Int32), argvp : Pointer(Pointer(Pointer(LibC::Char))), error : LibGLib::Error**) : LibC::Int
  fun g_shell_quote(unquoted_string : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_shell_unquote(quoted_string : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_slice_alloc(block_size : UInt64) : Pointer(Void)
  fun g_slice_alloc0(block_size : UInt64) : Pointer(Void)
  fun g_slice_copy(block_size : UInt64, mem_block : Pointer(Void)) : Pointer(Void)
  fun g_slice_free1(block_size : UInt64, mem_block : Pointer(Void)) : Void
  fun g_slice_free_chain_with_offset(block_size : UInt64, mem_chain : Pointer(Void), next_offset : UInt64) : Void
  fun g_slice_get_config(ckey : UInt32) : Int64
  fun g_slice_get_config_state(ckey : UInt32, address : Int64, n_values : Pointer(UInt32)) : Pointer(Int64)
  fun g_slice_set_config(ckey : UInt32, value : Int64) : Void
  fun g_source_add_child_source(this : Void*, child_source : Pointer(Void)) : Void
  fun g_source_add_poll(this : Void*, fd : Pointer(Void)) : Void
  fun g_source_add_unix_fd(this : Void*, fd : Int32, events : UInt32) : Pointer(Void)
  fun g_source_attach(this : Void*, context : Pointer(Void)) : UInt32
  fun g_source_destroy(this : Void*) : Void
  fun g_source_get_can_recurse(this : Void*) : LibC::Int
  fun g_source_get_context(this : Void*) : Pointer(Void)
  fun g_source_get_current_time(this : Void*, timeval : Pointer(Void)) : Void
  fun g_source_get_id(this : Void*) : UInt32
  fun g_source_get_name(this : Void*) : Pointer(LibC::Char)
  fun g_source_get_priority(this : Void*) : Int32
  fun g_source_get_ready_time(this : Void*) : Int64
  fun g_source_get_time(this : Void*) : Int64
  fun g_source_get_type : UInt64
  fun g_source_is_destroyed(this : Void*) : LibC::Int
  fun g_source_modify_unix_fd(this : Void*, tag : Pointer(Void), new_events : UInt32) : Void
  fun g_source_new(source_funcs : Pointer(Void), struct_size : UInt32) : Pointer(Void)
  fun g_source_query_unix_fd(this : Void*, tag : Pointer(Void)) : UInt32
  fun g_source_ref(this : Void*) : Pointer(Void)
  fun g_source_remove(tag : UInt32) : LibC::Int
  fun g_source_remove(tag : UInt32) : LibC::Int
  fun g_source_remove_by_funcs_user_data(funcs : Pointer(Void), user_data : Pointer(Void)) : LibC::Int
  fun g_source_remove_by_funcs_user_data(funcs : Pointer(Void), user_data : Pointer(Void)) : LibC::Int
  fun g_source_remove_by_user_data(user_data : Pointer(Void)) : LibC::Int
  fun g_source_remove_by_user_data(user_data : Pointer(Void)) : LibC::Int
  fun g_source_remove_child_source(this : Void*, child_source : Pointer(Void)) : Void
  fun g_source_remove_poll(this : Void*, fd : Pointer(Void)) : Void
  fun g_source_remove_unix_fd(this : Void*, tag : Pointer(Void)) : Void
  fun g_source_set_callback(this : Void*, func : Void*, data : Pointer(Void), notify : Void*) : Void
  fun g_source_set_callback_indirect(this : Void*, callback_data : Pointer(Void), callback_funcs : Pointer(Void)) : Void
  fun g_source_set_can_recurse(this : Void*, can_recurse : LibC::Int) : Void
  fun g_source_set_funcs(this : Void*, funcs : Pointer(Void)) : Void
  fun g_source_set_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun g_source_set_name_by_id(tag : UInt32, name : Pointer(LibC::Char)) : Void
  fun g_source_set_name_by_id(tag : UInt32, name : Pointer(LibC::Char)) : Void
  fun g_source_set_priority(this : Void*, priority : Int32) : Void
  fun g_source_set_ready_time(this : Void*, ready_time : Int64) : Void
  fun g_source_set_static_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun g_source_unref(this : Void*) : Void
  fun g_spaced_primes_closest(num : UInt32) : UInt32
  fun g_spawn_async(working_directory : Pointer(LibC::Char), argv : Pointer(Pointer(LibC::Char)), envp : Pointer(Pointer(LibC::Char)), flags : UInt32, child_setup : Void*, user_data : Pointer(Void), child_pid : Pointer(Int32), error : LibGLib::Error**) : LibC::Int
  fun g_spawn_async_with_fds(working_directory : Pointer(LibC::Char), argv : Pointer(Pointer(LibC::Char)), envp : Pointer(Pointer(LibC::Char)), flags : UInt32, child_setup : Void*, user_data : Pointer(Void), child_pid : Pointer(Int32), stdin_fd : Int32, stdout_fd : Int32, stderr_fd : Int32, error : LibGLib::Error**) : LibC::Int
  fun g_spawn_async_with_pipes(working_directory : Pointer(LibC::Char), argv : Pointer(Pointer(LibC::Char)), envp : Pointer(Pointer(LibC::Char)), flags : UInt32, child_setup : Void*, user_data : Pointer(Void), child_pid : Pointer(Int32), standard_input : Pointer(Int32), standard_output : Pointer(Int32), standard_error : Pointer(Int32), error : LibGLib::Error**) : LibC::Int
  fun g_spawn_async_with_pipes_and_fds(working_directory : Pointer(LibC::Char), argv : Pointer(Pointer(LibC::Char)), envp : Pointer(Pointer(LibC::Char)), flags : UInt32, child_setup : Void*, user_data : Pointer(Void), stdin_fd : Int32, stdout_fd : Int32, stderr_fd : Int32, source_fds : Pointer(Int32), target_fds : Pointer(Int32), n_fds : UInt64, child_pid_out : Pointer(Int32), stdin_pipe_out : Pointer(Int32), stdout_pipe_out : Pointer(Int32), stderr_pipe_out : Pointer(Int32), error : LibGLib::Error**) : LibC::Int
  fun g_spawn_check_exit_status(wait_status : Int32, error : LibGLib::Error**) : LibC::Int
  fun g_spawn_check_wait_status(wait_status : Int32, error : LibGLib::Error**) : LibC::Int
  fun g_spawn_close_pid(pid : Int32) : Void
  fun g_spawn_command_line_async(command_line : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_spawn_command_line_sync(command_line : Pointer(LibC::Char), standard_output : Pointer(Pointer(UInt8)), standard_error : Pointer(Pointer(UInt8)), wait_status : Pointer(Int32), error : LibGLib::Error**) : LibC::Int
  fun g_spawn_error_quark : UInt32
  fun g_spawn_exit_error_quark : UInt32
  fun g_spawn_sync(working_directory : Pointer(LibC::Char), argv : Pointer(Pointer(LibC::Char)), envp : Pointer(Pointer(LibC::Char)), flags : UInt32, child_setup : Void*, user_data : Pointer(Void), standard_output : Pointer(Pointer(UInt8)), standard_error : Pointer(Pointer(UInt8)), wait_status : Pointer(Int32), error : LibGLib::Error**) : LibC::Int
  fun g_stpcpy(dest : Pointer(LibC::Char), src : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_str_equal(v1 : Pointer(Void), v2 : Pointer(Void)) : LibC::Int
  fun g_str_has_prefix(str : Pointer(LibC::Char), prefix : Pointer(LibC::Char)) : LibC::Int
  fun g_str_has_suffix(str : Pointer(LibC::Char), suffix : Pointer(LibC::Char)) : LibC::Int
  fun g_str_hash(v : Pointer(Void)) : UInt32
  fun g_str_is_ascii(str : Pointer(LibC::Char)) : LibC::Int
  fun g_str_match_string(search_term : Pointer(LibC::Char), potential_hit : Pointer(LibC::Char), accept_alternates : LibC::Int) : LibC::Int
  fun g_str_to_ascii(str : Pointer(LibC::Char), from_locale : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_str_tokenize_and_fold(string : Pointer(LibC::Char), translit_locale : Pointer(LibC::Char), ascii_alternates : Pointer(Pointer(Pointer(LibC::Char)))) : Pointer(Pointer(LibC::Char))
  fun g_strcanon(string : Pointer(LibC::Char), valid_chars : Pointer(LibC::Char), substitutor : Int8) : Pointer(LibC::Char)
  fun g_strcasecmp(s1 : Pointer(LibC::Char), s2 : Pointer(LibC::Char)) : Int32
  fun g_strchomp(string : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_strchug(string : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_strcmp0(str1 : Pointer(LibC::Char), str2 : Pointer(LibC::Char)) : Int32
  fun g_strcompress(source : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_strdelimit(string : Pointer(LibC::Char), delimiters : Pointer(LibC::Char), new_delimiter : Int8) : Pointer(LibC::Char)
  fun g_strdown(string : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_strdup(str : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_strerror(errnum : Int32) : Pointer(LibC::Char)
  fun g_strescape(source : Pointer(LibC::Char), exceptions : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_strfreev(str_array : Pointer(LibC::Char)) : Void
  fun g_string_append(this : Void*, val : Pointer(LibC::Char)) : Pointer(Void)
  fun g_string_append_c(this : Void*, c : Int8) : Pointer(Void)
  fun g_string_append_len(this : Void*, val : Pointer(LibC::Char), len : Int64) : Pointer(Void)
  fun g_string_append_unichar(this : Void*, wc : UInt32) : Pointer(Void)
  fun g_string_append_uri_escaped(this : Void*, unescaped : Pointer(LibC::Char), reserved_chars_allowed : Pointer(LibC::Char), allow_utf8 : LibC::Int) : Pointer(Void)
  fun g_string_ascii_down(this : Void*) : Pointer(Void)
  fun g_string_ascii_up(this : Void*) : Pointer(Void)
  fun g_string_assign(this : Void*, rval : Pointer(LibC::Char)) : Pointer(Void)
  fun g_string_chunk_clear(this : Void*) : Void
  fun g_string_chunk_free(this : Void*) : Void
  fun g_string_chunk_insert(this : Void*, string : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_string_chunk_insert_const(this : Void*, string : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_string_chunk_insert_len(this : Void*, string : Pointer(LibC::Char), len : Int64) : Pointer(LibC::Char)
  fun g_string_down(this : Void*) : Pointer(Void)
  fun g_string_equal(this : Void*, v2 : Pointer(Void)) : LibC::Int
  fun g_string_erase(this : Void*, pos : Int64, len : Int64) : Pointer(Void)
  fun g_string_free(this : Void*, free_segment : LibC::Int) : Pointer(LibC::Char)
  fun g_string_free_to_bytes(this : Void*) : Pointer(Void)
  fun g_string_hash(this : Void*) : UInt32
  fun g_string_insert(this : Void*, pos : Int64, val : Pointer(LibC::Char)) : Pointer(Void)
  fun g_string_insert_c(this : Void*, pos : Int64, c : Int8) : Pointer(Void)
  fun g_string_insert_len(this : Void*, pos : Int64, val : Pointer(LibC::Char), len : Int64) : Pointer(Void)
  fun g_string_insert_unichar(this : Void*, pos : Int64, wc : UInt32) : Pointer(Void)
  fun g_string_new(init : Pointer(LibC::Char)) : Pointer(Void)
  fun g_string_new_len(init : Pointer(LibC::Char), len : Int64) : Pointer(Void)
  fun g_string_overwrite(this : Void*, pos : UInt64, val : Pointer(LibC::Char)) : Pointer(Void)
  fun g_string_overwrite_len(this : Void*, pos : UInt64, val : Pointer(LibC::Char), len : Int64) : Pointer(Void)
  fun g_string_prepend(this : Void*, val : Pointer(LibC::Char)) : Pointer(Void)
  fun g_string_prepend_c(this : Void*, c : Int8) : Pointer(Void)
  fun g_string_prepend_len(this : Void*, val : Pointer(LibC::Char), len : Int64) : Pointer(Void)
  fun g_string_prepend_unichar(this : Void*, wc : UInt32) : Pointer(Void)
  fun g_string_replace(this : Void*, find : Pointer(LibC::Char), replace : Pointer(LibC::Char), limit : UInt32) : UInt32
  fun g_string_set_size(this : Void*, len : UInt64) : Pointer(Void)
  fun g_string_sized_new(dfl_size : UInt64) : Pointer(Void)
  fun g_string_truncate(this : Void*, len : UInt64) : Pointer(Void)
  fun g_string_up(this : Void*) : Pointer(Void)
  fun g_strip_context(msgid : Pointer(LibC::Char), msgval : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_strjoinv(separator : Pointer(LibC::Char), str_array : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_strlcat(dest : Pointer(LibC::Char), src : Pointer(LibC::Char), dest_size : UInt64) : UInt64
  fun g_strlcpy(dest : Pointer(LibC::Char), src : Pointer(LibC::Char), dest_size : UInt64) : UInt64
  fun g_strncasecmp(s1 : Pointer(LibC::Char), s2 : Pointer(LibC::Char), n : UInt32) : Int32
  fun g_strndup(str : Pointer(LibC::Char), n : UInt64) : Pointer(LibC::Char)
  fun g_strnfill(length : UInt64, fill_char : Int8) : Pointer(LibC::Char)
  fun g_strreverse(string : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_strrstr(haystack : Pointer(LibC::Char), needle : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_strrstr_len(haystack : Pointer(LibC::Char), haystack_len : Int64, needle : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_strsignal(signum : Int32) : Pointer(LibC::Char)
  fun g_strstr_len(haystack : Pointer(LibC::Char), haystack_len : Int64, needle : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_strtod(nptr : Pointer(LibC::Char), endptr : Pointer(Pointer(LibC::Char))) : Float64
  fun g_strup(string : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_strv_builder_add(this : Void*, value : Pointer(LibC::Char)) : Void
  fun g_strv_builder_addv(this : Void*, value : Pointer(Pointer(LibC::Char))) : Void
  fun g_strv_builder_end(this : Void*) : Pointer(Pointer(LibC::Char))
  fun g_strv_builder_unref(this : Void*) : Void
  fun g_strv_contains(strv : Pointer(LibC::Char), str : Pointer(LibC::Char)) : LibC::Int
  fun g_strv_equal(strv1 : Pointer(LibC::Char), strv2 : Pointer(LibC::Char)) : LibC::Int
  fun g_strv_get_type : UInt64
  fun g_strv_length(str_array : Pointer(LibC::Char)) : UInt32
  fun g_test_add_data_func(testpath : Pointer(LibC::Char), test_data : Pointer(Void), test_func : Void*) : Void
  fun g_test_add_data_func_full(testpath : Pointer(LibC::Char), test_data : Pointer(Void), test_func : Void*, data_free_func : Void*) : Void
  fun g_test_add_func(testpath : Pointer(LibC::Char), test_func : Void*) : Void
  fun g_test_assert_expected_messages_internal(domain : Pointer(LibC::Char), file : Pointer(LibC::Char), line : Int32, func : Pointer(LibC::Char)) : Void
  fun g_test_bug(bug_uri_snippet : Pointer(LibC::Char)) : Void
  fun g_test_bug_base(uri_pattern : Pointer(LibC::Char)) : Void
  fun g_test_case_free(this : Void*) : Void
  fun g_test_expect_message(log_domain : Pointer(LibC::Char), log_level : Int32, pattern : Pointer(LibC::Char)) : Void
  fun g_test_fail : Void
  fun g_test_failed : LibC::Int
  fun g_test_get_dir(file_type : UInt32) : Pointer(LibC::Char)
  fun g_test_get_path : Pointer(LibC::Char)
  fun g_test_incomplete(msg : Pointer(LibC::Char)) : Void
  fun g_test_log_buffer_free(this : Void*) : Void
  fun g_test_log_buffer_push(this : Void*, n_bytes : UInt32, bytes : Pointer(UInt8)) : Void
  fun g_test_log_msg_free(this : Void*) : Void
  fun g_test_log_type_name(log_type : UInt32) : Pointer(LibC::Char)
  fun g_test_queue_destroy(destroy_func : Void*, destroy_data : Pointer(Void)) : Void
  fun g_test_queue_free(gfree_pointer : Pointer(Void)) : Void
  fun g_test_rand_double : Float64
  fun g_test_rand_double_range(range_start : Float64, range_end : Float64) : Float64
  fun g_test_rand_int : Int32
  fun g_test_rand_int_range(_begin : Int32, _end : Int32) : Int32
  fun g_test_run : Int32
  fun g_test_run_suite(suite : Pointer(Void)) : Int32
  fun g_test_set_nonfatal_assertions : Void
  fun g_test_skip(msg : Pointer(LibC::Char)) : Void
  fun g_test_subprocess : LibC::Int
  fun g_test_suite_add(this : Void*, test_case : Pointer(Void)) : Void
  fun g_test_suite_add_suite(this : Void*, nestedsuite : Pointer(Void)) : Void
  fun g_test_suite_free(this : Void*) : Void
  fun g_test_summary(summary : Pointer(LibC::Char)) : Void
  fun g_test_timer_elapsed : Float64
  fun g_test_timer_last : Float64
  fun g_test_timer_start : Void
  fun g_test_trap_assertions(domain : Pointer(LibC::Char), file : Pointer(LibC::Char), line : Int32, func : Pointer(LibC::Char), assertion_flags : UInt64, pattern : Pointer(LibC::Char)) : Void
  fun g_test_trap_fork(usec_timeout : UInt64, test_trap_flags : UInt32) : LibC::Int
  fun g_test_trap_has_passed : LibC::Int
  fun g_test_trap_reached_timeout : LibC::Int
  fun g_test_trap_subprocess(test_path : Pointer(LibC::Char), usec_timeout : UInt64, test_flags : UInt32) : Void
  fun g_thread_error_quark : UInt32
  fun g_thread_error_quark : UInt32
  fun g_thread_exit(retval : Pointer(Void)) : Void
  fun g_thread_exit(retval : Pointer(Void)) : Void
  fun g_thread_get_type : UInt64
  fun g_thread_join(this : Void*) : Pointer(Void)
  fun g_thread_new(name : Pointer(LibC::Char), func : Void*, data : Pointer(Void)) : Pointer(Void)
  fun g_thread_pool_free(this : Void*, immediate : LibC::Int, wait_ : LibC::Int) : Void
  fun g_thread_pool_get_max_idle_time : UInt32
  fun g_thread_pool_get_max_idle_time : UInt32
  fun g_thread_pool_get_max_threads(this : Void*) : Int32
  fun g_thread_pool_get_max_unused_threads : Int32
  fun g_thread_pool_get_max_unused_threads : Int32
  fun g_thread_pool_get_num_threads(this : Void*) : UInt32
  fun g_thread_pool_get_num_unused_threads : UInt32
  fun g_thread_pool_get_num_unused_threads : UInt32
  fun g_thread_pool_move_to_front(this : Void*, data : Pointer(Void)) : LibC::Int
  fun g_thread_pool_push(this : Void*, data : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_thread_pool_set_max_idle_time(interval : UInt32) : Void
  fun g_thread_pool_set_max_idle_time(interval : UInt32) : Void
  fun g_thread_pool_set_max_threads(this : Void*, max_threads : Int32, error : LibGLib::Error**) : LibC::Int
  fun g_thread_pool_set_max_unused_threads(max_threads : Int32) : Void
  fun g_thread_pool_set_max_unused_threads(max_threads : Int32) : Void
  fun g_thread_pool_stop_unused_threads : Void
  fun g_thread_pool_stop_unused_threads : Void
  fun g_thread_pool_unprocessed(this : Void*) : UInt32
  fun g_thread_ref(this : Void*) : Pointer(Void)
  fun g_thread_self : Pointer(Void)
  fun g_thread_self : Pointer(Void)
  fun g_thread_try_new(name : Pointer(LibC::Char), func : Void*, data : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_thread_unref(this : Void*) : Void
  fun g_thread_yield : Void
  fun g_thread_yield : Void
  fun g_time_val_add(this : Void*, microseconds : Int64) : Void
  fun g_time_val_from_iso8601(iso_date : Pointer(LibC::Char), time_ : Pointer(Void)) : LibC::Int
  fun g_time_val_from_iso8601(iso_date : Pointer(LibC::Char), time_ : Pointer(Void)) : LibC::Int
  fun g_time_val_to_iso8601(this : Void*) : Pointer(LibC::Char)
  fun g_time_zone_adjust_time(this : Void*, type : UInt32, time_ : Pointer(Int64)) : Int32
  fun g_time_zone_find_interval(this : Void*, type : UInt32, time_ : Int64) : Int32
  fun g_time_zone_get_abbreviation(this : Void*, interval : Int32) : Pointer(LibC::Char)
  fun g_time_zone_get_identifier(this : Void*) : Pointer(LibC::Char)
  fun g_time_zone_get_offset(this : Void*, interval : Int32) : Int32
  fun g_time_zone_get_type : UInt64
  fun g_time_zone_is_dst(this : Void*, interval : Int32) : LibC::Int
  fun g_time_zone_new(identifier : Pointer(LibC::Char)) : Pointer(Void)
  fun g_time_zone_new_identifier(identifier : Pointer(LibC::Char)) : Pointer(Void)
  fun g_time_zone_new_local : Pointer(Void)
  fun g_time_zone_new_offset(seconds : Int32) : Pointer(Void)
  fun g_time_zone_new_utc : Pointer(Void)
  fun g_time_zone_ref(this : Void*) : Pointer(Void)
  fun g_time_zone_unref(this : Void*) : Void
  fun g_timeout_add_full(priority : Int32, interval : UInt32, function : Void*, data : Pointer(Void), notify : Void*) : UInt32
  fun g_timeout_add_seconds_full(priority : Int32, interval : UInt32, function : Void*, data : Pointer(Void), notify : Void*) : UInt32
  fun g_timeout_source_new(interval : UInt32) : Pointer(Void)
  fun g_timeout_source_new_seconds(interval : UInt32) : Pointer(Void)
  fun g_timer_continue(this : Void*) : Void
  fun g_timer_destroy(this : Void*) : Void
  fun g_timer_elapsed(this : Void*, microseconds : Pointer(UInt64)) : Float64
  fun g_timer_is_active(this : Void*) : LibC::Int
  fun g_timer_reset(this : Void*) : Void
  fun g_timer_start(this : Void*) : Void
  fun g_timer_stop(this : Void*) : Void
  fun g_trash_stack_height(stack_p : Pointer(Void)) : UInt32
  fun g_trash_stack_height(stack_p : Pointer(Void)) : UInt32
  fun g_trash_stack_peek(stack_p : Pointer(Void)) : Pointer(Void)
  fun g_trash_stack_peek(stack_p : Pointer(Void)) : Pointer(Void)
  fun g_trash_stack_pop(stack_p : Pointer(Void)) : Pointer(Void)
  fun g_trash_stack_pop(stack_p : Pointer(Void)) : Pointer(Void)
  fun g_trash_stack_push(stack_p : Pointer(Void), data_p : Pointer(Void)) : Void
  fun g_trash_stack_push(stack_p : Pointer(Void), data_p : Pointer(Void)) : Void
  fun g_tree_destroy(this : Void*) : Void
  fun g_tree_get_type : UInt64
  fun g_tree_height(this : Void*) : Int32
  fun g_tree_insert(this : Void*, key : Pointer(Void), value : Pointer(Void)) : Void
  fun g_tree_insert_node(this : Void*, key : Pointer(Void), value : Pointer(Void)) : Pointer(Void)
  fun g_tree_lookup(this : Void*, key : Pointer(Void)) : Pointer(Void)
  fun g_tree_lookup_extended(this : Void*, lookup_key : Pointer(Void), orig_key : Pointer(Pointer(Void)), value : Pointer(Pointer(Void))) : LibC::Int
  fun g_tree_lookup_node(this : Void*, key : Pointer(Void)) : Pointer(Void)
  fun g_tree_lower_bound(this : Void*, key : Pointer(Void)) : Pointer(Void)
  fun g_tree_new_full(key_compare_func : Void*, key_compare_data : Pointer(Void), key_destroy_func : Void*, value_destroy_func : Void*) : Pointer(Void)
  fun g_tree_nnodes(this : Void*) : Int32
  fun g_tree_node_first(this : Void*) : Pointer(Void)
  fun g_tree_node_key(this : Void*) : Pointer(Void)
  fun g_tree_node_last(this : Void*) : Pointer(Void)
  fun g_tree_node_next(this : Void*) : Pointer(Void)
  fun g_tree_node_previous(this : Void*) : Pointer(Void)
  fun g_tree_node_value(this : Void*) : Pointer(Void)
  fun g_tree_ref(this : Void*) : Pointer(Void)
  fun g_tree_remove(this : Void*, key : Pointer(Void)) : LibC::Int
  fun g_tree_remove_all(this : Void*) : Void
  fun g_tree_replace(this : Void*, key : Pointer(Void), value : Pointer(Void)) : Void
  fun g_tree_replace_node(this : Void*, key : Pointer(Void), value : Pointer(Void)) : Pointer(Void)
  fun g_tree_steal(this : Void*, key : Pointer(Void)) : LibC::Int
  fun g_tree_unref(this : Void*) : Void
  fun g_tree_upper_bound(this : Void*, key : Pointer(Void)) : Pointer(Void)
  fun g_try_malloc(n_bytes : UInt64) : Pointer(Void)
  fun g_try_malloc0(n_bytes : UInt64) : Pointer(Void)
  fun g_try_malloc0_n(n_blocks : UInt64, n_block_bytes : UInt64) : Pointer(Void)
  fun g_try_malloc_n(n_blocks : UInt64, n_block_bytes : UInt64) : Pointer(Void)
  fun g_try_realloc(mem : Pointer(Void), n_bytes : UInt64) : Pointer(Void)
  fun g_try_realloc_n(mem : Pointer(Void), n_blocks : UInt64, n_block_bytes : UInt64) : Pointer(Void)
  fun g_ucs4_to_utf16(str : Pointer(UInt32), len : Int64, items_read : Pointer(Int64), items_written : Pointer(Int64), error : LibGLib::Error**) : Pointer(UInt16)
  fun g_ucs4_to_utf8(str : Pointer(UInt32), len : Int64, items_read : Pointer(Int64), items_written : Pointer(Int64), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_unichar_break_type(c : UInt32) : UInt32
  fun g_unichar_combining_class(uc : UInt32) : Int32
  fun g_unichar_compose(a : UInt32, b : UInt32, ch : Pointer(UInt32)) : LibC::Int
  fun g_unichar_decompose(ch : UInt32, a : Pointer(UInt32), b : Pointer(UInt32)) : LibC::Int
  fun g_unichar_digit_value(c : UInt32) : Int32
  fun g_unichar_fully_decompose(ch : UInt32, compat : LibC::Int, result : Pointer(UInt32), result_len : UInt64) : UInt64
  fun g_unichar_get_mirror_char(ch : UInt32, mirrored_ch : Pointer(UInt32)) : LibC::Int
  fun g_unichar_get_script(ch : UInt32) : Int32
  fun g_unichar_isalnum(c : UInt32) : LibC::Int
  fun g_unichar_isalpha(c : UInt32) : LibC::Int
  fun g_unichar_iscntrl(c : UInt32) : LibC::Int
  fun g_unichar_isdefined(c : UInt32) : LibC::Int
  fun g_unichar_isdigit(c : UInt32) : LibC::Int
  fun g_unichar_isgraph(c : UInt32) : LibC::Int
  fun g_unichar_islower(c : UInt32) : LibC::Int
  fun g_unichar_ismark(c : UInt32) : LibC::Int
  fun g_unichar_isprint(c : UInt32) : LibC::Int
  fun g_unichar_ispunct(c : UInt32) : LibC::Int
  fun g_unichar_isspace(c : UInt32) : LibC::Int
  fun g_unichar_istitle(c : UInt32) : LibC::Int
  fun g_unichar_isupper(c : UInt32) : LibC::Int
  fun g_unichar_iswide(c : UInt32) : LibC::Int
  fun g_unichar_iswide_cjk(c : UInt32) : LibC::Int
  fun g_unichar_isxdigit(c : UInt32) : LibC::Int
  fun g_unichar_iszerowidth(c : UInt32) : LibC::Int
  fun g_unichar_to_utf8(c : UInt32, outbuf : Pointer(Pointer(LibC::Char))) : Int32
  fun g_unichar_tolower(c : UInt32) : UInt32
  fun g_unichar_totitle(c : UInt32) : UInt32
  fun g_unichar_toupper(c : UInt32) : UInt32
  fun g_unichar_type(c : UInt32) : UInt32
  fun g_unichar_validate(ch : UInt32) : LibC::Int
  fun g_unichar_xdigit_value(c : UInt32) : Int32
  fun g_unicode_canonical_decomposition(ch : UInt32, result_len : Pointer(UInt64)) : Pointer(UInt32)
  fun g_unicode_canonical_ordering(string : Pointer(UInt32), len : UInt64) : Void
  fun g_unicode_script_from_iso15924(iso15924 : UInt32) : Int32
  fun g_unicode_script_to_iso15924(script : Int32) : UInt32
  fun g_unix_error_quark : UInt32
  fun g_unix_fd_add_full(priority : Int32, fd : Int32, condition : UInt32, function : Void*, user_data : Pointer(Void), notify : Void*) : UInt32
  fun g_unix_fd_source_new(fd : Int32, condition : UInt32) : Pointer(Void)
  fun g_unix_get_passwd_entry(user_name : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_unix_open_pipe(fds : Pointer(Int32), flags : Int32, error : LibGLib::Error**) : LibC::Int
  fun g_unix_set_fd_nonblocking(fd : Int32, nonblock : LibC::Int, error : LibGLib::Error**) : LibC::Int
  fun g_unix_signal_add_full(priority : Int32, signum : Int32, handler : Void*, user_data : Pointer(Void), notify : Void*) : UInt32
  fun g_unix_signal_source_new(signum : Int32) : Pointer(Void)
  fun g_unlink(filename : Pointer(LibC::Char)) : Int32
  fun g_unsetenv(variable : Pointer(LibC::Char)) : Void
  fun g_uri_build(flags : UInt32, scheme : Pointer(LibC::Char), userinfo : Pointer(LibC::Char), host : Pointer(LibC::Char), port : Int32, path : Pointer(LibC::Char), query : Pointer(LibC::Char), fragment : Pointer(LibC::Char)) : Pointer(Void)
  fun g_uri_build(flags : UInt32, scheme : Pointer(LibC::Char), userinfo : Pointer(LibC::Char), host : Pointer(LibC::Char), port : Int32, path : Pointer(LibC::Char), query : Pointer(LibC::Char), fragment : Pointer(LibC::Char)) : Pointer(Void)
  fun g_uri_build_with_user(flags : UInt32, scheme : Pointer(LibC::Char), user : Pointer(LibC::Char), password : Pointer(LibC::Char), auth_params : Pointer(LibC::Char), host : Pointer(LibC::Char), port : Int32, path : Pointer(LibC::Char), query : Pointer(LibC::Char), fragment : Pointer(LibC::Char)) : Pointer(Void)
  fun g_uri_build_with_user(flags : UInt32, scheme : Pointer(LibC::Char), user : Pointer(LibC::Char), password : Pointer(LibC::Char), auth_params : Pointer(LibC::Char), host : Pointer(LibC::Char), port : Int32, path : Pointer(LibC::Char), query : Pointer(LibC::Char), fragment : Pointer(LibC::Char)) : Pointer(Void)
  fun g_uri_error_quark : UInt32
  fun g_uri_error_quark : UInt32
  fun g_uri_escape_bytes(unescaped : Pointer(UInt8), length : UInt64, reserved_chars_allowed : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_uri_escape_bytes(unescaped : Pointer(UInt8), length : UInt64, reserved_chars_allowed : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_uri_escape_string(unescaped : Pointer(LibC::Char), reserved_chars_allowed : Pointer(LibC::Char), allow_utf8 : LibC::Int) : Pointer(LibC::Char)
  fun g_uri_escape_string(unescaped : Pointer(LibC::Char), reserved_chars_allowed : Pointer(LibC::Char), allow_utf8 : LibC::Int) : Pointer(LibC::Char)
  fun g_uri_get_auth_params(this : Void*) : Pointer(LibC::Char)
  fun g_uri_get_flags(this : Void*) : UInt32
  fun g_uri_get_fragment(this : Void*) : Pointer(LibC::Char)
  fun g_uri_get_host(this : Void*) : Pointer(LibC::Char)
  fun g_uri_get_password(this : Void*) : Pointer(LibC::Char)
  fun g_uri_get_path(this : Void*) : Pointer(LibC::Char)
  fun g_uri_get_port(this : Void*) : Int32
  fun g_uri_get_query(this : Void*) : Pointer(LibC::Char)
  fun g_uri_get_scheme(this : Void*) : Pointer(LibC::Char)
  fun g_uri_get_type : UInt64
  fun g_uri_get_user(this : Void*) : Pointer(LibC::Char)
  fun g_uri_get_userinfo(this : Void*) : Pointer(LibC::Char)
  fun g_uri_is_valid(uri_string : Pointer(LibC::Char), flags : UInt32, error : LibGLib::Error**) : LibC::Int
  fun g_uri_is_valid(uri_string : Pointer(LibC::Char), flags : UInt32, error : LibGLib::Error**) : LibC::Int
  fun g_uri_join(flags : UInt32, scheme : Pointer(LibC::Char), userinfo : Pointer(LibC::Char), host : Pointer(LibC::Char), port : Int32, path : Pointer(LibC::Char), query : Pointer(LibC::Char), fragment : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_uri_join(flags : UInt32, scheme : Pointer(LibC::Char), userinfo : Pointer(LibC::Char), host : Pointer(LibC::Char), port : Int32, path : Pointer(LibC::Char), query : Pointer(LibC::Char), fragment : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_uri_join_with_user(flags : UInt32, scheme : Pointer(LibC::Char), user : Pointer(LibC::Char), password : Pointer(LibC::Char), auth_params : Pointer(LibC::Char), host : Pointer(LibC::Char), port : Int32, path : Pointer(LibC::Char), query : Pointer(LibC::Char), fragment : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_uri_join_with_user(flags : UInt32, scheme : Pointer(LibC::Char), user : Pointer(LibC::Char), password : Pointer(LibC::Char), auth_params : Pointer(LibC::Char), host : Pointer(LibC::Char), port : Int32, path : Pointer(LibC::Char), query : Pointer(LibC::Char), fragment : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_uri_list_extract_uris(uri_list : Pointer(LibC::Char)) : Pointer(Pointer(LibC::Char))
  fun g_uri_list_extract_uris(uri_list : Pointer(LibC::Char)) : Pointer(Pointer(LibC::Char))
  fun g_uri_params_iter_init(this : Void*, params : Pointer(LibC::Char), length : Int64, separators : Pointer(LibC::Char), flags : UInt32) : Void
  fun g_uri_params_iter_next(this : Void*, attribute : Pointer(Pointer(LibC::Char)), value : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : LibC::Int
  fun g_uri_parse(uri_string : Pointer(LibC::Char), flags : UInt32, error : LibGLib::Error**) : Pointer(Void)
  fun g_uri_parse(uri_string : Pointer(LibC::Char), flags : UInt32, error : LibGLib::Error**) : Pointer(Void)
  fun g_uri_parse_params(params : Pointer(LibC::Char), length : Int64, separators : Pointer(LibC::Char), flags : UInt32, error : LibGLib::Error**) : Pointer(Void)
  fun g_uri_parse_params(params : Pointer(LibC::Char), length : Int64, separators : Pointer(LibC::Char), flags : UInt32, error : LibGLib::Error**) : Pointer(Void)
  fun g_uri_parse_relative(this : Void*, uri_ref : Pointer(LibC::Char), flags : UInt32, error : LibGLib::Error**) : Pointer(Void)
  fun g_uri_parse_scheme(uri : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_uri_parse_scheme(uri : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_uri_peek_scheme(uri : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_uri_peek_scheme(uri : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_uri_resolve_relative(base_uri_string : Pointer(LibC::Char), uri_ref : Pointer(LibC::Char), flags : UInt32, error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_uri_resolve_relative(base_uri_string : Pointer(LibC::Char), uri_ref : Pointer(LibC::Char), flags : UInt32, error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_uri_split(uri_ref : Pointer(LibC::Char), flags : UInt32, scheme : Pointer(Pointer(LibC::Char)), userinfo : Pointer(Pointer(LibC::Char)), host : Pointer(Pointer(LibC::Char)), port : Pointer(Int32), path : Pointer(Pointer(LibC::Char)), query : Pointer(Pointer(LibC::Char)), fragment : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : LibC::Int
  fun g_uri_split(uri_ref : Pointer(LibC::Char), flags : UInt32, scheme : Pointer(Pointer(LibC::Char)), userinfo : Pointer(Pointer(LibC::Char)), host : Pointer(Pointer(LibC::Char)), port : Pointer(Int32), path : Pointer(Pointer(LibC::Char)), query : Pointer(Pointer(LibC::Char)), fragment : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : LibC::Int
  fun g_uri_split_network(uri_string : Pointer(LibC::Char), flags : UInt32, scheme : Pointer(Pointer(LibC::Char)), host : Pointer(Pointer(LibC::Char)), port : Pointer(Int32), error : LibGLib::Error**) : LibC::Int
  fun g_uri_split_network(uri_string : Pointer(LibC::Char), flags : UInt32, scheme : Pointer(Pointer(LibC::Char)), host : Pointer(Pointer(LibC::Char)), port : Pointer(Int32), error : LibGLib::Error**) : LibC::Int
  fun g_uri_split_with_user(uri_ref : Pointer(LibC::Char), flags : UInt32, scheme : Pointer(Pointer(LibC::Char)), user : Pointer(Pointer(LibC::Char)), password : Pointer(Pointer(LibC::Char)), auth_params : Pointer(Pointer(LibC::Char)), host : Pointer(Pointer(LibC::Char)), port : Pointer(Int32), path : Pointer(Pointer(LibC::Char)), query : Pointer(Pointer(LibC::Char)), fragment : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : LibC::Int
  fun g_uri_split_with_user(uri_ref : Pointer(LibC::Char), flags : UInt32, scheme : Pointer(Pointer(LibC::Char)), user : Pointer(Pointer(LibC::Char)), password : Pointer(Pointer(LibC::Char)), auth_params : Pointer(Pointer(LibC::Char)), host : Pointer(Pointer(LibC::Char)), port : Pointer(Int32), path : Pointer(Pointer(LibC::Char)), query : Pointer(Pointer(LibC::Char)), fragment : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : LibC::Int
  fun g_uri_to_string(this : Void*) : Pointer(LibC::Char)
  fun g_uri_to_string_partial(this : Void*, flags : UInt32) : Pointer(LibC::Char)
  fun g_uri_unescape_bytes(escaped_string : Pointer(LibC::Char), length : Int64, illegal_characters : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_uri_unescape_bytes(escaped_string : Pointer(LibC::Char), length : Int64, illegal_characters : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_uri_unescape_segment(escaped_string : Pointer(LibC::Char), escaped_string_end : Pointer(LibC::Char), illegal_characters : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_uri_unescape_segment(escaped_string : Pointer(LibC::Char), escaped_string_end : Pointer(LibC::Char), illegal_characters : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_uri_unescape_string(escaped_string : Pointer(LibC::Char), illegal_characters : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_uri_unescape_string(escaped_string : Pointer(LibC::Char), illegal_characters : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_usleep(microseconds : UInt64) : Void
  fun g_utf16_to_ucs4(str : Pointer(UInt16), len : Int64, items_read : Pointer(Int64), items_written : Pointer(Int64), error : LibGLib::Error**) : Pointer(UInt32)
  fun g_utf16_to_utf8(str : Pointer(UInt16), len : Int64, items_read : Pointer(Int64), items_written : Pointer(Int64), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_utf8_casefold(str : Pointer(LibC::Char), len : Int64) : Pointer(LibC::Char)
  fun g_utf8_collate(str1 : Pointer(LibC::Char), str2 : Pointer(LibC::Char)) : Int32
  fun g_utf8_collate_key(str : Pointer(LibC::Char), len : Int64) : Pointer(LibC::Char)
  fun g_utf8_collate_key_for_filename(str : Pointer(LibC::Char), len : Int64) : Pointer(LibC::Char)
  fun g_utf8_find_next_char(p : Pointer(LibC::Char), _end : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_utf8_find_prev_char(str : Pointer(LibC::Char), p : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_utf8_get_char(p : Pointer(LibC::Char)) : UInt32
  fun g_utf8_get_char_validated(p : Pointer(LibC::Char), max_len : Int64) : UInt32
  fun g_utf8_make_valid(str : Pointer(LibC::Char), len : Int64) : Pointer(LibC::Char)
  fun g_utf8_normalize(str : Pointer(LibC::Char), len : Int64, mode : UInt32) : Pointer(LibC::Char)
  fun g_utf8_offset_to_pointer(str : Pointer(LibC::Char), offset : Int64) : Pointer(LibC::Char)
  fun g_utf8_pointer_to_offset(str : Pointer(LibC::Char), pos : Pointer(LibC::Char)) : Int64
  fun g_utf8_prev_char(p : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_utf8_strchr(p : Pointer(LibC::Char), len : Int64, c : UInt32) : Pointer(LibC::Char)
  fun g_utf8_strdown(str : Pointer(LibC::Char), len : Int64) : Pointer(LibC::Char)
  fun g_utf8_strlen(p : Pointer(LibC::Char), max : Int64) : Int64
  fun g_utf8_strncpy(dest : Pointer(LibC::Char), src : Pointer(LibC::Char), n : UInt64) : Pointer(LibC::Char)
  fun g_utf8_strrchr(p : Pointer(LibC::Char), len : Int64, c : UInt32) : Pointer(LibC::Char)
  fun g_utf8_strreverse(str : Pointer(LibC::Char), len : Int64) : Pointer(LibC::Char)
  fun g_utf8_strup(str : Pointer(LibC::Char), len : Int64) : Pointer(LibC::Char)
  fun g_utf8_substring(str : Pointer(LibC::Char), start_pos : Int64, end_pos : Int64) : Pointer(LibC::Char)
  fun g_utf8_to_ucs4(str : Pointer(LibC::Char), len : Int64, items_read : Pointer(Int64), items_written : Pointer(Int64), error : LibGLib::Error**) : Pointer(UInt32)
  fun g_utf8_to_ucs4_fast(str : Pointer(LibC::Char), len : Int64, items_written : Pointer(Int64)) : Pointer(UInt32)
  fun g_utf8_to_utf16(str : Pointer(LibC::Char), len : Int64, items_read : Pointer(Int64), items_written : Pointer(Int64), error : LibGLib::Error**) : Pointer(UInt16)
  fun g_utf8_validate(str : Pointer(UInt8), max_len : Int64, _end : Pointer(Pointer(LibC::Char))) : LibC::Int
  fun g_utf8_validate_len(str : Pointer(UInt8), max_len : UInt64, _end : Pointer(Pointer(LibC::Char))) : LibC::Int
  fun g_uuid_string_is_valid(str : Pointer(LibC::Char)) : LibC::Int
  fun g_uuid_string_random : Pointer(LibC::Char)
  fun g_variant_builder_add_value(this : Void*, value : Pointer(Void)) : Void
  fun g_variant_builder_close(this : Void*) : Void
  fun g_variant_builder_end(this : Void*) : Pointer(Void)
  fun g_variant_builder_get_type : UInt64
  fun g_variant_builder_new(type : Pointer(Void)) : Pointer(Void)
  fun g_variant_builder_open(this : Void*, type : Pointer(Void)) : Void
  fun g_variant_builder_ref(this : Void*) : Pointer(Void)
  fun g_variant_builder_unref(this : Void*) : Void
  fun g_variant_byteswap(this : Void*) : Pointer(Void)
  fun g_variant_check_format_string(this : Void*, format_string : Pointer(LibC::Char), copy_only : LibC::Int) : LibC::Int
  fun g_variant_classify(this : Void*) : UInt32
  fun g_variant_compare(this : Void*, two : Pointer(Void)) : Int32
  fun g_variant_dict_clear(this : Void*) : Void
  fun g_variant_dict_contains(this : Void*, key : Pointer(LibC::Char)) : LibC::Int
  fun g_variant_dict_end(this : Void*) : Pointer(Void)
  fun g_variant_dict_get_type : UInt64
  fun g_variant_dict_insert_value(this : Void*, key : Pointer(LibC::Char), value : Pointer(Void)) : Void
  fun g_variant_dict_lookup_value(this : Void*, key : Pointer(LibC::Char), expected_type : Pointer(Void)) : Pointer(Void)
  fun g_variant_dict_new(from_asv : Pointer(Void)) : Pointer(Void)
  fun g_variant_dict_ref(this : Void*) : Pointer(Void)
  fun g_variant_dict_remove(this : Void*, key : Pointer(LibC::Char)) : LibC::Int
  fun g_variant_dict_unref(this : Void*) : Void
  fun g_variant_dup_bytestring(this : Void*, length : Pointer(UInt64)) : Pointer(UInt8)
  fun g_variant_dup_bytestring_array(this : Void*, length : Pointer(UInt64)) : Pointer(Pointer(LibC::Char))
  fun g_variant_dup_objv(this : Void*, length : Pointer(UInt64)) : Pointer(Pointer(LibC::Char))
  fun g_variant_dup_string(this : Void*, length : Pointer(UInt64)) : Pointer(LibC::Char)
  fun g_variant_dup_strv(this : Void*, length : Pointer(UInt64)) : Pointer(Pointer(LibC::Char))
  fun g_variant_equal(this : Void*, two : Pointer(Void)) : LibC::Int
  fun g_variant_get_boolean(this : Void*) : LibC::Int
  fun g_variant_get_byte(this : Void*) : UInt8
  fun g_variant_get_bytestring(this : Void*) : Pointer(UInt8)
  fun g_variant_get_bytestring_array(this : Void*, length : Pointer(UInt64)) : Pointer(Pointer(LibC::Char))
  fun g_variant_get_child_value(this : Void*, index_ : UInt64) : Pointer(Void)
  fun g_variant_get_data(this : Void*) : Pointer(Void)
  fun g_variant_get_data_as_bytes(this : Void*) : Pointer(Void)
  fun g_variant_get_double(this : Void*) : Float64
  fun g_variant_get_gtype : UInt64
  fun g_variant_get_handle(this : Void*) : Int32
  fun g_variant_get_int16(this : Void*) : Int16
  fun g_variant_get_int32(this : Void*) : Int32
  fun g_variant_get_int64(this : Void*) : Int64
  fun g_variant_get_maybe(this : Void*) : Pointer(Void)
  fun g_variant_get_normal_form(this : Void*) : Pointer(Void)
  fun g_variant_get_objv(this : Void*, length : Pointer(UInt64)) : Pointer(Pointer(LibC::Char))
  fun g_variant_get_size(this : Void*) : UInt64
  fun g_variant_get_string(this : Void*, length : Pointer(UInt64)) : Pointer(LibC::Char)
  fun g_variant_get_strv(this : Void*, length : Pointer(UInt64)) : Pointer(Pointer(LibC::Char))
  fun g_variant_get_type(this : Void*) : Pointer(Void)
  fun g_variant_get_type_string(this : Void*) : Pointer(LibC::Char)
  fun g_variant_get_uint16(this : Void*) : UInt16
  fun g_variant_get_uint32(this : Void*) : UInt32
  fun g_variant_get_uint64(this : Void*) : UInt64
  fun g_variant_get_variant(this : Void*) : Pointer(Void)
  fun g_variant_hash(this : Void*) : UInt32
  fun g_variant_is_container(this : Void*) : LibC::Int
  fun g_variant_is_floating(this : Void*) : LibC::Int
  fun g_variant_is_normal_form(this : Void*) : LibC::Int
  fun g_variant_is_object_path(string : Pointer(LibC::Char)) : LibC::Int
  fun g_variant_is_object_path(string : Pointer(LibC::Char)) : LibC::Int
  fun g_variant_is_of_type(this : Void*, type : Pointer(Void)) : LibC::Int
  fun g_variant_is_signature(string : Pointer(LibC::Char)) : LibC::Int
  fun g_variant_is_signature(string : Pointer(LibC::Char)) : LibC::Int
  fun g_variant_lookup_value(this : Void*, key : Pointer(LibC::Char), expected_type : Pointer(Void)) : Pointer(Void)
  fun g_variant_n_children(this : Void*) : UInt64
  fun g_variant_new_array(child_type : Pointer(Void), children : Pointer(Pointer(Void)), n_children : UInt64) : Pointer(Void)
  fun g_variant_new_boolean(value : LibC::Int) : Pointer(Void)
  fun g_variant_new_byte(value : UInt8) : Pointer(Void)
  fun g_variant_new_bytestring(string : Pointer(UInt8)) : Pointer(Void)
  fun g_variant_new_bytestring_array(strv : Pointer(Pointer(LibC::Char)), length : Int64) : Pointer(Void)
  fun g_variant_new_dict_entry(key : Pointer(Void), value : Pointer(Void)) : Pointer(Void)
  fun g_variant_new_double(value : Float64) : Pointer(Void)
  fun g_variant_new_fixed_array(element_type : Pointer(Void), elements : Pointer(Void), n_elements : UInt64, element_size : UInt64) : Pointer(Void)
  fun g_variant_new_from_bytes(type : Pointer(Void), bytes : Pointer(Void), trusted : LibC::Int) : Pointer(Void)
  fun g_variant_new_from_data(type : Pointer(Void), data : Pointer(UInt8), size : UInt64, trusted : LibC::Int, notify : Void*, user_data : Pointer(Void)) : Pointer(Void)
  fun g_variant_new_handle(value : Int32) : Pointer(Void)
  fun g_variant_new_int16(value : Int16) : Pointer(Void)
  fun g_variant_new_int32(value : Int32) : Pointer(Void)
  fun g_variant_new_int64(value : Int64) : Pointer(Void)
  fun g_variant_new_maybe(child_type : Pointer(Void), child : Pointer(Void)) : Pointer(Void)
  fun g_variant_new_object_path(object_path : Pointer(LibC::Char)) : Pointer(Void)
  fun g_variant_new_objv(strv : Pointer(Pointer(LibC::Char)), length : Int64) : Pointer(Void)
  fun g_variant_new_signature(signature : Pointer(LibC::Char)) : Pointer(Void)
  fun g_variant_new_string(string : Pointer(LibC::Char)) : Pointer(Void)
  fun g_variant_new_strv(strv : Pointer(Pointer(LibC::Char)), length : Int64) : Pointer(Void)
  fun g_variant_new_tuple(children : Pointer(Pointer(Void)), n_children : UInt64) : Pointer(Void)
  fun g_variant_new_uint16(value : UInt16) : Pointer(Void)
  fun g_variant_new_uint32(value : UInt32) : Pointer(Void)
  fun g_variant_new_uint64(value : UInt64) : Pointer(Void)
  fun g_variant_new_variant(value : Pointer(Void)) : Pointer(Void)
  fun g_variant_parse(type : Pointer(Void), text : Pointer(LibC::Char), limit : Pointer(LibC::Char), endptr : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_variant_parse(type : Pointer(Void), text : Pointer(LibC::Char), limit : Pointer(LibC::Char), endptr : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_variant_parse_error_print_context(error : Pointer(Void), source_str : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_variant_parse_error_print_context(error : Pointer(Void), source_str : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_variant_parse_error_quark : UInt32
  fun g_variant_parse_error_quark : UInt32
  fun g_variant_parser_get_error_quark : UInt32
  fun g_variant_parser_get_error_quark : UInt32
  fun g_variant_print(this : Void*, type_annotate : LibC::Int) : Pointer(LibC::Char)
  fun g_variant_ref(this : Void*) : Pointer(Void)
  fun g_variant_ref_sink(this : Void*) : Pointer(Void)
  fun g_variant_store(this : Void*, data : Pointer(Void)) : Void
  fun g_variant_take_ref(this : Void*) : Pointer(Void)
  fun g_variant_type_checked_(arg0 : Pointer(LibC::Char)) : Pointer(Void)
  fun g_variant_type_checked_(arg0 : Pointer(LibC::Char)) : Pointer(Void)
  fun g_variant_type_copy(this : Void*) : Pointer(Void)
  fun g_variant_type_dup_string(this : Void*) : Pointer(LibC::Char)
  fun g_variant_type_element(this : Void*) : Pointer(Void)
  fun g_variant_type_equal(this : Void*, type2 : Pointer(Void)) : LibC::Int
  fun g_variant_type_first(this : Void*) : Pointer(Void)
  fun g_variant_type_free(this : Void*) : Void
  fun g_variant_type_get_gtype : UInt64
  fun g_variant_type_get_string_length(this : Void*) : UInt64
  fun g_variant_type_hash(this : Void*) : UInt32
  fun g_variant_type_is_array(this : Void*) : LibC::Int
  fun g_variant_type_is_basic(this : Void*) : LibC::Int
  fun g_variant_type_is_container(this : Void*) : LibC::Int
  fun g_variant_type_is_definite(this : Void*) : LibC::Int
  fun g_variant_type_is_dict_entry(this : Void*) : LibC::Int
  fun g_variant_type_is_maybe(this : Void*) : LibC::Int
  fun g_variant_type_is_subtype_of(this : Void*, supertype : Pointer(Void)) : LibC::Int
  fun g_variant_type_is_tuple(this : Void*) : LibC::Int
  fun g_variant_type_is_variant(this : Void*) : LibC::Int
  fun g_variant_type_key(this : Void*) : Pointer(Void)
  fun g_variant_type_n_items(this : Void*) : UInt64
  fun g_variant_type_new(type_string : Pointer(LibC::Char)) : Pointer(Void)
  fun g_variant_type_new_array(element : Pointer(Void)) : Pointer(Void)
  fun g_variant_type_new_dict_entry(key : Pointer(Void), value : Pointer(Void)) : Pointer(Void)
  fun g_variant_type_new_maybe(element : Pointer(Void)) : Pointer(Void)
  fun g_variant_type_new_tuple(items : Pointer(Pointer(Void)), length : Int32) : Pointer(Void)
  fun g_variant_type_next(this : Void*) : Pointer(Void)
  fun g_variant_type_string_get_depth_(type_string : Pointer(LibC::Char)) : UInt64
  fun g_variant_type_string_get_depth_(type_string : Pointer(LibC::Char)) : UInt64
  fun g_variant_type_string_is_valid(type_string : Pointer(LibC::Char)) : LibC::Int
  fun g_variant_type_string_is_valid(type_string : Pointer(LibC::Char)) : LibC::Int
  fun g_variant_type_string_scan(string : Pointer(LibC::Char), limit : Pointer(LibC::Char), endptr : Pointer(Pointer(LibC::Char))) : LibC::Int
  fun g_variant_type_string_scan(string : Pointer(LibC::Char), limit : Pointer(LibC::Char), endptr : Pointer(Pointer(LibC::Char))) : LibC::Int
  fun g_variant_type_value(this : Void*) : Pointer(Void)
  fun g_variant_unref(this : Void*) : Void
  fun glib_check_version(required_major : UInt32, required_minor : UInt32, required_micro : UInt32) : Pointer(LibC::Char)
  fun intern : UInt64
end
