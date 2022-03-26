module Gio
  # #GDebugController is an interface to expose control of debugging features and
  # debug output.
  #
  # It is implemented on Linux using #GDebugControllerDBus, which exposes a D-Bus
  # interface to allow authenticated peers to control debug features in this
  # process.
  #
  # Whether debug output is enabled is exposed as
  # #GDebugController:debug-enabled. This controls g_log_set_debug_enabled() by
  # default. Application code may connect to the #GObject::notify signal for it
  # to control other parts of its debug infrastructure as necessary.
  #
  # If your application or service is using the default GLib log writer function,
  # creating one of the built-in implementations of #GDebugController should be
  # all that’s needed to dynamically enable or disable debug output.
  module DebugController
    def debug_enabled=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "debug-enabled", unsafe_value, Pointer(Void).null)
      value
    end

    def debug_enabled? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "debug-enabled", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def debug_enabled : Bool
      # g_debug_controller_get_debug_enabled: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_debug_controller_get_debug_enabled(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def debug_enabled=(debug_enabled : Bool) : Nil
      # g_debug_controller_set_debug_enabled: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_debug_controller_set_debug_enabled(self, debug_enabled)

      # Return value handling
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class DebugController__Impl < GObject::Object
    include DebugController

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_debug_controller_get_type
    end

    # Cast a `GObject::Object` to `DebugController`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to DebugController")
    end

    # Cast a `GObject::Object` to `DebugController`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
