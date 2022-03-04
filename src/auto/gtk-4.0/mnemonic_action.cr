require "./shortcut_action"

module Gtk
  # A `GtkShortcutAction` that calls gtk_widget_mnemonic_activate().
  class MnemonicAction < ShortcutAction
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_mnemonic_action_get_type
    end

    def self.get : Gtk::MnemonicAction
      # gtk_mnemonic_action_get: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_mnemonic_action_get

      # Return value handling
      Gtk::MnemonicAction.new(_retval, GICrystal::Transfer::None)
    end
  end
end
