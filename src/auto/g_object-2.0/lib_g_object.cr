@[Link("gobject-2.0", pkg_config: "gobject-2.0")]

lib LibGObject
  # Functions not declared by GObj Introspection

  # Property related functions
  fun g_object_get(object : Pointer(Void), property_name : Pointer(LibC::Char), ...)
  fun g_object_set(object : Pointer(Void), property_name : Pointer(LibC::Char), ...)
  fun g_object_new_with_properties(object_type : UInt64, n_properties : UInt32,
                                   names : LibC::Char**, values : Value*) : Void*

  # Signal related functions
  fun g_signal_connect_data(instance : Void*,
                            detailed_signal : UInt8*,
                            c_handler : Void*,
                            data : Void*,
                            destroy_data : Void* -> Nil,
                            flags : UInt32) : UInt64
  fun g_signal_emit_by_name(instance : Void*, detailed_signal : UInt8*, ...)

  # Null terminated strings GType, used by GValue
  fun g_strv_get_type : UInt64

  # Flags
  type BindingFlags = UInt32
  type ConnectFlags = UInt32
  type ParamFlags = UInt32
  type SignalFlags = UInt32
  type SignalMatchType = UInt32
  type TypeDebugFlags = UInt32
  type TypeFlags = UInt32
  type TypeFundamentalFlags = UInt32

  # Enums

  # Callbacks
  alias BaseFinalizeFunc = Pointer(LibGObject::TypeClass) -> Void
  alias BaseInitFunc = Pointer(LibGObject::TypeClass) -> Void
  alias BindingTransformFunc = Pointer(LibGObject::Binding), Pointer(LibGObject::Value), Pointer(LibGObject::Value), Pointer(Void) -> LibC::Int
  alias BoxedCopyFunc = Pointer(Void) -> Pointer(Void)
  alias BoxedFreeFunc = Pointer(Void) -> Void
  alias Callback = -> Void
  alias ClassFinalizeFunc = Pointer(LibGObject::TypeClass), Pointer(Void) -> Void
  alias ClassInitFunc = Pointer(LibGObject::TypeClass), Pointer(Void) -> Void
  alias ClosureMarshal = Pointer(LibGObject::Closure), Pointer(LibGObject::Value), UInt32, Pointer(Void), Pointer(Void), Pointer(Void) -> Void
  alias ClosureNotify = Pointer(Void), Pointer(LibGObject::Closure) -> Void
  alias InstanceInitFunc = Pointer(LibGObject::TypeInstance), Pointer(LibGObject::TypeClass) -> Void
  alias InterfaceFinalizeFunc = Pointer(LibGObject::TypeInterface), Pointer(Void) -> Void
  alias InterfaceInitFunc = Pointer(LibGObject::TypeInterface), Pointer(Void) -> Void
  alias ObjectFinalizeFunc = Pointer(LibGObject::Object) -> Void
  alias ObjectGetPropertyFunc = Pointer(LibGObject::Object), UInt32, Pointer(LibGObject::Value), Pointer(LibGObject::ParamSpec) -> Void
  alias ObjectSetPropertyFunc = Pointer(LibGObject::Object), UInt32, Pointer(LibGObject::Value), Pointer(LibGObject::ParamSpec) -> Void
  alias SignalAccumulator = Pointer(LibGObject::SignalInvocationHint), Pointer(LibGObject::Value), Pointer(LibGObject::Value), Pointer(Void) -> LibC::Int
  alias SignalEmissionHook = Pointer(LibGObject::SignalInvocationHint), UInt32, Pointer(Void), Pointer(Void) -> LibC::Int
  alias ToggleNotify = Pointer(Void), Pointer(LibGObject::Object), LibC::Int -> Void
  alias TypeClassCacheFunc = Pointer(Void), Pointer(LibGObject::TypeClass) -> LibC::Int
  alias TypeInterfaceCheckFunc = Pointer(Void), Pointer(LibGObject::TypeInterface) -> Void
  alias TypePluginCompleteInterfaceInfo = Pointer(LibGObject::TypePlugin), UInt64, UInt64, Pointer(LibGObject::InterfaceInfo) -> Void
  alias TypePluginCompleteTypeInfo = Pointer(LibGObject::TypePlugin), UInt64, Pointer(LibGObject::TypeInfo), Pointer(LibGObject::TypeValueTable) -> Void
  alias TypePluginUnuse = Pointer(LibGObject::TypePlugin) -> Void
  alias TypePluginUse = Pointer(LibGObject::TypePlugin) -> Void
  alias ValueTransform = Pointer(LibGObject::Value), Pointer(LibGObject::Value) -> Void
  alias WeakNotify = Pointer(Void), Pointer(LibGObject::Object) -> Void

  # Interface types
  type TypePlugin = Void

  # Structs

  struct CClosure # 72 bytes long
    closure : LibGObject::Closure
    callback : Pointer(Void)
  end

  struct Closure # 64 bytes long
    ref_count : UInt32
    meta_marshal_nouse : UInt32
    n_guards : UInt32
    n_fnotifiers : UInt32
    n_inotifiers : UInt32
    in_inotify : UInt32
    floating : UInt32
    derivative_flag : UInt32
    in_marshal : UInt32
    is_invalid : UInt32
    marshal : -> Void
    data : Pointer(Void)
    notifiers : Pointer(LibGObject::ClosureNotifyData)
  end

  struct ClosureNotifyData # 16 bytes long
    data : Pointer(Void)
    notify : LibGObject::ClosureNotify
  end

  struct EnumClass # 32 bytes long
    g_type_class : LibGObject::TypeClass
    minimum : Int32
    maximum : Int32
    n_values : UInt32
    values : Pointer(LibGObject::EnumValue)
  end

  struct EnumValue # 24 bytes long
    value : Int32
    value_name : Pointer(LibC::Char)
    value_nick : Pointer(LibC::Char)
  end

  struct FlagsClass # 24 bytes long
    g_type_class : LibGObject::TypeClass
    mask : UInt32
    n_values : UInt32
    values : Pointer(LibGObject::FlagsValue)
  end

  struct FlagsValue # 24 bytes long
    value : UInt32
    value_name : Pointer(LibC::Char)
    value_nick : Pointer(LibC::Char)
  end

  struct InterfaceInfo # 24 bytes long
    interface_init : LibGObject::InterfaceInitFunc
    interface_finalize : LibGObject::InterfaceFinalizeFunc
    interface_data : Pointer(Void)
  end

  struct ObjectConstructParam # 16 bytes long
    pspec : Pointer(LibGObject::ParamSpec)
    value : Pointer(LibGObject::Value)
  end

  type ParamSpecPool = Void # Struct with zero bytes

  struct ParamSpecTypeInfo # 56 bytes long
    instance_size : UInt16
    n_preallocs : UInt16
    instance_init : -> Void
    value_type : UInt64
    finalize : -> Void
    value_set_default : -> Void
    value_validate : -> Void
    values_cmp : -> Void
  end

  struct Parameter # 32 bytes long
    name : Pointer(LibC::Char)
    value : LibGObject::Value
  end

  struct SignalInvocationHint # 12 bytes long
    signal_id : UInt32
    detail : UInt32
    run_type : UInt32
  end

  struct SignalQuery # 56 bytes long
    signal_id : UInt32
    signal_name : Pointer(LibC::Char)
    itype : UInt64
    signal_flags : UInt32
    return_type : UInt64
    n_params : UInt32
    param_types : Pointer(UInt64)
  end

  struct TypeClass # 8 bytes long
    g_type : UInt64
  end

  struct TypeFundamentalInfo # 4 bytes long
    type_flags : UInt32
  end

  struct TypeInfo # 72 bytes long
    class_size : UInt16
    base_init : LibGObject::BaseInitFunc
    base_finalize : LibGObject::BaseFinalizeFunc
    class_init : LibGObject::ClassInitFunc
    class_finalize : LibGObject::ClassFinalizeFunc
    class_data : Pointer(Void)
    instance_size : UInt16
    n_preallocs : UInt16
    instance_init : LibGObject::InstanceInitFunc
    value_table : Pointer(LibGObject::TypeValueTable)
  end

  struct TypeInstance # 8 bytes long
    g_class : Pointer(LibGObject::TypeClass)
  end

  struct TypeInterface # 16 bytes long
    g_type : UInt64
    g_instance_type : UInt64
  end

  struct TypePluginClass # 48 bytes long
    base_iface : LibGObject::TypeInterface
    use_plugin : LibGObject::TypePluginUse
    unuse_plugin : LibGObject::TypePluginUnuse
    complete_type_info : LibGObject::TypePluginCompleteTypeInfo
    complete_interface_info : LibGObject::TypePluginCompleteInterfaceInfo
  end

  struct TypeQuery # 24 bytes long
    type : UInt64
    type_name : Pointer(LibC::Char)
    class_size : UInt32
    instance_size : UInt32
  end

  struct TypeValueTable # 64 bytes long
    value_init : -> Void
    value_free : -> Void
    value_copy : -> Void
    value_peek_pointer : -> Void
    collect_format : Pointer(LibC::Char)
    collect_value : -> Void
    lcopy_format : Pointer(LibC::Char)
    lcopy_value : -> Void
  end

  struct Value # 24 bytes long
    g_type : UInt64
    data : LibGObject::G_ValueDataUnion[2]
  end

  struct ValueArray # 24 bytes long
    n_values : UInt32
    values : Pointer(LibGObject::Value)
    n_prealloced : UInt32
  end

  type WeakRef = Void # Struct with zero bytes

  # Unions

  type TypeCValue = Void # Union with zero bytes

  union G_ValueDataUnion # 8 bytes
    v_int : Int32
    v_uint : UInt32
    v_long : Int64
    v_ulong : UInt64
    v_int64 : Int64
    v_uint64 : UInt64
    v_float : Float32
    v_double : Float64
    v_pointer : Pointer(Void)
  end

  # Objects
  type Binding = Void # Object struct with no fields

  type BindingGroup = Void # Object struct with no fields

  struct InitiallyUnowned
    g_type_instance : LibGObject::TypeInstance
    ref_count : UInt32
    qdata : Pointer(LibGLib::Data)
  end

  struct Object
    g_type_instance : LibGObject::TypeInstance
    ref_count : UInt32
    qdata : Pointer(LibGLib::Data)
  end

  struct ParamSpec
    g_type_instance : LibGObject::TypeInstance
    name : Pointer(LibC::Char)
    flags : UInt32
    value_type : UInt64
    owner_type : UInt64
    _nick : Pointer(LibC::Char)
    _blurb : Pointer(LibC::Char)
    qdata : Pointer(LibGLib::Data)
    ref_count : UInt32
    param_id : UInt32
  end

  struct ParamSpecBoolean
    parent_instance : LibGObject::ParamSpec
    default_value : LibC::Int
  end

  struct ParamSpecBoxed
    parent_instance : LibGObject::ParamSpec
  end

  struct ParamSpecChar
    parent_instance : LibGObject::ParamSpec
    minimum : Int8
    maximum : Int8
    default_value : Int8
  end

  struct ParamSpecDouble
    parent_instance : LibGObject::ParamSpec
    minimum : Float64
    maximum : Float64
    default_value : Float64
    epsilon : Float64
  end

  struct ParamSpecEnum
    parent_instance : LibGObject::ParamSpec
    enum_class : Pointer(LibGObject::EnumClass)
    default_value : Int32
  end

  struct ParamSpecFlags
    parent_instance : LibGObject::ParamSpec
    flags_class : Pointer(LibGObject::FlagsClass)
    default_value : UInt32
  end

  struct ParamSpecFloat
    parent_instance : LibGObject::ParamSpec
    minimum : Float32
    maximum : Float32
    default_value : Float32
    epsilon : Float32
  end

  struct ParamSpecGType
    parent_instance : LibGObject::ParamSpec
    is_a_type : UInt64
  end

  struct ParamSpecInt
    parent_instance : LibGObject::ParamSpec
    minimum : Int32
    maximum : Int32
    default_value : Int32
  end

  struct ParamSpecInt64
    parent_instance : LibGObject::ParamSpec
    minimum : Int64
    maximum : Int64
    default_value : Int64
  end

  struct ParamSpecLong
    parent_instance : LibGObject::ParamSpec
    minimum : Int64
    maximum : Int64
    default_value : Int64
  end

  struct ParamSpecObject
    parent_instance : LibGObject::ParamSpec
  end

  struct ParamSpecOverride
    parent_instance : LibGObject::ParamSpec
    overridden : Pointer(LibGObject::ParamSpec)
  end

  struct ParamSpecParam
    parent_instance : LibGObject::ParamSpec
  end

  struct ParamSpecPointer
    parent_instance : LibGObject::ParamSpec
  end

  struct ParamSpecString
    parent_instance : LibGObject::ParamSpec
    default_value : Pointer(LibC::Char)
    cset_first : Pointer(LibC::Char)
    cset_nth : Pointer(LibC::Char)
    substitutor : Int8
    null_fold_if_empty : UInt32
    ensure_non_null : UInt32
  end

  struct ParamSpecUChar
    parent_instance : LibGObject::ParamSpec
    minimum : UInt8
    maximum : UInt8
    default_value : UInt8
  end

  struct ParamSpecUInt
    parent_instance : LibGObject::ParamSpec
    minimum : UInt32
    maximum : UInt32
    default_value : UInt32
  end

  struct ParamSpecUInt64
    parent_instance : LibGObject::ParamSpec
    minimum : UInt64
    maximum : UInt64
    default_value : UInt64
  end

  struct ParamSpecULong
    parent_instance : LibGObject::ParamSpec
    minimum : UInt64
    maximum : UInt64
    default_value : UInt64
  end

  struct ParamSpecUnichar
    parent_instance : LibGObject::ParamSpec
    default_value : UInt32
  end

  struct ParamSpecValueArray
    parent_instance : LibGObject::ParamSpec
    element_spec : Pointer(LibGObject::ParamSpec)
    fixed_n_elements : UInt32
  end

  struct ParamSpecVariant
    parent_instance : LibGObject::ParamSpec
    type : Pointer(LibGLib::VariantType)
    default_value : Pointer(LibGLib::Variant)
    padding : Pointer(Void)[4]
  end

  type SignalGroup = Void # Object struct with no fields

  struct TypeModule
    parent_instance : LibGObject::Object
    use_count : UInt32
    type_infos : Pointer(LibGLib::SList)
    interface_infos : Pointer(LibGLib::SList)
    name : Pointer(LibC::Char)
  end

  # All C Functions
  fun g_binding_dup_source(this : Void*) : Pointer(Void)
  fun g_binding_dup_target(this : Void*) : Pointer(Void)
  fun g_binding_get_flags(this : Void*) : UInt32
  fun g_binding_get_source(this : Void*) : Pointer(Void)
  fun g_binding_get_source_property(this : Void*) : Pointer(LibC::Char)
  fun g_binding_get_target(this : Void*) : Pointer(Void)
  fun g_binding_get_target_property(this : Void*) : Pointer(LibC::Char)
  fun g_binding_get_type : UInt64
  fun g_binding_group_bind(this : Void*, source_property : Pointer(LibC::Char), target : Pointer(Void), target_property : Pointer(LibC::Char), flags : UInt32) : Void
  fun g_binding_group_bind_with_closures(this : Void*, source_property : Pointer(LibC::Char), target : Pointer(Void), target_property : Pointer(LibC::Char), flags : UInt32, transform_to : Pointer(Void), transform_from : Pointer(Void)) : Void
  fun g_binding_group_dup_source(this : Void*) : Pointer(Void)
  fun g_binding_group_get_type : UInt64
  fun g_binding_group_new : Pointer(Void)
  fun g_binding_group_set_source(this : Void*, source : Pointer(Void)) : Void
  fun g_binding_unbind(this : Void*) : Void
  fun g_boxed_copy(boxed_type : UInt64, src_boxed : Pointer(Void)) : Pointer(Void)
  fun g_boxed_free(boxed_type : UInt64, boxed : Pointer(Void)) : Void
  fun g_cclosure_marshal_BOOLEAN__BOXED_BOXED(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_BOOLEAN__BOXED_BOXED(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_BOOLEAN__FLAGS(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_BOOLEAN__FLAGS(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_STRING__OBJECT_POINTER(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_STRING__OBJECT_POINTER(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__BOOLEAN(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__BOOLEAN(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__BOXED(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__BOXED(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__CHAR(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__CHAR(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__DOUBLE(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__DOUBLE(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__ENUM(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__ENUM(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__FLAGS(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__FLAGS(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__FLOAT(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__FLOAT(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__INT(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__INT(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__LONG(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__LONG(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__OBJECT(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__OBJECT(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__PARAM(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__PARAM(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__POINTER(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__POINTER(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__STRING(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__STRING(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__UCHAR(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__UCHAR(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__UINT(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__UINT(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__UINT_POINTER(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__UINT_POINTER(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__ULONG(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__ULONG(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__VARIANT(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__VARIANT(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__VOID(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_VOID__VOID(closure : Pointer(Void), return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_generic(closure : Pointer(Void), return_gvalue : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_cclosure_marshal_generic(closure : Pointer(Void), return_gvalue : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void), marshal_data : Pointer(Void)) : Void
  fun g_clear_signal_handler(handler_id_ptr : Pointer(UInt64), instance : Pointer(Void)) : Void
  fun g_closure_get_type : UInt64
  fun g_closure_invalidate(this : Void*) : Void
  fun g_closure_invoke(this : Void*, return_value : Pointer(Void), n_param_values : UInt32, param_values : Pointer(Void), invocation_hint : Pointer(Void)) : Void
  fun g_closure_new_object(sizeof_closure : UInt32, object : Pointer(Void)) : Pointer(Void)
  fun g_closure_new_simple(sizeof_closure : UInt32, data : Pointer(Void)) : Pointer(Void)
  fun g_closure_ref(this : Void*) : Pointer(Void)
  fun g_closure_sink(this : Void*) : Void
  fun g_closure_unref(this : Void*) : Void
  fun g_enum_complete_type_info(g_enum_type : UInt64, info : Pointer(Void), const_values : Pointer(Void)) : Void
  fun g_enum_get_value(enum_class : Pointer(Void), value : Int32) : Pointer(Void)
  fun g_enum_get_value_by_name(enum_class : Pointer(Void), name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_enum_get_value_by_nick(enum_class : Pointer(Void), nick : Pointer(LibC::Char)) : Pointer(Void)
  fun g_enum_register_static(name : Pointer(LibC::Char), const_static_values : Pointer(Void)) : UInt64
  fun g_enum_to_string(g_enum_type : UInt64, value : Int32) : Pointer(LibC::Char)
  fun g_flags_complete_type_info(g_flags_type : UInt64, info : Pointer(Void), const_values : Pointer(Void)) : Void
  fun g_flags_get_first_value(flags_class : Pointer(Void), value : UInt32) : Pointer(Void)
  fun g_flags_get_value_by_name(flags_class : Pointer(Void), name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_flags_get_value_by_nick(flags_class : Pointer(Void), nick : Pointer(LibC::Char)) : Pointer(Void)
  fun g_flags_register_static(name : Pointer(LibC::Char), const_static_values : Pointer(Void)) : UInt64
  fun g_flags_to_string(flags_type : UInt64, value : UInt32) : Pointer(LibC::Char)
  fun g_gtype_get_type : UInt64
  fun g_initially_unowned_get_type : UInt64
  fun g_object_bind_property(this : Void*, source_property : Pointer(LibC::Char), target : Pointer(Void), target_property : Pointer(LibC::Char), flags : UInt32) : Pointer(Void)
  fun g_object_bind_property_with_closures(this : Void*, source_property : Pointer(LibC::Char), target : Pointer(Void), target_property : Pointer(LibC::Char), flags : UInt32, transform_to : Pointer(Void), transform_from : Pointer(Void)) : Pointer(Void)
  fun g_object_class_find_property(this : Void*, property_name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_object_class_install_properties(this : Void*, n_pspecs : UInt32, pspecs : Pointer(Pointer(Void))) : Void
  fun g_object_class_install_property(this : Void*, property_id : UInt32, pspec : Pointer(Void)) : Void
  fun g_object_class_list_properties(this : Void*, n_properties : Pointer(UInt32)) : Pointer(Pointer(Void))
  fun g_object_class_override_property(this : Void*, property_id : UInt32, name : Pointer(LibC::Char)) : Void
  fun g_object_compat_control(what : UInt64, data : Pointer(Void)) : UInt64
  fun g_object_force_floating(this : Void*) : Void
  fun g_object_freeze_notify(this : Void*) : Void
  fun g_object_get_data(this : Void*, key : Pointer(LibC::Char)) : Pointer(Void)
  fun g_object_get_property(this : Void*, property_name : Pointer(LibC::Char), value : Pointer(Void)) : Void
  fun g_object_get_qdata(this : Void*, quark : UInt32) : Pointer(Void)
  fun g_object_get_type : UInt64
  fun g_object_getv(this : Void*, n_properties : UInt32, names : Pointer(Pointer(LibC::Char)), values : Pointer(Void)) : Void
  fun g_object_interface_find_property(g_iface : Pointer(Void), property_name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_object_interface_install_property(g_iface : Pointer(Void), pspec : Pointer(Void)) : Void
  fun g_object_interface_list_properties(g_iface : Pointer(Void), n_properties_p : Pointer(UInt32)) : Pointer(Pointer(Void))
  fun g_object_is_floating(this : Void*) : LibC::Int
  fun g_object_newv(object_type : UInt64, n_parameters : UInt32, parameters : Pointer(Void)) : Pointer(Void)
  fun g_object_notify(this : Void*, property_name : Pointer(LibC::Char)) : Void
  fun g_object_notify_by_pspec(this : Void*, pspec : Pointer(Void)) : Void
  fun g_object_ref(this : Void*) : Pointer(Void)
  fun g_object_ref_sink(this : Void*) : Pointer(Void)
  fun g_object_run_dispose(this : Void*) : Void
  fun g_object_set_data(this : Void*, key : Pointer(LibC::Char), data : Pointer(Void)) : Void
  fun g_object_set_property(this : Void*, property_name : Pointer(LibC::Char), value : Pointer(Void)) : Void
  fun g_object_steal_data(this : Void*, key : Pointer(LibC::Char)) : Pointer(Void)
  fun g_object_steal_qdata(this : Void*, quark : UInt32) : Pointer(Void)
  fun g_object_thaw_notify(this : Void*) : Void
  fun g_object_unref(this : Void*) : Void
  fun g_object_watch_closure(this : Void*, closure : Pointer(Void)) : Void
  fun g_param_spec_boolean(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), default_value : LibC::Int, flags : UInt32) : Pointer(Void)
  fun g_param_spec_boxed(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), boxed_type : UInt64, flags : UInt32) : Pointer(Void)
  fun g_param_spec_char(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), minimum : Int8, maximum : Int8, default_value : Int8, flags : UInt32) : Pointer(Void)
  fun g_param_spec_double(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), minimum : Float64, maximum : Float64, default_value : Float64, flags : UInt32) : Pointer(Void)
  fun g_param_spec_enum(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), enum_type : UInt64, default_value : Int32, flags : UInt32) : Pointer(Void)
  fun g_param_spec_flags(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), flags_type : UInt64, default_value : UInt32, flags : UInt32) : Pointer(Void)
  fun g_param_spec_float(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), minimum : Float32, maximum : Float32, default_value : Float32, flags : UInt32) : Pointer(Void)
  fun g_param_spec_get_blurb(this : Void*) : Pointer(LibC::Char)
  fun g_param_spec_get_default_value(this : Void*) : Pointer(Void)
  fun g_param_spec_get_name(this : Void*) : Pointer(LibC::Char)
  fun g_param_spec_get_name_quark(this : Void*) : UInt32
  fun g_param_spec_get_nick(this : Void*) : Pointer(LibC::Char)
  fun g_param_spec_get_qdata(this : Void*, quark : UInt32) : Pointer(Void)
  fun g_param_spec_get_redirect_target(this : Void*) : Pointer(Void)
  fun g_param_spec_gtype(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), is_a_type : UInt64, flags : UInt32) : Pointer(Void)
  fun g_param_spec_int(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), minimum : Int32, maximum : Int32, default_value : Int32, flags : UInt32) : Pointer(Void)
  fun g_param_spec_int64(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), minimum : Int64, maximum : Int64, default_value : Int64, flags : UInt32) : Pointer(Void)
  fun g_param_spec_is_valid_name(name : Pointer(LibC::Char)) : LibC::Int
  fun g_param_spec_long(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), minimum : Int64, maximum : Int64, default_value : Int64, flags : UInt32) : Pointer(Void)
  fun g_param_spec_object(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), object_type : UInt64, flags : UInt32) : Pointer(Void)
  fun g_param_spec_param(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), param_type : UInt64, flags : UInt32) : Pointer(Void)
  fun g_param_spec_pointer(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), flags : UInt32) : Pointer(Void)
  fun g_param_spec_pool_insert(this : Void*, pspec : Pointer(Void), owner_type : UInt64) : Void
  fun g_param_spec_pool_list(this : Void*, owner_type : UInt64, n_pspecs_p : Pointer(UInt32)) : Pointer(Pointer(Void))
  fun g_param_spec_pool_list_owned(this : Void*, owner_type : UInt64) : Pointer(LibGLib::List)
  fun g_param_spec_pool_lookup(this : Void*, param_name : Pointer(LibC::Char), owner_type : UInt64, walk_ancestors : LibC::Int) : Pointer(Void)
  fun g_param_spec_pool_remove(this : Void*, pspec : Pointer(Void)) : Void
  fun g_param_spec_set_qdata(this : Void*, quark : UInt32, data : Pointer(Void)) : Void
  fun g_param_spec_sink(this : Void*) : Void
  fun g_param_spec_steal_qdata(this : Void*, quark : UInt32) : Pointer(Void)
  fun g_param_spec_string(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), default_value : Pointer(LibC::Char), flags : UInt32) : Pointer(Void)
  fun g_param_spec_uchar(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), minimum : UInt8, maximum : UInt8, default_value : UInt8, flags : UInt32) : Pointer(Void)
  fun g_param_spec_uint(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), minimum : UInt32, maximum : UInt32, default_value : UInt32, flags : UInt32) : Pointer(Void)
  fun g_param_spec_uint64(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), minimum : UInt64, maximum : UInt64, default_value : UInt64, flags : UInt32) : Pointer(Void)
  fun g_param_spec_ulong(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), minimum : UInt64, maximum : UInt64, default_value : UInt64, flags : UInt32) : Pointer(Void)
  fun g_param_spec_unichar(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), default_value : UInt32, flags : UInt32) : Pointer(Void)
  fun g_param_spec_variant(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), type : Pointer(Void), default_value : Pointer(Void), flags : UInt32) : Pointer(Void)
  fun g_param_type_register_static(name : Pointer(LibC::Char), pspec_info : Pointer(Void)) : UInt64
  fun g_param_value_convert(pspec : Pointer(Void), src_value : Pointer(Void), dest_value : Pointer(Void), strict_validation : LibC::Int) : LibC::Int
  fun g_param_value_defaults(pspec : Pointer(Void), value : Pointer(Void)) : LibC::Int
  fun g_param_value_set_default(pspec : Pointer(Void), value : Pointer(Void)) : Void
  fun g_param_value_validate(pspec : Pointer(Void), value : Pointer(Void)) : LibC::Int
  fun g_param_values_cmp(pspec : Pointer(Void), value1 : Pointer(Void), value2 : Pointer(Void)) : Int32
  fun g_pointer_type_register_static(name : Pointer(LibC::Char)) : UInt64
  fun g_signal_accumulator_first_wins(ihint : Pointer(Void), return_accu : Pointer(Void), handler_return : Pointer(Void), dummy : Pointer(Void)) : LibC::Int
  fun g_signal_accumulator_true_handled(ihint : Pointer(Void), return_accu : Pointer(Void), handler_return : Pointer(Void), dummy : Pointer(Void)) : LibC::Int
  fun g_signal_add_emission_hook(signal_id : UInt32, detail : UInt32, hook_func : SignalEmissionHook, hook_data : Pointer(Void), data_destroy : LibGLib::DestroyNotify) : UInt64
  fun g_signal_chain_from_overridden(instance_and_params : Pointer(Void), return_value : Pointer(Void)) : Void
  fun g_signal_connect_closure(instance : Pointer(Void), detailed_signal : Pointer(LibC::Char), closure : Pointer(Void), after : LibC::Int) : UInt64
  fun g_signal_connect_closure_by_id(instance : Pointer(Void), signal_id : UInt32, detail : UInt32, closure : Pointer(Void), after : LibC::Int) : UInt64
  fun g_signal_emitv(instance_and_params : Pointer(Void), signal_id : UInt32, detail : UInt32, return_value : Pointer(Void)) : Void
  fun g_signal_get_invocation_hint(instance : Pointer(Void)) : Pointer(Void)
  fun g_signal_group_block(this : Void*) : Void
  fun g_signal_group_connect_data(this : Void*, detailed_signal : Pointer(LibC::Char), c_handler : Callback, data : Pointer(Void), notify : ClosureNotify, flags : UInt32) : Void
  fun g_signal_group_connect_swapped(this : Void*, detailed_signal : Pointer(LibC::Char), c_handler : Callback, data : Pointer(Void)) : Void
  fun g_signal_group_dup_target(this : Void*) : Pointer(Void)
  fun g_signal_group_get_type : UInt64
  fun g_signal_group_new(target_type : UInt64) : Pointer(Void)
  fun g_signal_group_set_target(this : Void*, target : Pointer(Void)) : Void
  fun g_signal_group_unblock(this : Void*) : Void
  fun g_signal_handler_block(instance : Pointer(Void), handler_id : UInt64) : Void
  fun g_signal_handler_disconnect(instance : Pointer(Void), handler_id : UInt64) : Void
  fun g_signal_handler_find(instance : Pointer(Void), mask : UInt32, signal_id : UInt32, detail : UInt32, closure : Pointer(Void), func : Pointer(Void), data : Pointer(Void)) : UInt64
  fun g_signal_handler_is_connected(instance : Pointer(Void), handler_id : UInt64) : LibC::Int
  fun g_signal_handler_unblock(instance : Pointer(Void), handler_id : UInt64) : Void
  fun g_signal_handlers_block_matched(instance : Pointer(Void), mask : UInt32, signal_id : UInt32, detail : UInt32, closure : Pointer(Void), func : Pointer(Void), data : Pointer(Void)) : UInt32
  fun g_signal_handlers_destroy(instance : Pointer(Void)) : Void
  fun g_signal_handlers_disconnect_matched(instance : Pointer(Void), mask : UInt32, signal_id : UInt32, detail : UInt32, closure : Pointer(Void), func : Pointer(Void), data : Pointer(Void)) : UInt32
  fun g_signal_handlers_unblock_matched(instance : Pointer(Void), mask : UInt32, signal_id : UInt32, detail : UInt32, closure : Pointer(Void), func : Pointer(Void), data : Pointer(Void)) : UInt32
  fun g_signal_has_handler_pending(instance : Pointer(Void), signal_id : UInt32, detail : UInt32, may_be_blocked : LibC::Int) : LibC::Int
  fun g_signal_is_valid_name(name : Pointer(LibC::Char)) : LibC::Int
  fun g_signal_list_ids(itype : UInt64, n_ids : Pointer(UInt32)) : Pointer(UInt32)
  fun g_signal_lookup(name : Pointer(LibC::Char), itype : UInt64) : UInt32
  fun g_signal_name(signal_id : UInt32) : Pointer(LibC::Char)
  fun g_signal_override_class_closure(signal_id : UInt32, instance_type : UInt64, class_closure : Pointer(Void)) : Void
  fun g_signal_parse_name(detailed_signal : Pointer(LibC::Char), itype : UInt64, signal_id_p : Pointer(UInt32), detail_p : Pointer(UInt32), force_detail_quark : LibC::Int) : LibC::Int
  fun g_signal_query(signal_id : UInt32, query : Pointer(Void)) : Void
  fun g_signal_remove_emission_hook(signal_id : UInt32, hook_id : UInt64) : Void
  fun g_signal_set_va_marshaller(signal_id : UInt32, instance_type : UInt64, va_marshaller : Pointer(Void)) : Void
  fun g_signal_stop_emission(instance : Pointer(Void), signal_id : UInt32, detail : UInt32) : Void
  fun g_signal_stop_emission_by_name(instance : Pointer(Void), detailed_signal : Pointer(LibC::Char)) : Void
  fun g_signal_type_cclosure_new(itype : UInt64, struct_offset : UInt32) : Pointer(Void)
  fun g_source_set_closure(source : Pointer(Void), closure : Pointer(Void)) : Void
  fun g_source_set_dummy_callback(source : Pointer(Void)) : Void
  fun g_strdup_value_contents(value : Pointer(Void)) : Pointer(LibC::Char)
  fun g_type_add_class_private(class_type : UInt64, private_size : UInt64) : Void
  fun g_type_add_instance_private(class_type : UInt64, private_size : UInt64) : Int32
  fun g_type_add_interface_dynamic(instance_type : UInt64, interface_type : UInt64, plugin : Pointer(Void)) : Void
  fun g_type_add_interface_static(instance_type : UInt64, interface_type : UInt64, info : Pointer(Void)) : Void
  fun g_type_check_class_is_a(g_class : Pointer(Void), is_a_type : UInt64) : LibC::Int
  fun g_type_check_instance(instance : Pointer(Void)) : LibC::Int
  fun g_type_check_instance_is_a(instance : Pointer(Void), iface_type : UInt64) : LibC::Int
  fun g_type_check_instance_is_fundamentally_a(instance : Pointer(Void), fundamental_type : UInt64) : LibC::Int
  fun g_type_check_is_value_type(type : UInt64) : LibC::Int
  fun g_type_check_value(value : Pointer(Void)) : LibC::Int
  fun g_type_check_value_holds(value : Pointer(Void), type : UInt64) : LibC::Int
  fun g_type_children(type : UInt64, n_children : Pointer(UInt32)) : Pointer(UInt64)
  fun g_type_class_add_private(this : Void*, private_size : UInt64) : Void
  fun g_type_class_adjust_private_offset(g_class : Pointer(Void), private_size_or_offset : Pointer(Int32)) : Void
  fun g_type_class_adjust_private_offset(g_class : Pointer(Void), private_size_or_offset : Pointer(Int32)) : Void
  fun g_type_class_get_private(this : Void*, private_type : UInt64) : Pointer(Void)
  fun g_type_class_peek(type : UInt64) : Pointer(Void)
  fun g_type_class_peek(type : UInt64) : Pointer(Void)
  fun g_type_class_peek_parent(this : Void*) : Pointer(Void)
  fun g_type_class_peek_static(type : UInt64) : Pointer(Void)
  fun g_type_class_peek_static(type : UInt64) : Pointer(Void)
  fun g_type_class_ref(type : UInt64) : Pointer(Void)
  fun g_type_class_ref(type : UInt64) : Pointer(Void)
  fun g_type_class_unref(this : Void*) : Void
  fun g_type_default_interface_peek(g_type : UInt64) : Pointer(Void)
  fun g_type_default_interface_ref(g_type : UInt64) : Pointer(Void)
  fun g_type_default_interface_unref(g_iface : Pointer(Void)) : Void
  fun g_type_depth(type : UInt64) : UInt32
  fun g_type_ensure(type : UInt64) : Void
  fun g_type_free_instance(instance : Pointer(Void)) : Void
  fun g_type_from_name(name : Pointer(LibC::Char)) : UInt64
  fun g_type_fundamental(type_id : UInt64) : UInt64
  fun g_type_fundamental_next : UInt64
  fun g_type_get_instance_count(type : UInt64) : Int32
  fun g_type_get_plugin(type : UInt64) : Pointer(Void)
  fun g_type_get_qdata(type : UInt64, quark : UInt32) : Pointer(Void)
  fun g_type_get_type_registration_serial : UInt32
  fun g_type_init : Void
  fun g_type_init_with_debug_flags(debug_flags : UInt32) : Void
  fun g_type_instance_get_private(this : Void*, private_type : UInt64) : Pointer(Void)
  fun g_type_interface_add_prerequisite(interface_type : UInt64, prerequisite_type : UInt64) : Void
  fun g_type_interface_add_prerequisite(interface_type : UInt64, prerequisite_type : UInt64) : Void
  fun g_type_interface_get_plugin(instance_type : UInt64, interface_type : UInt64) : Pointer(Void)
  fun g_type_interface_get_plugin(instance_type : UInt64, interface_type : UInt64) : Pointer(Void)
  fun g_type_interface_instantiatable_prerequisite(interface_type : UInt64) : UInt64
  fun g_type_interface_instantiatable_prerequisite(interface_type : UInt64) : UInt64
  fun g_type_interface_peek(instance_class : Pointer(Void), iface_type : UInt64) : Pointer(Void)
  fun g_type_interface_peek(instance_class : Pointer(Void), iface_type : UInt64) : Pointer(Void)
  fun g_type_interface_peek_parent(this : Void*) : Pointer(Void)
  fun g_type_interface_prerequisites(interface_type : UInt64, n_prerequisites : Pointer(UInt32)) : Pointer(UInt64)
  fun g_type_interface_prerequisites(interface_type : UInt64, n_prerequisites : Pointer(UInt32)) : Pointer(UInt64)
  fun g_type_interfaces(type : UInt64, n_interfaces : Pointer(UInt32)) : Pointer(UInt64)
  fun g_type_is_a(type : UInt64, is_a_type : UInt64) : LibC::Int
  fun g_type_module_add_interface(this : Void*, instance_type : UInt64, interface_type : UInt64, interface_info : Pointer(Void)) : Void
  fun g_type_module_get_type : UInt64
  fun g_type_module_register_enum(this : Void*, name : Pointer(LibC::Char), const_static_values : Pointer(Void)) : UInt64
  fun g_type_module_register_flags(this : Void*, name : Pointer(LibC::Char), const_static_values : Pointer(Void)) : UInt64
  fun g_type_module_register_type(this : Void*, parent_type : UInt64, type_name : Pointer(LibC::Char), type_info : Pointer(Void), flags : UInt32) : UInt64
  fun g_type_module_set_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun g_type_module_unuse(this : Void*) : Void
  fun g_type_module_use(this : Void*) : LibC::Int
  fun g_type_name(type : UInt64) : Pointer(LibC::Char)
  fun g_type_name_from_class(g_class : Pointer(Void)) : Pointer(LibC::Char)
  fun g_type_name_from_instance(instance : Pointer(Void)) : Pointer(LibC::Char)
  fun g_type_next_base(leaf_type : UInt64, root_type : UInt64) : UInt64
  fun g_type_parent(type : UInt64) : UInt64
  fun g_type_plugin_complete_interface_info(this : Void*, instance_type : UInt64, interface_type : UInt64, info : Pointer(Void)) : Void
  fun g_type_plugin_complete_type_info(this : Void*, g_type : UInt64, info : Pointer(Void), value_table : Pointer(Void)) : Void
  fun g_type_plugin_get_type : UInt64
  fun g_type_plugin_unuse(this : Void*) : Void
  fun g_type_plugin_use(this : Void*) : Void
  fun g_type_qname(type : UInt64) : UInt32
  fun g_type_query(type : UInt64, query : Pointer(Void)) : Void
  fun g_type_register_dynamic(parent_type : UInt64, type_name : Pointer(LibC::Char), plugin : Pointer(Void), flags : UInt32) : UInt64
  fun g_type_register_fundamental(type_id : UInt64, type_name : Pointer(LibC::Char), info : Pointer(Void), finfo : Pointer(Void), flags : UInt32) : UInt64
  fun g_type_register_static(parent_type : UInt64, type_name : Pointer(LibC::Char), info : Pointer(Void), flags : UInt32) : UInt64
  fun g_type_set_qdata(type : UInt64, quark : UInt32, data : Pointer(Void)) : Void
  fun g_type_test_flags(type : UInt64, flags : UInt32) : LibC::Int
  fun g_value_array_append(this : Void*, value : Pointer(Void)) : Pointer(Void)
  fun g_value_array_copy(this : Void*) : Pointer(Void)
  fun g_value_array_get_nth(this : Void*, index_ : UInt32) : Pointer(Void)
  fun g_value_array_get_type : UInt64
  fun g_value_array_insert(this : Void*, index_ : UInt32, value : Pointer(Void)) : Pointer(Void)
  fun g_value_array_new(n_prealloced : UInt32) : Pointer(Void)
  fun g_value_array_prepend(this : Void*, value : Pointer(Void)) : Pointer(Void)
  fun g_value_array_remove(this : Void*, index_ : UInt32) : Pointer(Void)
  fun g_value_array_sort_with_data(this : Void*, compare_func : LibGLib::CompareDataFunc, user_data : Pointer(Void)) : Pointer(Void)
  fun g_value_copy(this : Void*, dest_value : Pointer(Void)) : Void
  fun g_value_dup_object(this : Void*) : Pointer(Void)
  fun g_value_dup_string(this : Void*) : Pointer(LibC::Char)
  fun g_value_dup_variant(this : Void*) : Pointer(Void)
  fun g_value_fits_pointer(this : Void*) : LibC::Int
  fun g_value_get_boolean(this : Void*) : LibC::Int
  fun g_value_get_boxed(this : Void*) : Pointer(Void)
  fun g_value_get_char(this : Void*) : Int8
  fun g_value_get_double(this : Void*) : Float64
  fun g_value_get_enum(this : Void*) : Int32
  fun g_value_get_flags(this : Void*) : UInt32
  fun g_value_get_float(this : Void*) : Float32
  fun g_value_get_gtype(this : Void*) : UInt64
  fun g_value_get_int(this : Void*) : Int32
  fun g_value_get_int64(this : Void*) : Int64
  fun g_value_get_long(this : Void*) : Int64
  fun g_value_get_object(this : Void*) : Pointer(Void)
  fun g_value_get_param(this : Void*) : Pointer(Void)
  fun g_value_get_pointer(this : Void*) : Pointer(Void)
  fun g_value_get_schar(this : Void*) : Int8
  fun g_value_get_string(this : Void*) : Pointer(LibC::Char)
  fun g_value_get_type : UInt64
  fun g_value_get_uchar(this : Void*) : UInt8
  fun g_value_get_uint(this : Void*) : UInt32
  fun g_value_get_uint64(this : Void*) : UInt64
  fun g_value_get_ulong(this : Void*) : UInt64
  fun g_value_get_variant(this : Void*) : Pointer(Void)
  fun g_value_init(this : Void*, g_type : UInt64) : Pointer(Void)
  fun g_value_init_from_instance(this : Void*, instance : Pointer(Void)) : Void
  fun g_value_peek_pointer(this : Void*) : Pointer(Void)
  fun g_value_reset(this : Void*) : Pointer(Void)
  fun g_value_set_boolean(this : Void*, v_boolean : LibC::Int) : Void
  fun g_value_set_boxed(this : Void*, v_boxed : Pointer(Void)) : Void
  fun g_value_set_boxed_take_ownership(this : Void*, v_boxed : Pointer(Void)) : Void
  fun g_value_set_char(this : Void*, v_char : Int8) : Void
  fun g_value_set_double(this : Void*, v_double : Float64) : Void
  fun g_value_set_enum(this : Void*, v_enum : Int32) : Void
  fun g_value_set_flags(this : Void*, v_flags : UInt32) : Void
  fun g_value_set_float(this : Void*, v_float : Float32) : Void
  fun g_value_set_gtype(this : Void*, v_gtype : UInt64) : Void
  fun g_value_set_instance(this : Void*, instance : Pointer(Void)) : Void
  fun g_value_set_int(this : Void*, v_int : Int32) : Void
  fun g_value_set_int64(this : Void*, v_int64 : Int64) : Void
  fun g_value_set_interned_string(this : Void*, v_string : Pointer(LibC::Char)) : Void
  fun g_value_set_long(this : Void*, v_long : Int64) : Void
  fun g_value_set_object(this : Void*, v_object : Pointer(Void)) : Void
  fun g_value_set_param(this : Void*, param : Pointer(Void)) : Void
  fun g_value_set_pointer(this : Void*, v_pointer : Pointer(Void)) : Void
  fun g_value_set_schar(this : Void*, v_char : Int8) : Void
  fun g_value_set_static_boxed(this : Void*, v_boxed : Pointer(Void)) : Void
  fun g_value_set_static_string(this : Void*, v_string : Pointer(LibC::Char)) : Void
  fun g_value_set_string(this : Void*, v_string : Pointer(LibC::Char)) : Void
  fun g_value_set_string_take_ownership(this : Void*, v_string : Pointer(LibC::Char)) : Void
  fun g_value_set_uchar(this : Void*, v_uchar : UInt8) : Void
  fun g_value_set_uint(this : Void*, v_uint : UInt32) : Void
  fun g_value_set_uint64(this : Void*, v_uint64 : UInt64) : Void
  fun g_value_set_ulong(this : Void*, v_ulong : UInt64) : Void
  fun g_value_set_variant(this : Void*, variant : Pointer(Void)) : Void
  fun g_value_take_boxed(this : Void*, v_boxed : Pointer(Void)) : Void
  fun g_value_take_string(this : Void*, v_string : Pointer(LibC::Char)) : Void
  fun g_value_take_variant(this : Void*, variant : Pointer(Void)) : Void
  fun g_value_transform(this : Void*, dest_value : Pointer(Void)) : LibC::Int
  fun g_value_type_compatible(src_type : UInt64, dest_type : UInt64) : LibC::Int
  fun g_value_type_compatible(src_type : UInt64, dest_type : UInt64) : LibC::Int
  fun g_value_type_transformable(src_type : UInt64, dest_type : UInt64) : LibC::Int
  fun g_value_type_transformable(src_type : UInt64, dest_type : UInt64) : LibC::Int
  fun g_value_unset(this : Void*) : Void
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
  fun intern : UInt64
end
