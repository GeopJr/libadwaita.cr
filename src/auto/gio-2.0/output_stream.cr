require "../g_object-2.0/object"

module Gio
  # #GOutputStream has functions to write to a stream (g_output_stream_write()),
  # to close a stream (g_output_stream_close()) and to flush pending writes
  # (g_output_stream_flush()).
  #
  # To copy the content of an input stream to an output stream without
  # manually handling the reads and writes, use g_output_stream_splice().
  #
  # See the documentation for #GIOStream for details of thread safety of
  # streaming APIs.
  #
  # All of these functions have async variants too.
  class OutputStream < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_output_stream_get_type
    end

    def clear_pending : Nil
      # g_output_stream_clear_pending: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_output_stream_clear_pending(self)

      # Return value handling
    end

    def close(cancellable : Gio::Cancellable?) : Bool
      # g_output_stream_close: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_output_stream_close(self, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def close_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_output_stream_close_async: (Method)
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
      LibGio.g_output_stream_close_async(self, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    def close_finish(result : Gio::AsyncResult) : Bool
      # g_output_stream_close_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_output_stream_close_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def flush(cancellable : Gio::Cancellable?) : Bool
      # g_output_stream_flush: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_output_stream_flush(self, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def flush_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_output_stream_flush_async: (Method)
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
      LibGio.g_output_stream_flush_async(self, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    def flush_finish(result : Gio::AsyncResult) : Bool
      # g_output_stream_flush_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_output_stream_flush_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def has_pending : Bool
      # g_output_stream_has_pending: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_output_stream_has_pending(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def is_closed : Bool
      # g_output_stream_is_closed: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_output_stream_is_closed(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def is_closing : Bool
      # g_output_stream_is_closing: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_output_stream_is_closing(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def set_pending : Bool
      # g_output_stream_set_pending: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_output_stream_set_pending(self, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def splice(source : Gio::InputStream, flags : Gio::OutputStreamSpliceFlags, cancellable : Gio::Cancellable?) : Int64
      # g_output_stream_splice: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_output_stream_splice(self, source, flags, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def splice_async(source : Gio::InputStream, flags : Gio::OutputStreamSpliceFlags, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_output_stream_splice_async: (Method)
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
      LibGio.g_output_stream_splice_async(self, source, flags, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    def splice_finish(result : Gio::AsyncResult) : Int64
      # g_output_stream_splice_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_output_stream_splice_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def write(buffer : Enumerable(UInt8), cancellable : Gio::Cancellable?) : Int64
      # g_output_stream_write: (Method | Throws)
      # @buffer: (array length=count element-type UInt8)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      count = buffer.size
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      buffer = buffer.to_a.to_unsafe

      # C call
      _retval = LibGio.g_output_stream_write(self, buffer, count, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def write_all(buffer : Enumerable(UInt8), cancellable : Gio::Cancellable?) : Bool
      # g_output_stream_write_all: (Method | Throws)
      # @buffer: (array length=count element-type UInt8)
      # @bytes_written: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      count = buffer.size
      bytes_written = Pointer(UInt64).null
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      buffer = buffer.to_a.to_unsafe

      # C call
      _retval = LibGio.g_output_stream_write_all(self, buffer, count, bytes_written, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def write_all_async(buffer : Enumerable(UInt8), io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_output_stream_write_all_async: (Method)
      # @buffer: (array length=count element-type UInt8)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
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

      # C call
      LibGio.g_output_stream_write_all_async(self, buffer, count, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    def write_all_finish(result : Gio::AsyncResult) : Bool
      # g_output_stream_write_all_finish: (Method | Throws)
      # @bytes_written: (out) (transfer full) (optional)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      bytes_written = Pointer(UInt64).null

      # C call
      _retval = LibGio.g_output_stream_write_all_finish(self, result, bytes_written, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def write_async(buffer : Enumerable(UInt8), io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_output_stream_write_async: (Method)
      # @buffer: (array length=count element-type UInt8)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
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

      # C call
      LibGio.g_output_stream_write_async(self, buffer, count, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    def write_bytes(bytes : GLib::Bytes, cancellable : Gio::Cancellable?) : Int64
      # g_output_stream_write_bytes: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_output_stream_write_bytes(self, bytes, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def write_bytes_async(bytes : GLib::Bytes, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_output_stream_write_bytes_async: (Method)
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
      LibGio.g_output_stream_write_bytes_async(self, bytes, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    def write_bytes_finish(result : Gio::AsyncResult) : Int64
      # g_output_stream_write_bytes_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_output_stream_write_bytes_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def write_finish(result : Gio::AsyncResult) : Int64
      # g_output_stream_write_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_output_stream_write_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def writev(vectors : Enumerable(Gio::OutputVector), cancellable : Gio::Cancellable?) : Bool
      # g_output_stream_writev: (Method | Throws)
      # @vectors: (array length=n_vectors element-type Interface)
      # @bytes_written: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      n_vectors = vectors.size
      bytes_written = Pointer(UInt64).null
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      vectors = vectors.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGio.g_output_stream_writev(self, vectors, n_vectors, bytes_written, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def writev_all(vectors : Enumerable(Gio::OutputVector), cancellable : Gio::Cancellable?) : Bool
      # g_output_stream_writev_all: (Method | Throws)
      # @vectors: (array length=n_vectors element-type Interface)
      # @bytes_written: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      n_vectors = vectors.size
      bytes_written = Pointer(UInt64).null
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      vectors = vectors.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGio.g_output_stream_writev_all(self, vectors, n_vectors, bytes_written, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def writev_all_async(vectors : Enumerable(Gio::OutputVector), io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_output_stream_writev_all_async: (Method)
      # @vectors: (array length=n_vectors element-type Interface)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      n_vectors = vectors.size
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
      vectors = vectors.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGio.g_output_stream_writev_all_async(self, vectors, n_vectors, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    def writev_all_finish(result : Gio::AsyncResult) : Bool
      # g_output_stream_writev_all_finish: (Method | Throws)
      # @bytes_written: (out) (transfer full) (optional)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      bytes_written = Pointer(UInt64).null

      # C call
      _retval = LibGio.g_output_stream_writev_all_finish(self, result, bytes_written, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def writev_async(vectors : Enumerable(Gio::OutputVector), io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_output_stream_writev_async: (Method)
      # @vectors: (array length=n_vectors element-type Interface)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      n_vectors = vectors.size
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
      vectors = vectors.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGio.g_output_stream_writev_async(self, vectors, n_vectors, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    def writev_finish(result : Gio::AsyncResult) : Bool
      # g_output_stream_writev_finish: (Method | Throws)
      # @bytes_written: (out) (transfer full) (optional)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      bytes_written = Pointer(UInt64).null

      # C call
      _retval = LibGio.g_output_stream_writev_finish(self, result, bytes_written, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end
  end
end
