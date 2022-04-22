require "../g_object-2.0/object"
require "../gio-2.0/async_result"

module Gdk
  # A `GdkContentDeserializer` is used to deserialize content received via
  # inter-application data transfers.
  #
  # The `GdkContentDeserializer` transforms serialized content that is
  # identified by a mime type into an object identified by a GType.
  #
  # GTK provides serializers and deserializers for common data types
  # such as text, colors, images or file lists. To register your own
  # deserialization functions, use `#content_register_deserializer`.
  #
  # Also see `Gdk#ContentSerializer`.
  @[GObject::GeneratedWrapper]
  class ContentDeserializer < GObject::Object
    include Gio::AsyncResult

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::ContentDeserializer), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_content_deserializer_get_type
    end

    # Gets the cancellable for the current operation.
    #
    # This is the `GCancellable` that was passed to `Gdk#content_deserialize_async`.
    def cancellable : Gio::Cancellable?
      # gdk_content_deserializer_get_cancellable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_deserializer_get_cancellable(self)

      # Return value handling

      Gio::Cancellable.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the `GType` to create an instance of.
    def gtype : UInt64
      # gdk_content_deserializer_get_gtype: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_deserializer_get_gtype(self)

      # Return value handling

      _retval
    end

    # Gets the input stream for the current operation.
    #
    # This is the stream that was passed to `Gdk#content_deserialize_async`.
    def input_stream : Gio::InputStream
      # gdk_content_deserializer_get_input_stream: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_deserializer_get_input_stream(self)

      # Return value handling

      Gio::InputStream.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the mime type to deserialize from.
    def mime_type : ::String
      # gdk_content_deserializer_get_mime_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_deserializer_get_mime_type(self)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the I/O priority for the current operation.
    #
    # This is the priority that was passed to `Gdk#content_deserialize_async`.
    def priority : Int32
      # gdk_content_deserializer_get_priority: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_deserializer_get_priority(self)

      # Return value handling

      _retval
    end

    # Gets the data that was associated with the current operation.
    #
    # See `Gdk::ContentDeserializer#task_data=`.
    def task_data : Pointer(Void)?
      # gdk_content_deserializer_get_task_data: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_deserializer_get_task_data(self)

      # Return value handling

      _retval unless _retval.null?
    end

    # Gets the user data that was passed when the deserializer was registered.
    def user_data : Pointer(Void)?
      # gdk_content_deserializer_get_user_data: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_deserializer_get_user_data(self)

      # Return value handling

      _retval unless _retval.null?
    end

    # Gets the `GValue` to store the deserialized object in.
    def value : GObject::Value
      # gdk_content_deserializer_get_value: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_deserializer_get_value(self)

      # Return value handling

      GObject::Value.new(_retval, GICrystal::Transfer::None)
    end

    # Indicate that the deserialization has ended with an error.
    #
    # This function consumes @error.
    def return_error(error : GLib::Error) : Nil
      # gdk_content_deserializer_return_error: (Method)
      # @error: (transfer full)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_content_deserializer_return_error(self, error)

      # Return value handling
    end

    # Indicate that the deserialization has been successfully completed.
    def return_success : Nil
      # gdk_content_deserializer_return_success: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_content_deserializer_return_success(self)

      # Return value handling
    end

    # Associate data with the current deserialization operation.
    def set_task_data(data : Pointer(Void)?, notify : Pointer(Void)) : Nil
      # gdk_content_deserializer_set_task_data: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      LibGdk.gdk_content_deserializer_set_task_data(self, data, notify)

      # Return value handling
    end
  end
end
