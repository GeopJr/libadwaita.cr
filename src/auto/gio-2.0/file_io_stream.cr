require "./io_stream"
require "./seekable"

module Gio
  # GFileIOStream provides io streams that both read and write to the same
  # file handle.
  #
  # GFileIOStream implements #GSeekable, which allows the io
  # stream to jump to arbitrary positions in the file and to truncate
  # the file, provided the filesystem of the file supports these
  # operations.
  #
  # To find the position of a file io stream, use
  # g_seekable_tell().
  #
  # To find out if a file io stream supports seeking, use g_seekable_can_seek().
  # To position a file io stream, use g_seekable_seek().
  # To find out if a file io stream supports truncating, use
  # g_seekable_can_truncate(). To truncate a file io
  # stream, use g_seekable_truncate().
  #
  # The default implementation of all the #GFileIOStream operations
  # and the implementation of #GSeekable just call into the same operations
  # on the output stream.
  @[GObject::GeneratedWrapper]
  class FileIOStream < IOStream
    include Seekable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::FileIOStreamClass), class_init,
        sizeof(LibGio::FileIOStream), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, closed : Bool? = nil, input_stream : Gio::InputStream? = nil, output_stream : Gio::OutputStream? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !closed.nil?
        (_names.to_unsafe + _n).value = "closed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, closed)
        _n += 1
      end
      if !input_stream.nil?
        (_names.to_unsafe + _n).value = "input-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_stream)
        _n += 1
      end
      if !output_stream.nil?
        (_names.to_unsafe + _n).value = "output-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, output_stream)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(FileIOStream.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_io_stream_get_type
    end

    # Gets the entity tag for the file when it has been written.
    # This must be called after the stream has been written
    # and closed, as the etag can change while writing.
    def etag : ::String?
      # g_file_io_stream_get_etag: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_file_io_stream_get_etag(self)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    # Queries a file io stream for the given @attributes.
    # This function blocks while querying the stream. For the asynchronous
    # version of this function, see g_file_io_stream_query_info_async().
    # While the stream is blocked, the stream will set the pending flag
    # internally, and any other operations on the stream will fail with
    # %G_IO_ERROR_PENDING.
    #
    # Can fail if the stream was already closed (with @error being set to
    # %G_IO_ERROR_CLOSED), the stream has pending operations (with @error being
    # set to %G_IO_ERROR_PENDING), or if querying info is not supported for
    # the stream's interface (with @error being set to %G_IO_ERROR_NOT_SUPPORTED). I
    # all cases of failure, %NULL will be returned.
    #
    # If @cancellable is not %NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be set, and %NULL will
    # be returned.
    def query_info(attributes : ::String, cancellable : Gio::Cancellable?) : Gio::FileInfo
      # g_file_io_stream_query_info: (Method | Throws)
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
      _retval = LibGio.g_file_io_stream_query_info(self, attributes, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::FileInfo.new(_retval, GICrystal::Transfer::Full)
    end

    # Asynchronously queries the @stream for a #GFileInfo. When completed,
    # @callback will be called with a #GAsyncResult which can be used to
    # finish the operation with g_file_io_stream_query_info_finish().
    #
    # For the synchronous version of this function, see
    # g_file_io_stream_query_info().
    def query_info_async(attributes : ::String, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_file_io_stream_query_info_async: (Method)
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
      LibGio.g_file_io_stream_query_info_async(self, attributes, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finalizes the asynchronous query started
    # by g_file_io_stream_query_info_async().
    def query_info_finish(result : Gio::AsyncResult) : Gio::FileInfo
      # g_file_io_stream_query_info_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_file_io_stream_query_info_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::FileInfo.new(_retval, GICrystal::Transfer::Full)
    end
  end
end
