require "./event"

module Gdk
  # An event related to a touch-based device.
  class TouchEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_touch_event_get_type
    end

    def emulating_pointer? : Bool
      # gdk_touch_event_get_emulating_pointer: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_touch_event_get_emulating_pointer(self)
      GICrystal.to_bool(_retval)
    end
  end
end
