require "./shortcut_trigger"

module Gtk
  # A `GtkShortcutTrigger` that never triggers.
  @[GObject::GeneratedWrapper]
  class NeverTrigger < ShortcutTrigger
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::NeverTriggerClass), class_init,
        sizeof(LibGtk::NeverTrigger), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_never_trigger_get_type
    end

    # Gets the never trigger.
    #
    # This is a singleton for a trigger that never triggers.
    # Use this trigger instead of %NULL because it implements
    # all virtual functions.
    def self.get : Gtk::NeverTrigger
      # gtk_never_trigger_get: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_never_trigger_get

      # Return value handling

      Gtk::NeverTrigger.new(_retval, GICrystal::Transfer::None)
    end
  end
end
