module Gio
  # The #GDBusInterface type is the base type for D-Bus interfaces both
  # on the service side (see #GDBusInterfaceSkeleton) and client side
  # (see #GDBusProxy).
  module DBusInterface
    def object : Gio::DBusObject?
      # g_dbus_interface_dup_object: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_interface_dup_object(self)
      Gio::DBusObject__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def info : Gio::DBusInterfaceInfo
      # g_dbus_interface_get_info: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_interface_get_info(self)
      Gio::DBusInterfaceInfo.new(_retval, GICrystal::Transfer::None)
    end

    def object=(object : Gio::DBusObject?) : Nil
      # g_dbus_interface_set_object: (Method)
      # @object: (nullable)
      # Returns: (transfer none)

      object = if object.nil?
                 Pointer(Void).null
               else
                 object.to_unsafe
               end

      LibGio.g_dbus_interface_set_object(self, object)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class DBusInterface__Impl
    include DBusInterface

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
      LibGio.g_dbus_interface_get_type
    end

    # Cast a `GObject::Object` to `DBusInterface`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to DBusInterface")
    end

    # Cast a `GObject::Object` to `DBusInterface`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
