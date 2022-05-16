require "./socket_listener"

module Gio
  # A #GSocketService is an object that represents a service that
  # is provided to the network or over local sockets.  When a new
  # connection is made to the service the #GSocketService::incoming
  # signal is emitted.
  #
  # A #GSocketService is a subclass of #GSocketListener and you need
  # to add the addresses you want to accept connections on with the
  # #GSocketListener APIs.
  #
  # There are two options for implementing a network service based on
  # #GSocketService. The first is to create the service using
  # g_socket_service_new() and to connect to the #GSocketService::incoming
  # signal. The second is to subclass #GSocketService and override the
  # default signal handler implementation.
  #
  # In either case, the handler must immediately return, or else it
  # will block additional incoming connections from being serviced.
  # If you are interested in writing connection handlers that contain
  # blocking code then see #GThreadedSocketService.
  #
  # The socket service runs on the main loop of the
  # [thread-default context][g-main-context-push-thread-default-context]
  # of the thread it is created in, and is not
  # threadsafe in general. However, the calls to start and stop the
  # service are thread-safe so these can be used from threads that
  # handle incoming clients.
  @[GObject::GeneratedWrapper]
  class SocketService < SocketListener
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::SocketServiceClass), class_init,
        sizeof(LibGio::SocketService), instance_init, 0)
    end

    GICrystal.define_new_method(SocketService, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `SocketService`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, active : Bool? = nil, listen_backlog : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !active.nil?
        (_names.to_unsafe + _n).value = "active".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, active)
        _n += 1
      end
      if !listen_backlog.nil?
        (_names.to_unsafe + _n).value = "listen-backlog".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, listen_backlog)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SocketService.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_socket_service_get_type
    end

    def active=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "active", unsafe_value, Pointer(Void).null)
      value
    end

    def active? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "active", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a new #GSocketService with no sockets to listen for.
    # New listeners can be added with e.g. g_socket_listener_add_address()
    # or g_socket_listener_add_inet_port().
    #
    # New services are created active, there is no need to call
    # g_socket_service_start(), unless g_socket_service_stop() has been
    # called before.
    def initialize
      # g_socket_service_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_socket_service_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Check whether the service is active or not. An active
    # service will accept new clients that connect, while
    # a non-active service will let connecting clients queue
    # up until the service is started.
    def is_active : Bool
      # g_socket_service_is_active: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_service_is_active(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Restarts the service, i.e. start accepting connections
    # from the added sockets when the mainloop runs. This only needs
    # to be called after the service has been stopped from
    # g_socket_service_stop().
    #
    # This call is thread-safe, so it may be called from a thread
    # handling an incoming client request.
    def start : Nil
      # g_socket_service_start: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_service_start(@pointer)

      # Return value handling
    end

    # Stops the service, i.e. stops accepting connections
    # from the added sockets when the mainloop runs.
    #
    # This call is thread-safe, so it may be called from a thread
    # handling an incoming client request.
    #
    # Note that this only stops accepting new connections; it does not
    # close the listening sockets, and you can call
    # g_socket_service_start() again later to begin listening again. To
    # close the listening sockets, call g_socket_listener_close(). (This
    # will happen automatically when the #GSocketService is finalized.)
    #
    # This must be called before calling g_socket_listener_close() as
    # the socket service will start accepting connections immediately
    # when a new socket is added.
    def stop : Nil
      # g_socket_service_stop: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_service_stop(@pointer)

      # Return value handling
    end

    # The ::incoming signal is emitted when a new incoming connection
    # to @service needs to be handled. The handler must initiate the
    # handling of @connection, but may not block; in essence,
    # asynchronous operations must be used.
    #
    # @connection will be unreffed once the signal handler returns,
    # so you need to ref it yourself if you are planning to use it.
    struct IncomingSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "incoming::#{@detail}" : "incoming"
      end

      def connect(&block : Proc(Gio::SocketConnection, GObject::Object?, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::SocketConnection, GObject::Object?, Bool))
        connect(block)
      end

      def connect(handler : Proc(Gio::SocketConnection, GObject::Object?, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_connection : Pointer(Void), lib_source_object : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          connection = Gio::SocketConnection.new(lib_connection, :none)
          # Generator::NullableArrayPlan
          source_object = (lib_source_object.null? ? nil : GObject::Object.new(lib_source_object, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          source_object = GObject::Object.new(lib_source_object, :none) unless lib_source_object.null?
          ::Box(Proc(Gio::SocketConnection, GObject::Object?, Bool)).unbox(_lib_box).call(connection, source_object)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::SocketConnection, GObject::Object?, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_connection : Pointer(Void), lib_source_object : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          connection = Gio::SocketConnection.new(lib_connection, :none)
          # Generator::NullableArrayPlan
          source_object = (lib_source_object.null? ? nil : GObject::Object.new(lib_source_object, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          source_object = GObject::Object.new(lib_source_object, :none) unless lib_source_object.null?
          ::Box(Proc(Gio::SocketConnection, GObject::Object?, Bool)).unbox(_lib_box).call(connection, source_object)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::SocketService, Gio::SocketConnection, GObject::Object?, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_connection : Pointer(Void), lib_source_object : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::SocketService.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          connection = Gio::SocketConnection.new(lib_connection, :none)
          # Generator::NullableArrayPlan
          source_object = (lib_source_object.null? ? nil : GObject::Object.new(lib_source_object, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          source_object = GObject::Object.new(lib_source_object, :none) unless lib_source_object.null?
          ::Box(Proc(Gio::SocketService, Gio::SocketConnection, GObject::Object?, Bool)).unbox(_lib_box).call(_sender, connection, source_object)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::SocketService, Gio::SocketConnection, GObject::Object?, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_connection : Pointer(Void), lib_source_object : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::SocketService.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          connection = Gio::SocketConnection.new(lib_connection, :none)
          # Generator::NullableArrayPlan
          source_object = (lib_source_object.null? ? nil : GObject::Object.new(lib_source_object, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          source_object = GObject::Object.new(lib_source_object, :none) unless lib_source_object.null?
          ::Box(Proc(Gio::SocketService, Gio::SocketConnection, GObject::Object?, Bool)).unbox(_lib_box).call(_sender, connection, source_object)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(connection : Gio::SocketConnection, source_object : GObject::Object?) : Nil
        # Generator::NullableArrayPlan
        source_object = if source_object.nil?
                          Void.null
                        else
                          source_object.to_unsafe
                        end

        LibGObject.g_signal_emit_by_name(@source, "incoming", connection, source_object)
      end
    end

    def incoming_signal
      IncomingSignal.new(self)
    end
  end
end
