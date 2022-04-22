require "./shortcut_action"

module Gtk
  # A `GtkShortcutAction` that invokes a callback.
  @[GObject::GeneratedWrapper]
  class CallbackAction < ShortcutAction
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::CallbackActionClass), class_init,
        sizeof(LibGtk::CallbackAction), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_callback_action_get_type
    end

    # Create a custom action that calls the given @callback when
    # activated.
    def initialize(callback : Pointer(Void)?, data : Pointer(Void)?, destroy : Pointer(Void))
      # gtk_callback_action_new: (Constructor)
      # @callback: (nullable)
      # @data: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      callback = if callback.nil?
                   LibGtk::ShortcutFunc.null
                 else
                   callback.to_unsafe
                 end

      # Generator::NullableArrayPlan
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      _retval = LibGtk.gtk_callback_action_new(callback, data, destroy)

      # Return value handling

      @pointer = _retval
    end
  end
end
