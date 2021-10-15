require "./shortcut_action"

module Gtk
  # A `GtkShortcutAction` that does nothing.
  class NothingAction < ShortcutAction
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_nothing_action_get_type
    end

    def self.get : Gtk::NothingAction
      # gtk_nothing_action_get: (None)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_nothing_action_get
      Gtk::NothingAction.new(_retval, GICrystal::Transfer::None)
    end
  end
end
