require "./buffered_input_stream"
require "./seekable"

module Gio
  # Data input stream implements #GInputStream and includes functions for
  # reading structured data directly from a binary input stream.
  class DataInputStream < BufferedInputStream
    include Seekable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, base_stream : Gio::InputStream? = nil, buffer_size : UInt32? = nil, byte_order : Gio::DataStreamByteOrder? = nil, close_base_stream : Bool? = nil, newline_type : Gio::DataStreamNewlineType? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
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
      if byte_order
        (_names.to_unsafe + _n).value = "byte-order".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, byte_order)
        _n += 1
      end
      if close_base_stream
        (_names.to_unsafe + _n).value = "close-base-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, close_base_stream)
        _n += 1
      end
      if newline_type
        (_names.to_unsafe + _n).value = "newline-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, newline_type)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DataInputStream.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_data_input_stream_get_type
    end

    def initialize(base_stream : Gio::InputStream)
      # g_data_input_stream_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_data_input_stream_new(base_stream)
      @pointer = _retval
    end

    def byte_order : Gio::DataStreamByteOrder
      # g_data_input_stream_get_byte_order: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_data_input_stream_get_byte_order(self)
      Gio::DataStreamByteOrder.from_value(_retval)
    end

    def newline_type : Gio::DataStreamNewlineType
      # g_data_input_stream_get_newline_type: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_data_input_stream_get_newline_type(self)
      Gio::DataStreamNewlineType.from_value(_retval)
    end

    def read_byte(cancellable : Gio::Cancellable?) : UInt8
      # g_data_input_stream_read_byte: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_data_input_stream_read_byte(self, cancellable)
      _retval
    end

    def read_int16(cancellable : Gio::Cancellable?) : Int16
      # g_data_input_stream_read_int16: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_data_input_stream_read_int16(self, cancellable)
      _retval
    end

    def read_int32(cancellable : Gio::Cancellable?) : Int32
      # g_data_input_stream_read_int32: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_data_input_stream_read_int32(self, cancellable)
      _retval
    end

    def read_int64(cancellable : Gio::Cancellable?) : Int64
      # g_data_input_stream_read_int64: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_data_input_stream_read_int64(self, cancellable)
      _retval
    end

    def read_line(cancellable : Gio::Cancellable?) : Enumerable(UInt8)?
      # g_data_input_stream_read_line: (Method | Throws)
      # @length: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      length = Pointer(UInt64).null
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_data_input_stream_read_line(self, length, cancellable)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def read_line_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_data_input_stream_read_line_async: (Method)
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

      LibGio.g_data_input_stream_read_line_async(self, io_priority, cancellable, callback, user_data)
    end

    def read_line_finish(result : Gio::AsyncResult) : Enumerable(UInt8)?
      # g_data_input_stream_read_line_finish: (Method | Throws)
      # @length: (out) (transfer full) (optional)
      # Returns: (transfer full)

      length = Pointer(UInt64).null

      _retval = LibGio.g_data_input_stream_read_line_finish(self, result, length)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def read_line_finish_utf8(result : Gio::AsyncResult) : ::String?
      # g_data_input_stream_read_line_finish_utf8: (Method | Throws)
      # @length: (out) (transfer full) (optional)
      # Returns: (transfer full)

      length = Pointer(UInt64).null

      _retval = LibGio.g_data_input_stream_read_line_finish_utf8(self, result, length)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def read_line_utf8(cancellable : Gio::Cancellable?) : ::String?
      # g_data_input_stream_read_line_utf8: (Method | Throws)
      # @length: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      length = Pointer(UInt64).null
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_data_input_stream_read_line_utf8(self, length, cancellable)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def read_uint16(cancellable : Gio::Cancellable?) : UInt16
      # g_data_input_stream_read_uint16: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_data_input_stream_read_uint16(self, cancellable)
      _retval
    end

    def read_uint32(cancellable : Gio::Cancellable?) : UInt32
      # g_data_input_stream_read_uint32: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_data_input_stream_read_uint32(self, cancellable)
      _retval
    end

    def read_uint64(cancellable : Gio::Cancellable?) : UInt64
      # g_data_input_stream_read_uint64: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_data_input_stream_read_uint64(self, cancellable)
      _retval
    end

    def read_until(stop_chars : ::String, cancellable : Gio::Cancellable?) : ::String
      # g_data_input_stream_read_until: (Method | Throws)
      # @length: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      length = Pointer(UInt64).null
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_data_input_stream_read_until(self, stop_chars, length, cancellable)
      GICrystal.transfer_full(_retval)
    end

    def read_until_async(stop_chars : ::String, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_data_input_stream_read_until_async: (Method)
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

      LibGio.g_data_input_stream_read_until_async(self, stop_chars, io_priority, cancellable, callback, user_data)
    end

    def read_until_finish(result : Gio::AsyncResult) : ::String
      # g_data_input_stream_read_until_finish: (Method | Throws)
      # @length: (out) (transfer full) (optional)
      # Returns: (transfer full)

      length = Pointer(UInt64).null

      _retval = LibGio.g_data_input_stream_read_until_finish(self, result, length)
      GICrystal.transfer_full(_retval)
    end

    def read_upto(stop_chars : ::String, stop_chars_len : Int64, cancellable : Gio::Cancellable?) : ::String
      # g_data_input_stream_read_upto: (Method | Throws)
      # @length: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      length = Pointer(UInt64).null
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_data_input_stream_read_upto(self, stop_chars, stop_chars_len, length, cancellable)
      GICrystal.transfer_full(_retval)
    end

    def read_upto_async(stop_chars : ::String, stop_chars_len : Int64, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_data_input_stream_read_upto_async: (Method)
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

      LibGio.g_data_input_stream_read_upto_async(self, stop_chars, stop_chars_len, io_priority, cancellable, callback, user_data)
    end

    def read_upto_finish(result : Gio::AsyncResult) : ::String
      # g_data_input_stream_read_upto_finish: (Method | Throws)
      # @length: (out) (transfer full) (optional)
      # Returns: (transfer full)

      length = Pointer(UInt64).null

      _retval = LibGio.g_data_input_stream_read_upto_finish(self, result, length)
      GICrystal.transfer_full(_retval)
    end

    def byte_order=(order : Gio::DataStreamByteOrder) : Nil
      # g_data_input_stream_set_byte_order: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_data_input_stream_set_byte_order(self, order)
    end

    def newline_type=(type : Gio::DataStreamNewlineType) : Nil
      # g_data_input_stream_set_newline_type: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_data_input_stream_set_newline_type(self, type)
    end
  end
end
