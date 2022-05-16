require "../g_object-2.0/object"
require "./async_initable"

require "./initable"

module Gio
  # The #GDBusConnection type is used for D-Bus connections to remote
  # peers such as a message buses. It is a low-level API that offers a
  # lot of flexibility. For instance, it lets you establish a connection
  # over any transport that can by represented as a #GIOStream.
  #
  # This class is rarely used directly in D-Bus clients. If you are writing
  # a D-Bus client, it is often easier to use the g_bus_own_name(),
  # g_bus_watch_name() or g_dbus_proxy_new_for_bus() APIs.
  #
  # As an exception to the usual GLib rule that a particular object must not
  # be used by two threads at the same time, #GDBusConnection's methods may be
  # called from any thread. This is so that g_bus_get() and g_bus_get_sync()
  # can safely return the same #GDBusConnection when called from any thread.
  #
  # Most of the ways to obtain a #GDBusConnection automatically initialize it
  # (i.e. connect to D-Bus): for instance, g_dbus_connection_new() and
  # g_bus_get(), and the synchronous versions of those methods, give you an
  # initialized connection. Language bindings for GIO should use
  # g_initable_new() or g_async_initable_new_async(), which also initialize the
  # connection.
  #
  # If you construct an uninitialized #GDBusConnection, such as via
  # g_object_new(), you must initialize it via g_initable_init() or
  # g_async_initable_init_async() before using its methods or properties.
  # Calling methods or accessing properties on a #GDBusConnection that has not
  # completed initialization successfully is considered to be invalid, and leads
  # to undefined behaviour. In particular, if initialization fails with a
  # #GError, the only valid thing you can do with that #GDBusConnection is to
  # free it with g_object_unref().
  #
  # ## An example D-Bus server # {#gdbus-server}
  #
  # Here is an example for a D-Bus server:
  # [gdbus-example-server.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-server.c)
  #
  # ## An example for exporting a subtree # {#gdbus-subtree-server}
  #
  # Here is an example for exporting a subtree:
  # [gdbus-example-subtree.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-subtree.c)
  #
  # ## An example for file descriptor passing # {#gdbus-unix-fd-client}
  #
  # Here is an example for passing UNIX file descriptors:
  # [gdbus-unix-fd-client.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-unix-fd-client.c)
  #
  # ## An example for exporting a GObject # {#gdbus-export}
  #
  # Here is an example for exporting a #GObject:
  # [gdbus-example-export.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-export.c)
  @[GObject::GeneratedWrapper]
  class DBusConnection < GObject::Object
    include AsyncInitable
    include Initable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGio::DBusConnection), instance_init, 0)
    end

    GICrystal.define_new_method(DBusConnection, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `DBusConnection`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, address : ::String? = nil, authentication_observer : Gio::DBusAuthObserver? = nil, capabilities : Gio::DBusCapabilityFlags? = nil, closed : Bool? = nil, exit_on_close : Bool? = nil, flags : Gio::DBusConnectionFlags? = nil, guid : ::String? = nil, stream : Gio::IOStream? = nil, unique_name : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[9]
      _values = StaticArray(LibGObject::Value, 9).new(LibGObject::Value.new)
      _n = 0

      if !address.nil?
        (_names.to_unsafe + _n).value = "address".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, address)
        _n += 1
      end
      if !authentication_observer.nil?
        (_names.to_unsafe + _n).value = "authentication-observer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, authentication_observer)
        _n += 1
      end
      if !capabilities.nil?
        (_names.to_unsafe + _n).value = "capabilities".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, capabilities)
        _n += 1
      end
      if !closed.nil?
        (_names.to_unsafe + _n).value = "closed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, closed)
        _n += 1
      end
      if !exit_on_close.nil?
        (_names.to_unsafe + _n).value = "exit-on-close".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, exit_on_close)
        _n += 1
      end
      if !flags.nil?
        (_names.to_unsafe + _n).value = "flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flags)
        _n += 1
      end
      if !guid.nil?
        (_names.to_unsafe + _n).value = "guid".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, guid)
        _n += 1
      end
      if !stream.nil?
        (_names.to_unsafe + _n).value = "stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, stream)
        _n += 1
      end
      if !unique_name.nil?
        (_names.to_unsafe + _n).value = "unique-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, unique_name)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DBusConnection.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_connection_get_type
    end

    def address=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "address", unsafe_value, Pointer(Void).null)
      value
    end

    def authentication_observer=(value : Gio::DBusAuthObserver?) : Gio::DBusAuthObserver?
      unsafe_value = value

      LibGObject.g_object_set(self, "authentication-observer", unsafe_value, Pointer(Void).null)
      value
    end

    def capabilities : Gio::DBusCapabilityFlags
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "capabilities", pointerof(value), Pointer(Void).null)
      Gio::DBusCapabilityFlags.new(value)
    end

    def closed? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "closed", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def exit_on_close=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "exit-on-close", unsafe_value, Pointer(Void).null)
      value
    end

    def exit_on_close? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "exit-on-close", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def flags=(value : Gio::DBusConnectionFlags) : Gio::DBusConnectionFlags
      unsafe_value = value

      LibGObject.g_object_set(self, "flags", unsafe_value, Pointer(Void).null)
      value
    end

    def flags : Gio::DBusConnectionFlags
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "flags", pointerof(value), Pointer(Void).null)
      Gio::DBusConnectionFlags.new(value)
    end

    def guid=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "guid", unsafe_value, Pointer(Void).null)
      value
    end

    def guid : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "guid", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def stream=(value : Gio::IOStream?) : Gio::IOStream?
      unsafe_value = value

      LibGObject.g_object_set(self, "stream", unsafe_value, Pointer(Void).null)
      value
    end

    def stream : Gio::IOStream?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "stream", pointerof(value), Pointer(Void).null)
      Gio::IOStream.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def unique_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "unique-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Finishes an operation started with g_dbus_connection_new().
    def self.new_finish(res : Gio::AsyncResult) : self
      # g_dbus_connection_new_finish: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_dbus_connection_new_finish(res, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::DBusConnection.new(_retval, GICrystal::Transfer::Full)
    end

    # Finishes an operation started with g_dbus_connection_new_for_address().
    def self.new_for_address_finish(res : Gio::AsyncResult) : self
      # g_dbus_connection_new_for_address_finish: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_dbus_connection_new_for_address_finish(res, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::DBusConnection.new(_retval, GICrystal::Transfer::Full)
    end

    # Synchronously connects and sets up a D-Bus client connection for
    # exchanging D-Bus messages with an endpoint specified by @address
    # which must be in the
    # [D-Bus address format](https://dbus.freedesktop.org/doc/dbus-specification.html#addresses).
    #
    # This constructor can only be used to initiate client-side
    # connections - use g_dbus_connection_new_sync() if you need to act
    # as the server. In particular, @flags cannot contain the
    # %G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER,
    # %G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_ALLOW_ANONYMOUS or
    # %G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_REQUIRE_SAME_USER flags.
    #
    # This is a synchronous failable constructor. See
    # g_dbus_connection_new_for_address() for the asynchronous version.
    #
    # If @observer is not %NULL it may be used to control the
    # authentication process.
    def self.new_for_address_sync(address : ::String, flags : Gio::DBusConnectionFlags, observer : Gio::DBusAuthObserver?, cancellable : Gio::Cancellable?) : self
      # g_dbus_connection_new_for_address_sync: (Constructor | Throws)
      # @observer: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      observer = if observer.nil?
                   Pointer(Void).null
                 else
                   observer.to_unsafe
                 end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_dbus_connection_new_for_address_sync(address, flags, observer, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::DBusConnection.new(_retval, GICrystal::Transfer::Full)
    end

    # Synchronously sets up a D-Bus connection for exchanging D-Bus messages
    # with the end represented by @stream.
    #
    # If @stream is a #GSocketConnection, then the corresponding #GSocket
    # will be put into non-blocking mode.
    #
    # The D-Bus connection will interact with @stream from a worker thread.
    # As a result, the caller should not interact with @stream after this
    # method has been called, except by calling g_object_unref() on it.
    #
    # If @observer is not %NULL it may be used to control the
    # authentication process.
    #
    # This is a synchronous failable constructor. See
    # g_dbus_connection_new() for the asynchronous version.
    def self.new_sync(stream : Gio::IOStream, guid : ::String?, flags : Gio::DBusConnectionFlags, observer : Gio::DBusAuthObserver?, cancellable : Gio::Cancellable?) : self
      # g_dbus_connection_new_sync: (Constructor | Throws)
      # @guid: (nullable)
      # @observer: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      guid = if guid.nil?
               Pointer(LibC::Char).null
             else
               guid.to_unsafe
             end
      # Generator::NullableArrayPlan
      observer = if observer.nil?
                   Pointer(Void).null
                 else
                   observer.to_unsafe
                 end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_dbus_connection_new_sync(stream, guid, flags, observer, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::DBusConnection.new(_retval, GICrystal::Transfer::Full)
    end

    # Asynchronously sets up a D-Bus connection for exchanging D-Bus messages
    # with the end represented by @stream.
    #
    # If @stream is a #GSocketConnection, then the corresponding #GSocket
    # will be put into non-blocking mode.
    #
    # The D-Bus connection will interact with @stream from a worker thread.
    # As a result, the caller should not interact with @stream after this
    # method has been called, except by calling g_object_unref() on it.
    #
    # If @observer is not %NULL it may be used to control the
    # authentication process.
    #
    # When the operation is finished, @callback will be invoked. You can
    # then call g_dbus_connection_new_finish() to get the result of the
    # operation.
    #
    # This is an asynchronous failable constructor. See
    # g_dbus_connection_new_sync() for the synchronous
    # version.
    def self.new(stream : Gio::IOStream, guid : ::String?, flags : Gio::DBusConnectionFlags, observer : Gio::DBusAuthObserver?, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_dbus_connection_new: (None)
      # @guid: (nullable)
      # @observer: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      guid = if guid.nil?
               Pointer(LibC::Char).null
             else
               guid.to_unsafe
             end
      # Generator::NullableArrayPlan
      observer = if observer.nil?
                   Pointer(Void).null
                 else
                   observer.to_unsafe
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
      LibGio.g_dbus_connection_new(stream, guid, flags, observer, cancellable, callback, user_data)

      # Return value handling
    end

    # Asynchronously connects and sets up a D-Bus client connection for
    # exchanging D-Bus messages with an endpoint specified by @address
    # which must be in the
    # [D-Bus address format](https://dbus.freedesktop.org/doc/dbus-specification.html#addresses).
    #
    # This constructor can only be used to initiate client-side
    # connections - use g_dbus_connection_new() if you need to act as the
    # server. In particular, @flags cannot contain the
    # %G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER,
    # %G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_ALLOW_ANONYMOUS or
    # %G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_REQUIRE_SAME_USER flags.
    #
    # When the operation is finished, @callback will be invoked. You can
    # then call g_dbus_connection_new_for_address_finish() to get the result of
    # the operation.
    #
    # If @observer is not %NULL it may be used to control the
    # authentication process.
    #
    # This is an asynchronous failable constructor. See
    # g_dbus_connection_new_for_address_sync() for the synchronous
    # version.
    def self.new_for_address(address : ::String, flags : Gio::DBusConnectionFlags, observer : Gio::DBusAuthObserver?, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_dbus_connection_new_for_address: (None)
      # @observer: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      observer = if observer.nil?
                   Pointer(Void).null
                 else
                   observer.to_unsafe
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
      LibGio.g_dbus_connection_new_for_address(address, flags, observer, cancellable, callback, user_data)

      # Return value handling
    end

    # Adds a message filter. Filters are handlers that are run on all
    # incoming and outgoing messages, prior to standard dispatch. Filters
    # are run in the order that they were added.  The same handler can be
    # added as a filter more than once, in which case it will be run more
    # than once.  Filters added during a filter callback won't be run on
    # the message being processed. Filter functions are allowed to modify
    # and even drop messages.
    #
    # Note that filters are run in a dedicated message handling thread so
    # they can't block and, generally, can't do anything but signal a
    # worker thread. Also note that filters are rarely needed - use API
    # such as g_dbus_connection_send_message_with_reply(),
    # g_dbus_connection_signal_subscribe() or g_dbus_connection_call() instead.
    #
    # If a filter consumes an incoming message the message is not
    # dispatched anywhere else - not even the standard dispatch machinery
    # (that API such as g_dbus_connection_signal_subscribe() and
    # g_dbus_connection_send_message_with_reply() relies on) will see the
    # message. Similarly, if a filter consumes an outgoing message, the
    # message will not be sent to the other peer.
    #
    # If @user_data_free_func is non-%NULL, it will be called (in the
    # thread-default main context of the thread you are calling this
    # method from) at some point after @user_data is no longer
    # needed. (It is not guaranteed to be called synchronously when the
    # filter is removed, and may be called after @connection has been
    # destroyed.)
    def add_filter(filter_function : Gio::DBusMessageFilterFunction) : UInt32
      # g_dbus_connection_add_filter: (Method)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if filter_function
        _box = ::Box.box(filter_function)
        filter_function = ->(lib_connection : Pointer(Void), lib_message : Pointer(Void), lib_incoming : LibC::Int, lib_user_data : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          connection = Gio::DBusConnection.new(lib_connection, :none)
          # Generator::TransferFullArgPlan
          # Generator::BuiltInTypeArgPlan
          message = Gio::DBusMessage.new(lib_message, :none)
          incoming = lib_incoming
          ::Box(Proc(Gio::DBusConnection, Gio::DBusMessage, Bool, Gio::DBusMessage)).unbox(lib_user_data).call(connection, message, incoming)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        user_data_free_func = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        filter_function = user_data = user_data_free_func = Pointer(Void).null
      end

      # C call
      _retval = LibGio.g_dbus_connection_add_filter(@pointer, filter_function, user_data, user_data_free_func)

      # Return value handling

      _retval
    end

    # Asynchronously invokes the @method_name method on the
    # @interface_name D-Bus interface on the remote object at
    # @object_path owned by @bus_name.
    #
    # If @connection is closed then the operation will fail with
    # %G_IO_ERROR_CLOSED. If @cancellable is canceled, the operation will
    # fail with %G_IO_ERROR_CANCELLED. If @parameters contains a value
    # not compatible with the D-Bus protocol, the operation fails with
    # %G_IO_ERROR_INVALID_ARGUMENT.
    #
    # If @reply_type is non-%NULL then the reply will be checked for having this type and an
    # error will be raised if it does not match.  Said another way, if you give a @reply_type
    # then any non-%NULL return value will be of this type. Unless it’s
    # %G_VARIANT_TYPE_UNIT, the @reply_type will be a tuple containing one or more
    # values.
    #
    # If the @parameters #GVariant is floating, it is consumed. This allows
    # convenient 'inline' use of g_variant_new(), e.g.:
    # |[<!-- language="C" -->
    #  g_dbus_connection_call (connection,
    #                          "org.freedesktop.StringThings",
    #                          "/org/freedesktop/StringThings",
    #                          "org.freedesktop.StringThings",
    #                          "TwoStrings",
    #                          g_variant_new ("(ss)",
    #                                         "Thing One",
    #                                         "Thing Two"),
    #                          NULL,
    #                          G_DBUS_CALL_FLAGS_NONE,
    #                          -1,
    #                          NULL,
    #                          (GAsyncReadyCallback) two_strings_done,
    #                          NULL);
    # ]|
    #
    # This is an asynchronous method. When the operation is finished,
    # @callback will be invoked in the
    # [thread-default main context][g-main-context-push-thread-default]
    # of the thread you are calling this method from. You can then call
    # g_dbus_connection_call_finish() to get the result of the operation.
    # See g_dbus_connection_call_sync() for the synchronous version of this
    # function.
    #
    # If @callback is %NULL then the D-Bus method call message will be sent with
    # the %G_DBUS_MESSAGE_FLAGS_NO_REPLY_EXPECTED flag set.
    def call(bus_name : ::String?, object_path : ::String, interface_name : ::String, method_name : ::String, parameters : _?, reply_type : GLib::VariantType?, flags : Gio::DBusCallFlags, timeout_msec : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_dbus_connection_call: (Method)
      # @bus_name: (nullable)
      # @parameters: (nullable)
      # @reply_type: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      bus_name = if bus_name.nil?
                   Pointer(LibC::Char).null
                 else
                   bus_name.to_unsafe
                 end
      # Generator::HandmadeArgPlan
      parameters = if parameters.nil?
                     Pointer(Void).null
                   elsif !parameters.is_a?(GLib::Variant)
                     GLib::Variant.new(parameters).to_unsafe
                   else
                     parameters.to_unsafe
                   end
      # Generator::NullableArrayPlan
      reply_type = if reply_type.nil?
                     Pointer(Void).null
                   else
                     reply_type.to_unsafe
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
      LibGio.g_dbus_connection_call(@pointer, bus_name, object_path, interface_name, method_name, parameters, reply_type, flags, timeout_msec, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an operation started with g_dbus_connection_call().
    def call_finish(res : Gio::AsyncResult) : GLib::Variant
      # g_dbus_connection_call_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_dbus_connection_call_finish(@pointer, res, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    # Synchronously invokes the @method_name method on the
    # @interface_name D-Bus interface on the remote object at
    # @object_path owned by @bus_name.
    #
    # If @connection is closed then the operation will fail with
    # %G_IO_ERROR_CLOSED. If @cancellable is canceled, the
    # operation will fail with %G_IO_ERROR_CANCELLED. If @parameters
    # contains a value not compatible with the D-Bus protocol, the operation
    # fails with %G_IO_ERROR_INVALID_ARGUMENT.
    #
    # If @reply_type is non-%NULL then the reply will be checked for having
    # this type and an error will be raised if it does not match.  Said
    # another way, if you give a @reply_type then any non-%NULL return
    # value will be of this type.
    #
    # If the @parameters #GVariant is floating, it is consumed.
    # This allows convenient 'inline' use of g_variant_new(), e.g.:
    # |[<!-- language="C" -->
    #  g_dbus_connection_call_sync (connection,
    #                               "org.freedesktop.StringThings",
    #                               "/org/freedesktop/StringThings",
    #                               "org.freedesktop.StringThings",
    #                               "TwoStrings",
    #                               g_variant_new ("(ss)",
    #                                              "Thing One",
    #                                              "Thing Two"),
    #                               NULL,
    #                               G_DBUS_CALL_FLAGS_NONE,
    #                               -1,
    #                               NULL,
    #                               &error);
    # ]|
    #
    # The calling thread is blocked until a reply is received. See
    # g_dbus_connection_call() for the asynchronous version of
    # this method.
    def call_sync(bus_name : ::String?, object_path : ::String, interface_name : ::String, method_name : ::String, parameters : _?, reply_type : GLib::VariantType?, flags : Gio::DBusCallFlags, timeout_msec : Int32, cancellable : Gio::Cancellable?) : GLib::Variant
      # g_dbus_connection_call_sync: (Method | Throws)
      # @bus_name: (nullable)
      # @parameters: (nullable)
      # @reply_type: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      bus_name = if bus_name.nil?
                   Pointer(LibC::Char).null
                 else
                   bus_name.to_unsafe
                 end
      # Generator::HandmadeArgPlan
      parameters = if parameters.nil?
                     Pointer(Void).null
                   elsif !parameters.is_a?(GLib::Variant)
                     GLib::Variant.new(parameters).to_unsafe
                   else
                     parameters.to_unsafe
                   end
      # Generator::NullableArrayPlan
      reply_type = if reply_type.nil?
                     Pointer(Void).null
                   else
                     reply_type.to_unsafe
                   end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_dbus_connection_call_sync(@pointer, bus_name, object_path, interface_name, method_name, parameters, reply_type, flags, timeout_msec, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    # Like g_dbus_connection_call() but also takes a #GUnixFDList object.
    #
    # The file descriptors normally correspond to %G_VARIANT_TYPE_HANDLE
    # values in the body of the message. For example, if a message contains
    # two file descriptors, @fd_list would have length 2, and
    # `g_variant_new_handle (0)` and `g_variant_new_handle (1)` would appear
    # somewhere in the body of the message (not necessarily in that order!)
    # to represent the file descriptors at indexes 0 and 1 respectively.
    #
    # When designing D-Bus APIs that are intended to be interoperable,
    # please note that non-GDBus implementations of D-Bus can usually only
    # access file descriptors if they are referenced in this way by a
    # value of type %G_VARIANT_TYPE_HANDLE in the body of the message.
    #
    # This method is only available on UNIX.
    def call_with_unix_fd_list(bus_name : ::String?, object_path : ::String, interface_name : ::String, method_name : ::String, parameters : _?, reply_type : GLib::VariantType?, flags : Gio::DBusCallFlags, timeout_msec : Int32, fd_list : Gio::UnixFDList?, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_dbus_connection_call_with_unix_fd_list: (Method)
      # @bus_name: (nullable)
      # @parameters: (nullable)
      # @reply_type: (nullable)
      # @fd_list: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      bus_name = if bus_name.nil?
                   Pointer(LibC::Char).null
                 else
                   bus_name.to_unsafe
                 end
      # Generator::HandmadeArgPlan
      parameters = if parameters.nil?
                     Pointer(Void).null
                   elsif !parameters.is_a?(GLib::Variant)
                     GLib::Variant.new(parameters).to_unsafe
                   else
                     parameters.to_unsafe
                   end
      # Generator::NullableArrayPlan
      reply_type = if reply_type.nil?
                     Pointer(Void).null
                   else
                     reply_type.to_unsafe
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
      LibGio.g_dbus_connection_call_with_unix_fd_list(@pointer, bus_name, object_path, interface_name, method_name, parameters, reply_type, flags, timeout_msec, fd_list, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an operation started with g_dbus_connection_call_with_unix_fd_list().
    #
    # The file descriptors normally correspond to %G_VARIANT_TYPE_HANDLE
    # values in the body of the message. For example,
    # if g_variant_get_handle() returns 5, that is intended to be a reference
    # to the file descriptor that can be accessed by
    # `g_unix_fd_list_get (*out_fd_list, 5, ...)`.
    #
    # When designing D-Bus APIs that are intended to be interoperable,
    # please note that non-GDBus implementations of D-Bus can usually only
    # access file descriptors if they are referenced in this way by a
    # value of type %G_VARIANT_TYPE_HANDLE in the body of the message.
    def call_with_unix_fd_list_finish(res : Gio::AsyncResult) : GLib::Variant
      # g_dbus_connection_call_with_unix_fd_list_finish: (Method | Throws)
      # @out_fd_list: (out) (transfer full) (optional)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      out_fd_list = Pointer(Pointer(Void)).null
      # C call
      _retval = LibGio.g_dbus_connection_call_with_unix_fd_list_finish(@pointer, out_fd_list, res, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    # Like g_dbus_connection_call_sync() but also takes and returns #GUnixFDList objects.
    # See g_dbus_connection_call_with_unix_fd_list() and
    # g_dbus_connection_call_with_unix_fd_list_finish() for more details.
    #
    # This method is only available on UNIX.
    def call_with_unix_fd_list_sync(bus_name : ::String?, object_path : ::String, interface_name : ::String, method_name : ::String, parameters : _?, reply_type : GLib::VariantType?, flags : Gio::DBusCallFlags, timeout_msec : Int32, fd_list : Gio::UnixFDList?, cancellable : Gio::Cancellable?) : GLib::Variant
      # g_dbus_connection_call_with_unix_fd_list_sync: (Method | Throws)
      # @bus_name: (nullable)
      # @parameters: (nullable)
      # @reply_type: (nullable)
      # @fd_list: (nullable)
      # @out_fd_list: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      bus_name = if bus_name.nil?
                   Pointer(LibC::Char).null
                 else
                   bus_name.to_unsafe
                 end
      # Generator::HandmadeArgPlan
      parameters = if parameters.nil?
                     Pointer(Void).null
                   elsif !parameters.is_a?(GLib::Variant)
                     GLib::Variant.new(parameters).to_unsafe
                   else
                     parameters.to_unsafe
                   end
      # Generator::NullableArrayPlan
      reply_type = if reply_type.nil?
                     Pointer(Void).null
                   else
                     reply_type.to_unsafe
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
      _retval = LibGio.g_dbus_connection_call_with_unix_fd_list_sync(@pointer, bus_name, object_path, interface_name, method_name, parameters, reply_type, flags, timeout_msec, fd_list, out_fd_list, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    # Closes @connection. Note that this never causes the process to
    # exit (this might only happen if the other end of a shared message
    # bus connection disconnects, see #GDBusConnection:exit-on-close).
    #
    # Once the connection is closed, operations such as sending a message
    # will return with the error %G_IO_ERROR_CLOSED. Closing a connection
    # will not automatically flush the connection so queued messages may
    # be lost. Use g_dbus_connection_flush() if you need such guarantees.
    #
    # If @connection is already closed, this method fails with
    # %G_IO_ERROR_CLOSED.
    #
    # When @connection has been closed, the #GDBusConnection::closed
    # signal is emitted in the
    # [thread-default main context][g-main-context-push-thread-default]
    # of the thread that @connection was constructed in.
    #
    # This is an asynchronous method. When the operation is finished,
    # @callback will be invoked in the
    # [thread-default main context][g-main-context-push-thread-default]
    # of the thread you are calling this method from. You can
    # then call g_dbus_connection_close_finish() to get the result of the
    # operation. See g_dbus_connection_close_sync() for the synchronous
    # version.
    def close(cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_dbus_connection_close: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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
      LibGio.g_dbus_connection_close(@pointer, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an operation started with g_dbus_connection_close().
    def close_finish(res : Gio::AsyncResult) : Bool
      # g_dbus_connection_close_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_dbus_connection_close_finish(@pointer, res, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Synchronously closes @connection. The calling thread is blocked
    # until this is done. See g_dbus_connection_close() for the
    # asynchronous version of this method and more details about what it
    # does.
    def close_sync(cancellable : Gio::Cancellable?) : Bool
      # g_dbus_connection_close_sync: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_dbus_connection_close_sync(@pointer, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Emits a signal.
    #
    # If the parameters GVariant is floating, it is consumed.
    #
    # This can only fail if @parameters is not compatible with the D-Bus protocol
    # (%G_IO_ERROR_INVALID_ARGUMENT), or if @connection has been closed
    # (%G_IO_ERROR_CLOSED).
    def emit_signal(destination_bus_name : ::String?, object_path : ::String, interface_name : ::String, signal_name : ::String, parameters : _?) : Bool
      # g_dbus_connection_emit_signal: (Method | Throws)
      # @destination_bus_name: (nullable)
      # @parameters: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      destination_bus_name = if destination_bus_name.nil?
                               Pointer(LibC::Char).null
                             else
                               destination_bus_name.to_unsafe
                             end
      # Generator::HandmadeArgPlan
      parameters = if parameters.nil?
                     Pointer(Void).null
                   elsif !parameters.is_a?(GLib::Variant)
                     GLib::Variant.new(parameters).to_unsafe
                   else
                     parameters.to_unsafe
                   end

      # C call
      _retval = LibGio.g_dbus_connection_emit_signal(@pointer, destination_bus_name, object_path, interface_name, signal_name, parameters, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Exports @action_group on @connection at @object_path.
    #
    # The implemented D-Bus API should be considered private.  It is
    # subject to change in the future.
    #
    # A given object path can only have one action group exported on it.
    # If this constraint is violated, the export will fail and 0 will be
    # returned (with @error set accordingly).
    #
    # You can unexport the action group using
    # g_dbus_connection_unexport_action_group() with the return value of
    # this function.
    #
    # The thread default main context is taken at the time of this call.
    # All incoming action activations and state change requests are
    # reported from this context.  Any changes on the action group that
    # cause it to emit signals must also come from this same context.
    # Since incoming action activations and state change requests are
    # rather likely to cause changes on the action group, this effectively
    # limits a given action group to being exported from only one main
    # context.
    def export_action_group(object_path : ::String, action_group : Gio::ActionGroup) : UInt32
      # g_dbus_connection_export_action_group: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_dbus_connection_export_action_group(@pointer, object_path, action_group, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Exports @menu on @connection at @object_path.
    #
    # The implemented D-Bus API should be considered private.
    # It is subject to change in the future.
    #
    # An object path can only have one menu model exported on it. If this
    # constraint is violated, the export will fail and 0 will be
    # returned (with @error set accordingly).
    #
    # You can unexport the menu model using
    # g_dbus_connection_unexport_menu_model() with the return value of
    # this function.
    def export_menu_model(object_path : ::String, menu : Gio::MenuModel) : UInt32
      # g_dbus_connection_export_menu_model: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_dbus_connection_export_menu_model(@pointer, object_path, menu, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Asynchronously flushes @connection, that is, writes all queued
    # outgoing message to the transport and then flushes the transport
    # (using g_output_stream_flush_async()). This is useful in programs
    # that wants to emit a D-Bus signal and then exit immediately. Without
    # flushing the connection, there is no guaranteed that the message has
    # been sent to the networking buffers in the OS kernel.
    #
    # This is an asynchronous method. When the operation is finished,
    # @callback will be invoked in the
    # [thread-default main context][g-main-context-push-thread-default]
    # of the thread you are calling this method from. You can
    # then call g_dbus_connection_flush_finish() to get the result of the
    # operation. See g_dbus_connection_flush_sync() for the synchronous
    # version.
    def flush(cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_dbus_connection_flush: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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
      LibGio.g_dbus_connection_flush(@pointer, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an operation started with g_dbus_connection_flush().
    def flush_finish(res : Gio::AsyncResult) : Bool
      # g_dbus_connection_flush_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_dbus_connection_flush_finish(@pointer, res, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Synchronously flushes @connection. The calling thread is blocked
    # until this is done. See g_dbus_connection_flush() for the
    # asynchronous version of this method and more details about what it
    # does.
    def flush_sync(cancellable : Gio::Cancellable?) : Bool
      # g_dbus_connection_flush_sync: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_dbus_connection_flush_sync(@pointer, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the capabilities negotiated with the remote peer
    def capabilities : Gio::DBusCapabilityFlags
      # g_dbus_connection_get_capabilities: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_connection_get_capabilities(@pointer)

      # Return value handling

      Gio::DBusCapabilityFlags.new(_retval)
    end

    # Gets whether the process is terminated when @connection is
    # closed by the remote peer. See
    # #GDBusConnection:exit-on-close for more details.
    def exit_on_close : Bool
      # g_dbus_connection_get_exit_on_close: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_connection_get_exit_on_close(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the flags used to construct this connection
    def flags : Gio::DBusConnectionFlags
      # g_dbus_connection_get_flags: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_connection_get_flags(@pointer)

      # Return value handling

      Gio::DBusConnectionFlags.new(_retval)
    end

    # The GUID of the peer performing the role of server when
    # authenticating. See #GDBusConnection:guid for more details.
    def guid : ::String
      # g_dbus_connection_get_guid: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_connection_get_guid(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Retrieves the last serial number assigned to a #GDBusMessage on
    # the current thread. This includes messages sent via both low-level
    # API such as g_dbus_connection_send_message() as well as
    # high-level API such as g_dbus_connection_emit_signal(),
    # g_dbus_connection_call() or g_dbus_proxy_call().
    def last_serial : UInt32
      # g_dbus_connection_get_last_serial: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_connection_get_last_serial(@pointer)

      # Return value handling

      _retval
    end

    # Gets the credentials of the authenticated peer. This will always
    # return %NULL unless @connection acted as a server
    # (e.g. %G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER was passed)
    # when set up and the client passed credentials as part of the
    # authentication process.
    #
    # In a message bus setup, the message bus is always the server and
    # each application is a client. So this method will always return
    # %NULL for message bus clients.
    def peer_credentials : Gio::Credentials?
      # g_dbus_connection_get_peer_credentials: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_connection_get_peer_credentials(@pointer)

      # Return value handling

      Gio::Credentials.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the underlying stream used for IO.
    #
    # While the #GDBusConnection is active, it will interact with this
    # stream from a worker thread, so it is not safe to interact with
    # the stream directly.
    def stream : Gio::IOStream
      # g_dbus_connection_get_stream: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_connection_get_stream(@pointer)

      # Return value handling

      Gio::IOStream.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the unique name of @connection as assigned by the message
    # bus. This can also be used to figure out if @connection is a
    # message bus connection.
    def unique_name : ::String?
      # g_dbus_connection_get_unique_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_connection_get_unique_name(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets whether @connection is closed.
    def is_closed : Bool
      # g_dbus_connection_is_closed: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_connection_is_closed(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Registers callbacks for exported objects at @object_path with the
    # D-Bus interface that is described in @interface_info.
    #
    # Calls to functions in @vtable (and @user_data_free_func) will happen
    # in the
    # [thread-default main context][g-main-context-push-thread-default]
    # of the thread you are calling this method from.
    #
    # Note that all #GVariant values passed to functions in @vtable will match
    # the signature given in @interface_info - if a remote caller passes
    # incorrect values, the `org.freedesktop.DBus.Error.InvalidArgs`
    # is returned to the remote caller.
    #
    # Additionally, if the remote caller attempts to invoke methods or
    # access properties not mentioned in @interface_info the
    # `org.freedesktop.DBus.Error.UnknownMethod` resp.
    # `org.freedesktop.DBus.Error.InvalidArgs` errors
    # are returned to the caller.
    #
    # It is considered a programming error if the
    # #GDBusInterfaceGetPropertyFunc function in @vtable returns a
    # #GVariant of incorrect type.
    #
    # If an existing callback is already registered at @object_path and
    # @interface_name, then @error is set to %G_IO_ERROR_EXISTS.
    #
    # GDBus automatically implements the standard D-Bus interfaces
    # org.freedesktop.DBus.Properties, org.freedesktop.DBus.Introspectable
    # and org.freedesktop.Peer, so you don't have to implement those for the
    # objects you export. You can implement org.freedesktop.DBus.Properties
    # yourself, e.g. to handle getting and setting of properties asynchronously.
    #
    # Note that the reference count on @interface_info will be
    # incremented by 1 (unless allocated statically, e.g. if the
    # reference count is -1, see g_dbus_interface_info_ref()) for as long
    # as the object is exported. Also note that @vtable will be copied.
    #
    # See this [server][gdbus-server] for an example of how to use this method.
    def register_object(object_path : ::String, interface_info : Gio::DBusInterfaceInfo, method_call_closure : GObject::Closure?, get_property_closure : GObject::Closure?, set_property_closure : GObject::Closure?) : UInt32
      # g_dbus_connection_register_object_with_closures: (Method | Throws)
      # @method_call_closure: (nullable)
      # @get_property_closure: (nullable)
      # @set_property_closure: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      method_call_closure = if method_call_closure.nil?
                              Pointer(Void).null
                            else
                              method_call_closure.to_unsafe
                            end
      # Generator::NullableArrayPlan
      get_property_closure = if get_property_closure.nil?
                               Pointer(Void).null
                             else
                               get_property_closure.to_unsafe
                             end
      # Generator::NullableArrayPlan
      set_property_closure = if set_property_closure.nil?
                               Pointer(Void).null
                             else
                               set_property_closure.to_unsafe
                             end

      # C call
      _retval = LibGio.g_dbus_connection_register_object_with_closures(@pointer, object_path, interface_info, method_call_closure, get_property_closure, set_property_closure, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Registers a whole subtree of dynamic objects.
    #
    # The @enumerate and @introspection functions in @vtable are used to
    # convey, to remote callers, what nodes exist in the subtree rooted
    # by @object_path.
    #
    # When handling remote calls into any node in the subtree, first the
    # @enumerate function is used to check if the node exists. If the node exists
    # or the %G_DBUS_SUBTREE_FLAGS_DISPATCH_TO_UNENUMERATED_NODES flag is set
    # the @introspection function is used to check if the node supports the
    # requested method. If so, the @dispatch function is used to determine
    # where to dispatch the call. The collected #GDBusInterfaceVTable and
    # #gpointer will be used to call into the interface vtable for processing
    # the request.
    #
    # All calls into user-provided code will be invoked in the
    # [thread-default main context][g-main-context-push-thread-default]
    # of the thread you are calling this method from.
    #
    # If an existing subtree is already registered at @object_path or
    # then @error is set to %G_IO_ERROR_EXISTS.
    #
    # Note that it is valid to register regular objects (using
    # g_dbus_connection_register_object()) in a subtree registered with
    # g_dbus_connection_register_subtree() - if so, the subtree handler
    # is tried as the last resort. One way to think about a subtree
    # handler is to consider it a fallback handler for object paths not
    # registered via g_dbus_connection_register_object() or other bindings.
    #
    # Note that @vtable will be copied so you cannot change it after
    # registration.
    #
    # See this [server][gdbus-subtree-server] for an example of how to use
    # this method.
    def register_subtree(object_path : ::String, vtable : Gio::DBusSubtreeVTable, flags : Gio::DBusSubtreeFlags, user_data : Pointer(Void)?, user_data_free_func : GLib::DestroyNotify) : UInt32
      # g_dbus_connection_register_subtree: (Method | Throws)
      # @user_data: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      _retval = LibGio.g_dbus_connection_register_subtree(@pointer, object_path, vtable, flags, user_data, user_data_free_func, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Removes a filter.
    #
    # Note that since filters run in a different thread, there is a race
    # condition where it is possible that the filter will be running even
    # after calling g_dbus_connection_remove_filter(), so you cannot just
    # free data that the filter might be using. Instead, you should pass
    # a #GDestroyNotify to g_dbus_connection_add_filter(), which will be
    # called when it is guaranteed that the data is no longer needed.
    def remove_filter(filter_id : UInt32) : Nil
      # g_dbus_connection_remove_filter: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_connection_remove_filter(@pointer, filter_id)

      # Return value handling
    end

    # Asynchronously sends @message to the peer represented by @connection.
    #
    # Unless @flags contain the
    # %G_DBUS_SEND_MESSAGE_FLAGS_PRESERVE_SERIAL flag, the serial number
    # will be assigned by @connection and set on @message via
    # g_dbus_message_set_serial(). If @out_serial is not %NULL, then the
    # serial number used will be written to this location prior to
    # submitting the message to the underlying transport. While it has a `volatile`
    # qualifier, this is a historical artifact and the argument passed to it should
    # not be `volatile`.
    #
    # If @connection is closed then the operation will fail with
    # %G_IO_ERROR_CLOSED. If @message is not well-formed,
    # the operation fails with %G_IO_ERROR_INVALID_ARGUMENT.
    #
    # See this [server][gdbus-server] and [client][gdbus-unix-fd-client]
    # for an example of how to use this low-level API to send and receive
    # UNIX file descriptors.
    #
    # Note that @message must be unlocked, unless @flags contain the
    # %G_DBUS_SEND_MESSAGE_FLAGS_PRESERVE_SERIAL flag.
    def send_message(message : Gio::DBusMessage, flags : Gio::DBusSendMessageFlags) : Bool
      # g_dbus_connection_send_message: (Method | Throws)
      # @out_serial: (out) (transfer full) (optional)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      out_serial = Pointer(UInt32).null
      # C call
      _retval = LibGio.g_dbus_connection_send_message(@pointer, message, flags, out_serial, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Asynchronously sends @message to the peer represented by @connection.
    #
    # Unless @flags contain the
    # %G_DBUS_SEND_MESSAGE_FLAGS_PRESERVE_SERIAL flag, the serial number
    # will be assigned by @connection and set on @message via
    # g_dbus_message_set_serial(). If @out_serial is not %NULL, then the
    # serial number used will be written to this location prior to
    # submitting the message to the underlying transport. While it has a `volatile`
    # qualifier, this is a historical artifact and the argument passed to it should
    # not be `volatile`.
    #
    # If @connection is closed then the operation will fail with
    # %G_IO_ERROR_CLOSED. If @cancellable is canceled, the operation will
    # fail with %G_IO_ERROR_CANCELLED. If @message is not well-formed,
    # the operation fails with %G_IO_ERROR_INVALID_ARGUMENT.
    #
    # This is an asynchronous method. When the operation is finished, @callback
    # will be invoked in the
    # [thread-default main context][g-main-context-push-thread-default]
    # of the thread you are calling this method from. You can then call
    # g_dbus_connection_send_message_with_reply_finish() to get the result of the operation.
    # See g_dbus_connection_send_message_with_reply_sync() for the synchronous version.
    #
    # Note that @message must be unlocked, unless @flags contain the
    # %G_DBUS_SEND_MESSAGE_FLAGS_PRESERVE_SERIAL flag.
    #
    # See this [server][gdbus-server] and [client][gdbus-unix-fd-client]
    # for an example of how to use this low-level API to send and receive
    # UNIX file descriptors.
    def send_message_with_reply(message : Gio::DBusMessage, flags : Gio::DBusSendMessageFlags, timeout_msec : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_dbus_connection_send_message_with_reply: (Method)
      # @out_serial: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      out_serial = Pointer(UInt32).null # Generator::NullableArrayPlan
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
      LibGio.g_dbus_connection_send_message_with_reply(@pointer, message, flags, timeout_msec, out_serial, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an operation started with g_dbus_connection_send_message_with_reply().
    #
    # Note that @error is only set if a local in-process error
    # occurred. That is to say that the returned #GDBusMessage object may
    # be of type %G_DBUS_MESSAGE_TYPE_ERROR. Use
    # g_dbus_message_to_gerror() to transcode this to a #GError.
    #
    # See this [server][gdbus-server] and [client][gdbus-unix-fd-client]
    # for an example of how to use this low-level API to send and receive
    # UNIX file descriptors.
    def send_message_with_reply_finish(res : Gio::AsyncResult) : Gio::DBusMessage
      # g_dbus_connection_send_message_with_reply_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_dbus_connection_send_message_with_reply_finish(@pointer, res, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::DBusMessage.new(_retval, GICrystal::Transfer::Full)
    end

    # Synchronously sends @message to the peer represented by @connection
    # and blocks the calling thread until a reply is received or the
    # timeout is reached. See g_dbus_connection_send_message_with_reply()
    # for the asynchronous version of this method.
    #
    # Unless @flags contain the
    # %G_DBUS_SEND_MESSAGE_FLAGS_PRESERVE_SERIAL flag, the serial number
    # will be assigned by @connection and set on @message via
    # g_dbus_message_set_serial(). If @out_serial is not %NULL, then the
    # serial number used will be written to this location prior to
    # submitting the message to the underlying transport. While it has a `volatile`
    # qualifier, this is a historical artifact and the argument passed to it should
    # not be `volatile`.
    #
    # If @connection is closed then the operation will fail with
    # %G_IO_ERROR_CLOSED. If @cancellable is canceled, the operation will
    # fail with %G_IO_ERROR_CANCELLED. If @message is not well-formed,
    # the operation fails with %G_IO_ERROR_INVALID_ARGUMENT.
    #
    # Note that @error is only set if a local in-process error
    # occurred. That is to say that the returned #GDBusMessage object may
    # be of type %G_DBUS_MESSAGE_TYPE_ERROR. Use
    # g_dbus_message_to_gerror() to transcode this to a #GError.
    #
    # See this [server][gdbus-server] and [client][gdbus-unix-fd-client]
    # for an example of how to use this low-level API to send and receive
    # UNIX file descriptors.
    #
    # Note that @message must be unlocked, unless @flags contain the
    # %G_DBUS_SEND_MESSAGE_FLAGS_PRESERVE_SERIAL flag.
    def send_message_with_reply_sync(message : Gio::DBusMessage, flags : Gio::DBusSendMessageFlags, timeout_msec : Int32, cancellable : Gio::Cancellable?) : Gio::DBusMessage
      # g_dbus_connection_send_message_with_reply_sync: (Method | Throws)
      # @out_serial: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      out_serial = Pointer(UInt32).null # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_dbus_connection_send_message_with_reply_sync(@pointer, message, flags, timeout_msec, out_serial, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::DBusMessage.new(_retval, GICrystal::Transfer::Full)
    end

    # Sets whether the process should be terminated when @connection is
    # closed by the remote peer. See #GDBusConnection:exit-on-close for
    # more details.
    #
    # Note that this function should be used with care. Most modern UNIX
    # desktops tie the notion of a user session with the session bus, and expect
    # all of a user's applications to quit when their bus connection goes away.
    # If you are setting @exit_on_close to %FALSE for the shared session
    # bus connection, you should make sure that your application exits
    # when the user session ends.
    def exit_on_close=(exit_on_close : Bool) : Nil
      # g_dbus_connection_set_exit_on_close: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_connection_set_exit_on_close(@pointer, exit_on_close)

      # Return value handling
    end

    # Subscribes to signals on @connection and invokes @callback with a whenever
    # the signal is received. Note that @callback will be invoked in the
    # [thread-default main context][g-main-context-push-thread-default]
    # of the thread you are calling this method from.
    #
    # If @connection is not a message bus connection, @sender must be
    # %NULL.
    #
    # If @sender is a well-known name note that @callback is invoked with
    # the unique name for the owner of @sender, not the well-known name
    # as one would expect. This is because the message bus rewrites the
    # name. As such, to avoid certain race conditions, users should be
    # tracking the name owner of the well-known name and use that when
    # processing the received signal.
    #
    # If one of %G_DBUS_SIGNAL_FLAGS_MATCH_ARG0_NAMESPACE or
    # %G_DBUS_SIGNAL_FLAGS_MATCH_ARG0_PATH are given, @arg0 is
    # interpreted as part of a namespace or path.  The first argument
    # of a signal is matched against that part as specified by D-Bus.
    #
    # If @user_data_free_func is non-%NULL, it will be called (in the
    # thread-default main context of the thread you are calling this
    # method from) at some point after @user_data is no longer
    # needed. (It is not guaranteed to be called synchronously when the
    # signal is unsubscribed from, and may be called after @connection
    # has been destroyed.)
    #
    # As @callback is potentially invoked in a different thread from where it’s
    # emitted, it’s possible for this to happen after
    # g_dbus_connection_signal_unsubscribe() has been called in another thread.
    # Due to this, @user_data should have a strong reference which is freed with
    # @user_data_free_func, rather than pointing to data whose lifecycle is tied
    # to the signal subscription. For example, if a #GObject is used to store the
    # subscription ID from g_dbus_connection_signal_subscribe(), a strong reference
    # to that #GObject must be passed to @user_data, and g_object_unref() passed to
    # @user_data_free_func. You are responsible for breaking the resulting
    # reference count cycle by explicitly unsubscribing from the signal when
    # dropping the last external reference to the #GObject. Alternatively, a weak
    # reference may be used.
    #
    # It is guaranteed that if you unsubscribe from a signal using
    # g_dbus_connection_signal_unsubscribe() from the same thread which made the
    # corresponding g_dbus_connection_signal_subscribe() call, @callback will not
    # be invoked after g_dbus_connection_signal_unsubscribe() returns.
    #
    # The returned subscription identifier is an opaque value which is guaranteed
    # to never be zero.
    #
    # This function can never fail.
    def signal_subscribe(sender : ::String?, interface_name : ::String?, member : ::String?, object_path : ::String?, arg0 : ::String?, flags : Gio::DBusSignalFlags, callback : Gio::DBusSignalCallback) : UInt32
      # g_dbus_connection_signal_subscribe: (Method)
      # @sender: (nullable)
      # @interface_name: (nullable)
      # @member: (nullable)
      # @object_path: (nullable)
      # @arg0: (nullable)
      # @user_data: (nullable)
      # @user_data_free_func: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      sender = if sender.nil?
                 Pointer(LibC::Char).null
               else
                 sender.to_unsafe
               end
      # Generator::NullableArrayPlan
      interface_name = if interface_name.nil?
                         Pointer(LibC::Char).null
                       else
                         interface_name.to_unsafe
                       end
      # Generator::NullableArrayPlan
      member = if member.nil?
                 Pointer(LibC::Char).null
               else
                 member.to_unsafe
               end
      # Generator::NullableArrayPlan
      object_path = if object_path.nil?
                      Pointer(LibC::Char).null
                    else
                      object_path.to_unsafe
                    end
      # Generator::NullableArrayPlan
      arg0 = if arg0.nil?
               Pointer(LibC::Char).null
             else
               arg0.to_unsafe
             end
      # Generator::CallbackArgPlan
      if callback
        _box = ::Box.box(callback)
        callback = ->(lib_connection : Pointer(Void), lib_sender_name : Pointer(LibC::Char), lib_object_path : Pointer(LibC::Char), lib_interface_name : Pointer(LibC::Char), lib_signal_name : Pointer(LibC::Char), lib_parameters : Pointer(Void), lib_user_data : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          connection = Gio::DBusConnection.new(lib_connection, :none)
          # Generator::NullableArrayPlan
          sender_name = (lib_sender_name.null? ? nil : ::String.new(lib_sender_name))
          # Generator::BuiltInTypeArgPlan
          sender_name = ::String.new(lib_sender_name) unless lib_sender_name.null?
          # Generator::BuiltInTypeArgPlan
          object_path = ::String.new(lib_object_path)
          # Generator::BuiltInTypeArgPlan
          interface_name = ::String.new(lib_interface_name)
          # Generator::BuiltInTypeArgPlan
          signal_name = ::String.new(lib_signal_name)
          # Generator::HandmadeArgPlan
          parameters = GLib::Variant.new(lib_parameters, :none)
          ::Box(Proc(Gio::DBusConnection, ::String?, ::String, ::String, ::String, GLib::Variant, Nil)).unbox(lib_user_data).call(connection, sender_name, object_path, interface_name, signal_name, parameters)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        user_data_free_func = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        callback = user_data = user_data_free_func = Pointer(Void).null
      end

      # C call
      _retval = LibGio.g_dbus_connection_signal_subscribe(@pointer, sender, interface_name, member, object_path, arg0, flags, callback, user_data, user_data_free_func)

      # Return value handling

      _retval
    end

    # Unsubscribes from signals.
    #
    # Note that there may still be D-Bus traffic to process (relating to this
    # signal subscription) in the current thread-default #GMainContext after this
    # function has returned. You should continue to iterate the #GMainContext
    # until the #GDestroyNotify function passed to
    # g_dbus_connection_signal_subscribe() is called, in order to avoid memory
    # leaks through callbacks queued on the #GMainContext after it’s stopped being
    # iterated.
    # Alternatively, any idle source with a priority lower than %G_PRIORITY_DEFAULT
    # that was scheduled after unsubscription, also indicates that all resources
    # of this subscription are released.
    def signal_unsubscribe(subscription_id : UInt32) : Nil
      # g_dbus_connection_signal_unsubscribe: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_connection_signal_unsubscribe(@pointer, subscription_id)

      # Return value handling
    end

    # If @connection was created with
    # %G_DBUS_CONNECTION_FLAGS_DELAY_MESSAGE_PROCESSING, this method
    # starts processing messages. Does nothing on if @connection wasn't
    # created with this flag or if the method has already been called.
    def start_message_processing : Nil
      # g_dbus_connection_start_message_processing: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_connection_start_message_processing(@pointer)

      # Return value handling
    end

    # Reverses the effect of a previous call to
    # g_dbus_connection_export_action_group().
    #
    # It is an error to call this function with an ID that wasn't returned
    # from g_dbus_connection_export_action_group() or to call it with the
    # same ID more than once.
    def unexport_action_group(export_id : UInt32) : Nil
      # g_dbus_connection_unexport_action_group: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_connection_unexport_action_group(@pointer, export_id)

      # Return value handling
    end

    # Reverses the effect of a previous call to
    # g_dbus_connection_export_menu_model().
    #
    # It is an error to call this function with an ID that wasn't returned
    # from g_dbus_connection_export_menu_model() or to call it with the
    # same ID more than once.
    def unexport_menu_model(export_id : UInt32) : Nil
      # g_dbus_connection_unexport_menu_model: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_connection_unexport_menu_model(@pointer, export_id)

      # Return value handling
    end

    # Unregisters an object.
    def unregister_object(registration_id : UInt32) : Bool
      # g_dbus_connection_unregister_object: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_connection_unregister_object(@pointer, registration_id)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Unregisters a subtree.
    def unregister_subtree(registration_id : UInt32) : Bool
      # g_dbus_connection_unregister_subtree: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_connection_unregister_subtree(@pointer, registration_id)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Emitted when the connection is closed.
    #
    # The cause of this event can be
    #
    # - If g_dbus_connection_close() is called. In this case
    #   @remote_peer_vanished is set to %FALSE and @error is %NULL.
    #
    # - If the remote peer closes the connection. In this case
    #   @remote_peer_vanished is set to %TRUE and @error is set.
    #
    # - If the remote peer sends invalid or malformed data. In this
    #   case @remote_peer_vanished is set to %FALSE and @error is set.
    #
    # Upon receiving this signal, you should give up your reference to
    # @connection. You are guaranteed that this signal is emitted only
    # once.
    struct ClosedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "closed::#{@detail}" : "closed"
      end

      def connect(&block : Proc(Bool, GLib::Error?, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Bool, GLib::Error?, Nil))
        connect(block)
      end

      def connect(handler : Proc(Bool, GLib::Error?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_remote_peer_vanished : LibC::Int, lib_error : Pointer(Void), _lib_box : Pointer(Void)) {
          remote_peer_vanished = lib_remote_peer_vanished
          # Generator::NullableArrayPlan
          error = (lib_error.null? ? nil : GLib::Error.new(lib_error, GICrystal::Transfer::None))
          ::Box(Proc(Bool, GLib::Error?, Nil)).unbox(_lib_box).call(remote_peer_vanished, error)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Bool, GLib::Error?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_remote_peer_vanished : LibC::Int, lib_error : Pointer(Void), _lib_box : Pointer(Void)) {
          remote_peer_vanished = lib_remote_peer_vanished
          # Generator::NullableArrayPlan
          error = (lib_error.null? ? nil : GLib::Error.new(lib_error, GICrystal::Transfer::None))
          ::Box(Proc(Bool, GLib::Error?, Nil)).unbox(_lib_box).call(remote_peer_vanished, error)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::DBusConnection, Bool, GLib::Error?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_remote_peer_vanished : LibC::Int, lib_error : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::DBusConnection.new(_lib_sender, GICrystal::Transfer::None)
          remote_peer_vanished = lib_remote_peer_vanished
          # Generator::NullableArrayPlan
          error = (lib_error.null? ? nil : GLib::Error.new(lib_error, GICrystal::Transfer::None))
          ::Box(Proc(Gio::DBusConnection, Bool, GLib::Error?, Nil)).unbox(_lib_box).call(_sender, remote_peer_vanished, error)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::DBusConnection, Bool, GLib::Error?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_remote_peer_vanished : LibC::Int, lib_error : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::DBusConnection.new(_lib_sender, GICrystal::Transfer::None)
          remote_peer_vanished = lib_remote_peer_vanished
          # Generator::NullableArrayPlan
          error = (lib_error.null? ? nil : GLib::Error.new(lib_error, GICrystal::Transfer::None))
          ::Box(Proc(Gio::DBusConnection, Bool, GLib::Error?, Nil)).unbox(_lib_box).call(_sender, remote_peer_vanished, error)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(remote_peer_vanished : Bool, error : GLib::Error?) : Nil
        # Generator::NullableArrayPlan
        error = if error.nil?
                  Pointer(Void).null
                else
                  error.to_unsafe
                end

        LibGObject.g_signal_emit_by_name(@source, "closed", remote_peer_vanished, error)
      end
    end

    def closed_signal
      ClosedSignal.new(self)
    end
  end
end
