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
  class BufferedInputStream < FilterInputStream
    include Seekable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, base_stream : Gio::InputStream? = nil, buffer_size : UInt32? = nil, close_base_stream : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if base_stream
        (_names.to_unsafe + _n).value = "base-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, base_stream)
        _n += 1
      end
      if buffer_size
        (_names.to_unsafe + _n).value = "buffer-size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, buffer_size)
        _n += 1
      end
      if close_base_stream
        (_names.to_unsafe + _n).value = "close-base-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, close_base_stream)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(BufferedInputStream.g_type, _n, _names, _values)
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

    def initialize(base_stream : Gio::InputStream)
      # g_buffered_input_stream_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_buffered_input_stream_new(base_stream)

      # Return value handling
      @pointer = _retval
    end

    def self.new_sized(base_stream : Gio::InputStream, size : UInt64) : self
      # g_buffered_input_stream_new_sized: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_buffered_input_stream_new_sized(base_stream, size)

      # Return value handling
      Gio::BufferedInputStream.new(_retval, GICrystal::Transfer::Full)
    end

    def fill(count : Int64, cancellable : Gio::Cancellable?) : Int64
      # g_buffered_input_stream_fill: (Method | Throws)
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
      _retval = LibGio.g_buffered_input_stream_fill(self, count, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def fill_async(count : Int64, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_buffered_input_stream_fill_async: (Method)
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
      LibGio.g_buffered_input_stream_fill_async(self, count, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    def fill_finish(result : Gio::AsyncResult) : Int64
      # g_buffered_input_stream_fill_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_buffered_input_stream_fill_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def available : UInt64
      # g_buffered_input_stream_get_available: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_buffered_input_stream_get_available(self)

      # Return value handling
      _retval
    end

    def buffer_size : UInt64
      # g_buffered_input_stream_get_buffer_size: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_buffered_input_stream_get_buffer_size(self)

      # Return value handling
      _retval
    end

    def peek(buffer : Enumerable(UInt8), offset : UInt64) : UInt64
      # g_buffered_input_stream_peek: (Method)
      # @buffer: (array length=count element-type UInt8)
      # Returns: (transfer none)

      # Handle parameters
      count = buffer.size
      buffer = buffer.to_a.to_unsafe

      # C call
      _retval = LibGio.g_buffered_input_stream_peek(self, buffer, offset, count)

      # Return value handling
      _retval
    end

    def peek_buffer : Enumerable(UInt8)
      # g_buffered_input_stream_peek_buffer: (Method)
      # @count: (out) (transfer full)
      # Returns: (transfer none) (array length=count element-type UInt8)

      # Handle parameters
      count = 0_u64

      # C call
      _retval = LibGio.g_buffered_input_stream_peek_buffer(self, pointerof(count))

      # Return value handling
      GICrystal.transfer_array(_retval, count, GICrystal::Transfer::None)
    end

    def read_byte(cancellable : Gio::Cancellable?) : Int32
      # g_buffered_input_stream_read_byte: (Method | Throws)
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
      _retval = LibGio.g_buffered_input_stream_read_byte(self, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      _retval
    end

    def buffer_size=(size : UInt64) : Nil
      # g_buffered_input_stream_set_buffer_size: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_buffered_input_stream_set_buffer_size(self, size)

      # Return value handling
    end
  end
end
