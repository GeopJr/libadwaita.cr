require "./socket_connection"

module Gio
  # This is the subclass of #GSocketConnection that is created
  # for TCP/IP sockets.
  @[GObject::GeneratedWrapper]
  class TcpConnection < SocketConnection
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::TcpConnectionClass), class_init,
        sizeof(LibGio::TcpConnection), instance_init, 0)
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

    def initialize(*, closed : Bool? = nil, graceful_disconnect : Bool? = nil, input_stream : Gio::InputStream? = nil, output_stream : Gio::OutputStream? = nil, socket : Gio::Socket? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if !closed.nil?
        (_names.to_unsafe + _n).value = "closed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, closed)
        _n += 1
      end
      if !graceful_disconnect.nil?
        (_names.to_unsafe + _n).value = "graceful-disconnect".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, graceful_disconnect)
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

      @pointer = LibGObject.g_object_new_with_properties(TcpConnection.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_tcp_connection_get_type
    end

    def graceful_disconnect=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "graceful-disconnect", unsafe_value, Pointer(Void).null)
      value
    end

    def graceful_disconnect? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "graceful-disconnect", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Checks if graceful disconnects are used. See
    # g_tcp_connection_set_graceful_disconnect().
    def graceful_disconnect : Bool
      # g_tcp_connection_get_graceful_disconnect: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_tcp_connection_get_graceful_disconnect(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # This enables graceful disconnects on close. A graceful disconnect
    # means that we signal the receiving end that the connection is terminated
    # and wait for it to close the connection before closing the connection.
    #
    # A graceful disconnect means that we can be sure that we successfully sent
    # all the outstanding data to the other end, or get an error reported.
    # However, it also means we have to wait for all the data to reach the
    # other side and for it to acknowledge this by closing the socket, which may
    # take a while. For this reason it is disabled by default.
    def graceful_disconnect=(graceful_disconnect : Bool) : Nil
      # g_tcp_connection_set_graceful_disconnect: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_tcp_connection_set_graceful_disconnect(self, graceful_disconnect)

      # Return value handling
    end
  end
end
