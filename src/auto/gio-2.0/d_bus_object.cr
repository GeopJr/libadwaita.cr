module Gio
  # The #GDBusObject type is the base type for D-Bus objects on both
  # the service side (see #GDBusObjectSkeleton) and the client side
  # (see #GDBusObjectProxy). It is essentially just a container of
  # interfaces.
  module DBusObject
    def interface(interface_name : ::String) : Gio::DBusInterface?
      # g_dbus_object_get_interface: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_object_get_interface(self, interface_name)
      Gio::DBusInterface__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def interfaces : GLib::List
      # g_dbus_object_get_interfaces: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_object_get_interfaces(self)
      GLib::List(Gio::DBusInterface).new(_retval, GICrystal::Transfer::Full)
    end

    def object_path : ::String
      # g_dbus_object_get_object_path: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_object_get_object_path(self)
      ::String.new(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class DBusObject__Impl
    include DBusObject

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_object_get_type
    end

    # Cast a `GObject::Object` to `DBusObject`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to DBusObject")
    end

    # Cast a `GObject::Object` to `DBusObject`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
