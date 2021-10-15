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
  class FileInputStream < InputStream
    include Seekable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_input_stream_get_type
    end

    def query_info(attributes : ::String, cancellable : Gio::Cancellable?) : Gio::FileInfo
      # g_file_input_stream_query_info: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_input_stream_query_info(self, attributes, cancellable)
      Gio::FileInfo.new(_retval, GICrystal::Transfer::Full)
    end

    def query_info_async(attributes : ::String, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_input_stream_query_info_async: (Method)
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

      LibGio.g_file_input_stream_query_info_async(self, attributes, io_priority, cancellable, callback, user_data)
    end

    def query_info_finish(result : Gio::AsyncResult) : Gio::FileInfo
      # g_file_input_stream_query_info_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_file_input_stream_query_info_finish(self, result)
      Gio::FileInfo.new(_retval, GICrystal::Transfer::Full)
    end
  end
end
