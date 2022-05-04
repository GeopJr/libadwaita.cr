require "../g_object-2.0/object"
require "./action_group"

require "./remote_action_group"

module Gio
  # #GDBusActionGroup is an implementation of the #GActionGroup
  # interface that can be used as a proxy for an action group
  # that is exported over D-Bus with g_dbus_connection_export_action_group().
  @[GObject::GeneratedWrapper]
  class DBusActionGroup < GObject::Object
    include ActionGroup
    include RemoteActionGroup

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGio::DBusActionGroup), instance_init, 0)
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
      LibGio.g_dbus_action_group_get_type
    end

    # Obtains a #GDBusActionGroup for the action group which is exported at
    # the given @bus_name and @object_path.
    #
    # The thread default main context is taken at the time of this call.
    # All signals on the menu model (and any linked models) are reported
    # with respect to this context.  All calls on the returned menu model
    # (and linked models) must also originate from this same context, with
    # the thread default main context unchanged.
    #
    # This call is non-blocking.  The returned action group may or may not
    # already be filled in.  The correct thing to do is connect the signals
    # for the action group to monitor for changes and then to call
    # g_action_group_list_actions() to get the initial list.
    def self.get(connection : Gio::DBusConnection, bus_name : ::String?, object_path : ::String) : Gio::DBusActionGroup
      # g_dbus_action_group_get: (None)
      # @bus_name: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      bus_name = if bus_name.nil?
                   Pointer(LibC::Char).null
                 else
                   bus_name.to_unsafe
                 end

      # C call
      _retval = LibGio.g_dbus_action_group_get(connection, bus_name, object_path)

      # Return value handling

      Gio::DBusActionGroup.new(_retval, GICrystal::Transfer::Full)
    end
  end
end
