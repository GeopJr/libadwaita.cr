require "./menu_model"

module Gio
  # #GDBusMenuModel is an implementation of #GMenuModel that can be used
  # as a proxy for a menu model that is exported over D-Bus with
  # g_dbus_connection_export_menu_model().
  @[GObject::GeneratedWrapper]
  class DBusMenuModel < MenuModel
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(DBusMenuModel, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `DBusMenuModel`.
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
      LibGio.g_dbus_menu_model_get_type
    end

    # Obtains a #GDBusMenuModel for the menu model which is exported
    # at the given @bus_name and @object_path.
    #
    # The thread default main context is taken at the time of this call.
    # All signals on the menu model (and any linked models) are reported
    # with respect to this context.  All calls on the returned menu model
    # (and linked models) must also originate from this same context, with
    # the thread default main context unchanged.
    def self.get(connection : Gio::DBusConnection, bus_name : ::String?, object_path : ::String) : Gio::DBusMenuModel
      # g_dbus_menu_model_get: (None)
      # @bus_name: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
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
