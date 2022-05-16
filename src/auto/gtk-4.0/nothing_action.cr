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

    GICrystal.define_new_method(NothingAction, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `NothingAction`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
