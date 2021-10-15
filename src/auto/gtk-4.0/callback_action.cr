require "./shortcut_action"

module Gtk
  # A `GtkShortcutAction` that invokes a callback.
  class CallbackAction < ShortcutAction
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_callback_action_get_type
    end

    def initialize(callback : Pointer(Void)?, data : Pointer(Nil)?, destroy : Pointer(Void))
      # gtk_callback_action_new: (Constructor)
      # @callback: (nullable)
      # @data: (nullable)
      # Returns: (transfer full)

      callback = if callback.nil?
                   LibGtk::ShortcutFunc.null
                 else
                   callback.to_unsafe
                 end
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      _retval = LibGtk.gtk_callback_action_new(callback, data, destroy)
      @pointer = _retval
    end
  end
end
