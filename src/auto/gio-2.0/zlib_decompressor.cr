require "../g_object-2.0/object"
require "./converter"

module Gio
  # #GZlibDecompressor is an implementation of #GConverter that
  # decompresses data compressed with zlib.
  @[GObject::GeneratedWrapper]
  class ZlibDecompressor < GObject::Object
    include Converter

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::ZlibDecompressorClass), class_init,
        sizeof(LibGio::ZlibDecompressor), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, file_info : Gio::FileInfo? = nil, format : Gio::ZlibCompressorFormat? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !file_info.nil?
        (_names.to_unsafe + _n).value = "file-info".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, file_info)
        _n += 1
      end
      if !format.nil?
        (_names.to_unsafe + _n).value = "format".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, format)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ZlibDecompressor.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_zlib_decompressor_get_type
    end

    def file_info : Gio::FileInfo?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "file-info", pointerof(value), Pointer(Void).null)
      Gio::FileInfo.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def format=(value : Gio::ZlibCompressorFormat) : Gio::ZlibCompressorFormat
      unsafe_value = value

      LibGObject.g_object_set(self, "format", unsafe_value, Pointer(Void).null)
      value
    end

    def format : Gio::ZlibCompressorFormat
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "format", pointerof(value), Pointer(Void).null)
      Gio::ZlibCompressorFormat.new(value)
    end

    # Creates a new #GZlibDecompressor.
    def initialize(format : Gio::ZlibCompressorFormat)
      # g_zlib_decompressor_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_zlib_decompressor_new(format)

      # Return value handling

      @pointer = _retval
    end

    # Retrieves the #GFileInfo constructed from the GZIP header data
    # of compressed data processed by @compressor, or %NULL if @decompressor's
    # #GZlibDecompressor:format property is not %G_ZLIB_COMPRESSOR_FORMAT_GZIP,
    # or the header data was not fully processed yet, or it not present in the
    # data stream at all.
    def file_info : Gio::FileInfo?
      # g_zlib_decompressor_get_file_info: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_zlib_decompressor_get_file_info(self)

      # Return value handling

      Gio::FileInfo.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end
  end
end
