# Dependencies
require "../g_object-2.0/g_object.cr"

# C lib declaration
require "./lib_gio.cr"

# Wrappers
require "./action.cr"
require "./action_entry.cr"
require "./action_group.cr"
require "./action_map.cr"
require "./app_info.cr"
require "./app_info_monitor.cr"
require "./app_launch_context.cr"
require "./application.cr"
require "./application_command_line.cr"
require "./async_initable.cr"
require "./async_result.cr"
require "./buffered_input_stream.cr"
require "./buffered_output_stream.cr"
require "./bytes_icon.cr"
require "./cancellable.cr"
require "./charset_converter.cr"
require "./converter.cr"
require "./converter_input_stream.cr"
require "./converter_output_stream.cr"
require "./credentials.cr"
require "./d_bus_action_group.cr"
require "./d_bus_annotation_info.cr"
require "./d_bus_arg_info.cr"
require "./d_bus_auth_observer.cr"
require "./d_bus_connection.cr"
require "./d_bus_error_entry.cr"
require "./d_bus_interface.cr"
require "./d_bus_interface_info.cr"
require "./d_bus_interface_skeleton.cr"
require "./d_bus_interface_v_table.cr"
require "./d_bus_menu_model.cr"
require "./d_bus_message.cr"
require "./d_bus_method_info.cr"
require "./d_bus_method_invocation.cr"
require "./d_bus_node_info.cr"
require "./d_bus_object.cr"
require "./d_bus_object_manager.cr"
require "./d_bus_object_manager_client.cr"
require "./d_bus_object_manager_server.cr"
require "./d_bus_object_proxy.cr"
require "./d_bus_object_skeleton.cr"
require "./d_bus_property_info.cr"
require "./d_bus_proxy.cr"
require "./d_bus_server.cr"
require "./d_bus_signal_info.cr"
require "./d_bus_subtree_v_table.cr"
require "./data_input_stream.cr"
require "./data_output_stream.cr"
require "./datagram_based.cr"
require "./desktop_app_info.cr"
require "./desktop_app_info_lookup.cr"
require "./drive.cr"
require "./dtls_client_connection.cr"
require "./dtls_connection.cr"
require "./dtls_server_connection.cr"
require "./emblem.cr"
require "./emblemed_icon.cr"
require "./file.cr"
require "./file_attribute_info.cr"
require "./file_attribute_info_list.cr"
require "./file_attribute_matcher.cr"
require "./file_descriptor_based.cr"
require "./file_enumerator.cr"
require "./file_icon.cr"
require "./file_info.cr"
require "./file_input_stream.cr"
require "./file_io_stream.cr"
require "./file_monitor.cr"
require "./file_output_stream.cr"
require "./filename_completer.cr"
require "./filter_input_stream.cr"
require "./filter_output_stream.cr"
require "./icon.cr"
require "./inet_address.cr"
require "./inet_address_mask.cr"
require "./inet_socket_address.cr"
require "./initable.cr"
require "./input_message.cr"
require "./input_stream.cr"
require "./input_vector.cr"
require "./io_extension.cr"
require "./io_extension_point.cr"
require "./io_module.cr"
require "./io_module_scope.cr"
require "./io_scheduler_job.cr"
require "./io_stream.cr"
require "./io_stream_adapter.cr"
require "./list_model.cr"
require "./list_store.cr"
require "./loadable_icon.cr"
require "./memory_input_stream.cr"
require "./memory_monitor.cr"
require "./memory_output_stream.cr"
require "./menu.cr"
require "./menu_attribute_iter.cr"
require "./menu_item.cr"
require "./menu_link_iter.cr"
require "./menu_model.cr"
require "./mount.cr"
require "./mount_operation.cr"
require "./native_socket_address.cr"
require "./native_volume_monitor.cr"
require "./network_address.cr"
require "./network_monitor.cr"
require "./network_service.cr"
require "./notification.cr"
require "./output_message.cr"
require "./output_stream.cr"
require "./output_vector.cr"
require "./permission.cr"
require "./pollable_input_stream.cr"
require "./pollable_output_stream.cr"
require "./power_profile_monitor.cr"
require "./property_action.cr"
require "./proxy.cr"
require "./proxy_address.cr"
require "./proxy_address_enumerator.cr"
require "./proxy_resolver.cr"
require "./remote_action_group.cr"
require "./resolver.cr"
require "./resource.cr"
require "./seekable.cr"
require "./settings.cr"
require "./settings_backend.cr"
require "./settings_schema.cr"
require "./settings_schema_key.cr"
require "./settings_schema_source.cr"
require "./simple_action.cr"
require "./simple_action_group.cr"
require "./simple_async_result.cr"
require "./simple_io_stream.cr"
require "./simple_permission.cr"
require "./simple_proxy_resolver.cr"
require "./socket.cr"
require "./socket_address.cr"
require "./socket_address_enumerator.cr"
require "./socket_client.cr"
require "./socket_connectable.cr"
require "./socket_connection.cr"
require "./socket_control_message.cr"
require "./socket_listener.cr"
require "./socket_service.cr"
require "./srv_target.cr"
require "./static_resource.cr"
require "./subprocess.cr"
require "./subprocess_launcher.cr"
require "./task.cr"
require "./tcp_connection.cr"
require "./tcp_wrapper_connection.cr"
require "./test_d_bus.cr"
require "./themed_icon.cr"
require "./threaded_socket_service.cr"
require "./tls_backend.cr"
require "./tls_certificate.cr"
require "./tls_client_connection.cr"
require "./tls_connection.cr"
require "./tls_database.cr"
require "./tls_file_database.cr"
require "./tls_interaction.cr"
require "./tls_password.cr"
require "./tls_server_connection.cr"
require "./unix_connection.cr"
require "./unix_credentials_message.cr"
require "./unix_fd_list.cr"
require "./unix_fd_message.cr"
require "./unix_input_stream.cr"
require "./unix_mount_entry.cr"
require "./unix_mount_monitor.cr"
require "./unix_mount_point.cr"
require "./unix_output_stream.cr"
require "./unix_socket_address.cr"
require "./vfs.cr"
require "./volume.cr"
require "./volume_monitor.cr"
require "./zlib_compressor.cr"
require "./zlib_decompressor.cr"

