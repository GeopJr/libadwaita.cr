require "../g_object-2.0/object"

module Gio
  # A #GSocketListener is an object that keeps track of a set
  # of server sockets and helps you accept sockets from any of the
  # socket, either sync or async.
  #
  # Add addresses and ports to listen on using g_socket_listener_add_address()
  # and g_socket_listener_add_inet_port(). These will be listened on until
  # g_socket_listener_close() is called. Dropping your final reference to the
  # #GSocketListener will not cause g_socket_listener_close() to be called
  # implicitly, as some references to the #GSocketListener may be held
  # internally.
  #
  # If you want to implement a network server, also look at #GSocketService
  # and #GThreadedSocketService which are subclasses of #GSocketListener
  # that make this even easier.
  @[GObject::GeneratedWrapper]
  class SocketListener < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::SocketListenerClass), class_init,
        sizeof(LibGio::SocketListener), instance_init, 0)
    end

    GICrystal.define_new_method(SocketListener, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `SocketListener`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, listen_backlog : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !listen_backlog.nil?
        (_names.to_unsafe + _n).value = "listen-backlog".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, listen_backlog)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SocketListener.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_socket_listener_get_type
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

    # Creates a new #GSocketListener with no sockets to listen for.
    # New listeners can be added with e.g. g_socket_listener_add_address()
    # or g_socket_listener_add_inet_port().
    def initialize
      # g_socket_listener_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_socket_listener_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Blocks waiting for a client to connect to any of the sockets added
    # to the listener. Returns a #GSocketConnection for the socket that was
    # accepted.
    #
    # If @source_object is not %NULL it will be filled out with the source
    # object specified when the corresponding socket or address was added
    # to the listener.
    #
    # If @cancellable is not %NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
    def accept(cancellable : Gio::Cancellable?) : Gio::SocketConnection
      # g_socket_listener_accept: (Method | Throws)
      # @source_object: (out) (nullable) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      source_object = Pointer(Pointer(Void)).null # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_listener_accept(@pointer, source_object, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    # This is the asynchronous version of g_socket_listener_accept().
    #
    # When the operation is finished @callback will be
    # called. You can then call g_socket_listener_accept_finish()
    # to get the result of the operation.
    def accept_async(cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_socket_listener_accept_async: (Method)
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
      LibGio.g_socket_listener_accept_async(@pointer, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an async accept operation. See g_socket_listener_accept_async()
    def accept_finish(result : Gio::AsyncResult) : Gio::SocketConnection
      # g_socket_listener_accept_finish: (Method | Throws)
      # @source_object: (out) (nullable) (optional)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      source_object = Pointer(Pointer(Void)).null
      # C call
      _retval = LibGio.g_socket_listener_accept_finish(@pointer, result, source_object, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::SocketConnection.new(_retval, GICrystal::Transfer::Full)
    end

    # Blocks waiting for a client to connect to any of the sockets added
    # to the listener. Returns the #GSocket that was accepted.
    #
    # If you want to accept the high-level #GSocketConnection, not a #GSocket,
    # which is often the case, then you should use g_socket_listener_accept()
    # instead.
    #
    # If @source_object is not %NULL it will be filled out with the source
    # object specified when the corresponding socket or address was added
    # to the listener.
    #
    # If @cancellable is not %NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
    def accept_socket(cancellable : Gio::Cancellable?) : Gio::Socket
      # g_socket_listener_accept_socket: (Method | Throws)
      # @source_object: (out) (nullable) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      source_object = Pointer(Pointer(Void)).null # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_listener_accept_socket(@pointer, source_object, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::Socket.new(_retval, GICrystal::Transfer::Full)
    end

    # This is the asynchronous version of g_socket_listener_accept_socket().
    #
    # When the operation is finished @callback will be
    # called. You can then call g_socket_listener_accept_socket_finish()
    # to get the result of the operation.
    def accept_socket_async(cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_socket_listener_accept_socket_async: (Method)
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
      LibGio.g_socket_listener_accept_socket_async(@pointer, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an async accept operation. See g_socket_listener_accept_socket_async()
    def accept_socket_finish(result : Gio::AsyncResult) : Gio::Socket
      # g_socket_listener_accept_socket_finish: (Method | Throws)
      # @source_object: (out) (nullable) (optional)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      source_object = Pointer(Pointer(Void)).null
      # C call
      _retval = LibGio.g_socket_listener_accept_socket_finish(@pointer, result, source_object, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::Socket.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a socket of type @type and protocol @protocol, binds
    # it to @address and adds it to the set of sockets we're accepting
    # sockets from.
    #
    # Note that adding an IPv6 address, depending on the platform,
    # may or may not result in a listener that also accepts IPv4
    # connections.  For more deterministic behavior, see
    # g_socket_listener_add_inet_port().
    #
    # @source_object will be passed out in the various calls
    # to accept to identify this particular source, which is
    # useful if you're listening on multiple addresses and do
    # different things depending on what address is connected to.
    #
    # If successful and @effective_address is non-%NULL then it will
    # be set to the address that the binding actually occurred at.  This
    # is helpful for determining the port number that was used for when
    # requesting a binding to port 0 (ie: "any port").  This address, if
    # requested, belongs to the caller and must be freed.
    #
    # Call g_socket_listener_close() to stop listening on @address; this will not
    # be done automatically when you drop your final reference to @listener, as
    # references may be held internally.
    def add_address(address : Gio::SocketAddress, type : Gio::SocketType, protocol : Gio::SocketProtocol, source_object : GObject::Object?) : Bool
      # g_socket_listener_add_address: (Method | Throws)
      # @source_object: (nullable)
      # @effective_address: (out) (transfer full) (optional)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      source_object = if source_object.nil?
                        Pointer(Void).null
                      else
                        source_object.to_unsafe
                      end
      # Generator::OutArgUsedInReturnPlan
      effective_address = Pointer(Pointer(Void)).null
      # C call
      _retval = LibGio.g_socket_listener_add_address(@pointer, address, type, protocol, source_object, effective_address, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Listens for TCP connections on any available port number for both
    # IPv6 and IPv4 (if each is available).
    #
    # This is useful if you need to have a socket for incoming connections
    # but don't care about the specific port number.
    #
    # @source_object will be passed out in the various calls
    # to accept to identify this particular source, which is
    # useful if you're listening on multiple addresses and do
    # different things depending on what address is connected to.
    def add_any_inet_port(source_object : GObject::Object?) : UInt16
      # g_socket_listener_add_any_inet_port: (Method | Throws)
      # @source_object: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      source_object = if source_object.nil?
                        Pointer(Void).null
                      else
                        source_object.to_unsafe
                      end

      # C call
      _retval = LibGio.g_socket_listener_add_any_inet_port(@pointer, source_object, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Helper function for g_socket_listener_add_address() that
    # creates a TCP/IP socket listening on IPv4 and IPv6 (if
    # supported) on the specified port on all interfaces.
    #
    # @source_object will be passed out in the various calls
    # to accept to identify this particular source, which is
    # useful if you're listening on multiple addresses and do
    # different things depending on what address is connected to.
    #
    # Call g_socket_listener_close() to stop listening on @port; this will not
    # be done automatically when you drop your final reference to @listener, as
    # references may be held internally.
    def add_inet_port(port : UInt16, source_object : GObject::Object?) : Bool
      # g_socket_listener_add_inet_port: (Method | Throws)
      # @source_object: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      source_object = if source_object.nil?
                        Pointer(Void).null
                      else
                        source_object.to_unsafe
                      end

      # C call
      _retval = LibGio.g_socket_listener_add_inet_port(@pointer, port, source_object, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Adds @socket to the set of sockets that we try to accept
    # new clients from. The socket must be bound to a local
    # address and listened to.
    #
    # @source_object will be passed out in the various calls
    # to accept to identify this particular source, which is
    # useful if you're listening on multiple addresses and do
    # different things depending on what address is connected to.
    #
    # The @socket will not be automatically closed when the @listener is finalized
    # unless the listener held the final reference to the socket. Before GLib 2.42,
    # the @socket was automatically closed on finalization of the @listener, even
    # if references to it were held elsewhere.
    def add_socket(socket : Gio::Socket, source_object : GObject::Object?) : Bool
      # g_socket_listener_add_socket: (Method | Throws)
      # @source_object: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      source_object = if source_object.nil?
                        Pointer(Void).null
                      else
                        source_object.to_unsafe
                      end

      # C call
      _retval = LibGio.g_socket_listener_add_socket(@pointer, socket, source_object, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Closes all the sockets in the listener.
    def close : Nil
      # g_socket_listener_close: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_listener_close(@pointer)

      # Return value handling
    end

    # Sets the listen backlog on the sockets in the listener. This must be called
    # before adding any sockets, addresses or ports to the #GSocketListener (for
    # example, by calling g_socket_listener_add_inet_port()) to be effective.
    #
    # See g_socket_set_listen_backlog() for details
    def backlog=(listen_backlog : Int32) : Nil
      # g_socket_listener_set_backlog: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_listener_set_backlog(@pointer, listen_backlog)

      # Return value handling
    end

    # Emitted when @listener's activity on @socket changes state.
    # Note that when @listener is used to listen on both IPv4 and
    # IPv6, a separate set of signals will be emitted for each, and
    # the order they happen in is undefined.
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

      def connect(&block : Proc(Gio::SocketListenerEvent, Gio::Socket, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::SocketListenerEvent, Gio::Socket, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gio::SocketListenerEvent, Gio::Socket, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_event : UInt32, lib_socket : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          event = Gio::SocketListenerEvent.new(lib_event)
          # Generator::BuiltInTypeArgPlan
          socket = Gio::Socket.new(lib_socket, :none)
          ::Box(Proc(Gio::SocketListenerEvent, Gio::Socket, Nil)).unbox(_lib_box).call(event, socket)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::SocketListenerEvent, Gio::Socket, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_event : UInt32, lib_socket : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          event = Gio::SocketListenerEvent.new(lib_event)
          # Generator::BuiltInTypeArgPlan
          socket = Gio::Socket.new(lib_socket, :none)
          ::Box(Proc(Gio::SocketListenerEvent, Gio::Socket, Nil)).unbox(_lib_box).call(event, socket)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::SocketListener, Gio::SocketListenerEvent, Gio::Socket, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_event : UInt32, lib_socket : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::SocketListener.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          event = Gio::SocketListenerEvent.new(lib_event)
          # Generator::BuiltInTypeArgPlan
          socket = Gio::Socket.new(lib_socket, :none)
          ::Box(Proc(Gio::SocketListener, Gio::SocketListenerEvent, Gio::Socket, Nil)).unbox(_lib_box).call(_sender, event, socket)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::SocketListener, Gio::SocketListenerEvent, Gio::Socket, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_event : UInt32, lib_socket : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::SocketListener.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          event = Gio::SocketListenerEvent.new(lib_event)
          # Generator::BuiltInTypeArgPlan
          socket = Gio::Socket.new(lib_socket, :none)
          ::Box(Proc(Gio::SocketListener, Gio::SocketListenerEvent, Gio::Socket, Nil)).unbox(_lib_box).call(_sender, event, socket)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(event : Gio::SocketListenerEvent, socket : Gio::Socket) : Nil
        LibGObject.g_signal_emit_by_name(@source, "event", event, socket)
      end
    end

    def event_signal
      EventSignal.new(self)
    end
  end
end
