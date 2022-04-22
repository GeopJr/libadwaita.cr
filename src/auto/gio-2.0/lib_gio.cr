@[Link("gio-2.0", pkg_config: "gio-2.0")]

lib LibGio
  # Flags
  type AppInfoCreateFlags = UInt32
  type ApplicationFlags = UInt32
  type AskPasswordFlags = UInt32
  type BusNameOwnerFlags = UInt32
  type BusNameWatcherFlags = UInt32
  type ConverterFlags = UInt32
  type DBusCallFlags = UInt32
  type DBusCapabilityFlags = UInt32
  type DBusConnectionFlags = UInt32
  type DBusInterfaceSkeletonFlags = UInt32
  type DBusMessageFlags = UInt32
  type DBusObjectManagerClientFlags = UInt32
  type DBusPropertyInfoFlags = UInt32
  type DBusProxyFlags = UInt32
  type DBusSendMessageFlags = UInt32
  type DBusServerFlags = UInt32
  type DBusSignalFlags = UInt32
  type DBusSubtreeFlags = UInt32
  type DriveStartFlags = UInt32
  type FileAttributeInfoFlags = UInt32
  type FileCopyFlags = UInt32
  type FileCreateFlags = UInt32
  type FileMeasureFlags = UInt32
  type FileMonitorFlags = UInt32
  type FileQueryInfoFlags = UInt32
  type IOStreamSpliceFlags = UInt32
  type MountMountFlags = UInt32
  type MountUnmountFlags = UInt32
  type OutputStreamSpliceFlags = UInt32
  type ResolverNameLookupFlags = UInt32
  type ResourceFlags = UInt32
  type ResourceLookupFlags = UInt32
  type SettingsBindFlags = UInt32
  type SocketMsgFlags = UInt32
  type SubprocessFlags = UInt32
  type TestDBusFlags = UInt32
  type TlsCertificateFlags = UInt32
  type TlsDatabaseVerifyFlags = UInt32
  type TlsPasswordFlags = UInt32

  # Enums
  type BusType = Int32
  type ConverterResult = UInt32
  type CredentialsType = UInt32
  type DBusError = UInt32
  type DBusMessageByteOrder = UInt32
  type DBusMessageHeaderField = UInt32
  type DBusMessageType = UInt32
  type DataStreamByteOrder = UInt32
  type DataStreamNewlineType = UInt32
  type DriveStartStopType = UInt32
  type EmblemOrigin = UInt32
  type FileAttributeStatus = UInt32
  type FileAttributeType = UInt32
  type FileMonitorEvent = UInt32
  type FileType = UInt32
  type FilesystemPreviewType = UInt32
  type IOErrorEnum = UInt32
  type IOModuleScopeFlags = UInt32
  type MemoryMonitorWarningLevel = UInt32
  type MountOperationResult = UInt32
  type NetworkConnectivity = UInt32
  type NotificationPriority = UInt32
  type PasswordSave = UInt32
  type PollableReturn = Int32
  type ResolverError = UInt32
  type ResolverRecordType = UInt32
  type ResourceError = UInt32
  type SocketClientEvent = UInt32
  type SocketFamily = UInt32
  type SocketListenerEvent = UInt32
  type SocketProtocol = Int32
  type SocketType = UInt32
  type TlsAuthenticationMode = UInt32
  type TlsCertificateRequestFlags = UInt32
  type TlsChannelBindingError = UInt32
  type TlsChannelBindingType = UInt32
  type TlsDatabaseLookupFlags = UInt32
  type TlsError = UInt32
  type TlsInteractionResult = UInt32
  type TlsProtocolVersion = UInt32
  type TlsRehandshakeMode = UInt32
  type UnixSocketAddressType = UInt32
  type ZlibCompressorFormat = UInt32

  # Callbacks
  alias AsyncReadyCallback = Pointer(LibGObject::Object), Pointer(LibGio::AsyncResult), Pointer(Void) -> Void
  alias BusAcquiredCallback = Pointer(LibGio::DBusConnection), Pointer(LibC::Char), Pointer(Void) -> Void
  alias BusNameAcquiredCallback = Pointer(LibGio::DBusConnection), Pointer(LibC::Char), Pointer(Void) -> Void
  alias BusNameAppearedCallback = Pointer(LibGio::DBusConnection), Pointer(LibC::Char), Pointer(LibC::Char), Pointer(Void) -> Void
  alias BusNameLostCallback = Pointer(LibGio::DBusConnection), Pointer(LibC::Char), Pointer(Void) -> Void
  alias BusNameVanishedCallback = Pointer(LibGio::DBusConnection), Pointer(LibC::Char), Pointer(Void) -> Void
  alias CancellableSourceFunc = Pointer(LibGio::Cancellable), Pointer(Void) -> LibC::Int
  alias DBusInterfaceGetPropertyFunc = Pointer(LibGio::DBusConnection), Pointer(LibC::Char), Pointer(LibC::Char), Pointer(LibC::Char), Pointer(LibC::Char), Pointer(Void), Pointer(Void) -> Pointer(LibGLib::Variant)
  alias DBusInterfaceMethodCallFunc = Pointer(LibGio::DBusConnection), Pointer(LibC::Char), Pointer(LibC::Char), Pointer(LibC::Char), Pointer(LibC::Char), Pointer(LibGLib::Variant), Pointer(LibGio::DBusMethodInvocation), Pointer(Void) -> Void
  alias DBusInterfaceSetPropertyFunc = Pointer(LibGio::DBusConnection), Pointer(LibC::Char), Pointer(LibC::Char), Pointer(LibC::Char), Pointer(LibC::Char), Pointer(LibGLib::Variant), Pointer(Void), Pointer(Void) -> LibC::Int
  alias DBusMessageFilterFunction = Pointer(LibGio::DBusConnection), Pointer(LibGio::DBusMessage), LibC::Int, Pointer(Void) -> Pointer(LibGio::DBusMessage)
  alias DBusProxyTypeFunc = Pointer(LibGio::DBusObjectManagerClient), Pointer(LibC::Char), Pointer(LibC::Char), Pointer(Void) -> UInt64
  alias DBusSignalCallback = Pointer(LibGio::DBusConnection), Pointer(LibC::Char), Pointer(LibC::Char), Pointer(LibC::Char), Pointer(LibC::Char), Pointer(LibGLib::Variant), Pointer(Void) -> Void
  alias DBusSubtreeDispatchFunc = Pointer(LibGio::DBusConnection), Pointer(LibC::Char), Pointer(LibC::Char), Pointer(LibC::Char), Pointer(LibC::Char), Pointer(Void), Pointer(Void) -> Pointer(LibGio::DBusInterfaceVTable)
  alias DBusSubtreeEnumerateFunc = Pointer(LibGio::DBusConnection), Pointer(LibC::Char), Pointer(LibC::Char), Pointer(Void) -> Pointer(Pointer(LibC::Char))
  alias DBusSubtreeIntrospectFunc = Pointer(LibGio::DBusConnection), Pointer(LibC::Char), Pointer(LibC::Char), Pointer(LibC::Char), Pointer(Void) -> Pointer(Pointer(Void))
  alias DatagramBasedSourceFunc = Pointer(LibGio::DatagramBased), UInt32, Pointer(Void) -> LibC::Int
  alias DesktopAppLaunchCallback = Pointer(LibGio::DesktopAppInfo), Int32, Pointer(Void) -> Void
  alias FileMeasureProgressCallback = LibC::Int, UInt64, UInt64, UInt64, Pointer(Void) -> Void
  alias FileProgressCallback = Int64, Int64, Pointer(Void) -> Void
  alias FileReadMoreCallback = Pointer(LibC::Char), Int64, Pointer(Void) -> LibC::Int
  alias IOSchedulerJobFunc = Pointer(LibGio::IOSchedulerJob), Pointer(LibGio::Cancellable), Pointer(Void) -> LibC::Int
  alias PollableSourceFunc = Pointer(LibGObject::Object), Pointer(Void) -> LibC::Int
  alias ReallocFunc = Pointer(Void), UInt64 -> Pointer(Void)
  alias SettingsBindGetMapping = Pointer(LibGObject::Value), Pointer(LibGLib::Variant), Pointer(Void) -> LibC::Int
  alias SettingsBindSetMapping = Pointer(LibGObject::Value), Pointer(LibGLib::VariantType), Pointer(Void) -> Pointer(LibGLib::Variant)
  alias SettingsGetMapping = Pointer(LibGLib::Variant), Pointer(Void), Pointer(Void) -> LibC::Int
  alias SimpleAsyncThreadFunc = Pointer(LibGio::SimpleAsyncResult), Pointer(LibGObject::Object), Pointer(LibGio::Cancellable) -> Void
  alias SocketSourceFunc = Pointer(LibGio::Socket), UInt32, Pointer(Void) -> LibC::Int
  alias TaskThreadFunc = Pointer(LibGio::Task), Pointer(LibGObject::Object), Pointer(Void), Pointer(LibGio::Cancellable) -> Void
  alias VfsFileLookupFunc = Pointer(LibGio::Vfs), Pointer(LibC::Char), Pointer(Void) -> Pointer(LibGio::File)

  # Interface types
  type Action = Void
  type ActionGroup = Void
  type ActionMap = Void
  type AppInfo = Void
  type AsyncInitable = Void
  type AsyncResult = Void
  type Converter = Void
  type DBusInterface = Void
  type DBusObject = Void
  type DBusObjectManager = Void
  type DatagramBased = Void
  type DesktopAppInfoLookup = Void
  type Drive = Void
  type DtlsClientConnection = Void
  type DtlsConnection = Void
  type DtlsServerConnection = Void
  type File = Void
  type FileDescriptorBased = Void
  type Icon = Void
  type Initable = Void
  type ListModel = Void
  type LoadableIcon = Void
  type MemoryMonitor = Void
  type Mount = Void
  type NetworkMonitor = Void
  type PollableInputStream = Void
  type PollableOutputStream = Void
  type PowerProfileMonitor = Void
  type Proxy = Void
  type ProxyResolver = Void
  type RemoteActionGroup = Void
  type Seekable = Void
  type SocketConnectable = Void
  type TlsBackend = Void
  type TlsClientConnection = Void
  type TlsFileDatabase = Void
  type TlsServerConnection = Void
  type Volume = Void

  # Structs

  struct ActionEntry # 64 bytes long
    name : Pointer(LibC::Char)
    activate : -> Void
    parameter_type : Pointer(LibC::Char)
    state : Pointer(LibC::Char)
    change_state : -> Void
    padding : UInt64[3]
  end

  struct ActionGroupInterface # 128 bytes long
    g_iface : LibGObject::TypeInterface
    has_action : -> Void
    list_actions : -> Void
    get_action_enabled : -> Void
    get_action_parameter_type : -> Void
    get_action_state_type : -> Void
    get_action_state_hint : -> Void
    get_action_state : -> Void
    change_action_state : -> Void
    activate_action : -> Void
    action_added : -> Void
    action_removed : -> Void
    action_enabled_changed : -> Void
    action_state_changed : -> Void
    query_action : -> Void
  end

  struct ActionInterface # 80 bytes long
    g_iface : LibGObject::TypeInterface
    get_name : -> Void
    get_parameter_type : -> Void
    get_state_type : -> Void
    get_state_hint : -> Void
    get_enabled : -> Void
    get_state : -> Void
    change_state : -> Void
    activate : -> Void
  end

  struct ActionMapInterface # 40 bytes long
    g_iface : LibGObject::TypeInterface
    lookup_action : -> Void
    add_action : -> Void
    remove_action : -> Void
  end

  struct AppInfoIface # 216 bytes long
    g_iface : LibGObject::TypeInterface
    dup : -> Void
    equal : -> Void
    get_id : -> Void
    get_name : -> Void
    get_description : -> Void
    get_executable : -> Void
    get_icon : -> Void
    launch : -> Void
    supports_uris : -> Void
    supports_files : -> Void
    launch_uris : -> Void
    should_show : -> Void
    set_as_default_for_type : -> Void
    set_as_default_for_extension : -> Void
    add_supports_type : -> Void
    can_remove_supports_type : -> Void
    remove_supports_type : -> Void
    can_delete : -> Void
    do_delete : -> Void
    get_commandline : -> Void
    get_display_name : -> Void
    set_as_last_used_for_type : -> Void
    get_supported_types : -> Void
    launch_uris_async : -> Void
    launch_uris_finish : -> Void
  end

  struct AppLaunchContextClass # 200 bytes long
    parent_class : LibGObject::ObjectClass
    get_display : -> Void
    get_startup_notify_id : -> Void
    launch_failed : -> Void
    launched : -> Void
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
  end

  type AppLaunchContextPrivate = Void # Struct with zero bytes

  struct ApplicationClass # 312 bytes long
    parent_class : LibGObject::ObjectClass
    startup : -> Void
    activate : -> Void
    open : -> Void
    command_line : -> Void
    local_command_line : -> Void
    before_emit : -> Void
    after_emit : -> Void
    add_platform_data : -> Void
    quit_mainloop : -> Void
    run_mainloop : -> Void
    shutdown : -> Void
    dbus_register : -> Void
    dbus_unregister : -> Void
    handle_local_options : -> Void
    name_lost : -> Void
    padding : Pointer(Void)[7]
  end

  struct ApplicationCommandLineClass # 248 bytes long
    parent_class : LibGObject::ObjectClass
    print_literal : -> Void
    printerr_literal : -> Void
    get_stdin : -> Void
    padding : Pointer(Void)[11]
  end

  type ApplicationCommandLinePrivate = Void # Struct with zero bytes

  type ApplicationPrivate = Void # Struct with zero bytes

  struct AsyncInitableIface # 32 bytes long
    g_iface : LibGObject::TypeInterface
    init_async : -> Void
    init_finish : -> Void
  end

  struct AsyncResultIface # 40 bytes long
    g_iface : LibGObject::TypeInterface
    get_user_data : -> Void
    get_source_object : -> Void
    is_tagged : -> Void
  end

  struct BufferedInputStreamClass # 336 bytes long
    parent_class : LibGio::FilterInputStreamClass
    fill : -> Void
    fill_async : -> Void
    fill_finish : -> Void
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
  end

  type BufferedInputStreamPrivate = Void # Struct with zero bytes

  struct BufferedOutputStreamClass # 336 bytes long
    parent_class : LibGio::FilterOutputStreamClass
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
  end

  type BufferedOutputStreamPrivate = Void # Struct with zero bytes

  struct CancellableClass # 184 bytes long
    parent_class : LibGObject::ObjectClass
    cancelled : -> Void
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
  end

  type CancellablePrivate = Void # Struct with zero bytes

  struct CharsetConverterClass # 136 bytes long
    parent_class : LibGObject::ObjectClass
  end

  struct ConverterIface # 32 bytes long
    g_iface : LibGObject::TypeInterface
    convert : -> Void
    reset : -> Void
  end

  struct ConverterInputStreamClass # 312 bytes long
    parent_class : LibGio::FilterInputStreamClass
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
  end

  type ConverterInputStreamPrivate = Void # Struct with zero bytes

  struct ConverterOutputStreamClass # 360 bytes long
    parent_class : LibGio::FilterOutputStreamClass
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
  end

  type ConverterOutputStreamPrivate = Void # Struct with zero bytes

  type CredentialsClass = Void # Struct with zero bytes

  struct DBusAnnotationInfo # 32 bytes long
    ref_count : Int32
    key : Pointer(LibC::Char)
    value : Pointer(LibC::Char)
    annotations : Pointer(Pointer(Void))
  end

  struct DBusArgInfo # 32 bytes long
    ref_count : Int32
    name : Pointer(LibC::Char)
    signature : Pointer(LibC::Char)
    annotations : Pointer(Pointer(Void))
  end

  struct DBusErrorEntry # 16 bytes long
    error_code : Int32
    dbus_error_name : Pointer(LibC::Char)
  end

  struct DBusInterfaceIface # 48 bytes long
    parent_iface : LibGObject::TypeInterface
    get_info : -> Void
    get_object : -> Void
    set_object : -> Void
    dup_object : -> Void
  end

  struct DBusInterfaceInfo # 48 bytes long
    ref_count : Int32
    name : Pointer(LibC::Char)
    methods : Pointer(Pointer(Void))
    signals : Pointer(Pointer(Void))
    properties : Pointer(Pointer(Void))
    annotations : Pointer(Pointer(Void))
  end

  struct DBusInterfaceSkeletonClass # 304 bytes long
    parent_class : LibGObject::ObjectClass
    get_info : -> Void
    get_vtable : Pointer(Void)
    get_properties : -> Void
    flush : -> Void
    vfunc_padding : Pointer(Void)[8]
    g_authorize_method : -> Void
    signal_padding : Pointer(Void)[8]
  end

  type DBusInterfaceSkeletonPrivate = Void # Struct with zero bytes

  struct DBusInterfaceVTable # 88 bytes long
    method_call : LibGio::DBusInterfaceMethodCallFunc
    get_property : LibGio::DBusInterfaceGetPropertyFunc
    set_property : LibGio::DBusInterfaceSetPropertyFunc
    padding : Pointer(Void)[8]
  end

  struct DBusMethodInfo # 40 bytes long
    ref_count : Int32
    name : Pointer(LibC::Char)
    in_args : Pointer(Pointer(Void))
    out_args : Pointer(Pointer(Void))
    annotations : Pointer(Pointer(Void))
  end

  struct DBusNodeInfo # 40 bytes long
    ref_count : Int32
    path : Pointer(LibC::Char)
    interfaces : Pointer(Pointer(Void))
    nodes : Pointer(Pointer(Void))
    annotations : Pointer(Pointer(Void))
  end

  struct DBusObjectIface # 56 bytes long
    parent_iface : LibGObject::TypeInterface
    get_object_path : -> Void
    get_interfaces : -> Void
    get_interface : -> Void
    interface_added : -> Void
    interface_removed : -> Void
  end

  struct DBusObjectManagerClientClass # 216 bytes long
    parent_class : LibGObject::ObjectClass
    interface_proxy_signal : -> Void
    interface_proxy_properties_changed : -> Void
    padding : Pointer(Void)[8]
  end

  type DBusObjectManagerClientPrivate = Void # Struct with zero bytes

  struct DBusObjectManagerIface # 80 bytes long
    parent_iface : LibGObject::TypeInterface
    get_object_path : -> Void
    get_objects : -> Void
    get_object : -> Void
    get_interface : -> Void
    object_added : -> Void
    object_removed : -> Void
    interface_added : -> Void
    interface_removed : -> Void
  end

  struct DBusObjectManagerServerClass # 200 bytes long
    parent_class : LibGObject::ObjectClass
    padding : Pointer(Void)[8]
  end

  type DBusObjectManagerServerPrivate = Void # Struct with zero bytes

  struct DBusObjectProxyClass # 200 bytes long
    parent_class : LibGObject::ObjectClass
    padding : Pointer(Void)[8]
  end

  type DBusObjectProxyPrivate = Void # Struct with zero bytes

  struct DBusObjectSkeletonClass # 208 bytes long
    parent_class : LibGObject::ObjectClass
    authorize_method : -> Void
    padding : Pointer(Void)[8]
  end

  type DBusObjectSkeletonPrivate = Void # Struct with zero bytes

  struct DBusPropertyInfo # 40 bytes long
    ref_count : Int32
    name : Pointer(LibC::Char)
    signature : Pointer(LibC::Char)
    flags : UInt32
    annotations : Pointer(Pointer(Void))
  end

  struct DBusProxyClass # 408 bytes long
    parent_class : LibGObject::ObjectClass
    g_properties_changed : -> Void
    g_signal : -> Void
    padding : Pointer(Void)[32]
  end

  type DBusProxyPrivate = Void # Struct with zero bytes

  struct DBusSignalInfo # 32 bytes long
    ref_count : Int32
    name : Pointer(LibC::Char)
    args : Pointer(Pointer(Void))
    annotations : Pointer(Pointer(Void))
  end

  struct DBusSubtreeVTable # 88 bytes long
    enumerate : LibGio::DBusSubtreeEnumerateFunc
    introspect : LibGio::DBusSubtreeIntrospectFunc
    dispatch : LibGio::DBusSubtreeDispatchFunc
    padding : Pointer(Void)[8]
  end

  struct DataInputStreamClass # 376 bytes long
    parent_class : LibGio::BufferedInputStreamClass
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
  end

  type DataInputStreamPrivate = Void # Struct with zero bytes

  struct DataOutputStreamClass # 360 bytes long
    parent_class : LibGio::FilterOutputStreamClass
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
  end

  type DataOutputStreamPrivate = Void # Struct with zero bytes

  struct DatagramBasedInterface # 56 bytes long
    g_iface : LibGObject::TypeInterface
    receive_messages : -> Void
    send_messages : -> Void
    create_source : -> Void
    condition_check : -> Void
    condition_wait : -> Void
  end

  struct DesktopAppInfoClass # 136 bytes long
    parent_class : LibGObject::ObjectClass
  end

  struct DesktopAppInfoLookupIface # 24 bytes long
    g_iface : LibGObject::TypeInterface
    get_default_for_uri_scheme : -> Void
  end

  struct DriveIface # 272 bytes long
    g_iface : LibGObject::TypeInterface
    changed : -> Void
    disconnected : -> Void
    eject_button : -> Void
    get_name : -> Void
    get_icon : -> Void
    has_volumes : -> Void
    get_volumes : -> Void
    is_media_removable : -> Void
    has_media : -> Void
    is_media_check_automatic : -> Void
    can_eject : -> Void
    can_poll_for_media : -> Void
    eject : -> Void
    eject_finish : -> Void
    poll_for_media : -> Void
    poll_for_media_finish : -> Void
    get_identifier : -> Void
    enumerate_identifiers : -> Void
    get_start_stop_type : -> Void
    can_start : -> Void
    can_start_degraded : -> Void
    start : -> Void
    start_finish : -> Void
    can_stop : -> Void
    stop : -> Void
    stop_finish : -> Void
    stop_button : -> Void
    eject_with_operation : -> Void
    eject_with_operation_finish : -> Void
    get_sort_key : -> Void
    get_symbolic_icon : -> Void
    is_removable : -> Void
  end

  struct DtlsClientConnectionInterface # 16 bytes long
    g_iface : LibGObject::TypeInterface
  end

  struct DtlsConnectionInterface # 96 bytes long
    g_iface : LibGObject::TypeInterface
    accept_certificate : -> Void
    handshake : -> Void
    handshake_async : -> Void
    handshake_finish : -> Void
    shutdown : -> Void
    shutdown_async : -> Void
    shutdown_finish : -> Void
    set_advertised_protocols : -> Void
    get_negotiated_protocol : -> Void
    get_binding_data : -> Void
  end

  struct DtlsServerConnectionInterface # 16 bytes long
    g_iface : LibGObject::TypeInterface
  end

  type EmblemClass = Void # Struct with zero bytes

  struct EmblemedIconClass # 136 bytes long
    parent_class : LibGObject::ObjectClass
  end

  type EmblemedIconPrivate = Void # Struct with zero bytes

  struct FileAttributeInfo # 16 bytes long
    name : Pointer(LibC::Char)
    type : UInt32
    flags : UInt32
  end

  struct FileAttributeInfoList # 16 bytes long
    infos : Pointer(LibGio::FileAttributeInfo)
    n_infos : Int32
  end

  type FileAttributeMatcher = Void # Struct with zero bytes

  struct FileDescriptorBasedIface # 24 bytes long
    g_iface : LibGObject::TypeInterface
    get_fd : -> Void
  end

  struct FileEnumeratorClass # 240 bytes long
    parent_class : LibGObject::ObjectClass
    next_file : -> Void
    close_fn : -> Void
    next_files_async : -> Void
    next_files_finish : -> Void
    close_async : -> Void
    close_finish : -> Void
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
    _g_reserved6 : Pointer(Void)
    _g_reserved7 : Pointer(Void)
  end

  type FileEnumeratorPrivate = Void # Struct with zero bytes

  struct FileIOStreamClass # 368 bytes long
    parent_class : LibGio::IOStreamClass
    tell : -> Void
    can_seek : -> Void
    seek : -> Void
    can_truncate : -> Void
    truncate_fn : -> Void
    query_info : -> Void
    query_info_async : -> Void
    query_info_finish : -> Void
    get_etag : -> Void
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
  end

  type FileIOStreamPrivate = Void # Struct with zero bytes

  type FileIconClass = Void # Struct with zero bytes

  struct FileIface # 840 bytes long
    g_iface : LibGObject::TypeInterface
    dup : -> Void
    hash : -> Void
    equal : -> Void
    is_native : -> Void
    has_uri_scheme : -> Void
    get_uri_scheme : -> Void
    get_basename : -> Void
    get_path : -> Void
    get_uri : -> Void
    get_parse_name : -> Void
    get_parent : -> Void
    prefix_matches : -> Void
    get_relative_path : -> Void
    resolve_relative_path : -> Void
    get_child_for_display_name : -> Void
    enumerate_children : -> Void
    enumerate_children_async : -> Void
    enumerate_children_finish : -> Void
    query_info : -> Void
    query_info_async : -> Void
    query_info_finish : -> Void
    query_filesystem_info : -> Void
    query_filesystem_info_async : -> Void
    query_filesystem_info_finish : -> Void
    find_enclosing_mount : -> Void
    find_enclosing_mount_async : -> Void
    find_enclosing_mount_finish : -> Void
    set_display_name : -> Void
    set_display_name_async : -> Void
    set_display_name_finish : -> Void
    query_settable_attributes : -> Void
    _query_settable_attributes_async : Pointer(Void)
    _query_settable_attributes_finish : Pointer(Void)
    query_writable_namespaces : -> Void
    _query_writable_namespaces_async : Pointer(Void)
    _query_writable_namespaces_finish : Pointer(Void)
    set_attribute : -> Void
    set_attributes_from_info : -> Void
    set_attributes_async : -> Void
    set_attributes_finish : -> Void
    read_fn : -> Void
    read_async : -> Void
    read_finish : -> Void
    append_to : -> Void
    append_to_async : -> Void
    append_to_finish : -> Void
    create : -> Void
    create_async : -> Void
    create_finish : -> Void
    replace : -> Void
    replace_async : -> Void
    replace_finish : -> Void
    delete_file : -> Void
    delete_file_async : -> Void
    delete_file_finish : -> Void
    trash : -> Void
    trash_async : -> Void
    trash_finish : -> Void
    make_directory : -> Void
    make_directory_async : -> Void
    make_directory_finish : -> Void
    make_symbolic_link : -> Void
    _make_symbolic_link_async : Pointer(Void)
    _make_symbolic_link_finish : Pointer(Void)
    copy : -> Void
    copy_async : -> Void
    copy_finish : -> Void
    move : -> Void
    _move_async : Pointer(Void)
    _move_finish : Pointer(Void)
    mount_mountable : -> Void
    mount_mountable_finish : -> Void
    unmount_mountable : -> Void
    unmount_mountable_finish : -> Void
    eject_mountable : -> Void
    eject_mountable_finish : -> Void
    mount_enclosing_volume : -> Void
    mount_enclosing_volume_finish : -> Void
    monitor_dir : -> Void
    monitor_file : -> Void
    open_readwrite : -> Void
    open_readwrite_async : -> Void
    open_readwrite_finish : -> Void
    create_readwrite : -> Void
    create_readwrite_async : -> Void
    create_readwrite_finish : -> Void
    replace_readwrite : -> Void
    replace_readwrite_async : -> Void
    replace_readwrite_finish : -> Void
    start_mountable : -> Void
    start_mountable_finish : -> Void
    stop_mountable : -> Void
    stop_mountable_finish : -> Void
    supports_thread_contexts : LibC::Int
    unmount_mountable_with_operation : -> Void
    unmount_mountable_with_operation_finish : -> Void
    eject_mountable_with_operation : -> Void
    eject_mountable_with_operation_finish : -> Void
    poll_mountable : -> Void
    poll_mountable_finish : -> Void
    measure_disk_usage : Pointer(Void)
    measure_disk_usage_async : Pointer(Void)
    measure_disk_usage_finish : -> Void
  end

  type FileInfoClass = Void # Struct with zero bytes

  struct FileInputStreamClass # 336 bytes long
    parent_class : LibGio::InputStreamClass
    tell : -> Void
    can_seek : -> Void
    seek : -> Void
    query_info : -> Void
    query_info_async : -> Void
    query_info_finish : -> Void
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
  end

  type FileInputStreamPrivate = Void # Struct with zero bytes

  struct FileMonitorClass # 192 bytes long
    parent_class : LibGObject::ObjectClass
    changed : -> Void
    cancel : -> Void
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
  end

  type FileMonitorPrivate = Void # Struct with zero bytes

  struct FileOutputStreamClass # 408 bytes long
    parent_class : LibGio::OutputStreamClass
    tell : -> Void
    can_seek : -> Void
    seek : -> Void
    can_truncate : -> Void
    truncate_fn : -> Void
    query_info : -> Void
    query_info_async : -> Void
    query_info_finish : -> Void
    get_etag : -> Void
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
  end

  type FileOutputStreamPrivate = Void # Struct with zero bytes

  struct FilenameCompleterClass # 168 bytes long
    parent_class : LibGObject::ObjectClass
    got_completion_data : -> Void
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
  end

  struct FilterInputStreamClass # 272 bytes long
    parent_class : LibGio::InputStreamClass
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
  end

  struct FilterOutputStreamClass # 320 bytes long
    parent_class : LibGio::OutputStreamClass
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
  end

  type IOExtension = Void # Struct with zero bytes

  type IOExtensionPoint = Void # Struct with zero bytes

  type IOModuleClass = Void # Struct with zero bytes

  type IOModuleScope = Void # Struct with zero bytes

  type IOSchedulerJob = Void # Struct with zero bytes

  type IOStreamAdapter = Void # Struct with zero bytes

  struct IOStreamClass # 256 bytes long
    parent_class : LibGObject::ObjectClass
    get_input_stream : -> Void
    get_output_stream : -> Void
    close_fn : -> Void
    close_async : -> Void
    close_finish : -> Void
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
    _g_reserved6 : Pointer(Void)
    _g_reserved7 : Pointer(Void)
    _g_reserved8 : Pointer(Void)
    _g_reserved9 : Pointer(Void)
    _g_reserved10 : Pointer(Void)
  end

  type IOStreamPrivate = Void # Struct with zero bytes

  struct IconIface # 56 bytes long
    g_iface : LibGObject::TypeInterface
    hash : -> Void
    equal : -> Void
    to_tokens : Pointer(Void)
    from_tokens : Pointer(Void)
    serialize : -> Void
  end

  struct InetAddressClass # 152 bytes long
    parent_class : LibGObject::ObjectClass
    to_string : -> Void
    to_bytes : -> Void
  end

  struct InetAddressMaskClass # 136 bytes long
    parent_class : LibGObject::ObjectClass
  end

  type InetAddressMaskPrivate = Void # Struct with zero bytes

  type InetAddressPrivate = Void # Struct with zero bytes

  struct InetSocketAddressClass # 160 bytes long
    parent_class : LibGio::SocketAddressClass
  end

  type InetSocketAddressPrivate = Void # Struct with zero bytes

  struct InitableIface # 24 bytes long
    g_iface : LibGObject::TypeInterface
    init : -> Void
  end

  struct InputMessage # 56 bytes long
    address : Pointer(LibGio::SocketAddress)
    vectors : Pointer(Void)
    num_vectors : UInt32
    bytes_received : UInt64
    flags : Int32
    control_messages : Pointer(Pointer(Void))
    num_control_messages : Pointer(UInt32)
  end

  struct InputStreamClass # 248 bytes long
    parent_class : LibGObject::ObjectClass
    read_fn : -> Void
    skip : -> Void
    close_fn : -> Void
    read_async : -> Void
    read_finish : -> Void
    skip_async : -> Void
    skip_finish : -> Void
    close_async : -> Void
    close_finish : -> Void
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
  end

  type InputStreamPrivate = Void # Struct with zero bytes

  struct InputVector # 16 bytes long
    buffer : Pointer(Void)
    size : UInt64
  end

  struct ListModelInterface # 40 bytes long
    g_iface : LibGObject::TypeInterface
    get_item_type : -> Void
    get_n_items : -> Void
    get_item : -> Void
  end

  struct ListStoreClass # 136 bytes long
    parent_class : LibGObject::ObjectClass
  end

  struct LoadableIconIface # 40 bytes long
    g_iface : LibGObject::TypeInterface
    load : -> Void
    load_async : -> Void
    load_finish : -> Void
  end

  struct MemoryInputStreamClass # 288 bytes long
    parent_class : LibGio::InputStreamClass
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
  end

  type MemoryInputStreamPrivate = Void # Struct with zero bytes

  struct MemoryMonitorInterface # 24 bytes long
    g_iface : LibGObject::TypeInterface
    low_memory_warning : -> Void
  end

  struct MemoryOutputStreamClass # 336 bytes long
    parent_class : LibGio::OutputStreamClass
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
  end

  type MemoryOutputStreamPrivate = Void # Struct with zero bytes

  struct MenuAttributeIterClass # 144 bytes long
    parent_class : LibGObject::ObjectClass
    get_next : -> Void
  end

  type MenuAttributeIterPrivate = Void # Struct with zero bytes

  struct MenuLinkIterClass # 144 bytes long
    parent_class : LibGObject::ObjectClass
    get_next : -> Void
  end

  type MenuLinkIterPrivate = Void # Struct with zero bytes

  struct MenuModelClass # 200 bytes long
    parent_class : LibGObject::ObjectClass
    is_mutable : -> Void
    get_n_items : -> Void
    get_item_attributes : -> Void
    iterate_item_attributes : -> Void
    get_item_attribute_value : -> Void
    get_item_links : -> Void
    iterate_item_links : -> Void
    get_item_link : -> Void
  end

  type MenuModelPrivate = Void # Struct with zero bytes

  struct MountIface # 232 bytes long
    g_iface : LibGObject::TypeInterface
    changed : -> Void
    unmounted : -> Void
    get_root : -> Void
    get_name : -> Void
    get_icon : -> Void
    get_uuid : -> Void
    get_volume : -> Void
    get_drive : -> Void
    can_unmount : -> Void
    can_eject : -> Void
    unmount : -> Void
    unmount_finish : -> Void
    eject : -> Void
    eject_finish : -> Void
    remount : -> Void
    remount_finish : -> Void
    guess_content_type : -> Void
    guess_content_type_finish : -> Void
    guess_content_type_sync : -> Void
    pre_unmount : -> Void
    unmount_with_operation : -> Void
    unmount_with_operation_finish : -> Void
    eject_with_operation : -> Void
    eject_with_operation_finish : -> Void
    get_default_location : -> Void
    get_sort_key : -> Void
    get_symbolic_icon : -> Void
  end

  struct MountOperationClass # 256 bytes long
    parent_class : LibGObject::ObjectClass
    ask_password : -> Void
    ask_question : -> Void
    reply : -> Void
    aborted : -> Void
    show_processes : -> Void
    show_unmount_progress : -> Void
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
    _g_reserved6 : Pointer(Void)
    _g_reserved7 : Pointer(Void)
    _g_reserved8 : Pointer(Void)
    _g_reserved9 : Pointer(Void)
  end

  type MountOperationPrivate = Void # Struct with zero bytes

  struct NativeSocketAddressClass # 160 bytes long
    parent_class : LibGio::SocketAddressClass
  end

  type NativeSocketAddressPrivate = Void # Struct with zero bytes

  struct NativeVolumeMonitorClass # 344 bytes long
    parent_class : LibGio::VolumeMonitorClass
    get_mount_for_mount_path : Pointer(Void)
  end

  struct NetworkAddressClass # 136 bytes long
    parent_class : LibGObject::ObjectClass
  end

  type NetworkAddressPrivate = Void # Struct with zero bytes

  struct NetworkMonitorInterface # 48 bytes long
    g_iface : LibGObject::TypeInterface
    network_changed : -> Void
    can_reach : -> Void
    can_reach_async : -> Void
    can_reach_finish : -> Void
  end

  struct NetworkServiceClass # 136 bytes long
    parent_class : LibGObject::ObjectClass
  end

  type NetworkServicePrivate = Void # Struct with zero bytes

  struct OutputMessage # 40 bytes long
    address : Pointer(LibGio::SocketAddress)
    vectors : Pointer(LibGio::OutputVector)
    num_vectors : UInt32
    bytes_sent : UInt32
    control_messages : Pointer(Pointer(Void))
    num_control_messages : UInt32
  end

  struct OutputStreamClass # 296 bytes long
    parent_class : LibGObject::ObjectClass
    write_fn : -> Void
    splice : -> Void
    flush : -> Void
    close_fn : -> Void
    write_async : -> Void
    write_finish : -> Void
    splice_async : -> Void
    splice_finish : -> Void
    flush_async : -> Void
    flush_finish : -> Void
    close_async : -> Void
    close_finish : -> Void
    writev_fn : -> Void
    writev_async : -> Void
    writev_finish : -> Void
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
    _g_reserved6 : Pointer(Void)
    _g_reserved7 : Pointer(Void)
    _g_reserved8 : Pointer(Void)
  end

  type OutputStreamPrivate = Void # Struct with zero bytes

  struct OutputVector # 16 bytes long
    buffer : Pointer(Void)
    size : UInt64
  end

  struct PermissionClass # 312 bytes long
    parent_class : LibGObject::ObjectClass
    acquire : -> Void
    acquire_async : -> Void
    acquire_finish : -> Void
    release : -> Void
    release_async : -> Void
    release_finish : -> Void
    reserved : Pointer(Void)[16]
  end

  type PermissionPrivate = Void # Struct with zero bytes

  struct PollableInputStreamInterface # 48 bytes long
    g_iface : LibGObject::TypeInterface
    can_poll : -> Void
    is_readable : -> Void
    create_source : -> Void
    read_nonblocking : -> Void
  end

  struct PollableOutputStreamInterface # 56 bytes long
    g_iface : LibGObject::TypeInterface
    can_poll : -> Void
    is_writable : -> Void
    create_source : -> Void
    write_nonblocking : -> Void
    writev_nonblocking : -> Void
  end

  struct PowerProfileMonitorInterface # 16 bytes long
    g_iface : LibGObject::TypeInterface
  end

  struct ProxyAddressClass # 160 bytes long
    parent_class : LibGio::InetSocketAddressClass
  end

  struct ProxyAddressEnumeratorClass # 216 bytes long
    parent_class : LibGio::SocketAddressEnumeratorClass
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
    _g_reserved6 : Pointer(Void)
    _g_reserved7 : Pointer(Void)
  end

  type ProxyAddressEnumeratorPrivate = Void # Struct with zero bytes

  type ProxyAddressPrivate = Void # Struct with zero bytes

  struct ProxyInterface # 48 bytes long
    g_iface : LibGObject::TypeInterface
    connect : -> Void
    connect_async : -> Void
    connect_finish : -> Void
    supports_hostname : -> Void
  end

  struct ProxyResolverInterface # 48 bytes long
    g_iface : LibGObject::TypeInterface
    is_supported : -> Void
    lookup : -> Void
    lookup_async : -> Void
    lookup_finish : -> Void
  end

  struct RemoteActionGroupInterface # 32 bytes long
    g_iface : LibGObject::TypeInterface
    activate_action_full : -> Void
    change_action_state_full : -> Void
  end

  struct ResolverClass # 264 bytes long
    parent_class : LibGObject::ObjectClass
    reload : -> Void
    lookup_by_name : -> Void
    lookup_by_name_async : -> Void
    lookup_by_name_finish : -> Void
    lookup_by_address : -> Void
    lookup_by_address_async : -> Void
    lookup_by_address_finish : -> Void
    lookup_service : Pointer(Void)
    lookup_service_async : -> Void
    lookup_service_finish : -> Void
    lookup_records : -> Void
    lookup_records_async : -> Void
    lookup_records_finish : -> Void
    lookup_by_name_with_flags_async : -> Void
    lookup_by_name_with_flags_finish : -> Void
    lookup_by_name_with_flags : -> Void
  end

  type ResolverPrivate = Void # Struct with zero bytes

  type Resource = Void # Struct with zero bytes

  struct SeekableIface # 56 bytes long
    g_iface : LibGObject::TypeInterface
    tell : -> Void
    can_seek : -> Void
    seek : -> Void
    can_truncate : -> Void
    truncate_fn : -> Void
  end

  struct SettingsBackendClass # 400 bytes long
    parent_class : LibGObject::ObjectClass
    read : -> Void
    get_writable : -> Void
    write : -> Void
    write_tree : -> Void
    reset : -> Void
    subscribe : -> Void
    unsubscribe : -> Void
    sync : -> Void
    get_permission : Pointer(Void)
    read_user_value : -> Void
    padding : Pointer(Void)[23]
  end

  type SettingsBackendPrivate = Void # Struct with zero bytes

  struct SettingsClass # 328 bytes long
    parent_class : LibGObject::ObjectClass
    writable_changed : -> Void
    changed : -> Void
    writable_change_event : -> Void
    change_event : -> Void
    padding : Pointer(Void)[20]
  end

  type SettingsPrivate = Void # Struct with zero bytes

  type SettingsSchema = Void # Struct with zero bytes

  type SettingsSchemaKey = Void # Struct with zero bytes

  type SettingsSchemaSource = Void # Struct with zero bytes

  struct SimpleActionGroupClass # 232 bytes long
    parent_class : LibGObject::ObjectClass
    padding : Pointer(Void)[12]
  end

  type SimpleActionGroupPrivate = Void # Struct with zero bytes

  type SimpleAsyncResultClass = Void # Struct with zero bytes

  struct SimpleProxyResolverClass # 176 bytes long
    parent_class : LibGObject::ObjectClass
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
  end

  type SimpleProxyResolverPrivate = Void # Struct with zero bytes

  struct SocketAddressClass # 160 bytes long
    parent_class : LibGObject::ObjectClass
    get_family : -> Void
    get_native_size : -> Void
    to_native : -> Void
  end

  struct SocketAddressEnumeratorClass # 160 bytes long
    parent_class : LibGObject::ObjectClass
    _next : -> Void
    next_async : -> Void
    next_finish : -> Void
  end

  struct SocketClass # 216 bytes long
    parent_class : LibGObject::ObjectClass
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
    _g_reserved6 : Pointer(Void)
    _g_reserved7 : Pointer(Void)
    _g_reserved8 : Pointer(Void)
    _g_reserved9 : Pointer(Void)
    _g_reserved10 : Pointer(Void)
  end

  struct SocketClientClass # 176 bytes long
    parent_class : LibGObject::ObjectClass
    event : -> Void
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
  end

  type SocketClientPrivate = Void # Struct with zero bytes

  struct SocketConnectableIface # 40 bytes long
    g_iface : LibGObject::TypeInterface
    enumerate : -> Void
    proxy_enumerate : -> Void
    to_string : -> Void
  end

  struct SocketConnectionClass # 304 bytes long
    parent_class : LibGio::IOStreamClass
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
    _g_reserved6 : Pointer(Void)
  end

  type SocketConnectionPrivate = Void # Struct with zero bytes

  struct SocketControlMessageClass # 216 bytes long
    parent_class : LibGObject::ObjectClass
    get_size : -> Void
    get_level : -> Void
    get_type : -> Void
    serialize : -> Void
    deserialize : Pointer(Void)
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
  end

  type SocketControlMessagePrivate = Void # Struct with zero bytes

  struct SocketListenerClass # 192 bytes long
    parent_class : LibGObject::ObjectClass
    changed : -> Void
    event : -> Void
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
    _g_reserved6 : Pointer(Void)
  end

  type SocketListenerPrivate = Void # Struct with zero bytes

  type SocketPrivate = Void # Struct with zero bytes

  struct SocketServiceClass # 248 bytes long
    parent_class : LibGio::SocketListenerClass
    incoming : -> Void
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
    _g_reserved6 : Pointer(Void)
  end

  type SocketServicePrivate = Void # Struct with zero bytes

  type SrvTarget = Void # Struct with zero bytes

  struct StaticResource # 40 bytes long
    data : Pointer(UInt8)
    data_len : UInt64
    resource : Pointer(LibGio::Resource)
    _next : Pointer(LibGio::StaticResource)
    padding : Pointer(Void)
  end

  type TaskClass = Void # Struct with zero bytes

  struct TcpConnectionClass # 304 bytes long
    parent_class : LibGio::SocketConnectionClass
  end

  type TcpConnectionPrivate = Void # Struct with zero bytes

  struct TcpWrapperConnectionClass # 304 bytes long
    parent_class : LibGio::TcpConnectionClass
  end

  type TcpWrapperConnectionPrivate = Void # Struct with zero bytes

  type ThemedIconClass = Void # Struct with zero bytes

  struct ThreadedSocketServiceClass # 296 bytes long
    parent_class : LibGio::SocketServiceClass
    run : -> Void
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
  end

  type ThreadedSocketServicePrivate = Void # Struct with zero bytes

  struct TlsBackendInterface # 88 bytes long
    g_iface : LibGObject::TypeInterface
    supports_tls : -> Void
    get_certificate_type : -> Void
    get_client_connection_type : -> Void
    get_server_connection_type : -> Void
    get_file_database_type : -> Void
    get_default_database : -> Void
    supports_dtls : -> Void
    get_dtls_client_connection_type : -> Void
    get_dtls_server_connection_type : -> Void
  end

  struct TlsCertificateClass # 208 bytes long
    parent_class : LibGObject::ObjectClass
    verify : -> Void
    padding : Pointer(Void)[8]
  end

  type TlsCertificatePrivate = Void # Struct with zero bytes

  struct TlsClientConnectionInterface # 24 bytes long
    g_iface : LibGObject::TypeInterface
    copy_session_state : -> Void
  end

  struct TlsConnectionClass # 352 bytes long
    parent_class : LibGio::IOStreamClass
    accept_certificate : -> Void
    handshake : -> Void
    handshake_async : -> Void
    handshake_finish : -> Void
    get_binding_data : -> Void
    get_negotiated_protocol : -> Void
    padding : Pointer(Void)[6]
  end

  type TlsConnectionPrivate = Void # Struct with zero bytes

  struct TlsDatabaseClass # 368 bytes long
    parent_class : LibGObject::ObjectClass
    verify_chain : -> Void
    verify_chain_async : -> Void
    verify_chain_finish : -> Void
    create_certificate_handle : -> Void
    lookup_certificate_for_handle : -> Void
    lookup_certificate_for_handle_async : -> Void
    lookup_certificate_for_handle_finish : -> Void
    lookup_certificate_issuer : -> Void
    lookup_certificate_issuer_async : -> Void
    lookup_certificate_issuer_finish : -> Void
    lookup_certificates_issued_by : -> Void
    lookup_certificates_issued_by_async : -> Void
    lookup_certificates_issued_by_finish : -> Void
    padding : Pointer(Void)[16]
  end

  type TlsDatabasePrivate = Void # Struct with zero bytes

  struct TlsFileDatabaseInterface # 80 bytes long
    g_iface : LibGObject::TypeInterface
    padding : Pointer(Void)[8]
  end

  struct TlsInteractionClass # 352 bytes long
    parent_class : LibGObject::ObjectClass
    ask_password : -> Void
    ask_password_async : -> Void
    ask_password_finish : -> Void
    request_certificate : -> Void
    request_certificate_async : -> Void
    request_certificate_finish : -> Void
    padding : Pointer(Void)[21]
  end

  type TlsInteractionPrivate = Void # Struct with zero bytes

  struct TlsPasswordClass # 192 bytes long
    parent_class : LibGObject::ObjectClass
    get_value : -> Void
    set_value : -> Void
    get_default_warning : -> Void
    padding : Pointer(Void)[4]
  end

  type TlsPasswordPrivate = Void # Struct with zero bytes

  struct TlsServerConnectionInterface # 16 bytes long
    g_iface : LibGObject::TypeInterface
  end

  struct UnixConnectionClass # 304 bytes long
    parent_class : LibGio::SocketConnectionClass
  end

  type UnixConnectionPrivate = Void # Struct with zero bytes

  struct UnixCredentialsMessageClass # 232 bytes long
    parent_class : LibGio::SocketControlMessageClass
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
  end

  type UnixCredentialsMessagePrivate = Void # Struct with zero bytes

  struct UnixFDListClass # 176 bytes long
    parent_class : LibGObject::ObjectClass
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
  end

  type UnixFDListPrivate = Void # Struct with zero bytes

  struct UnixFDMessageClass # 232 bytes long
    parent_class : LibGio::SocketControlMessageClass
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
  end

  type UnixFDMessagePrivate = Void # Struct with zero bytes

  struct UnixInputStreamClass # 288 bytes long
    parent_class : LibGio::InputStreamClass
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
  end

  type UnixInputStreamPrivate = Void # Struct with zero bytes

  type UnixMountEntry = Void # Struct with zero bytes

  type UnixMountMonitorClass = Void # Struct with zero bytes

  type UnixMountPoint = Void # Struct with zero bytes

  struct UnixOutputStreamClass # 336 bytes long
    parent_class : LibGio::OutputStreamClass
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
  end

  type UnixOutputStreamPrivate = Void # Struct with zero bytes

  struct UnixSocketAddressClass # 160 bytes long
    parent_class : LibGio::SocketAddressClass
  end

  type UnixSocketAddressPrivate = Void # Struct with zero bytes

  struct VfsClass # 272 bytes long
    parent_class : LibGObject::ObjectClass
    is_active : -> Void
    get_file_for_path : -> Void
    get_file_for_uri : -> Void
    get_supported_uri_schemes : -> Void
    parse_name : -> Void
    local_file_add_info : -> Void
    add_writable_namespaces : -> Void
    local_file_set_attributes : -> Void
    local_file_removed : -> Void
    local_file_moved : -> Void
    deserialize_icon : Pointer(Void)
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
    _g_reserved6 : Pointer(Void)
  end

  struct VolumeIface # 184 bytes long
    g_iface : LibGObject::TypeInterface
    changed : -> Void
    removed : -> Void
    get_name : -> Void
    get_icon : -> Void
    get_uuid : -> Void
    get_drive : -> Void
    get_mount : -> Void
    can_mount : -> Void
    can_eject : -> Void
    mount_fn : -> Void
    mount_finish : -> Void
    eject : -> Void
    eject_finish : -> Void
    get_identifier : -> Void
    enumerate_identifiers : -> Void
    should_automount : -> Void
    get_activation_root : -> Void
    eject_with_operation : -> Void
    eject_with_operation_finish : -> Void
    get_sort_key : -> Void
    get_symbolic_icon : -> Void
  end

  struct VolumeMonitorClass # 336 bytes long
    parent_class : LibGObject::ObjectClass
    volume_added : -> Void
    volume_removed : -> Void
    volume_changed : -> Void
    mount_added : -> Void
    mount_removed : -> Void
    mount_pre_unmount : -> Void
    mount_changed : -> Void
    drive_connected : -> Void
    drive_disconnected : -> Void
    drive_changed : -> Void
    is_supported : -> Void
    get_connected_drives : -> Void
    get_volumes : -> Void
    get_mounts : -> Void
    get_volume_for_uuid : -> Void
    get_mount_for_uuid : -> Void
    adopt_orphan_mount : Pointer(Void)
    drive_eject_button : -> Void
    drive_stop_button : -> Void
    _g_reserved1 : Pointer(Void)
    _g_reserved2 : Pointer(Void)
    _g_reserved3 : Pointer(Void)
    _g_reserved4 : Pointer(Void)
    _g_reserved5 : Pointer(Void)
    _g_reserved6 : Pointer(Void)
  end

  struct ZlibCompressorClass # 136 bytes long
    parent_class : LibGObject::ObjectClass
  end

  struct ZlibDecompressorClass # 136 bytes long
    parent_class : LibGObject::ObjectClass
  end

  # Unions

  # Objects
  type AppInfoMonitor = Void # Object struct with no fields

  struct AppLaunchContext
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::AppLaunchContextPrivate)
  end

  struct Application
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::ApplicationPrivate)
  end

  struct ApplicationCommandLine
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::ApplicationCommandLinePrivate)
  end

  struct BufferedInputStream
    parent_instance : LibGio::FilterInputStream
    priv : Pointer(LibGio::BufferedInputStreamPrivate)
  end

  struct BufferedOutputStream
    parent_instance : LibGio::FilterOutputStream
    priv : Pointer(LibGio::BufferedOutputStreamPrivate)
  end

  type BytesIcon = Void # Object struct with no fields

  struct Cancellable
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::CancellablePrivate)
  end

  type CharsetConverter = Void # Object struct with no fields

  struct ConverterInputStream
    parent_instance : LibGio::FilterInputStream
    priv : Pointer(LibGio::ConverterInputStreamPrivate)
  end

  struct ConverterOutputStream
    parent_instance : LibGio::FilterOutputStream
    priv : Pointer(LibGio::ConverterOutputStreamPrivate)
  end

  type Credentials = Void # Object struct with no fields

  type DBusActionGroup = Void # Object struct with no fields

  type DBusAuthObserver = Void # Object struct with no fields

  type DBusConnection = Void # Object struct with no fields

  struct DBusInterfaceSkeleton
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::DBusInterfaceSkeletonPrivate)
  end

  type DBusMenuModel = Void # Object struct with no fields

  type DBusMessage = Void # Object struct with no fields

  type DBusMethodInvocation = Void # Object struct with no fields

  struct DBusObjectManagerClient
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::DBusObjectManagerClientPrivate)
  end

  struct DBusObjectManagerServer
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::DBusObjectManagerServerPrivate)
  end

  struct DBusObjectProxy
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::DBusObjectProxyPrivate)
  end

  struct DBusObjectSkeleton
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::DBusObjectSkeletonPrivate)
  end

  struct DBusProxy
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::DBusProxyPrivate)
  end

  type DBusServer = Void # Object struct with no fields

  struct DataInputStream
    parent_instance : LibGio::BufferedInputStream
    priv : Pointer(LibGio::DataInputStreamPrivate)
  end

  struct DataOutputStream
    parent_instance : LibGio::FilterOutputStream
    priv : Pointer(LibGio::DataOutputStreamPrivate)
  end

  type DesktopAppInfo = Void # Object struct with no fields

  type Emblem = Void # Object struct with no fields

  struct EmblemedIcon
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::EmblemedIconPrivate)
  end

  struct FileEnumerator
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::FileEnumeratorPrivate)
  end

  struct FileIOStream
    parent_instance : LibGio::IOStream
    priv : Pointer(LibGio::FileIOStreamPrivate)
  end

  type FileIcon = Void # Object struct with no fields

  type FileInfo = Void # Object struct with no fields

  struct FileInputStream
    parent_instance : LibGio::InputStream
    priv : Pointer(LibGio::FileInputStreamPrivate)
  end

  struct FileMonitor
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::FileMonitorPrivate)
  end

  struct FileOutputStream
    parent_instance : LibGio::OutputStream
    priv : Pointer(LibGio::FileOutputStreamPrivate)
  end

  type FilenameCompleter = Void # Object struct with no fields

  struct FilterInputStream
    parent_instance : LibGio::InputStream
    base_stream : Pointer(LibGio::InputStream)
  end

  struct FilterOutputStream
    parent_instance : LibGio::OutputStream
    base_stream : Pointer(LibGio::OutputStream)
  end

  type IOModule = Void # Object struct with no fields

  struct IOStream
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::IOStreamPrivate)
  end

  struct InetAddress
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::InetAddressPrivate)
  end

  struct InetAddressMask
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::InetAddressMaskPrivate)
  end

  struct InetSocketAddress
    parent_instance : LibGio::SocketAddress
    priv : Pointer(LibGio::InetSocketAddressPrivate)
  end

  struct InputStream
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::InputStreamPrivate)
  end

  type ListStore = Void # Object struct with no fields

  struct MemoryInputStream
    parent_instance : LibGio::InputStream
    priv : Pointer(LibGio::MemoryInputStreamPrivate)
  end

  struct MemoryOutputStream
    parent_instance : LibGio::OutputStream
    priv : Pointer(LibGio::MemoryOutputStreamPrivate)
  end

  type Menu = Void # Object struct with no fields

  struct MenuAttributeIter
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::MenuAttributeIterPrivate)
  end

  type MenuItem = Void # Object struct with no fields

  struct MenuLinkIter
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::MenuLinkIterPrivate)
  end

  struct MenuModel
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::MenuModelPrivate)
  end

  struct MountOperation
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::MountOperationPrivate)
  end

  struct NativeSocketAddress
    parent_instance : LibGio::SocketAddress
    priv : Pointer(LibGio::NativeSocketAddressPrivate)
  end

  struct NativeVolumeMonitor
    parent_instance : LibGio::VolumeMonitor
  end

  struct NetworkAddress
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::NetworkAddressPrivate)
  end

  struct NetworkService
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::NetworkServicePrivate)
  end

  type Notification = Void # Object struct with no fields

  struct OutputStream
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::OutputStreamPrivate)
  end

  struct Permission
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::PermissionPrivate)
  end

  type PropertyAction = Void # Object struct with no fields

  struct ProxyAddress
    parent_instance : LibGio::InetSocketAddress
    priv : Pointer(LibGio::ProxyAddressPrivate)
  end

  struct ProxyAddressEnumerator
    parent_instance : LibGio::SocketAddressEnumerator
    priv : Pointer(LibGio::ProxyAddressEnumeratorPrivate)
  end

  struct Resolver
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::ResolverPrivate)
  end

  struct Settings
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::SettingsPrivate)
  end

  struct SettingsBackend
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::SettingsBackendPrivate)
  end

  type SimpleAction = Void # Object struct with no fields

  struct SimpleActionGroup
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::SimpleActionGroupPrivate)
  end

  type SimpleAsyncResult = Void # Object struct with no fields

  type SimpleIOStream = Void # Object struct with no fields

  type SimplePermission = Void # Object struct with no fields

  struct SimpleProxyResolver
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::SimpleProxyResolverPrivate)
  end

  struct Socket
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::SocketPrivate)
  end

  struct SocketAddress
    parent_instance : LibGObject::Object
  end

  struct SocketAddressEnumerator
    parent_instance : LibGObject::Object
  end

  struct SocketClient
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::SocketClientPrivate)
  end

  struct SocketConnection
    parent_instance : LibGio::IOStream
    priv : Pointer(LibGio::SocketConnectionPrivate)
  end

  struct SocketControlMessage
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::SocketControlMessagePrivate)
  end

  struct SocketListener
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::SocketListenerPrivate)
  end

  struct SocketService
    parent_instance : LibGio::SocketListener
    priv : Pointer(LibGio::SocketServicePrivate)
  end

  type Subprocess = Void # Object struct with no fields

  type SubprocessLauncher = Void # Object struct with no fields

  type Task = Void # Object struct with no fields

  struct TcpConnection
    parent_instance : LibGio::SocketConnection
    priv : Pointer(LibGio::TcpConnectionPrivate)
  end

  struct TcpWrapperConnection
    parent_instance : LibGio::TcpConnection
    priv : Pointer(LibGio::TcpWrapperConnectionPrivate)
  end

  type TestDBus = Void # Object struct with no fields

  type ThemedIcon = Void # Object struct with no fields

  struct ThreadedSocketService
    parent_instance : LibGio::SocketService
    priv : Pointer(LibGio::ThreadedSocketServicePrivate)
  end

  struct TlsCertificate
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::TlsCertificatePrivate)
  end

  struct TlsConnection
    parent_instance : LibGio::IOStream
    priv : Pointer(LibGio::TlsConnectionPrivate)
  end

  struct TlsDatabase
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::TlsDatabasePrivate)
  end

  struct TlsInteraction
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::TlsInteractionPrivate)
  end

  struct TlsPassword
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::TlsPasswordPrivate)
  end

  struct UnixConnection
    parent_instance : LibGio::SocketConnection
    priv : Pointer(LibGio::UnixConnectionPrivate)
  end

  struct UnixCredentialsMessage
    parent_instance : LibGio::SocketControlMessage
    priv : Pointer(LibGio::UnixCredentialsMessagePrivate)
  end

  struct UnixFDList
    parent_instance : LibGObject::Object
    priv : Pointer(LibGio::UnixFDListPrivate)
  end

  struct UnixFDMessage
    parent_instance : LibGio::SocketControlMessage
    priv : Pointer(LibGio::UnixFDMessagePrivate)
  end

  struct UnixInputStream
    parent_instance : LibGio::InputStream
    priv : Pointer(LibGio::UnixInputStreamPrivate)
  end

  type UnixMountMonitor = Void # Object struct with no fields

  struct UnixOutputStream
    parent_instance : LibGio::OutputStream
    priv : Pointer(LibGio::UnixOutputStreamPrivate)
  end

  struct UnixSocketAddress
    parent_instance : LibGio::SocketAddress
    priv : Pointer(LibGio::UnixSocketAddressPrivate)
  end

  struct Vfs
    parent_instance : LibGObject::Object
  end

  struct VolumeMonitor
    parent_instance : LibGObject::Object
    priv : Pointer(Void)
  end

  type ZlibCompressor = Void # Object struct with no fields

  type ZlibDecompressor = Void # Object struct with no fields

  # All C Functions
  fun g_action_activate(this : Void*, parameter : Pointer(Void)) : Void
  fun g_action_change_state(this : Void*, value : Pointer(Void)) : Void
  fun g_action_get_enabled(this : Void*) : LibC::Int
  fun g_action_get_name(this : Void*) : Pointer(LibC::Char)
  fun g_action_get_parameter_type(this : Void*) : Pointer(Void)
  fun g_action_get_state(this : Void*) : Pointer(Void)
  fun g_action_get_state_hint(this : Void*) : Pointer(Void)
  fun g_action_get_state_type(this : Void*) : Pointer(Void)
  fun g_action_get_type : UInt64
  fun g_action_group_action_added(this : Void*, action_name : Pointer(LibC::Char)) : Void
  fun g_action_group_action_enabled_changed(this : Void*, action_name : Pointer(LibC::Char), enabled : LibC::Int) : Void
  fun g_action_group_action_removed(this : Void*, action_name : Pointer(LibC::Char)) : Void
  fun g_action_group_action_state_changed(this : Void*, action_name : Pointer(LibC::Char), state : Pointer(Void)) : Void
  fun g_action_group_activate_action(this : Void*, action_name : Pointer(LibC::Char), parameter : Pointer(Void)) : Void
  fun g_action_group_change_action_state(this : Void*, action_name : Pointer(LibC::Char), value : Pointer(Void)) : Void
  fun g_action_group_get_action_enabled(this : Void*, action_name : Pointer(LibC::Char)) : LibC::Int
  fun g_action_group_get_action_parameter_type(this : Void*, action_name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_action_group_get_action_state(this : Void*, action_name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_action_group_get_action_state_hint(this : Void*, action_name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_action_group_get_action_state_type(this : Void*, action_name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_action_group_get_type : UInt64
  fun g_action_group_has_action(this : Void*, action_name : Pointer(LibC::Char)) : LibC::Int
  fun g_action_group_list_actions(this : Void*) : Pointer(Pointer(LibC::Char))
  fun g_action_group_query_action(this : Void*, action_name : Pointer(LibC::Char), enabled : Pointer(LibC::Int), parameter_type : Pointer(Pointer(Void)), state_type : Pointer(Pointer(Void)), state_hint : Pointer(Pointer(Void)), state : Pointer(Pointer(Void))) : LibC::Int
  fun g_action_map_add_action(this : Void*, action : Pointer(Void)) : Void
  fun g_action_map_add_action_entries(this : Void*, entries : Pointer(Void), n_entries : Int32, user_data : Pointer(Void)) : Void
  fun g_action_map_get_type : UInt64
  fun g_action_map_lookup_action(this : Void*, action_name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_action_map_remove_action(this : Void*, action_name : Pointer(LibC::Char)) : Void
  fun g_action_name_is_valid(action_name : Pointer(LibC::Char)) : LibC::Int
  fun g_action_name_is_valid(action_name : Pointer(LibC::Char)) : LibC::Int
  fun g_action_parse_detailed_name(detailed_name : Pointer(LibC::Char), action_name : Pointer(Pointer(LibC::Char)), target_value : Pointer(Pointer(Void)), error : LibGLib::Error**) : LibC::Int
  fun g_action_parse_detailed_name(detailed_name : Pointer(LibC::Char), action_name : Pointer(Pointer(LibC::Char)), target_value : Pointer(Pointer(Void)), error : LibGLib::Error**) : LibC::Int
  fun g_action_print_detailed_name(action_name : Pointer(LibC::Char), target_value : Pointer(Void)) : Pointer(LibC::Char)
  fun g_action_print_detailed_name(action_name : Pointer(LibC::Char), target_value : Pointer(Void)) : Pointer(LibC::Char)
  fun g_app_info_add_supports_type(this : Void*, content_type : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_app_info_can_delete(this : Void*) : LibC::Int
  fun g_app_info_can_remove_supports_type(this : Void*) : LibC::Int
  fun g_app_info_create_from_commandline(commandline : Pointer(LibC::Char), application_name : Pointer(LibC::Char), flags : UInt32, error : LibGLib::Error**) : Pointer(Void)
  fun g_app_info_create_from_commandline(commandline : Pointer(LibC::Char), application_name : Pointer(LibC::Char), flags : UInt32, error : LibGLib::Error**) : Pointer(Void)
  fun g_app_info_delete(this : Void*) : LibC::Int
  fun g_app_info_dup(this : Void*) : Pointer(Void)
  fun g_app_info_equal(this : Void*, appinfo2 : Pointer(Void)) : LibC::Int
  fun g_app_info_get_all : Pointer(LibGLib::List)
  fun g_app_info_get_all : Pointer(LibGLib::List)
  fun g_app_info_get_all_for_type(content_type : Pointer(LibC::Char)) : Pointer(LibGLib::List)
  fun g_app_info_get_all_for_type(content_type : Pointer(LibC::Char)) : Pointer(LibGLib::List)
  fun g_app_info_get_commandline(this : Void*) : Pointer(LibC::Char)
  fun g_app_info_get_default_for_type(content_type : Pointer(LibC::Char), must_support_uris : LibC::Int) : Pointer(Void)
  fun g_app_info_get_default_for_type(content_type : Pointer(LibC::Char), must_support_uris : LibC::Int) : Pointer(Void)
  fun g_app_info_get_default_for_uri_scheme(uri_scheme : Pointer(LibC::Char)) : Pointer(Void)
  fun g_app_info_get_default_for_uri_scheme(uri_scheme : Pointer(LibC::Char)) : Pointer(Void)
  fun g_app_info_get_description(this : Void*) : Pointer(LibC::Char)
  fun g_app_info_get_display_name(this : Void*) : Pointer(LibC::Char)
  fun g_app_info_get_executable(this : Void*) : Pointer(LibC::Char)
  fun g_app_info_get_fallback_for_type(content_type : Pointer(LibC::Char)) : Pointer(LibGLib::List)
  fun g_app_info_get_fallback_for_type(content_type : Pointer(LibC::Char)) : Pointer(LibGLib::List)
  fun g_app_info_get_icon(this : Void*) : Pointer(Void)
  fun g_app_info_get_id(this : Void*) : Pointer(LibC::Char)
  fun g_app_info_get_name(this : Void*) : Pointer(LibC::Char)
  fun g_app_info_get_recommended_for_type(content_type : Pointer(LibC::Char)) : Pointer(LibGLib::List)
  fun g_app_info_get_recommended_for_type(content_type : Pointer(LibC::Char)) : Pointer(LibGLib::List)
  fun g_app_info_get_supported_types(this : Void*) : Pointer(Pointer(LibC::Char))
  fun g_app_info_get_type : UInt64
  fun g_app_info_launch(this : Void*, files : Pointer(LibGLib::List), context : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_app_info_launch_default_for_uri(uri : Pointer(LibC::Char), context : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_app_info_launch_default_for_uri(uri : Pointer(LibC::Char), context : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_app_info_launch_default_for_uri_async(uri : Pointer(LibC::Char), context : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_app_info_launch_default_for_uri_async(uri : Pointer(LibC::Char), context : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_app_info_launch_default_for_uri_finish(result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_app_info_launch_default_for_uri_finish(result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_app_info_launch_uris(this : Void*, uris : Pointer(LibGLib::List), context : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_app_info_launch_uris_async(this : Void*, uris : Pointer(LibGLib::List), context : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_app_info_launch_uris_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_app_info_monitor_get : Pointer(Void)
  fun g_app_info_monitor_get_type : UInt64
  fun g_app_info_remove_supports_type(this : Void*, content_type : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_app_info_reset_type_associations(content_type : Pointer(LibC::Char)) : Void
  fun g_app_info_reset_type_associations(content_type : Pointer(LibC::Char)) : Void
  fun g_app_info_set_as_default_for_extension(this : Void*, extension : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_app_info_set_as_default_for_type(this : Void*, content_type : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_app_info_set_as_last_used_for_type(this : Void*, content_type : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_app_info_should_show(this : Void*) : LibC::Int
  fun g_app_info_supports_files(this : Void*) : LibC::Int
  fun g_app_info_supports_uris(this : Void*) : LibC::Int
  fun g_app_launch_context_get_display(this : Void*, info : Pointer(Void), files : Pointer(LibGLib::List)) : Pointer(LibC::Char)
  fun g_app_launch_context_get_environment(this : Void*) : Pointer(Pointer(LibC::Char))
  fun g_app_launch_context_get_startup_notify_id(this : Void*, info : Pointer(Void), files : Pointer(LibGLib::List)) : Pointer(LibC::Char)
  fun g_app_launch_context_get_type : UInt64
  fun g_app_launch_context_launch_failed(this : Void*, startup_notify_id : Pointer(LibC::Char)) : Void
  fun g_app_launch_context_new : Pointer(Void)
  fun g_app_launch_context_setenv(this : Void*, variable : Pointer(LibC::Char), value : Pointer(LibC::Char)) : Void
  fun g_app_launch_context_unsetenv(this : Void*, variable : Pointer(LibC::Char)) : Void
  fun g_application_activate(this : Void*) : Void
  fun g_application_add_main_option(this : Void*, long_name : Pointer(LibC::Char), short_name : Int8, flags : UInt32, arg : UInt32, description : Pointer(LibC::Char), arg_description : Pointer(LibC::Char)) : Void
  fun g_application_add_main_option_entries(this : Void*, entries : Pointer(Void)) : Void
  fun g_application_add_option_group(this : Void*, group : Pointer(Void)) : Void
  fun g_application_bind_busy_property(this : Void*, object : Pointer(Void), property : Pointer(LibC::Char)) : Void
  fun g_application_command_line_create_file_for_arg(this : Void*, arg : Pointer(LibC::Char)) : Pointer(Void)
  fun g_application_command_line_get_arguments(this : Void*, argc : Pointer(Int32)) : Pointer(Pointer(LibC::Char))
  fun g_application_command_line_get_cwd(this : Void*) : Pointer(LibC::Char)
  fun g_application_command_line_get_environ(this : Void*) : Pointer(Pointer(LibC::Char))
  fun g_application_command_line_get_exit_status(this : Void*) : Int32
  fun g_application_command_line_get_is_remote(this : Void*) : LibC::Int
  fun g_application_command_line_get_options_dict(this : Void*) : Pointer(Void)
  fun g_application_command_line_get_platform_data(this : Void*) : Pointer(Void)
  fun g_application_command_line_get_stdin(this : Void*) : Pointer(Void)
  fun g_application_command_line_get_type : UInt64
  fun g_application_command_line_getenv(this : Void*, name : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_application_command_line_set_exit_status(this : Void*, exit_status : Int32) : Void
  fun g_application_get_application_id(this : Void*) : Pointer(LibC::Char)
  fun g_application_get_dbus_connection(this : Void*) : Pointer(Void)
  fun g_application_get_dbus_object_path(this : Void*) : Pointer(LibC::Char)
  fun g_application_get_default : Pointer(Void)
  fun g_application_get_flags(this : Void*) : UInt32
  fun g_application_get_inactivity_timeout(this : Void*) : UInt32
  fun g_application_get_is_busy(this : Void*) : LibC::Int
  fun g_application_get_is_registered(this : Void*) : LibC::Int
  fun g_application_get_is_remote(this : Void*) : LibC::Int
  fun g_application_get_resource_base_path(this : Void*) : Pointer(LibC::Char)
  fun g_application_get_type : UInt64
  fun g_application_hold(this : Void*) : Void
  fun g_application_id_is_valid(application_id : Pointer(LibC::Char)) : LibC::Int
  fun g_application_mark_busy(this : Void*) : Void
  fun g_application_new(application_id : Pointer(LibC::Char), flags : UInt32) : Pointer(Void)
  fun g_application_open(this : Void*, files : Pointer(Pointer(Void)), n_files : Int32, hint : Pointer(LibC::Char)) : Void
  fun g_application_quit(this : Void*) : Void
  fun g_application_register(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_application_release(this : Void*) : Void
  fun g_application_run(this : Void*, argc : Int32, argv : Pointer(Pointer(LibC::Char))) : Int32
  fun g_application_send_notification(this : Void*, id : Pointer(LibC::Char), notification : Pointer(Void)) : Void
  fun g_application_set_action_group(this : Void*, action_group : Pointer(Void)) : Void
  fun g_application_set_application_id(this : Void*, application_id : Pointer(LibC::Char)) : Void
  fun g_application_set_default(this : Void*) : Void
  fun g_application_set_flags(this : Void*, flags : UInt32) : Void
  fun g_application_set_inactivity_timeout(this : Void*, inactivity_timeout : UInt32) : Void
  fun g_application_set_option_context_description(this : Void*, description : Pointer(LibC::Char)) : Void
  fun g_application_set_option_context_parameter_string(this : Void*, parameter_string : Pointer(LibC::Char)) : Void
  fun g_application_set_option_context_summary(this : Void*, summary : Pointer(LibC::Char)) : Void
  fun g_application_set_resource_base_path(this : Void*, resource_path : Pointer(LibC::Char)) : Void
  fun g_application_unbind_busy_property(this : Void*, object : Pointer(Void), property : Pointer(LibC::Char)) : Void
  fun g_application_unmark_busy(this : Void*) : Void
  fun g_application_withdraw_notification(this : Void*, id : Pointer(LibC::Char)) : Void
  fun g_async_initable_get_type : UInt64
  fun g_async_initable_init_async(this : Void*, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_async_initable_init_finish(this : Void*, res : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_async_initable_new_finish(this : Void*, res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_async_initable_newv_async(object_type : UInt64, n_parameters : UInt32, parameters : Pointer(Void), io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_async_initable_newv_async(object_type : UInt64, n_parameters : UInt32, parameters : Pointer(Void), io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_async_result_get_source_object(this : Void*) : Pointer(Void)
  fun g_async_result_get_type : UInt64
  fun g_async_result_get_user_data(this : Void*) : Pointer(Void)
  fun g_async_result_is_tagged(this : Void*, source_tag : Pointer(Void)) : LibC::Int
  fun g_async_result_legacy_propagate_error(this : Void*, error : LibGLib::Error**) : LibC::Int
  fun g_buffered_input_stream_fill(this : Void*, count : Int64, cancellable : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_buffered_input_stream_fill_async(this : Void*, count : Int64, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_buffered_input_stream_fill_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_buffered_input_stream_get_available(this : Void*) : UInt64
  fun g_buffered_input_stream_get_buffer_size(this : Void*) : UInt64
  fun g_buffered_input_stream_get_type : UInt64
  fun g_buffered_input_stream_new(base_stream : Pointer(Void)) : Pointer(Void)
  fun g_buffered_input_stream_new_sized(base_stream : Pointer(Void), size : UInt64) : Pointer(Void)
  fun g_buffered_input_stream_peek(this : Void*, buffer : Pointer(UInt8), offset : UInt64, count : UInt64) : UInt64
  fun g_buffered_input_stream_peek_buffer(this : Void*, count : Pointer(UInt64)) : Pointer(UInt8)
  fun g_buffered_input_stream_read_byte(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : Int32
  fun g_buffered_input_stream_set_buffer_size(this : Void*, size : UInt64) : Void
  fun g_buffered_output_stream_get_auto_grow(this : Void*) : LibC::Int
  fun g_buffered_output_stream_get_buffer_size(this : Void*) : UInt64
  fun g_buffered_output_stream_get_type : UInt64
  fun g_buffered_output_stream_new(base_stream : Pointer(Void)) : Pointer(Void)
  fun g_buffered_output_stream_new_sized(base_stream : Pointer(Void), size : UInt64) : Pointer(Void)
  fun g_buffered_output_stream_set_auto_grow(this : Void*, auto_grow : LibC::Int) : Void
  fun g_buffered_output_stream_set_buffer_size(this : Void*, size : UInt64) : Void
  fun g_bus_get(bus_type : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_bus_get_finish(res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_bus_get_sync(bus_type : Int32, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_bus_own_name_on_connection_with_closures(connection : Pointer(Void), name : Pointer(LibC::Char), flags : UInt32, name_acquired_closure : Pointer(Void), name_lost_closure : Pointer(Void)) : UInt32
  fun g_bus_own_name_with_closures(bus_type : Int32, name : Pointer(LibC::Char), flags : UInt32, bus_acquired_closure : Pointer(Void), name_acquired_closure : Pointer(Void), name_lost_closure : Pointer(Void)) : UInt32
  fun g_bus_unown_name(owner_id : UInt32) : Void
  fun g_bus_unwatch_name(watcher_id : UInt32) : Void
  fun g_bus_watch_name_on_connection_with_closures(connection : Pointer(Void), name : Pointer(LibC::Char), flags : UInt32, name_appeared_closure : Pointer(Void), name_vanished_closure : Pointer(Void)) : UInt32
  fun g_bus_watch_name_with_closures(bus_type : Int32, name : Pointer(LibC::Char), flags : UInt32, name_appeared_closure : Pointer(Void), name_vanished_closure : Pointer(Void)) : UInt32
  fun g_bytes_icon_get_bytes(this : Void*) : Pointer(Void)
  fun g_bytes_icon_get_type : UInt64
  fun g_bytes_icon_new(bytes : Pointer(Void)) : Pointer(Void)
  fun g_cancellable_cancel(this : Void*) : Void
  fun g_cancellable_connect(this : Void*, callback : LibGObject::Callback, data : Pointer(Void), data_destroy_func : LibGLib::DestroyNotify) : UInt64
  fun g_cancellable_disconnect(this : Void*, handler_id : UInt64) : Void
  fun g_cancellable_get_current : Pointer(Void)
  fun g_cancellable_get_fd(this : Void*) : Int32
  fun g_cancellable_get_type : UInt64
  fun g_cancellable_is_cancelled(this : Void*) : LibC::Int
  fun g_cancellable_make_pollfd(this : Void*, pollfd : Pointer(Void)) : LibC::Int
  fun g_cancellable_new : Pointer(Void)
  fun g_cancellable_pop_current(this : Void*) : Void
  fun g_cancellable_push_current(this : Void*) : Void
  fun g_cancellable_release_fd(this : Void*) : Void
  fun g_cancellable_reset(this : Void*) : Void
  fun g_cancellable_set_error_if_cancelled(this : Void*, error : LibGLib::Error**) : LibC::Int
  fun g_cancellable_source_new(this : Void*) : Pointer(Void)
  fun g_charset_converter_get_num_fallbacks(this : Void*) : UInt32
  fun g_charset_converter_get_type : UInt64
  fun g_charset_converter_get_use_fallback(this : Void*) : LibC::Int
  fun g_charset_converter_new(to_charset : Pointer(LibC::Char), from_charset : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_charset_converter_set_use_fallback(this : Void*, use_fallback : LibC::Int) : Void
  fun g_content_type_can_be_executable(type : Pointer(LibC::Char)) : LibC::Int
  fun g_content_type_equals(type1 : Pointer(LibC::Char), type2 : Pointer(LibC::Char)) : LibC::Int
  fun g_content_type_from_mime_type(mime_type : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_content_type_get_description(type : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_content_type_get_generic_icon_name(type : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_content_type_get_icon(type : Pointer(LibC::Char)) : Pointer(Void)
  fun g_content_type_get_mime_dirs : Pointer(Pointer(LibC::Char))
  fun g_content_type_get_mime_type(type : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_content_type_get_symbolic_icon(type : Pointer(LibC::Char)) : Pointer(Void)
  fun g_content_type_guess(filename : Pointer(LibC::Char), data : Pointer(UInt8), data_size : UInt64, result_uncertain : Pointer(LibC::Int)) : Pointer(LibC::Char)
  fun g_content_type_guess_for_tree(root : Pointer(Void)) : Pointer(Pointer(LibC::Char))
  fun g_content_type_is_a(type : Pointer(LibC::Char), supertype : Pointer(LibC::Char)) : LibC::Int
  fun g_content_type_is_mime_type(type : Pointer(LibC::Char), mime_type : Pointer(LibC::Char)) : LibC::Int
  fun g_content_type_is_unknown(type : Pointer(LibC::Char)) : LibC::Int
  fun g_content_type_set_mime_dirs(dirs : Pointer(Pointer(LibC::Char))) : Void
  fun g_content_types_get_registered : Pointer(LibGLib::List)
  fun g_converter_convert(this : Void*, inbuf : Pointer(UInt8), inbuf_size : UInt64, outbuf : Pointer(UInt8), outbuf_size : UInt64, flags : UInt32, bytes_read : Pointer(UInt64), bytes_written : Pointer(UInt64), error : LibGLib::Error**) : UInt32
  fun g_converter_get_type : UInt64
  fun g_converter_input_stream_get_converter(this : Void*) : Pointer(Void)
  fun g_converter_input_stream_get_type : UInt64
  fun g_converter_input_stream_new(base_stream : Pointer(Void), converter : Pointer(Void)) : Pointer(Void)
  fun g_converter_output_stream_get_converter(this : Void*) : Pointer(Void)
  fun g_converter_output_stream_get_type : UInt64
  fun g_converter_output_stream_new(base_stream : Pointer(Void), converter : Pointer(Void)) : Pointer(Void)
  fun g_converter_reset(this : Void*) : Void
  fun g_credentials_get_type : UInt64
  fun g_credentials_get_unix_pid(this : Void*, error : LibGLib::Error**) : Int32
  fun g_credentials_get_unix_user(this : Void*, error : LibGLib::Error**) : UInt32
  fun g_credentials_is_same_user(this : Void*, other_credentials : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_credentials_new : Pointer(Void)
  fun g_credentials_set_native(this : Void*, native_type : UInt32, native : Pointer(Void)) : Void
  fun g_credentials_set_unix_user(this : Void*, uid : UInt32, error : LibGLib::Error**) : LibC::Int
  fun g_credentials_to_string(this : Void*) : Pointer(LibC::Char)
  fun g_data_input_stream_get_byte_order(this : Void*) : UInt32
  fun g_data_input_stream_get_newline_type(this : Void*) : UInt32
  fun g_data_input_stream_get_type : UInt64
  fun g_data_input_stream_new(base_stream : Pointer(Void)) : Pointer(Void)
  fun g_data_input_stream_read_byte(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : UInt8
  fun g_data_input_stream_read_int16(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : Int16
  fun g_data_input_stream_read_int32(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : Int32
  fun g_data_input_stream_read_int64(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_data_input_stream_read_line(this : Void*, length : Pointer(UInt64), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(UInt8)
  fun g_data_input_stream_read_line_async(this : Void*, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_data_input_stream_read_line_finish(this : Void*, result : Pointer(Void), length : Pointer(UInt64), error : LibGLib::Error**) : Pointer(UInt8)
  fun g_data_input_stream_read_line_finish_utf8(this : Void*, result : Pointer(Void), length : Pointer(UInt64), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_data_input_stream_read_line_utf8(this : Void*, length : Pointer(UInt64), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_data_input_stream_read_uint16(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : UInt16
  fun g_data_input_stream_read_uint32(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : UInt32
  fun g_data_input_stream_read_uint64(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : UInt64
  fun g_data_input_stream_read_until(this : Void*, stop_chars : Pointer(LibC::Char), length : Pointer(UInt64), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_data_input_stream_read_until_async(this : Void*, stop_chars : Pointer(LibC::Char), io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_data_input_stream_read_until_finish(this : Void*, result : Pointer(Void), length : Pointer(UInt64), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_data_input_stream_read_upto(this : Void*, stop_chars : Pointer(LibC::Char), stop_chars_len : Int64, length : Pointer(UInt64), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_data_input_stream_read_upto_async(this : Void*, stop_chars : Pointer(LibC::Char), stop_chars_len : Int64, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_data_input_stream_read_upto_finish(this : Void*, result : Pointer(Void), length : Pointer(UInt64), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_data_input_stream_set_byte_order(this : Void*, order : UInt32) : Void
  fun g_data_input_stream_set_newline_type(this : Void*, type : UInt32) : Void
  fun g_data_output_stream_get_byte_order(this : Void*) : UInt32
  fun g_data_output_stream_get_type : UInt64
  fun g_data_output_stream_new(base_stream : Pointer(Void)) : Pointer(Void)
  fun g_data_output_stream_put_byte(this : Void*, data : UInt8, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_data_output_stream_put_int16(this : Void*, data : Int16, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_data_output_stream_put_int32(this : Void*, data : Int32, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_data_output_stream_put_int64(this : Void*, data : Int64, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_data_output_stream_put_string(this : Void*, str : Pointer(LibC::Char), cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_data_output_stream_put_uint16(this : Void*, data : UInt16, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_data_output_stream_put_uint32(this : Void*, data : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_data_output_stream_put_uint64(this : Void*, data : UInt64, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_data_output_stream_set_byte_order(this : Void*, order : UInt32) : Void
  fun g_datagram_based_condition_check(this : Void*, condition : UInt32) : UInt32
  fun g_datagram_based_condition_wait(this : Void*, condition : UInt32, timeout : Int64, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_datagram_based_create_source(this : Void*, condition : UInt32, cancellable : Pointer(Void)) : Pointer(Void)
  fun g_datagram_based_get_type : UInt64
  fun g_datagram_based_receive_messages(this : Void*, messages : Pointer(Void), num_messages : UInt32, flags : Int32, timeout : Int64, cancellable : Pointer(Void), error : LibGLib::Error**) : Int32
  fun g_datagram_based_send_messages(this : Void*, messages : Pointer(Void), num_messages : UInt32, flags : Int32, timeout : Int64, cancellable : Pointer(Void), error : LibGLib::Error**) : Int32
  fun g_dbus_action_group_get(connection : Pointer(Void), bus_name : Pointer(LibC::Char), object_path : Pointer(LibC::Char)) : Pointer(Void)
  fun g_dbus_action_group_get_type : UInt64
  fun g_dbus_address_escape_value(string : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_dbus_address_get_for_bus_sync(bus_type : Int32, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_dbus_address_get_stream(address : Pointer(LibC::Char), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_dbus_address_get_stream_finish(res : Pointer(Void), out_guid : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_address_get_stream_sync(address : Pointer(LibC::Char), out_guid : Pointer(Pointer(LibC::Char)), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_annotation_info_get_type : UInt64
  fun g_dbus_annotation_info_lookup(annotations : Pointer(Pointer(Void)), name : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_dbus_annotation_info_lookup(annotations : Pointer(Pointer(Void)), name : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_dbus_annotation_info_ref(this : Void*) : Pointer(Void)
  fun g_dbus_annotation_info_unref(this : Void*) : Void
  fun g_dbus_arg_info_get_type : UInt64
  fun g_dbus_arg_info_ref(this : Void*) : Pointer(Void)
  fun g_dbus_arg_info_unref(this : Void*) : Void
  fun g_dbus_auth_observer_allow_mechanism(this : Void*, mechanism : Pointer(LibC::Char)) : LibC::Int
  fun g_dbus_auth_observer_authorize_authenticated_peer(this : Void*, stream : Pointer(Void), credentials : Pointer(Void)) : LibC::Int
  fun g_dbus_auth_observer_get_type : UInt64
  fun g_dbus_auth_observer_new : Pointer(Void)
  fun g_dbus_connection_add_filter(this : Void*, filter_function : DBusMessageFilterFunction, user_data : Pointer(Void), user_data_free_func : LibGLib::DestroyNotify) : UInt32
  fun g_dbus_connection_call(this : Void*, bus_name : Pointer(LibC::Char), object_path : Pointer(LibC::Char), interface_name : Pointer(LibC::Char), method_name : Pointer(LibC::Char), parameters : Pointer(Void), reply_type : Pointer(Void), flags : UInt32, timeout_msec : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_dbus_connection_call_finish(this : Void*, res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_connection_call_sync(this : Void*, bus_name : Pointer(LibC::Char), object_path : Pointer(LibC::Char), interface_name : Pointer(LibC::Char), method_name : Pointer(LibC::Char), parameters : Pointer(Void), reply_type : Pointer(Void), flags : UInt32, timeout_msec : Int32, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_connection_call_with_unix_fd_list(this : Void*, bus_name : Pointer(LibC::Char), object_path : Pointer(LibC::Char), interface_name : Pointer(LibC::Char), method_name : Pointer(LibC::Char), parameters : Pointer(Void), reply_type : Pointer(Void), flags : UInt32, timeout_msec : Int32, fd_list : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_dbus_connection_call_with_unix_fd_list_finish(this : Void*, out_fd_list : Pointer(Pointer(Void)), res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_connection_call_with_unix_fd_list_sync(this : Void*, bus_name : Pointer(LibC::Char), object_path : Pointer(LibC::Char), interface_name : Pointer(LibC::Char), method_name : Pointer(LibC::Char), parameters : Pointer(Void), reply_type : Pointer(Void), flags : UInt32, timeout_msec : Int32, fd_list : Pointer(Void), out_fd_list : Pointer(Pointer(Void)), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_connection_close(this : Void*, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_dbus_connection_close_finish(this : Void*, res : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_dbus_connection_close_sync(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_dbus_connection_emit_signal(this : Void*, destination_bus_name : Pointer(LibC::Char), object_path : Pointer(LibC::Char), interface_name : Pointer(LibC::Char), signal_name : Pointer(LibC::Char), parameters : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_dbus_connection_export_action_group(this : Void*, object_path : Pointer(LibC::Char), action_group : Pointer(Void), error : LibGLib::Error**) : UInt32
  fun g_dbus_connection_export_menu_model(this : Void*, object_path : Pointer(LibC::Char), menu : Pointer(Void), error : LibGLib::Error**) : UInt32
  fun g_dbus_connection_flush(this : Void*, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_dbus_connection_flush_finish(this : Void*, res : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_dbus_connection_flush_sync(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_dbus_connection_get_capabilities(this : Void*) : UInt32
  fun g_dbus_connection_get_exit_on_close(this : Void*) : LibC::Int
  fun g_dbus_connection_get_flags(this : Void*) : UInt32
  fun g_dbus_connection_get_guid(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_connection_get_last_serial(this : Void*) : UInt32
  fun g_dbus_connection_get_peer_credentials(this : Void*) : Pointer(Void)
  fun g_dbus_connection_get_stream(this : Void*) : Pointer(Void)
  fun g_dbus_connection_get_type : UInt64
  fun g_dbus_connection_get_unique_name(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_connection_is_closed(this : Void*) : LibC::Int
  fun g_dbus_connection_new(stream : Pointer(Void), guid : Pointer(LibC::Char), flags : UInt32, observer : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_dbus_connection_new_finish(res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_connection_new_for_address(address : Pointer(LibC::Char), flags : UInt32, observer : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_dbus_connection_new_for_address_finish(res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_connection_new_for_address_sync(address : Pointer(LibC::Char), flags : UInt32, observer : Pointer(Void), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_connection_new_sync(stream : Pointer(Void), guid : Pointer(LibC::Char), flags : UInt32, observer : Pointer(Void), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_connection_register_object_with_closures(this : Void*, object_path : Pointer(LibC::Char), interface_info : Pointer(Void), method_call_closure : Pointer(Void), get_property_closure : Pointer(Void), set_property_closure : Pointer(Void), error : LibGLib::Error**) : UInt32
  fun g_dbus_connection_register_subtree(this : Void*, object_path : Pointer(LibC::Char), vtable : Pointer(Void), flags : UInt32, user_data : Pointer(Void), user_data_free_func : LibGLib::DestroyNotify, error : LibGLib::Error**) : UInt32
  fun g_dbus_connection_remove_filter(this : Void*, filter_id : UInt32) : Void
  fun g_dbus_connection_send_message(this : Void*, message : Pointer(Void), flags : UInt32, out_serial : Pointer(UInt32), error : LibGLib::Error**) : LibC::Int
  fun g_dbus_connection_send_message_with_reply(this : Void*, message : Pointer(Void), flags : UInt32, timeout_msec : Int32, out_serial : Pointer(UInt32), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_dbus_connection_send_message_with_reply_finish(this : Void*, res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_connection_send_message_with_reply_sync(this : Void*, message : Pointer(Void), flags : UInt32, timeout_msec : Int32, out_serial : Pointer(UInt32), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_connection_set_exit_on_close(this : Void*, exit_on_close : LibC::Int) : Void
  fun g_dbus_connection_signal_subscribe(this : Void*, sender : Pointer(LibC::Char), interface_name : Pointer(LibC::Char), member : Pointer(LibC::Char), object_path : Pointer(LibC::Char), arg0 : Pointer(LibC::Char), flags : UInt32, callback : DBusSignalCallback, user_data : Pointer(Void), user_data_free_func : LibGLib::DestroyNotify) : UInt32
  fun g_dbus_connection_signal_unsubscribe(this : Void*, subscription_id : UInt32) : Void
  fun g_dbus_connection_start_message_processing(this : Void*) : Void
  fun g_dbus_connection_unexport_action_group(this : Void*, export_id : UInt32) : Void
  fun g_dbus_connection_unexport_menu_model(this : Void*, export_id : UInt32) : Void
  fun g_dbus_connection_unregister_object(this : Void*, registration_id : UInt32) : LibC::Int
  fun g_dbus_connection_unregister_subtree(this : Void*, registration_id : UInt32) : LibC::Int
  fun g_dbus_error_encode_gerror(error : Pointer(Void)) : Pointer(LibC::Char)
  fun g_dbus_error_get_remote_error(error : Pointer(Void)) : Pointer(LibC::Char)
  fun g_dbus_error_is_remote_error(error : Pointer(Void)) : LibC::Int
  fun g_dbus_error_new_for_dbus_error(dbus_error_name : Pointer(LibC::Char), dbus_error_message : Pointer(LibC::Char)) : Pointer(Void)
  fun g_dbus_error_quark : UInt32
  fun g_dbus_error_register_error(error_domain : UInt32, error_code : Int32, dbus_error_name : Pointer(LibC::Char)) : LibC::Int
  fun g_dbus_error_register_error_domain(error_domain_quark_name : Pointer(LibC::Char), quark_volatile : Pointer(UInt64), entries : Pointer(Void), num_entries : UInt32) : Void
  fun g_dbus_error_strip_remote_error(error : Pointer(Void)) : LibC::Int
  fun g_dbus_error_unregister_error(error_domain : UInt32, error_code : Int32, dbus_error_name : Pointer(LibC::Char)) : LibC::Int
  fun g_dbus_escape_object_path(s : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_dbus_escape_object_path_bytestring(bytes : Pointer(UInt8)) : Pointer(LibC::Char)
  fun g_dbus_generate_guid : Pointer(LibC::Char)
  fun g_dbus_gvalue_to_gvariant(gvalue : Pointer(Void), type : Pointer(Void)) : Pointer(Void)
  fun g_dbus_gvariant_to_gvalue(value : Pointer(Void), out_gvalue : Pointer(Void)) : Void
  fun g_dbus_interface_dup_object(this : Void*) : Pointer(Void)
  fun g_dbus_interface_get_info(this : Void*) : Pointer(Void)
  fun g_dbus_interface_get_type : UInt64
  fun g_dbus_interface_info_cache_build(this : Void*) : Void
  fun g_dbus_interface_info_cache_release(this : Void*) : Void
  fun g_dbus_interface_info_generate_xml(this : Void*, indent : UInt32, string_builder : Pointer(Void)) : Void
  fun g_dbus_interface_info_get_type : UInt64
  fun g_dbus_interface_info_lookup_method(this : Void*, name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_dbus_interface_info_lookup_property(this : Void*, name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_dbus_interface_info_lookup_signal(this : Void*, name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_dbus_interface_info_ref(this : Void*) : Pointer(Void)
  fun g_dbus_interface_info_unref(this : Void*) : Void
  fun g_dbus_interface_set_object(this : Void*, object : Pointer(Void)) : Void
  fun g_dbus_interface_skeleton_export(this : Void*, connection : Pointer(Void), object_path : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_dbus_interface_skeleton_flush(this : Void*) : Void
  fun g_dbus_interface_skeleton_get_connection(this : Void*) : Pointer(Void)
  fun g_dbus_interface_skeleton_get_connections(this : Void*) : Pointer(LibGLib::List)
  fun g_dbus_interface_skeleton_get_flags(this : Void*) : UInt32
  fun g_dbus_interface_skeleton_get_info(this : Void*) : Pointer(Void)
  fun g_dbus_interface_skeleton_get_object_path(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_interface_skeleton_get_properties(this : Void*) : Pointer(Void)
  fun g_dbus_interface_skeleton_get_type : UInt64
  fun g_dbus_interface_skeleton_has_connection(this : Void*, connection : Pointer(Void)) : LibC::Int
  fun g_dbus_interface_skeleton_set_flags(this : Void*, flags : UInt32) : Void
  fun g_dbus_interface_skeleton_unexport(this : Void*) : Void
  fun g_dbus_interface_skeleton_unexport_from_connection(this : Void*, connection : Pointer(Void)) : Void
  fun g_dbus_is_address(string : Pointer(LibC::Char)) : LibC::Int
  fun g_dbus_is_error_name(string : Pointer(LibC::Char)) : LibC::Int
  fun g_dbus_is_guid(string : Pointer(LibC::Char)) : LibC::Int
  fun g_dbus_is_interface_name(string : Pointer(LibC::Char)) : LibC::Int
  fun g_dbus_is_member_name(string : Pointer(LibC::Char)) : LibC::Int
  fun g_dbus_is_name(string : Pointer(LibC::Char)) : LibC::Int
  fun g_dbus_is_supported_address(string : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_dbus_is_unique_name(string : Pointer(LibC::Char)) : LibC::Int
  fun g_dbus_menu_model_get(connection : Pointer(Void), bus_name : Pointer(LibC::Char), object_path : Pointer(LibC::Char)) : Pointer(Void)
  fun g_dbus_menu_model_get_type : UInt64
  fun g_dbus_message_bytes_needed(blob : Pointer(UInt8), blob_len : UInt64, error : LibGLib::Error**) : Int64
  fun g_dbus_message_copy(this : Void*, error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_message_get_arg0(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_message_get_body(this : Void*) : Pointer(Void)
  fun g_dbus_message_get_byte_order(this : Void*) : UInt32
  fun g_dbus_message_get_destination(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_message_get_error_name(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_message_get_flags(this : Void*) : UInt32
  fun g_dbus_message_get_header(this : Void*, header_field : UInt32) : Pointer(Void)
  fun g_dbus_message_get_header_fields(this : Void*) : Pointer(UInt8)
  fun g_dbus_message_get_interface(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_message_get_locked(this : Void*) : LibC::Int
  fun g_dbus_message_get_member(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_message_get_message_type(this : Void*) : UInt32
  fun g_dbus_message_get_num_unix_fds(this : Void*) : UInt32
  fun g_dbus_message_get_path(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_message_get_reply_serial(this : Void*) : UInt32
  fun g_dbus_message_get_sender(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_message_get_serial(this : Void*) : UInt32
  fun g_dbus_message_get_signature(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_message_get_type : UInt64
  fun g_dbus_message_get_unix_fd_list(this : Void*) : Pointer(Void)
  fun g_dbus_message_lock(this : Void*) : Void
  fun g_dbus_message_new : Pointer(Void)
  fun g_dbus_message_new_from_blob(blob : Pointer(UInt8), blob_len : UInt64, capabilities : UInt32, error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_message_new_method_call(name : Pointer(LibC::Char), path : Pointer(LibC::Char), interface_ : Pointer(LibC::Char), method : Pointer(LibC::Char)) : Pointer(Void)
  fun g_dbus_message_new_method_error_literal(this : Void*, error_name : Pointer(LibC::Char), error_message : Pointer(LibC::Char)) : Pointer(Void)
  fun g_dbus_message_new_method_reply(this : Void*) : Pointer(Void)
  fun g_dbus_message_new_signal(path : Pointer(LibC::Char), interface_ : Pointer(LibC::Char), signal : Pointer(LibC::Char)) : Pointer(Void)
  fun g_dbus_message_print(this : Void*, indent : UInt32) : Pointer(LibC::Char)
  fun g_dbus_message_set_body(this : Void*, body : Pointer(Void)) : Void
  fun g_dbus_message_set_byte_order(this : Void*, byte_order : UInt32) : Void
  fun g_dbus_message_set_destination(this : Void*, value : Pointer(LibC::Char)) : Void
  fun g_dbus_message_set_error_name(this : Void*, value : Pointer(LibC::Char)) : Void
  fun g_dbus_message_set_flags(this : Void*, flags : UInt32) : Void
  fun g_dbus_message_set_header(this : Void*, header_field : UInt32, value : Pointer(Void)) : Void
  fun g_dbus_message_set_interface(this : Void*, value : Pointer(LibC::Char)) : Void
  fun g_dbus_message_set_member(this : Void*, value : Pointer(LibC::Char)) : Void
  fun g_dbus_message_set_message_type(this : Void*, type : UInt32) : Void
  fun g_dbus_message_set_num_unix_fds(this : Void*, value : UInt32) : Void
  fun g_dbus_message_set_path(this : Void*, value : Pointer(LibC::Char)) : Void
  fun g_dbus_message_set_reply_serial(this : Void*, value : UInt32) : Void
  fun g_dbus_message_set_sender(this : Void*, value : Pointer(LibC::Char)) : Void
  fun g_dbus_message_set_serial(this : Void*, serial : UInt32) : Void
  fun g_dbus_message_set_signature(this : Void*, value : Pointer(LibC::Char)) : Void
  fun g_dbus_message_set_unix_fd_list(this : Void*, fd_list : Pointer(Void)) : Void
  fun g_dbus_message_to_blob(this : Void*, out_size : Pointer(UInt64), capabilities : UInt32, error : LibGLib::Error**) : Pointer(UInt8)
  fun g_dbus_message_to_gerror(this : Void*, error : LibGLib::Error**) : LibC::Int
  fun g_dbus_method_info_get_type : UInt64
  fun g_dbus_method_info_ref(this : Void*) : Pointer(Void)
  fun g_dbus_method_info_unref(this : Void*) : Void
  fun g_dbus_method_invocation_get_connection(this : Void*) : Pointer(Void)
  fun g_dbus_method_invocation_get_interface_name(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_method_invocation_get_message(this : Void*) : Pointer(Void)
  fun g_dbus_method_invocation_get_method_info(this : Void*) : Pointer(Void)
  fun g_dbus_method_invocation_get_method_name(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_method_invocation_get_object_path(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_method_invocation_get_parameters(this : Void*) : Pointer(Void)
  fun g_dbus_method_invocation_get_property_info(this : Void*) : Pointer(Void)
  fun g_dbus_method_invocation_get_sender(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_method_invocation_get_type : UInt64
  fun g_dbus_method_invocation_return_dbus_error(this : Void*, error_name : Pointer(LibC::Char), error_message : Pointer(LibC::Char)) : Void
  fun g_dbus_method_invocation_return_error_literal(this : Void*, domain : UInt32, code : Int32, message : Pointer(LibC::Char)) : Void
  fun g_dbus_method_invocation_return_gerror(this : Void*, error : Pointer(Void)) : Void
  fun g_dbus_method_invocation_return_value(this : Void*, parameters : Pointer(Void)) : Void
  fun g_dbus_method_invocation_return_value_with_unix_fd_list(this : Void*, parameters : Pointer(Void), fd_list : Pointer(Void)) : Void
  fun g_dbus_node_info_generate_xml(this : Void*, indent : UInt32, string_builder : Pointer(Void)) : Void
  fun g_dbus_node_info_get_type : UInt64
  fun g_dbus_node_info_lookup_interface(this : Void*, name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_dbus_node_info_new_for_xml(xml_data : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_node_info_ref(this : Void*) : Pointer(Void)
  fun g_dbus_node_info_unref(this : Void*) : Void
  fun g_dbus_object_get_interface(this : Void*, interface_name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_dbus_object_get_interfaces(this : Void*) : Pointer(LibGLib::List)
  fun g_dbus_object_get_object_path(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_object_get_type : UInt64
  fun g_dbus_object_manager_client_get_connection(this : Void*) : Pointer(Void)
  fun g_dbus_object_manager_client_get_flags(this : Void*) : UInt32
  fun g_dbus_object_manager_client_get_name(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_object_manager_client_get_name_owner(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_object_manager_client_get_type : UInt64
  fun g_dbus_object_manager_client_new(connection : Pointer(Void), flags : UInt32, name : Pointer(LibC::Char), object_path : Pointer(LibC::Char), get_proxy_type_func : DBusProxyTypeFunc, get_proxy_type_user_data : Pointer(Void), get_proxy_type_destroy_notify : LibGLib::DestroyNotify, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_dbus_object_manager_client_new_finish(res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_object_manager_client_new_for_bus(bus_type : Int32, flags : UInt32, name : Pointer(LibC::Char), object_path : Pointer(LibC::Char), get_proxy_type_func : DBusProxyTypeFunc, get_proxy_type_user_data : Pointer(Void), get_proxy_type_destroy_notify : LibGLib::DestroyNotify, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_dbus_object_manager_client_new_for_bus_finish(res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_object_manager_client_new_for_bus_sync(bus_type : Int32, flags : UInt32, name : Pointer(LibC::Char), object_path : Pointer(LibC::Char), get_proxy_type_func : DBusProxyTypeFunc, get_proxy_type_user_data : Pointer(Void), get_proxy_type_destroy_notify : LibGLib::DestroyNotify, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_object_manager_client_new_sync(connection : Pointer(Void), flags : UInt32, name : Pointer(LibC::Char), object_path : Pointer(LibC::Char), get_proxy_type_func : DBusProxyTypeFunc, get_proxy_type_user_data : Pointer(Void), get_proxy_type_destroy_notify : LibGLib::DestroyNotify, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_object_manager_get_interface(this : Void*, object_path : Pointer(LibC::Char), interface_name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_dbus_object_manager_get_object(this : Void*, object_path : Pointer(LibC::Char)) : Pointer(Void)
  fun g_dbus_object_manager_get_object_path(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_object_manager_get_objects(this : Void*) : Pointer(LibGLib::List)
  fun g_dbus_object_manager_get_type : UInt64
  fun g_dbus_object_manager_server_export(this : Void*, object : Pointer(Void)) : Void
  fun g_dbus_object_manager_server_export_uniquely(this : Void*, object : Pointer(Void)) : Void
  fun g_dbus_object_manager_server_get_connection(this : Void*) : Pointer(Void)
  fun g_dbus_object_manager_server_get_type : UInt64
  fun g_dbus_object_manager_server_is_exported(this : Void*, object : Pointer(Void)) : LibC::Int
  fun g_dbus_object_manager_server_new(object_path : Pointer(LibC::Char)) : Pointer(Void)
  fun g_dbus_object_manager_server_set_connection(this : Void*, connection : Pointer(Void)) : Void
  fun g_dbus_object_manager_server_unexport(this : Void*, object_path : Pointer(LibC::Char)) : LibC::Int
  fun g_dbus_object_proxy_get_connection(this : Void*) : Pointer(Void)
  fun g_dbus_object_proxy_get_type : UInt64
  fun g_dbus_object_proxy_new(connection : Pointer(Void), object_path : Pointer(LibC::Char)) : Pointer(Void)
  fun g_dbus_object_skeleton_add_interface(this : Void*, interface_ : Pointer(Void)) : Void
  fun g_dbus_object_skeleton_flush(this : Void*) : Void
  fun g_dbus_object_skeleton_get_type : UInt64
  fun g_dbus_object_skeleton_new(object_path : Pointer(LibC::Char)) : Pointer(Void)
  fun g_dbus_object_skeleton_remove_interface(this : Void*, interface_ : Pointer(Void)) : Void
  fun g_dbus_object_skeleton_remove_interface_by_name(this : Void*, interface_name : Pointer(LibC::Char)) : Void
  fun g_dbus_object_skeleton_set_object_path(this : Void*, object_path : Pointer(LibC::Char)) : Void
  fun g_dbus_property_info_get_type : UInt64
  fun g_dbus_property_info_ref(this : Void*) : Pointer(Void)
  fun g_dbus_property_info_unref(this : Void*) : Void
  fun g_dbus_proxy_call(this : Void*, method_name : Pointer(LibC::Char), parameters : Pointer(Void), flags : UInt32, timeout_msec : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_dbus_proxy_call_finish(this : Void*, res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_proxy_call_sync(this : Void*, method_name : Pointer(LibC::Char), parameters : Pointer(Void), flags : UInt32, timeout_msec : Int32, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_proxy_call_with_unix_fd_list(this : Void*, method_name : Pointer(LibC::Char), parameters : Pointer(Void), flags : UInt32, timeout_msec : Int32, fd_list : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_dbus_proxy_call_with_unix_fd_list_finish(this : Void*, out_fd_list : Pointer(Pointer(Void)), res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_proxy_call_with_unix_fd_list_sync(this : Void*, method_name : Pointer(LibC::Char), parameters : Pointer(Void), flags : UInt32, timeout_msec : Int32, fd_list : Pointer(Void), out_fd_list : Pointer(Pointer(Void)), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_proxy_get_cached_property(this : Void*, property_name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_dbus_proxy_get_cached_property_names(this : Void*) : Pointer(Pointer(LibC::Char))
  fun g_dbus_proxy_get_connection(this : Void*) : Pointer(Void)
  fun g_dbus_proxy_get_default_timeout(this : Void*) : Int32
  fun g_dbus_proxy_get_flags(this : Void*) : UInt32
  fun g_dbus_proxy_get_interface_info(this : Void*) : Pointer(Void)
  fun g_dbus_proxy_get_interface_name(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_proxy_get_name(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_proxy_get_name_owner(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_proxy_get_object_path(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_proxy_get_type : UInt64
  fun g_dbus_proxy_new(connection : Pointer(Void), flags : UInt32, info : Pointer(Void), name : Pointer(LibC::Char), object_path : Pointer(LibC::Char), interface_name : Pointer(LibC::Char), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_dbus_proxy_new_finish(res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_proxy_new_for_bus(bus_type : Int32, flags : UInt32, info : Pointer(Void), name : Pointer(LibC::Char), object_path : Pointer(LibC::Char), interface_name : Pointer(LibC::Char), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_dbus_proxy_new_for_bus_finish(res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_proxy_new_for_bus_sync(bus_type : Int32, flags : UInt32, info : Pointer(Void), name : Pointer(LibC::Char), object_path : Pointer(LibC::Char), interface_name : Pointer(LibC::Char), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_proxy_new_sync(connection : Pointer(Void), flags : UInt32, info : Pointer(Void), name : Pointer(LibC::Char), object_path : Pointer(LibC::Char), interface_name : Pointer(LibC::Char), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_proxy_set_cached_property(this : Void*, property_name : Pointer(LibC::Char), value : Pointer(Void)) : Void
  fun g_dbus_proxy_set_default_timeout(this : Void*, timeout_msec : Int32) : Void
  fun g_dbus_proxy_set_interface_info(this : Void*, info : Pointer(Void)) : Void
  fun g_dbus_server_get_client_address(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_server_get_flags(this : Void*) : UInt32
  fun g_dbus_server_get_guid(this : Void*) : Pointer(LibC::Char)
  fun g_dbus_server_get_type : UInt64
  fun g_dbus_server_is_active(this : Void*) : LibC::Int
  fun g_dbus_server_new_sync(address : Pointer(LibC::Char), flags : UInt32, guid : Pointer(LibC::Char), observer : Pointer(Void), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dbus_server_start(this : Void*) : Void
  fun g_dbus_server_stop(this : Void*) : Void
  fun g_dbus_signal_info_get_type : UInt64
  fun g_dbus_signal_info_ref(this : Void*) : Pointer(Void)
  fun g_dbus_signal_info_unref(this : Void*) : Void
  fun g_dbus_unescape_object_path(s : Pointer(LibC::Char)) : Pointer(UInt8)
  fun g_desktop_app_info_get_action_name(this : Void*, action_name : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_desktop_app_info_get_boolean(this : Void*, key : Pointer(LibC::Char)) : LibC::Int
  fun g_desktop_app_info_get_categories(this : Void*) : Pointer(LibC::Char)
  fun g_desktop_app_info_get_filename(this : Void*) : Pointer(LibC::Char)
  fun g_desktop_app_info_get_generic_name(this : Void*) : Pointer(LibC::Char)
  fun g_desktop_app_info_get_implementations(interface : Pointer(LibC::Char)) : Pointer(LibGLib::List)
  fun g_desktop_app_info_get_is_hidden(this : Void*) : LibC::Int
  fun g_desktop_app_info_get_keywords(this : Void*) : Pointer(Pointer(LibC::Char))
  fun g_desktop_app_info_get_locale_string(this : Void*, key : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_desktop_app_info_get_nodisplay(this : Void*) : LibC::Int
  fun g_desktop_app_info_get_show_in(this : Void*, desktop_env : Pointer(LibC::Char)) : LibC::Int
  fun g_desktop_app_info_get_startup_wm_class(this : Void*) : Pointer(LibC::Char)
  fun g_desktop_app_info_get_string(this : Void*, key : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_desktop_app_info_get_string_list(this : Void*, key : Pointer(LibC::Char), length : Pointer(UInt64)) : Pointer(Pointer(LibC::Char))
  fun g_desktop_app_info_get_type : UInt64
  fun g_desktop_app_info_has_key(this : Void*, key : Pointer(LibC::Char)) : LibC::Int
  fun g_desktop_app_info_launch_action(this : Void*, action_name : Pointer(LibC::Char), launch_context : Pointer(Void)) : Void
  fun g_desktop_app_info_launch_uris_as_manager(this : Void*, uris : Pointer(LibGLib::List), launch_context : Pointer(Void), spawn_flags : UInt32, user_setup : LibGLib::SpawnChildSetupFunc, user_setup_data : Pointer(Void), pid_callback : DesktopAppLaunchCallback, pid_callback_data : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_desktop_app_info_launch_uris_as_manager_with_fds(this : Void*, uris : Pointer(LibGLib::List), launch_context : Pointer(Void), spawn_flags : UInt32, user_setup : LibGLib::SpawnChildSetupFunc, user_setup_data : Pointer(Void), pid_callback : DesktopAppLaunchCallback, pid_callback_data : Pointer(Void), stdin_fd : Int32, stdout_fd : Int32, stderr_fd : Int32, error : LibGLib::Error**) : LibC::Int
  fun g_desktop_app_info_list_actions(this : Void*) : Pointer(Pointer(LibC::Char))
  fun g_desktop_app_info_lookup_get_default_for_uri_scheme(this : Void*, uri_scheme : Pointer(LibC::Char)) : Pointer(Void)
  fun g_desktop_app_info_lookup_get_type : UInt64
  fun g_desktop_app_info_new(desktop_id : Pointer(LibC::Char)) : Pointer(Void)
  fun g_desktop_app_info_new_from_filename(filename : Pointer(LibC::Char)) : Pointer(Void)
  fun g_desktop_app_info_new_from_keyfile(key_file : Pointer(Void)) : Pointer(Void)
  fun g_desktop_app_info_search(search_string : Pointer(LibC::Char)) : Pointer(Pointer(Pointer(LibC::Char)))
  fun g_desktop_app_info_set_desktop_env(desktop_env : Pointer(LibC::Char)) : Void
  fun g_drive_can_eject(this : Void*) : LibC::Int
  fun g_drive_can_poll_for_media(this : Void*) : LibC::Int
  fun g_drive_can_start(this : Void*) : LibC::Int
  fun g_drive_can_start_degraded(this : Void*) : LibC::Int
  fun g_drive_can_stop(this : Void*) : LibC::Int
  fun g_drive_eject(this : Void*, flags : UInt32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_drive_eject_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_drive_eject_with_operation(this : Void*, flags : UInt32, mount_operation : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_drive_eject_with_operation_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_drive_enumerate_identifiers(this : Void*) : Pointer(Pointer(LibC::Char))
  fun g_drive_get_icon(this : Void*) : Pointer(Void)
  fun g_drive_get_identifier(this : Void*, kind : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_drive_get_name(this : Void*) : Pointer(LibC::Char)
  fun g_drive_get_sort_key(this : Void*) : Pointer(LibC::Char)
  fun g_drive_get_start_stop_type(this : Void*) : UInt32
  fun g_drive_get_symbolic_icon(this : Void*) : Pointer(Void)
  fun g_drive_get_type : UInt64
  fun g_drive_get_volumes(this : Void*) : Pointer(LibGLib::List)
  fun g_drive_has_media(this : Void*) : LibC::Int
  fun g_drive_has_volumes(this : Void*) : LibC::Int
  fun g_drive_is_media_check_automatic(this : Void*) : LibC::Int
  fun g_drive_is_media_removable(this : Void*) : LibC::Int
  fun g_drive_is_removable(this : Void*) : LibC::Int
  fun g_drive_poll_for_media(this : Void*, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_drive_poll_for_media_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_drive_start(this : Void*, flags : UInt32, mount_operation : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_drive_start_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_drive_stop(this : Void*, flags : UInt32, mount_operation : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_drive_stop_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_dtls_client_connection_get_accepted_cas(this : Void*) : Pointer(LibGLib::List)
  fun g_dtls_client_connection_get_server_identity(this : Void*) : Pointer(Void)
  fun g_dtls_client_connection_get_type : UInt64
  fun g_dtls_client_connection_get_validation_flags(this : Void*) : UInt32
  fun g_dtls_client_connection_new(base_socket : Pointer(Void), server_identity : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dtls_client_connection_new(base_socket : Pointer(Void), server_identity : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dtls_client_connection_set_server_identity(this : Void*, identity : Pointer(Void)) : Void
  fun g_dtls_client_connection_set_validation_flags(this : Void*, flags : UInt32) : Void
  fun g_dtls_connection_close(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_dtls_connection_close_async(this : Void*, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_dtls_connection_close_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_dtls_connection_emit_accept_certificate(this : Void*, peer_cert : Pointer(Void), errors : UInt32) : LibC::Int
  fun g_dtls_connection_get_certificate(this : Void*) : Pointer(Void)
  fun g_dtls_connection_get_channel_binding_data(this : Void*, type : UInt32, data : Pointer(Pointer(UInt8)), error : LibGLib::Error**) : LibC::Int
  fun g_dtls_connection_get_ciphersuite_name(this : Void*) : Pointer(LibC::Char)
  fun g_dtls_connection_get_database(this : Void*) : Pointer(Void)
  fun g_dtls_connection_get_interaction(this : Void*) : Pointer(Void)
  fun g_dtls_connection_get_negotiated_protocol(this : Void*) : Pointer(LibC::Char)
  fun g_dtls_connection_get_peer_certificate(this : Void*) : Pointer(Void)
  fun g_dtls_connection_get_peer_certificate_errors(this : Void*) : UInt32
  fun g_dtls_connection_get_protocol_version(this : Void*) : UInt32
  fun g_dtls_connection_get_rehandshake_mode(this : Void*) : UInt32
  fun g_dtls_connection_get_require_close_notify(this : Void*) : LibC::Int
  fun g_dtls_connection_get_type : UInt64
  fun g_dtls_connection_handshake(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_dtls_connection_handshake_async(this : Void*, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_dtls_connection_handshake_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_dtls_connection_set_advertised_protocols(this : Void*, protocols : Pointer(Pointer(LibC::Char))) : Void
  fun g_dtls_connection_set_certificate(this : Void*, certificate : Pointer(Void)) : Void
  fun g_dtls_connection_set_database(this : Void*, database : Pointer(Void)) : Void
  fun g_dtls_connection_set_interaction(this : Void*, interaction : Pointer(Void)) : Void
  fun g_dtls_connection_set_rehandshake_mode(this : Void*, mode : UInt32) : Void
  fun g_dtls_connection_set_require_close_notify(this : Void*, require_close_notify : LibC::Int) : Void
  fun g_dtls_connection_shutdown(this : Void*, shutdown_read : LibC::Int, shutdown_write : LibC::Int, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_dtls_connection_shutdown_async(this : Void*, shutdown_read : LibC::Int, shutdown_write : LibC::Int, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_dtls_connection_shutdown_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_dtls_server_connection_get_type : UInt64
  fun g_dtls_server_connection_new(base_socket : Pointer(Void), certificate : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_dtls_server_connection_new(base_socket : Pointer(Void), certificate : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_emblem_get_icon(this : Void*) : Pointer(Void)
  fun g_emblem_get_origin(this : Void*) : UInt32
  fun g_emblem_get_type : UInt64
  fun g_emblem_new(icon : Pointer(Void)) : Pointer(Void)
  fun g_emblem_new_with_origin(icon : Pointer(Void), origin : UInt32) : Pointer(Void)
  fun g_emblemed_icon_add_emblem(this : Void*, emblem : Pointer(Void)) : Void
  fun g_emblemed_icon_clear_emblems(this : Void*) : Void
  fun g_emblemed_icon_get_emblems(this : Void*) : Pointer(LibGLib::List)
  fun g_emblemed_icon_get_icon(this : Void*) : Pointer(Void)
  fun g_emblemed_icon_get_type : UInt64
  fun g_emblemed_icon_new(icon : Pointer(Void), emblem : Pointer(Void)) : Pointer(Void)
  fun g_file_append_to(this : Void*, flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_append_to_async(this : Void*, flags : UInt32, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_append_to_finish(this : Void*, res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_attribute_info_list_add(this : Void*, name : Pointer(LibC::Char), type : UInt32, flags : UInt32) : Void
  fun g_file_attribute_info_list_dup(this : Void*) : Pointer(Void)
  fun g_file_attribute_info_list_get_type : UInt64
  fun g_file_attribute_info_list_lookup(this : Void*, name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_file_attribute_info_list_new : Pointer(Void)
  fun g_file_attribute_info_list_ref(this : Void*) : Pointer(Void)
  fun g_file_attribute_info_list_unref(this : Void*) : Void
  fun g_file_attribute_matcher_enumerate_namespace(this : Void*, ns : Pointer(LibC::Char)) : LibC::Int
  fun g_file_attribute_matcher_enumerate_next(this : Void*) : Pointer(LibC::Char)
  fun g_file_attribute_matcher_get_type : UInt64
  fun g_file_attribute_matcher_matches(this : Void*, attribute : Pointer(LibC::Char)) : LibC::Int
  fun g_file_attribute_matcher_matches_only(this : Void*, attribute : Pointer(LibC::Char)) : LibC::Int
  fun g_file_attribute_matcher_new(attributes : Pointer(LibC::Char)) : Pointer(Void)
  fun g_file_attribute_matcher_ref(this : Void*) : Pointer(Void)
  fun g_file_attribute_matcher_subtract(this : Void*, subtract : Pointer(Void)) : Pointer(Void)
  fun g_file_attribute_matcher_to_string(this : Void*) : Pointer(LibC::Char)
  fun g_file_attribute_matcher_unref(this : Void*) : Void
  fun g_file_build_attribute_list_for_copy(this : Void*, flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_file_copy(this : Void*, destination : Pointer(Void), flags : UInt32, cancellable : Pointer(Void), progress_callback : FileProgressCallback, progress_callback_data : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_copy_async(this : Void*, destination : Pointer(Void), flags : UInt32, io_priority : Int32, cancellable : Pointer(Void), progress_callback : FileProgressCallback, progress_callback_data : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_copy_attributes(this : Void*, destination : Pointer(Void), flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_copy_finish(this : Void*, res : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_create(this : Void*, flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_create_async(this : Void*, flags : UInt32, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_create_finish(this : Void*, res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_create_readwrite(this : Void*, flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_create_readwrite_async(this : Void*, flags : UInt32, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_create_readwrite_finish(this : Void*, res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_delete(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_delete_async(this : Void*, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_delete_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_descriptor_based_get_fd(this : Void*) : Int32
  fun g_file_descriptor_based_get_type : UInt64
  fun g_file_dup(this : Void*) : Pointer(Void)
  fun g_file_eject_mountable(this : Void*, flags : UInt32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_eject_mountable_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_eject_mountable_with_operation(this : Void*, flags : UInt32, mount_operation : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_eject_mountable_with_operation_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_enumerate_children(this : Void*, attributes : Pointer(LibC::Char), flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_enumerate_children_async(this : Void*, attributes : Pointer(LibC::Char), flags : UInt32, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_enumerate_children_finish(this : Void*, res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_enumerator_close(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_enumerator_close_async(this : Void*, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_enumerator_close_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_enumerator_get_child(this : Void*, info : Pointer(Void)) : Pointer(Void)
  fun g_file_enumerator_get_container(this : Void*) : Pointer(Void)
  fun g_file_enumerator_get_type : UInt64
  fun g_file_enumerator_has_pending(this : Void*) : LibC::Int
  fun g_file_enumerator_is_closed(this : Void*) : LibC::Int
  fun g_file_enumerator_iterate(this : Void*, out_info : Pointer(Pointer(Void)), out_child : Pointer(Pointer(Void)), cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_enumerator_next_file(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_enumerator_next_files_async(this : Void*, num_files : Int32, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_enumerator_next_files_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(LibGLib::List)
  fun g_file_enumerator_set_pending(this : Void*, pending : LibC::Int) : Void
  fun g_file_equal(this : Void*, file2 : Pointer(Void)) : LibC::Int
  fun g_file_find_enclosing_mount(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_find_enclosing_mount_async(this : Void*, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_find_enclosing_mount_finish(this : Void*, res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_get_basename(this : Void*) : Pointer(LibC::Char)
  fun g_file_get_child(this : Void*, name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_file_get_child_for_display_name(this : Void*, display_name : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_get_parent(this : Void*) : Pointer(Void)
  fun g_file_get_parse_name(this : Void*) : Pointer(LibC::Char)
  fun g_file_get_path(this : Void*) : Pointer(LibC::Char)
  fun g_file_get_relative_path(this : Void*, descendant : Pointer(Void)) : Pointer(LibC::Char)
  fun g_file_get_type : UInt64
  fun g_file_get_uri(this : Void*) : Pointer(LibC::Char)
  fun g_file_get_uri_scheme(this : Void*) : Pointer(LibC::Char)
  fun g_file_has_parent(this : Void*, parent : Pointer(Void)) : LibC::Int
  fun g_file_has_prefix(this : Void*, prefix : Pointer(Void)) : LibC::Int
  fun g_file_has_uri_scheme(this : Void*, uri_scheme : Pointer(LibC::Char)) : LibC::Int
  fun g_file_hash(this : Void*) : UInt32
  fun g_file_icon_get_file(this : Void*) : Pointer(Void)
  fun g_file_icon_get_type : UInt64
  fun g_file_icon_new(file : Pointer(Void)) : Pointer(Void)
  fun g_file_info_clear_status(this : Void*) : Void
  fun g_file_info_copy_into(this : Void*, dest_info : Pointer(Void)) : Void
  fun g_file_info_dup(this : Void*) : Pointer(Void)
  fun g_file_info_get_access_date_time(this : Void*) : Pointer(Void)
  fun g_file_info_get_attribute_as_string(this : Void*, attribute : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_file_info_get_attribute_boolean(this : Void*, attribute : Pointer(LibC::Char)) : LibC::Int
  fun g_file_info_get_attribute_byte_string(this : Void*, attribute : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_file_info_get_attribute_data(this : Void*, attribute : Pointer(LibC::Char), type : Pointer(UInt32), value_pp : Pointer(Pointer(Void)), status : Pointer(UInt32)) : LibC::Int
  fun g_file_info_get_attribute_int32(this : Void*, attribute : Pointer(LibC::Char)) : Int32
  fun g_file_info_get_attribute_int64(this : Void*, attribute : Pointer(LibC::Char)) : Int64
  fun g_file_info_get_attribute_object(this : Void*, attribute : Pointer(LibC::Char)) : Pointer(Void)
  fun g_file_info_get_attribute_status(this : Void*, attribute : Pointer(LibC::Char)) : UInt32
  fun g_file_info_get_attribute_string(this : Void*, attribute : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_file_info_get_attribute_stringv(this : Void*, attribute : Pointer(LibC::Char)) : Pointer(Pointer(LibC::Char))
  fun g_file_info_get_attribute_type(this : Void*, attribute : Pointer(LibC::Char)) : UInt32
  fun g_file_info_get_attribute_uint32(this : Void*, attribute : Pointer(LibC::Char)) : UInt32
  fun g_file_info_get_attribute_uint64(this : Void*, attribute : Pointer(LibC::Char)) : UInt64
  fun g_file_info_get_content_type(this : Void*) : Pointer(LibC::Char)
  fun g_file_info_get_creation_date_time(this : Void*) : Pointer(Void)
  fun g_file_info_get_deletion_date(this : Void*) : Pointer(Void)
  fun g_file_info_get_display_name(this : Void*) : Pointer(LibC::Char)
  fun g_file_info_get_edit_name(this : Void*) : Pointer(LibC::Char)
  fun g_file_info_get_etag(this : Void*) : Pointer(LibC::Char)
  fun g_file_info_get_file_type(this : Void*) : UInt32
  fun g_file_info_get_icon(this : Void*) : Pointer(Void)
  fun g_file_info_get_is_backup(this : Void*) : LibC::Int
  fun g_file_info_get_is_hidden(this : Void*) : LibC::Int
  fun g_file_info_get_is_symlink(this : Void*) : LibC::Int
  fun g_file_info_get_modification_date_time(this : Void*) : Pointer(Void)
  fun g_file_info_get_modification_time(this : Void*, result : Pointer(Void)) : Void
  fun g_file_info_get_name(this : Void*) : Pointer(LibC::Char)
  fun g_file_info_get_size(this : Void*) : Int64
  fun g_file_info_get_sort_order(this : Void*) : Int32
  fun g_file_info_get_symbolic_icon(this : Void*) : Pointer(Void)
  fun g_file_info_get_symlink_target(this : Void*) : Pointer(LibC::Char)
  fun g_file_info_get_type : UInt64
  fun g_file_info_has_attribute(this : Void*, attribute : Pointer(LibC::Char)) : LibC::Int
  fun g_file_info_has_namespace(this : Void*, name_space : Pointer(LibC::Char)) : LibC::Int
  fun g_file_info_list_attributes(this : Void*, name_space : Pointer(LibC::Char)) : Pointer(Pointer(LibC::Char))
  fun g_file_info_new : Pointer(Void)
  fun g_file_info_remove_attribute(this : Void*, attribute : Pointer(LibC::Char)) : Void
  fun g_file_info_set_access_date_time(this : Void*, atime : Pointer(Void)) : Void
  fun g_file_info_set_attribute(this : Void*, attribute : Pointer(LibC::Char), type : UInt32, value_p : Pointer(Void)) : Void
  fun g_file_info_set_attribute_boolean(this : Void*, attribute : Pointer(LibC::Char), attr_value : LibC::Int) : Void
  fun g_file_info_set_attribute_byte_string(this : Void*, attribute : Pointer(LibC::Char), attr_value : Pointer(LibC::Char)) : Void
  fun g_file_info_set_attribute_int32(this : Void*, attribute : Pointer(LibC::Char), attr_value : Int32) : Void
  fun g_file_info_set_attribute_int64(this : Void*, attribute : Pointer(LibC::Char), attr_value : Int64) : Void
  fun g_file_info_set_attribute_mask(this : Void*, mask : Pointer(Void)) : Void
  fun g_file_info_set_attribute_object(this : Void*, attribute : Pointer(LibC::Char), attr_value : Pointer(Void)) : Void
  fun g_file_info_set_attribute_status(this : Void*, attribute : Pointer(LibC::Char), status : UInt32) : LibC::Int
  fun g_file_info_set_attribute_string(this : Void*, attribute : Pointer(LibC::Char), attr_value : Pointer(LibC::Char)) : Void
  fun g_file_info_set_attribute_stringv(this : Void*, attribute : Pointer(LibC::Char), attr_value : Pointer(Pointer(LibC::Char))) : Void
  fun g_file_info_set_attribute_uint32(this : Void*, attribute : Pointer(LibC::Char), attr_value : UInt32) : Void
  fun g_file_info_set_attribute_uint64(this : Void*, attribute : Pointer(LibC::Char), attr_value : UInt64) : Void
  fun g_file_info_set_content_type(this : Void*, content_type : Pointer(LibC::Char)) : Void
  fun g_file_info_set_creation_date_time(this : Void*, creation_time : Pointer(Void)) : Void
  fun g_file_info_set_display_name(this : Void*, display_name : Pointer(LibC::Char)) : Void
  fun g_file_info_set_edit_name(this : Void*, edit_name : Pointer(LibC::Char)) : Void
  fun g_file_info_set_file_type(this : Void*, type : UInt32) : Void
  fun g_file_info_set_icon(this : Void*, icon : Pointer(Void)) : Void
  fun g_file_info_set_is_hidden(this : Void*, is_hidden : LibC::Int) : Void
  fun g_file_info_set_is_symlink(this : Void*, is_symlink : LibC::Int) : Void
  fun g_file_info_set_modification_date_time(this : Void*, mtime : Pointer(Void)) : Void
  fun g_file_info_set_modification_time(this : Void*, mtime : Pointer(Void)) : Void
  fun g_file_info_set_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun g_file_info_set_size(this : Void*, size : Int64) : Void
  fun g_file_info_set_sort_order(this : Void*, sort_order : Int32) : Void
  fun g_file_info_set_symbolic_icon(this : Void*, icon : Pointer(Void)) : Void
  fun g_file_info_set_symlink_target(this : Void*, symlink_target : Pointer(LibC::Char)) : Void
  fun g_file_info_unset_attribute_mask(this : Void*) : Void
  fun g_file_input_stream_get_type : UInt64
  fun g_file_input_stream_query_info(this : Void*, attributes : Pointer(LibC::Char), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_input_stream_query_info_async(this : Void*, attributes : Pointer(LibC::Char), io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_input_stream_query_info_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_io_stream_get_etag(this : Void*) : Pointer(LibC::Char)
  fun g_file_io_stream_get_type : UInt64
  fun g_file_io_stream_query_info(this : Void*, attributes : Pointer(LibC::Char), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_io_stream_query_info_async(this : Void*, attributes : Pointer(LibC::Char), io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_io_stream_query_info_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_is_native(this : Void*) : LibC::Int
  fun g_file_load_bytes(this : Void*, cancellable : Pointer(Void), etag_out : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_load_bytes_async(this : Void*, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_load_bytes_finish(this : Void*, result : Pointer(Void), etag_out : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_load_contents(this : Void*, cancellable : Pointer(Void), contents : Pointer(Pointer(UInt8)), length : Pointer(UInt64), etag_out : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : LibC::Int
  fun g_file_load_contents_async(this : Void*, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_load_contents_finish(this : Void*, res : Pointer(Void), contents : Pointer(Pointer(UInt8)), length : Pointer(UInt64), etag_out : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : LibC::Int
  fun g_file_load_partial_contents_finish(this : Void*, res : Pointer(Void), contents : Pointer(Pointer(UInt8)), length : Pointer(UInt64), etag_out : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : LibC::Int
  fun g_file_make_directory(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_make_directory_async(this : Void*, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_make_directory_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_make_directory_with_parents(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_make_symbolic_link(this : Void*, symlink_value : Pointer(LibC::Char), cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_measure_disk_usage_finish(this : Void*, result : Pointer(Void), disk_usage : Pointer(UInt64), num_dirs : Pointer(UInt64), num_files : Pointer(UInt64), error : LibGLib::Error**) : LibC::Int
  fun g_file_monitor(this : Void*, flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_monitor_cancel(this : Void*) : LibC::Int
  fun g_file_monitor_directory(this : Void*, flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_monitor_emit_event(this : Void*, child : Pointer(Void), other_file : Pointer(Void), event_type : UInt32) : Void
  fun g_file_monitor_file(this : Void*, flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_monitor_get_type : UInt64
  fun g_file_monitor_is_cancelled(this : Void*) : LibC::Int
  fun g_file_monitor_set_rate_limit(this : Void*, limit_msecs : Int32) : Void
  fun g_file_mount_enclosing_volume(this : Void*, flags : UInt32, mount_operation : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_mount_enclosing_volume_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_mount_mountable(this : Void*, flags : UInt32, mount_operation : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_mount_mountable_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_move(this : Void*, destination : Pointer(Void), flags : UInt32, cancellable : Pointer(Void), progress_callback : FileProgressCallback, progress_callback_data : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_new_for_commandline_arg(arg : Pointer(LibC::Char)) : Pointer(Void)
  fun g_file_new_for_commandline_arg(arg : Pointer(LibC::Char)) : Pointer(Void)
  fun g_file_new_for_commandline_arg_and_cwd(arg : Pointer(LibC::Char), cwd : Pointer(LibC::Char)) : Pointer(Void)
  fun g_file_new_for_commandline_arg_and_cwd(arg : Pointer(LibC::Char), cwd : Pointer(LibC::Char)) : Pointer(Void)
  fun g_file_new_for_path(path : Pointer(LibC::Char)) : Pointer(Void)
  fun g_file_new_for_path(path : Pointer(LibC::Char)) : Pointer(Void)
  fun g_file_new_for_uri(uri : Pointer(LibC::Char)) : Pointer(Void)
  fun g_file_new_for_uri(uri : Pointer(LibC::Char)) : Pointer(Void)
  fun g_file_new_tmp(tmpl : Pointer(LibC::Char), iostream : Pointer(Pointer(Void)), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_new_tmp(tmpl : Pointer(LibC::Char), iostream : Pointer(Pointer(Void)), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_open_readwrite(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_open_readwrite_async(this : Void*, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_open_readwrite_finish(this : Void*, res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_output_stream_get_etag(this : Void*) : Pointer(LibC::Char)
  fun g_file_output_stream_get_type : UInt64
  fun g_file_output_stream_query_info(this : Void*, attributes : Pointer(LibC::Char), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_output_stream_query_info_async(this : Void*, attributes : Pointer(LibC::Char), io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_output_stream_query_info_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_parse_name(parse_name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_file_parse_name(parse_name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_file_peek_path(this : Void*) : Pointer(LibC::Char)
  fun g_file_poll_mountable(this : Void*, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_poll_mountable_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_query_default_handler(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_query_default_handler_async(this : Void*, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_query_default_handler_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_query_exists(this : Void*, cancellable : Pointer(Void)) : LibC::Int
  fun g_file_query_file_type(this : Void*, flags : UInt32, cancellable : Pointer(Void)) : UInt32
  fun g_file_query_filesystem_info(this : Void*, attributes : Pointer(LibC::Char), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_query_filesystem_info_async(this : Void*, attributes : Pointer(LibC::Char), io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_query_filesystem_info_finish(this : Void*, res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_query_info(this : Void*, attributes : Pointer(LibC::Char), flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_query_info_async(this : Void*, attributes : Pointer(LibC::Char), flags : UInt32, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_query_info_finish(this : Void*, res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_query_settable_attributes(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_query_writable_namespaces(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_read(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_read_async(this : Void*, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_read_finish(this : Void*, res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_replace(this : Void*, etag : Pointer(LibC::Char), make_backup : LibC::Int, flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_replace_async(this : Void*, etag : Pointer(LibC::Char), make_backup : LibC::Int, flags : UInt32, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_replace_contents(this : Void*, contents : Pointer(UInt8), length : UInt64, etag : Pointer(LibC::Char), make_backup : LibC::Int, flags : UInt32, new_etag : Pointer(Pointer(LibC::Char)), cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_replace_contents_async(this : Void*, contents : Pointer(UInt8), length : UInt64, etag : Pointer(LibC::Char), make_backup : LibC::Int, flags : UInt32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_replace_contents_bytes_async(this : Void*, contents : Pointer(Void), etag : Pointer(LibC::Char), make_backup : LibC::Int, flags : UInt32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_replace_contents_finish(this : Void*, res : Pointer(Void), new_etag : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : LibC::Int
  fun g_file_replace_finish(this : Void*, res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_replace_readwrite(this : Void*, etag : Pointer(LibC::Char), make_backup : LibC::Int, flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_replace_readwrite_async(this : Void*, etag : Pointer(LibC::Char), make_backup : LibC::Int, flags : UInt32, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_replace_readwrite_finish(this : Void*, res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_resolve_relative_path(this : Void*, relative_path : Pointer(LibC::Char)) : Pointer(Void)
  fun g_file_set_attribute(this : Void*, attribute : Pointer(LibC::Char), type : UInt32, value_p : Pointer(Void), flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_set_attribute_byte_string(this : Void*, attribute : Pointer(LibC::Char), value : Pointer(LibC::Char), flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_set_attribute_int32(this : Void*, attribute : Pointer(LibC::Char), value : Int32, flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_set_attribute_int64(this : Void*, attribute : Pointer(LibC::Char), value : Int64, flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_set_attribute_string(this : Void*, attribute : Pointer(LibC::Char), value : Pointer(LibC::Char), flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_set_attribute_uint32(this : Void*, attribute : Pointer(LibC::Char), value : UInt32, flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_set_attribute_uint64(this : Void*, attribute : Pointer(LibC::Char), value : UInt64, flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_set_attributes_async(this : Void*, info : Pointer(Void), flags : UInt32, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_set_attributes_finish(this : Void*, result : Pointer(Void), info : Pointer(Pointer(Void)), error : LibGLib::Error**) : LibC::Int
  fun g_file_set_attributes_from_info(this : Void*, info : Pointer(Void), flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_set_display_name(this : Void*, display_name : Pointer(LibC::Char), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_set_display_name_async(this : Void*, display_name : Pointer(LibC::Char), io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_set_display_name_finish(this : Void*, res : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_file_start_mountable(this : Void*, flags : UInt32, start_operation : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_start_mountable_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_stop_mountable(this : Void*, flags : UInt32, mount_operation : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_stop_mountable_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_supports_thread_contexts(this : Void*) : LibC::Int
  fun g_file_trash(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_trash_async(this : Void*, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_trash_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_unmount_mountable(this : Void*, flags : UInt32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_unmount_mountable_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_file_unmount_mountable_with_operation(this : Void*, flags : UInt32, mount_operation : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_file_unmount_mountable_with_operation_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_filename_completer_get_completion_suffix(this : Void*, initial_text : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_filename_completer_get_completions(this : Void*, initial_text : Pointer(LibC::Char)) : Pointer(Pointer(LibC::Char))
  fun g_filename_completer_get_type : UInt64
  fun g_filename_completer_new : Pointer(Void)
  fun g_filename_completer_set_dirs_only(this : Void*, dirs_only : LibC::Int) : Void
  fun g_filter_input_stream_get_base_stream(this : Void*) : Pointer(Void)
  fun g_filter_input_stream_get_close_base_stream(this : Void*) : LibC::Int
  fun g_filter_input_stream_get_type : UInt64
  fun g_filter_input_stream_set_close_base_stream(this : Void*, close_base : LibC::Int) : Void
  fun g_filter_output_stream_get_base_stream(this : Void*) : Pointer(Void)
  fun g_filter_output_stream_get_close_base_stream(this : Void*) : LibC::Int
  fun g_filter_output_stream_get_type : UInt64
  fun g_filter_output_stream_set_close_base_stream(this : Void*, close_base : LibC::Int) : Void
  fun g_icon_deserialize(value : Pointer(Void)) : Pointer(Void)
  fun g_icon_deserialize(value : Pointer(Void)) : Pointer(Void)
  fun g_icon_equal(this : Void*, icon2 : Pointer(Void)) : LibC::Int
  fun g_icon_get_type : UInt64
  fun g_icon_hash(icon : Pointer(Void)) : UInt32
  fun g_icon_hash(icon : Pointer(Void)) : UInt32
  fun g_icon_new_for_string(str : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_icon_new_for_string(str : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_icon_serialize(this : Void*) : Pointer(Void)
  fun g_icon_to_string(this : Void*) : Pointer(LibC::Char)
  fun g_inet_address_equal(this : Void*, other_address : Pointer(Void)) : LibC::Int
  fun g_inet_address_get_family(this : Void*) : UInt32
  fun g_inet_address_get_is_any(this : Void*) : LibC::Int
  fun g_inet_address_get_is_link_local(this : Void*) : LibC::Int
  fun g_inet_address_get_is_loopback(this : Void*) : LibC::Int
  fun g_inet_address_get_is_mc_global(this : Void*) : LibC::Int
  fun g_inet_address_get_is_mc_link_local(this : Void*) : LibC::Int
  fun g_inet_address_get_is_mc_node_local(this : Void*) : LibC::Int
  fun g_inet_address_get_is_mc_org_local(this : Void*) : LibC::Int
  fun g_inet_address_get_is_mc_site_local(this : Void*) : LibC::Int
  fun g_inet_address_get_is_multicast(this : Void*) : LibC::Int
  fun g_inet_address_get_is_site_local(this : Void*) : LibC::Int
  fun g_inet_address_get_native_size(this : Void*) : UInt64
  fun g_inet_address_get_type : UInt64
  fun g_inet_address_mask_equal(this : Void*, mask2 : Pointer(Void)) : LibC::Int
  fun g_inet_address_mask_get_address(this : Void*) : Pointer(Void)
  fun g_inet_address_mask_get_family(this : Void*) : UInt32
  fun g_inet_address_mask_get_length(this : Void*) : UInt32
  fun g_inet_address_mask_get_type : UInt64
  fun g_inet_address_mask_matches(this : Void*, address : Pointer(Void)) : LibC::Int
  fun g_inet_address_mask_new(addr : Pointer(Void), length : UInt32, error : LibGLib::Error**) : Pointer(Void)
  fun g_inet_address_mask_new_from_string(mask_string : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_inet_address_mask_to_string(this : Void*) : Pointer(LibC::Char)
  fun g_inet_address_new_any(family : UInt32) : Pointer(Void)
  fun g_inet_address_new_from_bytes(bytes : Pointer(UInt8), family : UInt32) : Pointer(Void)
  fun g_inet_address_new_from_string(string : Pointer(LibC::Char)) : Pointer(Void)
  fun g_inet_address_new_loopback(family : UInt32) : Pointer(Void)
  fun g_inet_address_to_string(this : Void*) : Pointer(LibC::Char)
  fun g_inet_socket_address_get_address(this : Void*) : Pointer(Void)
  fun g_inet_socket_address_get_flowinfo(this : Void*) : UInt32
  fun g_inet_socket_address_get_port(this : Void*) : UInt16
  fun g_inet_socket_address_get_scope_id(this : Void*) : UInt32
  fun g_inet_socket_address_get_type : UInt64
  fun g_inet_socket_address_new(address : Pointer(Void), port : UInt16) : Pointer(Void)
  fun g_inet_socket_address_new_from_string(address : Pointer(LibC::Char), port : UInt32) : Pointer(Void)
  fun g_initable_get_type : UInt64
  fun g_initable_init(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_initable_newv(object_type : UInt64, n_parameters : UInt32, parameters : Pointer(Void), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_initable_newv(object_type : UInt64, n_parameters : UInt32, parameters : Pointer(Void), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_input_stream_clear_pending(this : Void*) : Void
  fun g_input_stream_close(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_input_stream_close_async(this : Void*, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_input_stream_close_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_input_stream_get_type : UInt64
  fun g_input_stream_has_pending(this : Void*) : LibC::Int
  fun g_input_stream_is_closed(this : Void*) : LibC::Int
  fun g_input_stream_read(this : Void*, buffer : Pointer(Pointer(UInt8)), count : UInt64, cancellable : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_input_stream_read_all(this : Void*, buffer : Pointer(Pointer(UInt8)), count : UInt64, bytes_read : Pointer(UInt64), cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_input_stream_read_all_async(this : Void*, buffer : Pointer(Pointer(UInt8)), count : UInt64, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_input_stream_read_all_finish(this : Void*, result : Pointer(Void), bytes_read : Pointer(UInt64), error : LibGLib::Error**) : LibC::Int
  fun g_input_stream_read_async(this : Void*, buffer : Pointer(Pointer(UInt8)), count : UInt64, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_input_stream_read_bytes(this : Void*, count : UInt64, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_input_stream_read_bytes_async(this : Void*, count : UInt64, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_input_stream_read_bytes_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_input_stream_read_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_input_stream_set_pending(this : Void*, error : LibGLib::Error**) : LibC::Int
  fun g_input_stream_skip(this : Void*, count : UInt64, cancellable : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_input_stream_skip_async(this : Void*, count : UInt64, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_input_stream_skip_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_io_error_from_errno(err_no : Int32) : UInt32
  fun g_io_error_quark : UInt32
  fun g_io_extension_get_name(this : Void*) : Pointer(LibC::Char)
  fun g_io_extension_get_priority(this : Void*) : Int32
  fun g_io_extension_get_type(this : Void*) : UInt64
  fun g_io_extension_point_get_extension_by_name(this : Void*, name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_io_extension_point_get_extensions(this : Void*) : Pointer(LibGLib::List)
  fun g_io_extension_point_get_required_type(this : Void*) : UInt64
  fun g_io_extension_point_implement(extension_point_name : Pointer(LibC::Char), type : UInt64, extension_name : Pointer(LibC::Char), priority : Int32) : Pointer(Void)
  fun g_io_extension_point_implement(extension_point_name : Pointer(LibC::Char), type : UInt64, extension_name : Pointer(LibC::Char), priority : Int32) : Pointer(Void)
  fun g_io_extension_point_lookup(name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_io_extension_point_lookup(name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_io_extension_point_register(name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_io_extension_point_register(name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_io_extension_point_set_required_type(this : Void*, type : UInt64) : Void
  fun g_io_module_get_type : UInt64
  fun g_io_module_load(this : Void*) : Void
  fun g_io_module_new(filename : Pointer(LibC::Char)) : Pointer(Void)
  fun g_io_module_query : Pointer(Pointer(LibC::Char))
  fun g_io_module_scope_block(this : Void*, basename : Pointer(LibC::Char)) : Void
  fun g_io_module_scope_free(this : Void*) : Void
  fun g_io_module_unload(this : Void*) : Void
  fun g_io_modules_load_all_in_directory(dirname : Pointer(LibC::Char)) : Pointer(LibGLib::List)
  fun g_io_modules_load_all_in_directory_with_scope(dirname : Pointer(LibC::Char), scope : Pointer(Void)) : Pointer(LibGLib::List)
  fun g_io_modules_scan_all_in_directory(dirname : Pointer(LibC::Char)) : Void
  fun g_io_modules_scan_all_in_directory_with_scope(dirname : Pointer(LibC::Char), scope : Pointer(Void)) : Void
  fun g_io_scheduler_cancel_all_jobs : Void
  fun g_io_scheduler_job_send_to_mainloop(this : Void*, func : LibGLib::SourceFunc, user_data : Pointer(Void), notify : LibGLib::DestroyNotify) : LibC::Int
  fun g_io_scheduler_job_send_to_mainloop_async(this : Void*, func : LibGLib::SourceFunc, user_data : Pointer(Void), notify : LibGLib::DestroyNotify) : Void
  fun g_io_scheduler_push_job(job_func : IOSchedulerJobFunc, user_data : Pointer(Void), notify : LibGLib::DestroyNotify, io_priority : Int32, cancellable : Pointer(Void)) : Void
  fun g_io_stream_clear_pending(this : Void*) : Void
  fun g_io_stream_close(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_io_stream_close_async(this : Void*, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_io_stream_close_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_io_stream_get_input_stream(this : Void*) : Pointer(Void)
  fun g_io_stream_get_output_stream(this : Void*) : Pointer(Void)
  fun g_io_stream_get_type : UInt64
  fun g_io_stream_has_pending(this : Void*) : LibC::Int
  fun g_io_stream_is_closed(this : Void*) : LibC::Int
  fun g_io_stream_set_pending(this : Void*, error : LibGLib::Error**) : LibC::Int
  fun g_io_stream_splice_async(this : Void*, stream2 : Pointer(Void), flags : UInt32, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_io_stream_splice_finish(result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_keyfile_settings_backend_new(filename : Pointer(LibC::Char), root_path : Pointer(LibC::Char), root_group : Pointer(LibC::Char)) : Pointer(Void)
  fun g_list_model_get_item_type(this : Void*) : UInt64
  fun g_list_model_get_n_items(this : Void*) : UInt32
  fun g_list_model_get_object(this : Void*, position : UInt32) : Pointer(Void)
  fun g_list_model_get_type : UInt64
  fun g_list_model_items_changed(this : Void*, position : UInt32, removed : UInt32, added : UInt32) : Void
  fun g_list_store_append(this : Void*, item : Pointer(Void)) : Void
  fun g_list_store_find(this : Void*, item : Pointer(Void), position : Pointer(UInt32)) : LibC::Int
  fun g_list_store_find_with_equal_func(this : Void*, item : Pointer(Void), equal_func : LibGLib::EqualFunc, position : Pointer(UInt32)) : LibC::Int
  fun g_list_store_get_type : UInt64
  fun g_list_store_insert(this : Void*, position : UInt32, item : Pointer(Void)) : Void
  fun g_list_store_insert_sorted(this : Void*, item : Pointer(Void), compare_func : LibGLib::CompareDataFunc, user_data : Pointer(Void)) : UInt32
  fun g_list_store_new(item_type : UInt64) : Pointer(Void)
  fun g_list_store_remove(this : Void*, position : UInt32) : Void
  fun g_list_store_remove_all(this : Void*) : Void
  fun g_list_store_sort(this : Void*, compare_func : LibGLib::CompareDataFunc, user_data : Pointer(Void)) : Void
  fun g_list_store_splice(this : Void*, position : UInt32, n_removals : UInt32, additions : Pointer(Void), n_additions : UInt32) : Void
  fun g_loadable_icon_get_type : UInt64
  fun g_loadable_icon_load(this : Void*, size : Int32, type : Pointer(Pointer(LibC::Char)), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_loadable_icon_load_async(this : Void*, size : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_loadable_icon_load_finish(this : Void*, res : Pointer(Void), type : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : Pointer(Void)
  fun g_memory_input_stream_add_bytes(this : Void*, bytes : Pointer(Void)) : Void
  fun g_memory_input_stream_add_data(this : Void*, data : Pointer(UInt8), len : Int64, destroy : LibGLib::DestroyNotify) : Void
  fun g_memory_input_stream_get_type : UInt64
  fun g_memory_input_stream_new : Pointer(Void)
  fun g_memory_input_stream_new_from_bytes(bytes : Pointer(Void)) : Pointer(Void)
  fun g_memory_input_stream_new_from_data(data : Pointer(UInt8), len : Int64, destroy : LibGLib::DestroyNotify) : Pointer(Void)
  fun g_memory_monitor_dup_default : Pointer(Void)
  fun g_memory_monitor_dup_default : Pointer(Void)
  fun g_memory_monitor_get_type : UInt64
  fun g_memory_output_stream_get_data(this : Void*) : Pointer(Void)
  fun g_memory_output_stream_get_data_size(this : Void*) : UInt64
  fun g_memory_output_stream_get_size(this : Void*) : UInt64
  fun g_memory_output_stream_get_type : UInt64
  fun g_memory_output_stream_new_resizable : Pointer(Void)
  fun g_memory_output_stream_steal_as_bytes(this : Void*) : Pointer(Void)
  fun g_memory_output_stream_steal_data(this : Void*) : Pointer(Void)
  fun g_memory_settings_backend_new : Pointer(Void)
  fun g_menu_append(this : Void*, label : Pointer(LibC::Char), detailed_action : Pointer(LibC::Char)) : Void
  fun g_menu_append_item(this : Void*, item : Pointer(Void)) : Void
  fun g_menu_append_section(this : Void*, label : Pointer(LibC::Char), section : Pointer(Void)) : Void
  fun g_menu_append_submenu(this : Void*, label : Pointer(LibC::Char), submenu : Pointer(Void)) : Void
  fun g_menu_attribute_iter_get_name(this : Void*) : Pointer(LibC::Char)
  fun g_menu_attribute_iter_get_next(this : Void*, out_name : Pointer(Pointer(LibC::Char)), value : Pointer(Pointer(Void))) : LibC::Int
  fun g_menu_attribute_iter_get_type : UInt64
  fun g_menu_attribute_iter_get_value(this : Void*) : Pointer(Void)
  fun g_menu_attribute_iter_next(this : Void*) : LibC::Int
  fun g_menu_freeze(this : Void*) : Void
  fun g_menu_get_type : UInt64
  fun g_menu_insert(this : Void*, position : Int32, label : Pointer(LibC::Char), detailed_action : Pointer(LibC::Char)) : Void
  fun g_menu_insert_item(this : Void*, position : Int32, item : Pointer(Void)) : Void
  fun g_menu_insert_section(this : Void*, position : Int32, label : Pointer(LibC::Char), section : Pointer(Void)) : Void
  fun g_menu_insert_submenu(this : Void*, position : Int32, label : Pointer(LibC::Char), submenu : Pointer(Void)) : Void
  fun g_menu_item_get_attribute_value(this : Void*, attribute : Pointer(LibC::Char), expected_type : Pointer(Void)) : Pointer(Void)
  fun g_menu_item_get_link(this : Void*, link : Pointer(LibC::Char)) : Pointer(Void)
  fun g_menu_item_get_type : UInt64
  fun g_menu_item_new(label : Pointer(LibC::Char), detailed_action : Pointer(LibC::Char)) : Pointer(Void)
  fun g_menu_item_new_from_model(model : Pointer(Void), item_index : Int32) : Pointer(Void)
  fun g_menu_item_new_section(label : Pointer(LibC::Char), section : Pointer(Void)) : Pointer(Void)
  fun g_menu_item_new_submenu(label : Pointer(LibC::Char), submenu : Pointer(Void)) : Pointer(Void)
  fun g_menu_item_set_action_and_target_value(this : Void*, action : Pointer(LibC::Char), target_value : Pointer(Void)) : Void
  fun g_menu_item_set_attribute_value(this : Void*, attribute : Pointer(LibC::Char), value : Pointer(Void)) : Void
  fun g_menu_item_set_detailed_action(this : Void*, detailed_action : Pointer(LibC::Char)) : Void
  fun g_menu_item_set_icon(this : Void*, icon : Pointer(Void)) : Void
  fun g_menu_item_set_label(this : Void*, label : Pointer(LibC::Char)) : Void
  fun g_menu_item_set_link(this : Void*, link : Pointer(LibC::Char), model : Pointer(Void)) : Void
  fun g_menu_item_set_section(this : Void*, section : Pointer(Void)) : Void
  fun g_menu_item_set_submenu(this : Void*, submenu : Pointer(Void)) : Void
  fun g_menu_link_iter_get_name(this : Void*) : Pointer(LibC::Char)
  fun g_menu_link_iter_get_next(this : Void*, out_link : Pointer(Pointer(LibC::Char)), value : Pointer(Pointer(Void))) : LibC::Int
  fun g_menu_link_iter_get_type : UInt64
  fun g_menu_link_iter_get_value(this : Void*) : Pointer(Void)
  fun g_menu_link_iter_next(this : Void*) : LibC::Int
  fun g_menu_model_get_item_attribute_value(this : Void*, item_index : Int32, attribute : Pointer(LibC::Char), expected_type : Pointer(Void)) : Pointer(Void)
  fun g_menu_model_get_item_link(this : Void*, item_index : Int32, link : Pointer(LibC::Char)) : Pointer(Void)
  fun g_menu_model_get_n_items(this : Void*) : Int32
  fun g_menu_model_get_type : UInt64
  fun g_menu_model_is_mutable(this : Void*) : LibC::Int
  fun g_menu_model_items_changed(this : Void*, position : Int32, removed : Int32, added : Int32) : Void
  fun g_menu_model_iterate_item_attributes(this : Void*, item_index : Int32) : Pointer(Void)
  fun g_menu_model_iterate_item_links(this : Void*, item_index : Int32) : Pointer(Void)
  fun g_menu_new : Pointer(Void)
  fun g_menu_prepend(this : Void*, label : Pointer(LibC::Char), detailed_action : Pointer(LibC::Char)) : Void
  fun g_menu_prepend_item(this : Void*, item : Pointer(Void)) : Void
  fun g_menu_prepend_section(this : Void*, label : Pointer(LibC::Char), section : Pointer(Void)) : Void
  fun g_menu_prepend_submenu(this : Void*, label : Pointer(LibC::Char), submenu : Pointer(Void)) : Void
  fun g_menu_remove(this : Void*, position : Int32) : Void
  fun g_menu_remove_all(this : Void*) : Void
  fun g_mount_can_eject(this : Void*) : LibC::Int
  fun g_mount_can_unmount(this : Void*) : LibC::Int
  fun g_mount_eject(this : Void*, flags : UInt32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_mount_eject_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_mount_eject_with_operation(this : Void*, flags : UInt32, mount_operation : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_mount_eject_with_operation_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_mount_get_default_location(this : Void*) : Pointer(Void)
  fun g_mount_get_drive(this : Void*) : Pointer(Void)
  fun g_mount_get_icon(this : Void*) : Pointer(Void)
  fun g_mount_get_name(this : Void*) : Pointer(LibC::Char)
  fun g_mount_get_root(this : Void*) : Pointer(Void)
  fun g_mount_get_sort_key(this : Void*) : Pointer(LibC::Char)
  fun g_mount_get_symbolic_icon(this : Void*) : Pointer(Void)
  fun g_mount_get_type : UInt64
  fun g_mount_get_uuid(this : Void*) : Pointer(LibC::Char)
  fun g_mount_get_volume(this : Void*) : Pointer(Void)
  fun g_mount_guess_content_type(this : Void*, force_rescan : LibC::Int, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_mount_guess_content_type_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(Pointer(LibC::Char))
  fun g_mount_guess_content_type_sync(this : Void*, force_rescan : LibC::Int, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Pointer(LibC::Char))
  fun g_mount_is_shadowed(this : Void*) : LibC::Int
  fun g_mount_operation_get_anonymous(this : Void*) : LibC::Int
  fun g_mount_operation_get_choice(this : Void*) : Int32
  fun g_mount_operation_get_domain(this : Void*) : Pointer(LibC::Char)
  fun g_mount_operation_get_is_tcrypt_hidden_volume(this : Void*) : LibC::Int
  fun g_mount_operation_get_is_tcrypt_system_volume(this : Void*) : LibC::Int
  fun g_mount_operation_get_password(this : Void*) : Pointer(LibC::Char)
  fun g_mount_operation_get_password_save(this : Void*) : UInt32
  fun g_mount_operation_get_pim(this : Void*) : UInt32
  fun g_mount_operation_get_type : UInt64
  fun g_mount_operation_get_username(this : Void*) : Pointer(LibC::Char)
  fun g_mount_operation_new : Pointer(Void)
  fun g_mount_operation_reply(this : Void*, result : UInt32) : Void
  fun g_mount_operation_set_anonymous(this : Void*, anonymous : LibC::Int) : Void
  fun g_mount_operation_set_choice(this : Void*, choice : Int32) : Void
  fun g_mount_operation_set_domain(this : Void*, domain : Pointer(LibC::Char)) : Void
  fun g_mount_operation_set_is_tcrypt_hidden_volume(this : Void*, hidden_volume : LibC::Int) : Void
  fun g_mount_operation_set_is_tcrypt_system_volume(this : Void*, system_volume : LibC::Int) : Void
  fun g_mount_operation_set_password(this : Void*, password : Pointer(LibC::Char)) : Void
  fun g_mount_operation_set_password_save(this : Void*, save : UInt32) : Void
  fun g_mount_operation_set_pim(this : Void*, pim : UInt32) : Void
  fun g_mount_operation_set_username(this : Void*, username : Pointer(LibC::Char)) : Void
  fun g_mount_remount(this : Void*, flags : UInt32, mount_operation : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_mount_remount_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_mount_shadow(this : Void*) : Void
  fun g_mount_unmount(this : Void*, flags : UInt32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_mount_unmount_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_mount_unmount_with_operation(this : Void*, flags : UInt32, mount_operation : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_mount_unmount_with_operation_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_mount_unshadow(this : Void*) : Void
  fun g_native_socket_address_get_type : UInt64
  fun g_native_socket_address_new(native : Pointer(Void), len : UInt64) : Pointer(Void)
  fun g_native_volume_monitor_get_type : UInt64
  fun g_network_address_get_hostname(this : Void*) : Pointer(LibC::Char)
  fun g_network_address_get_port(this : Void*) : UInt16
  fun g_network_address_get_scheme(this : Void*) : Pointer(LibC::Char)
  fun g_network_address_get_type : UInt64
  fun g_network_address_new(hostname : Pointer(LibC::Char), port : UInt16) : Pointer(Void)
  fun g_network_address_new_loopback(port : UInt16) : Pointer(Void)
  fun g_network_address_parse(host_and_port : Pointer(LibC::Char), default_port : UInt16, error : LibGLib::Error**) : Pointer(Void)
  fun g_network_address_parse_uri(uri : Pointer(LibC::Char), default_port : UInt16, error : LibGLib::Error**) : Pointer(Void)
  fun g_network_monitor_can_reach(this : Void*, connectable : Pointer(Void), cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_network_monitor_can_reach_async(this : Void*, connectable : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_network_monitor_can_reach_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_network_monitor_get_connectivity(this : Void*) : UInt32
  fun g_network_monitor_get_default : Pointer(Void)
  fun g_network_monitor_get_default : Pointer(Void)
  fun g_network_monitor_get_network_available(this : Void*) : LibC::Int
  fun g_network_monitor_get_network_metered(this : Void*) : LibC::Int
  fun g_network_monitor_get_type : UInt64
  fun g_network_service_get_domain(this : Void*) : Pointer(LibC::Char)
  fun g_network_service_get_protocol(this : Void*) : Pointer(LibC::Char)
  fun g_network_service_get_scheme(this : Void*) : Pointer(LibC::Char)
  fun g_network_service_get_service(this : Void*) : Pointer(LibC::Char)
  fun g_network_service_get_type : UInt64
  fun g_network_service_new(service : Pointer(LibC::Char), protocol : Pointer(LibC::Char), domain : Pointer(LibC::Char)) : Pointer(Void)
  fun g_network_service_set_scheme(this : Void*, scheme : Pointer(LibC::Char)) : Void
  fun g_networking_init : Void
  fun g_notification_add_button(this : Void*, label : Pointer(LibC::Char), detailed_action : Pointer(LibC::Char)) : Void
  fun g_notification_add_button_with_target_value(this : Void*, label : Pointer(LibC::Char), action : Pointer(LibC::Char), target : Pointer(Void)) : Void
  fun g_notification_get_type : UInt64
  fun g_notification_new(title : Pointer(LibC::Char)) : Pointer(Void)
  fun g_notification_set_body(this : Void*, body : Pointer(LibC::Char)) : Void
  fun g_notification_set_category(this : Void*, category : Pointer(LibC::Char)) : Void
  fun g_notification_set_default_action(this : Void*, detailed_action : Pointer(LibC::Char)) : Void
  fun g_notification_set_default_action_and_target_value(this : Void*, action : Pointer(LibC::Char), target : Pointer(Void)) : Void
  fun g_notification_set_icon(this : Void*, icon : Pointer(Void)) : Void
  fun g_notification_set_priority(this : Void*, priority : UInt32) : Void
  fun g_notification_set_title(this : Void*, title : Pointer(LibC::Char)) : Void
  fun g_notification_set_urgent(this : Void*, urgent : LibC::Int) : Void
  fun g_null_settings_backend_new : Pointer(Void)
  fun g_output_stream_clear_pending(this : Void*) : Void
  fun g_output_stream_close(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_output_stream_close_async(this : Void*, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_output_stream_close_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_output_stream_flush(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_output_stream_flush_async(this : Void*, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_output_stream_flush_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_output_stream_get_type : UInt64
  fun g_output_stream_has_pending(this : Void*) : LibC::Int
  fun g_output_stream_is_closed(this : Void*) : LibC::Int
  fun g_output_stream_is_closing(this : Void*) : LibC::Int
  fun g_output_stream_set_pending(this : Void*, error : LibGLib::Error**) : LibC::Int
  fun g_output_stream_splice(this : Void*, source : Pointer(Void), flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_output_stream_splice_async(this : Void*, source : Pointer(Void), flags : UInt32, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_output_stream_splice_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_output_stream_write(this : Void*, buffer : Pointer(UInt8), count : UInt64, cancellable : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_output_stream_write_all(this : Void*, buffer : Pointer(UInt8), count : UInt64, bytes_written : Pointer(UInt64), cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_output_stream_write_all_async(this : Void*, buffer : Pointer(UInt8), count : UInt64, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_output_stream_write_all_finish(this : Void*, result : Pointer(Void), bytes_written : Pointer(UInt64), error : LibGLib::Error**) : LibC::Int
  fun g_output_stream_write_async(this : Void*, buffer : Pointer(UInt8), count : UInt64, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_output_stream_write_bytes(this : Void*, bytes : Pointer(Void), cancellable : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_output_stream_write_bytes_async(this : Void*, bytes : Pointer(Void), io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_output_stream_write_bytes_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_output_stream_write_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_output_stream_writev(this : Void*, vectors : Pointer(Void), n_vectors : UInt64, bytes_written : Pointer(UInt64), cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_output_stream_writev_all(this : Void*, vectors : Pointer(Void), n_vectors : UInt64, bytes_written : Pointer(UInt64), cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_output_stream_writev_all_async(this : Void*, vectors : Pointer(Void), n_vectors : UInt64, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_output_stream_writev_all_finish(this : Void*, result : Pointer(Void), bytes_written : Pointer(UInt64), error : LibGLib::Error**) : LibC::Int
  fun g_output_stream_writev_async(this : Void*, vectors : Pointer(Void), n_vectors : UInt64, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_output_stream_writev_finish(this : Void*, result : Pointer(Void), bytes_written : Pointer(UInt64), error : LibGLib::Error**) : LibC::Int
  fun g_permission_acquire(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_permission_acquire_async(this : Void*, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_permission_acquire_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_permission_get_allowed(this : Void*) : LibC::Int
  fun g_permission_get_can_acquire(this : Void*) : LibC::Int
  fun g_permission_get_can_release(this : Void*) : LibC::Int
  fun g_permission_get_type : UInt64
  fun g_permission_impl_update(this : Void*, allowed : LibC::Int, can_acquire : LibC::Int, can_release : LibC::Int) : Void
  fun g_permission_release(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_permission_release_async(this : Void*, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_permission_release_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_pollable_input_stream_can_poll(this : Void*) : LibC::Int
  fun g_pollable_input_stream_create_source(this : Void*, cancellable : Pointer(Void)) : Pointer(Void)
  fun g_pollable_input_stream_get_type : UInt64
  fun g_pollable_input_stream_is_readable(this : Void*) : LibC::Int
  fun g_pollable_input_stream_read_nonblocking(this : Void*, buffer : Pointer(Pointer(UInt8)), count : UInt64, cancellable : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_pollable_output_stream_can_poll(this : Void*) : LibC::Int
  fun g_pollable_output_stream_create_source(this : Void*, cancellable : Pointer(Void)) : Pointer(Void)
  fun g_pollable_output_stream_get_type : UInt64
  fun g_pollable_output_stream_is_writable(this : Void*) : LibC::Int
  fun g_pollable_output_stream_write_nonblocking(this : Void*, buffer : Pointer(UInt8), count : UInt64, cancellable : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_pollable_output_stream_writev_nonblocking(this : Void*, vectors : Pointer(Void), n_vectors : UInt64, bytes_written : Pointer(UInt64), cancellable : Pointer(Void), error : LibGLib::Error**) : Int32
  fun g_pollable_source_new(pollable_stream : Pointer(Void)) : Pointer(Void)
  fun g_pollable_source_new_full(pollable_stream : Pointer(Void), child_source : Pointer(Void), cancellable : Pointer(Void)) : Pointer(Void)
  fun g_pollable_stream_read(stream : Pointer(Void), buffer : Pointer(UInt8), count : UInt64, blocking : LibC::Int, cancellable : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_pollable_stream_write(stream : Pointer(Void), buffer : Pointer(UInt8), count : UInt64, blocking : LibC::Int, cancellable : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_pollable_stream_write_all(stream : Pointer(Void), buffer : Pointer(UInt8), count : UInt64, blocking : LibC::Int, bytes_written : Pointer(UInt64), cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_power_profile_monitor_dup_default : Pointer(Void)
  fun g_power_profile_monitor_dup_default : Pointer(Void)
  fun g_power_profile_monitor_get_power_saver_enabled(this : Void*) : LibC::Int
  fun g_power_profile_monitor_get_type : UInt64
  fun g_property_action_get_type : UInt64
  fun g_property_action_new(name : Pointer(LibC::Char), object : Pointer(Void), property_name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_proxy_address_enumerator_get_type : UInt64
  fun g_proxy_address_get_destination_hostname(this : Void*) : Pointer(LibC::Char)
  fun g_proxy_address_get_destination_port(this : Void*) : UInt16
  fun g_proxy_address_get_destination_protocol(this : Void*) : Pointer(LibC::Char)
  fun g_proxy_address_get_password(this : Void*) : Pointer(LibC::Char)
  fun g_proxy_address_get_protocol(this : Void*) : Pointer(LibC::Char)
  fun g_proxy_address_get_type : UInt64
  fun g_proxy_address_get_uri(this : Void*) : Pointer(LibC::Char)
  fun g_proxy_address_get_username(this : Void*) : Pointer(LibC::Char)
  fun g_proxy_address_new(inetaddr : Pointer(Void), port : UInt16, protocol : Pointer(LibC::Char), dest_hostname : Pointer(LibC::Char), dest_port : UInt16, username : Pointer(LibC::Char), password : Pointer(LibC::Char)) : Pointer(Void)
  fun g_proxy_connect(this : Void*, connection : Pointer(Void), proxy_address : Pointer(Void), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_proxy_connect_async(this : Void*, connection : Pointer(Void), proxy_address : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_proxy_connect_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_proxy_get_default_for_protocol(protocol : Pointer(LibC::Char)) : Pointer(Void)
  fun g_proxy_get_default_for_protocol(protocol : Pointer(LibC::Char)) : Pointer(Void)
  fun g_proxy_get_type : UInt64
  fun g_proxy_resolver_get_default : Pointer(Void)
  fun g_proxy_resolver_get_default : Pointer(Void)
  fun g_proxy_resolver_get_type : UInt64
  fun g_proxy_resolver_is_supported(this : Void*) : LibC::Int
  fun g_proxy_resolver_lookup(this : Void*, uri : Pointer(LibC::Char), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Pointer(LibC::Char))
  fun g_proxy_resolver_lookup_async(this : Void*, uri : Pointer(LibC::Char), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_proxy_resolver_lookup_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(Pointer(LibC::Char))
  fun g_proxy_supports_hostname(this : Void*) : LibC::Int
  fun g_remote_action_group_activate_action_full(this : Void*, action_name : Pointer(LibC::Char), parameter : Pointer(Void), platform_data : Pointer(Void)) : Void
  fun g_remote_action_group_change_action_state_full(this : Void*, action_name : Pointer(LibC::Char), value : Pointer(Void), platform_data : Pointer(Void)) : Void
  fun g_remote_action_group_get_type : UInt64
  fun g_resolver_error_quark : UInt32
  fun g_resolver_get_default : Pointer(Void)
  fun g_resolver_get_type : UInt64
  fun g_resolver_lookup_by_address(this : Void*, address : Pointer(Void), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_resolver_lookup_by_address_async(this : Void*, address : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_resolver_lookup_by_address_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun g_resolver_lookup_by_name(this : Void*, hostname : Pointer(LibC::Char), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(LibGLib::List)
  fun g_resolver_lookup_by_name_async(this : Void*, hostname : Pointer(LibC::Char), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_resolver_lookup_by_name_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(LibGLib::List)
  fun g_resolver_lookup_by_name_with_flags(this : Void*, hostname : Pointer(LibC::Char), flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(LibGLib::List)
  fun g_resolver_lookup_by_name_with_flags_async(this : Void*, hostname : Pointer(LibC::Char), flags : UInt32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_resolver_lookup_by_name_with_flags_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(LibGLib::List)
  fun g_resolver_lookup_records(this : Void*, rrname : Pointer(LibC::Char), record_type : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(LibGLib::List)
  fun g_resolver_lookup_records_async(this : Void*, rrname : Pointer(LibC::Char), record_type : UInt32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_resolver_lookup_records_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(LibGLib::List)
  fun g_resolver_lookup_service(this : Void*, service : Pointer(LibC::Char), protocol : Pointer(LibC::Char), domain : Pointer(LibC::Char), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(LibGLib::List)
  fun g_resolver_lookup_service_async(this : Void*, service : Pointer(LibC::Char), protocol : Pointer(LibC::Char), domain : Pointer(LibC::Char), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_resolver_lookup_service_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(LibGLib::List)
  fun g_resolver_set_default(this : Void*) : Void
  fun g_resource_enumerate_children(this : Void*, path : Pointer(LibC::Char), lookup_flags : UInt32, error : LibGLib::Error**) : Pointer(Pointer(LibC::Char))
  fun g_resource_error_quark : UInt32
  fun g_resource_get_info(this : Void*, path : Pointer(LibC::Char), lookup_flags : UInt32, size : Pointer(UInt64), flags : Pointer(UInt32), error : LibGLib::Error**) : LibC::Int
  fun g_resource_get_type : UInt64
  fun g_resource_load(filename : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_resource_load(filename : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_resource_lookup_data(this : Void*, path : Pointer(LibC::Char), lookup_flags : UInt32, error : LibGLib::Error**) : Pointer(Void)
  fun g_resource_new_from_data(data : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_resource_open_stream(this : Void*, path : Pointer(LibC::Char), lookup_flags : UInt32, error : LibGLib::Error**) : Pointer(Void)
  fun g_resource_ref(this : Void*) : Pointer(Void)
  fun g_resource_unref(this : Void*) : Void
  fun g_resources_enumerate_children(path : Pointer(LibC::Char), lookup_flags : UInt32, error : LibGLib::Error**) : Pointer(Pointer(LibC::Char))
  fun g_resources_get_info(path : Pointer(LibC::Char), lookup_flags : UInt32, size : Pointer(UInt64), flags : Pointer(UInt32), error : LibGLib::Error**) : LibC::Int
  fun g_resources_lookup_data(path : Pointer(LibC::Char), lookup_flags : UInt32, error : LibGLib::Error**) : Pointer(Void)
  fun g_resources_open_stream(path : Pointer(LibC::Char), lookup_flags : UInt32, error : LibGLib::Error**) : Pointer(Void)
  fun g_resources_register(resource : Pointer(Void)) : Void
  fun g_resources_register(this : Void*) : Void
  fun g_resources_unregister(resource : Pointer(Void)) : Void
  fun g_resources_unregister(this : Void*) : Void
  fun g_seekable_can_seek(this : Void*) : LibC::Int
  fun g_seekable_can_truncate(this : Void*) : LibC::Int
  fun g_seekable_get_type : UInt64
  fun g_seekable_seek(this : Void*, offset : Int64, type : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_seekable_tell(this : Void*) : Int64
  fun g_seekable_truncate(this : Void*, offset : Int64, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_settings_apply(this : Void*) : Void
  fun g_settings_backend_changed(this : Void*, key : Pointer(LibC::Char), origin_tag : Pointer(Void)) : Void
  fun g_settings_backend_changed_tree(this : Void*, tree : Pointer(Void), origin_tag : Pointer(Void)) : Void
  fun g_settings_backend_flatten_tree(tree : Pointer(Void), path : Pointer(Pointer(LibC::Char)), keys : Pointer(Pointer(Pointer(LibC::Char))), values : Pointer(Pointer(Pointer(Void)))) : Void
  fun g_settings_backend_get_default : Pointer(Void)
  fun g_settings_backend_get_type : UInt64
  fun g_settings_backend_keys_changed(this : Void*, path : Pointer(LibC::Char), items : Pointer(Pointer(LibC::Char)), origin_tag : Pointer(Void)) : Void
  fun g_settings_backend_path_changed(this : Void*, path : Pointer(LibC::Char), origin_tag : Pointer(Void)) : Void
  fun g_settings_backend_path_writable_changed(this : Void*, path : Pointer(LibC::Char)) : Void
  fun g_settings_backend_writable_changed(this : Void*, key : Pointer(LibC::Char)) : Void
  fun g_settings_bind(this : Void*, key : Pointer(LibC::Char), object : Pointer(Void), property : Pointer(LibC::Char), flags : UInt32) : Void
  fun g_settings_bind_writable(this : Void*, key : Pointer(LibC::Char), object : Pointer(Void), property : Pointer(LibC::Char), inverted : LibC::Int) : Void
  fun g_settings_create_action(this : Void*, key : Pointer(LibC::Char)) : Pointer(Void)
  fun g_settings_delay(this : Void*) : Void
  fun g_settings_get_boolean(this : Void*, key : Pointer(LibC::Char)) : LibC::Int
  fun g_settings_get_child(this : Void*, name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_settings_get_default_value(this : Void*, key : Pointer(LibC::Char)) : Pointer(Void)
  fun g_settings_get_double(this : Void*, key : Pointer(LibC::Char)) : Float64
  fun g_settings_get_enum(this : Void*, key : Pointer(LibC::Char)) : Int32
  fun g_settings_get_flags(this : Void*, key : Pointer(LibC::Char)) : UInt32
  fun g_settings_get_has_unapplied(this : Void*) : LibC::Int
  fun g_settings_get_int(this : Void*, key : Pointer(LibC::Char)) : Int32
  fun g_settings_get_int64(this : Void*, key : Pointer(LibC::Char)) : Int64
  fun g_settings_get_mapped(this : Void*, key : Pointer(LibC::Char), mapping : SettingsGetMapping, user_data : Pointer(Void)) : Pointer(Void)
  fun g_settings_get_range(this : Void*, key : Pointer(LibC::Char)) : Pointer(Void)
  fun g_settings_get_string(this : Void*, key : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_settings_get_strv(this : Void*, key : Pointer(LibC::Char)) : Pointer(Pointer(LibC::Char))
  fun g_settings_get_type : UInt64
  fun g_settings_get_uint(this : Void*, key : Pointer(LibC::Char)) : UInt32
  fun g_settings_get_uint64(this : Void*, key : Pointer(LibC::Char)) : UInt64
  fun g_settings_get_user_value(this : Void*, key : Pointer(LibC::Char)) : Pointer(Void)
  fun g_settings_get_value(this : Void*, key : Pointer(LibC::Char)) : Pointer(Void)
  fun g_settings_is_writable(this : Void*, name : Pointer(LibC::Char)) : LibC::Int
  fun g_settings_list_children(this : Void*) : Pointer(Pointer(LibC::Char))
  fun g_settings_list_keys(this : Void*) : Pointer(Pointer(LibC::Char))
  fun g_settings_list_relocatable_schemas : Pointer(Pointer(LibC::Char))
  fun g_settings_list_schemas : Pointer(Pointer(LibC::Char))
  fun g_settings_new(schema_id : Pointer(LibC::Char)) : Pointer(Void)
  fun g_settings_new_full(schema : Pointer(Void), backend : Pointer(Void), path : Pointer(LibC::Char)) : Pointer(Void)
  fun g_settings_new_with_backend(schema_id : Pointer(LibC::Char), backend : Pointer(Void)) : Pointer(Void)
  fun g_settings_new_with_backend_and_path(schema_id : Pointer(LibC::Char), backend : Pointer(Void), path : Pointer(LibC::Char)) : Pointer(Void)
  fun g_settings_new_with_path(schema_id : Pointer(LibC::Char), path : Pointer(LibC::Char)) : Pointer(Void)
  fun g_settings_range_check(this : Void*, key : Pointer(LibC::Char), value : Pointer(Void)) : LibC::Int
  fun g_settings_reset(this : Void*, key : Pointer(LibC::Char)) : Void
  fun g_settings_revert(this : Void*) : Void
  fun g_settings_schema_get_id(this : Void*) : Pointer(LibC::Char)
  fun g_settings_schema_get_key(this : Void*, name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_settings_schema_get_path(this : Void*) : Pointer(LibC::Char)
  fun g_settings_schema_get_type : UInt64
  fun g_settings_schema_has_key(this : Void*, name : Pointer(LibC::Char)) : LibC::Int
  fun g_settings_schema_key_get_default_value(this : Void*) : Pointer(Void)
  fun g_settings_schema_key_get_description(this : Void*) : Pointer(LibC::Char)
  fun g_settings_schema_key_get_name(this : Void*) : Pointer(LibC::Char)
  fun g_settings_schema_key_get_range(this : Void*) : Pointer(Void)
  fun g_settings_schema_key_get_summary(this : Void*) : Pointer(LibC::Char)
  fun g_settings_schema_key_get_type : UInt64
  fun g_settings_schema_key_get_value_type(this : Void*) : Pointer(Void)
  fun g_settings_schema_key_range_check(this : Void*, value : Pointer(Void)) : LibC::Int
  fun g_settings_schema_key_ref(this : Void*) : Pointer(Void)
  fun g_settings_schema_key_unref(this : Void*) : Void
  fun g_settings_schema_list_children(this : Void*) : Pointer(Pointer(LibC::Char))
  fun g_settings_schema_list_keys(this : Void*) : Pointer(Pointer(LibC::Char))
  fun g_settings_schema_ref(this : Void*) : Pointer(Void)
  fun g_settings_schema_source_get_default : Pointer(Void)
  fun g_settings_schema_source_get_default : Pointer(Void)
  fun g_settings_schema_source_get_type : UInt64
  fun g_settings_schema_source_list_schemas(this : Void*, recursive : LibC::Int, non_relocatable : Pointer(Pointer(Pointer(LibC::Char))), relocatable : Pointer(Pointer(Pointer(LibC::Char)))) : Void
  fun g_settings_schema_source_lookup(this : Void*, schema_id : Pointer(LibC::Char), recursive : LibC::Int) : Pointer(Void)
  fun g_settings_schema_source_new_from_directory(directory : Pointer(LibC::Char), parent : Pointer(Void), trusted : LibC::Int, error : LibGLib::Error**) : Pointer(Void)
  fun g_settings_schema_source_ref(this : Void*) : Pointer(Void)
  fun g_settings_schema_source_unref(this : Void*) : Void
  fun g_settings_schema_unref(this : Void*) : Void
  fun g_settings_set_boolean(this : Void*, key : Pointer(LibC::Char), value : LibC::Int) : LibC::Int
  fun g_settings_set_double(this : Void*, key : Pointer(LibC::Char), value : Float64) : LibC::Int
  fun g_settings_set_enum(this : Void*, key : Pointer(LibC::Char), value : Int32) : LibC::Int
  fun g_settings_set_flags(this : Void*, key : Pointer(LibC::Char), value : UInt32) : LibC::Int
  fun g_settings_set_int(this : Void*, key : Pointer(LibC::Char), value : Int32) : LibC::Int
  fun g_settings_set_int64(this : Void*, key : Pointer(LibC::Char), value : Int64) : LibC::Int
  fun g_settings_set_string(this : Void*, key : Pointer(LibC::Char), value : Pointer(LibC::Char)) : LibC::Int
  fun g_settings_set_strv(this : Void*, key : Pointer(LibC::Char), value : Pointer(Pointer(LibC::Char))) : LibC::Int
  fun g_settings_set_uint(this : Void*, key : Pointer(LibC::Char), value : UInt32) : LibC::Int
  fun g_settings_set_uint64(this : Void*, key : Pointer(LibC::Char), value : UInt64) : LibC::Int
  fun g_settings_set_value(this : Void*, key : Pointer(LibC::Char), value : Pointer(Void)) : LibC::Int
  fun g_settings_sync : Void
  fun g_settings_unbind(object : Pointer(Void), property : Pointer(LibC::Char)) : Void
  fun g_simple_action_get_type : UInt64
  fun g_simple_action_group_add_entries(this : Void*, entries : Pointer(Void), n_entries : Int32, user_data : Pointer(Void)) : Void
  fun g_simple_action_group_get_type : UInt64
  fun g_simple_action_group_insert(this : Void*, action : Pointer(Void)) : Void
  fun g_simple_action_group_lookup(this : Void*, action_name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_simple_action_group_new : Pointer(Void)
  fun g_simple_action_group_remove(this : Void*, action_name : Pointer(LibC::Char)) : Void
  fun g_simple_action_new(name : Pointer(LibC::Char), parameter_type : Pointer(Void)) : Pointer(Void)
  fun g_simple_action_new_stateful(name : Pointer(LibC::Char), parameter_type : Pointer(Void), state : Pointer(Void)) : Pointer(Void)
  fun g_simple_action_set_enabled(this : Void*, enabled : LibC::Int) : Void
  fun g_simple_action_set_state(this : Void*, value : Pointer(Void)) : Void
  fun g_simple_action_set_state_hint(this : Void*, state_hint : Pointer(Void)) : Void
  fun g_simple_async_report_gerror_in_idle(object : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void), error : Pointer(Void)) : Void
  fun g_simple_async_result_complete(this : Void*) : Void
  fun g_simple_async_result_complete_in_idle(this : Void*) : Void
  fun g_simple_async_result_get_op_res_gboolean(this : Void*) : LibC::Int
  fun g_simple_async_result_get_op_res_gssize(this : Void*) : Int64
  fun g_simple_async_result_get_type : UInt64
  fun g_simple_async_result_is_valid(result : Pointer(Void), source : Pointer(Void), source_tag : Pointer(Void)) : LibC::Int
  fun g_simple_async_result_new(source_object : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void), source_tag : Pointer(Void)) : Pointer(Void)
  fun g_simple_async_result_new_from_error(source_object : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void), error : Pointer(Void)) : Pointer(Void)
  fun g_simple_async_result_propagate_error(this : Void*, error : LibGLib::Error**) : LibC::Int
  fun g_simple_async_result_set_check_cancellable(this : Void*, check_cancellable : Pointer(Void)) : Void
  fun g_simple_async_result_set_from_error(this : Void*, error : Pointer(Void)) : Void
  fun g_simple_async_result_set_handle_cancellation(this : Void*, handle_cancellation : LibC::Int) : Void
  fun g_simple_async_result_set_op_res_gboolean(this : Void*, op_res : LibC::Int) : Void
  fun g_simple_async_result_set_op_res_gssize(this : Void*, op_res : Int64) : Void
  fun g_simple_io_stream_get_type : UInt64
  fun g_simple_io_stream_new(input_stream : Pointer(Void), output_stream : Pointer(Void)) : Pointer(Void)
  fun g_simple_permission_get_type : UInt64
  fun g_simple_permission_new(allowed : LibC::Int) : Pointer(Void)
  fun g_simple_proxy_resolver_get_type : UInt64
  fun g_simple_proxy_resolver_new(default_proxy : Pointer(LibC::Char), ignore_hosts : Pointer(Pointer(LibC::Char))) : Pointer(Void)
  fun g_simple_proxy_resolver_set_default_proxy(this : Void*, default_proxy : Pointer(LibC::Char)) : Void
  fun g_simple_proxy_resolver_set_ignore_hosts(this : Void*, ignore_hosts : Pointer(Pointer(LibC::Char))) : Void
  fun g_simple_proxy_resolver_set_uri_proxy(this : Void*, uri_scheme : Pointer(LibC::Char), proxy : Pointer(LibC::Char)) : Void
  fun g_socket_accept(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_address_enumerator_get_type : UInt64
  fun g_socket_address_enumerator_next(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_address_enumerator_next_async(this : Void*, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_socket_address_enumerator_next_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_address_get_family(this : Void*) : UInt32
  fun g_socket_address_get_native_size(this : Void*) : Int64
  fun g_socket_address_get_type : UInt64
  fun g_socket_address_new_from_native(native : Pointer(Void), len : UInt64) : Pointer(Void)
  fun g_socket_address_to_native(this : Void*, dest : Pointer(Void), destlen : UInt64, error : LibGLib::Error**) : LibC::Int
  fun g_socket_bind(this : Void*, address : Pointer(Void), allow_reuse : LibC::Int, error : LibGLib::Error**) : LibC::Int
  fun g_socket_check_connect_result(this : Void*, error : LibGLib::Error**) : LibC::Int
  fun g_socket_client_add_application_proxy(this : Void*, protocol : Pointer(LibC::Char)) : Void
  fun g_socket_client_connect(this : Void*, connectable : Pointer(Void), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_client_connect_async(this : Void*, connectable : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_socket_client_connect_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_client_connect_to_host(this : Void*, host_and_port : Pointer(LibC::Char), default_port : UInt16, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_client_connect_to_host_async(this : Void*, host_and_port : Pointer(LibC::Char), default_port : UInt16, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_socket_client_connect_to_host_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_client_connect_to_service(this : Void*, domain : Pointer(LibC::Char), service : Pointer(LibC::Char), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_client_connect_to_service_async(this : Void*, domain : Pointer(LibC::Char), service : Pointer(LibC::Char), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_socket_client_connect_to_service_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_client_connect_to_uri(this : Void*, uri : Pointer(LibC::Char), default_port : UInt16, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_client_connect_to_uri_async(this : Void*, uri : Pointer(LibC::Char), default_port : UInt16, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_socket_client_connect_to_uri_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_client_get_enable_proxy(this : Void*) : LibC::Int
  fun g_socket_client_get_family(this : Void*) : UInt32
  fun g_socket_client_get_local_address(this : Void*) : Pointer(Void)
  fun g_socket_client_get_protocol(this : Void*) : Int32
  fun g_socket_client_get_proxy_resolver(this : Void*) : Pointer(Void)
  fun g_socket_client_get_socket_type(this : Void*) : UInt32
  fun g_socket_client_get_timeout(this : Void*) : UInt32
  fun g_socket_client_get_tls(this : Void*) : LibC::Int
  fun g_socket_client_get_tls_validation_flags(this : Void*) : UInt32
  fun g_socket_client_get_type : UInt64
  fun g_socket_client_new : Pointer(Void)
  fun g_socket_client_set_enable_proxy(this : Void*, enable : LibC::Int) : Void
  fun g_socket_client_set_family(this : Void*, family : UInt32) : Void
  fun g_socket_client_set_local_address(this : Void*, address : Pointer(Void)) : Void
  fun g_socket_client_set_protocol(this : Void*, protocol : Int32) : Void
  fun g_socket_client_set_proxy_resolver(this : Void*, proxy_resolver : Pointer(Void)) : Void
  fun g_socket_client_set_socket_type(this : Void*, type : UInt32) : Void
  fun g_socket_client_set_timeout(this : Void*, timeout : UInt32) : Void
  fun g_socket_client_set_tls(this : Void*, tls : LibC::Int) : Void
  fun g_socket_client_set_tls_validation_flags(this : Void*, flags : UInt32) : Void
  fun g_socket_close(this : Void*, error : LibGLib::Error**) : LibC::Int
  fun g_socket_condition_check(this : Void*, condition : UInt32) : UInt32
  fun g_socket_condition_timed_wait(this : Void*, condition : UInt32, timeout_us : Int64, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_socket_condition_wait(this : Void*, condition : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_socket_connect(this : Void*, address : Pointer(Void), cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_socket_connectable_enumerate(this : Void*) : Pointer(Void)
  fun g_socket_connectable_get_type : UInt64
  fun g_socket_connectable_proxy_enumerate(this : Void*) : Pointer(Void)
  fun g_socket_connectable_to_string(this : Void*) : Pointer(LibC::Char)
  fun g_socket_connection_connect(this : Void*, address : Pointer(Void), cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_socket_connection_connect_async(this : Void*, address : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_socket_connection_connect_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_socket_connection_factory_create_connection(this : Void*) : Pointer(Void)
  fun g_socket_connection_factory_lookup_type(family : UInt32, type : UInt32, protocol_id : Int32) : UInt64
  fun g_socket_connection_factory_register_type(g_type : UInt64, family : UInt32, type : UInt32, protocol : Int32) : Void
  fun g_socket_connection_get_local_address(this : Void*, error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_connection_get_remote_address(this : Void*, error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_connection_get_socket(this : Void*) : Pointer(Void)
  fun g_socket_connection_get_type : UInt64
  fun g_socket_connection_is_connected(this : Void*) : LibC::Int
  fun g_socket_control_message_deserialize(level : Int32, type : Int32, size : UInt64, data : Pointer(UInt8)) : Pointer(Void)
  fun g_socket_control_message_get_level(this : Void*) : Int32
  fun g_socket_control_message_get_msg_type(this : Void*) : Int32
  fun g_socket_control_message_get_size(this : Void*) : UInt64
  fun g_socket_control_message_get_type : UInt64
  fun g_socket_control_message_serialize(this : Void*, data : Pointer(Void)) : Void
  fun g_socket_get_available_bytes(this : Void*) : Int64
  fun g_socket_get_blocking(this : Void*) : LibC::Int
  fun g_socket_get_broadcast(this : Void*) : LibC::Int
  fun g_socket_get_credentials(this : Void*, error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_get_family(this : Void*) : UInt32
  fun g_socket_get_fd(this : Void*) : Int32
  fun g_socket_get_keepalive(this : Void*) : LibC::Int
  fun g_socket_get_listen_backlog(this : Void*) : Int32
  fun g_socket_get_local_address(this : Void*, error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_get_multicast_loopback(this : Void*) : LibC::Int
  fun g_socket_get_multicast_ttl(this : Void*) : UInt32
  fun g_socket_get_option(this : Void*, level : Int32, optname : Int32, value : Pointer(Int32), error : LibGLib::Error**) : LibC::Int
  fun g_socket_get_protocol(this : Void*) : Int32
  fun g_socket_get_remote_address(this : Void*, error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_get_socket_type(this : Void*) : UInt32
  fun g_socket_get_timeout(this : Void*) : UInt32
  fun g_socket_get_ttl(this : Void*) : UInt32
  fun g_socket_get_type : UInt64
  fun g_socket_is_closed(this : Void*) : LibC::Int
  fun g_socket_is_connected(this : Void*) : LibC::Int
  fun g_socket_join_multicast_group(this : Void*, group : Pointer(Void), source_specific : LibC::Int, iface : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_socket_join_multicast_group_ssm(this : Void*, group : Pointer(Void), source_specific : Pointer(Void), iface : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_socket_leave_multicast_group(this : Void*, group : Pointer(Void), source_specific : LibC::Int, iface : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_socket_leave_multicast_group_ssm(this : Void*, group : Pointer(Void), source_specific : Pointer(Void), iface : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun g_socket_listen(this : Void*, error : LibGLib::Error**) : LibC::Int
  fun g_socket_listener_accept(this : Void*, source_object : Pointer(Pointer(Void)), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_listener_accept_async(this : Void*, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_socket_listener_accept_finish(this : Void*, result : Pointer(Void), source_object : Pointer(Pointer(Void)), error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_listener_accept_socket(this : Void*, source_object : Pointer(Pointer(Void)), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_listener_accept_socket_async(this : Void*, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_socket_listener_accept_socket_finish(this : Void*, result : Pointer(Void), source_object : Pointer(Pointer(Void)), error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_listener_add_address(this : Void*, address : Pointer(Void), type : UInt32, protocol : Int32, source_object : Pointer(Void), effective_address : Pointer(Pointer(Void)), error : LibGLib::Error**) : LibC::Int
  fun g_socket_listener_add_any_inet_port(this : Void*, source_object : Pointer(Void), error : LibGLib::Error**) : UInt16
  fun g_socket_listener_add_inet_port(this : Void*, port : UInt16, source_object : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_socket_listener_add_socket(this : Void*, socket : Pointer(Void), source_object : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_socket_listener_close(this : Void*) : Void
  fun g_socket_listener_get_type : UInt64
  fun g_socket_listener_new : Pointer(Void)
  fun g_socket_listener_set_backlog(this : Void*, listen_backlog : Int32) : Void
  fun g_socket_new(family : UInt32, type : UInt32, protocol : Int32, error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_new_from_fd(fd : Int32, error : LibGLib::Error**) : Pointer(Void)
  fun g_socket_receive(this : Void*, buffer : Pointer(Pointer(UInt8)), size : Pointer(UInt64), cancellable : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_socket_receive_from(this : Void*, address : Pointer(Pointer(Void)), buffer : Pointer(Pointer(UInt8)), size : Pointer(UInt64), cancellable : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_socket_receive_message(this : Void*, address : Pointer(Pointer(Void)), vectors : Pointer(Void), num_vectors : Int32, messages : Pointer(Pointer(Pointer(Void))), num_messages : Pointer(Int32), flags : Pointer(Int32), cancellable : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_socket_receive_messages(this : Void*, messages : Pointer(Void), num_messages : UInt32, flags : Int32, cancellable : Pointer(Void), error : LibGLib::Error**) : Int32
  fun g_socket_receive_with_blocking(this : Void*, buffer : Pointer(Pointer(UInt8)), size : Pointer(UInt64), blocking : LibC::Int, cancellable : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_socket_send(this : Void*, buffer : Pointer(UInt8), size : UInt64, cancellable : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_socket_send_message(this : Void*, address : Pointer(Void), vectors : Pointer(Void), num_vectors : Int32, messages : Pointer(Pointer(Void)), num_messages : Int32, flags : Int32, cancellable : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_socket_send_message_with_timeout(this : Void*, address : Pointer(Void), vectors : Pointer(Void), num_vectors : Int32, messages : Pointer(Pointer(Void)), num_messages : Int32, flags : Int32, timeout_us : Int64, bytes_written : Pointer(UInt64), cancellable : Pointer(Void), error : LibGLib::Error**) : Int32
  fun g_socket_send_messages(this : Void*, messages : Pointer(Void), num_messages : UInt32, flags : Int32, cancellable : Pointer(Void), error : LibGLib::Error**) : Int32
  fun g_socket_send_to(this : Void*, address : Pointer(Void), buffer : Pointer(UInt8), size : UInt64, cancellable : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_socket_send_with_blocking(this : Void*, buffer : Pointer(UInt8), size : UInt64, blocking : LibC::Int, cancellable : Pointer(Void), error : LibGLib::Error**) : Int64
  fun g_socket_service_get_type : UInt64
  fun g_socket_service_is_active(this : Void*) : LibC::Int
  fun g_socket_service_new : Pointer(Void)
  fun g_socket_service_start(this : Void*) : Void
  fun g_socket_service_stop(this : Void*) : Void
  fun g_socket_set_blocking(this : Void*, blocking : LibC::Int) : Void
  fun g_socket_set_broadcast(this : Void*, broadcast : LibC::Int) : Void
  fun g_socket_set_keepalive(this : Void*, keepalive : LibC::Int) : Void
  fun g_socket_set_listen_backlog(this : Void*, backlog : Int32) : Void
  fun g_socket_set_multicast_loopback(this : Void*, loopback : LibC::Int) : Void
  fun g_socket_set_multicast_ttl(this : Void*, ttl : UInt32) : Void
  fun g_socket_set_option(this : Void*, level : Int32, optname : Int32, value : Int32, error : LibGLib::Error**) : LibC::Int
  fun g_socket_set_timeout(this : Void*, timeout : UInt32) : Void
  fun g_socket_set_ttl(this : Void*, ttl : UInt32) : Void
  fun g_socket_shutdown(this : Void*, shutdown_read : LibC::Int, shutdown_write : LibC::Int, error : LibGLib::Error**) : LibC::Int
  fun g_socket_speaks_ipv4(this : Void*) : LibC::Int
  fun g_srv_target_copy(this : Void*) : Pointer(Void)
  fun g_srv_target_free(this : Void*) : Void
  fun g_srv_target_get_hostname(this : Void*) : Pointer(LibC::Char)
  fun g_srv_target_get_port(this : Void*) : UInt16
  fun g_srv_target_get_priority(this : Void*) : UInt16
  fun g_srv_target_get_type : UInt64
  fun g_srv_target_get_weight(this : Void*) : UInt16
  fun g_srv_target_new(hostname : Pointer(LibC::Char), port : UInt16, priority : UInt16, weight : UInt16) : Pointer(Void)
  fun g_static_resource_fini(this : Void*) : Void
  fun g_static_resource_get_resource(this : Void*) : Pointer(Void)
  fun g_static_resource_init(this : Void*) : Void
  fun g_subprocess_communicate(this : Void*, stdin_buf : Pointer(Void), cancellable : Pointer(Void), stdout_buf : Pointer(Pointer(Void)), stderr_buf : Pointer(Pointer(Void)), error : LibGLib::Error**) : LibC::Int
  fun g_subprocess_communicate_async(this : Void*, stdin_buf : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_subprocess_communicate_finish(this : Void*, result : Pointer(Void), stdout_buf : Pointer(Pointer(Void)), stderr_buf : Pointer(Pointer(Void)), error : LibGLib::Error**) : LibC::Int
  fun g_subprocess_communicate_utf8(this : Void*, stdin_buf : Pointer(LibC::Char), cancellable : Pointer(Void), stdout_buf : Pointer(Pointer(LibC::Char)), stderr_buf : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : LibC::Int
  fun g_subprocess_communicate_utf8_async(this : Void*, stdin_buf : Pointer(LibC::Char), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_subprocess_communicate_utf8_finish(this : Void*, result : Pointer(Void), stdout_buf : Pointer(Pointer(LibC::Char)), stderr_buf : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : LibC::Int
  fun g_subprocess_force_exit(this : Void*) : Void
  fun g_subprocess_get_exit_status(this : Void*) : Int32
  fun g_subprocess_get_identifier(this : Void*) : Pointer(LibC::Char)
  fun g_subprocess_get_if_exited(this : Void*) : LibC::Int
  fun g_subprocess_get_if_signaled(this : Void*) : LibC::Int
  fun g_subprocess_get_status(this : Void*) : Int32
  fun g_subprocess_get_stderr_pipe(this : Void*) : Pointer(Void)
  fun g_subprocess_get_stdin_pipe(this : Void*) : Pointer(Void)
  fun g_subprocess_get_stdout_pipe(this : Void*) : Pointer(Void)
  fun g_subprocess_get_successful(this : Void*) : LibC::Int
  fun g_subprocess_get_term_sig(this : Void*) : Int32
  fun g_subprocess_get_type : UInt64
  fun g_subprocess_launcher_close(this : Void*) : Void
  fun g_subprocess_launcher_get_type : UInt64
  fun g_subprocess_launcher_getenv(this : Void*, variable : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_subprocess_launcher_new(flags : UInt32) : Pointer(Void)
  fun g_subprocess_launcher_set_cwd(this : Void*, cwd : Pointer(LibC::Char)) : Void
  fun g_subprocess_launcher_set_environ(this : Void*, env : Pointer(Pointer(LibC::Char))) : Void
  fun g_subprocess_launcher_set_flags(this : Void*, flags : UInt32) : Void
  fun g_subprocess_launcher_set_stderr_file_path(this : Void*, path : Pointer(LibC::Char)) : Void
  fun g_subprocess_launcher_set_stdin_file_path(this : Void*, path : Pointer(LibC::Char)) : Void
  fun g_subprocess_launcher_set_stdout_file_path(this : Void*, path : Pointer(LibC::Char)) : Void
  fun g_subprocess_launcher_setenv(this : Void*, variable : Pointer(LibC::Char), value : Pointer(LibC::Char), overwrite : LibC::Int) : Void
  fun g_subprocess_launcher_spawnv(this : Void*, argv : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : Pointer(Void)
  fun g_subprocess_launcher_take_fd(this : Void*, source_fd : Int32, target_fd : Int32) : Void
  fun g_subprocess_launcher_take_stderr_fd(this : Void*, fd : Int32) : Void
  fun g_subprocess_launcher_take_stdin_fd(this : Void*, fd : Int32) : Void
  fun g_subprocess_launcher_take_stdout_fd(this : Void*, fd : Int32) : Void
  fun g_subprocess_launcher_unsetenv(this : Void*, variable : Pointer(LibC::Char)) : Void
  fun g_subprocess_newv(argv : Pointer(Pointer(LibC::Char)), flags : UInt32, error : LibGLib::Error**) : Pointer(Void)
  fun g_subprocess_send_signal(this : Void*, signal_num : Int32) : Void
  fun g_subprocess_wait(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_subprocess_wait_async(this : Void*, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_subprocess_wait_check(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_subprocess_wait_check_async(this : Void*, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_subprocess_wait_check_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_subprocess_wait_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_task_get_cancellable(this : Void*) : Pointer(Void)
  fun g_task_get_check_cancellable(this : Void*) : LibC::Int
  fun g_task_get_completed(this : Void*) : LibC::Int
  fun g_task_get_context(this : Void*) : Pointer(Void)
  fun g_task_get_name(this : Void*) : Pointer(LibC::Char)
  fun g_task_get_priority(this : Void*) : Int32
  fun g_task_get_return_on_cancel(this : Void*) : LibC::Int
  fun g_task_get_source_object(this : Void*) : Pointer(Void)
  fun g_task_get_source_tag(this : Void*) : Pointer(Void)
  fun g_task_get_task_data(this : Void*) : Pointer(Void)
  fun g_task_get_type : UInt64
  fun g_task_had_error(this : Void*) : LibC::Int
  fun g_task_is_valid(result : Pointer(Void), source_object : Pointer(Void)) : LibC::Int
  fun g_task_new(source_object : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, callback_data : Pointer(Void)) : Pointer(Void)
  fun g_task_propagate_boolean(this : Void*, error : LibGLib::Error**) : LibC::Int
  fun g_task_propagate_int(this : Void*, error : LibGLib::Error**) : Int64
  fun g_task_propagate_pointer(this : Void*, error : LibGLib::Error**) : Pointer(Void)
  fun g_task_propagate_value(this : Void*, value : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_task_report_error(source_object : Pointer(Void), callback : AsyncReadyCallback, callback_data : Pointer(Void), source_tag : Pointer(Void), error : Pointer(Void)) : Void
  fun g_task_return_boolean(this : Void*, result : LibC::Int) : Void
  fun g_task_return_error(this : Void*, error : Pointer(Void)) : Void
  fun g_task_return_error_if_cancelled(this : Void*) : LibC::Int
  fun g_task_return_int(this : Void*, result : Int64) : Void
  fun g_task_return_pointer(this : Void*, result : Pointer(Void), result_destroy : LibGLib::DestroyNotify) : Void
  fun g_task_return_value(this : Void*, result : Pointer(Void)) : Void
  fun g_task_run_in_thread(this : Void*, task_func : TaskThreadFunc) : Void
  fun g_task_run_in_thread_sync(this : Void*, task_func : TaskThreadFunc) : Void
  fun g_task_set_check_cancellable(this : Void*, check_cancellable : LibC::Int) : Void
  fun g_task_set_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun g_task_set_priority(this : Void*, priority : Int32) : Void
  fun g_task_set_return_on_cancel(this : Void*, return_on_cancel : LibC::Int) : LibC::Int
  fun g_task_set_source_tag(this : Void*, source_tag : Pointer(Void)) : Void
  fun g_task_set_task_data(this : Void*, task_data : Pointer(Void), task_data_destroy : LibGLib::DestroyNotify) : Void
  fun g_tcp_connection_get_graceful_disconnect(this : Void*) : LibC::Int
  fun g_tcp_connection_get_type : UInt64
  fun g_tcp_connection_set_graceful_disconnect(this : Void*, graceful_disconnect : LibC::Int) : Void
  fun g_tcp_wrapper_connection_get_base_io_stream(this : Void*) : Pointer(Void)
  fun g_tcp_wrapper_connection_get_type : UInt64
  fun g_tcp_wrapper_connection_new(base_io_stream : Pointer(Void), socket : Pointer(Void)) : Pointer(Void)
  fun g_test_dbus_add_service_dir(this : Void*, path : Pointer(LibC::Char)) : Void
  fun g_test_dbus_down(this : Void*) : Void
  fun g_test_dbus_get_bus_address(this : Void*) : Pointer(LibC::Char)
  fun g_test_dbus_get_flags(this : Void*) : UInt32
  fun g_test_dbus_get_type : UInt64
  fun g_test_dbus_new(flags : UInt32) : Pointer(Void)
  fun g_test_dbus_stop(this : Void*) : Void
  fun g_test_dbus_unset : Void
  fun g_test_dbus_up(this : Void*) : Void
  fun g_themed_icon_append_name(this : Void*, iconname : Pointer(LibC::Char)) : Void
  fun g_themed_icon_get_names(this : Void*) : Pointer(Pointer(LibC::Char))
  fun g_themed_icon_get_type : UInt64
  fun g_themed_icon_new(iconname : Pointer(LibC::Char)) : Pointer(Void)
  fun g_themed_icon_new_from_names(iconnames : Pointer(Pointer(LibC::Char)), len : Int32) : Pointer(Void)
  fun g_themed_icon_new_with_default_fallbacks(iconname : Pointer(LibC::Char)) : Pointer(Void)
  fun g_themed_icon_prepend_name(this : Void*, iconname : Pointer(LibC::Char)) : Void
  fun g_threaded_socket_service_get_type : UInt64
  fun g_threaded_socket_service_new(max_threads : Int32) : Pointer(Void)
  fun g_tls_backend_get_certificate_type(this : Void*) : UInt64
  fun g_tls_backend_get_client_connection_type(this : Void*) : UInt64
  fun g_tls_backend_get_default : Pointer(Void)
  fun g_tls_backend_get_default : Pointer(Void)
  fun g_tls_backend_get_default_database(this : Void*) : Pointer(Void)
  fun g_tls_backend_get_dtls_client_connection_type(this : Void*) : UInt64
  fun g_tls_backend_get_dtls_server_connection_type(this : Void*) : UInt64
  fun g_tls_backend_get_file_database_type(this : Void*) : UInt64
  fun g_tls_backend_get_server_connection_type(this : Void*) : UInt64
  fun g_tls_backend_get_type : UInt64
  fun g_tls_backend_set_default_database(this : Void*, database : Pointer(Void)) : Void
  fun g_tls_backend_supports_dtls(this : Void*) : LibC::Int
  fun g_tls_backend_supports_tls(this : Void*) : LibC::Int
  fun g_tls_certificate_get_dns_names(this : Void*) : Pointer(Void)
  fun g_tls_certificate_get_ip_addresses(this : Void*) : Pointer(Void)
  fun g_tls_certificate_get_issuer(this : Void*) : Pointer(Void)
  fun g_tls_certificate_get_issuer_name(this : Void*) : Pointer(LibC::Char)
  fun g_tls_certificate_get_not_valid_after(this : Void*) : Pointer(Void)
  fun g_tls_certificate_get_not_valid_before(this : Void*) : Pointer(Void)
  fun g_tls_certificate_get_subject_name(this : Void*) : Pointer(LibC::Char)
  fun g_tls_certificate_get_type : UInt64
  fun g_tls_certificate_is_same(this : Void*, cert_two : Pointer(Void)) : LibC::Int
  fun g_tls_certificate_list_new_from_file(file : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(LibGLib::List)
  fun g_tls_certificate_new_from_file(file : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_tls_certificate_new_from_files(cert_file : Pointer(LibC::Char), key_file : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_tls_certificate_new_from_pem(data : Pointer(LibC::Char), length : Int64, error : LibGLib::Error**) : Pointer(Void)
  fun g_tls_certificate_new_from_pkcs11_uris(pkcs11_uri : Pointer(LibC::Char), private_key_pkcs11_uri : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_tls_certificate_verify(this : Void*, identity : Pointer(Void), trusted_ca : Pointer(Void)) : UInt32
  fun g_tls_channel_binding_error_quark : UInt32
  fun g_tls_client_connection_copy_session_state(this : Void*, source : Pointer(Void)) : Void
  fun g_tls_client_connection_get_accepted_cas(this : Void*) : Pointer(LibGLib::List)
  fun g_tls_client_connection_get_server_identity(this : Void*) : Pointer(Void)
  fun g_tls_client_connection_get_type : UInt64
  fun g_tls_client_connection_get_use_ssl3(this : Void*) : LibC::Int
  fun g_tls_client_connection_get_validation_flags(this : Void*) : UInt32
  fun g_tls_client_connection_new(base_io_stream : Pointer(Void), server_identity : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_tls_client_connection_new(base_io_stream : Pointer(Void), server_identity : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_tls_client_connection_set_server_identity(this : Void*, identity : Pointer(Void)) : Void
  fun g_tls_client_connection_set_use_ssl3(this : Void*, use_ssl3 : LibC::Int) : Void
  fun g_tls_client_connection_set_validation_flags(this : Void*, flags : UInt32) : Void
  fun g_tls_connection_emit_accept_certificate(this : Void*, peer_cert : Pointer(Void), errors : UInt32) : LibC::Int
  fun g_tls_connection_get_certificate(this : Void*) : Pointer(Void)
  fun g_tls_connection_get_channel_binding_data(this : Void*, type : UInt32, data : Pointer(Pointer(UInt8)), error : LibGLib::Error**) : LibC::Int
  fun g_tls_connection_get_ciphersuite_name(this : Void*) : Pointer(LibC::Char)
  fun g_tls_connection_get_database(this : Void*) : Pointer(Void)
  fun g_tls_connection_get_interaction(this : Void*) : Pointer(Void)
  fun g_tls_connection_get_negotiated_protocol(this : Void*) : Pointer(LibC::Char)
  fun g_tls_connection_get_peer_certificate(this : Void*) : Pointer(Void)
  fun g_tls_connection_get_peer_certificate_errors(this : Void*) : UInt32
  fun g_tls_connection_get_protocol_version(this : Void*) : UInt32
  fun g_tls_connection_get_rehandshake_mode(this : Void*) : UInt32
  fun g_tls_connection_get_require_close_notify(this : Void*) : LibC::Int
  fun g_tls_connection_get_type : UInt64
  fun g_tls_connection_get_use_system_certdb(this : Void*) : LibC::Int
  fun g_tls_connection_handshake(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_tls_connection_handshake_async(this : Void*, io_priority : Int32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_tls_connection_handshake_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_tls_connection_set_advertised_protocols(this : Void*, protocols : Pointer(Pointer(LibC::Char))) : Void
  fun g_tls_connection_set_certificate(this : Void*, certificate : Pointer(Void)) : Void
  fun g_tls_connection_set_database(this : Void*, database : Pointer(Void)) : Void
  fun g_tls_connection_set_interaction(this : Void*, interaction : Pointer(Void)) : Void
  fun g_tls_connection_set_rehandshake_mode(this : Void*, mode : UInt32) : Void
  fun g_tls_connection_set_require_close_notify(this : Void*, require_close_notify : LibC::Int) : Void
  fun g_tls_connection_set_use_system_certdb(this : Void*, use_system_certdb : LibC::Int) : Void
  fun g_tls_database_create_certificate_handle(this : Void*, certificate : Pointer(Void)) : Pointer(LibC::Char)
  fun g_tls_database_get_type : UInt64
  fun g_tls_database_lookup_certificate_for_handle(this : Void*, handle : Pointer(LibC::Char), interaction : Pointer(Void), flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_tls_database_lookup_certificate_for_handle_async(this : Void*, handle : Pointer(LibC::Char), interaction : Pointer(Void), flags : UInt32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_tls_database_lookup_certificate_for_handle_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_tls_database_lookup_certificate_issuer(this : Void*, certificate : Pointer(Void), interaction : Pointer(Void), flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_tls_database_lookup_certificate_issuer_async(this : Void*, certificate : Pointer(Void), interaction : Pointer(Void), flags : UInt32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_tls_database_lookup_certificate_issuer_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_tls_database_lookup_certificates_issued_by(this : Void*, issuer_raw_dn : Pointer(UInt8), interaction : Pointer(Void), flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(LibGLib::List)
  fun g_tls_database_lookup_certificates_issued_by_async(this : Void*, issuer_raw_dn : Pointer(UInt8), interaction : Pointer(Void), flags : UInt32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_tls_database_lookup_certificates_issued_by_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(LibGLib::List)
  fun g_tls_database_verify_chain(this : Void*, chain : Pointer(Void), purpose : Pointer(LibC::Char), identity : Pointer(Void), interaction : Pointer(Void), flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : UInt32
  fun g_tls_database_verify_chain_async(this : Void*, chain : Pointer(Void), purpose : Pointer(LibC::Char), identity : Pointer(Void), interaction : Pointer(Void), flags : UInt32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_tls_database_verify_chain_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : UInt32
  fun g_tls_error_quark : UInt32
  fun g_tls_file_database_get_type : UInt64
  fun g_tls_file_database_new(anchors : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_tls_file_database_new(anchors : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun g_tls_interaction_ask_password(this : Void*, password : Pointer(Void), cancellable : Pointer(Void), error : LibGLib::Error**) : UInt32
  fun g_tls_interaction_ask_password_async(this : Void*, password : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_tls_interaction_ask_password_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : UInt32
  fun g_tls_interaction_get_type : UInt64
  fun g_tls_interaction_invoke_ask_password(this : Void*, password : Pointer(Void), cancellable : Pointer(Void), error : LibGLib::Error**) : UInt32
  fun g_tls_interaction_invoke_request_certificate(this : Void*, connection : Pointer(Void), flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : UInt32
  fun g_tls_interaction_request_certificate(this : Void*, connection : Pointer(Void), flags : UInt32, cancellable : Pointer(Void), error : LibGLib::Error**) : UInt32
  fun g_tls_interaction_request_certificate_async(this : Void*, connection : Pointer(Void), flags : UInt32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_tls_interaction_request_certificate_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : UInt32
  fun g_tls_password_get_description(this : Void*) : Pointer(LibC::Char)
  fun g_tls_password_get_flags(this : Void*) : UInt32
  fun g_tls_password_get_type : UInt64
  fun g_tls_password_get_value(this : Void*, length : Pointer(UInt64)) : Pointer(UInt8)
  fun g_tls_password_get_warning(this : Void*) : Pointer(LibC::Char)
  fun g_tls_password_new(flags : UInt32, description : Pointer(LibC::Char)) : Pointer(Void)
  fun g_tls_password_set_description(this : Void*, description : Pointer(LibC::Char)) : Void
  fun g_tls_password_set_flags(this : Void*, flags : UInt32) : Void
  fun g_tls_password_set_value(this : Void*, value : Pointer(UInt8), length : Int64) : Void
  fun g_tls_password_set_value_full(this : Void*, value : Pointer(UInt8), length : Int64, destroy : LibGLib::DestroyNotify) : Void
  fun g_tls_password_set_warning(this : Void*, warning : Pointer(LibC::Char)) : Void
  fun g_tls_server_connection_get_type : UInt64
  fun g_tls_server_connection_new(base_io_stream : Pointer(Void), certificate : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_tls_server_connection_new(base_io_stream : Pointer(Void), certificate : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_unix_connection_get_type : UInt64
  fun g_unix_connection_receive_credentials(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_unix_connection_receive_credentials_async(this : Void*, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_unix_connection_receive_credentials_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun g_unix_connection_receive_fd(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : Int32
  fun g_unix_connection_send_credentials(this : Void*, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_unix_connection_send_credentials_async(this : Void*, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_unix_connection_send_credentials_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_unix_connection_send_fd(this : Void*, fd : Int32, cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_unix_credentials_message_get_credentials(this : Void*) : Pointer(Void)
  fun g_unix_credentials_message_get_type : UInt64
  fun g_unix_credentials_message_is_supported : LibC::Int
  fun g_unix_credentials_message_new : Pointer(Void)
  fun g_unix_credentials_message_new_with_credentials(credentials : Pointer(Void)) : Pointer(Void)
  fun g_unix_fd_list_append(this : Void*, fd : Int32, error : LibGLib::Error**) : Int32
  fun g_unix_fd_list_get(this : Void*, index_ : Int32, error : LibGLib::Error**) : Int32
  fun g_unix_fd_list_get_length(this : Void*) : Int32
  fun g_unix_fd_list_get_type : UInt64
  fun g_unix_fd_list_new : Pointer(Void)
  fun g_unix_fd_list_new_from_array(fds : Pointer(Int32), n_fds : Int32) : Pointer(Void)
  fun g_unix_fd_list_peek_fds(this : Void*, length : Pointer(Int32)) : Pointer(Int32)
  fun g_unix_fd_list_steal_fds(this : Void*, length : Pointer(Int32)) : Pointer(Int32)
  fun g_unix_fd_message_append_fd(this : Void*, fd : Int32, error : LibGLib::Error**) : LibC::Int
  fun g_unix_fd_message_get_fd_list(this : Void*) : Pointer(Void)
  fun g_unix_fd_message_get_type : UInt64
  fun g_unix_fd_message_new : Pointer(Void)
  fun g_unix_fd_message_new_with_fd_list(fd_list : Pointer(Void)) : Pointer(Void)
  fun g_unix_fd_message_steal_fds(this : Void*, length : Pointer(Int32)) : Pointer(Int32)
  fun g_unix_input_stream_get_close_fd(this : Void*) : LibC::Int
  fun g_unix_input_stream_get_fd(this : Void*) : Int32
  fun g_unix_input_stream_get_type : UInt64
  fun g_unix_input_stream_new(fd : Int32, close_fd : LibC::Int) : Pointer(Void)
  fun g_unix_input_stream_set_close_fd(this : Void*, close_fd : LibC::Int) : Void
  fun g_unix_is_mount_path_system_internal(mount_path : Pointer(LibC::Char)) : LibC::Int
  fun g_unix_is_system_device_path(device_path : Pointer(LibC::Char)) : LibC::Int
  fun g_unix_is_system_fs_type(fs_type : Pointer(LibC::Char)) : LibC::Int
  fun g_unix_mount_at(mount_path : Pointer(LibC::Char), time_read : Pointer(UInt64)) : Pointer(Void)
  fun g_unix_mount_compare(mount1 : Pointer(Void), mount2 : Pointer(Void)) : Int32
  fun g_unix_mount_copy(mount_entry : Pointer(Void)) : Pointer(Void)
  fun g_unix_mount_entry_get_type : UInt64
  fun g_unix_mount_for(file_path : Pointer(LibC::Char), time_read : Pointer(UInt64)) : Pointer(Void)
  fun g_unix_mount_free(mount_entry : Pointer(Void)) : Void
  fun g_unix_mount_get_device_path(mount_entry : Pointer(Void)) : Pointer(LibC::Char)
  fun g_unix_mount_get_fs_type(mount_entry : Pointer(Void)) : Pointer(LibC::Char)
  fun g_unix_mount_get_mount_path(mount_entry : Pointer(Void)) : Pointer(LibC::Char)
  fun g_unix_mount_get_options(mount_entry : Pointer(Void)) : Pointer(LibC::Char)
  fun g_unix_mount_get_root_path(mount_entry : Pointer(Void)) : Pointer(LibC::Char)
  fun g_unix_mount_guess_can_eject(mount_entry : Pointer(Void)) : LibC::Int
  fun g_unix_mount_guess_icon(mount_entry : Pointer(Void)) : Pointer(Void)
  fun g_unix_mount_guess_name(mount_entry : Pointer(Void)) : Pointer(LibC::Char)
  fun g_unix_mount_guess_should_display(mount_entry : Pointer(Void)) : LibC::Int
  fun g_unix_mount_guess_symbolic_icon(mount_entry : Pointer(Void)) : Pointer(Void)
  fun g_unix_mount_is_readonly(mount_entry : Pointer(Void)) : LibC::Int
  fun g_unix_mount_is_system_internal(mount_entry : Pointer(Void)) : LibC::Int
  fun g_unix_mount_monitor_get : Pointer(Void)
  fun g_unix_mount_monitor_get_type : UInt64
  fun g_unix_mount_monitor_new : Pointer(Void)
  fun g_unix_mount_monitor_set_rate_limit(this : Void*, limit_msec : Int32) : Void
  fun g_unix_mount_point_at(mount_path : Pointer(LibC::Char), time_read : Pointer(UInt64)) : Pointer(Void)
  fun g_unix_mount_point_at(mount_path : Pointer(LibC::Char), time_read : Pointer(UInt64)) : Pointer(Void)
  fun g_unix_mount_point_compare(this : Void*, mount2 : Pointer(Void)) : Int32
  fun g_unix_mount_point_copy(this : Void*) : Pointer(Void)
  fun g_unix_mount_point_free(this : Void*) : Void
  fun g_unix_mount_point_get_device_path(this : Void*) : Pointer(LibC::Char)
  fun g_unix_mount_point_get_fs_type(this : Void*) : Pointer(LibC::Char)
  fun g_unix_mount_point_get_mount_path(this : Void*) : Pointer(LibC::Char)
  fun g_unix_mount_point_get_options(this : Void*) : Pointer(LibC::Char)
  fun g_unix_mount_point_get_type : UInt64
  fun g_unix_mount_point_guess_can_eject(this : Void*) : LibC::Int
  fun g_unix_mount_point_guess_icon(this : Void*) : Pointer(Void)
  fun g_unix_mount_point_guess_name(this : Void*) : Pointer(LibC::Char)
  fun g_unix_mount_point_guess_symbolic_icon(this : Void*) : Pointer(Void)
  fun g_unix_mount_point_is_loopback(this : Void*) : LibC::Int
  fun g_unix_mount_point_is_readonly(this : Void*) : LibC::Int
  fun g_unix_mount_point_is_user_mountable(this : Void*) : LibC::Int
  fun g_unix_mount_points_changed_since(time : UInt64) : LibC::Int
  fun g_unix_mount_points_get(time_read : Pointer(UInt64)) : Pointer(LibGLib::List)
  fun g_unix_mounts_changed_since(time : UInt64) : LibC::Int
  fun g_unix_mounts_get(time_read : Pointer(UInt64)) : Pointer(LibGLib::List)
  fun g_unix_output_stream_get_close_fd(this : Void*) : LibC::Int
  fun g_unix_output_stream_get_fd(this : Void*) : Int32
  fun g_unix_output_stream_get_type : UInt64
  fun g_unix_output_stream_new(fd : Int32, close_fd : LibC::Int) : Pointer(Void)
  fun g_unix_output_stream_set_close_fd(this : Void*, close_fd : LibC::Int) : Void
  fun g_unix_socket_address_abstract_names_supported : LibC::Int
  fun g_unix_socket_address_get_address_type(this : Void*) : UInt32
  fun g_unix_socket_address_get_is_abstract(this : Void*) : LibC::Int
  fun g_unix_socket_address_get_path(this : Void*) : Pointer(LibC::Char)
  fun g_unix_socket_address_get_path_len(this : Void*) : UInt64
  fun g_unix_socket_address_get_type : UInt64
  fun g_unix_socket_address_new(path : Pointer(LibC::Char)) : Pointer(Void)
  fun g_unix_socket_address_new_abstract(path : Pointer(Int8), path_len : Int32) : Pointer(Void)
  fun g_unix_socket_address_new_with_type(path : Pointer(Int8), path_len : Int32, type : UInt32) : Pointer(Void)
  fun g_vfs_get_default : Pointer(Void)
  fun g_vfs_get_file_for_path(this : Void*, path : Pointer(LibC::Char)) : Pointer(Void)
  fun g_vfs_get_file_for_uri(this : Void*, uri : Pointer(LibC::Char)) : Pointer(Void)
  fun g_vfs_get_local : Pointer(Void)
  fun g_vfs_get_supported_uri_schemes(this : Void*) : Pointer(Pointer(LibC::Char))
  fun g_vfs_get_type : UInt64
  fun g_vfs_is_active(this : Void*) : LibC::Int
  fun g_vfs_parse_name(this : Void*, parse_name : Pointer(LibC::Char)) : Pointer(Void)
  fun g_vfs_register_uri_scheme(this : Void*, scheme : Pointer(LibC::Char), uri_func : VfsFileLookupFunc, uri_data : Pointer(Void), uri_destroy : LibGLib::DestroyNotify, parse_name_func : VfsFileLookupFunc, parse_name_data : Pointer(Void), parse_name_destroy : LibGLib::DestroyNotify) : LibC::Int
  fun g_vfs_unregister_uri_scheme(this : Void*, scheme : Pointer(LibC::Char)) : LibC::Int
  fun g_volume_can_eject(this : Void*) : LibC::Int
  fun g_volume_can_mount(this : Void*) : LibC::Int
  fun g_volume_eject(this : Void*, flags : UInt32, cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_volume_eject_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_volume_eject_with_operation(this : Void*, flags : UInt32, mount_operation : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_volume_eject_with_operation_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_volume_enumerate_identifiers(this : Void*) : Pointer(Pointer(LibC::Char))
  fun g_volume_get_activation_root(this : Void*) : Pointer(Void)
  fun g_volume_get_drive(this : Void*) : Pointer(Void)
  fun g_volume_get_icon(this : Void*) : Pointer(Void)
  fun g_volume_get_identifier(this : Void*, kind : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_volume_get_mount(this : Void*) : Pointer(Void)
  fun g_volume_get_name(this : Void*) : Pointer(LibC::Char)
  fun g_volume_get_sort_key(this : Void*) : Pointer(LibC::Char)
  fun g_volume_get_symbolic_icon(this : Void*) : Pointer(Void)
  fun g_volume_get_type : UInt64
  fun g_volume_get_uuid(this : Void*) : Pointer(LibC::Char)
  fun g_volume_monitor_adopt_orphan_mount(mount : Pointer(Void)) : Pointer(Void)
  fun g_volume_monitor_get : Pointer(Void)
  fun g_volume_monitor_get_connected_drives(this : Void*) : Pointer(LibGLib::List)
  fun g_volume_monitor_get_mount_for_uuid(this : Void*, uuid : Pointer(LibC::Char)) : Pointer(Void)
  fun g_volume_monitor_get_mounts(this : Void*) : Pointer(LibGLib::List)
  fun g_volume_monitor_get_type : UInt64
  fun g_volume_monitor_get_volume_for_uuid(this : Void*, uuid : Pointer(LibC::Char)) : Pointer(Void)
  fun g_volume_monitor_get_volumes(this : Void*) : Pointer(LibGLib::List)
  fun g_volume_mount(this : Void*, flags : UInt32, mount_operation : Pointer(Void), cancellable : Pointer(Void), callback : AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun g_volume_mount_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun g_volume_should_automount(this : Void*) : LibC::Int
  fun g_zlib_compressor_get_file_info(this : Void*) : Pointer(Void)
  fun g_zlib_compressor_get_type : UInt64
  fun g_zlib_compressor_new(format : UInt32, level : Int32) : Pointer(Void)
  fun g_zlib_compressor_set_file_info(this : Void*, file_info : Pointer(Void)) : Void
  fun g_zlib_decompressor_get_file_info(this : Void*) : Pointer(Void)
  fun g_zlib_decompressor_get_type : UInt64
  fun g_zlib_decompressor_new(format : UInt32) : Pointer(Void)
end
