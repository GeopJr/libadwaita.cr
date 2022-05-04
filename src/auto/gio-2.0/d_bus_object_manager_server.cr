require "../g_object-2.0/object"
require "./d_bus_object_manager"

module Gio
  # #GDBusObjectManagerServer is used to export #GDBusObject instances using
  # the standardized
  # [org.freedesktop.DBus.ObjectManager](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager)
  # interface. For example, remote D-Bus clients can get all objects
  # and properties in a single call. Additionally, any change in the
  # object hierarchy is broadcast using signals. This means that D-Bus
  # clients can keep caches up to date by only listening to D-Bus
  # signals.
  #
  # The recommended path to export an object manager at is the path form of the
  # well-known name of a D-Bus service, or below. For example, if a D-Bus service
  # is available at the well-known name `net.example.ExampleService1`, the object
  # manager should typically be exported at `/net/example/ExampleService1`, or
  # below (to allow for multiple object managers in a service).
  #
  # It is supported, but not recommended, to export an object manager at the root
  # path, `/`.
  #
  # See #GDBusObjectManagerClient for the client-side code that is
  # intended to be used with #GDBusObjectManagerServer or any D-Bus
  # object implementing the org.freedesktop.DBus.ObjectManager
  # interface.
  @[GObject::GeneratedWrapper]
  class DBusObjectManagerServer < GObject::Object
    include DBusObjectManager

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::DBusObjectManagerServerClass), class_init,
        sizeof(LibGio::DBusObjectManagerServer), instance_init, 0)
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

    def initialize(*, connection : Gio::DBusConnection? = nil, object_path : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !connection.nil?
        (_names.to_unsafe + _n).value = "connection".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, connection)
        _n += 1
      end
      if !object_path.nil?
        (_names.to_unsafe + _n).value = "object-path".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, object_path)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DBusObjectManagerServer.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_object_manager_server_get_type
    end

    def connection=(value : Gio::DBusConnection?) : Gio::DBusConnection?
      unsafe_value = value

      LibGObject.g_object_set(self, "connection", unsafe_value, Pointer(Void).null)
      value
    end

    def connection : Gio::DBusConnection?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "connection", pointerof(value), Pointer(Void).null)
      Gio::DBusConnection.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def object_path=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "object-path", unsafe_value, Pointer(Void).null)
      value
    end

    def object_path : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "object-path", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Creates a new #GDBusObjectManagerServer object.
    #
    # The returned server isn't yet exported on any connection. To do so,
    # use g_dbus_object_manager_server_set_connection(). Normally you
    # want to export all of your objects before doing so to avoid
    # [InterfacesAdded](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager)
    # signals being emitted.
    def initialize(object_path : ::String)
      # g_dbus_object_manager_server_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_object_manager_server_new(object_path)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Exports @object on @manager.
    #
    # If there is already a #GDBusObject exported at the object path,
    # then the old object is removed.
    #
    # The object path for @object must be in the hierarchy rooted by the
    # object path for @manager.
    #
    # Note that @manager will take a reference on @object for as long as
    # it is exported.
    def export(object : Gio::DBusObjectSkeleton) : Nil
      # g_dbus_object_manager_server_export: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_object_manager_server_export(self, object)

      # Return value handling
    end

    # Like g_dbus_object_manager_server_export() but appends a string of
    # the form _N (with N being a natural number) to @object's object path
    # if an object with the given path already exists. As such, the
    # #GDBusObjectProxy:g-object-path property of @object may be modified.
    def export_uniquely(object : Gio::DBusObjectSkeleton) : Nil
      # g_dbus_object_manager_server_export_uniquely: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_object_manager_server_export_uniquely(self, object)

      # Return value handling
    end

    # Gets the #GDBusConnection used by @manager.
    def connection : Gio::DBusConnection?
      # g_dbus_object_manager_server_get_connection: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_object_manager_server_get_connection(self)

      # Return value handling

      Gio::DBusConnection.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Returns whether @object is currently exported on @manager.
    def is_exported(object : Gio::DBusObjectSkeleton) : Bool
      # g_dbus_object_manager_server_is_exported: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_object_manager_server_is_exported(self, object)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Exports all objects managed by @manager on @connection. If
    # @connection is %NULL, stops exporting objects.
    def connection=(connection : Gio::DBusConnection?) : Nil
      # g_dbus_object_manager_server_set_connection: (Method | Setter)
      # @connection: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      connection = if connection.nil?
                     Pointer(Void).null
                   else
                     connection.to_unsafe
                   end

      # C call
      LibGio.g_dbus_object_manager_server_set_connection(self, connection)

      # Return value handling
    end

    # If @manager has an object at @path, removes the object. Otherwise
    # does nothing.
    #
    # Note that @object_path must be in the hierarchy rooted by the
    # object path for @manager.
    def unexport(object_path : ::String) : Bool
      # g_dbus_object_manager_server_unexport: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_object_manager_server_unexport(self, object_path)

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