module Gio
  DBUS_METHOD_INVOCATION_HANDLED                    = true
  DBUS_METHOD_INVOCATION_UNHANDLED                  = true
  DESKTOP_APP_INFO_LOOKUP_EXTENSION_POINT_NAME      = "gio-desktop-app-info-lookup"
  DRIVE_IDENTIFIER_KIND_UNIX_DEVICE                 = "unix-device"
  FILE_ATTRIBUTE_ACCESS_CAN_DELETE                  = "access::can-delete"
  FILE_ATTRIBUTE_ACCESS_CAN_EXECUTE                 = "access::can-execute"
  FILE_ATTRIBUTE_ACCESS_CAN_READ                    = "access::can-read"
  FILE_ATTRIBUTE_ACCESS_CAN_RENAME                  = "access::can-rename"
  FILE_ATTRIBUTE_ACCESS_CAN_TRASH                   = "access::can-trash"
  FILE_ATTRIBUTE_ACCESS_CAN_WRITE                   = "access::can-write"
  FILE_ATTRIBUTE_DOS_IS_ARCHIVE                     = "dos::is-archive"
  FILE_ATTRIBUTE_DOS_IS_MOUNTPOINT                  = "dos::is-mountpoint"
  FILE_ATTRIBUTE_DOS_IS_SYSTEM                      = "dos::is-system"
  FILE_ATTRIBUTE_DOS_REPARSE_POINT_TAG              = "dos::reparse-point-tag"
  FILE_ATTRIBUTE_ETAG_VALUE                         = "etag::value"
  FILE_ATTRIBUTE_FILESYSTEM_FREE                    = "filesystem::free"
  FILE_ATTRIBUTE_FILESYSTEM_READONLY                = "filesystem::readonly"
  FILE_ATTRIBUTE_FILESYSTEM_REMOTE                  = "filesystem::remote"
  FILE_ATTRIBUTE_FILESYSTEM_SIZE                    = "filesystem::size"
  FILE_ATTRIBUTE_FILESYSTEM_TYPE                    = "filesystem::type"
  FILE_ATTRIBUTE_FILESYSTEM_USED                    = "filesystem::used"
  FILE_ATTRIBUTE_FILESYSTEM_USE_PREVIEW             = "filesystem::use-preview"
  FILE_ATTRIBUTE_GVFS_BACKEND                       = "gvfs::backend"
  FILE_ATTRIBUTE_ID_FILE                            = "id::file"
  FILE_ATTRIBUTE_ID_FILESYSTEM                      = "id::filesystem"
  FILE_ATTRIBUTE_MOUNTABLE_CAN_EJECT                = "mountable::can-eject"
  FILE_ATTRIBUTE_MOUNTABLE_CAN_MOUNT                = "mountable::can-mount"
  FILE_ATTRIBUTE_MOUNTABLE_CAN_POLL                 = "mountable::can-poll"
  FILE_ATTRIBUTE_MOUNTABLE_CAN_START                = "mountable::can-start"
  FILE_ATTRIBUTE_MOUNTABLE_CAN_START_DEGRADED       = "mountable::can-start-degraded"
  FILE_ATTRIBUTE_MOUNTABLE_CAN_STOP                 = "mountable::can-stop"
  FILE_ATTRIBUTE_MOUNTABLE_CAN_UNMOUNT              = "mountable::can-unmount"
  FILE_ATTRIBUTE_MOUNTABLE_HAL_UDI                  = "mountable::hal-udi"
  FILE_ATTRIBUTE_MOUNTABLE_IS_MEDIA_CHECK_AUTOMATIC = "mountable::is-media-check-automatic"
  FILE_ATTRIBUTE_MOUNTABLE_START_STOP_TYPE          = "mountable::start-stop-type"
  FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE              = "mountable::unix-device"
  FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE_FILE         = "mountable::unix-device-file"
  FILE_ATTRIBUTE_OWNER_GROUP                        = "owner::group"
  FILE_ATTRIBUTE_OWNER_USER                         = "owner::user"
  FILE_ATTRIBUTE_OWNER_USER_REAL                    = "owner::user-real"
  FILE_ATTRIBUTE_PREVIEW_ICON                       = "preview::icon"
  FILE_ATTRIBUTE_RECENT_MODIFIED                    = "recent::modified"
  FILE_ATTRIBUTE_SELINUX_CONTEXT                    = "selinux::context"
  FILE_ATTRIBUTE_STANDARD_ALLOCATED_SIZE            = "standard::allocated-size"
  FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE              = "standard::content-type"
  FILE_ATTRIBUTE_STANDARD_COPY_NAME                 = "standard::copy-name"
  FILE_ATTRIBUTE_STANDARD_DESCRIPTION               = "standard::description"
  FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME              = "standard::display-name"
  FILE_ATTRIBUTE_STANDARD_EDIT_NAME                 = "standard::edit-name"
  FILE_ATTRIBUTE_STANDARD_FAST_CONTENT_TYPE         = "standard::fast-content-type"
  FILE_ATTRIBUTE_STANDARD_ICON                      = "standard::icon"
  FILE_ATTRIBUTE_STANDARD_IS_BACKUP                 = "standard::is-backup"
  FILE_ATTRIBUTE_STANDARD_IS_HIDDEN                 = "standard::is-hidden"
  FILE_ATTRIBUTE_STANDARD_IS_SYMLINK                = "standard::is-symlink"
  FILE_ATTRIBUTE_STANDARD_IS_VIRTUAL                = "standard::is-virtual"
  FILE_ATTRIBUTE_STANDARD_IS_VOLATILE               = "standard::is-volatile"
  FILE_ATTRIBUTE_STANDARD_NAME                      = "standard::name"
  FILE_ATTRIBUTE_STANDARD_SIZE                      = "standard::size"
  FILE_ATTRIBUTE_STANDARD_SORT_ORDER                = "standard::sort-order"
  FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON             = "standard::symbolic-icon"
  FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET            = "standard::symlink-target"
  FILE_ATTRIBUTE_STANDARD_TARGET_URI                = "standard::target-uri"
  FILE_ATTRIBUTE_STANDARD_TYPE                      = "standard::type"
  FILE_ATTRIBUTE_THUMBNAILING_FAILED                = "thumbnail::failed"
  FILE_ATTRIBUTE_THUMBNAIL_IS_VALID                 = "thumbnail::is-valid"
  FILE_ATTRIBUTE_THUMBNAIL_PATH                     = "thumbnail::path"
  FILE_ATTRIBUTE_TIME_ACCESS                        = "time::access"
  FILE_ATTRIBUTE_TIME_ACCESS_USEC                   = "time::access-usec"
  FILE_ATTRIBUTE_TIME_CHANGED                       = "time::changed"
  FILE_ATTRIBUTE_TIME_CHANGED_USEC                  = "time::changed-usec"
  FILE_ATTRIBUTE_TIME_CREATED                       = "time::created"
  FILE_ATTRIBUTE_TIME_CREATED_USEC                  = "time::created-usec"
  FILE_ATTRIBUTE_TIME_MODIFIED                      = "time::modified"
  FILE_ATTRIBUTE_TIME_MODIFIED_USEC                 = "time::modified-usec"
  FILE_ATTRIBUTE_TRASH_DELETION_DATE                = "trash::deletion-date"
  FILE_ATTRIBUTE_TRASH_ITEM_COUNT                   = "trash::item-count"
  FILE_ATTRIBUTE_TRASH_ORIG_PATH                    = "trash::orig-path"
  FILE_ATTRIBUTE_UNIX_BLOCKS                        = "unix::blocks"
  FILE_ATTRIBUTE_UNIX_BLOCK_SIZE                    = "unix::block-size"
  FILE_ATTRIBUTE_UNIX_DEVICE                        = "unix::device"
  FILE_ATTRIBUTE_UNIX_GID                           = "unix::gid"
  FILE_ATTRIBUTE_UNIX_INODE                         = "unix::inode"
  FILE_ATTRIBUTE_UNIX_IS_MOUNTPOINT                 = "unix::is-mountpoint"
  FILE_ATTRIBUTE_UNIX_MODE                          = "unix::mode"
  FILE_ATTRIBUTE_UNIX_NLINK                         = "unix::nlink"
  FILE_ATTRIBUTE_UNIX_RDEV                          = "unix::rdev"
  FILE_ATTRIBUTE_UNIX_UID                           = "unix::uid"
  MEMORY_MONITOR_EXTENSION_POINT_NAME               = "gio-memory-monitor"
  MENU_ATTRIBUTE_ACTION                             = "action"
  MENU_ATTRIBUTE_ACTION_NAMESPACE                   = "action-namespace"
  MENU_ATTRIBUTE_ICON                               = "icon"
  MENU_ATTRIBUTE_LABEL                              = "label"
  MENU_ATTRIBUTE_TARGET                             = "target"
  MENU_LINK_SECTION                                 = "section"
  MENU_LINK_SUBMENU                                 = "submenu"
  NATIVE_VOLUME_MONITOR_EXTENSION_POINT_NAME        = "gio-native-volume-monitor"
  NETWORK_MONITOR_EXTENSION_POINT_NAME              = "gio-network-monitor"
  POWER_PROFILE_MONITOR_EXTENSION_POINT_NAME        = "gio-power-profile-monitor"
  PROXY_EXTENSION_POINT_NAME                        = "gio-proxy"
  PROXY_RESOLVER_EXTENSION_POINT_NAME               = "gio-proxy-resolver"
  SETTINGS_BACKEND_EXTENSION_POINT_NAME             = "gsettings-backend"
  TLS_BACKEND_EXTENSION_POINT_NAME                  = "gio-tls-backend"
  TLS_DATABASE_PURPOSE_AUTHENTICATE_CLIENT          = "1.3.6.1.5.5.7.3.2"
  TLS_DATABASE_PURPOSE_AUTHENTICATE_SERVER          = "1.3.6.1.5.5.7.3.1"
  VFS_EXTENSION_POINT_NAME                          = "gio-vfs"
  VOLUME_IDENTIFIER_KIND_CLASS                      = "class"
  VOLUME_IDENTIFIER_KIND_HAL_UDI                    = "hal-udi"
  VOLUME_IDENTIFIER_KIND_LABEL                      = "label"
  VOLUME_IDENTIFIER_KIND_NFS_MOUNT                  = "nfs-mount"
  VOLUME_IDENTIFIER_KIND_UNIX_DEVICE                = "unix-device"
  VOLUME_IDENTIFIER_KIND_UUID                       = "uuid"
  VOLUME_MONITOR_EXTENSION_POINT_NAME               = "gio-volume-monitor"

  enum BusType : Int32
    Starter = -1
    None    =  0
    System  =  1
    Session =  2
  end

  enum ConverterResult : UInt32
    Error     = 0
    Converted = 1
    Finished  = 2
    Flushed   = 3
  end

  enum CredentialsType : UInt32
    Invalid             = 0
    LinuxUcred          = 1
    FreebsdCmsgcred     = 2
    OpenbsdSockpeercred = 3
    SolarisUcred        = 4
    NetbsdUnpcbid       = 5
    AppleXucred         = 6
  end

  enum DBusError : UInt32
    Failed                        =  0
    NoMemory                      =  1
    ServiceUnknown                =  2
    NameHasNoOwner                =  3
    NoReply                       =  4
    IoError                       =  5
    BadAddress                    =  6
    NotSupported                  =  7
    LimitsExceeded                =  8
    AccessDenied                  =  9
    AuthFailed                    = 10
    NoServer                      = 11
    Timeout                       = 12
    NoNetwork                     = 13
    AddressInUse                  = 14
    Disconnected                  = 15
    InvalidArgs                   = 16
    FileNotFound                  = 17
    FileExists                    = 18
    UnknownMethod                 = 19
    TimedOut                      = 20
    MatchRuleNotFound             = 21
    MatchRuleInvalid              = 22
    SpawnExecFailed               = 23
    SpawnForkFailed               = 24
    SpawnChildExited              = 25
    SpawnChildSignaled            = 26
    SpawnFailed                   = 27
    SpawnSetupFailed              = 28
    SpawnConfigInvalid            = 29
    SpawnServiceInvalid           = 30
    SpawnServiceNotFound          = 31
    SpawnPermissionsInvalid       = 32
    SpawnFileInvalid              = 33
    SpawnNoMemory                 = 34
    UnixProcessIdUnknown          = 35
    InvalidSignature              = 36
    InvalidFileContent            = 37
    SelinuxSecurityContextUnknown = 38
    AdtAuditDataUnknown           = 39
    ObjectPathInUse               = 40
    UnknownObject                 = 41
    UnknownInterface              = 42
    UnknownProperty               = 43
    PropertyReadOnly              = 44
  end

  enum DBusMessageByteOrder : UInt32
    BigEndian    =  66
    LittleEndian = 108
  end

  enum DBusMessageHeaderField : UInt32
    Invalid     = 0
    Path        = 1
    Interface   = 2
    Member      = 3
    ErrorName   = 4
    ReplySerial = 5
    Destination = 6
    Sender      = 7
    Signature   = 8
    NumUnixFds  = 9
  end

  enum DBusMessageType : UInt32
    Invalid      = 0
    MethodCall   = 1
    MethodReturn = 2
    Error        = 3
    Signal       = 4
  end

  enum DataStreamByteOrder : UInt32
    BigEndian    = 0
    LittleEndian = 1
    HostEndian   = 2
  end

  enum DataStreamNewlineType : UInt32
    Lf   = 0
    Cr   = 1
    CrLf = 2
    Any  = 3
  end

  enum DriveStartStopType : UInt32
    Unknown   = 0
    Shutdown  = 1
    Network   = 2
    Multidisk = 3
    Password  = 4
  end

  enum EmblemOrigin : UInt32
    Unknown      = 0
    Device       = 1
    Livemetadata = 2
    Tag          = 3
  end

  enum FileAttributeStatus : UInt32
    Unset        = 0
    Set          = 1
    ErrorSetting = 2
  end

  enum FileAttributeType : UInt32
    Invalid    = 0
    String     = 1
    ByteString = 2
    Boolean    = 3
    Uint32     = 4
    Int32      = 5
    Uint64     = 6
    Int64      = 7
    Object     = 8
    Stringv    = 9
  end

  enum FileMonitorEvent : UInt32
    Changed          =  0
    ChangesDoneHint  =  1
    Deleted          =  2
    Created          =  3
    AttributeChanged =  4
    PreUnmount       =  5
    Unmounted        =  6
    Moved            =  7
    Renamed          =  8
    MovedIn          =  9
    MovedOut         = 10
  end

  enum FileType : UInt32
    Unknown      = 0
    Regular      = 1
    Directory    = 2
    SymbolicLink = 3
    Special      = 4
    Shortcut     = 5
    Mountable    = 6
  end

  enum FilesystemPreviewType : UInt32
    IfAlways = 0
    IfLocal  = 1
    Never    = 2
  end

  enum IOErrorEnum : UInt32
    Failed             =  0
    NotFound           =  1
    Exists             =  2
    IsDirectory        =  3
    NotDirectory       =  4
    NotEmpty           =  5
    NotRegularFile     =  6
    NotSymbolicLink    =  7
    NotMountableFile   =  8
    FilenameTooLong    =  9
    InvalidFilename    = 10
    TooManyLinks       = 11
    NoSpace            = 12
    InvalidArgument    = 13
    PermissionDenied   = 14
    NotSupported       = 15
    NotMounted         = 16
    AlreadyMounted     = 17
    Closed             = 18
    Cancelled          = 19
    Pending            = 20
    ReadOnly           = 21
    CantCreateBackup   = 22
    WrongEtag          = 23
    TimedOut           = 24
    WouldRecurse       = 25
    Busy               = 26
    WouldBlock         = 27
    HostNotFound       = 28
    WouldMerge         = 29
    FailedHandled      = 30
    TooManyOpenFiles   = 31
    NotInitialized     = 32
    AddressInUse       = 33
    PartialInput       = 34
    InvalidData        = 35
    DbusError          = 36
    HostUnreachable    = 37
    NetworkUnreachable = 38
    ConnectionRefused  = 39
    ProxyFailed        = 40
    ProxyAuthFailed    = 41
    ProxyNeedAuth      = 42
    ProxyNotAllowed    = 43
    BrokenPipe         = 44
    ConnectionClosed   = 44
    NotConnected       = 45
    MessageTooLarge    = 46
  end

  enum IOModuleScopeFlags : UInt32
    None            = 0
    BlockDuplicates = 1
  end

  enum MemoryMonitorWarningLevel : UInt32
    Low      =  50
    Medium   = 100
    Critical = 255
  end

  enum MountOperationResult : UInt32
    Handled   = 0
    Aborted   = 1
    Unhandled = 2
  end

  enum NetworkConnectivity : UInt32
    Local   = 1
    Limited = 2
    Portal  = 3
    Full    = 4
  end

  enum NotificationPriority : UInt32
    Normal = 0
    Low    = 1
    High   = 2
    Urgent = 3
  end

  enum PasswordSave : UInt32
    Never       = 0
    ForSession  = 1
    Permanently = 2
  end

  enum PollableReturn : Int32
    Failed     =   0
    Ok         =   1
    WouldBlock = -27
  end

  enum ResolverError : UInt32
    NotFound         = 0
    TemporaryFailure = 1
    Internal         = 2
  end

  enum ResolverRecordType : UInt32
    Srv = 1
    Mx  = 2
    Txt = 3
    Soa = 4
    Ns  = 5
  end

  enum ResourceError : UInt32
    NotFound = 0
    Internal = 1
  end

  enum SocketClientEvent : UInt32
    Resolving        = 0
    Resolved         = 1
    Connecting       = 2
    Connected        = 3
    ProxyNegotiating = 4
    ProxyNegotiated  = 5
    TlsHandshaking   = 6
    TlsHandshaked    = 7
    Complete         = 8
  end

  enum SocketFamily : UInt32
    Invalid =  0
    Unix    =  1
    Ipv4    =  2
    Ipv6    = 10
  end

  enum SocketListenerEvent : UInt32
    Binding   = 0
    Bound     = 1
    Listening = 2
    Listened  = 3
  end

  enum SocketProtocol : Int32
    Unknown =  -1
    Default =   0
    Tcp     =   6
    Udp     =  17
    Sctp    = 132
  end

  enum SocketType : UInt32
    Invalid   = 0
    Stream    = 1
    Datagram  = 2
    Seqpacket = 3
  end

  enum TlsAuthenticationMode : UInt32
    None      = 0
    Requested = 1
    Required  = 2
  end

  enum TlsCertificateRequestFlags : UInt32
    None = 0
  end

  enum TlsChannelBindingError : UInt32
    NotImplemented = 0
    InvalidState   = 1
    NotAvailable   = 2
    NotSupported   = 3
    GeneralError   = 4
  end

  enum TlsChannelBindingType : UInt32
    Unique         = 0
    ServerEndPoint = 1
  end

  enum TlsDatabaseLookupFlags : UInt32
    None    = 0
    Keypair = 1
  end

  enum TlsError : UInt32
    Unavailable           = 0
    Misc                  = 1
    BadCertificate        = 2
    NotTls                = 3
    Handshake             = 4
    CertificateRequired   = 5
    Eof                   = 6
    InappropriateFallback = 7
  end

  enum TlsInteractionResult : UInt32
    Unhandled = 0
    Handled   = 1
    Failed    = 2
  end

  enum TlsProtocolVersion : UInt32
    Unknown =   0
    Ssl30   =   1
    Tls10   =   2
    Tls11   =   3
    Tls12   =   4
    Tls13   =   5
    Dtls10  = 201
    Dtls12  = 202
  end

  enum TlsRehandshakeMode : UInt32
    Never    = 0
    Safely   = 1
    Unsafely = 2
  end

  enum UnixSocketAddressType : UInt32
    Invalid        = 0
    Anonymous      = 1
    Path           = 2
    Abstract       = 3
    AbstractPadded = 4
  end

  enum ZlibCompressorFormat : UInt32
    Zlib = 0
    Gzip = 1
    Raw  = 2
  end

  @[Flags]
  enum AppInfoCreateFlags : UInt32
    NeedsTerminal               = 1
    SupportsUris                = 2
    SupportsStartupNotification = 4

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_app_info_create_flags_get_type
    end
  end

  @[Flags]
  enum ApplicationFlags : UInt32
    FlagsNone          =   0
    IsService          =   1
    IsLauncher         =   2
    HandlesOpen        =   4
    HandlesCommandLine =   8
    SendEnvironment    =  16
    NonUnique          =  32
    CanOverrideAppId   =  64
    AllowReplacement   = 128
    Replace            = 256

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_application_flags_get_type
    end
  end

  @[Flags]
  enum AskPasswordFlags : UInt32
    NeedPassword       =  1
    NeedUsername       =  2
    NeedDomain         =  4
    SavingSupported    =  8
    AnonymousSupported = 16
    Tcrypt             = 32

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_ask_password_flags_get_type
    end
  end

  @[Flags]
  enum BusNameOwnerFlags : UInt32
    AllowReplacement = 1
    Replace          = 2
    DoNotQueue       = 4

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_bus_name_owner_flags_get_type
    end
  end

  @[Flags]
  enum BusNameWatcherFlags : UInt32
    AutoStart = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_bus_name_watcher_flags_get_type
    end
  end

  @[Flags]
  enum ConverterFlags : UInt32
    InputAtEnd = 1
    Flush      = 2

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_converter_flags_get_type
    end
  end

  @[Flags]
  enum DBusCallFlags : UInt32
    NoAutoStart                   = 1
    AllowInteractiveAuthorization = 2

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_call_flags_get_type
    end
  end

  @[Flags]
  enum DBusCapabilityFlags : UInt32
    UnixFdPassing = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_capability_flags_get_type
    end
  end

  @[Flags]
  enum DBusConnectionFlags : UInt32
    AuthenticationClient          =  1
    AuthenticationServer          =  2
    AuthenticationAllowAnonymous  =  4
    MessageBusConnection          =  8
    DelayMessageProcessing        = 16
    AuthenticationRequireSameUser = 32

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_connection_flags_get_type
    end
  end

  @[Flags]
  enum DBusInterfaceSkeletonFlags : UInt32
    HandleMethodInvocationsInThread = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_interface_skeleton_flags_get_type
    end
  end

  @[Flags]
  enum DBusMessageFlags : UInt32
    NoReplyExpected               = 1
    NoAutoStart                   = 2
    AllowInteractiveAuthorization = 4

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_message_flags_get_type
    end
  end

  @[Flags]
  enum DBusObjectManagerClientFlags : UInt32
    DoNotAutoStart = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_object_manager_client_flags_get_type
    end
  end

  @[Flags]
  enum DBusPropertyInfoFlags : UInt32
    Readable = 1
    Writable = 2

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_property_info_flags_get_type
    end
  end

  @[Flags]
  enum DBusProxyFlags : UInt32
    DoNotLoadProperties          =  1
    DoNotConnectSignals          =  2
    DoNotAutoStart               =  4
    GetInvalidatedProperties     =  8
    DoNotAutoStartAtConstruction = 16

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_proxy_flags_get_type
    end
  end

  @[Flags]
  enum DBusSendMessageFlags : UInt32
    PreserveSerial = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_send_message_flags_get_type
    end
  end

  @[Flags]
  enum DBusServerFlags : UInt32
    RunInThread                   = 1
    AuthenticationAllowAnonymous  = 2
    AuthenticationRequireSameUser = 4

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_server_flags_get_type
    end
  end

  @[Flags]
  enum DBusSignalFlags : UInt32
    NoMatchRule        = 1
    MatchArg0Namespace = 2
    MatchArg0Path      = 4

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_signal_flags_get_type
    end
  end

  @[Flags]
  enum DBusSubtreeFlags : UInt32
    DispatchToUnenumeratedNodes = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_subtree_flags_get_type
    end
  end

  DriveStartFlags = 0

  @[Flags]
  enum FileAttributeInfoFlags : UInt32
    CopyWithFile  = 1
    CopyWhenMoved = 2

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_attribute_info_flags_get_type
    end
  end

  @[Flags]
  enum FileCopyFlags : UInt32
    Overwrite          =  1
    Backup             =  2
    NofollowSymlinks   =  4
    AllMetadata        =  8
    NoFallbackForMove  = 16
    TargetDefaultPerms = 32

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_copy_flags_get_type
    end
  end

  @[Flags]
  enum FileCreateFlags : UInt32
    Private            = 1
    ReplaceDestination = 2

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_create_flags_get_type
    end
  end

  @[Flags]
  enum FileMeasureFlags : UInt32
    ReportAnyError = 2
    ApparentSize   = 4
    NoXdev         = 8

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_measure_flags_get_type
    end
  end

  @[Flags]
  enum FileMonitorFlags : UInt32
    WatchMounts    = 1
    SendMoved      = 2
    WatchHardLinks = 4
    WatchMoves     = 8

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_monitor_flags_get_type
    end
  end

  @[Flags]
  enum FileQueryInfoFlags : UInt32
    NofollowSymlinks = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_query_info_flags_get_type
    end
  end

  @[Flags]
  enum IOStreamSpliceFlags : UInt32
    CloseStream1 = 1
    CloseStream2 = 2
    WaitForBoth  = 4

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_io_stream_splice_flags_get_type
    end
  end

  MountMountFlags = 0

  @[Flags]
  enum MountUnmountFlags : UInt32
    Force = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_mount_unmount_flags_get_type
    end
  end

  @[Flags]
  enum OutputStreamSpliceFlags : UInt32
    CloseSource = 1
    CloseTarget = 2

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_output_stream_splice_flags_get_type
    end
  end

  @[Flags]
  enum ResolverNameLookupFlags : UInt32
    Default  = 0
    Ipv4Only = 1
    Ipv6Only = 2

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_resolver_name_lookup_flags_get_type
    end
  end

  @[Flags]
  enum ResourceFlags : UInt32
    Compressed = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_resource_flags_get_type
    end
  end

  ResourceLookupFlags = 0

  @[Flags]
  enum SettingsBindFlags : UInt32
    Default       =  0
    Get           =  1
    Set           =  2
    NoSensitivity =  4
    GetNoChanges  =  8
    InvertBoolean = 16

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_settings_bind_flags_get_type
    end
  end

  @[Flags]
  enum SocketMsgFlags : UInt32
    Oob       = 1
    Peek      = 2
    Dontroute = 4

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_socket_msg_flags_get_type
    end
  end

  @[Flags]
  enum SubprocessFlags : UInt32
    StdinPipe     =   1
    StdinInherit  =   2
    StdoutPipe    =   4
    StdoutSilence =   8
    StderrPipe    =  16
    StderrSilence =  32
    StderrMerge   =  64
    InheritFds    = 128

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_subprocess_flags_get_type
    end
  end

  TestDBusFlags = 0

  @[Flags]
  enum TlsCertificateFlags : UInt32
    UnknownCa    =   1
    BadIdentity  =   2
    NotActivated =   4
    Expired      =   8
    Revoked      =  16
    Insecure     =  32
    GenericError =  64
    ValidateAll  = 127

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_tls_certificate_flags_get_type
    end
  end

  TlsDatabaseVerifyFlags = 0

  @[Flags]
  enum TlsPasswordFlags : UInt32
    Retry                 =  2
    ManyTries             =  4
    FinalTry              =  8
    Pkcs11User            = 16
    Pkcs11SecurityOfficer = 32
    Pkcs11ContextSpecific = 64

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_tls_password_flags_get_type
    end
  end

  extend self
end

# Extra includes
