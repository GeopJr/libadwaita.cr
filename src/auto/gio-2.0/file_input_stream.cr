require "./input_stream"
require "./seekable"

module Gio
  # GFileInputStream provides input streams that take their
  # content from a file.
  #
  # GFileInputStream implements #GSeekable, which allows the input
  # stream to jump to arbitrary positions in the file, provided the
  # filesystem of the file allows it. To find the position of a file
  # input stream, use g_seekable_tell(). To find out if a file input
  # stream supports seeking, use g_seekable_can_seek().
  # To position a file input stream, use g_seekable_seek().
  @[GObject::GeneratedWrapper]
  class FileInputStream < InputStream
    include Seekable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::FileInputStreamClass), class_init,
        sizeof(LibGio::FileInputStream), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_input_stream_get_type
    end

    # Queries a file input stream the given @attributes. This function blocks
    # while querying the stream. For the asynchronous (non-blocking) version
    # of this function, see g_file_input_stream_query_info_async(). While the
    # stream is blocked, the stream will set the pending flag internally, and
    # any other operations on the stream will fail with %G_IO_ERROR_PENDING.
    def query_info(attributes : ::String, cancellable : Gio::Cancellable?) : Gio::FileInfo
      # g_file_input_stream_query_info: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_file_input_stream_query_info(self, attributes, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::FileInfo.new(_retval, GICrystal::Transfer::Full)
    end

    # Queries the stream information asynchronously.
    # When the operation is finished @callback will be called.
    # You can then call g_file_input_stream_query_info_finish()
    # to get the result of the operation.
    #
    # For the synchronous version of this function,
    # see g_file_input_stream_query_info().
    #
    # If @cancellable is not %NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be set
    def query_info_async(attributes : ::String, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_file_input_stream_query_info_async: (Method)
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
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_file_input_stream_query_info_async(self, attributes, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an asynchronous info query operation.
    def query_info_finish(result : Gio::AsyncResult) : Gio::FileInfo
      # g_file_input_stream_query_info_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_file_input_stream_query_info_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::FileInfo.new(_retval, GICrystal::Transfer::Full)
    end
  end
end
