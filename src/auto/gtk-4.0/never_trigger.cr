require "./shortcut_trigger"

module Gtk
  # A `GtkShortcutTrigger` that never triggers.
  class NeverTrigger < ShortcutTrigger
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_never_trigger_get_type
    end

    def self.get : Gtk::NeverTrigger
      # gtk_never_trigger_get: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_never_trigger_get

      # Return value handling
      Gtk::NeverTrigger.new(_retval, GICrystal::Transfer::None)
    end
  end
end
