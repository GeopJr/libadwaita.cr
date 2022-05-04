require "../g_object-2.0/object"
require "../gio-2.0/async_result"

module Gdk
  # A `GdkContentSerializer` is used to serialize content for
  # inter-application data transfers.
  #
  # The `GdkContentSerializer` transforms an object that is identified
  # by a GType into a serialized form (i.e. a byte stream) that is
  # identified by a mime type.
  #
  # GTK provides serializers and deserializers for common data types
  # such as text, colors, images or file lists. To register your own
  # serialization functions, use `Gdk#content_register_serializer`.
  #
  # Also see `Gdk#ContentDeserializer`.
  @[GObject::GeneratedWrapper]
  class ContentSerializer < GObject::Object
    include Gio::AsyncResult

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::ContentSerializer), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_content_serializer_get_type
    end

    # Gets the cancellable for the current operation.
    #
    # This is the `GCancellable` that was passed to `#content_serialize_async`.
    def cancellable : Gio::Cancellable?
      # gdk_content_serializer_get_cancellable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_serializer_get_cancellable(self)

      # Return value handling

      Gio::Cancellable.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the `GType` to of the object to serialize.
    def gtype : UInt64
      # gdk_content_serializer_get_gtype: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_serializer_get_gtype(self)

      # Return value handling

      _retval
    end

    # Gets the mime type to serialize to.
    def mime_type : ::String
      # gdk_content_serializer_get_mime_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_serializer_get_mime_type(self)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the output stream for the current operation.
    #
    # This is the stream that was passed to `#content_serialize_async`.
    def output_stream : Gio::OutputStream
      # gdk_content_serializer_get_output_stream: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_serializer_get_output_stream(self)

      # Return value handling

      Gio::OutputStream.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the I/O priority for the current operation.
    #
    # This is the priority that was passed to `#content_serialize_async`.
    def priority : Int32
      # gdk_content_serializer_get_priority: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_serializer_get_priority(self)

      # Return value handling

      _retval
    end

    # Gets the data that was associated with the current operation.
    #
    # See `Gdk::ContentSerializer#task_data=`.
    def task_data : Pointer(Void)?
      # gdk_content_serializer_get_task_data: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_serializer_get_task_data(self)

      # Return value handling

      _retval unless _retval.null?
    end

    # Gets the user data that was passed when the serializer was registered.
    def user_data : Pointer(Void)?
      # gdk_content_serializer_get_user_data: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_serializer_get_user_data(self)

      # Return value handling

      _retval unless _retval.null?
    end

    # Gets the `GValue` to read the object to serialize from.
    def value : GObject::Value
      # gdk_content_serializer_get_value: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_content_serializer_get_value(self)

      # Return value handling

      GObject::Value.new(_retval, GICrystal::Transfer::None)
    end

    # Indicate that the serialization has ended with an error.
    #
    # This function consumes @error.
    def return_error(error : GLib::Error) : Nil
      # gdk_content_serializer_return_error: (Method)
      # @error: (transfer full)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_content_serializer_return_error(self, error)

      # Return value handling
    end

    # Indicate that the serialization has been successfully completed.
    def return_success : Nil
      # gdk_content_serializer_return_success: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_content_serializer_return_success(self)

      # Return value handling
    end

    # Associate data with the current serialization operation.
    def set_task_data(data : Pointer(Void)?, notify : GLib::DestroyNotify) : Nil
      # gdk_content_serializer_set_task_data: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      LibGdk.gdk_content_serializer_set_task_data(self, data, notify)

      # Return value handling
    end
  end
end
