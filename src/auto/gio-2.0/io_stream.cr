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
  class IOStream < GObject::Object
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

      @pointer = LibGObject.g_object_new_with_properties(IOStream.g_type, _n, _names, _values)
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

    def splice_finish(result : Gio::AsyncResult) : Bool
      # g_io_stream_splice_finish: (Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_io_stream_splice_finish(result)
      GICrystal.to_bool(_retval)
    end

    def clear_pending : Nil
      # g_io_stream_clear_pending: (Method)
      # Returns: (transfer none)

      LibGio.g_io_stream_clear_pending(self)
    end

    def close(cancellable : Gio::Cancellable?) : Bool
      # g_io_stream_close: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_io_stream_close(self, cancellable)
      GICrystal.to_bool(_retval)
    end

    def close_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_io_stream_close_async: (Method)
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

      LibGio.g_io_stream_close_async(self, io_priority, cancellable, callback, user_data)
    end

    def close_finish(result : Gio::AsyncResult) : Bool
      # g_io_stream_close_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_io_stream_close_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def input_stream : Gio::InputStream
      # g_io_stream_get_input_stream: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_io_stream_get_input_stream(self)
      Gio::InputStream.new(_retval, GICrystal::Transfer::None)
    end

    def output_stream : Gio::OutputStream
      # g_io_stream_get_output_stream: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_io_stream_get_output_stream(self)
      Gio::OutputStream.new(_retval, GICrystal::Transfer::None)
    end

    def has_pending : Bool
      # g_io_stream_has_pending: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_io_stream_has_pending(self)
      GICrystal.to_bool(_retval)
    end

    def is_closed : Bool
      # g_io_stream_is_closed: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_io_stream_is_closed(self)
      GICrystal.to_bool(_retval)
    end

    def set_pending : Bool
      # g_io_stream_set_pending: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_io_stream_set_pending(self)
      GICrystal.to_bool(_retval)
    end

    def splice_async(stream2 : Gio::IOStream, flags : Gio::IOStreamSpliceFlags, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_io_stream_splice_async: (Method)
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

      LibGio.g_io_stream_splice_async(self, stream2, flags, io_priority, cancellable, callback, user_data)
    end
  end
end
