require "../g_object-2.0/object"
require "./converter"

module Gio
  # #GZlibDecompressor is an implementation of #GConverter that
  # decompresses data compressed with zlib.
  class ZlibDecompressor < GObject::Object
    include Converter

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, file_info : Gio::FileInfo? = nil, format : Gio::ZlibCompressorFormat? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if file_info
        (_names.to_unsafe + _n).value = "file-info".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, file_info)
        _n += 1
      end
      if format
        (_names.to_unsafe + _n).value = "format".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, format)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ZlibDecompressor.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_zlib_decompressor_get_type
    end

    def format=(value : ZlibCompressorFormat) : ZlibCompressorFormat
      unsafe_value = value

      LibGObject.g_object_set(self, "format", unsafe_value, Pointer(Void).null)
      value
    end

    def format : ZlibCompressorFormat
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "format", pointerof(value), Pointer(Void).null)
      Gio::ZlibCompressorFormat.from_value(value)
    end

    def initialize(format : Gio::ZlibCompressorFormat)
      # g_zlib_decompressor_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_zlib_decompressor_new(format)
      @pointer = _retval
    end

    def file_info : Gio::FileInfo?
      # g_zlib_decompressor_get_file_info: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_zlib_decompressor_get_file_info(self)
      Gio::FileInfo.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end
  end
end
