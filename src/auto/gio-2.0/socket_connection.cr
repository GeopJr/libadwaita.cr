require "./io_stream"

module Gio
  # #GSocketConnection is a #GIOStream for a connected socket. They
  # can be created either by #GSocketClient when connecting to a host,
  # or by #GSocketListener when accepting a new client.
  #
  # The type of the #GSocketConnection object returned from these calls
  # depends on the type of the underlying socket that is in use. For
  # instance, for a TCP/IP connection it will be a #GTcpConnection.
  #
  # Choosing what type of object to construct is done with the socket
  # connection factory, and it is possible for 3rd parties to register
  # custom socket connection types for specific combination of socket
  # family/type/protocol using g_socket_connection_factory_register_type().
  #
  # To close a #GSocketConnection, use g_io_stream_close(). Closing both
  # substreams of the #GIOStream separately will not close the underlying
  # #GSocket.
  @[GObject::GeneratedWrapper]
  class SocketConnection < IOStream
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::SocketConnectionClass), class_init,
        sizeof(LibGio::SocketConnection), instance_init, 0)
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

    def initialize(*, closed : Bool? = nil, input_stream : Gio::InputStream? = nil, output_stream : Gio::OutputStream? = nil, socket : Gio::Socket? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if !closed.nil?
        (_names.to_unsafe + _n).value = "closed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, closed)
        _n += 1
      end
      if !input_stream.nil?
        (_names.to_unsafe + _n).value = "input-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_stream)
        _n += 1
      end
      if !output_stream.nil?
        (_names.to_unsafe + _n).value = "output-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, output_stream)
        _n += 1
      end
      if !socket.nil?
        (_names.to_unsafe + _n).value = "socket".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, socket)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SocketConnection.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_socket_connection_get_type
    end

    def socket=(value : Gio::Socket?) : Gio::Socket?
      unsafe_value = value

      LibGObject.g_object_set(self, "socket", unsafe_value, Pointer(Void).null)
      value
    end

    def socket : Gio::Socket?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "socket", pointerof(value), Pointer(Void).null)
      Gio::Socket.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Looks up the #GType to be used when creating socket connections on
    # sockets with the specified @family, @type and @protocol_id.
    #
    # If no type is registered, the #GSocketConnection base type is returned.
    def self.factory_lookup_type(family : Gio::SocketFamily, type : Gio::SocketType, protocol_id : Int32) : UInt64
      # g_socket_connection_factory_lookup_type: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_connection_factory_lookup_type(family, type, protocol_id)

      # Return value handling

      _retval
    end

    # Looks up the #GType to be used when creating socket connections on
    # sockets with the specified @family, @type and @protocol.
    #
    # If no type is registered, the #GSocketConnection base type is returned.
    def self.factory_register_type(g_type : UInt64, family : Gio::SocketFamily, type : Gio::SocketType, protocol : Int32) : Nil
      # g_socket_connection_factory_register_type: (None)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_connection_factory_register_type(g_type, family, type, protocol)

      # Return value handling
    end

    # Connect @connection to the specified remote address.
    def connect(address : Gio::SocketAddress, cancellable : Gio::Cancellable?) : Bool
      # g_socket_connection_connect: (Method | Throws)
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
      _retval = LibGio.g_socket_connection_connect(self, address, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Asynchronously connect @connection to the specified remote address.
    #
    # This clears the #GSocket:blocking flag on @connection's underlying
    # socket if it is currently set.
    #
    # Use g_socket_connection_connect_finish() to retrieve the result.
    def connect_async(address : Gio::SocketAddress, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_socket_connection_connect_async: (Method)
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
      LibGio.g_socket_connection_connect_async(self, address, cancellable, callback, user_data)

      # Return value handling
    end

    # Gets the result of a g_socket_connection_connect_async() call.
    def connect_finish(result : Gio::AsyncResult) : Bool
      # g_socket_connection_connect_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_socket_connection_connect_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Try to get the local address of a socket connection.
    def local_address : Gio::SocketAddress
      # g_socket_connection_get_local_address: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_socket_connection_get_local_address(self, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::SocketAddress.new(_retval, GICrystal::Transfer::Full)
    end

    # Try to get the remote address of a socket connection.
    #
    # Since GLib 2.40, when used with g_socket_client_connect() or
    # g_socket_client_connect_async(), during emission of
    # %G_SOCKET_CLIENT_CONNECTING, this function will return the remote
    # address that will be used for the connection.  This allows
    # applications to print e.g. "Connecting to example.com
    # (10.42.77.3)...".
    def remote_address : Gio::SocketAddress
      # g_socket_connection_get_remote_address: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_socket_connection_get_remote_address(self, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::SocketAddress.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the underlying #GSocket object of the connection.
    # This can be useful if you want to do something unusual on it
    # not supported by the #GSocketConnection APIs.
    def socket : Gio::Socket
      # g_socket_connection_get_socket: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_connection_get_socket(self)

      # Return value handling

      Gio::Socket.new(_retval, GICrystal::Transfer::None)
    end

    # Checks if @connection is connected. This is equivalent to calling
    # g_socket_is_connected() on @connection's underlying #GSocket.
    def is_connected : Bool
      # g_socket_connection_is_connected: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_connection_is_connected(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
