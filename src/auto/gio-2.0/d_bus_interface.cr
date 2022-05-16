module Gio
  # The #GDBusInterface type is the base type for D-Bus interfaces both
  # on the service side (see #GDBusInterfaceSkeleton) and client side
  # (see #GDBusProxy).
  module DBusInterface
    def object : Gio::DBusObject?
      # g_dbus_interface_dup_object: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_interface_dup_object(@pointer)

      # Return value handling

      Gio::AbstractDBusObject.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def info : Gio::DBusInterfaceInfo
      # g_dbus_interface_get_info: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_interface_get_info(@pointer)

      # Return value handling

      Gio::DBusInterfaceInfo.new(_retval, GICrystal::Transfer::None)
    end

    def object=(object : Gio::DBusObject?) : Nil
      # g_dbus_interface_set_object: (Method)
      # @object: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      object = if object.nil?
                 Pointer(Void).null
               else
                 object.to_unsafe
               end

      # C call
      LibGio.g_dbus_interface_set_object(@pointer, object)

      # Return value handling
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractDBusInterface < GObject::Object
    include DBusInterface

    GICrystal.define_new_method(Gio::AbstractDBusInterface, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_interface_get_type
    end

    # Cast a `GObject::Object` to `DBusInterface`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to DBusInterface")
    end

    # Cast a `GObject::Object` to `DBusInterface`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
