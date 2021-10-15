require "./event"

module Gdk
  # An event related to a pointer or touch device motion.
  class MotionEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_motion_event_get_type
    end
  end
end
