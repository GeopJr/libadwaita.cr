require "./event"

module Gdk
  # An event related to a pad-based device.
  @[GObject::GeneratedWrapper]
  class PadEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::PadEvent), instance_init, 0)
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
      LibGdk.gdk_pad_event_get_axis_value(self, index, value)

      # Return value handling
    end

    # Extracts information about the pressed button from
    # a pad event.
    def button : UInt32
      # gdk_pad_event_get_button: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_pad_event_get_button(self)

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
      LibGdk.gdk_pad_event_get_group_mode(self, group, mode)

      # Return value handling
    end
  end
end
