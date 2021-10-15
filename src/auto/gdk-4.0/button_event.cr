require "./event"

module Gdk
  # An event related to a button on a pointer device.
  class ButtonEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_button_event_get_type
    end

    def button : UInt32
      # gdk_button_event_get_button: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_button_event_get_button(self)
      _retval
    end
  end
end
