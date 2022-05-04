require "./event"

module Gdk
  # An event related to a scrolling motion.
  @[GObject::GeneratedWrapper]
  class ScrollEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::ScrollEvent), instance_init, 0)
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
      LibGdk.gdk_scroll_event_get_type
    end

    # Extracts the scroll deltas of a scroll event.
    #
    # The deltas will be zero unless the scroll direction
    # is %GDK_SCROLL_SMOOTH.
    def deltas(delta_x : Float64, delta_y : Float64) : Nil
      # gdk_scroll_event_get_deltas: (Method)
      # @delta_x: (out) (transfer full)
      # @delta_y: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_scroll_event_get_deltas(self, delta_x, delta_y)

      # Return value handling
    end

    # Extracts the direction of a scroll event.
    def direction : Gdk::ScrollDirection
      # gdk_scroll_event_get_direction: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_scroll_event_get_direction(self)

      # Return value handling

      Gdk::ScrollDirection.new(_retval)
    end

    # Check whether a scroll event is a stop scroll event.
    #
    # Scroll sequences with smooth scroll information may provide
    # a stop scroll event once the interaction with the device finishes,
    # e.g. by lifting a finger. This stop scroll event is the signal
    # that a widget may trigger kinetic scrolling based on the current
    # velocity.
    #
    # Stop scroll events always have a delta of 0/0.
    def is_stop : Bool
      # gdk_scroll_event_is_stop: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_scroll_event_is_stop(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
