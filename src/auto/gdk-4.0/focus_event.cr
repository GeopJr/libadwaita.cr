require "./event"

module Gdk
  # An event related to a keyboard focus change.
  class FocusEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_focus_event_get_type
    end

    def in? : Bool
      # gdk_focus_event_get_in: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_focus_event_get_in(self)
      GICrystal.to_bool(_retval)
    end
  end
end
