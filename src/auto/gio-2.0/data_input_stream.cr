require "./buffered_input_stream"
require "./seekable"

module Gio
  # Data input stream implements #GInputStream and includes functions for
  # reading structured data directly from a binary input stream.
  @[GObject::GeneratedWrapper]
  class DataInputStream < BufferedInputStream
    include Seekable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::DataInputStreamClass), class_init,
        sizeof(LibGio::DataInputStream), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, base_stream : Gio::InputStream? = nil, buffer_size : UInt32? = nil, byte_order : Gio::DataStreamByteOrder? = nil, close_base_stream : Bool? = nil, newline_type : Gio::DataStreamNewlineType? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
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
      if !byte_order.nil?
        (_names.to_unsafe + _n).value = "byte-order".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, byte_order)
        _n += 1
      end
      if !close_base_stream.nil?
        (_names.to_unsafe + _n).value = "close-base-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, close_base_stream)
        _n += 1
      end
      if !newline_type.nil?
        (_names.to_unsafe + _n).value = "newline-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, newline_type)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DataInputStream.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_data_input_stream_get_type
    end

    def byte_order=(value : Gio::DataStreamByteOrder) : Gio::DataStreamByteOrder
      unsafe_value = value

      LibGObject.g_object_set(self, "byte-order", unsafe_value, Pointer(Void).null)
      value
    end

    def byte_order : Gio::DataStreamByteOrder
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "byte-order", pointerof(value), Pointer(Void).null)
      Gio::DataStreamByteOrder.new(value)
    end

    def newline_type=(value : Gio::DataStreamNewlineType) : Gio::DataStreamNewlineType
      unsafe_value = value

      LibGObject.g_object_set(self, "newline-type", unsafe_value, Pointer(Void).null)
      value
    end

    def newline_type : Gio::DataStreamNewlineType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "newline-type", pointerof(value), Pointer(Void).null)
      Gio::DataStreamNewlineType.new(value)
    end

    # Creates a new data input stream for the @base_stream.
    def initialize(base_stream : Gio::InputStream)
      # g_data_input_stream_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_data_input_stream_new(base_stream)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the byte order for the data input stream.
    def byte_order : Gio::DataStreamByteOrder
      # g_data_input_stream_get_byte_order: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_data_input_stream_get_byte_order(self)

      # Return value handling

      Gio::DataStreamByteOrder.new(_retval)
    end

    # Gets the current newline type for the @stream.
    def newline_type : Gio::DataStreamNewlineType
      # g_data_input_stream_get_newline_type: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_data_input_stream_get_newline_type(self)

      # Return value handling

      Gio::DataStreamNewlineType.new(_retval)
    end

    # Reads an unsigned 8-bit/1-byte value from @stream.
    def read_byte(cancellable : Gio::Cancellable?) : UInt8
      # g_data_input_stream_read_byte: (Method | Throws)
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
      _retval = LibGio.g_data_input_stream_read_byte(self, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Reads a 16-bit/2-byte value from @stream.
    #
    # In order to get the correct byte order for this read operation,
    # see g_data_input_stream_get_byte_order() and g_data_input_stream_set_byte_order().
    def read_int16(cancellable : Gio::Cancellable?) : Int16
      # g_data_input_stream_read_int16: (Method | Throws)
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
      _retval = LibGio.g_data_input_stream_read_int16(self, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Reads a signed 32-bit/4-byte value from @stream.
    #
    # In order to get the correct byte order for this read operation,
    # see g_data_input_stream_get_byte_order() and g_data_input_stream_set_byte_order().
    #
    # If @cancellable is not %NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
    def read_int32(cancellable : Gio::Cancellable?) : Int32
      # g_data_input_stream_read_int32: (Method | Throws)
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
      _retval = LibGio.g_data_input_stream_read_int32(self, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Reads a 64-bit/8-byte value from @stream.
    #
    # In order to get the correct byte order for this read operation,
    # see g_data_input_stream_get_byte_order() and g_data_input_stream_set_byte_order().
    #
    # If @cancellable is not %NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
    def read_int64(cancellable : Gio::Cancellable?) : Int64
      # g_data_input_stream_read_int64: (Method | Throws)
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
      _retval = LibGio.g_data_input_stream_read_int64(self, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Reads a line from the data input stream.  Note that no encoding
    # checks or conversion is performed; the input is not guaranteed to
    # be UTF-8, and may in fact have embedded NUL characters.
    #
    # If @cancellable is not %NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
    def read_line(cancellable : Gio::Cancellable?) : Enumerable(UInt8)?
      # g_data_input_stream_read_line: (Method | Throws)
      # @length: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer full) (array zero-terminated=1 element-type UInt8)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      length = Pointer(UInt64).null # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_data_input_stream_read_line(self, length, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # The asynchronous version of g_data_input_stream_read_line().  It is
    # an error to have two outstanding calls to this function.
    #
    # When the operation is finished, @callback will be called. You
    # can then call g_data_input_stream_read_line_finish() to get
    # the result of the operation.
    def read_line_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_data_input_stream_read_line_async: (Method)
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
      LibGio.g_data_input_stream_read_line_async(self, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finish an asynchronous call started by
    # g_data_input_stream_read_line_async().  Note the warning about
    # string encoding in g_data_input_stream_read_line() applies here as
    # well.
    def read_line_finish(result : Gio::AsyncResult) : Enumerable(UInt8)?
      # g_data_input_stream_read_line_finish: (Method | Throws)
      # @length: (out) (transfer full) (optional)
      # Returns: (transfer full) (array zero-terminated=1 element-type UInt8)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      length = Pointer(UInt64).null
      # C call
      _retval = LibGio.g_data_input_stream_read_line_finish(self, result, length, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Finish an asynchronous call started by
    # g_data_input_stream_read_line_async().
    def read_line_finish_utf8(result : Gio::AsyncResult) : ::String?
      # g_data_input_stream_read_line_finish_utf8: (Method | Throws)
      # @length: (out) (transfer full) (optional)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      length = Pointer(UInt64).null
      # C call
      _retval = LibGio.g_data_input_stream_read_line_finish_utf8(self, result, length, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    # Reads a UTF-8 encoded line from the data input stream.
    #
    # If @cancellable is not %NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
    def read_line_utf8(cancellable : Gio::Cancellable?) : ::String?
      # g_data_input_stream_read_line_utf8: (Method | Throws)
      # @length: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      length = Pointer(UInt64).null # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_data_input_stream_read_line_utf8(self, length, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    # Reads an unsigned 16-bit/2-byte value from @stream.
    #
    # In order to get the correct byte order for this read operation,
    # see g_data_input_stream_get_byte_order() and g_data_input_stream_set_byte_order().
    def read_uint16(cancellable : Gio::Cancellable?) : UInt16
      # g_data_input_stream_read_uint16: (Method | Throws)
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
      _retval = LibGio.g_data_input_stream_read_uint16(self, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Reads an unsigned 32-bit/4-byte value from @stream.
    #
    # In order to get the correct byte order for this read operation,
    # see g_data_input_stream_get_byte_order() and g_data_input_stream_set_byte_order().
    #
    # If @cancellable is not %NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
    def read_uint32(cancellable : Gio::Cancellable?) : UInt32
      # g_data_input_stream_read_uint32: (Method | Throws)
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
      _retval = LibGio.g_data_input_stream_read_uint32(self, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Reads an unsigned 64-bit/8-byte value from @stream.
    #
    # In order to get the correct byte order for this read operation,
    # see g_data_input_stream_get_byte_order().
    #
    # If @cancellable is not %NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
    def read_uint64(cancellable : Gio::Cancellable?) : UInt64
      # g_data_input_stream_read_uint64: (Method | Throws)
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
      _retval = LibGio.g_data_input_stream_read_uint64(self, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    # Reads a string from the data input stream, up to the first
    # occurrence of any of the stop characters.
    #
    # Note that, in contrast to g_data_input_stream_read_until_async(),
    # this function consumes the stop character that it finds.
    #
    # Don't use this function in new code.  Its functionality is
    # inconsistent with g_data_input_stream_read_until_async().  Both
    # functions will be marked as deprecated in a future release.  Use
    # g_data_input_stream_read_upto() instead, but note that that function
    # does not consume the stop character.
    def read_until(stop_chars : ::String, cancellable : Gio::Cancellable?) : ::String
      # g_data_input_stream_read_until: (Method | Throws)
      # @length: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      length = Pointer(UInt64).null # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_data_input_stream_read_until(self, stop_chars, length, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    # The asynchronous version of g_data_input_stream_read_until().
    # It is an error to have two outstanding calls to this function.
    #
    # Note that, in contrast to g_data_input_stream_read_until(),
    # this function does not consume the stop character that it finds.  You
    # must read it for yourself.
    #
    # When the operation is finished, @callback will be called. You
    # can then call g_data_input_stream_read_until_finish() to get
    # the result of the operation.
    #
    # Don't use this function in new code.  Its functionality is
    # inconsistent with g_data_input_stream_read_until().  Both functions
    # will be marked as deprecated in a future release.  Use
    # g_data_input_stream_read_upto_async() instead.
    def read_until_async(stop_chars : ::String, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_data_input_stream_read_until_async: (Method)
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
      LibGio.g_data_input_stream_read_until_async(self, stop_chars, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finish an asynchronous call started by
    # g_data_input_stream_read_until_async().
    def read_until_finish(result : Gio::AsyncResult) : ::String
      # g_data_input_stream_read_until_finish: (Method | Throws)
      # @length: (out) (transfer full) (optional)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      length = Pointer(UInt64).null
      # C call
      _retval = LibGio.g_data_input_stream_read_until_finish(self, result, length, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    # Reads a string from the data input stream, up to the first
    # occurrence of any of the stop characters.
    #
    # In contrast to g_data_input_stream_read_until(), this function
    # does not consume the stop character. You have to use
    # g_data_input_stream_read_byte() to get it before calling
    # g_data_input_stream_read_upto() again.
    #
    # Note that @stop_chars may contain '\0' if @stop_chars_len is
    # specified.
    #
    # The returned string will always be nul-terminated on success.
    def read_upto(stop_chars : ::String, stop_chars_len : Int64, cancellable : Gio::Cancellable?) : ::String
      # g_data_input_stream_read_upto: (Method | Throws)
      # @length: (out) (transfer full) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      length = Pointer(UInt64).null # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_data_input_stream_read_upto(self, stop_chars, stop_chars_len, length, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    # The asynchronous version of g_data_input_stream_read_upto().
    # It is an error to have two outstanding calls to this function.
    #
    # In contrast to g_data_input_stream_read_until(), this function
    # does not consume the stop character. You have to use
    # g_data_input_stream_read_byte() to get it before calling
    # g_data_input_stream_read_upto() again.
    #
    # Note that @stop_chars may contain '\0' if @stop_chars_len is
    # specified.
    #
    # When the operation is finished, @callback will be called. You
    # can then call g_data_input_stream_read_upto_finish() to get
    # the result of the operation.
    def read_upto_async(stop_chars : ::String, stop_chars_len : Int64, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_data_input_stream_read_upto_async: (Method)
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
      LibGio.g_data_input_stream_read_upto_async(self, stop_chars, stop_chars_len, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finish an asynchronous call started by
    # g_data_input_stream_read_upto_async().
    #
    # Note that this function does not consume the stop character. You
    # have to use g_data_input_stream_read_byte() to get it before calling
    # g_data_input_stream_read_upto_async() again.
    #
    # The returned string will always be nul-terminated on success.
    def read_upto_finish(result : Gio::AsyncResult) : ::String
      # g_data_input_stream_read_upto_finish: (Method | Throws)
      # @length: (out) (transfer full) (optional)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      length = Pointer(UInt64).null
      # C call
      _retval = LibGio.g_data_input_stream_read_upto_finish(self, result, length, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    # This function sets the byte order for the given @stream. All subsequent
    # reads from the @stream will be read in the given @order.
    def byte_order=(order : Gio::DataStreamByteOrder) : Nil
      # g_data_input_stream_set_byte_order: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_data_input_stream_set_byte_order(self, order)

      # Return value handling
    end

    # Sets the newline type for the @stream.
    #
    # Note that using G_DATA_STREAM_NEWLINE_TYPE_ANY is slightly unsafe. If a read
    # chunk ends in "CR" we must read an additional byte to know if this is "CR" or
    # "CR LF", and this might block if there is no more data available.
    def newline_type=(type : Gio::DataStreamNewlineType) : Nil
      # g_data_input_stream_set_newline_type: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_data_input_stream_set_newline_type(self, type)

      # Return value handling
    end
  end
end
