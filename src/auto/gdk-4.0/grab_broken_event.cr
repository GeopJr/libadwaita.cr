require "./event"

module Gdk
  # An event related to a broken windowing system grab.
  @[GObject::GeneratedWrapper]
  class GrabBrokenEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::GrabBrokenEvent), instance_init, 0)
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
      _retval = LibGdk.gdk_grab_broken_event_get_grab_surface(self)

      # Return value handling

      Gdk::Surface.new(_retval, GICrystal::Transfer::None)
    end

    # Checks whether the grab broken event is for an implicit grab.
    def implicit : Bool
      # gdk_grab_broken_event_get_implicit: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_grab_broken_event_get_implicit(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
