require "../g_object-2.0/object"

module Gdk
  # Base type for snapshot operations.
  #
  # The subclass of `GdkSnapshot` used by GTK is `Gtk#Snapshot`.
  @[GObject::GeneratedWrapper]
  class Snapshot < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGdk::SnapshotClass), class_init,
        sizeof(LibGdk::Snapshot), instance_init, 0)
    end

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
