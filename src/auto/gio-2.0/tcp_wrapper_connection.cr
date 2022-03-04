require "./tcp_connection"

module Gio
  # A #GTcpWrapperConnection can be used to wrap a #GIOStream that is
  # based on a #GSocket, but which is not actually a
  # #GSocketConnection. This is used by #GSocketClient so that it can
  # always return a #GSocketConnection, even when the connection it has
  # actually created is not directly a #GSocketConnection.
  class TcpWrapperConnection < TcpConnection
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, base_io_stream : Gio::IOStream? = nil, closed : Bool? = nil, graceful_disconnect : Bool? = nil, input_stream : Gio::InputStream? = nil, output_stream : Gio::OutputStream? = nil, socket : Gio::Socket? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if base_io_stream
        (_names.to_unsafe + _n).value = "base-io-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, base_io_stream)
        _n += 1
      end
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

      @pointer = LibGObject.g_object_new_with_properties(TcpWrapperConnection.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_tcp_wrapper_connection_get_type
    end

    def base_io_stream=(value : Gio::IOStream?) : Gio::IOStream?
      unsafe_value = value

      LibGObject.g_object_set(self, "base-io-stream", unsafe_value, Pointer(Void).null)
      value
    end

    def base_io_stream : Gio::IOStream?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "base-io-stream", pointerof(value), Pointer(Void).null)
      Gio::IOStream.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def initialize(base_io_stream : Gio::IOStream, socket : Gio::Socket)
      # g_tcp_wrapper_connection_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_tcp_wrapper_connection_new(base_io_stream, socket)

      # Return value handling
      @pointer = _retval
    end

    def base_io_stream : Gio::IOStream
      # g_tcp_wrapper_connection_get_base_io_stream: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_tcp_wrapper_connection_get_base_io_stream(self)

      # Return value handling
      Gio::IOStream.new(_retval, GICrystal::Transfer::None)
    end
  end
end
