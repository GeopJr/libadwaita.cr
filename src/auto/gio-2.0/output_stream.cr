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
  @[GObject::GeneratedWrapper]
  class OutputStream < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::OutputStreamClass), class_init,
        sizeof(LibGio::OutputStream), instance_init, 0)
    end

    GICrystal.define_new_method(OutputStream, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `OutputStream`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_output_stream_get_type
    end

    # Clears the pending flag on @stream.
    def clear_pending : Nil
      # g_output_stream_clear_pending: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_output_stream_clear_pending(@pointer)

      # Return value handling
    end

    # Closes the stream, releasing resources related to it.
    #
    # Once the stream is closed, all other operations will return %G_IO_ERROR_CLOSED.
    # Closing a stream multiple times will not return an error.
    #
    # Closing a stream will automatically flush any outstanding buffers in the
    # stream.
    #
    # Streams will be automatically closed when the last reference
    # is dropped, but you might want to call this function to make sure
    # resources are released as early as possible.
    #
    # Some streams might keep the backing store of the stream (e.g. a file descriptor)
    # open after the stream is closed. See the documentation for the individual
    # stream for details.
    #
    # On failure the first error that happened will be reported, but the close
    # operation will finish as much as possible. A stream that failed to
    # close will still return %G_IO_ERROR_CLOSED for all operations. Still, it
    # is important to check and report the error to the user, otherwise
    # there might be a loss of data as all data might not be written.
    #
    # If @cancellable is not %NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
    # Cancelling a close will still leave the stream closed, but there some streams
    # can use a faster close that doesn't block to e.g. check errors. On
    # cancellation (as with any error) there is no guarantee that all written
    # data will reach the target.
    def close(cancellable : Gio::Cancellable?) : Bool
      # g_output_stream_close: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_output_stream_close(@pointer, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Requests an asynchronous close of the stream, releasing resources
    # related to it. When the operation is finished @callback will be
    # called. You can then call g_output_stream_close_finish() to get
    # the result of the operation.
    #
    # For behaviour details see g_output_stream_close().
    #
    # The asynchronous methods have a default fallback that uses threads
    # to implement asynchronicity, so they are optional for inheriting
    # classes. However, if you override one you must override all.
    def close_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_output_stream_close_async: (Method)
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
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_output_stream_close_async(@pointer, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Closes an output stream.
    def close_finish(result : Gio::AsyncResult) : Bool
      # g_output_stream_close_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_output_stream_close_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Forces a write of all user-space buffered data for the given
    # @stream. Will block during the operation. Closing the stream will
    # implicitly cause a flush.
    #
    # This function is optional for inherited classes.
    #
    # If @cancellable is not %NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
    def flush(cancellable : Gio::Cancellable?) : Bool
      # g_output_stream_flush: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_output_stream_flush(@pointer, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Forces an asynchronous write of all user-space buffered data for
    # the given @stream.
    # For behaviour details see g_output_stream_flush().
    #
    # When the operation is finished @callback will be
    # called. You can then call g_output_stream_flush_finish() to get the
    # result of the operation.
    def flush_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_output_stream_flush_async: (Method)
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
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_output_stream_flush_async(@pointer, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes flushing an output stream.
    def flush_finish(result : Gio::AsyncResult) : Bool
      # g_output_stream_flush_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_output_stream_flush_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks if an output stream has pending actions.
    def has_pending : Bool
      # g_output_stream_has_pending: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_output_stream_has_pending(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks if an output stream has already been closed.
    def is_closed : Bool
      # g_output_stream_is_closed: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_output_stream_is_closed(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks if an output stream is being closed. This can be
    # used inside e.g. a flush implementation to see if the
    # flush (or other i/o operation) is called from within
    # the closing operation.
    def is_closing : Bool
      # g_output_stream_is_closing: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_output_stream_is_closing(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets @stream to have actions pending. If the pending flag is
    # already set or @stream is closed, it will return %FALSE and set
    # @error.
    def set_pending : Bool
      # g_output_stream_set_pending: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_output_stream_set_pending(@pointer, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Splices an input stream into an output stream.
    def splice(source : Gio::InputStream, flags : Gio::OutputStreamSpliceFlags, cancellable : Gio::Cancellable?) : Int64
      # g_output_stream_splice: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_output_stream_splice(@pointer, source, flags, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Splices a stream asynchronously.
    # When the operation is finished @callback will be called.
    # You can then call g_output_stream_splice_finish() to get the
    # result of the operation.
    #
    # For the synchronous, blocking version of this function, see
    # g_output_stream_splice().
    def splice_async(source : Gio::InputStream, flags : Gio::OutputStreamSpliceFlags, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_output_stream_splice_async: (Method)
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
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_output_stream_splice_async(@pointer, source, flags, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an asynchronous stream splice operation.
    def splice_finish(result : Gio::AsyncResult) : Int64
      # g_output_stream_splice_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_output_stream_splice_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Tries to write @count bytes from @buffer into the stream. Will block
    # during the operation.
    #
    # If count is 0, returns 0 and does nothing. A value of @count
    # larger than %G_MAXSSIZE will cause a %G_IO_ERROR_INVALID_ARGUMENT error.
    #
    # On success, the number of bytes written to the stream is returned.
    # It is not an error if this is not the same as the requested size, as it
    # can happen e.g. on a partial I/O error, or if there is not enough
    # storage in the stream. All writes block until at least one byte
    # is written or an error occurs; 0 is never returned (unless
    # @count is 0).
    #
    # If @cancellable is not %NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. If an
    # operation was partially finished when the operation was cancelled the
    # partial result will be returned, without an error.
    #
    # On error -1 is returned and @error is set accordingly.
    def write(buffer : Enumerable(UInt8), cancellable : Gio::Cancellable?) : Int64
      # g_output_stream_write: (Method | Throws)
      # @buffer: (array length=count element-type UInt8)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayLengthArgPlan
      count = buffer.size # Generator::ArrayArgPlan
      buffer = buffer.to_a.to_unsafe
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_output_stream_write(@pointer, buffer, count, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Tries to write @count bytes from @buffer into the stream. Will block
    # during the operation.
    #
    # This function is similar to g_output_stream_write(), except it tries to
    # write as many bytes as requested, only stopping on an error.
    #
    # On a successful write of @count bytes, %TRUE is returned, and @bytes_written
    # is set to @count.
    #
    # If there is an error during the operation %FALSE is returned and @error
    # is set to indicate the error status.
    #
    # As a special exception to the normal conventions for functions that
    # use #GError, if this function returns %FALSE (and sets @error) then
    # @bytes_written will be set to the number of bytes that were
    # successfully written before the error was encountered.  This
    # functionality is only available from C.  If you need it from another
    # language then you must write your own loop around
    # g_output_stream_write().
    def write_all(buffer : Enumerable(UInt8), cancellable : Gio::Cancellable?) : Bool
      # g_output_stream_write_all: (Method | Throws)
      # @buffer: (array length=count element-type UInt8)
      # @bytes_written: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayLengthArgPlan
      count = buffer.size # Generator::ArrayArgPlan
      buffer = buffer.to_a.to_unsafe
      # Generator::OutArgUsedInReturnPlan
      bytes_written = Pointer(UInt64).null # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_output_stream_write_all(@pointer, buffer, count, bytes_written, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Request an asynchronous write of @count bytes from @buffer into
    # the stream. When the operation is finished @callback will be called.
    # You can then call g_output_stream_write_all_finish() to get the result of the
    # operation.
    #
    # This is the asynchronous version of g_output_stream_write_all().
    #
    # Call g_output_stream_write_all_finish() to collect the result.
    #
    # Any outstanding I/O request with higher priority (lower numerical
    # value) will be executed before an outstanding request with lower
    # priority. Default priority is %G_PRIORITY_DEFAULT.
    #
    # Note that no copy of @buffer will be made, so it must stay valid
    # until @callback is called.
    def write_all_async(buffer : Enumerable(UInt8), io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_output_stream_write_all_async: (Method)
      # @buffer: (array length=count element-type UInt8)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      count = buffer.size # Generator::ArrayArgPlan
      buffer = buffer.to_a.to_unsafe
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_output_stream_write_all_async(@pointer, buffer, count, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an asynchronous stream write operation started with
    # g_output_stream_write_all_async().
    #
    # As a special exception to the normal conventions for functions that
    # use #GError, if this function returns %FALSE (and sets @error) then
    # @bytes_written will be set to the number of bytes that were
    # successfully written before the error was encountered.  This
    # functionality is only available from C.  If you need it from another
    # language then you must write your own loop around
    # g_output_stream_write_async().
    def write_all_finish(result : Gio::AsyncResult) : Bool
      # g_output_stream_write_all_finish: (Method | Throws)
      # @bytes_written: (out) (transfer full) (optional)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      bytes_written = Pointer(UInt64).null
      # C call
      _retval = LibGio.g_output_stream_write_all_finish(@pointer, result, bytes_written, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Request an asynchronous write of @count bytes from @buffer into
    # the stream. When the operation is finished @callback will be called.
    # You can then call g_output_stream_write_finish() to get the result of the
    # operation.
    #
    # During an async request no other sync and async calls are allowed,
    # and will result in %G_IO_ERROR_PENDING errors.
    #
    # A value of @count larger than %G_MAXSSIZE will cause a
    # %G_IO_ERROR_INVALID_ARGUMENT error.
    #
    # On success, the number of bytes written will be passed to the
    # @callback. It is not an error if this is not the same as the
    # requested size, as it can happen e.g. on a partial I/O error,
    # but generally we try to write as many bytes as requested.
    #
    # You are guaranteed that this method will never fail with
    # %G_IO_ERROR_WOULD_BLOCK - if @stream can't accept more data, the
    # method will just wait until this changes.
    #
    # Any outstanding I/O request with higher priority (lower numerical
    # value) will be executed before an outstanding request with lower
    # priority. Default priority is %G_PRIORITY_DEFAULT.
    #
    # The asynchronous methods have a default fallback that uses threads
    # to implement asynchronicity, so they are optional for inheriting
    # classes. However, if you override one you must override all.
    #
    # For the synchronous, blocking version of this function, see
    # g_output_stream_write().
    #
    # Note that no copy of @buffer will be made, so it must stay valid
    # until @callback is called. See g_output_stream_write_bytes_async()
    # for a #GBytes version that will automatically hold a reference to
    # the contents (without copying) for the duration of the call.
    def write_async(buffer : Enumerable(UInt8), io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_output_stream_write_async: (Method)
      # @buffer: (array length=count element-type UInt8)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      count = buffer.size # Generator::ArrayArgPlan
      buffer = buffer.to_a.to_unsafe
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_output_stream_write_async(@pointer, buffer, count, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # A wrapper function for g_output_stream_write() which takes a
    # #GBytes as input.  This can be more convenient for use by language
    # bindings or in other cases where the refcounted nature of #GBytes
    # is helpful over a bare pointer interface.
    #
    # However, note that this function may still perform partial writes,
    # just like g_output_stream_write().  If that occurs, to continue
    # writing, you will need to create a new #GBytes containing just the
    # remaining bytes, using g_bytes_new_from_bytes(). Passing the same
    # #GBytes instance multiple times potentially can result in duplicated
    # data in the output stream.
    def write_bytes(bytes : GLib::Bytes, cancellable : Gio::Cancellable?) : Int64
      # g_output_stream_write_bytes: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_output_stream_write_bytes(@pointer, bytes, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # This function is similar to g_output_stream_write_async(), but
    # takes a #GBytes as input.  Due to the refcounted nature of #GBytes,
    # this allows the stream to avoid taking a copy of the data.
    #
    # However, note that this function may still perform partial writes,
    # just like g_output_stream_write_async(). If that occurs, to continue
    # writing, you will need to create a new #GBytes containing just the
    # remaining bytes, using g_bytes_new_from_bytes(). Passing the same
    # #GBytes instance multiple times potentially can result in duplicated
    # data in the output stream.
    #
    # For the synchronous, blocking version of this function, see
    # g_output_stream_write_bytes().
    def write_bytes_async(bytes : GLib::Bytes, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_output_stream_write_bytes_async: (Method)
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
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_output_stream_write_bytes_async(@pointer, bytes, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes a stream write-from-#GBytes operation.
    def write_bytes_finish(result : Gio::AsyncResult) : Int64
      # g_output_stream_write_bytes_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_output_stream_write_bytes_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Finishes a stream write operation.
    def write_finish(result : Gio::AsyncResult) : Int64
      # g_output_stream_write_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_output_stream_write_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Tries to write the bytes contained in the @n_vectors @vectors into the
    # stream. Will block during the operation.
    #
    # If @n_vectors is 0 or the sum of all bytes in @vectors is 0, returns 0 and
    # does nothing.
    #
    # On success, the number of bytes written to the stream is returned.
    # It is not an error if this is not the same as the requested size, as it
    # can happen e.g. on a partial I/O error, or if there is not enough
    # storage in the stream. All writes block until at least one byte
    # is written or an error occurs; 0 is never returned (unless
    # @n_vectors is 0 or the sum of all bytes in @vectors is 0).
    #
    # If @cancellable is not %NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. If an
    # operation was partially finished when the operation was cancelled the
    # partial result will be returned, without an error.
    #
    # Some implementations of g_output_stream_writev() may have limitations on the
    # aggregate buffer size, and will return %G_IO_ERROR_INVALID_ARGUMENT if these
    # are exceeded. For example, when writing to a local file on UNIX platforms,
    # the aggregate buffer size must not exceed %G_MAXSSIZE bytes.
    def writev(vectors : Enumerable(Gio::OutputVector), cancellable : Gio::Cancellable?) : Bool
      # g_output_stream_writev: (Method | Throws)
      # @vectors: (array length=n_vectors element-type Interface)
      # @bytes_written: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayLengthArgPlan
      n_vectors = vectors.size # Generator::ArrayArgPlan
      vectors = vectors.to_a.map(&.to_unsafe).to_unsafe
      # Generator::OutArgUsedInReturnPlan
      bytes_written = Pointer(UInt64).null # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_output_stream_writev(@pointer, vectors, n_vectors, bytes_written, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Tries to write the bytes contained in the @n_vectors @vectors into the
    # stream. Will block during the operation.
    #
    # This function is similar to g_output_stream_writev(), except it tries to
    # write as many bytes as requested, only stopping on an error.
    #
    # On a successful write of all @n_vectors vectors, %TRUE is returned, and
    # @bytes_written is set to the sum of all the sizes of @vectors.
    #
    # If there is an error during the operation %FALSE is returned and @error
    # is set to indicate the error status.
    #
    # As a special exception to the normal conventions for functions that
    # use #GError, if this function returns %FALSE (and sets @error) then
    # @bytes_written will be set to the number of bytes that were
    # successfully written before the error was encountered.  This
    # functionality is only available from C. If you need it from another
    # language then you must write your own loop around
    # g_output_stream_write().
    #
    # The content of the individual elements of @vectors might be changed by this
    # function.
    def writev_all(vectors : Enumerable(Gio::OutputVector), cancellable : Gio::Cancellable?) : Bool
      # g_output_stream_writev_all: (Method | Throws)
      # @vectors: (array length=n_vectors element-type Interface)
      # @bytes_written: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayLengthArgPlan
      n_vectors = vectors.size # Generator::ArrayArgPlan
      vectors = vectors.to_a.map(&.to_unsafe).to_unsafe
      # Generator::OutArgUsedInReturnPlan
      bytes_written = Pointer(UInt64).null # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_output_stream_writev_all(@pointer, vectors, n_vectors, bytes_written, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Request an asynchronous write of the bytes contained in the @n_vectors @vectors into
    # the stream. When the operation is finished @callback will be called.
    # You can then call g_output_stream_writev_all_finish() to get the result of the
    # operation.
    #
    # This is the asynchronous version of g_output_stream_writev_all().
    #
    # Call g_output_stream_writev_all_finish() to collect the result.
    #
    # Any outstanding I/O request with higher priority (lower numerical
    # value) will be executed before an outstanding request with lower
    # priority. Default priority is %G_PRIORITY_DEFAULT.
    #
    # Note that no copy of @vectors will be made, so it must stay valid
    # until @callback is called. The content of the individual elements
    # of @vectors might be changed by this function.
    def writev_all_async(vectors : Enumerable(Gio::OutputVector), io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_output_stream_writev_all_async: (Method)
      # @vectors: (array length=n_vectors element-type Interface)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_vectors = vectors.size # Generator::ArrayArgPlan
      vectors = vectors.to_a.map(&.to_unsafe).to_unsafe
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_output_stream_writev_all_async(@pointer, vectors, n_vectors, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an asynchronous stream write operation started with
    # g_output_stream_writev_all_async().
    #
    # As a special exception to the normal conventions for functions that
    # use #GError, if this function returns %FALSE (and sets @error) then
    # @bytes_written will be set to the number of bytes that were
    # successfully written before the error was encountered.  This
    # functionality is only available from C.  If you need it from another
    # language then you must write your own loop around
    # g_output_stream_writev_async().
    def writev_all_finish(result : Gio::AsyncResult) : Bool
      # g_output_stream_writev_all_finish: (Method | Throws)
      # @bytes_written: (out) (transfer full) (optional)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      bytes_written = Pointer(UInt64).null
      # C call
      _retval = LibGio.g_output_stream_writev_all_finish(@pointer, result, bytes_written, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Request an asynchronous write of the bytes contained in @n_vectors @vectors into
    # the stream. When the operation is finished @callback will be called.
    # You can then call g_output_stream_writev_finish() to get the result of the
    # operation.
    #
    # During an async request no other sync and async calls are allowed,
    # and will result in %G_IO_ERROR_PENDING errors.
    #
    # On success, the number of bytes written will be passed to the
    # @callback. It is not an error if this is not the same as the
    # requested size, as it can happen e.g. on a partial I/O error,
    # but generally we try to write as many bytes as requested.
    #
    # You are guaranteed that this method will never fail with
    # %G_IO_ERROR_WOULD_BLOCK — if @stream can't accept more data, the
    # method will just wait until this changes.
    #
    # Any outstanding I/O request with higher priority (lower numerical
    # value) will be executed before an outstanding request with lower
    # priority. Default priority is %G_PRIORITY_DEFAULT.
    #
    # The asynchronous methods have a default fallback that uses threads
    # to implement asynchronicity, so they are optional for inheriting
    # classes. However, if you override one you must override all.
    #
    # For the synchronous, blocking version of this function, see
    # g_output_stream_writev().
    #
    # Note that no copy of @vectors will be made, so it must stay valid
    # until @callback is called.
    def writev_async(vectors : Enumerable(Gio::OutputVector), io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_output_stream_writev_async: (Method)
      # @vectors: (array length=n_vectors element-type Interface)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_vectors = vectors.size # Generator::ArrayArgPlan
      vectors = vectors.to_a.map(&.to_unsafe).to_unsafe
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_output_stream_writev_async(@pointer, vectors, n_vectors, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes a stream writev operation.
    def writev_finish(result : Gio::AsyncResult) : Bool
      # g_output_stream_writev_finish: (Method | Throws)
      # @bytes_written: (out) (transfer full) (optional)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      bytes_written = Pointer(UInt64).null
      # C call
      _retval = LibGio.g_output_stream_writev_finish(@pointer, result, bytes_written, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
