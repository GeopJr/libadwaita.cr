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

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(ContentDeserializer, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ContentDeserializer`.
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
      LibGdk.gdk_content_deserializer_get_type
    end

    # Gets the cancellable for the current operation.
    #
    # This is the `GCancellable` that was passed to `Gdk#content_deserialize_async`.
    def cancellable : Gio::Cancellable?
      # gdk_content_deserializer_get_cancellable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_deserializer_get_cancellable(@pointer)

      # Return value handling

      Gio::Cancellable.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the `GType` to create an instance of.
    def gtype : UInt64
      # gdk_content_deserializer_get_gtype: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_deserializer_get_gtype(@pointer)

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
      _retval = LibGdk.gdk_content_deserializer_get_input_stream(@pointer)

      # Return value handling

      Gio::InputStream.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the mime type to deserialize from.
    def mime_type : ::String
      # gdk_content_deserializer_get_mime_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_deserializer_get_mime_type(@pointer)

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
      _retval = LibGdk.gdk_content_deserializer_get_priority(@pointer)

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
      _retval = LibGdk.gdk_content_deserializer_get_task_data(@pointer)

      # Return value handling

      _retval unless _retval.null?
    end

    # Gets the user data that was passed when the deserializer was registered.
    def user_data : Pointer(Void)?
      # gdk_content_deserializer_get_user_data: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_deserializer_get_user_data(@pointer)

      # Return value handling

      _retval unless _retval.null?
    end

    # Gets the `GValue` to store the deserialized object in.
    def value : GObject::Value
      # gdk_content_deserializer_get_value: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_deserializer_get_value(@pointer)

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
      LibGdk.gdk_content_deserializer_return_error(@pointer, error)

      # Return value handling
    end

    # Indicate that the deserialization has been successfully completed.
    def return_success : Nil
      # gdk_content_deserializer_return_success: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_content_deserializer_return_success(@pointer)

      # Return value handling
    end

    # Associate data with the current deserialization operation.
    def set_task_data(data : Pointer(Void)?, notify : GLib::DestroyNotify) : Nil
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
      LibGdk.gdk_content_deserializer_set_task_data(@pointer, data, notify)

      # Return value handling
    end
  end
end
