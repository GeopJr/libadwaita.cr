require "./filter_output_stream"
require "./seekable"

module Gio
  # Data output stream implements #GOutputStream and includes functions for
  # writing data directly to an output stream.
  @[GObject::GeneratedWrapper]
  class DataOutputStream < FilterOutputStream
    include Seekable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::DataOutputStreamClass), class_init,
        sizeof(LibGio::DataOutputStream), instance_init, 0)
    end

    GICrystal.define_new_method(DataOutputStream, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `DataOutputStream`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, base_stream : Gio::OutputStream? = nil, byte_order : Gio::DataStreamByteOrder? = nil, close_base_stream : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !base_stream.nil?
        (_names.to_unsafe + _n).value = "base-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, base_stream)
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

      @pointer = LibGObject.g_object_new_with_properties(DataOutputStream.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_data_output_stream_get_type
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

    # Creates a new data output stream for @base_stream.
    def self.new(base_stream : Gio::OutputStream) : self
      # g_data_output_stream_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_data_output_stream_new(base_stream)

      # Return value handling

      Gio::DataOutputStream.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the byte order for the stream.
    def byte_order : Gio::DataStreamByteOrder
      # g_data_output_stream_get_byte_order: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_data_output_stream_get_byte_order(@pointer)

      # Return value handling

      Gio::DataStreamByteOrder.new(_retval)
    end

    # Puts a byte into the output stream.
    def put_byte(data : UInt8, cancellable : Gio::Cancellable?) : Bool
      # g_data_output_stream_put_byte: (Method | Throws)
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
      _retval = LibGio.g_data_output_stream_put_byte(@pointer, data, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Puts a signed 16-bit integer into the output stream.
    def put_int16(data : Int16, cancellable : Gio::Cancellable?) : Bool
      # g_data_output_stream_put_int16: (Method | Throws)
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
      _retval = LibGio.g_data_output_stream_put_int16(@pointer, data, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Puts a signed 32-bit integer into the output stream.
    def put_int32(data : Int32, cancellable : Gio::Cancellable?) : Bool
      # g_data_output_stream_put_int32: (Method | Throws)
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
      _retval = LibGio.g_data_output_stream_put_int32(@pointer, data, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Puts a signed 64-bit integer into the stream.
    def put_int64(data : Int64, cancellable : Gio::Cancellable?) : Bool
      # g_data_output_stream_put_int64: (Method | Throws)
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
      _retval = LibGio.g_data_output_stream_put_int64(@pointer, data, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Puts a string into the output stream.
    def put_string(str : ::String, cancellable : Gio::Cancellable?) : Bool
      # g_data_output_stream_put_string: (Method | Throws)
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
      _retval = LibGio.g_data_output_stream_put_string(@pointer, str, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Puts an unsigned 16-bit integer into the output stream.
    def put_uint16(data : UInt16, cancellable : Gio::Cancellable?) : Bool
      # g_data_output_stream_put_uint16: (Method | Throws)
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
      _retval = LibGio.g_data_output_stream_put_uint16(@pointer, data, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Puts an unsigned 32-bit integer into the stream.
    def put_uint32(data : UInt32, cancellable : Gio::Cancellable?) : Bool
      # g_data_output_stream_put_uint32: (Method | Throws)
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
      _retval = LibGio.g_data_output_stream_put_uint32(@pointer, data, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Puts an unsigned 64-bit integer into the stream.
    def put_uint64(data : UInt64, cancellable : Gio::Cancellable?) : Bool
      # g_data_output_stream_put_uint64: (Method | Throws)
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
      _retval = LibGio.g_data_output_stream_put_uint64(@pointer, data, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the byte order of the data output stream to @order.
    def byte_order=(order : Gio::DataStreamByteOrder) : Nil
      # g_data_output_stream_set_byte_order: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_data_output_stream_set_byte_order(@pointer, order)

      # Return value handling
    end
  end
end
