require "./event"

module Gdk
  # An event related to drag and drop operations.
  @[GObject::GeneratedWrapper]
  class DNDEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::DNDEvent), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_dnd_event_get_type
    end

    # Gets the `GdkDrop` object from a DND event.
    def drop : Gdk::Drop?
      # gdk_dnd_event_get_drop: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_dnd_event_get_drop(self)

      # Return value handling

      Gdk::Drop.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end
  end
end
