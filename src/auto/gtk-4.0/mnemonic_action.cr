require "./shortcut_action"

module Gtk
  # A `GtkShortcutAction` that calls gtk_widget_mnemonic_activate().
  @[GObject::GeneratedWrapper]
  class MnemonicAction < ShortcutAction
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::MnemonicActionClass), class_init,
        sizeof(LibGtk::MnemonicAction), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_mnemonic_action_get_type
    end

    # Gets the mnemonic action.
    #
    # This is an action that calls gtk_widget_mnemonic_activate()
    # on the given widget upon activation.
    def self.get : Gtk::MnemonicAction
      # gtk_mnemonic_action_get: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_mnemonic_action_get

      # Return value handling

      Gtk::MnemonicAction.new(_retval, GICrystal::Transfer::None)
    end
  end
end
