module Gdk
  # `GdkEvent`s are immutable data structures, created by GDK to
  # represent windowing system events.
  #
  # In GTK applications the events are handled automatically by toplevel
  # widgets and passed on to the event controllers of appropriate widgets,
  # so using `GdkEvent` and its related API is rarely needed.
  class Event
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      {% if flag?(:debugmemory) %}
        LibC.printf("~%s at %p - ref count: %d\n", self.class.name.to_unsafe, self, ref_count)
      {% end %}
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Cast a `GObject::Object` to `Event`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Event")
    end

    # Cast a `GObject::Object` to `Event`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_event_get_type
    end

    def _get_angle(event2 : Gdk::Event, angle : Float64) : Bool
      # gdk_events_get_angle: (Method)
      # @angle: (out) (transfer full)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_events_get_angle(self, event2, angle)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def _get_center(event2 : Gdk::Event, x : Float64, y : Float64) : Bool
      # gdk_events_get_center: (Method)
      # @x: (out) (transfer full)
      # @y: (out) (transfer full)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_events_get_center(self, event2, x, y)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def _get_distance(event2 : Gdk::Event, distance : Float64) : Bool
      # gdk_events_get_distance: (Method)
      # @distance: (out) (transfer full)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_events_get_distance(self, event2, distance)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def axes(axes : Enumerable(Float64)) : Bool
      # gdk_event_get_axes: (Method)
      # @axes: (out) (array length=n_axes element-type Double)
      # @n_axes: (out) (transfer full)
      # Returns: (transfer none)

      # Handle parameters
      n_axes = axes.size
      axes = axes.to_a.to_unsafe

      # C call
      _retval = LibGdk.gdk_event_get_axes(self, axes, n_axes)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def axes(*axes : Float64)
      axes(axes)
    end

    def axis(axis_use : Gdk::AxisUse, value : Float64) : Bool
      # gdk_event_get_axis: (Method)
      # @value: (out) (transfer full)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_event_get_axis(self, axis_use, value)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def device : Gdk::Device?
      # gdk_event_get_device: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_event_get_device(self)

      # Return value handling
      Gdk::Device.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def device_tool : Gdk::DeviceTool?
      # gdk_event_get_device_tool: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_event_get_device_tool(self)

      # Return value handling
      Gdk::DeviceTool.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def display : Gdk::Display?
      # gdk_event_get_display: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_event_get_display(self)

      # Return value handling
      Gdk::Display.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def event_sequence : Gdk::EventSequence
      # gdk_event_get_event_sequence: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_event_get_event_sequence(self)

      # Return value handling
      Gdk::EventSequence.new(_retval, GICrystal::Transfer::None)
    end

    def event_type : Gdk::EventType
      # gdk_event_get_event_type: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_event_get_event_type(self)

      # Return value handling
      Gdk::EventType.from_value(_retval)
    end

    def history : Enumerable(Gdk::TimeCoord)?
      # gdk_event_get_history: (Method)
      # @out_n_coords: (out) (transfer full)
      # Returns: (transfer container) (array length=out_n_coords element-type Interface)

      # Handle parameters
      out_n_coords = 0_u32

      # C call
      _retval = LibGdk.gdk_event_get_history(self, pointerof(out_n_coords))

      # Return value handling
      GICrystal.transfer_array(_retval, out_n_coords, GICrystal::Transfer::Container) unless _retval.null?
    end

    def modifier_state : Gdk::ModifierType
      # gdk_event_get_modifier_state: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_event_get_modifier_state(self)

      # Return value handling
      Gdk::ModifierType.from_value(_retval)
    end

    def pointer_emulated : Bool
      # gdk_event_get_pointer_emulated: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_event_get_pointer_emulated(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def position(x : Float64, y : Float64) : Bool
      # gdk_event_get_position: (Method)
      # @x: (out) (transfer full)
      # @y: (out) (transfer full)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_event_get_position(self, x, y)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def seat : Gdk::Seat?
      # gdk_event_get_seat: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_event_get_seat(self)

      # Return value handling
      Gdk::Seat.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def surface : Gdk::Surface
      # gdk_event_get_surface: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_event_get_surface(self)

      # Return value handling
      Gdk::Surface.new(_retval, GICrystal::Transfer::None)
    end

    def time : UInt32
      # gdk_event_get_time: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_event_get_time(self)

      # Return value handling
      _retval
    end

    def ref : Gdk::Event
      # gdk_event_ref: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_event_ref(self)

      # Return value handling
      Gdk::Event.new(_retval, GICrystal::Transfer::Full)
    end

    def triggers_context_menu : Bool
      # gdk_event_triggers_context_menu: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_event_triggers_context_menu(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def unref : Nil
      # gdk_event_unref: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_event_unref(self)

      # Return value handling
    end
  end
end
