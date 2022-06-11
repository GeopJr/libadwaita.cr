require "../g_object-2.0/object"

module Gio
  # Instances of the #GDBusMethodInvocation class are used when
  # handling D-Bus method calls. It provides a way to asynchronously
  # return results and errors.
  #
  # The normal way to obtain a #GDBusMethodInvocation object is to receive
  # it as an argument to the handle_method_call() function in a
  # #GDBusInterfaceVTable that was passed to g_dbus_connection_register_object().
  @[GObject::GeneratedWrapper]
  class DBusMethodInvocation < GObject::Object
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(DBusMethodInvocation, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `DBusMethodInvocation`.
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
      LibGio.g_dbus_method_invocation_get_type
    end

    # Gets the #GDBusConnection the method was invoked on.
    def connection : Gio::DBusConnection
      # g_dbus_method_invocation_get_connection: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_method_invocation_get_connection(@pointer)

      # Return value handling

      Gio::DBusConnection.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the name of the D-Bus interface the method was invoked on.
    #
    # If this method call is a property Get, Set or GetAll call that has
    # been redirected to the method call handler then
    # "org.freedesktop.DBus.Properties" will be returned.  See
    # #GDBusInterfaceVTable for more information.
    def interface_name : ::String
      # g_dbus_method_invocation_get_interface_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_method_invocation_get_interface_name(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the #GDBusMessage for the method invocation. This is useful if
    # you need to use low-level protocol features, such as UNIX file
    # descriptor passing, that cannot be properly expressed in the
    # #GVariant API.
    #
    # See this [server][gdbus-server] and [client][gdbus-unix-fd-client]
    # for an example of how to use this low-level API to send and receive
    # UNIX file descriptors.
    def message : Gio::DBusMessage
      # g_dbus_method_invocation_get_message: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_method_invocation_get_message(@pointer)

      # Return value handling

      Gio::DBusMessage.new(_retval, GICrystal::Transfer::None)
    end

    # Gets information about the method call, if any.
    #
    # If this method invocation is a property Get, Set or GetAll call that
    # has been redirected to the method call handler then %NULL will be
    # returned.  See g_dbus_method_invocation_get_property_info() and
    # #GDBusInterfaceVTable for more information.
    def method_info : Gio::DBusMethodInfo?
      # g_dbus_method_invocation_get_method_info: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_method_invocation_get_method_info(@pointer)

      # Return value handling

      Gio::DBusMethodInfo.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the name of the method that was invoked.
    def method_name : ::String
      # g_dbus_method_invocation_get_method_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_method_invocation_get_method_name(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the object path the method was invoked on.
    def object_path : ::String
      # g_dbus_method_invocation_get_object_path: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_method_invocation_get_object_path(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the parameters of the method invocation. If there are no input
    # parameters then this will return a GVariant with 0 children rather than NULL.
    def parameters : GLib::Variant
      # g_dbus_method_invocation_get_parameters: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_method_invocation_get_parameters(@pointer)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::None)
    end

    # Gets information about the property that this method call is for, if
    # any.
    #
    # This will only be set in the case of an invocation in response to a
    # property Get or Set call that has been directed to the method call
    # handler for an object on account of its property_get() or
    # property_set() vtable pointers being unset.
    #
    # See #GDBusInterfaceVTable for more information.
    #
    # If the call was GetAll, %NULL will be returned.
    def property_info : Gio::DBusPropertyInfo?
      # g_dbus_method_invocation_get_property_info: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_method_invocation_get_property_info(@pointer)

      # Return value handling

      Gio::DBusPropertyInfo.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the bus name that invoked the method.
    def sender : ::String
      # g_dbus_method_invocation_get_sender: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_method_invocation_get_sender(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Finishes handling a D-Bus method call by returning an error.
    #
    # This method will take ownership of @invocation. See
    # #GDBusInterfaceVTable for more information about the ownership of
    # @invocation.
    def return_dbus_error(error_name : ::String, error_message : ::String) : Nil
      # g_dbus_method_invocation_return_dbus_error: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_method_invocation_return_dbus_error(@pointer, error_name, error_message)

      # Return value handling
    end

    # Like g_dbus_method_invocation_return_error() but without printf()-style formatting.
    #
    # This method will take ownership of @invocation. See
    # #GDBusInterfaceVTable for more information about the ownership of
    # @invocation.
    def return_error_literal(domain : UInt32, code : Int32, message : ::String) : Nil
      # g_dbus_method_invocation_return_error_literal: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_method_invocation_return_error_literal(@pointer, domain, code, message)

      # Return value handling
    end

    # Like g_dbus_method_invocation_return_error() but takes a #GError
    # instead of the error domain, error code and message.
    #
    # This method will take ownership of @invocation. See
    # #GDBusInterfaceVTable for more information about the ownership of
    # @invocation.
    def return_gerror(error : GLib::Error) : Nil
      # g_dbus_method_invocation_return_gerror: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_method_invocation_return_gerror(@pointer, error)

      # Return value handling
    end

    # Finishes handling a D-Bus method call by returning @parameters.
    # If the @parameters GVariant is floating, it is consumed.
    #
    # It is an error if @parameters is not of the right format: it must be a tuple
    # containing the out-parameters of the D-Bus method. Even if the method has a
    # single out-parameter, it must be contained in a tuple. If the method has no
    # out-parameters, @parameters may be %NULL or an empty tuple.
    #
    # |[<!-- language="C" -->
    # GDBusMethodInvocation *invocation = some_invocation;
    # g_autofree gchar *result_string = NULL;
    # g_autoptr (GError) error = NULL;
    #
    # result_string = calculate_result (&error);
    #
    # if (error != NULL)
    #   g_dbus_method_invocation_return_gerror (invocation, error);
    # else
    #   g_dbus_method_invocation_return_value (invocation,
    #                                          g_variant_new ("(s)", result_string));
    #
    # // Do not free @invocation here; returning a value does that
    # ]|
    #
    # This method will take ownership of @invocation. See
    # #GDBusInterfaceVTable for more information about the ownership of
    # @invocation.
    #
    # Since 2.48, if the method call requested for a reply not to be sent
    # then this call will sink @parameters and free @invocation, but
    # otherwise do nothing (as per the recommendations of the D-Bus
    # specification).
    def return_value(parameters : _?) : Nil
      # g_dbus_method_invocation_return_value: (Method)
      # @parameters: (nullable)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      parameters = if parameters.nil?
                     Pointer(Void).null
                   elsif !parameters.is_a?(GLib::Variant)
                     GLib::Variant.new(parameters).to_unsafe
                   else
                     parameters.to_unsafe
                   end

      # C call
      LibGio.g_dbus_method_invocation_return_value(@pointer, parameters)

      # Return value handling
    end

    # Like g_dbus_method_invocation_return_value() but also takes a #GUnixFDList.
    #
    # This method is only available on UNIX.
    #
    # This method will take ownership of @invocation. See
    # #GDBusInterfaceVTable for more information about the ownership of
    # @invocation.
    def return_value_with_unix_fd_list(parameters : _?, fd_list : Gio::UnixFDList?) : Nil
      # g_dbus_method_invocation_return_value_with_unix_fd_list: (Method)
      # @parameters: (nullable)
      # @fd_list: (nullable)
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

      # C call
      LibGio.g_dbus_method_invocation_return_value_with_unix_fd_list(@pointer, parameters, fd_list)

      # Return value handling
    end
  end
end
