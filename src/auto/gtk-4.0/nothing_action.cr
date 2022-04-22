require "./shortcut_action"

module Gtk
  # A `GtkShortcutAction` that does nothing.
  @[GObject::GeneratedWrapper]
  class NothingAction < ShortcutAction
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::NothingActionClass), class_init,
        sizeof(LibGtk::NothingAction), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_nothing_action_get_type
    end

    # Gets the nothing action.
    #
    # This is an action that does nothing and where
    # activating it always fails.
    def self.get : Gtk::NothingAction
      # gtk_nothing_action_get: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_nothing_action_get

      # Return value handling

      Gtk::NothingAction.new(_retval, GICrystal::Transfer::None)
    end
  end
end
