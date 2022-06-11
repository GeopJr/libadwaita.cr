require "./event"

module Gdk
  # An event related to a button on a pointer device.
  @[GObject::GeneratedWrapper]
  class ButtonEvent < Event
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(ButtonEvent, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ButtonEvent`.
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
      LibGdk.gdk_button_event_get_type
    end

    # Extract the button number from a button event.
    def button : UInt32
      # gdk_button_event_get_button: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_button_event_get_button(@pointer)

      # Return value handling

      _retval
    end
  end
end
