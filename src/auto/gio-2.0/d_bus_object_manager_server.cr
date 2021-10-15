require "../g_object-2.0/object"
require "./d_bus_object_manager"

module Gio
  # #GDBusObjectManagerServer is used to export #GDBusObject instances using
  # the standardized
  # [org.freedesktop.DBus.ObjectManager](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager)
  # interface. For example, remote D-Bus clients can get all objects
  # and properties in a single call. Additionally, any change in the
  # object hierarchy is broadcast using signals. This means that D-Bus
  # clients can keep caches up to date by only listening to D-Bus
  # signals.
  #
  # The recommended path to export an object manager at is the path form of the
  # well-known name of a D-Bus service, or below. For example, if a D-Bus service
  # is available at the well-known name `net.example.ExampleService1`, the object
  # manager should typically be exported at `/net/example/ExampleService1`, or
  # below (to allow for multiple object managers in a service).
  #
  # It is supported, but not recommended, to export an object manager at the root
  # path, `/`.
  #
  # See #GDBusObjectManagerClient for the client-side code that is
  # intended to be used with #GDBusObjectManagerServer or any D-Bus
  # object implementing the org.freedesktop.DBus.ObjectManager
  # interface.
  class DBusObjectManagerServer < GObject::Object
    include DBusObjectManager

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, connection : Gio::DBusConnection? = nil, object_path : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if connection
        (_names.to_unsafe + _n).value = "connection".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, connection)
        _n += 1
      end
      if object_path
        (_names.to_unsafe + _n).value = "object-path".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, object_path)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DBusObjectManagerServer.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_object_manager_server_get_type
    end

    def object_path=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "object-path", unsafe_value, Pointer(Void).null)
      value
    end

    def object_path : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "object-path", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def initialize(object_path : ::String)
      # g_dbus_object_manager_server_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_object_manager_server_new(object_path)
      @pointer = _retval
    end

    def export(object : Gio::DBusObjectSkeleton) : Nil
      # g_dbus_object_manager_server_export: (Method)
      # Returns: (transfer none)

      LibGio.g_dbus_object_manager_server_export(self, object)
    end

    def export_uniquely(object : Gio::DBusObjectSkeleton) : Nil
      # g_dbus_object_manager_server_export_uniquely: (Method)
      # Returns: (transfer none)

      LibGio.g_dbus_object_manager_server_export_uniquely(self, object)
    end

    def connection : Gio::DBusConnection?
      # g_dbus_object_manager_server_get_connection: (Method | Getter)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_object_manager_server_get_connection(self)
      Gio::DBusConnection.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def is_exported(object : Gio::DBusObjectSkeleton) : Bool
      # g_dbus_object_manager_server_is_exported: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_object_manager_server_is_exported(self, object)
      GICrystal.to_bool(_retval)
    end

    def connection=(connection : Gio::DBusConnection?) : Nil
      # g_dbus_object_manager_server_set_connection: (Method | Setter)
      # @connection: (nullable)
      # Returns: (transfer none)

      connection = if connection.nil?
                     Pointer(Void).null
                   else
                     connection.to_unsafe
                   end

      LibGio.g_dbus_object_manager_server_set_connection(self, connection)
    end

    def unexport(object_path : ::String) : Bool
      # g_dbus_object_manager_server_unexport: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_object_manager_server_unexport(self, object_path)
      GICrystal.to_bool(_retval)
    end
  end
end
