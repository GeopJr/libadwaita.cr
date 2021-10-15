require "./event"

module Gdk
  # An event related to drag and drop operations.
  class DNDEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_dnd_event_get_type
    end

    def drop : Gdk::Drop?
      # gdk_dnd_event_get_drop: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_dnd_event_get_drop(self)
      Gdk::Drop.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end
  end
end
