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
  class DBusConnection < GObject::Object
    include AsyncInitable
    include Initable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, address : ::String? = nil, authentication_observer : Gio::DBusAuthObserver? = nil, capabilities : Gio::DBusCapabilityFlags? = nil, closed : Bool? = nil, exit_on_close : Bool? = nil, flags : Gio::DBusConnectionFlags? = nil, guid : ::String? = nil, stream : Gio::IOStream? = nil, unique_name : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[9]
      _values = StaticArray(LibGObject::Value, 9).new(LibGObject::Value.new)
      _n = 0

      if address
        (_names.to_unsafe + _n).value = "address".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, address)
        _n += 1
      end
      if authentication_observer
        (_names.to_unsafe + _n).value = "authentication-observer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, authentication_observer)
        _n += 1
      end
      if capabilities
        (_names.to_unsafe + _n).value = "capabilities".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, capabilities)
        _n += 1
      end
      if closed
        (_names.to_unsafe + _n).value = "closed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, closed)
        _n += 1
      end
      if exit_on_close
        (_names.to_unsafe + _n).value = "exit-on-close".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, exit_on_close)
        _n += 1
      end
      if flags
        (_names.to_unsafe + _n).value = "flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flags)
        _n += 1
      end
      if guid
        (_names.to_unsafe + _n).value = "guid".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, guid)
        _n += 1
      end
      if stream
        (_names.to_unsafe + _n).value = "stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, stream)
        _n += 1
      end
      if unique_name
        (_names.to_unsafe + _n).value = "unique-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, unique_name)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DBusConnection.g_type, _n, _names, _values)
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
      Gio::DBusCapabilityFlags.from_value(value)
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
      Gio::DBusConnectionFlags.from_value(value)
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

    def self.new_finish(res : Gio::AsyncResult) : self
      # g_dbus_connection_new_finish: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_connection_new_finish(res, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      Gio::DBusConnection.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_for_address_finish(res : Gio::AsyncResult) : self
      # g_dbus_connection_new_for_address_finish: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_connection_new_for_address_finish(res, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      Gio::DBusConnection.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_for_address_sync(address : ::String, flags : Gio::DBusConnectionFlags, observer : Gio::DBusAuthObserver?, cancellable : Gio::Cancellable?) : self
      # g_dbus_connection_new_for_address_sync: (Constructor | Throws)
      # @observer: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      observer = if observer.nil?
                   Pointer(Void).null
                 else
                   observer.to_unsafe
                 end
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

    def self.new_sync(stream : Gio::IOStream, guid : ::String?, flags : Gio::DBusConnectionFlags, observer : Gio::DBusAuthObserver?, cancellable : Gio::Cancellable?) : self
      # g_dbus_connection_new_sync: (Constructor | Throws)
      # @guid: (nullable)
      # @observer: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      guid = if guid.nil?
               Pointer(LibC::Char).null
             else
               guid.to_unsafe
             end
      observer = if observer.nil?
                   Pointer(Void).null
                 else
                   observer.to_unsafe
                 end
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

    def self.new(stream : Gio::IOStream, guid : ::String?, flags : Gio::DBusConnectionFlags, observer : Gio::DBusAuthObserver?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_dbus_connection_new: (None)
      # @guid: (nullable)
      # @observer: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      guid = if guid.nil?
               Pointer(LibC::Char).null
             else
               guid.to_unsafe
             end
      observer = if observer.nil?
                   Pointer(Void).null
                 else
                   observer.to_unsafe
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

      # C call
      LibGio.g_dbus_connection_new(stream, guid, flags, observer, cancellable, callback, user_data)

      # Return value handling
    end

    def self.new_for_address(address : ::String, flags : Gio::DBusConnectionFlags, observer : Gio::DBusAuthObserver?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_dbus_connection_new_for_address: (None)
      # @observer: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      observer = if observer.nil?
                   Pointer(Void).null
                 else
                   observer.to_unsafe
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

      # C call
      LibGio.g_dbus_connection_new_for_address(address, flags, observer, cancellable, callback, user_data)

      # Return value handling
    end

    def add_filter(filter_function : Pointer(Void), user_data : Pointer(Void)?, user_data_free_func : Pointer(Void)) : UInt32
      # g_dbus_connection_add_filter: (Method)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      _retval = LibGio.g_dbus_connection_add_filter(self, filter_function, user_data, user_data_free_func)

      # Return value handling
      _retval
    end

    def call(bus_name : ::String?, object_path : ::String, interface_name : ::String, method_name : ::String, parameters : _?, reply_type : GLib::VariantType?, flags : Gio::DBusCallFlags, timeout_msec : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_dbus_connection_call: (Method)
      # @bus_name: (nullable)
      # @parameters: (nullable)
      # @reply_type: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      bus_name = if bus_name.nil?
                   Pointer(LibC::Char).null
                 else
                   bus_name.to_unsafe
                 end
      parameters = if parameters.nil?
                     Pointer(Void).null
                   else
                     parameters.to_unsafe
                   end
      reply_type = if reply_type.nil?
                     Pointer(Void).null
                   else
                     reply_type.to_unsafe
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

      # C call
      LibGio.g_dbus_connection_call(self, bus_name, object_path, interface_name, method_name, parameters, reply_type, flags, timeout_msec, cancellable, callback, user_data)

      # Return value handling
    end

    def call_finish(res : Gio::AsyncResult) : GLib::Variant
      # g_dbus_connection_call_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_connection_call_finish(self, res, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    def call_sync(bus_name : ::String?, object_path : ::String, interface_name : ::String, method_name : ::String, parameters : _?, reply_type : GLib::VariantType?, flags : Gio::DBusCallFlags, timeout_msec : Int32, cancellable : Gio::Cancellable?) : GLib::Variant
      # g_dbus_connection_call_sync: (Method | Throws)
      # @bus_name: (nullable)
      # @parameters: (nullable)
      # @reply_type: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      bus_name = if bus_name.nil?
                   Pointer(LibC::Char).null
                 else
                   bus_name.to_unsafe
                 end
      parameters = if parameters.nil?
                     Pointer(Void).null
                   else
                     parameters.to_unsafe
                   end
      reply_type = if reply_type.nil?
                     Pointer(Void).null
                   else
                     reply_type.to_unsafe
                   end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      parameters = GLib::Variant.new(parameters) unless parameters.is_a?(GLib::Variant)

      # C call
      _retval = LibGio.g_dbus_connection_call_sync(self, bus_name, object_path, interface_name, method_name, parameters, reply_type, flags, timeout_msec, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    def call_with_unix_fd_list(bus_name : ::String?, object_path : ::String, interface_name : ::String, method_name : ::String, parameters : _?, reply_type : GLib::VariantType?, flags : Gio::DBusCallFlags, timeout_msec : Int32, fd_list : Gio::UnixFDList?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_dbus_connection_call_with_unix_fd_list: (Method)
      # @bus_name: (nullable)
      # @parameters: (nullable)
      # @reply_type: (nullable)
      # @fd_list: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      bus_name = if bus_name.nil?
                   Pointer(LibC::Char).null
                 else
                   bus_name.to_unsafe
                 end
      parameters = if parameters.nil?
                     Pointer(Void).null
                   else
                     parameters.to_unsafe
                   end
      reply_type = if reply_type.nil?
                     Pointer(Void).null
                   else
                     reply_type.to_unsafe
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

      # C call
      LibGio.g_dbus_connection_call_with_unix_fd_list(self, bus_name, object_path, interface_name, method_name, parameters, reply_type, flags, timeout_msec, fd_list, cancellable, callback, user_data)

      # Return value handling
    end

    def call_with_unix_fd_list_finish(res : Gio::AsyncResult) : GLib::Variant
      # g_dbus_connection_call_with_unix_fd_list_finish: (Method | Throws)
      # @out_fd_list: (out) (transfer full) (optional)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      out_fd_list = Pointer(Pointer(Void)).null

      # C call
      _retval = LibGio.g_dbus_connection_call_with_unix_fd_list_finish(self, out_fd_list, res, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

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

      # Handle parameters
      out_fd_list = Pointer(Pointer(Void)).null
      bus_name = if bus_name.nil?
                   Pointer(LibC::Char).null
                 else
                   bus_name.to_unsafe
                 end
      parameters = if parameters.nil?
                     Pointer(Void).null
                   else
                     parameters.to_unsafe
                   end
      reply_type = if reply_type.nil?
                     Pointer(Void).null
                   else
                     reply_type.to_unsafe
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

      # C call
      _retval = LibGio.g_dbus_connection_call_with_unix_fd_list_sync(self, bus_name, object_path, interface_name, method_name, parameters, reply_type, flags, timeout_msec, fd_list, out_fd_list, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    def close(cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_dbus_connection_close: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
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

      # C call
      LibGio.g_dbus_connection_close(self, cancellable, callback, user_data)

      # Return value handling
    end

    def close_finish(res : Gio::AsyncResult) : Bool
      # g_dbus_connection_close_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_connection_close_finish(self, res, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def close_sync(cancellable : Gio::Cancellable?) : Bool
      # g_dbus_connection_close_sync: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_dbus_connection_close_sync(self, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def emit_signal(destination_bus_name : ::String?, object_path : ::String, interface_name : ::String, signal_name : ::String, parameters : _?) : Bool
      # g_dbus_connection_emit_signal: (Method | Throws)
      # @destination_bus_name: (nullable)
      # @parameters: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      destination_bus_name = if destination_bus_name.nil?
                               Pointer(LibC::Char).null
                             else
                               destination_bus_name.to_unsafe
                             end
      parameters = if parameters.nil?
                     Pointer(Void).null
                   else
                     parameters.to_unsafe
                   end
      parameters = GLib::Variant.new(parameters) unless parameters.is_a?(GLib::Variant)

      # C call
      _retval = LibGio.g_dbus_connection_emit_signal(self, destination_bus_name, object_path, interface_name, signal_name, parameters, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def export_action_group(object_path : ::String, action_group : Gio::ActionGroup) : UInt32
      # g_dbus_connection_export_action_group: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_connection_export_action_group(self, object_path, action_group, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def export_menu_model(object_path : ::String, menu : Gio::MenuModel) : UInt32
      # g_dbus_connection_export_menu_model: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_connection_export_menu_model(self, object_path, menu, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def flush(cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_dbus_connection_flush: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
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

      # C call
      LibGio.g_dbus_connection_flush(self, cancellable, callback, user_data)

      # Return value handling
    end

    def flush_finish(res : Gio::AsyncResult) : Bool
      # g_dbus_connection_flush_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_connection_flush_finish(self, res, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def flush_sync(cancellable : Gio::Cancellable?) : Bool
      # g_dbus_connection_flush_sync: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_dbus_connection_flush_sync(self, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def capabilities : Gio::DBusCapabilityFlags
      # g_dbus_connection_get_capabilities: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_connection_get_capabilities(self)

      # Return value handling
      Gio::DBusCapabilityFlags.from_value(_retval)
    end

    def exit_on_close : Bool
      # g_dbus_connection_get_exit_on_close: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_connection_get_exit_on_close(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def flags : Gio::DBusConnectionFlags
      # g_dbus_connection_get_flags: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_connection_get_flags(self)

      # Return value handling
      Gio::DBusConnectionFlags.from_value(_retval)
    end

    def guid : ::String
      # g_dbus_connection_get_guid: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_connection_get_guid(self)

      # Return value handling
      ::String.new(_retval)
    end

    def last_serial : UInt32
      # g_dbus_connection_get_last_serial: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_connection_get_last_serial(self)

      # Return value handling
      _retval
    end

    def peer_credentials : Gio::Credentials?
      # g_dbus_connection_get_peer_credentials: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_connection_get_peer_credentials(self)

      # Return value handling
      Gio::Credentials.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def stream : Gio::IOStream
      # g_dbus_connection_get_stream: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_connection_get_stream(self)

      # Return value handling
      Gio::IOStream.new(_retval, GICrystal::Transfer::None)
    end

    def unique_name : ::String?
      # g_dbus_connection_get_unique_name: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_connection_get_unique_name(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def is_closed : Bool
      # g_dbus_connection_is_closed: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_connection_is_closed(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def register_object(object_path : ::String, interface_info : Gio::DBusInterfaceInfo, method_call_closure : GObject::Closure?, get_property_closure : GObject::Closure?, set_property_closure : GObject::Closure?) : UInt32
      # g_dbus_connection_register_object_with_closures: (Method | Throws)
      # @method_call_closure: (nullable)
      # @get_property_closure: (nullable)
      # @set_property_closure: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      method_call_closure = if method_call_closure.nil?
                              Pointer(Void).null
                            else
                              method_call_closure.to_unsafe
                            end
      get_property_closure = if get_property_closure.nil?
                               Pointer(Void).null
                             else
                               get_property_closure.to_unsafe
                             end
      set_property_closure = if set_property_closure.nil?
                               Pointer(Void).null
                             else
                               set_property_closure.to_unsafe
                             end

      # C call
      _retval = LibGio.g_dbus_connection_register_object_with_closures(self, object_path, interface_info, method_call_closure, get_property_closure, set_property_closure, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def register_subtree(object_path : ::String, vtable : Gio::DBusSubtreeVTable, flags : Gio::DBusSubtreeFlags, user_data : Pointer(Void)?, user_data_free_func : Pointer(Void)) : UInt32
      # g_dbus_connection_register_subtree: (Method | Throws)
      # @user_data: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      _retval = LibGio.g_dbus_connection_register_subtree(self, object_path, vtable, flags, user_data, user_data_free_func, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def remove_filter(filter_id : UInt32) : Nil
      # g_dbus_connection_remove_filter: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_dbus_connection_remove_filter(self, filter_id)

      # Return value handling
    end

    def send_message(message : Gio::DBusMessage, flags : Gio::DBusSendMessageFlags) : Bool
      # g_dbus_connection_send_message: (Method | Throws)
      # @out_serial: (out) (transfer full) (optional)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      out_serial = Pointer(UInt32).null

      # C call
      _retval = LibGio.g_dbus_connection_send_message(self, message, flags, out_serial, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def send_message_with_reply(message : Gio::DBusMessage, flags : Gio::DBusSendMessageFlags, timeout_msec : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_dbus_connection_send_message_with_reply: (Method)
      # @out_serial: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      out_serial = Pointer(UInt32).null
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

      # C call
      LibGio.g_dbus_connection_send_message_with_reply(self, message, flags, timeout_msec, out_serial, cancellable, callback, user_data)

      # Return value handling
    end

    def send_message_with_reply_finish(res : Gio::AsyncResult) : Gio::DBusMessage
      # g_dbus_connection_send_message_with_reply_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_connection_send_message_with_reply_finish(self, res, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      Gio::DBusMessage.new(_retval, GICrystal::Transfer::Full)
    end

    def send_message_with_reply_sync(message : Gio::DBusMessage, flags : Gio::DBusSendMessageFlags, timeout_msec : Int32, cancellable : Gio::Cancellable?) : Gio::DBusMessage
      # g_dbus_connection_send_message_with_reply_sync: (Method | Throws)
      # @out_serial: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      out_serial = Pointer(UInt32).null
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_dbus_connection_send_message_with_reply_sync(self, message, flags, timeout_msec, out_serial, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      Gio::DBusMessage.new(_retval, GICrystal::Transfer::Full)
    end

    def exit_on_close=(exit_on_close : Bool) : Nil
      # g_dbus_connection_set_exit_on_close: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_dbus_connection_set_exit_on_close(self, exit_on_close)

      # Return value handling
    end

    def signal_subscribe(sender : ::String?, interface_name : ::String?, member : ::String?, object_path : ::String?, arg0 : ::String?, flags : Gio::DBusSignalFlags, callback : Pointer(Void), user_data : Pointer(Void)?, user_data_free_func : Pointer(Void)?) : UInt32
      # g_dbus_connection_signal_subscribe: (Method)
      # @sender: (nullable)
      # @interface_name: (nullable)
      # @member: (nullable)
      # @object_path: (nullable)
      # @arg0: (nullable)
      # @user_data: (nullable)
      # @user_data_free_func: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      sender = if sender.nil?
                 Pointer(LibC::Char).null
               else
                 sender.to_unsafe
               end
      interface_name = if interface_name.nil?
                         Pointer(LibC::Char).null
                       else
                         interface_name.to_unsafe
                       end
      member = if member.nil?
                 Pointer(LibC::Char).null
               else
                 member.to_unsafe
               end
      object_path = if object_path.nil?
                      Pointer(LibC::Char).null
                    else
                      object_path.to_unsafe
                    end
      arg0 = if arg0.nil?
               Pointer(LibC::Char).null
             else
               arg0.to_unsafe
             end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      user_data_free_func = if user_data_free_func.nil?
                              LibGLib::DestroyNotify.null
                            else
                              user_data_free_func.to_unsafe
                            end

      # C call
      _retval = LibGio.g_dbus_connection_signal_subscribe(self, sender, interface_name, member, object_path, arg0, flags, callback, user_data, user_data_free_func)

      # Return value handling
      _retval
    end

    def signal_unsubscribe(subscription_id : UInt32) : Nil
      # g_dbus_connection_signal_unsubscribe: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_dbus_connection_signal_unsubscribe(self, subscription_id)

      # Return value handling
    end

    def start_message_processing : Nil
      # g_dbus_connection_start_message_processing: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_dbus_connection_start_message_processing(self)

      # Return value handling
    end

    def unexport_action_group(export_id : UInt32) : Nil
      # g_dbus_connection_unexport_action_group: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_dbus_connection_unexport_action_group(self, export_id)

      # Return value handling
    end

    def unexport_menu_model(export_id : UInt32) : Nil
      # g_dbus_connection_unexport_menu_model: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_dbus_connection_unexport_menu_model(self, export_id)

      # Return value handling
    end

    def unregister_object(registration_id : UInt32) : Bool
      # g_dbus_connection_unregister_object: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_connection_unregister_object(self, registration_id)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def unregister_subtree(registration_id : UInt32) : Bool
      # g_dbus_connection_unregister_subtree: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_connection_unregister_subtree(self, registration_id)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

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

      def connect(block : Proc(Bool, GLib::Error?, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = GICrystal.to_bool(lib_arg0)
          arg1 = (lib_arg1.null? ? nil : GLib::Error.new(lib_arg1, GICrystal::Transfer::None))
          ::Box(Proc(Bool, GLib::Error?, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Bool, GLib::Error?, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = GICrystal.to_bool(lib_arg0)
          arg1 = (lib_arg1.null? ? nil : GLib::Error.new(lib_arg1, GICrystal::Transfer::None))
          ::Box(Proc(Bool, GLib::Error?, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::DBusConnection, Bool, GLib::Error?, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusConnection.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GICrystal.to_bool(lib_arg0)
          arg1 = (lib_arg1.null? ? nil : GLib::Error.new(lib_arg1, GICrystal::Transfer::None))
          ::Box(Proc(Gio::DBusConnection, Bool, GLib::Error?, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusConnection, Bool, GLib::Error?, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusConnection.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GICrystal.to_bool(lib_arg0)
          arg1 = (lib_arg1.null? ? nil : GLib::Error.new(lib_arg1, GICrystal::Transfer::None))
          ::Box(Proc(Gio::DBusConnection, Bool, GLib::Error?, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(remote_peer_vanished : Bool, error : GLib::Error?) : Nil
        LibGObject.g_signal_emit_by_name(@source, "closed", remote_peer_vanished, error)
      end
    end

    def closed_signal
      ClosedSignal.new(self)
    end
  end
end
