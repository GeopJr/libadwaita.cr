require "./output_stream"
require "./seekable"

module Gio
  # GFileOutputStream provides output streams that write their
  # content to a file.
  #
  # GFileOutputStream implements #GSeekable, which allows the output
  # stream to jump to arbitrary positions in the file and to truncate
  # the file, provided the filesystem of the file supports these
  # operations.
  #
  # To find the position of a file output stream, use g_seekable_tell().
  # To find out if a file output stream supports seeking, use
  # g_seekable_can_seek().To position a file output stream, use
  # g_seekable_seek(). To find out if a file output stream supports
  # truncating, use g_seekable_can_truncate(). To truncate a file output
  # stream, use g_seekable_truncate().
  class FileOutputStream < OutputStream
    include Seekable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_output_stream_get_type
    end

    def etag : ::String?
      # g_file_output_stream_get_etag: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_output_stream_get_etag(self)

      # Return value handling
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def query_info(attributes : ::String, cancellable : Gio::Cancellable?) : Gio::FileInfo
      # g_file_output_stream_query_info: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_file_output_stream_query_info(self, attributes, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      Gio::FileInfo.new(_retval, GICrystal::Transfer::Full)
    end

    def query_info_async(attributes : ::String, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_file_output_stream_query_info_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
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

      # C call
      LibGio.g_file_output_stream_query_info_async(self, attributes, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    def query_info_finish(result : Gio::AsyncResult) : Gio::FileInfo
      # g_file_output_stream_query_info_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_file_output_stream_query_info_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      Gio::FileInfo.new(_retval, GICrystal::Transfer::Full)
    end
  end
end
