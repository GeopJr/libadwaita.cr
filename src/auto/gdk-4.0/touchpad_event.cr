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

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
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
      LibGdk.gdk_touchpad_event_get_deltas(self, dx, dy)

      # Return value handling
    end

    # Extracts the touchpad gesture phase from a touchpad event.
    def gesture_phase : Gdk::TouchpadGesturePhase
      # gdk_touchpad_event_get_gesture_phase: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_touchpad_event_get_gesture_phase(self)

      # Return value handling

      Gdk::TouchpadGesturePhase.new(_retval)
    end

    # Extracts the number of fingers from a touchpad event.
    def n_fingers : UInt32
      # gdk_touchpad_event_get_n_fingers: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_touchpad_event_get_n_fingers(self)

      # Return value handling

      _retval
    end

    # Extracts the angle delta from a touchpad pinch event.
    def pinch_angle_delta : Float64
      # gdk_touchpad_event_get_pinch_angle_delta: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_touchpad_event_get_pinch_angle_delta(self)

      # Return value handling

      _retval
    end

    # Extracts the scale from a touchpad pinch event.
    def pinch_scale : Float64
      # gdk_touchpad_event_get_pinch_scale: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_touchpad_event_get_pinch_scale(self)

      # Return value handling

      _retval
    end
  end
end
