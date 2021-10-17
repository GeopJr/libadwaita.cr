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

      _retval = LibGdk.gdk_content_deserializer_get_cancellable(self)
      Gio::Cancellable.new(_retval, GICrystal::Transfer::None)
    end

    def gtype : UInt64
      # gdk_content_deserializer_get_gtype: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_content_deserializer_get_gtype(self)
      _retval
    end

    def input_stream : Gio::InputStream
      # gdk_content_deserializer_get_input_stream: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_content_deserializer_get_input_stream(self)
      Gio::InputStream.new(_retval, GICrystal::Transfer::None)
    end

    def mime_type : ::String
      # gdk_content_deserializer_get_mime_type: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_content_deserializer_get_mime_type(self)
      ::String.new(_retval)
    end

    def priority : Int32
      # gdk_content_deserializer_get_priority: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_content_deserializer_get_priority(self)
      _retval
    end

    def task_data : Pointer(Nil)?
      # gdk_content_deserializer_get_task_data: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_content_deserializer_get_task_data(self)
      Pointer(Void) unless _retval.null?
    end

    def user_data : Pointer(Nil)?
      # gdk_content_deserializer_get_user_data: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_content_deserializer_get_user_data(self)
      Pointer(Void) unless _retval.null?
    end

    def value : GObject::Value
      # gdk_content_deserializer_get_value: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_content_deserializer_get_value(self)
      GObject::Value.new(_retval, GICrystal::Transfer::None)
    end

    def return_error(error : GLib::Error) : Nil
      # gdk_content_deserializer_return_error: (Method)
      # @error: (transfer full)
      # Returns: (transfer none)

      LibGdk.gdk_content_deserializer_return_error(self, error)
    end

    def return_success : Nil
      # gdk_content_deserializer_return_success: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_content_deserializer_return_success(self)
    end

    def set_task_data(data : Pointer(Nil)?, notify : Pointer(Void)) : Nil
      # gdk_content_deserializer_set_task_data: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      LibGdk.gdk_content_deserializer_set_task_data(self, data, notify)
    end
  end
end