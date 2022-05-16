module Gdk
  # `GdkEvent`s are immutable data structures, created by GDK to
  # represent windowing system events.
  #
  # In GTK applications the events are handled automatically by toplevel
  # widgets and passed on to the event controllers of appropriate widgets,
  # so using `GdkEvent` and its related API is rarely needed.
  @[GObject::GeneratedWrapper]
  class Event
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::Event), instance_init, 0)
    end

    GICrystal.define_new_method(Event, g_param_spec_get_qdata, g_param_spec_set_qdata)

    # Initialize a new `Event`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      LibGObject.gdk_event_ref(self) if transfer.none?
    end

    # Called by the garbage collector. Decreases the reference count of object.
    # (i.e. its memory is freed).
    def finalize
      {% if flag?(:debugmemory) %}
        LibC.printf("~%s at %p - ref count: %d\n", self.class.name.to_unsafe, self, ref_count)
      {% end %}
      LibGObject.g_param_spec_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).null)
      LibGObject.g_param_spec_set_qdata(self, GICrystal::GC_COLLECTED_QDATA_KEY, Pointer(Void).new(0x1))
      LibGObject.gdk_event_unref(self)
    end

    # Returns a pointer to the C object.
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

    # Returns the relative angle from @event1 to @event2.
    #
    # The relative angle is the angle between the X axis and the line
    # through both events' positions. The rotation direction for positive
    # angles is from the positive X axis towards the positive Y axis.
    #
    # This assumes that both events have X/Y information.
    # If not, this function returns %FALSE.
    def _get_angle(event2 : Gdk::Event, angle : Float64) : Bool
      # gdk_events_get_angle: (Method)
      # @angle: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_events_get_angle(@pointer, event2, angle)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the point halfway between the events' positions.
    #
    # This assumes that both events have X/Y information.
    # If not, this function returns %FALSE.
    def _get_center(event2 : Gdk::Event, x : Float64, y : Float64) : Bool
      # gdk_events_get_center: (Method)
      # @x: (out) (transfer full)
      # @y: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_events_get_center(@pointer, event2, x, y)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the distance between the event locations.
    #
    # This assumes that both events have X/Y information.
    # If not, this function returns %FALSE.
    def _get_distance(event2 : Gdk::Event, distance : Float64) : Bool
      # gdk_events_get_distance: (Method)
      # @distance: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_events_get_distance(@pointer, event2, distance)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Extracts all axis values from an event.
    #
    # To find out which axes are used, use `Gdk::DeviceTool#axes`
    # on the device tool returned by `Gdk::Event#device_tool`.
    def axes(axes : Enumerable(Float64)) : Bool
      # gdk_event_get_axes: (Method)
      # @axes: (out) (array length=n_axes element-type Double)
      # @n_axes: (out) (transfer full)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_axes = axes.size # Generator::ArrayArgPlan
      axes = axes.to_a.to_unsafe

      # C call
      _retval = LibGdk.gdk_event_get_axes(@pointer, axes, n_axes)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def axes(*axes : Float64)
      axes(axes)
    end

    # Extract the axis value for a particular axis use from
    # an event structure.
    #
    # To find out which axes are used, use `Gdk::DeviceTool#axes`
    # on the device tool returned by `Gdk::Event#device_tool`.
    def axis(axis_use : Gdk::AxisUse, value : Float64) : Bool
      # gdk_event_get_axis: (Method)
      # @value: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_event_get_axis(@pointer, axis_use, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the device of an event.
    def device : Gdk::Device?
      # gdk_event_get_device: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_event_get_device(@pointer)

      # Return value handling

      Gdk::Device.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns a `GdkDeviceTool` representing the tool that
    # caused the event.
    #
    # If the was not generated by a device that supports
    # different tools (such as a tablet), this function will
    # return %NULL.
    #
    # Note: the `GdkDeviceTool` will be constant during
    # the application lifetime, if settings must be stored
    # persistently across runs, see `Gdk::DeviceTool#serial`.
    def device_tool : Gdk::DeviceTool?
      # gdk_event_get_device_tool: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_event_get_device_tool(@pointer)

      # Return value handling

      Gdk::DeviceTool.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Retrieves the display associated to the @event.
    def display : Gdk::Display?
      # gdk_event_get_display: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_event_get_display(@pointer)

      # Return value handling

      Gdk::Display.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Retuns the event sequence to which the event belongs.
    #
    # Related touch events are connected in a sequence. Other
    # events typically don't have event sequence information.
    def event_sequence : Gdk::EventSequence
      # gdk_event_get_event_sequence: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_event_get_event_sequence(@pointer)

      # Return value handling

      Gdk::EventSequence.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the type of the event.
    def event_type : Gdk::EventType
      # gdk_event_get_event_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_event_get_event_type(@pointer)

      # Return value handling

      Gdk::EventType.new(_retval)
    end

    # Retrieves the history of the device that @event is for, as a list of
    # time and coordinates.
    #
    # The history includes positions that are not delivered as separate events
    # to the application because they occurred in the same frame as @event.
    #
    # Note that only motion and scroll events record history, and motion
    # events do it only if one of the mouse buttons is down, or the device
    # has a tool.
    def history : Enumerable(Gdk::TimeCoord)?
      # gdk_event_get_history: (Method)
      # @out_n_coords: (out) (transfer full)
      # Returns: (transfer container) (array length=out_n_coords element-type Interface)

      # Generator::OutArgUsedInReturnPlan
      out_n_coords = 0_u32
      # C call
      _retval = LibGdk.gdk_event_get_history(@pointer, pointerof(out_n_coords))

      # Return value handling

      GICrystal.transfer_array(_retval, out_n_coords, GICrystal::Transfer::Container) unless _retval.null?
    end

    # Returns the modifier state field of an event.
    def modifier_state : Gdk::ModifierType
      # gdk_event_get_modifier_state: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_event_get_modifier_state(@pointer)

      # Return value handling

      Gdk::ModifierType.new(_retval)
    end

    # Returns whether this event is an 'emulated' pointer event.
    #
    # Emulated pointer events typically originate from a touch events.
    def pointer_emulated : Bool
      # gdk_event_get_pointer_emulated: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_event_get_pointer_emulated(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Extract the event surface relative x/y coordinates from an event.
    def position(x : Float64, y : Float64) : Bool
      # gdk_event_get_position: (Method)
      # @x: (out) (transfer full)
      # @y: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_event_get_position(@pointer, x, y)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the seat that originated the event.
    def seat : Gdk::Seat?
      # gdk_event_get_seat: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_event_get_seat(@pointer)

      # Return value handling

      Gdk::Seat.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Extracts the surface associated with an event.
    def surface : Gdk::Surface?
      # gdk_event_get_surface: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_event_get_surface(@pointer)

      # Return value handling

      Gdk::Surface.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the timestamp of @event.
    #
    # Not all events have timestamps. In that case, this function
    # returns %GDK_CURRENT_TIME.
    def time : UInt32
      # gdk_event_get_time: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_event_get_time(@pointer)

      # Return value handling

      _retval
    end

    # Increase the ref count of @event.
    def ref : Gdk::Event
      # gdk_event_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_event_ref(@pointer)

      # Return value handling

      Gdk::Event.new(_retval, GICrystal::Transfer::Full)
    end

    # Returns whether a `GdkEvent` should trigger a context menu,
    # according to platform conventions.
    #
    # The right mouse button typically triggers context menus.
    #
    # This function should always be used instead of simply checking for
    # event->button == %GDK_BUTTON_SECONDARY.
    def triggers_context_menu : Bool
      # gdk_event_triggers_context_menu: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_event_triggers_context_menu(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Decrease the ref count of @event.
    #
    # If the last reference is dropped, the structure is freed.
    def unref : Nil
      # gdk_event_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_event_unref(@pointer)

      # Return value handling
    end
  end
end
