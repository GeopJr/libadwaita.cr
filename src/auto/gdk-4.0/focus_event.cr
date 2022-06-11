require "./event"

module Gdk
  # An event related to a keyboard focus change.
  @[GObject::GeneratedWrapper]
  class FocusEvent < Event
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(FocusEvent, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `FocusEvent`.
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
      LibGdk.gdk_focus_event_get_type
    end

    # Extracts whether this event is about focus entering or
    # leaving the surface.
    def in : Bool
      # gdk_focus_event_get_in: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_focus_event_get_in(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
