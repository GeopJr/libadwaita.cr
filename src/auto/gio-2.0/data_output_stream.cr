require "./filter_output_stream"
require "./seekable"

module Gio
  # Data output stream implements #GOutputStream and includes functions for
  # writing data directly to an output stream.
  class DataOutputStream < FilterOutputStream
    include Seekable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, base_stream : Gio::OutputStream? = nil, byte_order : Gio::DataStreamByteOrder? = nil, close_base_stream : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if base_stream
        (_names.to_unsafe + _n).value = "base-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, base_stream)
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

      @pointer = LibGObject.g_object_new_with_properties(DataOutputStream.g_type, _n, _names, _values)
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
      Gio::DataStreamByteOrder.from_value(value)
    end

    def initialize(base_stream : Gio::OutputStream)
      # g_data_output_stream_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_data_output_stream_new(base_stream)
      @pointer = _retval
    end

    def byte_order : Gio::DataStreamByteOrder
      # g_data_output_stream_get_byte_order: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_data_output_stream_get_byte_order(self)
      Gio::DataStreamByteOrder.from_value(_retval)
    end

    def put_byte(data : UInt8, cancellable : Gio::Cancellable?) : Bool
      # g_data_output_stream_put_byte: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_data_output_stream_put_byte(self, data, cancellable)
      GICrystal.to_bool(_retval)
    end

    def put_int16(data : Int16, cancellable : Gio::Cancellable?) : Bool
      # g_data_output_stream_put_int16: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_data_output_stream_put_int16(self, data, cancellable)
      GICrystal.to_bool(_retval)
    end

    def put_int32(data : Int32, cancellable : Gio::Cancellable?) : Bool
      # g_data_output_stream_put_int32: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_data_output_stream_put_int32(self, data, cancellable)
      GICrystal.to_bool(_retval)
    end

    def put_int64(data : Int64, cancellable : Gio::Cancellable?) : Bool
      # g_data_output_stream_put_int64: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_data_output_stream_put_int64(self, data, cancellable)
      GICrystal.to_bool(_retval)
    end

    def put_string(str : ::String, cancellable : Gio::Cancellable?) : Bool
      # g_data_output_stream_put_string: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_data_output_stream_put_string(self, str, cancellable)
      GICrystal.to_bool(_retval)
    end

    def put_uint16(data : UInt16, cancellable : Gio::Cancellable?) : Bool
      # g_data_output_stream_put_uint16: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_data_output_stream_put_uint16(self, data, cancellable)
      GICrystal.to_bool(_retval)
    end

    def put_uint32(data : UInt32, cancellable : Gio::Cancellable?) : Bool
      # g_data_output_stream_put_uint32: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_data_output_stream_put_uint32(self, data, cancellable)
      GICrystal.to_bool(_retval)
    end

    def put_uint64(data : UInt64, cancellable : Gio::Cancellable?) : Bool
      # g_data_output_stream_put_uint64: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_data_output_stream_put_uint64(self, data, cancellable)
      GICrystal.to_bool(_retval)
    end

    def byte_order=(order : Gio::DataStreamByteOrder) : Nil
      # g_data_output_stream_set_byte_order: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_data_output_stream_set_byte_order(self, order)
    end
  end
end
