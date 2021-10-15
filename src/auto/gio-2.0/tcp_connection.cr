require "./socket_connection"

module Gio
  # This is the subclass of #GSocketConnection that is created
  # for TCP/IP sockets.
  class TcpConnection < SocketConnection
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, closed : Bool? = nil, graceful_disconnect : Bool? = nil, input_stream : Gio::InputStream? = nil, output_stream : Gio::OutputStream? = nil, socket : Gio::Socket? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if closed
        (_names.to_unsafe + _n).value = "closed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, closed)
        _n += 1
      end
      if graceful_disconnect
        (_names.to_unsafe + _n).value = "graceful-disconnect".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, graceful_disconnect)
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

      @pointer = LibGObject.g_object_new_with_properties(TcpConnection.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_tcp_connection_get_type
    end

    def graceful_disconnect? : Bool
      # g_tcp_connection_get_graceful_disconnect: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_tcp_connection_get_graceful_disconnect(self)
      GICrystal.to_bool(_retval)
    end

    def graceful_disconnect=(graceful_disconnect : Bool) : Nil
      # g_tcp_connection_set_graceful_disconnect: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_tcp_connection_set_graceful_disconnect(self, graceful_disconnect)
    end
  end
end
