require "./event"

module Gdk
  # An event related to a gesture on a touchpad device.
  #
  # Unlike touchscreens, where the windowing system sends basic
  # sequences of begin, update, end events, and leaves gesture
  # recognition to the clients, touchpad gestures are typically
  # processed by the system, resulting in these events.
  class TouchpadEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_touchpad_event_get_type
    end

    def deltas(dx : Float64, dy : Float64) : Nil
      # gdk_touchpad_event_get_deltas: (Method)
      # @dx: (out) (transfer full)
      # @dy: (out) (transfer full)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_touchpad_event_get_deltas(self, dx, dy)

      # Return value handling
    end

    def gesture_phase : Gdk::TouchpadGesturePhase
      # gdk_touchpad_event_get_gesture_phase: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_touchpad_event_get_gesture_phase(self)

      # Return value handling
      Gdk::TouchpadGesturePhase.from_value(_retval)
    end

    def n_fingers : UInt32
      # gdk_touchpad_event_get_n_fingers: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_touchpad_event_get_n_fingers(self)

      # Return value handling
      _retval
    end

    def pinch_angle_delta : Float64
      # gdk_touchpad_event_get_pinch_angle_delta: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_touchpad_event_get_pinch_angle_delta(self)

      # Return value handling
      _retval
    end

    def pinch_scale : Float64
      # gdk_touchpad_event_get_pinch_scale: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_touchpad_event_get_pinch_scale(self)

      # Return value handling
      _retval
    end
  end
end
