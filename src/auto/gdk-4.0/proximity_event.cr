require "./event"

module Gdk
  # An event related to the proximity of a tool to a device.
  class ProximityEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_proximity_event_get_type
    end
  end
end
