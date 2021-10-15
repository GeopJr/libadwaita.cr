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
  class FileIOStream < IOStream
    include Seekable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, closed : Bool? = nil, input_stream : Gio::InputStream? = nil, output_stream : Gio::OutputStream? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if closed
        (_names.to_unsafe + _n).value = "closed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, closed)
        _n += 1
      end
      if input_stream
        (_names.to_unsafe + _n).value = "input-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_stream)
        _n += 1
      end
      if output_stream
        (_names.to_unsafe + _n).value = "output-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, output_stream)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(FileIOStream.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_io_stream_get_type
    end

    def etag : ::String?
      # g_file_io_stream_get_etag: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_file_io_stream_get_etag(self)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def query_info(attributes : ::String, cancellable : Gio::Cancellable?) : Gio::FileInfo
      # g_file_io_stream_query_info: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_io_stream_query_info(self, attributes, cancellable)
      Gio::FileInfo.new(_retval, GICrystal::Transfer::Full)
    end

    def query_info_async(attributes : ::String, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_io_stream_query_info_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_file_io_stream_query_info_async(self, attributes, io_priority, cancellable, callback, user_data)
    end

    def query_info_finish(result : Gio::AsyncResult) : Gio::FileInfo
      # g_file_io_stream_query_info_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_file_io_stream_query_info_finish(self, result)
      Gio::FileInfo.new(_retval, GICrystal::Transfer::Full)
    end
  end
end
