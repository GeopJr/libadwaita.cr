require "./filter_output_stream"
require "./pollable_output_stream"

module Gio
  # Converter output stream implements #GOutputStream and allows
  # conversion of data of various types during reading.
  #
  # As of GLib 2.34, #GConverterOutputStream implements
  # #GPollableOutputStream.
  class ConverterOutputStream < FilterOutputStream
    include PollableOutputStream

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, base_stream : Gio::OutputStream? = nil, close_base_stream : Bool? = nil, converter : Gio::Converter? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
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
      if converter
        (_names.to_unsafe + _n).value = "converter".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, converter)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ConverterOutputStream.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_converter_output_stream_get_type
    end

    def converter=(value : Gio::Converter?) : Gio::Converter?
      unsafe_value = value

      LibGObject.g_object_set(self, "converter", unsafe_value, Pointer(Void).null)
      value
    end

    def converter : Gio::Converter?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "converter", pointerof(value), Pointer(Void).null)
      Gio::Converter__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def initialize(base_stream : Gio::OutputStream, converter : Gio::Converter)
      # g_converter_output_stream_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_converter_output_stream_new(base_stream, converter)

      # Return value handling
      @pointer = _retval
    end

    def converter : Gio::Converter
      # g_converter_output_stream_get_converter: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_converter_output_stream_get_converter(self)

      # Return value handling
      Gio::Converter__Impl.new(_retval, GICrystal::Transfer::None)
    end
  end
end
