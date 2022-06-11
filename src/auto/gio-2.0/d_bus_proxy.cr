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
  @[GObject::GeneratedWrapper]
  class DBusProxy < GObject::Object
    include AsyncInitable
    include DBusInterface
    include Initable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::DBusProxyClass), class_init,
        sizeof(LibGio::DBusProxy), instance_init, 0)
    end

    GICrystal.define_new_method(DBusProxy, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `DBusProxy`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, g_bus_type : Gio::BusType? = nil, g_connection : Gio::DBusConnection? = nil, g_default_timeout : Int32? = nil, g_flags : Gio::DBusProxyFlags? = nil, g_interface_info : Gio::DBusInterfaceInfo? = nil, g_interface_name : ::String? = nil, g_name : ::String? = nil, g_name_owner : ::String? = nil, g_object_path : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[9]
      _values = StaticArray(LibGObject::Value, 9).new(LibGObject::Value.new)
      _n = 0

      if !g_bus_type.nil?
        (_names.to_unsafe + _n).value = "g-bus-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_bus_type)
        _n += 1
      end
      if !g_connection.nil?
        (_names.to_unsafe + _n).value = "g-connection".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_connection)
        _n += 1
      end
      if !g_default_timeout.nil?
        (_names.to_unsafe + _n).value = "g-default-timeout".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_default_timeout)
        _n += 1
      end
      if !g_flags.nil?
        (_names.to_unsafe + _n).value = "g-flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_flags)
        _n += 1
      end
      if !g_interface_info.nil?
        (_names.to_unsafe + _n).value = "g-interface-info".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_interface_info)
        _n += 1
      end
      if !g_interface_name.nil?
        (_names.to_unsafe + _n).value = "g-interface-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_interface_name)
        _n += 1
      end
      if !g_name.nil?
        (_names.to_unsafe + _n).value = "g-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_name)
        _n += 1
      end
      if !g_name_owner.nil?
        (_names.to_unsafe + _n).value = "g-name-owner".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_name_owner)
        _n += 1
      end
      if !g_object_path.nil?
        (_names.to_unsafe + _n).value = "g-object-path".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_object_path)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DBusProxy.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      Gio::DBusProxyFlags.new(value)
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

    # Finishes creating a #GDBusProxy.
    def self.new_finish(res : Gio::AsyncResult) : self
      # g_dbus_proxy_new_finish: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_dbus_proxy_new_finish(res, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::DBusProxy.new(_retval, GICrystal::Transfer::Full)
    end

    # Finishes creating a #GDBusProxy.
    def self.new_for_bus_finish(res : Gio::AsyncResult) : self
      # g_dbus_proxy_new_for_bus_finish: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_dbus_proxy_new_for_bus_finish(res, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::DBusProxy.new(_retval, GICrystal::Transfer::Full)
    end

    # Like g_dbus_proxy_new_sync() but takes a #GBusType instead of a #GDBusConnection.
    #
    # #GDBusProxy is used in this [example][gdbus-wellknown-proxy].
    def self.new_for_bus_sync(bus_type : Gio::BusType, flags : Gio::DBusProxyFlags, info : Gio::DBusInterfaceInfo?, name : ::String, object_path : ::String, interface_name : ::String, cancellable : Gio::Cancellable?) : self
      # g_dbus_proxy_new_for_bus_sync: (Constructor | Throws)
      # @info: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      info = if info.nil?
               Pointer(Void).null
             else
               info.to_unsafe
             end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_dbus_proxy_new_for_bus_sync(bus_type, flags, info, name, object_path, interface_name, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::DBusProxy.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a proxy for accessing @interface_name on the remote object
    # at @object_path owned by @name at @connection and synchronously
    # loads D-Bus properties unless the
    # %G_DBUS_PROXY_FLAGS_DO_NOT_LOAD_PROPERTIES flag is used.
    #
    # If the %G_DBUS_PROXY_FLAGS_DO_NOT_CONNECT_SIGNALS flag is not set, also sets up
    # match rules for signals. Connect to the #GDBusProxy::g-signal signal
    # to handle signals from the remote object.
    #
    # If both %G_DBUS_PROXY_FLAGS_DO_NOT_LOAD_PROPERTIES and
    # %G_DBUS_PROXY_FLAGS_DO_NOT_CONNECT_SIGNALS are set, this constructor is
    # guaranteed to return immediately without blocking.
    #
    # If @name is a well-known name and the
    # %G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START and %G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START_AT_CONSTRUCTION
    # flags aren't set and no name owner currently exists, the message bus
    # will be requested to launch a name owner for the name.
    #
    # This is a synchronous failable constructor. See g_dbus_proxy_new()
    # and g_dbus_proxy_new_finish() for the asynchronous version.
    #
    # #GDBusProxy is used in this [example][gdbus-wellknown-proxy].
    def self.new_sync(connection : Gio::DBusConnection, flags : Gio::DBusProxyFlags, info : Gio::DBusInterfaceInfo?, name : ::String?, object_path : ::String, interface_name : ::String, cancellable : Gio::Cancellable?) : self
      # g_dbus_proxy_new_sync: (Constructor | Throws)
      # @info: (nullable)
      # @name: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      info = if info.nil?
               Pointer(Void).null
             else
               info.to_unsafe
             end
      # Generator::NullableArrayPlan
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_dbus_proxy_new_sync(connection, flags, info, name, object_path, interface_name, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::DBusProxy.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a proxy for accessing @interface_name on the remote object
    # at @object_path owned by @name at @connection and asynchronously
    # loads D-Bus properties unless the
    # %G_DBUS_PROXY_FLAGS_DO_NOT_LOAD_PROPERTIES flag is used. Connect to
    # the #GDBusProxy::g-properties-changed signal to get notified about
    # property changes.
    #
    # If the %G_DBUS_PROXY_FLAGS_DO_NOT_CONNECT_SIGNALS flag is not set, also sets up
    # match rules for signals. Connect to the #GDBusProxy::g-signal signal
    # to handle signals from the remote object.
    #
    # If both %G_DBUS_PROXY_FLAGS_DO_NOT_LOAD_PROPERTIES and
    # %G_DBUS_PROXY_FLAGS_DO_NOT_CONNECT_SIGNALS are set, this constructor is
    # guaranteed to complete immediately without blocking.
    #
    # If @name is a well-known name and the
    # %G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START and %G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START_AT_CONSTRUCTION
    # flags aren't set and no name owner currently exists, the message bus
    # will be requested to launch a name owner for the name.
    #
    # This is a failable asynchronous constructor - when the proxy is
    # ready, @callback will be invoked and you can use
    # g_dbus_proxy_new_finish() to get the result.
    #
    # See g_dbus_proxy_new_sync() and for a synchronous version of this constructor.
    #
    # #GDBusProxy is used in this [example][gdbus-wellknown-proxy].
    def self.new(connection : Gio::DBusConnection, flags : Gio::DBusProxyFlags, info : Gio::DBusInterfaceInfo?, name : ::String?, object_path : ::String, interface_name : ::String, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_dbus_proxy_new: (None)
      # @info: (nullable)
      # @name: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      info = if info.nil?
               Pointer(Void).null
             else
               info.to_unsafe
             end
      # Generator::NullableArrayPlan
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
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
      LibGio.g_dbus_proxy_new(connection, flags, info, name, object_path, interface_name, cancellable, callback, user_data)

      # Return value handling
    end

    # Like g_dbus_proxy_new() but takes a #GBusType instead of a #GDBusConnection.
    #
    # #GDBusProxy is used in this [example][gdbus-wellknown-proxy].
    def self.new_for_bus(bus_type : Gio::BusType, flags : Gio::DBusProxyFlags, info : Gio::DBusInterfaceInfo?, name : ::String, object_path : ::String, interface_name : ::String, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_dbus_proxy_new_for_bus: (None)
      # @info: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      info = if info.nil?
               Pointer(Void).null
             else
               info.to_unsafe
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
      LibGio.g_dbus_proxy_new_for_bus(bus_type, flags, info, name, object_path, interface_name, cancellable, callback, user_data)

      # Return value handling
    end

    # Asynchronously invokes the @method_name method on @proxy.
    #
    # If @method_name contains any dots, then @name is split into interface and
    # method name parts. This allows using @proxy for invoking methods on
    # other interfaces.
    #
    # If the #GDBusConnection associated with @proxy is closed then
    # the operation will fail with %G_IO_ERROR_CLOSED. If
    # @cancellable is canceled, the operation will fail with
    # %G_IO_ERROR_CANCELLED. If @parameters contains a value not
    # compatible with the D-Bus protocol, the operation fails with
    # %G_IO_ERROR_INVALID_ARGUMENT.
    #
    # If the @parameters #GVariant is floating, it is consumed. This allows
    # convenient 'inline' use of g_variant_new(), e.g.:
    # |[<!-- language="C" -->
    #  g_dbus_proxy_call (proxy,
    #                     "TwoStrings",
    #                     g_variant_new ("(ss)",
    #                                    "Thing One",
    #                                    "Thing Two"),
    #                     G_DBUS_CALL_FLAGS_NONE,
    #                     -1,
    #                     NULL,
    #                     (GAsyncReadyCallback) two_strings_done,
    #                     &data);
    # ]|
    #
    # If @proxy has an expected interface (see
    # #GDBusProxy:g-interface-info) and @method_name is referenced by it,
    # then the return value is checked against the return type.
    #
    # This is an asynchronous method. When the operation is finished,
    # @callback will be invoked in the
    # [thread-default main context][g-main-context-push-thread-default]
    # of the thread you are calling this method from.
    # You can then call g_dbus_proxy_call_finish() to get the result of
    # the operation. See g_dbus_proxy_call_sync() for the synchronous
    # version of this method.
    #
    # If @callback is %NULL then the D-Bus method call message will be sent with
    # the %G_DBUS_MESSAGE_FLAGS_NO_REPLY_EXPECTED flag set.
    def call(method_name : ::String, parameters : _?, flags : Gio::DBusCallFlags, timeout_msec : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_dbus_proxy_call: (Method)
      # @parameters: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      parameters = if parameters.nil?
                     Pointer(Void).null
                   elsif !parameters.is_a?(GLib::Variant)
                     GLib::Variant.new(parameters).to_unsafe
                   else
                     parameters.to_unsafe
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
      LibGio.g_dbus_proxy_call(@pointer, method_name, parameters, flags, timeout_msec, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an operation started with g_dbus_proxy_call().
    def call_finish(res : Gio::AsyncResult) : GLib::Variant
      # g_dbus_proxy_call_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_dbus_proxy_call_finish(@pointer, res, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    # Synchronously invokes the @method_name method on @proxy.
    #
    # If @method_name contains any dots, then @name is split into interface and
    # method name parts. This allows using @proxy for invoking methods on
    # other interfaces.
    #
    # If the #GDBusConnection associated with @proxy is disconnected then
    # the operation will fail with %G_IO_ERROR_CLOSED. If
    # @cancellable is canceled, the operation will fail with
    # %G_IO_ERROR_CANCELLED. If @parameters contains a value not
    # compatible with the D-Bus protocol, the operation fails with
    # %G_IO_ERROR_INVALID_ARGUMENT.
    #
    # If the @parameters #GVariant is floating, it is consumed. This allows
    # convenient 'inline' use of g_variant_new(), e.g.:
    # |[<!-- language="C" -->
    #  g_dbus_proxy_call_sync (proxy,
    #                          "TwoStrings",
    #                          g_variant_new ("(ss)",
    #                                         "Thing One",
    #                                         "Thing Two"),
    #                          G_DBUS_CALL_FLAGS_NONE,
    #                          -1,
    #                          NULL,
    #                          &error);
    # ]|
    #
    # The calling thread is blocked until a reply is received. See
    # g_dbus_proxy_call() for the asynchronous version of this
    # method.
    #
    # If @proxy has an expected interface (see
    # #GDBusProxy:g-interface-info) and @method_name is referenced by it,
    # then the return value is checked against the return type.
    def call_sync(method_name : ::String, parameters : _?, flags : Gio::DBusCallFlags, timeout_msec : Int32, cancellable : Gio::Cancellable?) : GLib::Variant
      # g_dbus_proxy_call_sync: (Method | Throws)
      # @parameters: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::HandmadeArgPlan
      parameters = if parameters.nil?
                     Pointer(Void).null
                   elsif !parameters.is_a?(GLib::Variant)
                     GLib::Variant.new(parameters).to_unsafe
                   else
                     parameters.to_unsafe
                   end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_dbus_proxy_call_sync(@pointer, method_name, parameters, flags, timeout_msec, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    # Like g_dbus_proxy_call() but also takes a #GUnixFDList object.
    #
    # This method is only available on UNIX.
    def call_with_unix_fd_list(method_name : ::String, parameters : _?, flags : Gio::DBusCallFlags, timeout_msec : Int32, fd_list : Gio::UnixFDList?, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_dbus_proxy_call_with_unix_fd_list: (Method)
      # @parameters: (nullable)
      # @fd_list: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      parameters = if parameters.nil?
                     Pointer(Void).null
                   elsif !parameters.is_a?(GLib::Variant)
                     GLib::Variant.new(parameters).to_unsafe
                   else
                     parameters.to_unsafe
                   end
      # Generator::NullableArrayPlan
      fd_list = if fd_list.nil?
                  Pointer(Void).null
                else
                  fd_list.to_unsafe
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
      LibGio.g_dbus_proxy_call_with_unix_fd_list(@pointer, method_name, parameters, flags, timeout_msec, fd_list, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an operation started with g_dbus_proxy_call_with_unix_fd_list().
    def call_with_unix_fd_list_finish(res : Gio::AsyncResult) : GLib::Variant
      # g_dbus_proxy_call_with_unix_fd_list_finish: (Method | Throws)
      # @out_fd_list: (out) (transfer full) (optional)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      out_fd_list = Pointer(Pointer(Void)).null
      # C call
      _retval = LibGio.g_dbus_proxy_call_with_unix_fd_list_finish(@pointer, out_fd_list, res, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    # Like g_dbus_proxy_call_sync() but also takes and returns #GUnixFDList objects.
    #
    # This method is only available on UNIX.
    def call_with_unix_fd_list_sync(method_name : ::String, parameters : _?, flags : Gio::DBusCallFlags, timeout_msec : Int32, fd_list : Gio::UnixFDList?, cancellable : Gio::Cancellable?) : GLib::Variant
      # g_dbus_proxy_call_with_unix_fd_list_sync: (Method | Throws)
      # @parameters: (nullable)
      # @fd_list: (nullable)
      # @out_fd_list: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::HandmadeArgPlan
      parameters = if parameters.nil?
                     Pointer(Void).null
                   elsif !parameters.is_a?(GLib::Variant)
                     GLib::Variant.new(parameters).to_unsafe
                   else
                     parameters.to_unsafe
                   end
      # Generator::NullableArrayPlan
      fd_list = if fd_list.nil?
                  Pointer(Void).null
                else
                  fd_list.to_unsafe
                end
      # Generator::OutArgUsedInReturnPlan
      out_fd_list = Pointer(Pointer(Void)).null # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_dbus_proxy_call_with_unix_fd_list_sync(@pointer, method_name, parameters, flags, timeout_msec, fd_list, out_fd_list, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    # Looks up the value for a property from the cache. This call does no
    # blocking IO.
    #
    # If @proxy has an expected interface (see
    # #GDBusProxy:g-interface-info) and @property_name is referenced by
    # it, then @value is checked against the type of the property.
    def cached_property(property_name : ::String) : GLib::Variant?
      # g_dbus_proxy_get_cached_property: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_proxy_get_cached_property(@pointer, property_name)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets the names of all cached properties on @proxy.
    def cached_property_names : Enumerable(::String)?
      # g_dbus_proxy_get_cached_property_names: (Method)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGio.g_dbus_proxy_get_cached_property_names(@pointer)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets the connection @proxy is for.
    def connection : Gio::DBusConnection
      # g_dbus_proxy_get_connection: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_proxy_get_connection(@pointer)

      # Return value handling

      Gio::DBusConnection.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the timeout to use if -1 (specifying default timeout) is
    # passed as @timeout_msec in the g_dbus_proxy_call() and
    # g_dbus_proxy_call_sync() functions.
    #
    # See the #GDBusProxy:g-default-timeout property for more details.
    def default_timeout : Int32
      # g_dbus_proxy_get_default_timeout: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_proxy_get_default_timeout(@pointer)

      # Return value handling

      _retval
    end

    # Gets the flags that @proxy was constructed with.
    def flags : Gio::DBusProxyFlags
      # g_dbus_proxy_get_flags: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_proxy_get_flags(@pointer)

      # Return value handling

      Gio::DBusProxyFlags.new(_retval)
    end

    # Returns the #GDBusInterfaceInfo, if any, specifying the interface
    # that @proxy conforms to. See the #GDBusProxy:g-interface-info
    # property for more details.
    def interface_info : Gio::DBusInterfaceInfo?
      # g_dbus_proxy_get_interface_info: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_proxy_get_interface_info(@pointer)

      # Return value handling

      Gio::DBusInterfaceInfo.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the D-Bus interface name @proxy is for.
    def interface_name : ::String
      # g_dbus_proxy_get_interface_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_proxy_get_interface_name(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the name that @proxy was constructed for.
    #
    # When connected to a message bus, this will usually be non-%NULL.
    # However, it may be %NULL for a proxy that communicates using a peer-to-peer
    # pattern.
    def name : ::String?
      # g_dbus_proxy_get_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_proxy_get_name(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # The unique name that owns the name that @proxy is for or %NULL if
    # no-one currently owns that name. You may connect to the
    # #GObject::notify signal to track changes to the
    # #GDBusProxy:g-name-owner property.
    def name_owner : ::String?
      # g_dbus_proxy_get_name_owner: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_proxy_get_name_owner(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    # Gets the object path @proxy is for.
    def object_path : ::String
      # g_dbus_proxy_get_object_path: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_proxy_get_object_path(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # If @value is not %NULL, sets the cached value for the property with
    # name @property_name to the value in @value.
    #
    # If @value is %NULL, then the cached value is removed from the
    # property cache.
    #
    # If @proxy has an expected interface (see
    # #GDBusProxy:g-interface-info) and @property_name is referenced by
    # it, then @value is checked against the type of the property.
    #
    # If the @value #GVariant is floating, it is consumed. This allows
    # convenient 'inline' use of g_variant_new(), e.g.
    # |[<!-- language="C" -->
    #  g_dbus_proxy_set_cached_property (proxy,
    #                                    "SomeProperty",
    #                                    g_variant_new ("(si)",
    #                                                  "A String",
    #                                                  42));
    # ]|
    #
    # Normally you will not need to use this method since @proxy
    # is tracking changes using the
    # `org.freedesktop.DBus.Properties.PropertiesChanged`
    # D-Bus signal. However, for performance reasons an object may
    # decide to not use this signal for some properties and instead
    # use a proprietary out-of-band mechanism to transmit changes.
    #
    # As a concrete example, consider an object with a property
    # `ChatroomParticipants` which is an array of strings. Instead of
    # transmitting the same (long) array every time the property changes,
    # it is more efficient to only transmit the delta using e.g. signals
    # `ChatroomParticipantJoined(String name)` and
    # `ChatroomParticipantParted(String name)`.
    def set_cached_property(property_name : ::String, value : _?) : Nil
      # g_dbus_proxy_set_cached_property: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if value.nil?
                Pointer(Void).null
              elsif !value.is_a?(GLib::Variant)
                GLib::Variant.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      LibGio.g_dbus_proxy_set_cached_property(@pointer, property_name, value)

      # Return value handling
    end

    # Sets the timeout to use if -1 (specifying default timeout) is
    # passed as @timeout_msec in the g_dbus_proxy_call() and
    # g_dbus_proxy_call_sync() functions.
    #
    # See the #GDBusProxy:g-default-timeout property for more details.
    def default_timeout=(timeout_msec : Int32) : Nil
      # g_dbus_proxy_set_default_timeout: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_proxy_set_default_timeout(@pointer, timeout_msec)

      # Return value handling
    end

    # Ensure that interactions with @proxy conform to the given
    # interface. See the #GDBusProxy:g-interface-info property for more
    # details.
    def interface_info=(info : Gio::DBusInterfaceInfo?) : Nil
      # g_dbus_proxy_set_interface_info: (Method)
      # @info: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      info = if info.nil?
               Pointer(Void).null
             else
               info.to_unsafe
             end

      # C call
      LibGio.g_dbus_proxy_set_interface_info(@pointer, info)

      # Return value handling
    end

    # Emitted when one or more D-Bus properties on @proxy changes. The
    # local cache has already been updated when this signal fires. Note
    # that both @changed_properties and @invalidated_properties are
    # guaranteed to never be %NULL (either may be empty though).
    #
    # If the proxy has the flag
    # %G_DBUS_PROXY_FLAGS_GET_INVALIDATED_PROPERTIES set, then
    # @invalidated_properties will always be empty.
    #
    # This signal corresponds to the
    # `PropertiesChanged` D-Bus signal on the
    # `org.freedesktop.DBus.Properties` interface.
    struct GPropertiesChangedSignal < GObject::Signal
      def name : String
        @detail ? "g-properties-changed::#{@detail}" : "g-properties-changed"
      end

      def connect(*, after : Bool = false, &block : Proc(GLib::Variant, Enumerable(::String), Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(GLib::Variant, Enumerable(::String), Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_changed_properties : Pointer(Void), lib_invalidated_properties : Pointer(Pointer(LibC::Char)), _lib_box : Pointer(Void)) {
          # Generator::HandmadeArgPlan
          changed_properties = GLib::Variant.new(lib_changed_properties, :none)
          # Generator::ArrayArgPlan
          raise NotImplementedError.new
          ::Box(Proc(GLib::Variant, Enumerable(::String), Nil)).unbox(_lib_box).call(changed_properties, invalidated_properties)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_changed_properties : Pointer(Void), lib_invalidated_properties : Pointer(Pointer(LibC::Char)), _lib_box : Pointer(Void)) {
          _sender = Gio::DBusProxy.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::HandmadeArgPlan
          changed_properties = GLib::Variant.new(lib_changed_properties, :none)
          # Generator::ArrayArgPlan
          raise NotImplementedError.new
          ::Box(Proc(Gio::DBusProxy, GLib::Variant, Enumerable(::String), Nil)).unbox(_lib_box).call(_sender, changed_properties, invalidated_properties)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(changed_properties : _, invalidated_properties : Enumerable(::String)) : Nil
        # Generator::HandmadeArgPlan
        changed_properties = if !changed_properties.is_a?(GLib::Variant)
                               GLib::Variant.new(changed_properties).to_unsafe
                             else
                               changed_properties.to_unsafe
                             end
        # Generator::ArrayArgPlan
        invalidated_properties = invalidated_properties.to_a.map(&.to_unsafe).to_unsafe

        LibGObject.g_signal_emit_by_name(@source, "g-properties-changed", changed_properties, invalidated_properties)
      end
    end

    def g_properties_changed_signal
      GPropertiesChangedSignal.new(self)
    end

    # Emitted when a signal from the remote object and interface that @proxy is for, has been received.
    #
    # Since 2.72 this signal supports detailed connections. You can connect to
    # the detailed signal `g-signal::x` in order to receive callbacks only when
    # signal `x` is received from the remote object.
    struct GSignalSignal < GObject::Signal
      def name : String
        @detail ? "g-signal::#{@detail}" : "g-signal"
      end

      def connect(*, after : Bool = false, &block : Proc(::String?, ::String, GLib::Variant, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(::String?, ::String, GLib::Variant, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_sender_name : Pointer(LibC::Char), lib_signal_name : Pointer(LibC::Char), lib_parameters : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::NullableArrayPlan
          sender_name = (lib_sender_name.null? ? nil : ::String.new(lib_sender_name))
          # Generator::BuiltInTypeArgPlan
          sender_name = ::String.new(lib_sender_name) unless lib_sender_name.null?
          # Generator::BuiltInTypeArgPlan
          signal_name = ::String.new(lib_signal_name)
          # Generator::HandmadeArgPlan
          parameters = GLib::Variant.new(lib_parameters, :none)
          ::Box(Proc(::String?, ::String, GLib::Variant, Nil)).unbox(_lib_box).call(sender_name, signal_name, parameters)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::DBusProxy, ::String?, ::String, GLib::Variant, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_sender_name : Pointer(LibC::Char), lib_signal_name : Pointer(LibC::Char), lib_parameters : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::DBusProxy.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::NullableArrayPlan
          sender_name = (lib_sender_name.null? ? nil : ::String.new(lib_sender_name))
          # Generator::BuiltInTypeArgPlan
          sender_name = ::String.new(lib_sender_name) unless lib_sender_name.null?
          # Generator::BuiltInTypeArgPlan
          signal_name = ::String.new(lib_signal_name)
          # Generator::HandmadeArgPlan
          parameters = GLib::Variant.new(lib_parameters, :none)
          ::Box(Proc(Gio::DBusProxy, ::String?, ::String, GLib::Variant, Nil)).unbox(_lib_box).call(_sender, sender_name, signal_name, parameters)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(sender_name : ::String?, signal_name : ::String, parameters : _) : Nil
        # Generator::NullableArrayPlan
        sender_name = if sender_name.nil?
                        Pointer(LibC::Char).null
                      else
                        sender_name.to_unsafe
                      end
        # Generator::HandmadeArgPlan
        parameters = if !parameters.is_a?(GLib::Variant)
                       GLib::Variant.new(parameters).to_unsafe
                     else
                       parameters.to_unsafe
                     end

        LibGObject.g_signal_emit_by_name(@source, "g-signal", sender_name, signal_name, parameters)
      end
    end

    def g_signal_signal
      GSignalSignal.new(self)
    end
  end
end
