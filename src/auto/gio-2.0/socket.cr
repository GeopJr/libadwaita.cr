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
  @[GObject::GeneratedWrapper]
  class Socket < GObject::Object
    include DatagramBased
    include Initable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::SocketClass), class_init,
        sizeof(LibGio::Socket), instance_init, 0)
    end

    GICrystal.define_new_method(Socket, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Socket`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, blocking : Bool? = nil, broadcast : Bool? = nil, family : Gio::SocketFamily? = nil, fd : Int32? = nil, keepalive : Bool? = nil, listen_backlog : Int32? = nil, local_address : Gio::SocketAddress? = nil, multicast_loopback : Bool? = nil, multicast_ttl : UInt32? = nil, protocol : Gio::SocketProtocol? = nil, remote_address : Gio::SocketAddress? = nil, timeout : UInt32? = nil, ttl : UInt32? = nil, type : Gio::SocketType? = nil)
      _names = uninitialized Pointer(LibC::Char)[14]
      _values = StaticArray(LibGObject::Value, 14).new(LibGObject::Value.new)
      _n = 0

      if !blocking.nil?
        (_names.to_unsafe + _n).value = "blocking".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, blocking)
        _n += 1
      end
      if !broadcast.nil?
        (_names.to_unsafe + _n).value = "broadcast".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, broadcast)
        _n += 1
      end
      if !family.nil?
        (_names.to_unsafe + _n).value = "family".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, family)
        _n += 1
      end
      if !fd.nil?
        (_names.to_unsafe + _n).value = "fd".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fd)
        _n += 1
      end
      if !keepalive.nil?
        (_names.to_unsafe + _n).value = "keepalive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, keepalive)
        _n += 1
      end
      if !listen_backlog.nil?
        (_names.to_unsafe + _n).value = "listen-backlog".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, listen_backlog)
        _n += 1
      end
      if !local_address.nil?
        (_names.to_unsafe + _n).value = "local-address".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, local_address)
        _n += 1
      end
      if !multicast_loopback.nil?
        (_names.to_unsafe + _n).value = "multicast-loopback".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, multicast_loopback)
        _n += 1
      end
      if !multicast_ttl.nil?
        (_names.to_unsafe + _n).value = "multicast-ttl".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, multicast_ttl)
        _n += 1
      end
      if !protocol.nil?
        (_names.to_unsafe + _n).value = "protocol".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, protocol)
        _n += 1
      end
      if !remote_address.nil?
        (_names.to_unsafe + _n).value = "remote-address".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, remote_address)
        _n += 1
      end
      if !timeout.nil?
        (_names.to_unsafe + _n).value = "timeout".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, timeout)
        _n += 1
      end
      if !ttl.nil?
        (_names.to_unsafe + _n).value = "ttl".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ttl)
        _n += 1
      end
      if !type.nil?
        (_names.to_unsafe + _n).value = "type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, type)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Socket.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      Gio::SocketFamily.new(value)
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
      Gio::SocketProtocol.new(value)
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
      Gio::SocketType.new(value)
    end

    # Creates a new #GSocket with the defined family, type and protocol.
    # If @protocol is 0 (%G_SOCKET_PROTOCOL_DEFAULT) the default protocol type
    # for the family and type is used.
    #
    # The @protocol is a family and type specific int that specifies what
    # kind of protocol to use. #GSocketProtocol lists several common ones.
    # Many families only support one protocol, and use 0 for this, others
    # support several and using 0 means to use the default protocol for
    # the family and type.
    #
    # The protocol id is passed directly to the operating
    # system, so you can use protocols not listed in #GSocketProtocol if you
    # know the protocol number used for it.
    def self.new(family : Gio::SocketFamily, type : Gio::SocketType, protocol : Gio::SocketProtocol) : self
      # g_socket_new: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_socket_new(family, type, protocol, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::Socket.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new #GSocket from a native file descriptor
    # or winsock SOCKET handle.
    #
    # This reads all the settings from the file descriptor so that
    # all properties should work. Note that the file descriptor
    # will be set to non-blocking mode, independent on the blocking
    # mode of the #GSocket.
    #
    # On success, the returned #GSocket takes ownership of @fd. On failure, the
    # caller must close @fd themselves.
    #
    # Since GLib 2.46, it is no longer a fatal error to call this on a non-socket
    # descriptor.  Instead, a GError will be set with code %G_IO_ERROR_FAILED
    def self.new_from_fd(fd : Int32) : self
      # g_socket_new_from_fd: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_socket_new_from_fd(fd, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::Socket.new(_retval, GICrystal::Transfer::Full)
    end

    # Accept incoming connections on a connection-based socket. This removes
    # the first outstanding connection request from the listening socket and
    # creates a #GSocket object for it.
    #
    # The @socket must be bound to a local address with g_socket_bind() and
    # must be listening for incoming connections (g_socket_listen()).
    #
    # If there are no outstanding connections then the operation will block
    # or return %G_IO_ERROR_WOULD_BLOCK if non-blocking I/O is enabled.
    # To be notified of an incoming connection, wait for the %G_IO_IN condition.
    def accept(cancellable : Gio::Cancellable?) : Gio::Socket
      # g_socket_accept: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_accept(@pointer, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::Socket.new(_retval, GICrystal::Transfer::Full)
    end

    # When a socket is created it is attached to an address family, but it
    # doesn't have an address in this family. g_socket_bind() assigns the
    # address (sometimes called name) of the socket.
    #
    # It is generally required to bind to a local address before you can
    # receive connections. (See g_socket_listen() and g_socket_accept() ).
    # In certain situations, you may also want to bind a socket that will be
    # used to initiate connections, though this is not normally required.
    #
    # If @socket is a TCP socket, then @allow_reuse controls the setting
    # of the `SO_REUSEADDR` socket option; normally it should be %TRUE for
    # server sockets (sockets that you will eventually call
    # g_socket_accept() on), and %FALSE for client sockets. (Failing to
    # set this flag on a server socket may cause g_socket_bind() to return
    # %G_IO_ERROR_ADDRESS_IN_USE if the server program is stopped and then
    # immediately restarted.)
    #
    # If @socket is a UDP socket, then @allow_reuse determines whether or
    # not other UDP sockets can be bound to the same address at the same
    # time. In particular, you can have several UDP sockets bound to the
    # same address, and they will all receive all of the multicast and
    # broadcast packets sent to that address. (The behavior of unicast
    # UDP packets to an address with multiple listeners is not defined.)
    def bind(address : Gio::SocketAddress, allow_reuse : Bool) : Bool
      # g_socket_bind: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_socket_bind(@pointer, address, allow_reuse, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks and resets the pending connect error for the socket.
    # This is used to check for errors when g_socket_connect() is
    # used in non-blocking mode.
    def check_connect_result : Bool
      # g_socket_check_connect_result: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_socket_check_connect_result(@pointer, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Closes the socket, shutting down any active connection.
    #
    # Closing a socket does not wait for all outstanding I/O operations
    # to finish, so the caller should not rely on them to be guaranteed
    # to complete even if the close returns with no error.
    #
    # Once the socket is closed, all other operations will return
    # %G_IO_ERROR_CLOSED. Closing a socket multiple times will not
    # return an error.
    #
    # Sockets will be automatically closed when the last reference
    # is dropped, but you might want to call this function to make sure
    # resources are released as early as possible.
    #
    # Beware that due to the way that TCP works, it is possible for
    # recently-sent data to be lost if either you close a socket while the
    # %G_IO_IN condition is set, or else if the remote connection tries to
    # send something to you after you close the socket but before it has
    # finished reading all of the data you sent. There is no easy generic
    # way to avoid this problem; the easiest fix is to design the network
    # protocol such that the client will never send data "out of turn".
    # Another solution is for the server to half-close the connection by
    # calling g_socket_shutdown() with only the @shutdown_write flag set,
    # and then wait for the client to notice this and close its side of the
    # connection, after which the server can safely call g_socket_close().
    # (This is what #GTcpConnection does if you call
    # g_tcp_connection_set_graceful_disconnect(). But of course, this
    # only works if the client will close its connection after the server
    # does.)
    def close : Bool
      # g_socket_close: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_socket_close(@pointer, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks on the readiness of @socket to perform operations.
    # The operations specified in @condition are checked for and masked
    # against the currently-satisfied conditions on @socket. The result
    # is returned.
    #
    # Note that on Windows, it is possible for an operation to return
    # %G_IO_ERROR_WOULD_BLOCK even immediately after
    # g_socket_condition_check() has claimed that the socket is ready for
    # writing. Rather than calling g_socket_condition_check() and then
    # writing to the socket if it succeeds, it is generally better to
    # simply try writing to the socket right away, and try again later if
    # the initial attempt returns %G_IO_ERROR_WOULD_BLOCK.
    #
    # It is meaningless to specify %G_IO_ERR or %G_IO_HUP in condition;
    # these conditions will always be set in the output if they are true.
    #
    # This call never blocks.
    def condition_check(condition : GLib::IOCondition) : GLib::IOCondition
      # g_socket_condition_check: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_condition_check(@pointer, condition)

      # Return value handling

      GLib::IOCondition.new(_retval)
    end

    # Waits for up to @timeout_us microseconds for @condition to become true
    # on @socket. If the condition is met, %TRUE is returned.
    #
    # If @cancellable is cancelled before the condition is met, or if
    # @timeout_us (or the socket's #GSocket:timeout) is reached before the
    # condition is met, then %FALSE is returned and @error, if non-%NULL,
    # is set to the appropriate value (%G_IO_ERROR_CANCELLED or
    # %G_IO_ERROR_TIMED_OUT).
    #
    # If you don't want a timeout, use g_socket_condition_wait().
    # (Alternatively, you can pass -1 for @timeout_us.)
    #
    # Note that although @timeout_us is in microseconds for consistency with
    # other GLib APIs, this function actually only has millisecond
    # resolution, and the behavior is undefined if @timeout_us is not an
    # exact number of milliseconds.
    def condition_timed_wait(condition : GLib::IOCondition, timeout_us : Int64, cancellable : Gio::Cancellable?) : Bool
      # g_socket_condition_timed_wait: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_condition_timed_wait(@pointer, condition, timeout_us, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Waits for @condition to become true on @socket. When the condition
    # is met, %TRUE is returned.
    #
    # If @cancellable is cancelled before the condition is met, or if the
    # socket has a timeout set and it is reached before the condition is
    # met, then %FALSE is returned and @error, if non-%NULL, is set to
    # the appropriate value (%G_IO_ERROR_CANCELLED or
    # %G_IO_ERROR_TIMED_OUT).
    #
    # See also g_socket_condition_timed_wait().
    def condition_wait(condition : GLib::IOCondition, cancellable : Gio::Cancellable?) : Bool
      # g_socket_condition_wait: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_condition_wait(@pointer, condition, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Connect the socket to the specified remote address.
    #
    # For connection oriented socket this generally means we attempt to make
    # a connection to the @address. For a connection-less socket it sets
    # the default address for g_socket_send() and discards all incoming datagrams
    # from other sources.
    #
    # Generally connection oriented sockets can only connect once, but
    # connection-less sockets can connect multiple times to change the
    # default address.
    #
    # If the connect call needs to do network I/O it will block, unless
    # non-blocking I/O is enabled. Then %G_IO_ERROR_PENDING is returned
    # and the user can be notified of the connection finishing by waiting
    # for the G_IO_OUT condition. The result of the connection must then be
    # checked with g_socket_check_connect_result().
    def connect(address : Gio::SocketAddress, cancellable : Gio::Cancellable?) : Bool
      # g_socket_connect: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_connect(@pointer, address, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Creates a #GSocketConnection subclass of the right type for
    # @socket.
    def connection_factory_create_connection : Gio::SocketConnection
      # g_socket_connection_factory_create_connection: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_socket_connection_factory_create_connection(@pointer)

      # Return value handling

      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    # Get the amount of data pending in the OS input buffer, without blocking.
    #
    # If @socket is a UDP or SCTP socket, this will return the size of
    # just the next packet, even if additional packets are buffered after
    # that one.
    #
    # Note that on Windows, this function is rather inefficient in the
    # UDP case, and so if you know any plausible upper bound on the size
    # of the incoming packet, it is better to just do a
    # g_socket_receive() with a buffer of that size, rather than calling
    # g_socket_get_available_bytes() first and then doing a receive of
    # exactly the right size.
    def available_bytes : Int64
      # g_socket_get_available_bytes: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_get_available_bytes(@pointer)

      # Return value handling

      _retval
    end

    # Gets the blocking mode of the socket. For details on blocking I/O,
    # see g_socket_set_blocking().
    def blocking : Bool
      # g_socket_get_blocking: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_get_blocking(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the broadcast setting on @socket; if %TRUE,
    # it is possible to send packets to broadcast
    # addresses.
    def broadcast : Bool
      # g_socket_get_broadcast: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_get_broadcast(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the credentials of the foreign process connected to this
    # socket, if any (e.g. it is only supported for %G_SOCKET_FAMILY_UNIX
    # sockets).
    #
    # If this operation isn't supported on the OS, the method fails with
    # the %G_IO_ERROR_NOT_SUPPORTED error. On Linux this is implemented
    # by reading the %SO_PEERCRED option on the underlying socket.
    #
    # This method can be expected to be available on the following platforms:
    #
    # - Linux since GLib 2.26
    # - OpenBSD since GLib 2.30
    # - Solaris, Illumos and OpenSolaris since GLib 2.40
    # - NetBSD since GLib 2.42
    # - macOS, tvOS, iOS since GLib 2.66
    #
    # Other ways to obtain credentials from a foreign peer includes the
    # #GUnixCredentialsMessage type and
    # g_unix_connection_send_credentials() /
    # g_unix_connection_receive_credentials() functions.
    def credentials : Gio::Credentials
      # g_socket_get_credentials: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_socket_get_credentials(@pointer, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::Credentials.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the socket family of the socket.
    def family : Gio::SocketFamily
      # g_socket_get_family: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_get_family(@pointer)

      # Return value handling

      Gio::SocketFamily.new(_retval)
    end

    # Returns the underlying OS socket object. On unix this
    # is a socket file descriptor, and on Windows this is
    # a Winsock2 SOCKET handle. This may be useful for
    # doing platform specific or otherwise unusual operations
    # on the socket.
    def fd : Int32
      # g_socket_get_fd: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_get_fd(@pointer)

      # Return value handling

      _retval
    end

    # Gets the keepalive mode of the socket. For details on this,
    # see g_socket_set_keepalive().
    def keepalive : Bool
      # g_socket_get_keepalive: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_get_keepalive(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the listen backlog setting of the socket. For details on this,
    # see g_socket_set_listen_backlog().
    def listen_backlog : Int32
      # g_socket_get_listen_backlog: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_get_listen_backlog(@pointer)

      # Return value handling

      _retval
    end

    # Try to get the local address of a bound socket. This is only
    # useful if the socket has been bound to a local address,
    # either explicitly or implicitly when connecting.
    def local_address : Gio::SocketAddress
      # g_socket_get_local_address: (Method | Getter | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_socket_get_local_address(@pointer, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::SocketAddress.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the multicast loopback setting on @socket; if %TRUE (the
    # default), outgoing multicast packets will be looped back to
    # multicast listeners on the same host.
    def multicast_loopback : Bool
      # g_socket_get_multicast_loopback: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_get_multicast_loopback(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the multicast time-to-live setting on @socket; see
    # g_socket_set_multicast_ttl() for more details.
    def multicast_ttl : UInt32
      # g_socket_get_multicast_ttl: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_get_multicast_ttl(@pointer)

      # Return value handling

      _retval
    end

    # Gets the value of an integer-valued option on @socket, as with
    # getsockopt(). (If you need to fetch a  non-integer-valued option,
    # you will need to call getsockopt() directly.)
    #
    # The [<gio/gnetworking.h>][gio-gnetworking.h]
    # header pulls in system headers that will define most of the
    # standard/portable socket options. For unusual socket protocols or
    # platform-dependent options, you may need to include additional
    # headers.
    #
    # Note that even for socket options that are a single byte in size,
    # @value is still a pointer to a #gint variable, not a #guchar;
    # g_socket_get_option() will handle the conversion internally.
    def option(level : Int32, optname : Int32, value : Int32) : Bool
      # g_socket_get_option: (Method | Throws)
      # @value: (out) (transfer full)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_socket_get_option(@pointer, level, optname, value, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the socket protocol id the socket was created with.
    # In case the protocol is unknown, -1 is returned.
    def protocol : Gio::SocketProtocol
      # g_socket_get_protocol: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_get_protocol(@pointer)

      # Return value handling

      Gio::SocketProtocol.new(_retval)
    end

    # Try to get the remote address of a connected socket. This is only
    # useful for connection oriented sockets that have been connected.
    def remote_address : Gio::SocketAddress
      # g_socket_get_remote_address: (Method | Getter | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_socket_get_remote_address(@pointer, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::SocketAddress.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the socket type of the socket.
    def socket_type : Gio::SocketType
      # g_socket_get_socket_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_get_socket_type(@pointer)

      # Return value handling

      Gio::SocketType.new(_retval)
    end

    # Gets the timeout setting of the socket. For details on this, see
    # g_socket_set_timeout().
    def timeout : UInt32
      # g_socket_get_timeout: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_get_timeout(@pointer)

      # Return value handling

      _retval
    end

    # Gets the unicast time-to-live setting on @socket; see
    # g_socket_set_ttl() for more details.
    def ttl : UInt32
      # g_socket_get_ttl: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_get_ttl(@pointer)

      # Return value handling

      _retval
    end

    # Checks whether a socket is closed.
    def is_closed : Bool
      # g_socket_is_closed: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_is_closed(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Check whether the socket is connected. This is only useful for
    # connection-oriented sockets.
    #
    # If using g_socket_shutdown(), this function will return %TRUE until the
    # socket has been shut down for reading and writing. If you do a non-blocking
    # connect, this function will not return %TRUE until after you call
    # g_socket_check_connect_result().
    def is_connected : Bool
      # g_socket_is_connected: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_is_connected(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Registers @socket to receive multicast messages sent to @group.
    # @socket must be a %G_SOCKET_TYPE_DATAGRAM socket, and must have
    # been bound to an appropriate interface and port with
    # g_socket_bind().
    #
    # If @iface is %NULL, the system will automatically pick an interface
    # to bind to based on @group.
    #
    # If @source_specific is %TRUE, source-specific multicast as defined
    # in RFC 4604 is used. Note that on older platforms this may fail
    # with a %G_IO_ERROR_NOT_SUPPORTED error.
    #
    # To bind to a given source-specific multicast address, use
    # g_socket_join_multicast_group_ssm() instead.
    def join_multicast_group(group : Gio::InetAddress, source_specific : Bool, iface : ::String?) : Bool
      # g_socket_join_multicast_group: (Method | Throws)
      # @iface: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      iface = if iface.nil?
                Pointer(LibC::Char).null
              else
                iface.to_unsafe
              end

      # C call
      _retval = LibGio.g_socket_join_multicast_group(@pointer, group, source_specific, iface, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Registers @socket to receive multicast messages sent to @group.
    # @socket must be a %G_SOCKET_TYPE_DATAGRAM socket, and must have
    # been bound to an appropriate interface and port with
    # g_socket_bind().
    #
    # If @iface is %NULL, the system will automatically pick an interface
    # to bind to based on @group.
    #
    # If @source_specific is not %NULL, use source-specific multicast as
    # defined in RFC 4604. Note that on older platforms this may fail
    # with a %G_IO_ERROR_NOT_SUPPORTED error.
    #
    # Note that this function can be called multiple times for the same
    # @group with different @source_specific in order to receive multicast
    # packets from more than one source.
    def join_multicast_group_ssm(group : Gio::InetAddress, source_specific : Gio::InetAddress?, iface : ::String?) : Bool
      # g_socket_join_multicast_group_ssm: (Method | Throws)
      # @source_specific: (nullable)
      # @iface: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      source_specific = if source_specific.nil?
                          Pointer(Void).null
                        else
                          source_specific.to_unsafe
                        end
      # Generator::NullableArrayPlan
      iface = if iface.nil?
                Pointer(LibC::Char).null
              else
                iface.to_unsafe
              end

      # C call
      _retval = LibGio.g_socket_join_multicast_group_ssm(@pointer, group, source_specific, iface, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Removes @socket from the multicast group defined by @group, @iface,
    # and @source_specific (which must all have the same values they had
    # when you joined the group).
    #
    # @socket remains bound to its address and port, and can still receive
    # unicast messages after calling this.
    #
    # To unbind to a given source-specific multicast address, use
    # g_socket_leave_multicast_group_ssm() instead.
    def leave_multicast_group(group : Gio::InetAddress, source_specific : Bool, iface : ::String?) : Bool
      # g_socket_leave_multicast_group: (Method | Throws)
      # @iface: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      iface = if iface.nil?
                Pointer(LibC::Char).null
              else
                iface.to_unsafe
              end

      # C call
      _retval = LibGio.g_socket_leave_multicast_group(@pointer, group, source_specific, iface, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Removes @socket from the multicast group defined by @group, @iface,
    # and @source_specific (which must all have the same values they had
    # when you joined the group).
    #
    # @socket remains bound to its address and port, and can still receive
    # unicast messages after calling this.
    def leave_multicast_group_ssm(group : Gio::InetAddress, source_specific : Gio::InetAddress?, iface : ::String?) : Bool
      # g_socket_leave_multicast_group_ssm: (Method | Throws)
      # @source_specific: (nullable)
      # @iface: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      source_specific = if source_specific.nil?
                          Pointer(Void).null
                        else
                          source_specific.to_unsafe
                        end
      # Generator::NullableArrayPlan
      iface = if iface.nil?
                Pointer(LibC::Char).null
              else
                iface.to_unsafe
              end

      # C call
      _retval = LibGio.g_socket_leave_multicast_group_ssm(@pointer, group, source_specific, iface, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Marks the socket as a server socket, i.e. a socket that is used
    # to accept incoming requests using g_socket_accept().
    #
    # Before calling this the socket must be bound to a local address using
    # g_socket_bind().
    #
    # To set the maximum amount of outstanding clients, use
    # g_socket_set_listen_backlog().
    def listen : Bool
      # g_socket_listen: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_socket_listen(@pointer, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Receive data (up to @size bytes) from a socket. This is mainly used by
    # connection-oriented sockets; it is identical to g_socket_receive_from()
    # with @address set to %NULL.
    #
    # For %G_SOCKET_TYPE_DATAGRAM and %G_SOCKET_TYPE_SEQPACKET sockets,
    # g_socket_receive() will always read either 0 or 1 complete messages from
    # the socket. If the received message is too large to fit in @buffer, then
    # the data beyond @size bytes will be discarded, without any explicit
    # indication that this has occurred.
    #
    # For %G_SOCKET_TYPE_STREAM sockets, g_socket_receive() can return any
    # number of bytes, up to @size. If more than @size bytes have been
    # received, the additional data will be returned in future calls to
    # g_socket_receive().
    #
    # If the socket is in blocking mode the call will block until there
    # is some data to receive, the connection is closed, or there is an
    # error. If there is no data available and the socket is in
    # non-blocking mode, a %G_IO_ERROR_WOULD_BLOCK error will be
    # returned. To be notified when data is available, wait for the
    # %G_IO_IN condition.
    #
    # On error -1 is returned and @error is set accordingly.
    def receive(buffer : Enumerable(UInt8), cancellable : Gio::Cancellable?) : Int64
      # g_socket_receive: (Method | Throws)
      # @buffer: (out) (caller-allocates) (array length=size element-type UInt8)
      # @size: (out) (transfer full)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayLengthArgPlan
      size = buffer.size # Generator::ArrayArgPlan
      buffer = buffer.to_a.to_unsafe
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_receive(@pointer, buffer, size, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Receive data (up to @size bytes) from a socket.
    #
    # If @address is non-%NULL then @address will be set equal to the
    # source address of the received packet.
    # @address is owned by the caller.
    #
    # See g_socket_receive() for additional information.
    def receive_from(buffer : Enumerable(UInt8), cancellable : Gio::Cancellable?) : Int64
      # g_socket_receive_from: (Method | Throws)
      # @address: (out) (transfer full) (optional)
      # @buffer: (out) (caller-allocates) (array length=size element-type UInt8)
      # @size: (out) (transfer full)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      address = Pointer(Pointer(Void)).null # Generator::ArrayLengthArgPlan
      size = buffer.size                    # Generator::ArrayArgPlan
      buffer = buffer.to_a.to_unsafe
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_receive_from(@pointer, address, buffer, size, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Receive data from a socket.  For receiving multiple messages, see
    # g_socket_receive_messages(); for easier use, see
    # g_socket_receive() and g_socket_receive_from().
    #
    # If @address is non-%NULL then @address will be set equal to the
    # source address of the received packet.
    # @address is owned by the caller.
    #
    # @vector must point to an array of #GInputVector structs and
    # @num_vectors must be the length of this array.  These structs
    # describe the buffers that received data will be scattered into.
    # If @num_vectors is -1, then @vectors is assumed to be terminated
    # by a #GInputVector with a %NULL buffer pointer.
    #
    # As a special case, if @num_vectors is 0 (in which case, @vectors
    # may of course be %NULL), then a single byte is received and
    # discarded. This is to facilitate the common practice of sending a
    # single '\0' byte for the purposes of transferring ancillary data.
    #
    # @messages, if non-%NULL, will be set to point to a newly-allocated
    # array of #GSocketControlMessage instances or %NULL if no such
    # messages was received. These correspond to the control messages
    # received from the kernel, one #GSocketControlMessage per message
    # from the kernel. This array is %NULL-terminated and must be freed
    # by the caller using g_free() after calling g_object_unref() on each
    # element. If @messages is %NULL, any control messages received will
    # be discarded.
    #
    # @num_messages, if non-%NULL, will be set to the number of control
    # messages received.
    #
    # If both @messages and @num_messages are non-%NULL, then
    # @num_messages gives the number of #GSocketControlMessage instances
    # in @messages (ie: not including the %NULL terminator).
    #
    # @flags is an in/out parameter. The commonly available arguments
    # for this are available in the #GSocketMsgFlags enum, but the
    # values there are the same as the system values, and the flags
    # are passed in as-is, so you can pass in system-specific flags too
    # (and g_socket_receive_message() may pass system-specific flags out).
    # Flags passed in to the parameter affect the receive operation; flags returned
    # out of it are relevant to the specific returned message.
    #
    # As with g_socket_receive(), data may be discarded if @socket is
    # %G_SOCKET_TYPE_DATAGRAM or %G_SOCKET_TYPE_SEQPACKET and you do not
    # provide enough buffer space to read a complete message. You can pass
    # %G_SOCKET_MSG_PEEK in @flags to peek at the current message without
    # removing it from the receive queue, but there is no portable way to find
    # out the length of the message other than by reading it into a
    # sufficiently-large buffer.
    #
    # If the socket is in blocking mode the call will block until there
    # is some data to receive, the connection is closed, or there is an
    # error. If there is no data available and the socket is in
    # non-blocking mode, a %G_IO_ERROR_WOULD_BLOCK error will be
    # returned. To be notified when data is available, wait for the
    # %G_IO_IN condition.
    #
    # On error -1 is returned and @error is set accordingly.
    def receive_message(vectors : Enumerable(Gio::InputVector), flags : Int32, cancellable : Gio::Cancellable?) : Int64
      # g_socket_receive_message: (Method | Throws)
      # @address: (out) (transfer full) (optional)
      # @vectors: (array length=num_vectors element-type Interface)
      # @messages: (out) (transfer full) (nullable) (optional) (array length=num_messages element-type Interface)
      # @num_messages: (out) (transfer full)
      # @flags: (inout) (transfer full)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      address = Pointer(Pointer(Void)).null # Generator::ArrayLengthArgPlan
      num_vectors = vectors.size            # Generator::ArrayArgPlan
      vectors = vectors.to_a.map(&.to_unsafe).to_unsafe
      # Generator::ArrayLengthArgPlan
      num_messages = messages.try(&.size) || 0        # Generator::OutArgUsedInReturnPlan
      messages = Pointer(Pointer(Pointer(Void))).null # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_receive_message(@pointer, address, vectors, num_vectors, messages, num_messages, flags, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Receive multiple data messages from @socket in one go.  This is the most
    # complicated and fully-featured version of this call. For easier use, see
    # g_socket_receive(), g_socket_receive_from(), and g_socket_receive_message().
    #
    # @messages must point to an array of #GInputMessage structs and
    # @num_messages must be the length of this array. Each #GInputMessage
    # contains a pointer to an array of #GInputVector structs describing the
    # buffers that the data received in each message will be written to. Using
    # multiple #GInputVectors is more memory-efficient than manually copying data
    # out of a single buffer to multiple sources, and more system-call-efficient
    # than making multiple calls to g_socket_receive(), such as in scenarios where
    # a lot of data packets need to be received (e.g. high-bandwidth video
    # streaming over RTP/UDP).
    #
    # @flags modify how all messages are received. The commonly available
    # arguments for this are available in the #GSocketMsgFlags enum, but the
    # values there are the same as the system values, and the flags
    # are passed in as-is, so you can pass in system-specific flags too. These
    # flags affect the overall receive operation. Flags affecting individual
    # messages are returned in #GInputMessage.flags.
    #
    # The other members of #GInputMessage are treated as described in its
    # documentation.
    #
    # If #GSocket:blocking is %TRUE the call will block until @num_messages have
    # been received, or the end of the stream is reached.
    #
    # If #GSocket:blocking is %FALSE the call will return up to @num_messages
    # without blocking, or %G_IO_ERROR_WOULD_BLOCK if no messages are queued in the
    # operating system to be received.
    #
    # In blocking mode, if #GSocket:timeout is positive and is reached before any
    # messages are received, %G_IO_ERROR_TIMED_OUT is returned, otherwise up to
    # @num_messages are returned. (Note: This is effectively the
    # behaviour of `MSG_WAITFORONE` with recvmmsg().)
    #
    # To be notified when messages are available, wait for the
    # %G_IO_IN condition. Note though that you may still receive
    # %G_IO_ERROR_WOULD_BLOCK from g_socket_receive_messages() even if you were
    # previously notified of a %G_IO_IN condition.
    #
    # If the remote peer closes the connection, any messages queued in the
    # operating system will be returned, and subsequent calls to
    # g_socket_receive_messages() will return 0 (with no error set).
    #
    # On error -1 is returned and @error is set accordingly. An error will only
    # be returned if zero messages could be received; otherwise the number of
    # messages successfully received before the error will be returned.
    def receive_messages(messages : Enumerable(Gio::InputMessage), flags : Int32, cancellable : Gio::Cancellable?) : Int32
      # g_socket_receive_messages: (Method | Throws)
      # @messages: (array length=num_messages element-type Interface)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayLengthArgPlan
      num_messages = messages.size # Generator::ArrayArgPlan
      messages = messages.to_a.map(&.to_unsafe).to_unsafe
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_receive_messages(@pointer, messages, num_messages, flags, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # This behaves exactly the same as g_socket_receive(), except that
    # the choice of blocking or non-blocking behavior is determined by
    # the @blocking argument rather than by @socket's properties.
    def receive_with_blocking(buffer : Enumerable(UInt8), blocking : Bool, cancellable : Gio::Cancellable?) : Int64
      # g_socket_receive_with_blocking: (Method | Throws)
      # @buffer: (out) (caller-allocates) (array length=size element-type UInt8)
      # @size: (out) (transfer full)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayLengthArgPlan
      size = buffer.size # Generator::ArrayArgPlan
      buffer = buffer.to_a.to_unsafe
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_receive_with_blocking(@pointer, buffer, size, blocking, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Tries to send @size bytes from @buffer on the socket. This is
    # mainly used by connection-oriented sockets; it is identical to
    # g_socket_send_to() with @address set to %NULL.
    #
    # If the socket is in blocking mode the call will block until there is
    # space for the data in the socket queue. If there is no space available
    # and the socket is in non-blocking mode a %G_IO_ERROR_WOULD_BLOCK error
    # will be returned. To be notified when space is available, wait for the
    # %G_IO_OUT condition. Note though that you may still receive
    # %G_IO_ERROR_WOULD_BLOCK from g_socket_send() even if you were previously
    # notified of a %G_IO_OUT condition. (On Windows in particular, this is
    # very common due to the way the underlying APIs work.)
    #
    # On error -1 is returned and @error is set accordingly.
    def send(buffer : Enumerable(UInt8), cancellable : Gio::Cancellable?) : Int64
      # g_socket_send: (Method | Throws)
      # @buffer: (array length=size element-type UInt8)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayLengthArgPlan
      size = buffer.size # Generator::ArrayArgPlan
      buffer = buffer.to_a.to_unsafe
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_send(@pointer, buffer, size, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Send data to @address on @socket.  For sending multiple messages see
    # g_socket_send_messages(); for easier use, see
    # g_socket_send() and g_socket_send_to().
    #
    # If @address is %NULL then the message is sent to the default receiver
    # (set by g_socket_connect()).
    #
    # @vectors must point to an array of #GOutputVector structs and
    # @num_vectors must be the length of this array. (If @num_vectors is -1,
    # then @vectors is assumed to be terminated by a #GOutputVector with a
    # %NULL buffer pointer.) The #GOutputVector structs describe the buffers
    # that the sent data will be gathered from. Using multiple
    # #GOutputVectors is more memory-efficient than manually copying
    # data from multiple sources into a single buffer, and more
    # network-efficient than making multiple calls to g_socket_send().
    #
    # @messages, if non-%NULL, is taken to point to an array of @num_messages
    # #GSocketControlMessage instances. These correspond to the control
    # messages to be sent on the socket.
    # If @num_messages is -1 then @messages is treated as a %NULL-terminated
    # array.
    #
    # @flags modify how the message is sent. The commonly available arguments
    # for this are available in the #GSocketMsgFlags enum, but the
    # values there are the same as the system values, and the flags
    # are passed in as-is, so you can pass in system-specific flags too.
    #
    # If the socket is in blocking mode the call will block until there is
    # space for the data in the socket queue. If there is no space available
    # and the socket is in non-blocking mode a %G_IO_ERROR_WOULD_BLOCK error
    # will be returned. To be notified when space is available, wait for the
    # %G_IO_OUT condition. Note though that you may still receive
    # %G_IO_ERROR_WOULD_BLOCK from g_socket_send() even if you were previously
    # notified of a %G_IO_OUT condition. (On Windows in particular, this is
    # very common due to the way the underlying APIs work.)
    #
    # The sum of the sizes of each #GOutputVector in vectors must not be
    # greater than %G_MAXSSIZE. If the message can be larger than this,
    # then it is mandatory to use the g_socket_send_message_with_timeout()
    # function.
    #
    # On error -1 is returned and @error is set accordingly.
    def send_message(address : Gio::SocketAddress?, vectors : Enumerable(Gio::OutputVector), messages : Enumerable(Gio::SocketControlMessage)?, flags : Int32, cancellable : Gio::Cancellable?) : Int64
      # g_socket_send_message: (Method | Throws)
      # @address: (nullable)
      # @vectors: (array length=num_vectors element-type Interface)
      # @messages: (nullable) (array length=num_messages element-type Interface)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      address = if address.nil?
                  Pointer(Void).null
                else
                  address.to_unsafe
                end
      # Generator::ArrayLengthArgPlan
      num_vectors = vectors.size # Generator::ArrayArgPlan
      vectors = vectors.to_a.map(&.to_unsafe).to_unsafe
      # Generator::ArrayLengthArgPlan
      num_messages = messages.try(&.size) || 0 # Generator::NullableArrayPlan
      messages = if messages.nil?
                   Pointer(Pointer(Void)).null
                 else
                   messages.to_a.map(&.to_unsafe).to_unsafe
                 end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_send_message(@pointer, address, vectors, num_vectors, messages, num_messages, flags, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # This behaves exactly the same as g_socket_send_message(), except that
    # the choice of timeout behavior is determined by the @timeout_us argument
    # rather than by @socket's properties.
    #
    # On error %G_POLLABLE_RETURN_FAILED is returned and @error is set accordingly, or
    # if the socket is currently not writable %G_POLLABLE_RETURN_WOULD_BLOCK is
    # returned. @bytes_written will contain 0 in both cases.
    def send_message_with_timeout(address : Gio::SocketAddress?, vectors : Enumerable(Gio::OutputVector), messages : Enumerable(Gio::SocketControlMessage)?, flags : Int32, timeout_us : Int64, cancellable : Gio::Cancellable?) : Gio::PollableReturn
      # g_socket_send_message_with_timeout: (Method | Throws)
      # @address: (nullable)
      # @vectors: (array length=num_vectors element-type Interface)
      # @messages: (nullable) (array length=num_messages element-type Interface)
      # @bytes_written: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      address = if address.nil?
                  Pointer(Void).null
                else
                  address.to_unsafe
                end
      # Generator::ArrayLengthArgPlan
      num_vectors = vectors.size # Generator::ArrayArgPlan
      vectors = vectors.to_a.map(&.to_unsafe).to_unsafe
      # Generator::ArrayLengthArgPlan
      num_messages = messages.try(&.size) || 0 # Generator::NullableArrayPlan
      messages = if messages.nil?
                   Pointer(Pointer(Void)).null
                 else
                   messages.to_a.map(&.to_unsafe).to_unsafe
                 end
      # Generator::OutArgUsedInReturnPlan
      bytes_written = Pointer(UInt64).null # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_send_message_with_timeout(@pointer, address, vectors, num_vectors, messages, num_messages, flags, timeout_us, bytes_written, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::PollableReturn.new(_retval)
    end

    # Send multiple data messages from @socket in one go.  This is the most
    # complicated and fully-featured version of this call. For easier use, see
    # g_socket_send(), g_socket_send_to(), and g_socket_send_message().
    #
    # @messages must point to an array of #GOutputMessage structs and
    # @num_messages must be the length of this array. Each #GOutputMessage
    # contains an address to send the data to, and a pointer to an array of
    # #GOutputVector structs to describe the buffers that the data to be sent
    # for each message will be gathered from. Using multiple #GOutputVectors is
    # more memory-efficient than manually copying data from multiple sources
    # into a single buffer, and more network-efficient than making multiple
    # calls to g_socket_send(). Sending multiple messages in one go avoids the
    # overhead of making a lot of syscalls in scenarios where a lot of data
    # packets need to be sent (e.g. high-bandwidth video streaming over RTP/UDP),
    # or where the same data needs to be sent to multiple recipients.
    #
    # @flags modify how the message is sent. The commonly available arguments
    # for this are available in the #GSocketMsgFlags enum, but the
    # values there are the same as the system values, and the flags
    # are passed in as-is, so you can pass in system-specific flags too.
    #
    # If the socket is in blocking mode the call will block until there is
    # space for all the data in the socket queue. If there is no space available
    # and the socket is in non-blocking mode a %G_IO_ERROR_WOULD_BLOCK error
    # will be returned if no data was written at all, otherwise the number of
    # messages sent will be returned. To be notified when space is available,
    # wait for the %G_IO_OUT condition. Note though that you may still receive
    # %G_IO_ERROR_WOULD_BLOCK from g_socket_send() even if you were previously
    # notified of a %G_IO_OUT condition. (On Windows in particular, this is
    # very common due to the way the underlying APIs work.)
    #
    # On error -1 is returned and @error is set accordingly. An error will only
    # be returned if zero messages could be sent; otherwise the number of messages
    # successfully sent before the error will be returned.
    def send_messages(messages : Enumerable(Gio::OutputMessage), flags : Int32, cancellable : Gio::Cancellable?) : Int32
      # g_socket_send_messages: (Method | Throws)
      # @messages: (array length=num_messages element-type Interface)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayLengthArgPlan
      num_messages = messages.size # Generator::ArrayArgPlan
      messages = messages.to_a.map(&.to_unsafe).to_unsafe
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_send_messages(@pointer, messages, num_messages, flags, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Tries to send @size bytes from @buffer to @address. If @address is
    # %NULL then the message is sent to the default receiver (set by
    # g_socket_connect()).
    #
    # See g_socket_send() for additional information.
    def send_to(address : Gio::SocketAddress?, buffer : Enumerable(UInt8), cancellable : Gio::Cancellable?) : Int64
      # g_socket_send_to: (Method | Throws)
      # @address: (nullable)
      # @buffer: (array length=size element-type UInt8)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      address = if address.nil?
                  Pointer(Void).null
                else
                  address.to_unsafe
                end
      # Generator::ArrayLengthArgPlan
      size = buffer.size # Generator::ArrayArgPlan
      buffer = buffer.to_a.to_unsafe
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_send_to(@pointer, address, buffer, size, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # This behaves exactly the same as g_socket_send(), except that
    # the choice of blocking or non-blocking behavior is determined by
    # the @blocking argument rather than by @socket's properties.
    def send_with_blocking(buffer : Enumerable(UInt8), blocking : Bool, cancellable : Gio::Cancellable?) : Int64
      # g_socket_send_with_blocking: (Method | Throws)
      # @buffer: (array length=size element-type UInt8)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayLengthArgPlan
      size = buffer.size # Generator::ArrayArgPlan
      buffer = buffer.to_a.to_unsafe
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_send_with_blocking(@pointer, buffer, size, blocking, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Sets the blocking mode of the socket. In blocking mode
    # all operations (which don’t take an explicit blocking parameter) block until
    # they succeed or there is an error. In
    # non-blocking mode all functions return results immediately or
    # with a %G_IO_ERROR_WOULD_BLOCK error.
    #
    # All sockets are created in blocking mode. However, note that the
    # platform level socket is always non-blocking, and blocking mode
    # is a GSocket level feature.
    def blocking=(blocking : Bool) : Nil
      # g_socket_set_blocking: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_set_blocking(@pointer, blocking)

      # Return value handling
    end

    # Sets whether @socket should allow sending to broadcast addresses.
    # This is %FALSE by default.
    def broadcast=(broadcast : Bool) : Nil
      # g_socket_set_broadcast: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_set_broadcast(@pointer, broadcast)

      # Return value handling
    end

    # Sets or unsets the %SO_KEEPALIVE flag on the underlying socket. When
    # this flag is set on a socket, the system will attempt to verify that the
    # remote socket endpoint is still present if a sufficiently long period of
    # time passes with no data being exchanged. If the system is unable to
    # verify the presence of the remote endpoint, it will automatically close
    # the connection.
    #
    # This option is only functional on certain kinds of sockets. (Notably,
    # %G_SOCKET_PROTOCOL_TCP sockets.)
    #
    # The exact time between pings is system- and protocol-dependent, but will
    # normally be at least two hours. Most commonly, you would set this flag
    # on a server socket if you want to allow clients to remain idle for long
    # periods of time, but also want to ensure that connections are eventually
    # garbage-collected if clients crash or become unreachable.
    def keepalive=(keepalive : Bool) : Nil
      # g_socket_set_keepalive: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_set_keepalive(@pointer, keepalive)

      # Return value handling
    end

    # Sets the maximum number of outstanding connections allowed
    # when listening on this socket. If more clients than this are
    # connecting to the socket and the application is not handling them
    # on time then the new connections will be refused.
    #
    # Note that this must be called before g_socket_listen() and has no
    # effect if called after that.
    def listen_backlog=(backlog : Int32) : Nil
      # g_socket_set_listen_backlog: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_set_listen_backlog(@pointer, backlog)

      # Return value handling
    end

    # Sets whether outgoing multicast packets will be received by sockets
    # listening on that multicast address on the same host. This is %TRUE
    # by default.
    def multicast_loopback=(loopback : Bool) : Nil
      # g_socket_set_multicast_loopback: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_set_multicast_loopback(@pointer, loopback)

      # Return value handling
    end

    # Sets the time-to-live for outgoing multicast datagrams on @socket.
    # By default, this is 1, meaning that multicast packets will not leave
    # the local network.
    def multicast_ttl=(ttl : UInt32) : Nil
      # g_socket_set_multicast_ttl: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_set_multicast_ttl(@pointer, ttl)

      # Return value handling
    end

    # Sets the value of an integer-valued option on @socket, as with
    # setsockopt(). (If you need to set a non-integer-valued option,
    # you will need to call setsockopt() directly.)
    #
    # The [<gio/gnetworking.h>][gio-gnetworking.h]
    # header pulls in system headers that will define most of the
    # standard/portable socket options. For unusual socket protocols or
    # platform-dependent options, you may need to include additional
    # headers.
    def set_option(level : Int32, optname : Int32, value : Int32) : Bool
      # g_socket_set_option: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_socket_set_option(@pointer, level, optname, value, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the time in seconds after which I/O operations on @socket will
    # time out if they have not yet completed.
    #
    # On a blocking socket, this means that any blocking #GSocket
    # operation will time out after @timeout seconds of inactivity,
    # returning %G_IO_ERROR_TIMED_OUT.
    #
    # On a non-blocking socket, calls to g_socket_condition_wait() will
    # also fail with %G_IO_ERROR_TIMED_OUT after the given time. Sources
    # created with g_socket_create_source() will trigger after
    # @timeout seconds of inactivity, with the requested condition
    # set, at which point calling g_socket_receive(), g_socket_send(),
    # g_socket_check_connect_result(), etc, will fail with
    # %G_IO_ERROR_TIMED_OUT.
    #
    # If @timeout is 0 (the default), operations will never time out
    # on their own.
    #
    # Note that if an I/O operation is interrupted by a signal, this may
    # cause the timeout to be reset.
    def timeout=(timeout : UInt32) : Nil
      # g_socket_set_timeout: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_set_timeout(@pointer, timeout)

      # Return value handling
    end

    # Sets the time-to-live for outgoing unicast packets on @socket.
    # By default the platform-specific default value is used.
    def ttl=(ttl : UInt32) : Nil
      # g_socket_set_ttl: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_set_ttl(@pointer, ttl)

      # Return value handling
    end

    # Shut down part or all of a full-duplex connection.
    #
    # If @shutdown_read is %TRUE then the receiving side of the connection
    # is shut down, and further reading is disallowed.
    #
    # If @shutdown_write is %TRUE then the sending side of the connection
    # is shut down, and further writing is disallowed.
    #
    # It is allowed for both @shutdown_read and @shutdown_write to be %TRUE.
    #
    # One example where it is useful to shut down only one side of a connection is
    # graceful disconnect for TCP connections where you close the sending side,
    # then wait for the other side to close the connection, thus ensuring that the
    # other side saw all sent data.
    def shutdown(shutdown_read : Bool, shutdown_write : Bool) : Bool
      # g_socket_shutdown: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_socket_shutdown(@pointer, shutdown_read, shutdown_write, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks if a socket is capable of speaking IPv4.
    #
    # IPv4 sockets are capable of speaking IPv4.  On some operating systems
    # and under some combinations of circumstances IPv6 sockets are also
    # capable of speaking IPv4.  See RFC 3493 section 3.7 for more
    # information.
    #
    # No other types of sockets are currently considered as being capable
    # of speaking IPv4.
    def speaks_ipv4 : Bool
      # g_socket_speaks_ipv4: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_speaks_ipv4(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
