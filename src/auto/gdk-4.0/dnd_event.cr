require "./event"

module Gdk
  # An event related to drag and drop operations.
  @[GObject::GeneratedWrapper]
  class DNDEvent < Event
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(DNDEvent, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `DNDEvent`.
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
      LibGdk.gdk_dnd_event_get_type
    end

    # Gets the `GdkDrop` object from a DND event.
    def drop : Gdk::Drop?
      # gdk_dnd_event_get_drop: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_dnd_event_get_drop(@pointer)

      # Return value handling

      Gdk::Drop.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end
  end
end
