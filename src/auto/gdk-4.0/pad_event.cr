require "./event"

module Gdk
  # An event related to a pad-based device.
  @[GObject::GeneratedWrapper]
  class PadEvent < Event
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(PadEvent, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `PadEvent`.
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
      LibGdk.gdk_pad_event_get_type
    end

    # Extracts the information from a pad strip or ring event.
    def axis_value(index : UInt32, value : Float64) : Nil
      # gdk_pad_event_get_axis_value: (Method)
      # @index: (out) (transfer full)
      # @value: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_pad_event_get_axis_value(@pointer, index, value)

      # Return value handling
    end

    # Extracts information about the pressed button from
    # a pad event.
    def button : UInt32
      # gdk_pad_event_get_button: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_pad_event_get_button(@pointer)

      # Return value handling

      _retval
    end

    # Extracts group and mode information from a pad event.
    def group_mode(group : UInt32, mode : UInt32) : Nil
      # gdk_pad_event_get_group_mode: (Method)
      # @group: (out) (transfer full)
      # @mode: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_pad_event_get_group_mode(@pointer, group, mode)

      # Return value handling
    end
  end
end
