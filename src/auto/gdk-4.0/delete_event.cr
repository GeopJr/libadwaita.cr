require "./event"

module Gdk
  # An event related to closing a top-level surface.
  class DeleteEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_delete_event_get_type
    end
  end
end
