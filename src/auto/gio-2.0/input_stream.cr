require "../g_object-2.0/object"

module Gio
  # #GInputStream has functions to read from a stream (g_input_stream_read()),
  # to close a stream (g_input_stream_close()) and to skip some content
  # (g_input_stream_skip()).
  #
  # To copy the content of an input stream to an output stream without
  # manually handling the reads and writes, use g_output_stream_splice().
  #
  # See the documentation for #GIOStream for details of thread safety of
  # streaming APIs.
  #
  # All of these functions have async variants too.
  class InputStream < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_input_stream_get_type
    end

    def clear_pending : Nil
      # g_input_stream_clear_pending: (Method)
      # Returns: (transfer none)

      LibGio.g_input_stream_clear_pending(self)
    end

    def close(cancellable : Gio::Cancellable?) : Bool
      # g_input_stream_close: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_input_stream_close(self, cancellable)
      GICrystal.to_bool(_retval)
    end

    def close_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_input_stream_close_async: (Method)
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

      LibGio.g_input_stream_close_async(self, io_priority, cancellable, callback, user_data)
    end

    def close_finish(result : Gio::AsyncResult) : Bool
      # g_input_stream_close_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_input_stream_close_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def has_pending : Bool
      # g_input_stream_has_pending: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_input_stream_has_pending(self)
      GICrystal.to_bool(_retval)
    end

    def is_closed : Bool
      # g_input_stream_is_closed: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_input_stream_is_closed(self)
      GICrystal.to_bool(_retval)
    end

    def read(buffer : Enumerable(UInt8), cancellable : Gio::Cancellable?) : Int64
      # g_input_stream_read: (Method | Throws)
      # @buffer: (out) (caller-allocates) (array length=count element-type UInt8)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      count = buffer.size
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      buffer = buffer.to_a.to_unsafe

      _retval = LibGio.g_input_stream_read(self, buffer, count, cancellable)
      _retval
    end

    def read_all(buffer : Enumerable(UInt8), bytes_read : UInt64, cancellable : Gio::Cancellable?) : Bool
      # g_input_stream_read_all: (Method | Throws)
      # @buffer: (out) (caller-allocates) (array length=count element-type UInt8)
      # @bytes_read: (out) (transfer full)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      count = buffer.size
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      buffer = buffer.to_a.to_unsafe

      _retval = LibGio.g_input_stream_read_all(self, buffer, count, bytes_read, cancellable)
      GICrystal.to_bool(_retval)
    end

    def read_all_async(buffer : Enumerable(UInt8), io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_input_stream_read_all_async: (Method)
      # @buffer: (out) (caller-allocates) (array length=count element-type UInt8)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      count = buffer.size
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
      buffer = buffer.to_a.to_unsafe

      LibGio.g_input_stream_read_all_async(self, buffer, count, io_priority, cancellable, callback, user_data)
    end

    def read_all_finish(result : Gio::AsyncResult, bytes_read : UInt64) : Bool
      # g_input_stream_read_all_finish: (Method | Throws)
      # @bytes_read: (out) (transfer full)
      # Returns: (transfer none)

      _retval = LibGio.g_input_stream_read_all_finish(self, result, bytes_read)
      GICrystal.to_bool(_retval)
    end

    def read_async(buffer : Enumerable(UInt8), io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_input_stream_read_async: (Method)
      # @buffer: (out) (caller-allocates) (array length=count element-type UInt8)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      count = buffer.size
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
      buffer = buffer.to_a.to_unsafe

      LibGio.g_input_stream_read_async(self, buffer, count, io_priority, cancellable, callback, user_data)
    end

    def read_bytes(count : UInt64, cancellable : Gio::Cancellable?) : GLib::Bytes
      # g_input_stream_read_bytes: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_input_stream_read_bytes(self, count, cancellable)
      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    def read_bytes_async(count : UInt64, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_input_stream_read_bytes_async: (Method)
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

      LibGio.g_input_stream_read_bytes_async(self, count, io_priority, cancellable, callback, user_data)
    end

    def read_bytes_finish(result : Gio::AsyncResult) : GLib::Bytes
      # g_input_stream_read_bytes_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_input_stream_read_bytes_finish(self, result)
      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    def read_finish(result : Gio::AsyncResult) : Int64
      # g_input_stream_read_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_input_stream_read_finish(self, result)
      _retval
    end

    def set_pending : Bool
      # g_input_stream_set_pending: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_input_stream_set_pending(self)
      GICrystal.to_bool(_retval)
    end

    def skip(count : UInt64, cancellable : Gio::Cancellable?) : Int64
      # g_input_stream_skip: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_input_stream_skip(self, count, cancellable)
      _retval
    end

    def skip_async(count : UInt64, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_input_stream_skip_async: (Method)
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

      LibGio.g_input_stream_skip_async(self, count, io_priority, cancellable, callback, user_data)
    end

    def skip_finish(result : Gio::AsyncResult) : Int64
      # g_input_stream_skip_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_input_stream_skip_finish(self, result)
      _retval
    end
  end
end
