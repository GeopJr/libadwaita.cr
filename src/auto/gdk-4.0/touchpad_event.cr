require "./event"

module Gdk
  # An event related to a gesture on a touchpad device.
  #
  # Unlike touchscreens, where the windowing system sends basic
  # sequences of begin, update, end events, and leaves gesture
  # recognition to the clients, touchpad gestures are typically
  # processed by the system, resulting in these events.
  @[GObject::GeneratedWrapper]
  class TouchpadEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::TouchpadEvent), instance_init, 0)
    end

    GICrystal.define_new_method(TouchpadEvent, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `TouchpadEvent`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_touchpad_event_get_type
    end

    # Extracts delta information from a touchpad event.
    def deltas(dx : Float64, dy : Float64) : Nil
      # gdk_touchpad_event_get_deltas: (Method)
      # @dx: (out) (transfer full)
      # @dy: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_touchpad_event_get_deltas(@pointer, dx, dy)

      # Return value handling
    end

    # Extracts the touchpad gesture phase from a touchpad event.
    def gesture_phase : Gdk::TouchpadGesturePhase
      # gdk_touchpad_event_get_gesture_phase: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_touchpad_event_get_gesture_phase(@pointer)

      # Return value handling

      Gdk::TouchpadGesturePhase.new(_retval)
    end

    # Extracts the number of fingers from a touchpad event.
    def n_fingers : UInt32
      # gdk_touchpad_event_get_n_fingers: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_touchpad_event_get_n_fingers(@pointer)

      # Return value handling

      _retval
    end

    # Extracts the angle delta from a touchpad pinch event.
    def pinch_angle_delta : Float64
      # gdk_touchpad_event_get_pinch_angle_delta: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_touchpad_event_get_pinch_angle_delta(@pointer)

      # Return value handling

      _retval
    end

    # Extracts the scale from a touchpad pinch event.
    def pinch_scale : Float64
      # gdk_touchpad_event_get_pinch_scale: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_touchpad_event_get_pinch_scale(@pointer)

      # Return value handling

      _retval
    end
  end
end
