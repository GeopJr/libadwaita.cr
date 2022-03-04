require "./output_stream"

module Gio
  # Base class for output stream implementations that perform some
  # kind of filtering operation on a base stream. Typical examples
  # of filtering operations are character set conversion, compression
  # and byte order flipping.
  class FilterOutputStream < OutputStream
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, base_stream : Gio::OutputStream? = nil, close_base_stream : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if base_stream
        (_names.to_unsafe + _n).value = "base-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, base_stream)
        _n += 1
      end
      if close_base_stream
        (_names.to_unsafe + _n).value = "close-base-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, close_base_stream)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(FilterOutputStream.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_filter_output_stream_get_type
    end

    def base_stream=(value : Gio::OutputStream?) : Gio::OutputStream?
      unsafe_value = value

      LibGObject.g_object_set(self, "base-stream", unsafe_value, Pointer(Void).null)
      value
    end

    def base_stream : Gio::OutputStream?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "base-stream", pointerof(value), Pointer(Void).null)
      Gio::OutputStream.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def close_base_stream=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "close-base-stream", unsafe_value, Pointer(Void).null)
      value
    end

    def close_base_stream? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "close-base-stream", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def base_stream : Gio::OutputStream
      # g_filter_output_stream_get_base_stream: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_filter_output_stream_get_base_stream(self)

      # Return value handling
      Gio::OutputStream.new(_retval, GICrystal::Transfer::None)
    end

    def close_base_stream : Bool
      # g_filter_output_stream_get_close_base_stream: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_filter_output_stream_get_close_base_stream(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def close_base_stream=(close_base : Bool) : Nil
      # g_filter_output_stream_set_close_base_stream: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_filter_output_stream_set_close_base_stream(self, close_base)

      # Return value handling
    end
  end
end
