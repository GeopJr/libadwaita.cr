require "./shortcut_action"

module Gtk
  # A `GtkShortcutAction` that calls gtk_widget_activate().
  @[GObject::GeneratedWrapper]
  class ActivateAction < ShortcutAction
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::ActivateActionClass), class_init,
        sizeof(LibGtk::ActivateAction), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_activate_action_get_type
    end

    # Gets the activate action.
    #
    # This is an action that calls gtk_widget_activate()
    # on the given widget upon activation.
    def self.get : Gtk::ActivateAction
      # gtk_activate_action_get: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_activate_action_get

      # Return value handling

      Gtk::ActivateAction.new(_retval, GICrystal::Transfer::None)
    end
  end
end
