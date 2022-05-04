require "../g_object-2.0/object"

module Gio
  # #GSocketClient is a lightweight high-level utility class for connecting to
  # a network host using a connection oriented socket type.
  #
  # You create a #GSocketClient object, set any options you want, and then
  # call a sync or async connect operation, which returns a #GSocketConnection
  # subclass on success.
  #
  # The type of the #GSocketConnection object returned depends on the type of
  # the underlying socket that is in use. For instance, for a TCP/IP connection
  # it will be a #GTcpConnection.
  #
  # As #GSocketClient is a lightweight object, you don't need to cache it. You
  # can just create a new one any time you need one.
  @[GObject::GeneratedWrapper]
  class SocketClient < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::SocketClientClass), class_init,
        sizeof(LibGio::SocketClient), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, enable_proxy : Bool? = nil, family : Gio::SocketFamily? = nil, local_address : Gio::SocketAddress? = nil, protocol : Gio::SocketProtocol? = nil, proxy_resolver : Gio::ProxyResolver? = nil, timeout : UInt32? = nil, tls : Bool? = nil, tls_validation_flags : Gio::TlsCertificateFlags? = nil, type : Gio::SocketType? = nil)
      _names = uninitialized Pointer(LibC::Char)[9]
      _values = StaticArray(LibGObject::Value, 9).new(LibGObject::Value.new)
      _n = 0

      if !enable_proxy.nil?
        (_names.to_unsafe + _n).value = "enable-proxy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_proxy)
        _n += 1
      end
      if !family.nil?
        (_names.to_unsafe + _n).value = "family".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, family)
        _n += 1
      end
      if !local_address.nil?
        (_names.to_unsafe + _n).value = "local-address".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, local_address)
        _n += 1
      end
      if !protocol.nil?
        (_names.to_unsafe + _n).value = "protocol".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, protocol)
        _n += 1
      end
      if !proxy_resolver.nil?
        (_names.to_unsafe + _n).value = "proxy-resolver".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, proxy_resolver)
        _n += 1
      end
      if !timeout.nil?
        (_names.to_unsafe + _n).value = "timeout".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, timeout)
        _n += 1
      end
      if !tls.nil?
        (_names.to_unsafe + _n).value = "tls".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tls)
        _n += 1
      end
      if !tls_validation_flags.nil?
        (_names.to_unsafe + _n).value = "tls-validation-flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tls_validation_flags)
        _n += 1
      end
      if !type.nil?
        (_names.to_unsafe + _n).value = "type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, type)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SocketClient.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_socket_client_get_type
    end

    def enable_proxy=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "enable-proxy", unsafe_value, Pointer(Void).null)
      value
    end

    def enable_proxy? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "enable-proxy", pointerof(value), Pointer(Void).null)
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

    def local_address=(value : Gio::SocketAddress?) : Gio::SocketAddress?
      unsafe_value = value

      LibGObject.g_object_set(self, "local-address", unsafe_value, Pointer(Void).null)
      value
    end

    def local_address : Gio::SocketAddress?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "local-address", pointerof(value), Pointer(Void).null)
      Gio::SocketAddress.new(value, GICrystal::Transfer::None) unless value.null?
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

    def proxy_resolver=(value : Gio::ProxyResolver?) : Gio::ProxyResolver?
      unsafe_value = value

      LibGObject.g_object_set(self, "proxy-resolver", unsafe_value, Pointer(Void).null)
      value
    end

    def proxy_resolver : Gio::ProxyResolver?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "proxy-resolver", pointerof(value), Pointer(Void).null)
      Gio::ProxyResolver__Impl.new(value, GICrystal::Transfer::None) unless value.null?
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

    def tls=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "tls", unsafe_value, Pointer(Void).null)
      value
    end

    def tls? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "tls", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def tls_validation_flags=(value : Gio::TlsCertificateFlags) : Gio::TlsCertificateFlags
      unsafe_value = value

      LibGObject.g_object_set(self, "tls-validation-flags", unsafe_value, Pointer(Void).null)
      value
    end

    def tls_validation_flags : Gio::TlsCertificateFlags
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "tls-validation-flags", pointerof(value), Pointer(Void).null)
      Gio::TlsCertificateFlags.new(value)
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

    # Creates a new #GSocketClient with the default options.
    def initialize
      # g_socket_client_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_socket_client_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Enable proxy protocols to be handled by the application. When the
    # indicated proxy protocol is returned by the #GProxyResolver,
    # #GSocketClient will consider this protocol as supported but will
    # not try to find a #GProxy instance to handle handshaking. The
    # application must check for this case by calling
    # g_socket_connection_get_remote_address() on the returned
    # #GSocketConnection, and seeing if it's a #GProxyAddress of the
    # appropriate type, to determine whether or not it needs to handle
    # the proxy handshaking itself.
    #
    # This should be used for proxy protocols that are dialects of
    # another protocol such as HTTP proxy. It also allows cohabitation of
    # proxy protocols that are reused between protocols. A good example
    # is HTTP. It can be used to proxy HTTP, FTP and Gopher and can also
    # be use as generic socket proxy through the HTTP CONNECT method.
    #
    # When the proxy is detected as being an application proxy, TLS handshake
    # will be skipped. This is required to let the application do the proxy
    # specific handshake.
    def add_application_proxy(protocol : ::String) : Nil
      # g_socket_client_add_application_proxy: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_client_add_application_proxy(self, protocol)

      # Return value handling
    end

    # Tries to resolve the @connectable and make a network connection to it.
    #
    # Upon a successful connection, a new #GSocketConnection is constructed
    # and returned.  The caller owns this new object and must drop their
    # reference to it when finished with it.
    #
    # The type of the #GSocketConnection object returned depends on the type of
    # the underlying socket that is used. For instance, for a TCP/IP connection
    # it will be a #GTcpConnection.
    #
    # The socket created will be the same family as the address that the
    # @connectable resolves to, unless family is set with g_socket_client_set_family()
    # or indirectly via g_socket_client_set_local_address(). The socket type
    # defaults to %G_SOCKET_TYPE_STREAM but can be set with
    # g_socket_client_set_socket_type().
    #
    # If a local address is specified with g_socket_client_set_local_address() the
    # socket will be bound to this address before connecting.
    def connect(connectable : Gio::SocketConnectable, cancellable : Gio::Cancellable?) : Gio::SocketConnection
      # g_socket_client_connect: (Method | Throws)
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
      _retval = LibGio.g_socket_client_connect(self, connectable, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    # This is the asynchronous version of g_socket_client_connect().
    #
    # You may wish to prefer the asynchronous version even in synchronous
    # command line programs because, since 2.60, it implements
    # [RFC 8305](https://tools.ietf.org/html/rfc8305) "Happy Eyeballs"
    # recommendations to work around long connection timeouts in networks
    # where IPv6 is broken by performing an IPv4 connection simultaneously
    # without waiting for IPv6 to time out, which is not supported by the
    # synchronous call. (This is not an API guarantee, and may change in
    # the future.)
    #
    # When the operation is finished @callback will be
    # called. You can then call g_socket_client_connect_finish() to get
    # the result of the operation.
    def connect_async(connectable : Gio::SocketConnectable, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_socket_client_connect_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_socket_client_connect_async(self, connectable, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an async connect operation. See g_socket_client_connect_async()
    def connect_finish(result : Gio::AsyncResult) : Gio::SocketConnection
      # g_socket_client_connect_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_socket_client_connect_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    # This is a helper function for g_socket_client_connect().
    #
    # Attempts to create a TCP connection to the named host.
    #
    # @host_and_port may be in any of a number of recognized formats; an IPv6
    # address, an IPv4 address, or a domain name (in which case a DNS
    # lookup is performed).  Quoting with [] is supported for all address
    # types.  A port override may be specified in the usual way with a
    # colon.  Ports may be given as decimal numbers or symbolic names (in
    # which case an /etc/services lookup is performed).
    #
    # If no port override is given in @host_and_port then @default_port will be
    # used as the port number to connect to.
    #
    # In general, @host_and_port is expected to be provided by the user (allowing
    # them to give the hostname, and a port override if necessary) and
    # @default_port is expected to be provided by the application.
    #
    # In the case that an IP address is given, a single connection
    # attempt is made.  In the case that a name is given, multiple
    # connection attempts may be made, in turn and according to the
    # number of address records in DNS, until a connection succeeds.
    #
    # Upon a successful connection, a new #GSocketConnection is constructed
    # and returned.  The caller owns this new object and must drop their
    # reference to it when finished with it.
    #
    # In the event of any failure (DNS error, service not found, no hosts
    # connectable) %NULL is returned and @error (if non-%NULL) is set
    # accordingly.
    def connect_to_host(host_and_port : ::String, default_port : UInt16, cancellable : Gio::Cancellable?) : Gio::SocketConnection
      # g_socket_client_connect_to_host: (Method | Throws)
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
      _retval = LibGio.g_socket_client_connect_to_host(self, host_and_port, default_port, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    # This is the asynchronous version of g_socket_client_connect_to_host().
    #
    # When the operation is finished @callback will be
    # called. You can then call g_socket_client_connect_to_host_finish() to get
    # the result of the operation.
    def connect_to_host_async(host_and_port : ::String, default_port : UInt16, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_socket_client_connect_to_host_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_socket_client_connect_to_host_async(self, host_and_port, default_port, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an async connect operation. See g_socket_client_connect_to_host_async()
    def connect_to_host_finish(result : Gio::AsyncResult) : Gio::SocketConnection
      # g_socket_client_connect_to_host_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_socket_client_connect_to_host_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    # Attempts to create a TCP connection to a service.
    #
    # This call looks up the SRV record for @service at @domain for the
    # "tcp" protocol.  It then attempts to connect, in turn, to each of
    # the hosts providing the service until either a connection succeeds
    # or there are no hosts remaining.
    #
    # Upon a successful connection, a new #GSocketConnection is constructed
    # and returned.  The caller owns this new object and must drop their
    # reference to it when finished with it.
    #
    # In the event of any failure (DNS error, service not found, no hosts
    # connectable) %NULL is returned and @error (if non-%NULL) is set
    # accordingly.
    def connect_to_service(domain : ::String, service : ::String, cancellable : Gio::Cancellable?) : Gio::SocketConnection
      # g_socket_client_connect_to_service: (Method | Throws)
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
      _retval = LibGio.g_socket_client_connect_to_service(self, domain, service, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    # This is the asynchronous version of
    # g_socket_client_connect_to_service().
    def connect_to_service_async(domain : ::String, service : ::String, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_socket_client_connect_to_service_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_socket_client_connect_to_service_async(self, domain, service, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an async connect operation. See g_socket_client_connect_to_service_async()
    def connect_to_service_finish(result : Gio::AsyncResult) : Gio::SocketConnection
      # g_socket_client_connect_to_service_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_socket_client_connect_to_service_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    # This is a helper function for g_socket_client_connect().
    #
    # Attempts to create a TCP connection with a network URI.
    #
    # @uri may be any valid URI containing an "authority" (hostname/port)
    # component. If a port is not specified in the URI, @default_port
    # will be used. TLS will be negotiated if #GSocketClient:tls is %TRUE.
    # (#GSocketClient does not know to automatically assume TLS for
    # certain URI schemes.)
    #
    # Using this rather than g_socket_client_connect() or
    # g_socket_client_connect_to_host() allows #GSocketClient to
    # determine when to use application-specific proxy protocols.
    #
    # Upon a successful connection, a new #GSocketConnection is constructed
    # and returned.  The caller owns this new object and must drop their
    # reference to it when finished with it.
    #
    # In the event of any failure (DNS error, service not found, no hosts
    # connectable) %NULL is returned and @error (if non-%NULL) is set
    # accordingly.
    def connect_to_uri(uri : ::String, default_port : UInt16, cancellable : Gio::Cancellable?) : Gio::SocketConnection
      # g_socket_client_connect_to_uri: (Method | Throws)
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
      _retval = LibGio.g_socket_client_connect_to_uri(self, uri, default_port, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    # This is the asynchronous version of g_socket_client_connect_to_uri().
    #
    # When the operation is finished @callback will be
    # called. You can then call g_socket_client_connect_to_uri_finish() to get
    # the result of the operation.
    def connect_to_uri_async(uri : ::String, default_port : UInt16, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_socket_client_connect_to_uri_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_socket_client_connect_to_uri_async(self, uri, default_port, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an async connect operation. See g_socket_client_connect_to_uri_async()
    def connect_to_uri_finish(result : Gio::AsyncResult) : Gio::SocketConnection
      # g_socket_client_connect_to_uri_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_socket_client_connect_to_uri_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the proxy enable state; see g_socket_client_set_enable_proxy()
    def enable_proxy : Bool
      # g_socket_client_get_enable_proxy: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_client_get_enable_proxy(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the socket family of the socket client.
    #
    # See g_socket_client_set_family() for details.
    def family : Gio::SocketFamily
      # g_socket_client_get_family: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_client_get_family(self)

      # Return value handling

      Gio::SocketFamily.new(_retval)
    end

    # Gets the local address of the socket client.
    #
    # See g_socket_client_set_local_address() for details.
    def local_address : Gio::SocketAddress?
      # g_socket_client_get_local_address: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_client_get_local_address(self)

      # Return value handling

      Gio::SocketAddress.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the protocol name type of the socket client.
    #
    # See g_socket_client_set_protocol() for details.
    def protocol : Gio::SocketProtocol
      # g_socket_client_get_protocol: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_client_get_protocol(self)

      # Return value handling

      Gio::SocketProtocol.new(_retval)
    end

    # Gets the #GProxyResolver being used by @client. Normally, this will
    # be the resolver returned by g_proxy_resolver_get_default(), but you
    # can override it with g_socket_client_set_proxy_resolver().
    def proxy_resolver : Gio::ProxyResolver
      # g_socket_client_get_proxy_resolver: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_client_get_proxy_resolver(self)

      # Return value handling

      Gio::ProxyResolver__Impl.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the socket type of the socket client.
    #
    # See g_socket_client_set_socket_type() for details.
    def socket_type : Gio::SocketType
      # g_socket_client_get_socket_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_client_get_socket_type(self)

      # Return value handling

      Gio::SocketType.new(_retval)
    end

    # Gets the I/O timeout time for sockets created by @client.
    #
    # See g_socket_client_set_timeout() for details.
    def timeout : UInt32
      # g_socket_client_get_timeout: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_client_get_timeout(self)

      # Return value handling

      _retval
    end

    # Gets whether @client creates TLS connections. See
    # g_socket_client_set_tls() for details.
    def tls : Bool
      # g_socket_client_get_tls: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_client_get_tls(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the TLS validation flags used creating TLS connections via
    # @client.
    #
    # This function does not work as originally designed and is impossible
    # to use correctly. See #GSocketClient:tls-validation-flags for more
    # information.
    def tls_validation_flags : Gio::TlsCertificateFlags
      # g_socket_client_get_tls_validation_flags: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_client_get_tls_validation_flags(self)

      # Return value handling

      Gio::TlsCertificateFlags.new(_retval)
    end

    # Sets whether or not @client attempts to make connections via a
    # proxy server. When enabled (the default), #GSocketClient will use a
    # #GProxyResolver to determine if a proxy protocol such as SOCKS is
    # needed, and automatically do the necessary proxy negotiation.
    #
    # See also g_socket_client_set_proxy_resolver().
    def enable_proxy=(enable : Bool) : Nil
      # g_socket_client_set_enable_proxy: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_client_set_enable_proxy(self, enable)

      # Return value handling
    end

    # Sets the socket family of the socket client.
    # If this is set to something other than %G_SOCKET_FAMILY_INVALID
    # then the sockets created by this object will be of the specified
    # family.
    #
    # This might be useful for instance if you want to force the local
    # connection to be an ipv4 socket, even though the address might
    # be an ipv6 mapped to ipv4 address.
    def family=(family : Gio::SocketFamily) : Nil
      # g_socket_client_set_family: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_client_set_family(self, family)

      # Return value handling
    end

    # Sets the local address of the socket client.
    # The sockets created by this object will bound to the
    # specified address (if not %NULL) before connecting.
    #
    # This is useful if you want to ensure that the local
    # side of the connection is on a specific port, or on
    # a specific interface.
    def local_address=(address : Gio::SocketAddress?) : Nil
      # g_socket_client_set_local_address: (Method | Setter)
      # @address: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      address = if address.nil?
                  Pointer(Void).null
                else
                  address.to_unsafe
                end

      # C call
      LibGio.g_socket_client_set_local_address(self, address)

      # Return value handling
    end

    # Sets the protocol of the socket client.
    # The sockets created by this object will use of the specified
    # protocol.
    #
    # If @protocol is %G_SOCKET_PROTOCOL_DEFAULT that means to use the default
    # protocol for the socket family and type.
    def protocol=(protocol : Gio::SocketProtocol) : Nil
      # g_socket_client_set_protocol: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_client_set_protocol(self, protocol)

      # Return value handling
    end

    # Overrides the #GProxyResolver used by @client. You can call this if
    # you want to use specific proxies, rather than using the system
    # default proxy settings.
    #
    # Note that whether or not the proxy resolver is actually used
    # depends on the setting of #GSocketClient:enable-proxy, which is not
    # changed by this function (but which is %TRUE by default)
    def proxy_resolver=(proxy_resolver : Gio::ProxyResolver?) : Nil
      # g_socket_client_set_proxy_resolver: (Method | Setter)
      # @proxy_resolver: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      proxy_resolver = if proxy_resolver.nil?
                         Pointer(Void).null
                       else
                         proxy_resolver.to_unsafe
                       end

      # C call
      LibGio.g_socket_client_set_proxy_resolver(self, proxy_resolver)

      # Return value handling
    end

    # Sets the socket type of the socket client.
    # The sockets created by this object will be of the specified
    # type.
    #
    # It doesn't make sense to specify a type of %G_SOCKET_TYPE_DATAGRAM,
    # as GSocketClient is used for connection oriented services.
    def socket_type=(type : Gio::SocketType) : Nil
      # g_socket_client_set_socket_type: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_client_set_socket_type(self, type)

      # Return value handling
    end

    # Sets the I/O timeout for sockets created by @client. @timeout is a
    # time in seconds, or 0 for no timeout (the default).
    #
    # The timeout value affects the initial connection attempt as well,
    # so setting this may cause calls to g_socket_client_connect(), etc,
    # to fail with %G_IO_ERROR_TIMED_OUT.
    def timeout=(timeout : UInt32) : Nil
      # g_socket_client_set_timeout: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_client_set_timeout(self, timeout)

      # Return value handling
    end

    # Sets whether @client creates TLS (aka SSL) connections. If @tls is
    # %TRUE, @client will wrap its connections in a #GTlsClientConnection
    # and perform a TLS handshake when connecting.
    #
    # Note that since #GSocketClient must return a #GSocketConnection,
    # but #GTlsClientConnection is not a #GSocketConnection, this
    # actually wraps the resulting #GTlsClientConnection in a
    # #GTcpWrapperConnection when returning it. You can use
    # g_tcp_wrapper_connection_get_base_io_stream() on the return value
    # to extract the #GTlsClientConnection.
    #
    # If you need to modify the behavior of the TLS handshake (eg, by
    # setting a client-side certificate to use, or connecting to the
    # #GTlsConnection::accept-certificate signal), you can connect to
    # @client's #GSocketClient::event signal and wait for it to be
    # emitted with %G_SOCKET_CLIENT_TLS_HANDSHAKING, which will give you
    # a chance to see the #GTlsClientConnection before the handshake
    # starts.
    def tls=(tls : Bool) : Nil
      # g_socket_client_set_tls: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_client_set_tls(self, tls)

      # Return value handling
    end

    # Sets the TLS validation flags used when creating TLS connections
    # via @client. The default value is %G_TLS_CERTIFICATE_VALIDATE_ALL.
    #
    # This function does not work as originally designed and is impossible
    # to use correctly. See #GSocketClient:tls-validation-flags for more
    # information.
    def tls_validation_flags=(flags : Gio::TlsCertificateFlags) : Nil
      # g_socket_client_set_tls_validation_flags: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_client_set_tls_validation_flags(self, flags)

      # Return value handling
    end

    # Emitted when @client's activity on @connectable changes state.
    # Among other things, this can be used to provide progress
    # information about a network connection in the UI. The meanings of
    # the different @event values are as follows:
    #
    # - %G_SOCKET_CLIENT_RESOLVING: @client is about to look up @connectable
    #   in DNS. @connection will be %NULL.
    #
    # - %G_SOCKET_CLIENT_RESOLVED:  @client has successfully resolved
    #   @connectable in DNS. @connection will be %NULL.
    #
    # - %G_SOCKET_CLIENT_CONNECTING: @client is about to make a connection
    #   to a remote host; either a proxy server or the destination server
    #   itself. @connection is the #GSocketConnection, which is not yet
    #   connected.  Since GLib 2.40, you can access the remote
    #   address via g_socket_connection_get_remote_address().
    #
    # - %G_SOCKET_CLIENT_CONNECTED: @client has successfully connected
    #   to a remote host. @connection is the connected #GSocketConnection.
    #
    # - %G_SOCKET_CLIENT_PROXY_NEGOTIATING: @client is about to negotiate
    #   with a proxy to get it to connect to @connectable. @connection is
    #   the #GSocketConnection to the proxy server.
    #
    # - %G_SOCKET_CLIENT_PROXY_NEGOTIATED: @client has negotiated a
    #   connection to @connectable through a proxy server. @connection is
    #   the stream returned from g_proxy_connect(), which may or may not
    #   be a #GSocketConnection.
    #
    # - %G_SOCKET_CLIENT_TLS_HANDSHAKING: @client is about to begin a TLS
    #   handshake. @connection is a #GTlsClientConnection.
    #
    # - %G_SOCKET_CLIENT_TLS_HANDSHAKED: @client has successfully completed
    #   the TLS handshake. @connection is a #GTlsClientConnection.
    #
    # - %G_SOCKET_CLIENT_COMPLETE: @client has either successfully connected
    #   to @connectable (in which case @connection is the #GSocketConnection
    #   that it will be returning to the caller) or has failed (in which
    #   case @connection is %NULL and the client is about to return an error).
    #
    # Each event except %G_SOCKET_CLIENT_COMPLETE may be emitted
    # multiple times (or not at all) for a given connectable (in
    # particular, if @client ends up attempting to connect to more than
    # one address). However, if @client emits the #GSocketClient::event
    # signal at all for a given connectable, then it will always emit
    # it with %G_SOCKET_CLIENT_COMPLETE when it is done.
    #
    # Note that there may be additional #GSocketClientEvent values in
    # the future; unrecognized @event values should be ignored.
    struct EventSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "event::#{@detail}" : "event"
      end

      def connect(&block : Proc(Gio::SocketClientEvent, Gio::SocketConnectable, Gio::IOStream?, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::SocketClientEvent, Gio::SocketConnectable, Gio::IOStream?, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gio::SocketClientEvent, Gio::SocketConnectable, Gio::IOStream?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_event : UInt32, lib_connectable : Pointer(Void), lib_connection : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          event = Gio::SocketClientEvent.new(lib_event, :none)
          # Generator::GObjectArgPlan
          connectable = Gio::SocketConnectable.new(lib_connectable, :none)
          # Generator::NullableArrayPlan
          connection = (lib_connection.null? ? nil : Gio::IOStream.new(lib_connection, GICrystal::Transfer::None))
          # Generator::GObjectArgPlan
          connection = Gio::IOStream.new(lib_connection, :none)
          ::Box(Proc(Gio::SocketClientEvent, Gio::SocketConnectable, Gio::IOStream?, Nil)).unbox(_lib_box).call(event, connectable, connection)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::SocketClientEvent, Gio::SocketConnectable, Gio::IOStream?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_event : UInt32, lib_connectable : Pointer(Void), lib_connection : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          event = Gio::SocketClientEvent.new(lib_event, :none)
          # Generator::GObjectArgPlan
          connectable = Gio::SocketConnectable.new(lib_connectable, :none)
          # Generator::NullableArrayPlan
          connection = (lib_connection.null? ? nil : Gio::IOStream.new(lib_connection, GICrystal::Transfer::None))
          # Generator::GObjectArgPlan
          connection = Gio::IOStream.new(lib_connection, :none)
          ::Box(Proc(Gio::SocketClientEvent, Gio::SocketConnectable, Gio::IOStream?, Nil)).unbox(_lib_box).call(event, connectable, connection)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::SocketClient, Gio::SocketClientEvent, Gio::SocketConnectable, Gio::IOStream?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_event : UInt32, lib_connectable : Pointer(Void), lib_connection : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::SocketClient.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          event = Gio::SocketClientEvent.new(lib_event, :none)
          # Generator::GObjectArgPlan
          connectable = Gio::SocketConnectable.new(lib_connectable, :none)
          # Generator::NullableArrayPlan
          connection = (lib_connection.null? ? nil : Gio::IOStream.new(lib_connection, GICrystal::Transfer::None))
          # Generator::GObjectArgPlan
          connection = Gio::IOStream.new(lib_connection, :none)
          ::Box(Proc(Gio::SocketClient, Gio::SocketClientEvent, Gio::SocketConnectable, Gio::IOStream?, Nil)).unbox(_lib_box).call(_sender, event, connectable, connection)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::SocketClient, Gio::SocketClientEvent, Gio::SocketConnectable, Gio::IOStream?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_event : UInt32, lib_connectable : Pointer(Void), lib_connection : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::SocketClient.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          event = Gio::SocketClientEvent.new(lib_event, :none)
          # Generator::GObjectArgPlan
          connectable = Gio::SocketConnectable.new(lib_connectable, :none)
          # Generator::NullableArrayPlan
          connection = (lib_connection.null? ? nil : Gio::IOStream.new(lib_connection, GICrystal::Transfer::None))
          # Generator::GObjectArgPlan
          connection = Gio::IOStream.new(lib_connection, :none)
          ::Box(Proc(Gio::SocketClient, Gio::SocketClientEvent, Gio::SocketConnectable, Gio::IOStream?, Nil)).unbox(_lib_box).call(_sender, event, connectable, connection)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(event : Gio::SocketClientEvent, connectable : Gio::SocketConnectable, connection : Gio::IOStream?) : Nil
        LibGObject.g_signal_emit_by_name(@source, "event", event, connectable, connection)
      end
    end

    def event_signal
      EventSignal.new(self)
    end
  end
end
