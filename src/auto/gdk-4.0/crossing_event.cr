require "./event"

module Gdk
  # An event caused by a pointing device moving between surfaces.
  class CrossingEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_crossing_event_get_type
    end

    def detail : Gdk::NotifyType
      # gdk_crossing_event_get_detail: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_crossing_event_get_detail(self)

      # Return value handling
      Gdk::NotifyType.from_value(_retval)
    end

    def focus : Bool
      # gdk_crossing_event_get_focus: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_crossing_event_get_focus(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def mode : Gdk::CrossingMode
      # gdk_crossing_event_get_mode: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_crossing_event_get_mode(self)

      # Return value handling
      Gdk::CrossingMode.from_value(_retval)
    end
  end
end
