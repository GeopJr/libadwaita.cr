require "../g_object-2.0/object"

module Gio
  # GIOStream represents an object that has both read and write streams.
  # Generally the two streams act as separate input and output streams,
  # but they share some common resources and state. For instance, for
  # seekable streams, both streams may use the same position.
  #
  # Examples of #GIOStream objects are #GSocketConnection, which represents
  # a two-way network connection; and #GFileIOStream, which represents a
  # file handle opened in read-write mode.
  #
  # To do the actual reading and writing you need to get the substreams
  # with g_io_stream_get_input_stream() and g_io_stream_get_output_stream().
  #
  # The #GIOStream object owns the input and the output streams, not the other
  # way around, so keeping the substreams alive will not keep the #GIOStream
  # object alive. If the #GIOStream object is freed it will be closed, thus
  # closing the substreams, so even if the substreams stay alive they will
  # always return %G_IO_ERROR_CLOSED for all operations.
  #
  # To close a stream use g_io_stream_close() which will close the common
  # stream object and also the individual substreams. You can also close
  # the substreams themselves. In most cases this only marks the
  # substream as closed, so further I/O on it fails but common state in the
  # #GIOStream may still be open. However, some streams may support
  # "half-closed" states where one direction of the stream is actually shut down.
  #
  # Operations on #GIOStreams cannot be started while another operation on the
  # #GIOStream or its substreams is in progress. Specifically, an application can
  # read from the #GInputStream and write to the #GOutputStream simultaneously
  # (either in separate threads, or as asynchronous operations in the same
  # thread), but an application cannot start any #GIOStream operation while there
  # is a #GIOStream, #GInputStream or #GOutputStream operation in progress, and
  # an application can’t start any #GInputStream or #GOutputStream operation
  # while there is a #GIOStream operation in progress.
  #
  # This is a product of individual stream operations being associated with a
  # given #GMainContext (the thread-default context at the time the operation was
  # started), rather than entire streams being associated with a single
  # #GMainContext.
  #
  # GIO may run operations on #GIOStreams from other (worker) threads, and this
  # may be exposed to application code in the behaviour of wrapper streams, such
  # as #GBufferedInputStream or #GTlsConnection. With such wrapper APIs,
  # application code may only run operations on the base (wrapped) stream when
  # the wrapper stream is idle. Note that the semantics of such operations may
  # not be well-defined due to the state the wrapper stream leaves the base
  # stream in (though they are guaranteed not to crash).
  @[GObject::GeneratedWrapper]
  class IOStream < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::IOStreamClass), class_init,
        sizeof(LibGio::IOStream), instance_init, 0)
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

      @pointer = LibGObject.g_object_new_with_properties(IOStream.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_io_stream_get_type
    end

    def closed? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "closed", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def input_stream : Gio::InputStream?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "input-stream", pointerof(value), Pointer(Void).null)
      Gio::InputStream.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def output_stream : Gio::OutputStream?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "output-stream", pointerof(value), Pointer(Void).null)
      Gio::OutputStream.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def splice_finish(result : Gio::AsyncResult) : Bool
      # g_io_stream_splice_finish: (Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_io_stream_splice_finish(result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Clears the pending flag on @stream.
    def clear_pending : Nil
      # g_io_stream_clear_pending: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_io_stream_clear_pending(self)

      # Return value handling
    end

    # Closes the stream, releasing resources related to it. This will also
    # close the individual input and output streams, if they are not already
    # closed.
    #
    # Once the stream is closed, all other operations will return
    # %G_IO_ERROR_CLOSED. Closing a stream multiple times will not
    # return an error.
    #
    # Closing a stream will automatically flush any outstanding buffers
    # in the stream.
    #
    # Streams will be automatically closed when the last reference
    # is dropped, but you might want to call this function to make sure
    # resources are released as early as possible.
    #
    # Some streams might keep the backing store of the stream (e.g. a file
    # descriptor) open after the stream is closed. See the documentation for
    # the individual stream for details.
    #
    # On failure the first error that happened will be reported, but the
    # close operation will finish as much as possible. A stream that failed
    # to close will still return %G_IO_ERROR_CLOSED for all operations.
    # Still, it is important to check and report the error to the user,
    # otherwise there might be a loss of data as all data might not be written.
    #
    # If @cancellable is not NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
    # Cancelling a close will still leave the stream closed, but some streams
    # can use a faster close that doesn't block to e.g. check errors.
    #
    # The default implementation of this method just calls close on the
    # individual input/output streams.
    def close(cancellable : Gio::Cancellable?) : Bool
      # g_io_stream_close: (Method | Throws)
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
      _retval = LibGio.g_io_stream_close(self, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Requests an asynchronous close of the stream, releasing resources
    # related to it. When the operation is finished @callback will be
    # called. You can then call g_io_stream_close_finish() to get
    # the result of the operation.
    #
    # For behaviour details see g_io_stream_close().
    #
    # The asynchronous methods have a default fallback that uses threads
    # to implement asynchronicity, so they are optional for inheriting
    # classes. However, if you override one you must override all.
    def close_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_io_stream_close_async: (Method)
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
      LibGio.g_io_stream_close_async(self, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Closes a stream.
    def close_finish(result : Gio::AsyncResult) : Bool
      # g_io_stream_close_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_io_stream_close_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the input stream for this object. This is used
    # for reading.
    def input_stream : Gio::InputStream
      # g_io_stream_get_input_stream: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_io_stream_get_input_stream(self)

      # Return value handling

      Gio::InputStream.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the output stream for this object. This is used for
    # writing.
    def output_stream : Gio::OutputStream
      # g_io_stream_get_output_stream: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_io_stream_get_output_stream(self)

      # Return value handling

      Gio::OutputStream.new(_retval, GICrystal::Transfer::None)
    end

    # Checks if a stream has pending actions.
    def has_pending : Bool
      # g_io_stream_has_pending: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_io_stream_has_pending(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks if a stream is closed.
    def is_closed : Bool
      # g_io_stream_is_closed: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_io_stream_is_closed(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets @stream to have actions pending. If the pending flag is
    # already set or @stream is closed, it will return %FALSE and set
    # @error.
    def set_pending : Bool
      # g_io_stream_set_pending: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_io_stream_set_pending(self, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Asynchronously splice the output stream of @stream1 to the input stream of
    # @stream2, and splice the output stream of @stream2 to the input stream of
    # @stream1.
    #
    # When the operation is finished @callback will be called.
    # You can then call g_io_stream_splice_finish() to get the
    # result of the operation.
    def splice_async(stream2 : Gio::IOStream, flags : Gio::IOStreamSpliceFlags, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_io_stream_splice_async: (Method)
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
      LibGio.g_io_stream_splice_async(self, stream2, flags, io_priority, cancellable, callback, user_data)

      # Return value handling
    end
  end
end
