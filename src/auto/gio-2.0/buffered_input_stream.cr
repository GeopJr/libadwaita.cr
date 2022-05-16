require "./filter_input_stream"
require "./seekable"

module Gio
  # Buffered input stream implements #GFilterInputStream and provides
  # for buffered reads.
  #
  # By default, #GBufferedInputStream's buffer size is set at 4 kilobytes.
  #
  # To create a buffered input stream, use g_buffered_input_stream_new(),
  # or g_buffered_input_stream_new_sized() to specify the buffer's size at
  # construction.
  #
  # To get the size of a buffer within a buffered input stream, use
  # g_buffered_input_stream_get_buffer_size(). To change the size of a
  # buffered input stream's buffer, use
  # g_buffered_input_stream_set_buffer_size(). Note that the buffer's size
  # cannot be reduced below the size of the data within the buffer.
  @[GObject::GeneratedWrapper]
  class BufferedInputStream < FilterInputStream
    include Seekable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::BufferedInputStreamClass), class_init,
        sizeof(LibGio::BufferedInputStream), instance_init, 0)
    end

    GICrystal.define_new_method(BufferedInputStream, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `BufferedInputStream`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, base_stream : Gio::InputStream? = nil, buffer_size : UInt32? = nil, close_base_stream : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !base_stream.nil?
        (_names.to_unsafe + _n).value = "base-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, base_stream)
        _n += 1
      end
      if !buffer_size.nil?
        (_names.to_unsafe + _n).value = "buffer-size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, buffer_size)
        _n += 1
      end
      if !close_base_stream.nil?
        (_names.to_unsafe + _n).value = "close-base-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, close_base_stream)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(BufferedInputStream.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_buffered_input_stream_get_type
    end

    def buffer_size=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "buffer-size", unsafe_value, Pointer(Void).null)
      value
    end

    def buffer_size : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "buffer-size", pointerof(value), Pointer(Void).null)
      value
    end

    # Creates a new #GInputStream from the given @base_stream, with
    # a buffer set to the default size (4 kilobytes).
    def initialize(base_stream : Gio::InputStream)
      # g_buffered_input_stream_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_buffered_input_stream_new(base_stream)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Creates a new #GBufferedInputStream from the given @base_stream,
    # with a buffer set to @size.
    def self.new_sized(base_stream : Gio::InputStream, size : UInt64) : self
      # g_buffered_input_stream_new_sized: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_buffered_input_stream_new_sized(base_stream, size)

      # Return value handling

      Gio::BufferedInputStream.new(_retval, GICrystal::Transfer::Full)
    end

    # Tries to read @count bytes from the stream into the buffer.
    # Will block during this read.
    #
    # If @count is zero, returns zero and does nothing. A value of @count
    # larger than %G_MAXSSIZE will cause a %G_IO_ERROR_INVALID_ARGUMENT error.
    #
    # On success, the number of bytes read into the buffer is returned.
    # It is not an error if this is not the same as the requested size, as it
    # can happen e.g. near the end of a file. Zero is returned on end of file
    # (or if @count is zero),  but never otherwise.
    #
    # If @count is -1 then the attempted read size is equal to the number of
    # bytes that are required to fill the buffer.
    #
    # If @cancellable is not %NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. If an
    # operation was partially finished when the operation was cancelled the
    # partial result will be returned, without an error.
    #
    # On error -1 is returned and @error is set accordingly.
    #
    # For the asynchronous, non-blocking, version of this function, see
    # g_buffered_input_stream_fill_async().
    def fill(count : Int64, cancellable : Gio::Cancellable?) : Int64
      # g_buffered_input_stream_fill: (Method | Throws)
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
      _retval = LibGio.g_buffered_input_stream_fill(@pointer, count, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Reads data into @stream's buffer asynchronously, up to @count size.
    # @io_priority can be used to prioritize reads. For the synchronous
    # version of this function, see g_buffered_input_stream_fill().
    #
    # If @count is -1 then the attempted read size is equal to the number
    # of bytes that are required to fill the buffer.
    def fill_async(count : Int64, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_buffered_input_stream_fill_async: (Method)
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
      LibGio.g_buffered_input_stream_fill_async(@pointer, count, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes an asynchronous read.
    def fill_finish(result : Gio::AsyncResult) : Int64
      # g_buffered_input_stream_fill_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_buffered_input_stream_fill_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Gets the size of the available data within the stream.
    def available : UInt64
      # g_buffered_input_stream_get_available: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_buffered_input_stream_get_available(@pointer)

      # Return value handling

      _retval
    end

    # Gets the size of the input buffer.
    def buffer_size : UInt64
      # g_buffered_input_stream_get_buffer_size: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_buffered_input_stream_get_buffer_size(@pointer)

      # Return value handling

      _retval
    end

    # Peeks in the buffer, copying data of size @count into @buffer,
    # offset @offset bytes.
    def peek(buffer : Enumerable(UInt8), offset : UInt64) : UInt64
      # g_buffered_input_stream_peek: (Method)
      # @buffer: (array length=count element-type UInt8)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      count = buffer.size # Generator::ArrayArgPlan
      buffer = buffer.to_a.to_unsafe

      # C call
      _retval = LibGio.g_buffered_input_stream_peek(@pointer, buffer, offset, count)

      # Return value handling

      _retval
    end

    # Returns the buffer with the currently available bytes. The returned
    # buffer must not be modified and will become invalid when reading from
    # the stream or filling the buffer.
    def peek_buffer : Enumerable(UInt8)
      # g_buffered_input_stream_peek_buffer: (Method)
      # @count: (out) (transfer full)
      # Returns: (transfer none) (array length=count element-type UInt8)

      # Generator::OutArgUsedInReturnPlan
      count = 0_u64
      # C call
      _retval = LibGio.g_buffered_input_stream_peek_buffer(@pointer, pointerof(count))

      # Return value handling

      GICrystal.transfer_array(_retval, count, GICrystal::Transfer::None)
    end

    # Tries to read a single byte from the stream or the buffer. Will block
    # during this read.
    #
    # On success, the byte read from the stream is returned. On end of stream
    # -1 is returned but it's not an exceptional error and @error is not set.
    #
    # If @cancellable is not %NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be returned. If an
    # operation was partially finished when the operation was cancelled the
    # partial result will be returned, without an error.
    #
    # On error -1 is returned and @error is set accordingly.
    def read_byte(cancellable : Gio::Cancellable?) : Int32
      # g_buffered_input_stream_read_byte: (Method | Throws)
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
      _retval = LibGio.g_buffered_input_stream_read_byte(@pointer, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Sets the size of the internal buffer of @stream to @size, or to the
    # size of the contents of the buffer. The buffer can never be resized
    # smaller than its current contents.
    def buffer_size=(size : UInt64) : Nil
      # g_buffered_input_stream_set_buffer_size: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_buffered_input_stream_set_buffer_size(@pointer, size)

      # Return value handling
    end
  end
end
