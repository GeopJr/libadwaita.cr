require "./event"

module Gdk
  # An event caused by a pointing device moving between surfaces.
  @[GObject::GeneratedWrapper]
  class CrossingEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::CrossingEvent), instance_init, 0)
    end

    GICrystal.define_new_method(CrossingEvent, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `CrossingEvent`.
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
      LibGdk.gdk_crossing_event_get_type
    end

    # Extracts the notify detail from a crossing event.
    def detail : Gdk::NotifyType
      # gdk_crossing_event_get_detail: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_crossing_event_get_detail(@pointer)

      # Return value handling

      Gdk::NotifyType.new(_retval)
    end

    # Checks if the @event surface is the focus surface.
    def focus : Bool
      # gdk_crossing_event_get_focus: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_crossing_event_get_focus(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Extracts the crossing mode from a crossing event.
    def mode : Gdk::CrossingMode
      # gdk_crossing_event_get_mode: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_crossing_event_get_mode(@pointer)

      # Return value handling

      Gdk::CrossingMode.new(_retval)
    end
  end
end
