require "./shortcut_action"

module Gtk
  # A `GtkShortcutAction` that calls gtk_widget_activate().
  class ActivateAction < ShortcutAction
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_activate_action_get_type
    end

    def self.get : Gtk::ActivateAction
      # gtk_activate_action_get: (None)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_activate_action_get
      Gtk::ActivateAction.new(_retval, GICrystal::Transfer::None)
    end
  end
end
