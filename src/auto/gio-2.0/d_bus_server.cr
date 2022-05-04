require "../g_object-2.0/object"
require "./initable"

module Gio
  # #GDBusServer is a helper for listening to and accepting D-Bus
  # connections. This can be used to create a new D-Bus server, allowing two
  # peers to use the D-Bus protocol for their own specialized communication.
  # A server instance provided in this way will not perform message routing or
  # implement the org.freedesktop.DBus interface.
  #
  # To just export an object on a well-known name on a message bus, such as the
  # session or system bus, you should instead use g_bus_own_name().
  #
  # An example of peer-to-peer communication with GDBus can be found
  # in [gdbus-example-peer.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-peer.c).
  #
  # Note that a minimal #GDBusServer will accept connections from any
  # peer. In many use-cases it will be necessary to add a #GDBusAuthObserver
  # that only accepts connections that have successfully authenticated
  # as the same user that is running the #GDBusServer. Since GLib 2.68 this can
  # be achieved more simply by passing the
  # %G_DBUS_SERVER_FLAGS_AUTHENTICATION_REQUIRE_SAME_USER flag to the server.
  @[GObject::GeneratedWrapper]
  class DBusServer < GObject::Object
    include Initable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGio::DBusServer), instance_init, 0)
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

    def initialize(*, active : Bool? = nil, address : ::String? = nil, authentication_observer : Gio::DBusAuthObserver? = nil, client_address : ::String? = nil, flags : Gio::DBusServerFlags? = nil, guid : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if !active.nil?
        (_names.to_unsafe + _n).value = "active".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, active)
        _n += 1
      end
      if !address.nil?
        (_names.to_unsafe + _n).value = "address".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, address)
        _n += 1
      end
      if !authentication_observer.nil?
        (_names.to_unsafe + _n).value = "authentication-observer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, authentication_observer)
        _n += 1
      end
      if !client_address.nil?
        (_names.to_unsafe + _n).value = "client-address".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, client_address)
        _n += 1
      end
      if !flags.nil?
        (_names.to_unsafe + _n).value = "flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flags)
        _n += 1
      end
      if !guid.nil?
        (_names.to_unsafe + _n).value = "guid".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, guid)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DBusServer.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_server_get_type
    end

    def active? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "active", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def address=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "address", unsafe_value, Pointer(Void).null)
      value
    end

    def address : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "address", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def authentication_observer=(value : Gio::DBusAuthObserver?) : Gio::DBusAuthObserver?
      unsafe_value = value

      LibGObject.g_object_set(self, "authentication-observer", unsafe_value, Pointer(Void).null)
      value
    end

    def authentication_observer : Gio::DBusAuthObserver?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "authentication-observer", pointerof(value), Pointer(Void).null)
      Gio::DBusAuthObserver.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def client_address : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "client-address", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def flags=(value : Gio::DBusServerFlags) : Gio::DBusServerFlags
      unsafe_value = value

      LibGObject.g_object_set(self, "flags", unsafe_value, Pointer(Void).null)
      value
    end

    def flags : Gio::DBusServerFlags
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "flags", pointerof(value), Pointer(Void).null)
      Gio::DBusServerFlags.new(value)
    end

    def guid=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "guid", unsafe_value, Pointer(Void).null)
      value
    end

    def guid : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "guid", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Creates a new D-Bus server that listens on the first address in
    # @address that works.
    #
    # Once constructed, you can use g_dbus_server_get_client_address() to
    # get a D-Bus address string that clients can use to connect.
    #
    # To have control over the available authentication mechanisms and
    # the users that are authorized to connect, it is strongly recommended
    # to provide a non-%NULL #GDBusAuthObserver.
    #
    # Connect to the #GDBusServer::new-connection signal to handle
    # incoming connections.
    #
    # The returned #GDBusServer isn't active - you have to start it with
    # g_dbus_server_start().
    #
    # #GDBusServer is used in this [example][gdbus-peer-to-peer].
    #
    # This is a synchronous failable constructor. There is currently no
    # asynchronous version.
    def self.new_sync(address : ::String, flags : Gio::DBusServerFlags, guid : ::String, observer : Gio::DBusAuthObserver?, cancellable : Gio::Cancellable?) : self
      # g_dbus_server_new_sync: (Constructor | Throws)
      # @observer: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      observer = if observer.nil?
                   Pointer(Void).null
                 else
                   observer.to_unsafe
                 end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_dbus_server_new_sync(address, flags, guid, observer, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::DBusServer.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets a
    # [D-Bus address](https://dbus.freedesktop.org/doc/dbus-specification.html#addresses)
    # string that can be used by clients to connect to @server.
    #
    # This is valid and non-empty if initializing the #GDBusServer succeeded.
    def client_address : ::String
      # g_dbus_server_get_client_address: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_server_get_client_address(self)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the flags for @server.
    def flags : Gio::DBusServerFlags
      # g_dbus_server_get_flags: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_server_get_flags(self)

      # Return value handling

      Gio::DBusServerFlags.new(_retval)
    end

    # Gets the GUID for @server, as provided to g_dbus_server_new_sync().
    def guid : ::String
      # g_dbus_server_get_guid: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_server_get_guid(self)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets whether @server is active.
    def is_active : Bool
      # g_dbus_server_is_active: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_server_is_active(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Starts @server.
    def start : Nil
      # g_dbus_server_start: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_server_start(self)

      # Return value handling
    end

    # Stops @server.
    def stop : Nil
      # g_dbus_server_stop: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_server_stop(self)

      # Return value handling
    end

    # Emitted when a new authenticated connection has been made. Use
    # g_dbus_connection_get_peer_credentials() to figure out what
    # identity (if any), was authenticated.
    #
    # If you want to accept the connection, take a reference to the
    # @connection object and return %TRUE. When you are done with the
    # connection call g_dbus_connection_close() and give up your
    # reference. Note that the other peer may disconnect at any time -
    # a typical thing to do when accepting a connection is to listen to
    # the #GDBusConnection::closed signal.
    #
    # If #GDBusServer:flags contains %G_DBUS_SERVER_FLAGS_RUN_IN_THREAD
    # then the signal is emitted in a new thread dedicated to the
    # connection. Otherwise the signal is emitted in the
    # [thread-default main context][g-main-context-push-thread-default]
    # of the thread that @server was constructed in.
    #
    # You are guaranteed that signal handlers for this signal runs
    # before incoming messages on @connection are processed. This means
    # that it's suitable to call g_dbus_connection_register_object() or
    # similar from the signal handler.
    struct NewConnectionSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "new-connection::#{@detail}" : "new-connection"
      end

      def connect(&block : Proc(Gio::DBusConnection, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::DBusConnection, Bool))
        connect(block)
      end

      def connect(handler : Proc(Gio::DBusConnection, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_connection : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          connection = Gio::DBusConnection.new(lib_connection, :none)
          ::Box(Proc(Gio::DBusConnection, Bool)).unbox(_lib_box).call(connection)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::DBusConnection, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_connection : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          connection = Gio::DBusConnection.new(lib_connection, :none)
          ::Box(Proc(Gio::DBusConnection, Bool)).unbox(_lib_box).call(connection)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::DBusServer, Gio::DBusConnection, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_connection : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::DBusServer.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          connection = Gio::DBusConnection.new(lib_connection, :none)
          ::Box(Proc(Gio::DBusServer, Gio::DBusConnection, Bool)).unbox(_lib_box).call(_sender, connection)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::DBusServer, Gio::DBusConnection, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_connection : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::DBusServer.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          connection = Gio::DBusConnection.new(lib_connection, :none)
          ::Box(Proc(Gio::DBusServer, Gio::DBusConnection, Bool)).unbox(_lib_box).call(_sender, connection)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(connection : Gio::DBusConnection) : Nil
        LibGObject.g_signal_emit_by_name(@source, "new-connection", connection)
      end
    end

    def new_connection_signal
      NewConnectionSignal.new(self)
    end
  end
end
