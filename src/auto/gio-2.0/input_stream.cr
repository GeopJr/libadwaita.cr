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
  @[GObject::GeneratedWrapper]
  class InputStream < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::InputStreamClass), class_init,
        sizeof(LibGio::InputStream), instance_init, 0)
    end

    GICrystal.define_new_method(InputStream, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `InputStream`.
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
      LibGio.g_input_stream_get_type
    end

    # Clears the pending flag on @stream.
    def clear_pending : Nil
      # g_input_stream_clear_pending: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_input_stream_clear_pending(@pointer)

      # Return value handling
    end

    # Closes the stream, releasing resources related to it.
    #
    # Once the stream is closed, all other operations will return %G_IO_ERROR_CLOSED.
    # Closing a stream multiple times will not return an error.
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
    # is important to check and report the error to the user.
    #
    # If @cancellable is not %NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
    # Cancelling a close will still leave the stream closed, but some streams
    # can use a faster close that doesn't block to e.g. check errors.
    def close(cancellable : Gio::Cancellable?) : Bool
      # g_input_stream_close: (Method | Throws)
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
      _retval = LibGio.g_input_stream_close(@pointer, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Requests an asynchronous closes of the stream, releasing resources related to it.
    # When the operation is finished @callback will be called.
    # You can then call g_input_stream_close_finish() to get the result of the
    # operation.
    #
    # For behaviour details see g_input_stream_close().
    #
    # The asynchronous methods have a default fallback that uses threads to implement
    # asynchronicity, so they are optional for inheriting classes. However, if you
    # override one you must override all.
    def close_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_input_stream_close_async: (Method)
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
      LibGio.g_input_stream_close_async(@pointer, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes closing a stream asynchronously, started from g_input_stream_close_async().
    def close_finish(result : Gio::AsyncResult) : Bool
      # g_input_stream_close_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_input_stream_close_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks if an input stream has pending actions.
    def has_pending : Bool
      # g_input_stream_has_pending: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_input_stream_has_pending(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks if an input stream is closed.
    def is_closed : Bool
      # g_input_stream_is_closed: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_input_stream_is_closed(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Tries to read @count bytes from the stream into the buffer starting at
    # @buffer. Will block during this read.
    #
    # If count is zero returns zero and does nothing. A value of @count
    # larger than %G_MAXSSIZE will cause a %G_IO_ERROR_INVALID_ARGUMENT error.
    #
    # On success, the number of bytes read into the buffer is returned.
    # It is not an error if this is not the same as the requested size, as it
    # can happen e.g. near the end of a file. Zero is returned on end of file
    # (or if @count is zero),  but never otherwise.
    #
    # The returned @buffer is not a nul-terminated string, it can contain nul bytes
    # at any position, and this function doesn't nul-terminate the @buffer.
    #
    # If @cancellable is not %NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. If an
    # operation was partially finished when the operation was cancelled the
    # partial result will be returned, without an error.
    #
    # On error -1 is returned and @error is set accordingly.
    def read(buffer : Enumerable(UInt8), cancellable : Gio::Cancellable?) : Int64
      # g_input_stream_read: (Method | Throws)
      # @buffer: (out) (caller-allocates) (array length=count element-type UInt8)
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
      _retval = LibGio.g_input_stream_read(@pointer, buffer, count, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Tries to read @count bytes from the stream into the buffer starting at
    # @buffer. Will block during this read.
    #
    # This function is similar to g_input_stream_read(), except it tries to
    # read as many bytes as requested, only stopping on an error or end of stream.
    #
    # On a successful read of @count bytes, or if we reached the end of the
    # stream,  %TRUE is returned, and @bytes_read is set to the number of bytes
    # read into @buffer.
    #
    # If there is an error during the operation %FALSE is returned and @error
    # is set to indicate the error status.
    #
    # As a special exception to the normal conventions for functions that
    # use #GError, if this function returns %FALSE (and sets @error) then
    # @bytes_read will be set to the number of bytes that were successfully
    # read before the error was encountered.  This functionality is only
    # available from C.  If you need it from another language then you must
    # write your own loop around g_input_stream_read().
    def read_all(buffer : Enumerable(UInt8), bytes_read : UInt64, cancellable : Gio::Cancellable?) : Bool
      # g_input_stream_read_all: (Method | Throws)
      # @buffer: (out) (caller-allocates) (array length=count element-type UInt8)
      # @bytes_read: (out) (transfer full)
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
      _retval = LibGio.g_input_stream_read_all(@pointer, buffer, count, bytes_read, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Request an asynchronous read of @count bytes from the stream into the
    # buffer starting at @buffer.
    #
    # This is the asynchronous equivalent of g_input_stream_read_all().
    #
    # Call g_input_stream_read_all_finish() to collect the result.
    #
    # Any outstanding I/O request with higher priority (lower numerical
    # value) will be executed before an outstanding request with lower
    # priority. Default priority is %G_PRIORITY_DEFAULT.
    def read_all_async(buffer : Enumerable(UInt8), io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_input_stream_read_all_async: (Method)
      # @buffer: (out) (caller-allocates) (array length=count element-type UInt8)
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
      LibGio.g_input_stream_read_all_async(@pointer, buffer, count, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an asynchronous stream read operation started with
    # g_input_stream_read_all_async().
    #
    # As a special exception to the normal conventions for functions that
    # use #GError, if this function returns %FALSE (and sets @error) then
    # @bytes_read will be set to the number of bytes that were successfully
    # read before the error was encountered.  This functionality is only
    # available from C.  If you need it from another language then you must
    # write your own loop around g_input_stream_read_async().
    def read_all_finish(result : Gio::AsyncResult, bytes_read : UInt64) : Bool
      # g_input_stream_read_all_finish: (Method | Throws)
      # @bytes_read: (out) (transfer full)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_input_stream_read_all_finish(@pointer, result, bytes_read, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Request an asynchronous read of @count bytes from the stream into the buffer
    # starting at @buffer. When the operation is finished @callback will be called.
    # You can then call g_input_stream_read_finish() to get the result of the
    # operation.
    #
    # During an async request no other sync and async calls are allowed on @stream, and will
    # result in %G_IO_ERROR_PENDING errors.
    #
    # A value of @count larger than %G_MAXSSIZE will cause a %G_IO_ERROR_INVALID_ARGUMENT error.
    #
    # On success, the number of bytes read into the buffer will be passed to the
    # callback. It is not an error if this is not the same as the requested size, as it
    # can happen e.g. near the end of a file, but generally we try to read
    # as many bytes as requested. Zero is returned on end of file
    # (or if @count is zero),  but never otherwise.
    #
    # Any outstanding i/o request with higher priority (lower numerical value) will
    # be executed before an outstanding request with lower priority. Default
    # priority is %G_PRIORITY_DEFAULT.
    #
    # The asynchronous methods have a default fallback that uses threads to implement
    # asynchronicity, so they are optional for inheriting classes. However, if you
    # override one you must override all.
    def read_async(buffer : Enumerable(UInt8), io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_input_stream_read_async: (Method)
      # @buffer: (out) (caller-allocates) (array length=count element-type UInt8)
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
      LibGio.g_input_stream_read_async(@pointer, buffer, count, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Like g_input_stream_read(), this tries to read @count bytes from
    # the stream in a blocking fashion. However, rather than reading into
    # a user-supplied buffer, this will create a new #GBytes containing
    # the data that was read. This may be easier to use from language
    # bindings.
    #
    # If count is zero, returns a zero-length #GBytes and does nothing. A
    # value of @count larger than %G_MAXSSIZE will cause a
    # %G_IO_ERROR_INVALID_ARGUMENT error.
    #
    # On success, a new #GBytes is returned. It is not an error if the
    # size of this object is not the same as the requested size, as it
    # can happen e.g. near the end of a file. A zero-length #GBytes is
    # returned on end of file (or if @count is zero), but never
    # otherwise.
    #
    # If @cancellable is not %NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. If an
    # operation was partially finished when the operation was cancelled the
    # partial result will be returned, without an error.
    #
    # On error %NULL is returned and @error is set accordingly.
    def read_bytes(count : UInt64, cancellable : Gio::Cancellable?) : GLib::Bytes
      # g_input_stream_read_bytes: (Method | Throws)
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
      _retval = LibGio.g_input_stream_read_bytes(@pointer, count, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    # Request an asynchronous read of @count bytes from the stream into a
    # new #GBytes. When the operation is finished @callback will be
    # called. You can then call g_input_stream_read_bytes_finish() to get the
    # result of the operation.
    #
    # During an async request no other sync and async calls are allowed
    # on @stream, and will result in %G_IO_ERROR_PENDING errors.
    #
    # A value of @count larger than %G_MAXSSIZE will cause a
    # %G_IO_ERROR_INVALID_ARGUMENT error.
    #
    # On success, the new #GBytes will be passed to the callback. It is
    # not an error if this is smaller than the requested size, as it can
    # happen e.g. near the end of a file, but generally we try to read as
    # many bytes as requested. Zero is returned on end of file (or if
    # @count is zero), but never otherwise.
    #
    # Any outstanding I/O request with higher priority (lower numerical
    # value) will be executed before an outstanding request with lower
    # priority. Default priority is %G_PRIORITY_DEFAULT.
    def read_bytes_async(count : UInt64, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_input_stream_read_bytes_async: (Method)
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
      LibGio.g_input_stream_read_bytes_async(@pointer, count, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an asynchronous stream read-into-#GBytes operation.
    def read_bytes_finish(result : Gio::AsyncResult) : GLib::Bytes
      # g_input_stream_read_bytes_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_input_stream_read_bytes_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    # Finishes an asynchronous stream read operation.
    def read_finish(result : Gio::AsyncResult) : Int64
      # g_input_stream_read_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_input_stream_read_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Sets @stream to have actions pending. If the pending flag is
    # already set or @stream is closed, it will return %FALSE and set
    # @error.
    def set_pending : Bool
      # g_input_stream_set_pending: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_input_stream_set_pending(@pointer, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Tries to skip @count bytes from the stream. Will block during the operation.
    #
    # This is identical to g_input_stream_read(), from a behaviour standpoint,
    # but the bytes that are skipped are not returned to the user. Some
    # streams have an implementation that is more efficient than reading the data.
    #
    # This function is optional for inherited classes, as the default implementation
    # emulates it using read.
    #
    # If @cancellable is not %NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. If an
    # operation was partially finished when the operation was cancelled the
    # partial result will be returned, without an error.
    def skip(count : UInt64, cancellable : Gio::Cancellable?) : Int64
      # g_input_stream_skip: (Method | Throws)
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
      _retval = LibGio.g_input_stream_skip(@pointer, count, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Request an asynchronous skip of @count bytes from the stream.
    # When the operation is finished @callback will be called.
    # You can then call g_input_stream_skip_finish() to get the result
    # of the operation.
    #
    # During an async request no other sync and async calls are allowed,
    # and will result in %G_IO_ERROR_PENDING errors.
    #
    # A value of @count larger than %G_MAXSSIZE will cause a %G_IO_ERROR_INVALID_ARGUMENT error.
    #
    # On success, the number of bytes skipped will be passed to the callback.
    # It is not an error if this is not the same as the requested size, as it
    # can happen e.g. near the end of a file, but generally we try to skip
    # as many bytes as requested. Zero is returned on end of file
    # (or if @count is zero), but never otherwise.
    #
    # Any outstanding i/o request with higher priority (lower numerical value)
    # will be executed before an outstanding request with lower priority.
    # Default priority is %G_PRIORITY_DEFAULT.
    #
    # The asynchronous methods have a default fallback that uses threads to
    # implement asynchronicity, so they are optional for inheriting classes.
    # However, if you override one, you must override all.
    def skip_async(count : UInt64, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_input_stream_skip_async: (Method)
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
      LibGio.g_input_stream_skip_async(@pointer, count, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes a stream skip operation.
    def skip_finish(result : Gio::AsyncResult) : Int64
      # g_input_stream_skip_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_input_stream_skip_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end
  end
end
