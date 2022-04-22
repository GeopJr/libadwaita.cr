require "../g_object-2.0/object"
require "./d_bus_object"

module Gio
  # A #GDBusObjectProxy is an object used to represent a remote object
  # with one or more D-Bus interfaces. Normally, you don't instantiate
  # a #GDBusObjectProxy yourself - typically #GDBusObjectManagerClient
  # is used to obtain it.
  @[GObject::GeneratedWrapper]
  class DBusObjectProxy < GObject::Object
    include DBusObject

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::DBusObjectProxyClass), class_init,
        sizeof(LibGio::DBusObjectProxy), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, g_connection : Gio::DBusConnection? = nil, g_object_path : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !g_connection.nil?
        (_names.to_unsafe + _n).value = "g-connection".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_connection)
        _n += 1
      end
      if !g_object_path.nil?
        (_names.to_unsafe + _n).value = "g-object-path".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_object_path)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DBusObjectProxy.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_object_proxy_get_type
    end

    def g_connection=(value : Gio::DBusConnection?) : Gio::DBusConnection?
      unsafe_value = value

      LibGObject.g_object_set(self, "g-connection", unsafe_value, Pointer(Void).null)
      value
    end

    def g_connection : Gio::DBusConnection?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "g-connection", pointerof(value), Pointer(Void).null)
      Gio::DBusConnection.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def g_object_path=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "g-object-path", unsafe_value, Pointer(Void).null)
      value
    end

    def g_object_path : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "g-object-path", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Creates a new #GDBusObjectProxy for the given connection and
    # object path.
    def initialize(connection : Gio::DBusConnection, object_path : ::String)
      # g_dbus_object_proxy_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_object_proxy_new(connection, object_path)

      # Return value handling

      @pointer = _retval
    end

    # Gets the connection that @proxy is for.
    def connection : Gio::DBusConnection
      # g_dbus_object_proxy_get_connection: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_object_proxy_get_connection(self)

      # Return value handling

      Gio::DBusConnection.new(_retval, GICrystal::Transfer::None)
    end
  end
end
