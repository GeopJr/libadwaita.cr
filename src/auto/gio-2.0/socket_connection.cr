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
  class SocketConnection < IOStream
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, closed : Bool? = nil, input_stream : Gio::InputStream? = nil, output_stream : Gio::OutputStream? = nil, socket : Gio::Socket? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if closed
        (_names.to_unsafe + _n).value = "closed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, closed)
        _n += 1
      end
      if input_stream
        (_names.to_unsafe + _n).value = "input-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_stream)
        _n += 1
      end
      if output_stream
        (_names.to_unsafe + _n).value = "output-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, output_stream)
        _n += 1
      end
      if socket
        (_names.to_unsafe + _n).value = "socket".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, socket)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SocketConnection.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_socket_connection_get_type
    end

    def socket=(value : Socket?) : Socket?
      unsafe_value = value

      LibGObject.g_object_set(self, "socket", unsafe_value, Pointer(Void).null)
      value
    end

    def self.factory_lookup_type(family : Gio::SocketFamily, type : Gio::SocketType, protocol_id : Int32) : UInt64
      # g_socket_connection_factory_lookup_type: (None)
      # Returns: (transfer none)

      _retval = LibGio.g_socket_connection_factory_lookup_type(family, type, protocol_id)
      _retval
    end

    def self.factory_register_type(g_type : UInt64, family : Gio::SocketFamily, type : Gio::SocketType, protocol : Int32) : Nil
      # g_socket_connection_factory_register_type: (None)
      # Returns: (transfer none)

      LibGio.g_socket_connection_factory_register_type(g_type, family, type, protocol)
    end

    def connect(address : Gio::SocketAddress, cancellable : Gio::Cancellable?) : Bool
      # g_socket_connection_connect: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_socket_connection_connect(self, address, cancellable)
      GICrystal.to_bool(_retval)
    end

    def connect_async(address : Gio::SocketAddress, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_socket_connection_connect_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_socket_connection_connect_async(self, address, cancellable, callback, user_data)
    end

    def connect_finish(result : Gio::AsyncResult) : Bool
      # g_socket_connection_connect_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_socket_connection_connect_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def local_address : Gio::SocketAddress
      # g_socket_connection_get_local_address: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_socket_connection_get_local_address(self)
      Gio::SocketAddress.new(_retval, GICrystal::Transfer::Full)
    end

    def remote_address : Gio::SocketAddress
      # g_socket_connection_get_remote_address: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_socket_connection_get_remote_address(self)
      Gio::SocketAddress.new(_retval, GICrystal::Transfer::Full)
    end

    def socket : Gio::Socket
      # g_socket_connection_get_socket: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_socket_connection_get_socket(self)
      Gio::Socket.new(_retval, GICrystal::Transfer::None)
    end

    def is_connected : Bool
      # g_socket_connection_is_connected: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_socket_connection_is_connected(self)
      GICrystal.to_bool(_retval)
    end
  end
end
