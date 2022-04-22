require "./event"

module Gdk
  # An event related to a touch-based device.
  @[GObject::GeneratedWrapper]
  class TouchEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::TouchEvent), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_touch_event_get_type
    end

    # Extracts whether a touch event is emulating a pointer event.
    def emulating_pointer : Bool
      # gdk_touch_event_get_emulating_pointer: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_touch_event_get_emulating_pointer(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
