require "../g_object-2.0/object"
require "./async_initable"

require "./d_bus_interface"

require "./initable"

module Gio
  # #GDBusProxy is a base class used for proxies to access a D-Bus
  # interface on a remote object. A #GDBusProxy can be constructed for
  # both well-known and unique names.
  #
  # By default, #GDBusProxy will cache all properties (and listen to
  # changes) of the remote object, and proxy all signals that get
  # emitted. This behaviour can be changed by passing suitable
  # #GDBusProxyFlags when the proxy is created. If the proxy is for a
  # well-known name, the property cache is flushed when the name owner
  # vanishes and reloaded when a name owner appears.
  #
  # The unique name owner of the proxy's name is tracked and can be read from
  # #GDBusProxy:g-name-owner. Connect to the #GObject::notify signal to
  # get notified of changes. Additionally, only signals and property
  # changes emitted from the current name owner are considered and
  # calls are always sent to the current name owner. This avoids a
  # number of race conditions when the name is lost by one owner and
  # claimed by another. However, if no name owner currently exists,
  # then calls will be sent to the well-known name which may result in
  # the message bus launching an owner (unless
  # %G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START is set).
  #
  # If the proxy is for a stateless D-Bus service, where the name owner may
  # be started and stopped between calls, the #GDBusProxy:g-name-owner tracking
  # of #GDBusProxy will cause the proxy to drop signal and property changes from
  # the service after it has restarted for the first time. When interacting
  # with a stateless D-Bus service, do not use #GDBusProxy — use direct D-Bus
  # method calls and signal connections.
  #
  # The generic #GDBusProxy::g-properties-changed and
  # #GDBusProxy::g-signal signals are not very convenient to work with.
  # Therefore, the recommended way of working with proxies is to subclass
  # #GDBusProxy, and have more natural properties and signals in your derived
  # class. This [example][gdbus-example-gdbus-codegen] shows how this can
  # easily be done using the [gdbus-codegen][gdbus-codegen] tool.
  #
  # A #GDBusProxy instance can be used from multiple threads but note
  # that all signals (e.g. #GDBusProxy::g-signal, #GDBusProxy::g-properties-changed
  # and #GObject::notify) are emitted in the
  # [thread-default main context][g-main-context-push-thread-default]
  # of the thread where the instance was constructed.
  #
  # An example using a proxy for a well-known name can be found in
  # [gdbus-example-watch-proxy.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-watch-proxy.c)
  class DBusProxy < GObject::Object
    include AsyncInitable
    include DBusInterface
    include Initable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, g_bus_type : Gio::BusType? = nil, g_connection : Gio::DBusConnection? = nil, g_default_timeout : Int32? = nil, g_flags : Gio::DBusProxyFlags? = nil, g_interface_info : Gio::DBusInterfaceInfo? = nil, g_interface_name : ::String? = nil, g_name : ::String? = nil, g_name_owner : ::String? = nil, g_object_path : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[9]
      _values = StaticArray(LibGObject::Value, 9).new(LibGObject::Value.new)
      _n = 0

      if g_bus_type
        (_names.to_unsafe + _n).value = "g-bus-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_bus_type)
        _n += 1
      end
      if g_connection
        (_names.to_unsafe + _n).value = "g-connection".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_connection)
        _n += 1
      end
      if g_default_timeout
        (_names.to_unsafe + _n).value = "g-default-timeout".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_default_timeout)
        _n += 1
      end
      if g_flags
        (_names.to_unsafe + _n).value = "g-flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_flags)
        _n += 1
      end
      if g_interface_info
        (_names.to_unsafe + _n).value = "g-interface-info".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_interface_info)
        _n += 1
      end
      if g_interface_name
        (_names.to_unsafe + _n).value = "g-interface-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_interface_name)
        _n += 1
      end
      if g_name
        (_names.to_unsafe + _n).value = "g-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_name)
        _n += 1
      end
      if g_name_owner
        (_names.to_unsafe + _n).value = "g-name-owner".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_name_owner)
        _n += 1
      end
      if g_object_path
        (_names.to_unsafe + _n).value = "g-object-path".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_object_path)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DBusProxy.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_proxy_get_type
    end

    def g_bus_type=(value : Gio::BusType) : Gio::BusType
      unsafe_value = value

      LibGObject.g_object_set(self, "g-bus-type", unsafe_value, Pointer(Void).null)
      value
    end

    def g_connection=(value : Gio::DBusConnection?) : Gio::DBusConnection?
      unsafe_value = value

      LibGObject.g_object_set(self, "g-connection", unsafe_value, Pointer(Void).null)
      value
    end

    def g_connection : Gio::DBusConnection?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "g-connection", pointerof(value), Pointer(Void).null)
      Gio::DBusConnection.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def g_default_timeout=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "g-default-timeout", unsafe_value, Pointer(Void).null)
      value
    end

    def g_default_timeout : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "g-default-timeout", pointerof(value), Pointer(Void).null)
      value
    end

    def g_flags=(value : Gio::DBusProxyFlags) : Gio::DBusProxyFlags
      unsafe_value = value

      LibGObject.g_object_set(self, "g-flags", unsafe_value, Pointer(Void).null)
      value
    end

    def g_flags : Gio::DBusProxyFlags
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "g-flags", pointerof(value), Pointer(Void).null)
      Gio::DBusProxyFlags.from_value(value)
    end

    def g_interface_info=(value : Gio::DBusInterfaceInfo?) : Gio::DBusInterfaceInfo?
      unsafe_value = value

      LibGObject.g_object_set(self, "g-interface-info", unsafe_value, Pointer(Void).null)
      value
    end

    def g_interface_info : Gio::DBusInterfaceInfo?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "g-interface-info", pointerof(value), Pointer(Void).null)
      Gio::DBusInterfaceInfo.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def g_interface_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "g-interface-name", unsafe_value, Pointer(Void).null)
      value
    end

    def g_interface_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "g-interface-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def g_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "g-name", unsafe_value, Pointer(Void).null)
      value
    end

    def g_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "g-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def g_name_owner : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "g-name-owner", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def g_object_path=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "g-object-path", unsafe_value, Pointer(Void).null)
      value
    end

    def g_object_path : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "g-object-path", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def self.new_finish(res : Gio::AsyncResult) : Gio::DBusProxy
      # g_dbus_proxy_new_finish: (Constructor | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_proxy_new_finish(res)
      Gio::DBusProxy.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_for_bus_finish(res : Gio::AsyncResult) : Gio::DBusProxy
      # g_dbus_proxy_new_for_bus_finish: (Constructor | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_proxy_new_for_bus_finish(res)
      Gio::DBusProxy.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_for_bus_sync(bus_type : Gio::BusType, flags : Gio::DBusProxyFlags, info : Gio::DBusInterfaceInfo?, name : ::String, object_path : ::String, interface_name : ::String, cancellable : Gio::Cancellable?) : Gio::DBusProxy
      # g_dbus_proxy_new_for_bus_sync: (Constructor | Throws)
      # @info: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      info = if info.nil?
               Pointer(Void).null
             else
               info.to_unsafe
             end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_dbus_proxy_new_for_bus_sync(bus_type, flags, info, name, object_path, interface_name, cancellable)
      Gio::DBusProxy.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_sync(connection : Gio::DBusConnection, flags : Gio::DBusProxyFlags, info : Gio::DBusInterfaceInfo?, name : ::String?, object_path : ::String, interface_name : ::String, cancellable : Gio::Cancellable?) : Gio::DBusProxy
      # g_dbus_proxy_new_sync: (Constructor | Throws)
      # @info: (nullable)
      # @name: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      info = if info.nil?
               Pointer(Void).null
             else
               info.to_unsafe
             end
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_dbus_proxy_new_sync(connection, flags, info, name, object_path, interface_name, cancellable)
      Gio::DBusProxy.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new(connection : Gio::DBusConnection, flags : Gio::DBusProxyFlags, info : Gio::DBusInterfaceInfo?, name : ::String?, object_path : ::String, interface_name : ::String, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_dbus_proxy_new: (None)
      # @info: (nullable)
      # @name: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      info = if info.nil?
               Pointer(Void).null
             else
               info.to_unsafe
             end
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
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

      LibGio.g_dbus_proxy_new(connection, flags, info, name, object_path, interface_name, cancellable, callback, user_data)
    end

    def self.new_for_bus(bus_type : Gio::BusType, flags : Gio::DBusProxyFlags, info : Gio::DBusInterfaceInfo?, name : ::String, object_path : ::String, interface_name : ::String, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_dbus_proxy_new_for_bus: (None)
      # @info: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      info = if info.nil?
               Pointer(Void).null
             else
               info.to_unsafe
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

      LibGio.g_dbus_proxy_new_for_bus(bus_type, flags, info, name, object_path, interface_name, cancellable, callback, user_data)
    end

    def call(method_name : ::String, parameters : _?, flags : Gio::DBusCallFlags, timeout_msec : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_dbus_proxy_call: (Method)
      # @parameters: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      parameters = if parameters.nil?
                     Pointer(Void).null
                   else
                     parameters.to_unsafe
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
      parameters = GLib::Variant.new(parameters) unless parameters.is_a?(GLib::Variant)

      LibGio.g_dbus_proxy_call(self, method_name, parameters, flags, timeout_msec, cancellable, callback, user_data)
    end

    def call_finish(res : Gio::AsyncResult) : GLib::Variant
      # g_dbus_proxy_call_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_proxy_call_finish(self, res)
      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    def call_sync(method_name : ::String, parameters : _?, flags : Gio::DBusCallFlags, timeout_msec : Int32, cancellable : Gio::Cancellable?) : GLib::Variant
      # g_dbus_proxy_call_sync: (Method | Throws)
      # @parameters: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      parameters = if parameters.nil?
                     Pointer(Void).null
                   else
                     parameters.to_unsafe
                   end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      parameters = GLib::Variant.new(parameters) unless parameters.is_a?(GLib::Variant)

      _retval = LibGio.g_dbus_proxy_call_sync(self, method_name, parameters, flags, timeout_msec, cancellable)
      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    def call_with_unix_fd_list(method_name : ::String, parameters : _?, flags : Gio::DBusCallFlags, timeout_msec : Int32, fd_list : Gio::UnixFDList?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_dbus_proxy_call_with_unix_fd_list: (Method)
      # @parameters: (nullable)
      # @fd_list: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      parameters = if parameters.nil?
                     Pointer(Void).null
                   else
                     parameters.to_unsafe
                   end
      fd_list = if fd_list.nil?
                  Pointer(Void).null
                else
                  fd_list.to_unsafe
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
      parameters = GLib::Variant.new(parameters) unless parameters.is_a?(GLib::Variant)

      LibGio.g_dbus_proxy_call_with_unix_fd_list(self, method_name, parameters, flags, timeout_msec, fd_list, cancellable, callback, user_data)
    end

    def call_with_unix_fd_list_finish(res : Gio::AsyncResult) : GLib::Variant
      # g_dbus_proxy_call_with_unix_fd_list_finish: (Method | Throws)
      # @out_fd_list: (out) (transfer full) (optional)
      # Returns: (transfer full)

      out_fd_list = Pointer(Pointer(Void)).null

      _retval = LibGio.g_dbus_proxy_call_with_unix_fd_list_finish(self, out_fd_list, res)
      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    def call_with_unix_fd_list_sync(method_name : ::String, parameters : _?, flags : Gio::DBusCallFlags, timeout_msec : Int32, fd_list : Gio::UnixFDList?, cancellable : Gio::Cancellable?) : GLib::Variant
      # g_dbus_proxy_call_with_unix_fd_list_sync: (Method | Throws)
      # @parameters: (nullable)
      # @fd_list: (nullable)
      # @out_fd_list: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      out_fd_list = Pointer(Pointer(Void)).null
      parameters = if parameters.nil?
                     Pointer(Void).null
                   else
                     parameters.to_unsafe
                   end
      fd_list = if fd_list.nil?
                  Pointer(Void).null
                else
                  fd_list.to_unsafe
                end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      parameters = GLib::Variant.new(parameters) unless parameters.is_a?(GLib::Variant)

      _retval = LibGio.g_dbus_proxy_call_with_unix_fd_list_sync(self, method_name, parameters, flags, timeout_msec, fd_list, out_fd_list, cancellable)
      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    def cached_property(property_name : ::String) : GLib::Variant?
      # g_dbus_proxy_get_cached_property: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_proxy_get_cached_property(self, property_name)
      GLib::Variant.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def cached_property_names : Enumerable(::String)?
      # g_dbus_proxy_get_cached_property_names: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_proxy_get_cached_property_names(self)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def connection : Gio::DBusConnection
      # g_dbus_proxy_get_connection: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_proxy_get_connection(self)
      Gio::DBusConnection.new(_retval, GICrystal::Transfer::None)
    end

    def default_timeout : Int32
      # g_dbus_proxy_get_default_timeout: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_proxy_get_default_timeout(self)
      _retval
    end

    def flags : Gio::DBusProxyFlags
      # g_dbus_proxy_get_flags: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_proxy_get_flags(self)
      Gio::DBusProxyFlags.from_value(_retval)
    end

    def interface_info : Gio::DBusInterfaceInfo?
      # g_dbus_proxy_get_interface_info: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_proxy_get_interface_info(self)
      Gio::DBusInterfaceInfo.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def interface_name : ::String
      # g_dbus_proxy_get_interface_name: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_proxy_get_interface_name(self)
      ::String.new(_retval)
    end

    def name : ::String?
      # g_dbus_proxy_get_name: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_proxy_get_name(self)
      ::String.new(_retval) unless _retval.null?
    end

    def name_owner : ::String?
      # g_dbus_proxy_get_name_owner: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_proxy_get_name_owner(self)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def object_path : ::String
      # g_dbus_proxy_get_object_path: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_proxy_get_object_path(self)
      ::String.new(_retval)
    end

    def set_cached_property(property_name : ::String, value : _?) : Nil
      # g_dbus_proxy_set_cached_property: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      value = if value.nil?
                Pointer(Void).null
              else
                value.to_unsafe
              end
      value = GLib::Variant.new(value) unless value.is_a?(GLib::Variant)

      LibGio.g_dbus_proxy_set_cached_property(self, property_name, value)
    end

    def default_timeout=(timeout_msec : Int32) : Nil
      # g_dbus_proxy_set_default_timeout: (Method)
      # Returns: (transfer none)

      LibGio.g_dbus_proxy_set_default_timeout(self, timeout_msec)
    end

    def interface_info=(info : Gio::DBusInterfaceInfo?) : Nil
      # g_dbus_proxy_set_interface_info: (Method)
      # @info: (nullable)
      # Returns: (transfer none)

      info = if info.nil?
               Pointer(Void).null
             else
               info.to_unsafe
             end

      LibGio.g_dbus_proxy_set_interface_info(self, info)
    end

    struct GPropertiesChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "g-properties-changed::#{@detail}" : "g-properties-changed"
      end

      def connect(&block : Proc(GLib::Variant, Enumerable(::String), Nil))
        connect(block)
      end

      def connect_after(&block : Proc(GLib::Variant, Enumerable(::String), Nil))
        connect(block)
      end

      def connect(block : Proc(GLib::Variant, Enumerable(::String), Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Pointer(LibC::Char)), box : Pointer(Void)) {
          arg0 = GLib::Variant.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GICrystal.transfer_null_ended_array(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(GLib::Variant, Enumerable(::String), Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(GLib::Variant, Enumerable(::String), Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Pointer(LibC::Char)), box : Pointer(Void)) {
          arg0 = GLib::Variant.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GICrystal.transfer_null_ended_array(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(GLib::Variant, Enumerable(::String), Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Pointer(LibC::Char)), box : Pointer(Void)) {
          sender = Gio::DBusProxy.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GLib::Variant.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GICrystal.transfer_null_ended_array(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Pointer(LibC::Char)), box : Pointer(Void)) {
          sender = Gio::DBusProxy.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GLib::Variant.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GICrystal.transfer_null_ended_array(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(changed_properties : _, invalidated_properties : Enumerable(::String)) : Nil
        changed_properties = GLib::Variant.new(changed_properties) unless changed_properties.is_a?(GLib::Variant)
        LibGObject.g_signal_emit_by_name(@source, "g-properties-changed", changed_properties, invalidated_properties)
      end
    end

    def g_properties_changed_signal
      GPropertiesChangedSignal.new(self)
    end

    struct GSignalSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "g-signal::#{@detail}" : "g-signal"
      end

      def connect(&block : Proc(::String, ::String, GLib::Variant, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(::String, ::String, GLib::Variant, Nil))
        connect(block)
      end

      def connect(block : Proc(::String, ::String, GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), lib_arg1 : Pointer(LibC::Char), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          arg1 = ::String.new(lib_arg1)
          arg2 = GLib::Variant.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(::String, ::String, GLib::Variant, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(::String, ::String, GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), lib_arg1 : Pointer(LibC::Char), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          arg1 = ::String.new(lib_arg1)
          arg2 = GLib::Variant.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(::String, ::String, GLib::Variant, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), lib_arg1 : Pointer(LibC::Char), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusProxy.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          arg1 = ::String.new(lib_arg1)
          arg2 = GLib::Variant.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), lib_arg1 : Pointer(LibC::Char), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusProxy.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          arg1 = ::String.new(lib_arg1)
          arg2 = GLib::Variant.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusProxy, ::String, ::String, GLib::Variant, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(sender_name : ::String, signal_name : ::String, parameters : _) : Nil
        parameters = GLib::Variant.new(parameters) unless parameters.is_a?(GLib::Variant)
        LibGObject.g_signal_emit_by_name(@source, "g-signal", sender_name, signal_name, parameters)
      end
    end

    def g_signal_signal
      GSignalSignal.new(self)
    end
  end
end
