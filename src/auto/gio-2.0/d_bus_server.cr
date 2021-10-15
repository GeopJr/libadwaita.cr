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
  class DBusServer < GObject::Object
    include Initable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, active : Bool? = nil, address : ::String? = nil, authentication_observer : Gio::DBusAuthObserver? = nil, client_address : ::String? = nil, flags : Gio::DBusServerFlags? = nil, guid : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if active
        (_names.to_unsafe + _n).value = "active".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, active)
        _n += 1
      end
      if address
        (_names.to_unsafe + _n).value = "address".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, address)
        _n += 1
      end
      if authentication_observer
        (_names.to_unsafe + _n).value = "authentication-observer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, authentication_observer)
        _n += 1
      end
      if client_address
        (_names.to_unsafe + _n).value = "client-address".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, client_address)
        _n += 1
      end
      if flags
        (_names.to_unsafe + _n).value = "flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flags)
        _n += 1
      end
      if guid
        (_names.to_unsafe + _n).value = "guid".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, guid)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DBusServer.g_type, _n, _names, _values)
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

    def authentication_observer=(value : DBusAuthObserver?) : DBusAuthObserver?
      unsafe_value = value

      LibGObject.g_object_set(self, "authentication-observer", unsafe_value, Pointer(Void).null)
      value
    end

    def authentication_observer : DBusAuthObserver?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "authentication-observer", pointerof(value), Pointer(Void).null)
      Gio::DBusAuthObserver.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def flags=(value : DBusServerFlags) : DBusServerFlags
      unsafe_value = value

      LibGObject.g_object_set(self, "flags", unsafe_value, Pointer(Void).null)
      value
    end

    def guid=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "guid", unsafe_value, Pointer(Void).null)
      value
    end

    def self.new_sync(address : ::String, flags : Gio::DBusServerFlags, guid : ::String, observer : Gio::DBusAuthObserver?, cancellable : Gio::Cancellable?) : Gio::DBusServer
      # g_dbus_server_new_sync: (Constructor | Throws)
      # @observer: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      observer = if observer.nil?
                   Pointer(Void).null
                 else
                   observer.to_unsafe
                 end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_dbus_server_new_sync(address, flags, guid, observer, cancellable)
      Gio::DBusServer.new(_retval, GICrystal::Transfer::Full)
    end

    def client_address : ::String
      # g_dbus_server_get_client_address: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_server_get_client_address(self)
      ::String.new(_retval)
    end

    def flags : Gio::DBusServerFlags
      # g_dbus_server_get_flags: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_server_get_flags(self)
      Gio::DBusServerFlags.from_value(_retval)
    end

    def guid : ::String
      # g_dbus_server_get_guid: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_server_get_guid(self)
      ::String.new(_retval)
    end

    def is_active : Bool
      # g_dbus_server_is_active: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_server_is_active(self)
      GICrystal.to_bool(_retval)
    end

    def start : Nil
      # g_dbus_server_start: (Method)
      # Returns: (transfer none)

      LibGio.g_dbus_server_start(self)
    end

    def stop : Nil
      # g_dbus_server_stop: (Method)
      # Returns: (transfer none)

      LibGio.g_dbus_server_stop(self)
    end

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

      def connect(block : Proc(Gio::DBusConnection, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::DBusConnection.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusConnection, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusConnection, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::DBusConnection.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusConnection, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::DBusServer, Gio::DBusConnection, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusServer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::DBusConnection.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusServer, Gio::DBusConnection, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusServer, Gio::DBusConnection, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusServer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::DBusConnection.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusServer, Gio::DBusConnection, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
