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
  class DBusObjectManagerClient < GObject::Object
    include AsyncInitable
    include DBusObjectManager
    include Initable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, bus_type : Gio::BusType? = nil, connection : Gio::DBusConnection? = nil, flags : Gio::DBusObjectManagerClientFlags? = nil, get_proxy_type_destroy_notify : Pointer(Nil)? = nil, get_proxy_type_func : Pointer(Nil)? = nil, get_proxy_type_user_data : Pointer(Nil)? = nil, name : ::String? = nil, name_owner : ::String? = nil, object_path : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[9]
      _values = StaticArray(LibGObject::Value, 9).new(LibGObject::Value.new)
      _n = 0

      if bus_type
        (_names.to_unsafe + _n).value = "bus-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, bus_type)
        _n += 1
      end
      if connection
        (_names.to_unsafe + _n).value = "connection".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, connection)
        _n += 1
      end
      if flags
        (_names.to_unsafe + _n).value = "flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flags)
        _n += 1
      end
      if get_proxy_type_destroy_notify
        (_names.to_unsafe + _n).value = "get-proxy-type-destroy-notify".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, get_proxy_type_destroy_notify)
        _n += 1
      end
      if get_proxy_type_func
        (_names.to_unsafe + _n).value = "get-proxy-type-func".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, get_proxy_type_func)
        _n += 1
      end
      if get_proxy_type_user_data
        (_names.to_unsafe + _n).value = "get-proxy-type-user-data".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, get_proxy_type_user_data)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if name_owner
        (_names.to_unsafe + _n).value = "name-owner".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name_owner)
        _n += 1
      end
      if object_path
        (_names.to_unsafe + _n).value = "object-path".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, object_path)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DBusObjectManagerClient.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_object_manager_client_get_type
    end

    def bus_type=(value : BusType) : BusType
      unsafe_value = value

      LibGObject.g_object_set(self, "bus-type", unsafe_value, Pointer(Void).null)
      value
    end

    def connection=(value : DBusConnection?) : DBusConnection?
      unsafe_value = value

      LibGObject.g_object_set(self, "connection", unsafe_value, Pointer(Void).null)
      value
    end

    def flags=(value : DBusObjectManagerClientFlags) : DBusObjectManagerClientFlags
      unsafe_value = value

      LibGObject.g_object_set(self, "flags", unsafe_value, Pointer(Void).null)
      value
    end

    def get_proxy_type_destroy_notify=(value : Pointer(Nil)) : Pointer(Nil)
      unsafe_value = value

      LibGObject.g_object_set(self, "get-proxy-type-destroy-notify", unsafe_value, Pointer(Void).null)
      value
    end

    def get_proxy_type_destroy_notify : Pointer(Nil)
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "get-proxy-type-destroy-notify", pointerof(value), Pointer(Void).null)
      Pointer(Void)
    end

    def get_proxy_type_func=(value : Pointer(Nil)) : Pointer(Nil)
      unsafe_value = value

      LibGObject.g_object_set(self, "get-proxy-type-func", unsafe_value, Pointer(Void).null)
      value
    end

    def get_proxy_type_func : Pointer(Nil)
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "get-proxy-type-func", pointerof(value), Pointer(Void).null)
      Pointer(Void)
    end

    def get_proxy_type_user_data=(value : Pointer(Nil)) : Pointer(Nil)
      unsafe_value = value

      LibGObject.g_object_set(self, "get-proxy-type-user-data", unsafe_value, Pointer(Void).null)
      value
    end

    def get_proxy_type_user_data : Pointer(Nil)
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "get-proxy-type-user-data", pointerof(value), Pointer(Void).null)
      Pointer(Void)
    end

    def name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "name", unsafe_value, Pointer(Void).null)
      value
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

    def self.new_finish(res : Gio::AsyncResult) : Gio::DBusObjectManagerClient
      # g_dbus_object_manager_client_new_finish: (Constructor | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_object_manager_client_new_finish(res)
      Gio::DBusObjectManagerClient.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_for_bus_finish(res : Gio::AsyncResult) : Gio::DBusObjectManagerClient
      # g_dbus_object_manager_client_new_for_bus_finish: (Constructor | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_object_manager_client_new_for_bus_finish(res)
      Gio::DBusObjectManagerClient.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_for_bus_sync(bus_type : Gio::BusType, flags : Gio::DBusObjectManagerClientFlags, name : ::String, object_path : ::String, get_proxy_type_func : Pointer(Void)?, get_proxy_type_user_data : Pointer(Nil)?, get_proxy_type_destroy_notify : Pointer(Void)?, cancellable : Gio::Cancellable?) : Gio::DBusObjectManagerClient
      # g_dbus_object_manager_client_new_for_bus_sync: (Constructor | Throws)
      # @get_proxy_type_func: (nullable)
      # @get_proxy_type_user_data: (nullable)
      # @get_proxy_type_destroy_notify: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      get_proxy_type_func = if get_proxy_type_func.nil?
                              LibGio::DBusProxyTypeFunc.null
                            else
                              get_proxy_type_func.to_unsafe
                            end
      get_proxy_type_user_data = if get_proxy_type_user_data.nil?
                                   Pointer(Void).null
                                 else
                                   get_proxy_type_user_data.to_unsafe
                                 end
      get_proxy_type_destroy_notify = if get_proxy_type_destroy_notify.nil?
                                        LibGLib::DestroyNotify.null
                                      else
                                        get_proxy_type_destroy_notify.to_unsafe
                                      end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_dbus_object_manager_client_new_for_bus_sync(bus_type, flags, name, object_path, get_proxy_type_func, get_proxy_type_user_data, get_proxy_type_destroy_notify, cancellable)
      Gio::DBusObjectManagerClient.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_sync(connection : Gio::DBusConnection, flags : Gio::DBusObjectManagerClientFlags, name : ::String?, object_path : ::String, get_proxy_type_func : Pointer(Void)?, get_proxy_type_user_data : Pointer(Nil)?, get_proxy_type_destroy_notify : Pointer(Void)?, cancellable : Gio::Cancellable?) : Gio::DBusObjectManagerClient
      # g_dbus_object_manager_client_new_sync: (Constructor | Throws)
      # @name: (nullable)
      # @get_proxy_type_func: (nullable)
      # @get_proxy_type_user_data: (nullable)
      # @get_proxy_type_destroy_notify: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end
      get_proxy_type_func = if get_proxy_type_func.nil?
                              LibGio::DBusProxyTypeFunc.null
                            else
                              get_proxy_type_func.to_unsafe
                            end
      get_proxy_type_user_data = if get_proxy_type_user_data.nil?
                                   Pointer(Void).null
                                 else
                                   get_proxy_type_user_data.to_unsafe
                                 end
      get_proxy_type_destroy_notify = if get_proxy_type_destroy_notify.nil?
                                        LibGLib::DestroyNotify.null
                                      else
                                        get_proxy_type_destroy_notify.to_unsafe
                                      end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_dbus_object_manager_client_new_sync(connection, flags, name, object_path, get_proxy_type_func, get_proxy_type_user_data, get_proxy_type_destroy_notify, cancellable)
      Gio::DBusObjectManagerClient.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new(connection : Gio::DBusConnection, flags : Gio::DBusObjectManagerClientFlags, name : ::String, object_path : ::String, get_proxy_type_func : Pointer(Void)?, get_proxy_type_user_data : Pointer(Nil)?, get_proxy_type_destroy_notify : Pointer(Void)?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_dbus_object_manager_client_new: (None)
      # @get_proxy_type_func: (nullable)
      # @get_proxy_type_user_data: (nullable)
      # @get_proxy_type_destroy_notify: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      get_proxy_type_func = if get_proxy_type_func.nil?
                              LibGio::DBusProxyTypeFunc.null
                            else
                              get_proxy_type_func.to_unsafe
                            end
      get_proxy_type_user_data = if get_proxy_type_user_data.nil?
                                   Pointer(Void).null
                                 else
                                   get_proxy_type_user_data.to_unsafe
                                 end
      get_proxy_type_destroy_notify = if get_proxy_type_destroy_notify.nil?
                                        LibGLib::DestroyNotify.null
                                      else
                                        get_proxy_type_destroy_notify.to_unsafe
                                      end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_dbus_object_manager_client_new(connection, flags, name, object_path, get_proxy_type_func, get_proxy_type_user_data, get_proxy_type_destroy_notify, cancellable, callback, user_data)
    end

    def self.new_for_bus(bus_type : Gio::BusType, flags : Gio::DBusObjectManagerClientFlags, name : ::String, object_path : ::String, get_proxy_type_func : Pointer(Void)?, get_proxy_type_user_data : Pointer(Nil)?, get_proxy_type_destroy_notify : Pointer(Void)?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_dbus_object_manager_client_new_for_bus: (None)
      # @get_proxy_type_func: (nullable)
      # @get_proxy_type_user_data: (nullable)
      # @get_proxy_type_destroy_notify: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      get_proxy_type_func = if get_proxy_type_func.nil?
                              LibGio::DBusProxyTypeFunc.null
                            else
                              get_proxy_type_func.to_unsafe
                            end
      get_proxy_type_user_data = if get_proxy_type_user_data.nil?
                                   Pointer(Void).null
                                 else
                                   get_proxy_type_user_data.to_unsafe
                                 end
      get_proxy_type_destroy_notify = if get_proxy_type_destroy_notify.nil?
                                        LibGLib::DestroyNotify.null
                                      else
                                        get_proxy_type_destroy_notify.to_unsafe
                                      end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_dbus_object_manager_client_new_for_bus(bus_type, flags, name, object_path, get_proxy_type_func, get_proxy_type_user_data, get_proxy_type_destroy_notify, cancellable, callback, user_data)
    end

    def connection : Gio::DBusConnection
      # g_dbus_object_manager_client_get_connection: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_object_manager_client_get_connection(self)
      Gio::DBusConnection.new(_retval, GICrystal::Transfer::None)
    end

    def flags : Gio::DBusObjectManagerClientFlags
      # g_dbus_object_manager_client_get_flags: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_object_manager_client_get_flags(self)
      Gio::DBusObjectManagerClientFlags.from_value(_retval)
    end

    def name : ::String
      # g_dbus_object_manager_client_get_name: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_object_manager_client_get_name(self)
      ::String.new(_retval)
    end

    def name_owner : ::String?
      # g_dbus_object_manager_client_get_name_owner: (Method | Getter)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_object_manager_client_get_name_owner(self)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

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

      def connect(block : Proc(Gio::DBusObjectProxy, Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), lib_arg3 : Pointer(Pointer(LibC::Char)), box : Pointer(Void)) {
          arg0 = Gio::DBusObjectProxy.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::DBusProxy.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = GLib::Variant.new(lib_arg2, GICrystal::Transfer::None)
          arg3 = GICrystal.transfer_null_ended_array(lib_arg3, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObjectProxy, Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil)).unbox(box).call(arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusObjectProxy, Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), lib_arg3 : Pointer(Pointer(LibC::Char)), box : Pointer(Void)) {
          arg0 = Gio::DBusObjectProxy.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::DBusProxy.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = GLib::Variant.new(lib_arg2, GICrystal::Transfer::None)
          arg3 = GICrystal.transfer_null_ended_array(lib_arg3, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObjectProxy, Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil)).unbox(box).call(arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::DBusObjectManagerClient, Gio::DBusObjectProxy, Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), lib_arg3 : Pointer(Pointer(LibC::Char)), box : Pointer(Void)) {
          sender = Gio::DBusObjectManagerClient.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::DBusObjectProxy.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::DBusProxy.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = GLib::Variant.new(lib_arg2, GICrystal::Transfer::None)
          arg3 = GICrystal.transfer_null_ended_array(lib_arg3, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObjectManagerClient, Gio::DBusObjectProxy, Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil)).unbox(box).call(sender, arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusObjectManagerClient, Gio::DBusObjectProxy, Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), lib_arg3 : Pointer(Pointer(LibC::Char)), box : Pointer(Void)) {
          sender = Gio::DBusObjectManagerClient.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::DBusObjectProxy.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::DBusProxy.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = GLib::Variant.new(lib_arg2, GICrystal::Transfer::None)
          arg3 = GICrystal.transfer_null_ended_array(lib_arg3, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObjectManagerClient, Gio::DBusObjectProxy, Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil)).unbox(box).call(sender, arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(object_proxy : Gio::DBusObjectProxy, interface_proxy : Gio::DBusProxy, changed_properties : _, invalidated_properties : Enumerable(::String)) : Nil
        changed_properties = GLib::Variant.new(changed_properties) unless changed_properties.is_a?(GLib::Variant)
        LibGObject.g_signal_emit_by_name(@source, "interface-proxy-properties-changed", object_proxy, interface_proxy, changed_properties, invalidated_properties)
      end
    end

    def interface_proxy_properties_changed_signal
      InterfaceProxyPropertiesChangedSignal.new(self)
    end

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

      def connect(block : Proc(Gio::DBusObjectProxy, Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(LibC::Char), lib_arg3 : Pointer(LibC::Char), lib_arg4 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::DBusObjectProxy.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::DBusProxy.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = ::String.new(lib_arg2)
          arg3 = ::String.new(lib_arg3)
          arg4 = GLib::Variant.new(lib_arg4, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObjectProxy, Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil)).unbox(box).call(arg0, arg1, arg2, arg3, arg4)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusObjectProxy, Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(LibC::Char), lib_arg3 : Pointer(LibC::Char), lib_arg4 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::DBusObjectProxy.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::DBusProxy.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = ::String.new(lib_arg2)
          arg3 = ::String.new(lib_arg3)
          arg4 = GLib::Variant.new(lib_arg4, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObjectProxy, Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil)).unbox(box).call(arg0, arg1, arg2, arg3, arg4)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::DBusObjectManagerClient, Gio::DBusObjectProxy, Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(LibC::Char), lib_arg3 : Pointer(LibC::Char), lib_arg4 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusObjectManagerClient.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::DBusObjectProxy.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::DBusProxy.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = ::String.new(lib_arg2)
          arg3 = ::String.new(lib_arg3)
          arg4 = GLib::Variant.new(lib_arg4, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObjectManagerClient, Gio::DBusObjectProxy, Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil)).unbox(box).call(sender, arg0, arg1, arg2, arg3, arg4)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusObjectManagerClient, Gio::DBusObjectProxy, Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(LibC::Char), lib_arg3 : Pointer(LibC::Char), lib_arg4 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusObjectManagerClient.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::DBusObjectProxy.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::DBusProxy.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = ::String.new(lib_arg2)
          arg3 = ::String.new(lib_arg3)
          arg4 = GLib::Variant.new(lib_arg4, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObjectManagerClient, Gio::DBusObjectProxy, Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil)).unbox(box).call(sender, arg0, arg1, arg2, arg3, arg4)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
