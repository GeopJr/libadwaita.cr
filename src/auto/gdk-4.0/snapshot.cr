require "../g_object-2.0/object"

module Gdk
  # Base type for snapshot operations.
  #
  # The subclass of `GdkSnapshot` used by GTK is [class@Gtk.Snapshot].
  class Snapshot < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_snapshot_get_type
    end
  end
end
