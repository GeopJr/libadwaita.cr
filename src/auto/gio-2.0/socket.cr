require "../g_object-2.0/object"
require "./datagram_based"

require "./initable"

module Gio
  # A #GSocket is a low-level networking primitive. It is a more or less
  # direct mapping of the BSD socket API in a portable GObject based API.
  # It supports both the UNIX socket implementations and winsock2 on Windows.
  #
  # #GSocket is the platform independent base upon which the higher level
  # network primitives are based. Applications are not typically meant to
  # use it directly, but rather through classes like #GSocketClient,
  # #GSocketService and #GSocketConnection. However there may be cases where
  # direct use of #GSocket is useful.
  #
  # #GSocket implements the #GInitable interface, so if it is manually constructed
  # by e.g. g_object_new() you must call g_initable_init() and check the
  # results before using the object. This is done automatically in
  # g_socket_new() and g_socket_new_from_fd(), so these functions can return
  # %NULL.
  #
  # Sockets operate in two general modes, blocking or non-blocking. When
  # in blocking mode all operations (which don’t take an explicit blocking
  # parameter) block until the requested operation
  # is finished or there is an error. In non-blocking mode all calls that
  # would block return immediately with a %G_IO_ERROR_WOULD_BLOCK error.
  # To know when a call would successfully run you can call g_socket_condition_check(),
  # or g_socket_condition_wait(). You can also use g_socket_create_source() and
  # attach it to a #GMainContext to get callbacks when I/O is possible.
  # Note that all sockets are always set to non blocking mode in the system, and
  # blocking mode is emulated in GSocket.
  #
  # When working in non-blocking mode applications should always be able to
  # handle getting a %G_IO_ERROR_WOULD_BLOCK error even when some other
  # function said that I/O was possible. This can easily happen in case
  # of a race condition in the application, but it can also happen for other
  # reasons. For instance, on Windows a socket is always seen as writable
  # until a write returns %G_IO_ERROR_WOULD_BLOCK.
  #
  # #GSockets can be either connection oriented or datagram based.
  # For connection oriented types you must first establish a connection by
  # either connecting to an address or accepting a connection from another
  # address. For connectionless socket types the target/source address is
  # specified or received in each I/O operation.
  #
  # All socket file descriptors are set to be close-on-exec.
  #
  # Note that creating a #GSocket causes the signal %SIGPIPE to be
  # ignored for the remainder of the program. If you are writing a
  # command-line utility that uses #GSocket, you may need to take into
  # account the fact that your program will not automatically be killed
  # if it tries to write to %stdout after it has been closed.
  #
  # Like most other APIs in GLib, #GSocket is not inherently thread safe. To use
  # a #GSocket concurrently from multiple threads, you must implement your own
  # locking.
  class Socket < GObject::Object
    include DatagramBased
    include Initable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, blocking : Bool? = nil, broadcast : Bool? = nil, family : Gio::SocketFamily? = nil, fd : Int32? = nil, keepalive : Bool? = nil, listen_backlog : Int32? = nil, local_address : Gio::SocketAddress? = nil, multicast_loopback : Bool? = nil, multicast_ttl : UInt32? = nil, protocol : Gio::SocketProtocol? = nil, remote_address : Gio::SocketAddress? = nil, timeout : UInt32? = nil, ttl : UInt32? = nil, type : Gio::SocketType? = nil)
      _names = uninitialized Pointer(LibC::Char)[14]
      _values = StaticArray(LibGObject::Value, 14).new(LibGObject::Value.new)
      _n = 0

      if blocking
        (_names.to_unsafe + _n).value = "blocking".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, blocking)
        _n += 1
      end
      if broadcast
        (_names.to_unsafe + _n).value = "broadcast".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, broadcast)
        _n += 1
      end
      if family
        (_names.to_unsafe + _n).value = "family".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, family)
        _n += 1
      end
      if fd
        (_names.to_unsafe + _n).value = "fd".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fd)
        _n += 1
      end
      if keepalive
        (_names.to_unsafe + _n).value = "keepalive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, keepalive)
        _n += 1
      end
      if listen_backlog
        (_names.to_unsafe + _n).value = "listen-backlog".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, listen_backlog)
        _n += 1
      end
      if local_address
        (_names.to_unsafe + _n).value = "local-address".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, local_address)
        _n += 1
      end
      if multicast_loopback
        (_names.to_unsafe + _n).value = "multicast-loopback".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, multicast_loopback)
        _n += 1
      end
      if multicast_ttl
        (_names.to_unsafe + _n).value = "multicast-ttl".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, multicast_ttl)
        _n += 1
      end
      if protocol
        (_names.to_unsafe + _n).value = "protocol".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, protocol)
        _n += 1
      end
      if remote_address
        (_names.to_unsafe + _n).value = "remote-address".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, remote_address)
        _n += 1
      end
      if timeout
        (_names.to_unsafe + _n).value = "timeout".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, timeout)
        _n += 1
      end
      if ttl
        (_names.to_unsafe + _n).value = "ttl".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ttl)
        _n += 1
      end
      if type
        (_names.to_unsafe + _n).value = "type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, type)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Socket.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_socket_get_type
    end

    def blocking=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "blocking", unsafe_value, Pointer(Void).null)
      value
    end

    def blocking? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "blocking", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def broadcast=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "broadcast", unsafe_value, Pointer(Void).null)
      value
    end

    def broadcast? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "broadcast", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def family=(value : Gio::SocketFamily) : Gio::SocketFamily
      unsafe_value = value

      LibGObject.g_object_set(self, "family", unsafe_value, Pointer(Void).null)
      value
    end

    def family : Gio::SocketFamily
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "family", pointerof(value), Pointer(Void).null)
      Gio::SocketFamily.from_value(value)
    end

    def fd=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "fd", unsafe_value, Pointer(Void).null)
      value
    end

    def fd : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "fd", pointerof(value), Pointer(Void).null)
      value
    end

    def keepalive=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "keepalive", unsafe_value, Pointer(Void).null)
      value
    end

    def keepalive? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "keepalive", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def listen_backlog=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "listen-backlog", unsafe_value, Pointer(Void).null)
      value
    end

    def listen_backlog : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "listen-backlog", pointerof(value), Pointer(Void).null)
      value
    end

    def local_address : Gio::SocketAddress?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "local-address", pointerof(value), Pointer(Void).null)
      Gio::SocketAddress.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def multicast_loopback=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "multicast-loopback", unsafe_value, Pointer(Void).null)
      value
    end

    def multicast_loopback? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "multicast-loopback", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def multicast_ttl=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "multicast-ttl", unsafe_value, Pointer(Void).null)
      value
    end

    def multicast_ttl : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "multicast-ttl", pointerof(value), Pointer(Void).null)
      value
    end

    def protocol=(value : Gio::SocketProtocol) : Gio::SocketProtocol
      unsafe_value = value

      LibGObject.g_object_set(self, "protocol", unsafe_value, Pointer(Void).null)
      value
    end

    def protocol : Gio::SocketProtocol
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "protocol", pointerof(value), Pointer(Void).null)
      Gio::SocketProtocol.from_value(value)
    end

    def remote_address : Gio::SocketAddress?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "remote-address", pointerof(value), Pointer(Void).null)
      Gio::SocketAddress.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def timeout=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "timeout", unsafe_value, Pointer(Void).null)
      value
    end

    def timeout : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "timeout", pointerof(value), Pointer(Void).null)
      value
    end

    def ttl=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "ttl", unsafe_value, Pointer(Void).null)
      value
    end

    def ttl : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "ttl", pointerof(value), Pointer(Void).null)
      value
    end

    def type=(value : Gio::SocketType) : Gio::SocketType
      unsafe_value = value

      LibGObject.g_object_set(self, "type", unsafe_value, Pointer(Void).null)
      value
    end

    def type : Gio::SocketType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "type", pointerof(value), Pointer(Void).null)
      Gio::SocketType.from_value(value)
    end

    def initialize(family : Gio::SocketFamily, type : Gio::SocketType, protocol : Gio::SocketProtocol)
      # g_socket_new: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_new(family, type, protocol, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      @pointer = _retval
    end

    def self.new_from_fd(fd : Int32) : self
      # g_socket_new_from_fd: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_new_from_fd(fd, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      Gio::Socket.new(_retval, GICrystal::Transfer::Full)
    end

    def accept(cancellable : Gio::Cancellable?) : Gio::Socket
      # g_socket_accept: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_accept(self, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      Gio::Socket.new(_retval, GICrystal::Transfer::Full)
    end

    def bind(address : Gio::SocketAddress, allow_reuse : Bool) : Bool
      # g_socket_bind: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_bind(self, address, allow_reuse, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def check_connect_result : Bool
      # g_socket_check_connect_result: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_check_connect_result(self, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def close : Bool
      # g_socket_close: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_close(self, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def condition_check(condition : GLib::IOCondition) : GLib::IOCondition
      # g_socket_condition_check: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_condition_check(self, condition)

      # Return value handling
      GLib::IOCondition.from_value(_retval)
    end

    def condition_timed_wait(condition : GLib::IOCondition, timeout_us : Int64, cancellable : Gio::Cancellable?) : Bool
      # g_socket_condition_timed_wait: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_condition_timed_wait(self, condition, timeout_us, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def condition_wait(condition : GLib::IOCondition, cancellable : Gio::Cancellable?) : Bool
      # g_socket_condition_wait: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_condition_wait(self, condition, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def connect(address : Gio::SocketAddress, cancellable : Gio::Cancellable?) : Bool
      # g_socket_connect: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_connect(self, address, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def connection_factory_create_connection : Gio::SocketConnection
      # g_socket_connection_factory_create_connection: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_connection_factory_create_connection(self)

      # Return value handling
      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    def available_bytes : Int64
      # g_socket_get_available_bytes: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_get_available_bytes(self)

      # Return value handling
      _retval
    end

    def blocking : Bool
      # g_socket_get_blocking: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_get_blocking(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def broadcast : Bool
      # g_socket_get_broadcast: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_get_broadcast(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def credentials : Gio::Credentials
      # g_socket_get_credentials: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_get_credentials(self, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      Gio::Credentials.new(_retval, GICrystal::Transfer::Full)
    end

    def family : Gio::SocketFamily
      # g_socket_get_family: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_get_family(self)

      # Return value handling
      Gio::SocketFamily.from_value(_retval)
    end

    def fd : Int32
      # g_socket_get_fd: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_get_fd(self)

      # Return value handling
      _retval
    end

    def keepalive : Bool
      # g_socket_get_keepalive: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_get_keepalive(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def listen_backlog : Int32
      # g_socket_get_listen_backlog: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_get_listen_backlog(self)

      # Return value handling
      _retval
    end

    def local_address : Gio::SocketAddress
      # g_socket_get_local_address: (Method | Getter | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_get_local_address(self, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      Gio::SocketAddress.new(_retval, GICrystal::Transfer::Full)
    end

    def multicast_loopback : Bool
      # g_socket_get_multicast_loopback: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_get_multicast_loopback(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def multicast_ttl : UInt32
      # g_socket_get_multicast_ttl: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_get_multicast_ttl(self)

      # Return value handling
      _retval
    end

    def option(level : Int32, optname : Int32, value : Int32) : Bool
      # g_socket_get_option: (Method | Throws)
      # @value: (out) (transfer full)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_get_option(self, level, optname, value, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def protocol : Gio::SocketProtocol
      # g_socket_get_protocol: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_get_protocol(self)

      # Return value handling
      Gio::SocketProtocol.from_value(_retval)
    end

    def remote_address : Gio::SocketAddress
      # g_socket_get_remote_address: (Method | Getter | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_get_remote_address(self, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      Gio::SocketAddress.new(_retval, GICrystal::Transfer::Full)
    end

    def socket_type : Gio::SocketType
      # g_socket_get_socket_type: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_get_socket_type(self)

      # Return value handling
      Gio::SocketType.from_value(_retval)
    end

    def timeout : UInt32
      # g_socket_get_timeout: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_get_timeout(self)

      # Return value handling
      _retval
    end

    def ttl : UInt32
      # g_socket_get_ttl: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_get_ttl(self)

      # Return value handling
      _retval
    end

    def is_closed : Bool
      # g_socket_is_closed: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_is_closed(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def is_connected : Bool
      # g_socket_is_connected: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_is_connected(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def join_multicast_group(group : Gio::InetAddress, source_specific : Bool, iface : ::String?) : Bool
      # g_socket_join_multicast_group: (Method | Throws)
      # @iface: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      iface = if iface.nil?
                Pointer(LibC::Char).null
              else
                iface.to_unsafe
              end

      # C call
      _retval = LibGio.g_socket_join_multicast_group(self, group, source_specific, iface, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def join_multicast_group_ssm(group : Gio::InetAddress, source_specific : Gio::InetAddress?, iface : ::String?) : Bool
      # g_socket_join_multicast_group_ssm: (Method | Throws)
      # @source_specific: (nullable)
      # @iface: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      source_specific = if source_specific.nil?
                          Pointer(Void).null
                        else
                          source_specific.to_unsafe
                        end
      iface = if iface.nil?
                Pointer(LibC::Char).null
              else
                iface.to_unsafe
              end

      # C call
      _retval = LibGio.g_socket_join_multicast_group_ssm(self, group, source_specific, iface, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def leave_multicast_group(group : Gio::InetAddress, source_specific : Bool, iface : ::String?) : Bool
      # g_socket_leave_multicast_group: (Method | Throws)
      # @iface: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      iface = if iface.nil?
                Pointer(LibC::Char).null
              else
                iface.to_unsafe
              end

      # C call
      _retval = LibGio.g_socket_leave_multicast_group(self, group, source_specific, iface, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def leave_multicast_group_ssm(group : Gio::InetAddress, source_specific : Gio::InetAddress?, iface : ::String?) : Bool
      # g_socket_leave_multicast_group_ssm: (Method | Throws)
      # @source_specific: (nullable)
      # @iface: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      source_specific = if source_specific.nil?
                          Pointer(Void).null
                        else
                          source_specific.to_unsafe
                        end
      iface = if iface.nil?
                Pointer(LibC::Char).null
              else
                iface.to_unsafe
              end

      # C call
      _retval = LibGio.g_socket_leave_multicast_group_ssm(self, group, source_specific, iface, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def listen : Bool
      # g_socket_listen: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_listen(self, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def receive(buffer : Enumerable(UInt8), cancellable : Gio::Cancellable?) : Int64
      # g_socket_receive: (Method | Throws)
      # @buffer: (out) (caller-allocates) (array length=size element-type UInt8)
      # @size: (out) (transfer full)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      size = buffer.size
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      buffer = buffer.to_a.to_unsafe

      # C call
      _retval = LibGio.g_socket_receive(self, buffer, size, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def receive_from(buffer : Enumerable(UInt8), cancellable : Gio::Cancellable?) : Int64
      # g_socket_receive_from: (Method | Throws)
      # @address: (out) (transfer full) (optional)
      # @buffer: (out) (caller-allocates) (array length=size element-type UInt8)
      # @size: (out) (transfer full)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      size = buffer.size
      address = Pointer(Pointer(Void)).null
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      buffer = buffer.to_a.to_unsafe

      # C call
      _retval = LibGio.g_socket_receive_from(self, address, buffer, size, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def receive_message(vectors : Enumerable(Gio::InputVector), messages : Enumerable(Gio::SocketControlMessage)?, flags : Int32, cancellable : Gio::Cancellable?) : Int64
      # g_socket_receive_message: (Method | Throws)
      # @address: (out) (transfer full) (optional)
      # @vectors: (array length=num_vectors element-type Interface)
      # @messages: (out) (transfer full) (nullable) (optional) (array length=num_messages element-type Interface)
      # @num_messages: (out) (transfer full)
      # @flags: (inout) (transfer full)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      num_vectors = vectors.size
      num_messages = messages.try(&.size) || 0
      address = Pointer(Pointer(Void)).null
      messages = Pointer(Pointer(Pointer(Void))).null
      messages = if messages.nil?
                   Pointer(Pointer(Void)).null
                 else
                   messages.to_a.map(&.to_unsafe).to_unsafe
                 end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      vectors = vectors.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGio.g_socket_receive_message(self, address, vectors, num_vectors, messages, num_messages, flags, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def receive_messages(messages : Enumerable(Gio::InputMessage), flags : Int32, cancellable : Gio::Cancellable?) : Int32
      # g_socket_receive_messages: (Method | Throws)
      # @messages: (array length=num_messages element-type Interface)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      num_messages = messages.size
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      messages = messages.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGio.g_socket_receive_messages(self, messages, num_messages, flags, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def receive_with_blocking(buffer : Enumerable(UInt8), blocking : Bool, cancellable : Gio::Cancellable?) : Int64
      # g_socket_receive_with_blocking: (Method | Throws)
      # @buffer: (out) (caller-allocates) (array length=size element-type UInt8)
      # @size: (out) (transfer full)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      size = buffer.size
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      buffer = buffer.to_a.to_unsafe

      # C call
      _retval = LibGio.g_socket_receive_with_blocking(self, buffer, size, blocking, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def send(buffer : Enumerable(UInt8), cancellable : Gio::Cancellable?) : Int64
      # g_socket_send: (Method | Throws)
      # @buffer: (array length=size element-type UInt8)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      size = buffer.size
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      buffer = buffer.to_a.to_unsafe

      # C call
      _retval = LibGio.g_socket_send(self, buffer, size, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def send_message(address : Gio::SocketAddress?, vectors : Enumerable(Gio::OutputVector), messages : Enumerable(Gio::SocketControlMessage)?, flags : Int32, cancellable : Gio::Cancellable?) : Int64
      # g_socket_send_message: (Method | Throws)
      # @address: (nullable)
      # @vectors: (array length=num_vectors element-type Interface)
      # @messages: (nullable) (array length=num_messages element-type Interface)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      num_vectors = vectors.size
      num_messages = messages.try(&.size) || 0
      address = if address.nil?
                  Pointer(Void).null
                else
                  address.to_unsafe
                end
      messages = if messages.nil?
                   Pointer(Pointer(Void)).null
                 else
                   messages.to_a.map(&.to_unsafe).to_unsafe
                 end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      vectors = vectors.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGio.g_socket_send_message(self, address, vectors, num_vectors, messages, num_messages, flags, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def send_message_with_timeout(address : Gio::SocketAddress?, vectors : Enumerable(Gio::OutputVector), messages : Enumerable(Gio::SocketControlMessage)?, flags : Int32, timeout_us : Int64, cancellable : Gio::Cancellable?) : Gio::PollableReturn
      # g_socket_send_message_with_timeout: (Method | Throws)
      # @address: (nullable)
      # @vectors: (array length=num_vectors element-type Interface)
      # @messages: (nullable) (array length=num_messages element-type Interface)
      # @bytes_written: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      num_vectors = vectors.size
      num_messages = messages.try(&.size) || 0
      bytes_written = Pointer(UInt64).null
      address = if address.nil?
                  Pointer(Void).null
                else
                  address.to_unsafe
                end
      messages = if messages.nil?
                   Pointer(Pointer(Void)).null
                 else
                   messages.to_a.map(&.to_unsafe).to_unsafe
                 end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      vectors = vectors.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGio.g_socket_send_message_with_timeout(self, address, vectors, num_vectors, messages, num_messages, flags, timeout_us, bytes_written, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      Gio::PollableReturn.from_value(_retval)
    end

    def send_messages(messages : Enumerable(Gio::OutputMessage), flags : Int32, cancellable : Gio::Cancellable?) : Int32
      # g_socket_send_messages: (Method | Throws)
      # @messages: (array length=num_messages element-type Interface)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      num_messages = messages.size
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      messages = messages.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGio.g_socket_send_messages(self, messages, num_messages, flags, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def send_to(address : Gio::SocketAddress?, buffer : Enumerable(UInt8), cancellable : Gio::Cancellable?) : Int64
      # g_socket_send_to: (Method | Throws)
      # @address: (nullable)
      # @buffer: (array length=size element-type UInt8)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      size = buffer.size
      address = if address.nil?
                  Pointer(Void).null
                else
                  address.to_unsafe
                end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      buffer = buffer.to_a.to_unsafe

      # C call
      _retval = LibGio.g_socket_send_to(self, address, buffer, size, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def send_with_blocking(buffer : Enumerable(UInt8), blocking : Bool, cancellable : Gio::Cancellable?) : Int64
      # g_socket_send_with_blocking: (Method | Throws)
      # @buffer: (array length=size element-type UInt8)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      size = buffer.size
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      buffer = buffer.to_a.to_unsafe

      # C call
      _retval = LibGio.g_socket_send_with_blocking(self, buffer, size, blocking, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def blocking=(blocking : Bool) : Nil
      # g_socket_set_blocking: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_socket_set_blocking(self, blocking)

      # Return value handling
    end

    def broadcast=(broadcast : Bool) : Nil
      # g_socket_set_broadcast: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_socket_set_broadcast(self, broadcast)

      # Return value handling
    end

    def keepalive=(keepalive : Bool) : Nil
      # g_socket_set_keepalive: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_socket_set_keepalive(self, keepalive)

      # Return value handling
    end

    def listen_backlog=(backlog : Int32) : Nil
      # g_socket_set_listen_backlog: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_socket_set_listen_backlog(self, backlog)

      # Return value handling
    end

    def multicast_loopback=(loopback : Bool) : Nil
      # g_socket_set_multicast_loopback: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_socket_set_multicast_loopback(self, loopback)

      # Return value handling
    end

    def multicast_ttl=(ttl : UInt32) : Nil
      # g_socket_set_multicast_ttl: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_socket_set_multicast_ttl(self, ttl)

      # Return value handling
    end

    def set_option(level : Int32, optname : Int32, value : Int32) : Bool
      # g_socket_set_option: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_set_option(self, level, optname, value, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def timeout=(timeout : UInt32) : Nil
      # g_socket_set_timeout: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_socket_set_timeout(self, timeout)

      # Return value handling
    end

    def ttl=(ttl : UInt32) : Nil
      # g_socket_set_ttl: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_socket_set_ttl(self, ttl)

      # Return value handling
    end

    def shutdown(shutdown_read : Bool, shutdown_write : Bool) : Bool
      # g_socket_shutdown: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_shutdown(self, shutdown_read, shutdown_write, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def speaks_ipv4 : Bool
      # g_socket_speaks_ipv4: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_socket_speaks_ipv4(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end
  end
end
