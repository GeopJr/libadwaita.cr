require "./menu_model"

module Gio
  # #GDBusMenuModel is an implementation of #GMenuModel that can be used
  # as a proxy for a menu model that is exported over D-Bus with
  # g_dbus_connection_export_menu_model().
  class DBusMenuModel < MenuModel
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_menu_model_get_type
    end

    def self.get(connection : Gio::DBusConnection, bus_name : ::String?, object_path : ::String) : Gio::DBusMenuModel
      # g_dbus_menu_model_get: (None)
      # @bus_name: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      bus_name = if bus_name.nil?
                   Pointer(LibC::Char).null
                 else
                   bus_name.to_unsafe
                 end

      # C call
      _retval = LibGio.g_dbus_menu_model_get(connection, bus_name, object_path)

      # Return value handling
      Gio::DBusMenuModel.new(_retval, GICrystal::Transfer::Full)
    end
  end
end
