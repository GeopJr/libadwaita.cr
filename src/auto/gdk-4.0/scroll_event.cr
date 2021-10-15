require "./event"

module Gdk
  # An event related to a scrolling motion.
  class ScrollEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_scroll_event_get_type
    end

    def deltas(delta_x : Float64, delta_y : Float64) : Nil
      # gdk_scroll_event_get_deltas: (Method)
      # @delta_x: (out) (transfer full)
      # @delta_y: (out) (transfer full)
      # Returns: (transfer none)

      LibGdk.gdk_scroll_event_get_deltas(self, delta_x, delta_y)
    end

    def direction : Gdk::ScrollDirection
      # gdk_scroll_event_get_direction: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_scroll_event_get_direction(self)
      Gdk::ScrollDirection.from_value(_retval)
    end

    def is_stop : Bool
      # gdk_scroll_event_is_stop: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_scroll_event_is_stop(self)
      GICrystal.to_bool(_retval)
    end
  end
end
