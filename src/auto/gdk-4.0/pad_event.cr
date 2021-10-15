require "./event"

module Gdk
  # An event related to a pad-based device.
  class PadEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_pad_event_get_type
    end

    def axis_value(index : UInt32, value : Float64) : Nil
      # gdk_pad_event_get_axis_value: (Method)
      # @index: (out) (transfer full)
      # @value: (out) (transfer full)
      # Returns: (transfer none)

      LibGdk.gdk_pad_event_get_axis_value(self, index, value)
    end

    def button : UInt32
      # gdk_pad_event_get_button: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_pad_event_get_button(self)
      _retval
    end

    def group_mode(group : UInt32, mode : UInt32) : Nil
      # gdk_pad_event_get_group_mode: (Method)
      # @group: (out) (transfer full)
      # @mode: (out) (transfer full)
      # Returns: (transfer none)

      LibGdk.gdk_pad_event_get_group_mode(self, group, mode)
    end
  end
end
