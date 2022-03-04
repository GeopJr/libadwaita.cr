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
  # deserialization functions, use [func@content_register_deserializer].
  #
  # Also see [class@Gdk.ContentSerializer].
  class ContentDeserializer < GObject::Object
    include Gio::AsyncResult

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_content_deserializer_get_type
    end

    def cancellable : Gio::Cancellable
      # gdk_content_deserializer_get_cancellable: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_content_deserializer_get_cancellable(self)

      # Return value handling
      Gio::Cancellable.new(_retval, GICrystal::Transfer::None)
    end

    def gtype : UInt64
      # gdk_content_deserializer_get_gtype: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_content_deserializer_get_gtype(self)

      # Return value handling
      _retval
    end

    def input_stream : Gio::InputStream
      # gdk_content_deserializer_get_input_stream: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_content_deserializer_get_input_stream(self)

      # Return value handling
      Gio::InputStream.new(_retval, GICrystal::Transfer::None)
    end

    def mime_type : ::String
      # gdk_content_deserializer_get_mime_type: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_content_deserializer_get_mime_type(self)

      # Return value handling
      ::String.new(_retval)
    end

    def priority : Int32
      # gdk_content_deserializer_get_priority: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_content_deserializer_get_priority(self)

      # Return value handling
      _retval
    end

    def task_data : Pointer(Void)?
      # gdk_content_deserializer_get_task_data: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_content_deserializer_get_task_data(self)

      # Return value handling
      _retval unless _retval.null?
    end

    def user_data : Pointer(Void)?
      # gdk_content_deserializer_get_user_data: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_content_deserializer_get_user_data(self)

      # Return value handling
      _retval unless _retval.null?
    end

    def value : GObject::Value
      # gdk_content_deserializer_get_value: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_content_deserializer_get_value(self)

      # Return value handling
      GObject::Value.new(_retval, GICrystal::Transfer::None)
    end

    def return_error(error : GLib::Error) : Nil
      # gdk_content_deserializer_return_error: (Method)
      # @error: (transfer full)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_content_deserializer_return_error(self, error)

      # Return value handling
    end

    def return_success : Nil
      # gdk_content_deserializer_return_success: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_content_deserializer_return_success(self)

      # Return value handling
    end

    def set_task_data(data : Pointer(Void)?, notify : Pointer(Void)) : Nil
      # gdk_content_deserializer_set_task_data: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
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
