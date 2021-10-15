require "./event"

module Gdk
  # An event related to a broken windowing system grab.
  class GrabBrokenEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_grab_broken_event_get_type
    end

    def grab_surface : Gdk::Surface
      # gdk_grab_broken_event_get_grab_surface: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_grab_broken_event_get_grab_surface(self)
      Gdk::Surface.new(_retval, GICrystal::Transfer::None)
    end

    def implicit? : Bool
      # gdk_grab_broken_event_get_implicit: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_grab_broken_event_get_implicit(self)
      GICrystal.to_bool(_retval)
    end
  end
end
