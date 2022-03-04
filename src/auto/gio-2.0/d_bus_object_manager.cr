module Gio
  # The #GDBusObjectManager type is the base type for service- and
  # client-side implementations of the standardized
  # [org.freedesktop.DBus.ObjectManager](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager)
  # interface.
  #
  # See #GDBusObjectManagerClient for the client-side implementation
  # and #GDBusObjectManagerServer for the service-side implementation.
  module DBusObjectManager
    def interface(object_path : ::String, interface_name : ::String) : Gio::DBusInterface?
      # g_dbus_object_manager_get_interface: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_object_manager_get_interface(self, object_path, interface_name)

      # Return value handling
      Gio::DBusInterface__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def object(object_path : ::String) : Gio::DBusObject?
      # g_dbus_object_manager_get_object: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_object_manager_get_object(self, object_path)

      # Return value handling
      Gio::DBusObject__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def object_path : ::String
      # g_dbus_object_manager_get_object_path: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_object_manager_get_object_path(self)

      # Return value handling
      ::String.new(_retval)
    end

    def objects : GLib::List
      # g_dbus_object_manager_get_objects: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_object_manager_get_objects(self)

      # Return value handling
      GLib::List(Gio::DBusObject).new(_retval, GICrystal::Transfer::Full)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class DBusObjectManager__Impl < GObject::Object
    include DBusObjectManager

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_object_manager_get_type
    end

    # Cast a `GObject::Object` to `DBusObjectManager`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to DBusObjectManager")
    end

    # Cast a `GObject::Object` to `DBusObjectManager`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
