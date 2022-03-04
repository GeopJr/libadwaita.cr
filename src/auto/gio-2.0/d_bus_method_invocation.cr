require "../g_object-2.0/object"

module Gio
  # Instances of the #GDBusMethodInvocation class are used when
  # handling D-Bus method calls. It provides a way to asynchronously
  # return results and errors.
  #
  # The normal way to obtain a #GDBusMethodInvocation object is to receive
  # it as an argument to the handle_method_call() function in a
  # #GDBusInterfaceVTable that was passed to g_dbus_connection_register_object().
  class DBusMethodInvocation < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_method_invocation_get_type
    end

    def connection : Gio::DBusConnection
      # g_dbus_method_invocation_get_connection: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_method_invocation_get_connection(self)

      # Return value handling
      Gio::DBusConnection.new(_retval, GICrystal::Transfer::None)
    end

    def interface_name : ::String
      # g_dbus_method_invocation_get_interface_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_method_invocation_get_interface_name(self)

      # Return value handling
      ::String.new(_retval)
    end

    def message : Gio::DBusMessage
      # g_dbus_method_invocation_get_message: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_method_invocation_get_message(self)

      # Return value handling
      Gio::DBusMessage.new(_retval, GICrystal::Transfer::None)
    end

    def method_info : Gio::DBusMethodInfo?
      # g_dbus_method_invocation_get_method_info: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_method_invocation_get_method_info(self)

      # Return value handling
      Gio::DBusMethodInfo.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def method_name : ::String
      # g_dbus_method_invocation_get_method_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_method_invocation_get_method_name(self)

      # Return value handling
      ::String.new(_retval)
    end

    def object_path : ::String
      # g_dbus_method_invocation_get_object_path: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_method_invocation_get_object_path(self)

      # Return value handling
      ::String.new(_retval)
    end

    def parameters : GLib::Variant
      # g_dbus_method_invocation_get_parameters: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_method_invocation_get_parameters(self)

      # Return value handling
      GLib::Variant.new(_retval, GICrystal::Transfer::None)
    end

    def property_info : Gio::DBusPropertyInfo?
      # g_dbus_method_invocation_get_property_info: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_method_invocation_get_property_info(self)

      # Return value handling
      Gio::DBusPropertyInfo.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def sender : ::String
      # g_dbus_method_invocation_get_sender: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_method_invocation_get_sender(self)

      # Return value handling
      ::String.new(_retval)
    end

    def return_dbus_error(error_name : ::String, error_message : ::String) : Nil
      # g_dbus_method_invocation_return_dbus_error: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_dbus_method_invocation_return_dbus_error(self, error_name, error_message)

      # Return value handling
    end

    def return_error_literal(domain : UInt32, code : Int32, message : ::String) : Nil
      # g_dbus_method_invocation_return_error_literal: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_dbus_method_invocation_return_error_literal(self, domain, code, message)

      # Return value handling
    end

    def return_gerror(error : GLib::Error) : Nil
      # g_dbus_method_invocation_return_gerror: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_dbus_method_invocation_return_gerror(self, error)

      # Return value handling
    end

    def return_value(parameters : _?) : Nil
      # g_dbus_method_invocation_return_value: (Method)
      # @parameters: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      parameters = if parameters.nil?
                     Pointer(Void).null
                   else
                     parameters.to_unsafe
                   end
      parameters = GLib::Variant.new(parameters) unless parameters.is_a?(GLib::Variant)

      # C call
      LibGio.g_dbus_method_invocation_return_value(self, parameters)

      # Return value handling
    end

    def return_value_with_unix_fd_list(parameters : _?, fd_list : Gio::UnixFDList?) : Nil
      # g_dbus_method_invocation_return_value_with_unix_fd_list: (Method)
      # @parameters: (nullable)
      # @fd_list: (nullable)
      # Returns: (transfer none)

      # Handle parameters
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
      parameters = GLib::Variant.new(parameters) unless parameters.is_a?(GLib::Variant)

      # C call
      LibGio.g_dbus_method_invocation_return_value_with_unix_fd_list(self, parameters, fd_list)

      # Return value handling
    end
  end
end
