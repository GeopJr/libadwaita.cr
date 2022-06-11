require "./event"

module Gdk
  # An event related to a broken windowing system grab.
  @[GObject::GeneratedWrapper]
  class GrabBrokenEvent < Event
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(GrabBrokenEvent, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `GrabBrokenEvent`.
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
      LibGdk.gdk_grab_broken_event_get_type
    end

    # Extracts the grab surface from a grab broken event.
    def grab_surface : Gdk::Surface
      # gdk_grab_broken_event_get_grab_surface: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_grab_broken_event_get_grab_surface(@pointer)

      # Return value handling

      Gdk::Surface.new(_retval, GICrystal::Transfer::None)
    end

    # Checks whether the grab broken event is for an implicit grab.
    def implicit : Bool
      # gdk_grab_broken_event_get_implicit: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_grab_broken_event_get_implicit(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
