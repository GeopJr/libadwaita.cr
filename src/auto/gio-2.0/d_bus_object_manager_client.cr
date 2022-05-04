require "../g_object-2.0/object"
require "./async_initable"

require "./d_bus_object_manager"

require "./initable"

module Gio
  # #GDBusObjectManagerClient is used to create, monitor and delete object
  # proxies for remote objects exported by a #GDBusObjectManagerServer (or any
  # code implementing the
  # [org.freedesktop.DBus.ObjectManager](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager)
  # interface).
  #
  # Once an instance of this type has been created, you can connect to
  # the #GDBusObjectManager::object-added and
  # #GDBusObjectManager::object-removed signals and inspect the
  # #GDBusObjectProxy objects returned by
  # g_dbus_object_manager_get_objects().
  #
  # If the name for a #GDBusObjectManagerClient is not owned by anyone at
  # object construction time, the default behavior is to request the
  # message bus to launch an owner for the name. This behavior can be
  # disabled using the %G_DBUS_OBJECT_MANAGER_CLIENT_FLAGS_DO_NOT_AUTO_START
  # flag. It's also worth noting that this only works if the name of
  # interest is activatable in the first place. E.g. in some cases it
  # is not possible to launch an owner for the requested name. In this
  # case, #GDBusObjectManagerClient object construction still succeeds but
  # there will be no object proxies
  # (e.g. g_dbus_object_manager_get_objects() returns the empty list) and
  # the #GDBusObjectManagerClient:name-owner property is %NULL.
  #
  # The owner of the requested name can come and go (for example
  # consider a system service being restarted) – #GDBusObjectManagerClient
  # handles this case too; simply connect to the #GObject::notify
  # signal to watch for changes on the #GDBusObjectManagerClient:name-owner
  # property. When the name owner vanishes, the behavior is that
  # #GDBusObjectManagerClient:name-owner is set to %NULL (this includes
  # emission of the #GObject::notify signal) and then
  # #GDBusObjectManager::object-removed signals are synthesized
  # for all currently existing object proxies. Since
  # #GDBusObjectManagerClient:name-owner is %NULL when this happens, you can
  # use this information to disambiguate a synthesized signal from a
  # genuine signal caused by object removal on the remote
  # #GDBusObjectManager. Similarly, when a new name owner appears,
  # #GDBusObjectManager::object-added signals are synthesized
  # while #GDBusObjectManagerClient:name-owner is still %NULL. Only when all
  # object proxies have been added, the #GDBusObjectManagerClient:name-owner
  # is set to the new name owner (this includes emission of the
  # #GObject::notify signal).  Furthermore, you are guaranteed that
  # #GDBusObjectManagerClient:name-owner will alternate between a name owner
  # (e.g. `:1.42`) and %NULL even in the case where
  # the name of interest is atomically replaced
  #
  # Ultimately, #GDBusObjectManagerClient is used to obtain #GDBusProxy
  # instances. All signals (including the
  # org.freedesktop.DBus.Properties::PropertiesChanged signal)
  # delivered to #GDBusProxy instances are guaranteed to originate
  # from the name owner. This guarantee along with the behavior
  # described above, means that certain race conditions including the
  # "half the proxy is from the old owner and the other half is from
  # the new owner" problem cannot happen.
  #
  # To avoid having the application connect to signals on the returned
  # #GDBusObjectProxy and #GDBusProxy objects, the
  # #GDBusObject::interface-added,
  # #GDBusObject::interface-removed,
  # #GDBusProxy::g-properties-changed and
  # #GDBusProxy::g-signal signals
  # are also emitted on the #GDBusObjectManagerClient instance managing these
  # objects. The signals emitted are
  # #GDBusObjectManager::interface-added,
  # #GDBusObjectManager::interface-removed,
  # #GDBusObjectManagerClient::interface-proxy-properties-changed and
  # #GDBusObjectManagerClient::interface-proxy-signal.
  #
  # Note that all callbacks and signals are emitted in the
  # [thread-default main context][g-main-context-push-thread-default]
  # that the #GDBusObjectManagerClient object was constructed
  # in. Additionally, the #GDBusObjectProxy and #GDBusProxy objects
  # originating from the #GDBusObjectManagerClient object will be created in
  # the same context and, consequently, will deliver signals in the
  # same main loop.
  @[GObject::GeneratedWrapper]
  class DBusObjectManagerClient < GObject::Object
    include AsyncInitable
    include DBusObjectManager
    include Initable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::DBusObjectManagerClientClass), class_init,
        sizeof(LibGio::DBusObjectManagerClient), instance_init, 0)
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

    def initialize(*, bus_type : Gio::BusType? = nil, connection : Gio::DBusConnection? = nil, flags : Gio::DBusObjectManagerClientFlags? = nil, get_proxy_type_destroy_notify : Pointer(Void)? = nil, get_proxy_type_func : Pointer(Void)? = nil, get_proxy_type_user_data : Pointer(Void)? = nil, name : ::String? = nil, name_owner : ::String? = nil, object_path : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[9]
      _values = StaticArray(LibGObject::Value, 9).new(LibGObject::Value.new)
      _n = 0

      if !bus_type.nil?
        (_names.to_unsafe + _n).value = "bus-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, bus_type)
        _n += 1
      end
      if !connection.nil?
        (_names.to_unsafe + _n).value = "connection".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, connection)
        _n += 1
      end
      if !flags.nil?
        (_names.to_unsafe + _n).value = "flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flags)
        _n += 1
      end
      if !get_proxy_type_destroy_notify.nil?
        (_names.to_unsafe + _n).value = "get-proxy-type-destroy-notify".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, get_proxy_type_destroy_notify)
        _n += 1
      end
      if !get_proxy_type_func.nil?
        (_names.to_unsafe + _n).value = "get-proxy-type-func".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, get_proxy_type_func)
        _n += 1
      end
      if !get_proxy_type_user_data.nil?
        (_names.to_unsafe + _n).value = "get-proxy-type-user-data".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, get_proxy_type_user_data)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !name_owner.nil?
        (_names.to_unsafe + _n).value = "name-owner".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name_owner)
        _n += 1
      end
      if !object_path.nil?
        (_names.to_unsafe + _n).value = "object-path".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, object_path)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DBusObjectManagerClient.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_object_manager_client_get_type
    end

    def bus_type=(value : Gio::BusType) : Gio::BusType
      unsafe_value = value

      LibGObject.g_object_set(self, "bus-type", unsafe_value, Pointer(Void).null)
      value
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

    def flags=(value : Gio::DBusObjectManagerClientFlags) : Gio::DBusObjectManagerClientFlags
      unsafe_value = value

      LibGObject.g_object_set(self, "flags", unsafe_value, Pointer(Void).null)
      value
    end

    def flags : Gio::DBusObjectManagerClientFlags
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "flags", pointerof(value), Pointer(Void).null)
      Gio::DBusObjectManagerClientFlags.new(value)
    end

    def get_proxy_type_destroy_notify=(value : Pointer(Void)) : Pointer(Void)
      unsafe_value = value

      LibGObject.g_object_set(self, "get-proxy-type-destroy-notify", unsafe_value, Pointer(Void).null)
      value
    end

    def get_proxy_type_destroy_notify : Pointer(Void)
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "get-proxy-type-destroy-notify", pointerof(value), Pointer(Void).null)
      value
    end

    def get_proxy_type_func=(value : Pointer(Void)) : Pointer(Void)
      unsafe_value = value

      LibGObject.g_object_set(self, "get-proxy-type-func", unsafe_value, Pointer(Void).null)
      value
    end

    def get_proxy_type_func : Pointer(Void)
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "get-proxy-type-func", pointerof(value), Pointer(Void).null)
      value
    end

    def get_proxy_type_user_data=(value : Pointer(Void)) : Pointer(Void)
      unsafe_value = value

      LibGObject.g_object_set(self, "get-proxy-type-user-data", unsafe_value, Pointer(Void).null)
      value
    end

    def get_proxy_type_user_data : Pointer(Void)
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "get-proxy-type-user-data", pointerof(value), Pointer(Void).null)
      value
    end

    def name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "name", unsafe_value, Pointer(Void).null)
      value
    end

    def name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def name_owner : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "name-owner", pointerof(value), Pointer(Void).null)
      ::String.new(value)
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

    # Finishes an operation started with g_dbus_object_manager_client_new().
    def self.new_finish(res : Gio::AsyncResult) : self
      # g_dbus_object_manager_client_new_finish: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_dbus_object_manager_client_new_finish(res, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::DBusObjectManagerClient.new(_retval, GICrystal::Transfer::Full)
    end

    # Finishes an operation started with g_dbus_object_manager_client_new_for_bus().
    def self.new_for_bus_finish(res : Gio::AsyncResult) : self
      # g_dbus_object_manager_client_new_for_bus_finish: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_dbus_object_manager_client_new_for_bus_finish(res, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::DBusObjectManagerClient.new(_retval, GICrystal::Transfer::Full)
    end

    # Like g_dbus_object_manager_client_new_sync() but takes a #GBusType instead
    # of a #GDBusConnection.
    #
    # This is a synchronous failable constructor - the calling thread is
    # blocked until a reply is received. See g_dbus_object_manager_client_new_for_bus()
    # for the asynchronous version.
    def self.new_for_bus_sync(bus_type : Gio::BusType, flags : Gio::DBusObjectManagerClientFlags, name : ::String, object_path : ::String, get_proxy_type_func : Gio::DBusProxyTypeFunc?, get_proxy_type_user_data : Pointer(Void)?, get_proxy_type_destroy_notify : GLib::DestroyNotify?, cancellable : Gio::Cancellable?) : self
      # g_dbus_object_manager_client_new_for_bus_sync: (Constructor | Throws)
      # @get_proxy_type_func: (nullable)
      # @get_proxy_type_user_data: (nullable)
      # @get_proxy_type_destroy_notify: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      get_proxy_type_user_data = if get_proxy_type_user_data.nil?
                                   Pointer(Void).null
                                 else
                                   get_proxy_type_user_data.to_unsafe
                                 end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_dbus_object_manager_client_new_for_bus_sync(bus_type, flags, name, object_path, get_proxy_type_func, get_proxy_type_user_data, get_proxy_type_destroy_notify, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::DBusObjectManagerClient.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new #GDBusObjectManagerClient object.
    #
    # This is a synchronous failable constructor - the calling thread is
    # blocked until a reply is received. See g_dbus_object_manager_client_new()
    # for the asynchronous version.
    def self.new_sync(connection : Gio::DBusConnection, flags : Gio::DBusObjectManagerClientFlags, name : ::String?, object_path : ::String, get_proxy_type_func : Gio::DBusProxyTypeFunc?, get_proxy_type_user_data : Pointer(Void)?, get_proxy_type_destroy_notify : GLib::DestroyNotify?, cancellable : Gio::Cancellable?) : self
      # g_dbus_object_manager_client_new_sync: (Constructor | Throws)
      # @name: (nullable)
      # @get_proxy_type_func: (nullable)
      # @get_proxy_type_user_data: (nullable)
      # @get_proxy_type_destroy_notify: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end
      # Generator::NullableArrayPlan
      get_proxy_type_user_data = if get_proxy_type_user_data.nil?
                                   Pointer(Void).null
                                 else
                                   get_proxy_type_user_data.to_unsafe
                                 end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_dbus_object_manager_client_new_sync(connection, flags, name, object_path, get_proxy_type_func, get_proxy_type_user_data, get_proxy_type_destroy_notify, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::DBusObjectManagerClient.new(_retval, GICrystal::Transfer::Full)
    end

    # Asynchronously creates a new #GDBusObjectManagerClient object.
    #
    # This is an asynchronous failable constructor. When the result is
    # ready, @callback will be invoked in the
    # [thread-default main context][g-main-context-push-thread-default]
    # of the thread you are calling this method from. You can
    # then call g_dbus_object_manager_client_new_finish() to get the result. See
    # g_dbus_object_manager_client_new_sync() for the synchronous version.
    def self.new(connection : Gio::DBusConnection, flags : Gio::DBusObjectManagerClientFlags, name : ::String, object_path : ::String, get_proxy_type_func : Gio::DBusProxyTypeFunc?, get_proxy_type_user_data : Pointer(Void)?, get_proxy_type_destroy_notify : GLib::DestroyNotify?, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_dbus_object_manager_client_new: (None)
      # @get_proxy_type_func: (nullable)
      # @get_proxy_type_user_data: (nullable)
      # @get_proxy_type_destroy_notify: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      get_proxy_type_user_data = if get_proxy_type_user_data.nil?
                                   Pointer(Void).null
                                 else
                                   get_proxy_type_user_data.to_unsafe
                                 end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_dbus_object_manager_client_new(connection, flags, name, object_path, get_proxy_type_func, get_proxy_type_user_data, get_proxy_type_destroy_notify, cancellable, callback, user_data)

      # Return value handling
    end

    # Like g_dbus_object_manager_client_new() but takes a #GBusType instead of a
    # #GDBusConnection.
    #
    # This is an asynchronous failable constructor. When the result is
    # ready, @callback will be invoked in the
    # [thread-default main loop][g-main-context-push-thread-default]
    # of the thread you are calling this method from. You can
    # then call g_dbus_object_manager_client_new_for_bus_finish() to get the result. See
    # g_dbus_object_manager_client_new_for_bus_sync() for the synchronous version.
    def self.new_for_bus(bus_type : Gio::BusType, flags : Gio::DBusObjectManagerClientFlags, name : ::String, object_path : ::String, get_proxy_type_func : Gio::DBusProxyTypeFunc?, get_proxy_type_user_data : Pointer(Void)?, get_proxy_type_destroy_notify : GLib::DestroyNotify?, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_dbus_object_manager_client_new_for_bus: (None)
      # @get_proxy_type_func: (nullable)
      # @get_proxy_type_user_data: (nullable)
      # @get_proxy_type_destroy_notify: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      get_proxy_type_user_data = if get_proxy_type_user_data.nil?
                                   Pointer(Void).null
                                 else
                                   get_proxy_type_user_data.to_unsafe
                                 end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_dbus_object_manager_client_new_for_bus(bus_type, flags, name, object_path, get_proxy_type_func, get_proxy_type_user_data, get_proxy_type_destroy_notify, cancellable, callback, user_data)

      # Return value handling
    end

    # Gets the #GDBusConnection used by @manager.
    def connection : Gio::DBusConnection
      # g_dbus_object_manager_client_get_connection: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_object_manager_client_get_connection(self)

      # Return value handling

      Gio::DBusConnection.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the flags that @manager was constructed with.
    def flags : Gio::DBusObjectManagerClientFlags
      # g_dbus_object_manager_client_get_flags: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_object_manager_client_get_flags(self)

      # Return value handling

      Gio::DBusObjectManagerClientFlags.new(_retval)
    end

    # Gets the name that @manager is for, or %NULL if not a message bus
    # connection.
    def name : ::String
      # g_dbus_object_manager_client_get_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_object_manager_client_get_name(self)

      # Return value handling

      ::String.new(_retval)
    end

    # The unique name that owns the name that @manager is for or %NULL if
    # no-one currently owns that name. You can connect to the
    # #GObject::notify signal to track changes to the
    # #GDBusObjectManagerClient:name-owner property.
    def name_owner : ::String?
      # g_dbus_object_manager_client_get_name_owner: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_object_manager_client_get_name_owner(self)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    # Emitted when one or more D-Bus properties on proxy changes. The
    # local cache has already been updated when this signal fires. Note
    # that both @changed_properties and @invalidated_properties are
    # guaranteed to never be %NULL (either may be empty though).
    #
    # This signal exists purely as a convenience to avoid having to
    # connect signals to all interface proxies managed by @manager.
    #
    # This signal is emitted in the
    # [thread-default main context][g-main-context-push-thread-default]
    # that @manager was constructed in.
    struct InterfaceProxyPropertiesChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "interface-proxy-properties-changed::#{@detail}" : "interface-proxy-properties-changed"
      end

      def connect(&block : Proc(Gio::DBusObjectProxy, Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::DBusObjectProxy, Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil))
        connect(block)
      end

      def connect(handler : Proc(Gio::DBusObjectProxy, Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object_proxy : Pointer(Void), lib_interface_proxy : Pointer(Void), lib_changed_properties : Pointer(Void), lib_invalidated_properties : Pointer(Pointer(LibC::Char)), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          object_proxy = Gio::DBusObjectProxy.new(lib_object_proxy, :none)
          # Generator::GObjectArgPlan
          interface_proxy = Gio::DBusProxy.new(lib_interface_proxy, :none)
          # Generator::HandmadeArgPlan
          changed_properties = GLib::Variant.new(lib_changed_properties, :none)
          # Generator::GObjectArgPlan
          changed_properties = GLib::Variant.new(lib_changed_properties, :none)
          # Generator::ArrayArgPlan
          ::Box(Proc(Gio::DBusObjectProxy, Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil)).unbox(_lib_box).call(object_proxy, interface_proxy, changed_properties, invalidated_properties)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::DBusObjectProxy, Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object_proxy : Pointer(Void), lib_interface_proxy : Pointer(Void), lib_changed_properties : Pointer(Void), lib_invalidated_properties : Pointer(Pointer(LibC::Char)), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          object_proxy = Gio::DBusObjectProxy.new(lib_object_proxy, :none)
          # Generator::GObjectArgPlan
          interface_proxy = Gio::DBusProxy.new(lib_interface_proxy, :none)
          # Generator::HandmadeArgPlan
          changed_properties = GLib::Variant.new(lib_changed_properties, :none)
          # Generator::GObjectArgPlan
          changed_properties = GLib::Variant.new(lib_changed_properties, :none)
          # Generator::ArrayArgPlan
          ::Box(Proc(Gio::DBusObjectProxy, Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil)).unbox(_lib_box).call(object_proxy, interface_proxy, changed_properties, invalidated_properties)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::DBusObjectManagerClient, Gio::DBusObjectProxy, Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object_proxy : Pointer(Void), lib_interface_proxy : Pointer(Void), lib_changed_properties : Pointer(Void), lib_invalidated_properties : Pointer(Pointer(LibC::Char)), _lib_box : Pointer(Void)) {
          _sender = Gio::DBusObjectManagerClient.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          object_proxy = Gio::DBusObjectProxy.new(lib_object_proxy, :none)
          # Generator::GObjectArgPlan
          interface_proxy = Gio::DBusProxy.new(lib_interface_proxy, :none)
          # Generator::HandmadeArgPlan
          changed_properties = GLib::Variant.new(lib_changed_properties, :none)
          # Generator::GObjectArgPlan
          changed_properties = GLib::Variant.new(lib_changed_properties, :none)
          # Generator::ArrayArgPlan
          ::Box(Proc(Gio::DBusObjectManagerClient, Gio::DBusObjectProxy, Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil)).unbox(_lib_box).call(_sender, object_proxy, interface_proxy, changed_properties, invalidated_properties)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::DBusObjectManagerClient, Gio::DBusObjectProxy, Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object_proxy : Pointer(Void), lib_interface_proxy : Pointer(Void), lib_changed_properties : Pointer(Void), lib_invalidated_properties : Pointer(Pointer(LibC::Char)), _lib_box : Pointer(Void)) {
          _sender = Gio::DBusObjectManagerClient.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          object_proxy = Gio::DBusObjectProxy.new(lib_object_proxy, :none)
          # Generator::GObjectArgPlan
          interface_proxy = Gio::DBusProxy.new(lib_interface_proxy, :none)
          # Generator::HandmadeArgPlan
          changed_properties = GLib::Variant.new(lib_changed_properties, :none)
          # Generator::GObjectArgPlan
          changed_properties = GLib::Variant.new(lib_changed_properties, :none)
          # Generator::ArrayArgPlan
          ::Box(Proc(Gio::DBusObjectManagerClient, Gio::DBusObjectProxy, Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil)).unbox(_lib_box).call(_sender, object_proxy, interface_proxy, changed_properties, invalidated_properties)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(object_proxy : Gio::DBusObjectProxy, interface_proxy : Gio::DBusProxy, changed_properties : _, invalidated_properties : Enumerable(::String)) : Nil
        changed_properties = GLib::Variant.new(changed_properties) unless changed_properties.is_a?(GLib::Variant)
        LibGObject.g_signal_emit_by_name(@source, "interface-proxy-properties-changed", object_proxy, interface_proxy, changed_properties, invalidated_properties)
      end
    end

    def interface_proxy_properties_changed_signal
      InterfaceProxyPropertiesChangedSignal.new(self)
    end

    # Emitted when a D-Bus signal is received on @interface_proxy.
    #
    # This signal exists purely as a convenience to avoid having to
    # connect signals to all interface proxies managed by @manager.
    #
    # This signal is emitted in the
    # [thread-default main context][g-main-context-push-thread-default]
    # that @manager was constructed in.
    struct InterfaceProxySignalSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "interface-proxy-signal::#{@detail}" : "interface-proxy-signal"
      end

      def connect(&block : Proc(Gio::DBusObjectProxy, Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::DBusObjectProxy, Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gio::DBusObjectProxy, Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object_proxy : Pointer(Void), lib_interface_proxy : Pointer(Void), lib_sender_name : Pointer(LibC::Char), lib_signal_name : Pointer(LibC::Char), lib_parameters : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          object_proxy = Gio::DBusObjectProxy.new(lib_object_proxy, :none)
          # Generator::GObjectArgPlan
          interface_proxy = Gio::DBusProxy.new(lib_interface_proxy, :none)
          sender_name = lib_sender_name
          signal_name = lib_signal_name
          # Generator::HandmadeArgPlan
          parameters = GLib::Variant.new(lib_parameters, :none)
          # Generator::GObjectArgPlan
          parameters = GLib::Variant.new(lib_parameters, :none)
          ::Box(Proc(Gio::DBusObjectProxy, Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil)).unbox(_lib_box).call(object_proxy, interface_proxy, sender_name, signal_name, parameters)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::DBusObjectProxy, Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object_proxy : Pointer(Void), lib_interface_proxy : Pointer(Void), lib_sender_name : Pointer(LibC::Char), lib_signal_name : Pointer(LibC::Char), lib_parameters : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          object_proxy = Gio::DBusObjectProxy.new(lib_object_proxy, :none)
          # Generator::GObjectArgPlan
          interface_proxy = Gio::DBusProxy.new(lib_interface_proxy, :none)
          sender_name = lib_sender_name
          signal_name = lib_signal_name
          # Generator::HandmadeArgPlan
          parameters = GLib::Variant.new(lib_parameters, :none)
          # Generator::GObjectArgPlan
          parameters = GLib::Variant.new(lib_parameters, :none)
          ::Box(Proc(Gio::DBusObjectProxy, Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil)).unbox(_lib_box).call(object_proxy, interface_proxy, sender_name, signal_name, parameters)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::DBusObjectManagerClient, Gio::DBusObjectProxy, Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object_proxy : Pointer(Void), lib_interface_proxy : Pointer(Void), lib_sender_name : Pointer(LibC::Char), lib_signal_name : Pointer(LibC::Char), lib_parameters : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::DBusObjectManagerClient.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          object_proxy = Gio::DBusObjectProxy.new(lib_object_proxy, :none)
          # Generator::GObjectArgPlan
          interface_proxy = Gio::DBusProxy.new(lib_interface_proxy, :none)
          sender_name = lib_sender_name
          signal_name = lib_signal_name
          # Generator::HandmadeArgPlan
          parameters = GLib::Variant.new(lib_parameters, :none)
          # Generator::GObjectArgPlan
          parameters = GLib::Variant.new(lib_parameters, :none)
          ::Box(Proc(Gio::DBusObjectManagerClient, Gio::DBusObjectProxy, Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil)).unbox(_lib_box).call(_sender, object_proxy, interface_proxy, sender_name, signal_name, parameters)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::DBusObjectManagerClient, Gio::DBusObjectProxy, Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object_proxy : Pointer(Void), lib_interface_proxy : Pointer(Void), lib_sender_name : Pointer(LibC::Char), lib_signal_name : Pointer(LibC::Char), lib_parameters : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::DBusObjectManagerClient.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          object_proxy = Gio::DBusObjectProxy.new(lib_object_proxy, :none)
          # Generator::GObjectArgPlan
          interface_proxy = Gio::DBusProxy.new(lib_interface_proxy, :none)
          sender_name = lib_sender_name
          signal_name = lib_signal_name
          # Generator::HandmadeArgPlan
          parameters = GLib::Variant.new(lib_parameters, :none)
          # Generator::GObjectArgPlan
          parameters = GLib::Variant.new(lib_parameters, :none)
          ::Box(Proc(Gio::DBusObjectManagerClient, Gio::DBusObjectProxy, Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil)).unbox(_lib_box).call(_sender, object_proxy, interface_proxy, sender_name, signal_name, parameters)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(object_proxy : Gio::DBusObjectProxy, interface_proxy : Gio::DBusProxy, sender_name : ::String, signal_name : ::String, parameters : _) : Nil
        parameters = GLib::Variant.new(parameters) unless parameters.is_a?(GLib::Variant)
        LibGObject.g_signal_emit_by_name(@source, "interface-proxy-signal", object_proxy, interface_proxy, sender_name, signal_name, parameters)
      end
    end

    def interface_proxy_signal_signal
      InterfaceProxySignalSignal.new(self)
    end
  end
end
