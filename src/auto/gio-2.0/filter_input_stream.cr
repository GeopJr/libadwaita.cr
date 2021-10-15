require "./input_stream"

module Gio
  # Base class for input stream implementations that perform some
  # kind of filtering operation on a base stream. Typical examples
  # of filtering operations are character set conversion, compression
  # and byte order flipping.
  class FilterInputStream < InputStream
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, base_stream : Gio::InputStream? = nil, close_base_stream : Bool? = nil)
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

      @pointer = LibGObject.g_object_new_with_properties(FilterInputStream.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_filter_input_stream_get_type
    end

    def base_stream=(value : InputStream?) : InputStream?
      unsafe_value = value

      LibGObject.g_object_set(self, "base-stream", unsafe_value, Pointer(Void).null)
      value
    end

    def base_stream : Gio::InputStream
      # g_filter_input_stream_get_base_stream: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_filter_input_stream_get_base_stream(self)
      Gio::InputStream.new(_retval, GICrystal::Transfer::None)
    end

    def close_base_stream? : Bool
      # g_filter_input_stream_get_close_base_stream: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_filter_input_stream_get_close_base_stream(self)
      GICrystal.to_bool(_retval)
    end

    def close_base_stream=(close_base : Bool) : Nil
      # g_filter_input_stream_set_close_base_stream: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_filter_input_stream_set_close_base_stream(self, close_base)
    end
  end
end
