require "../g_object-2.0/object"
require "./converter"

module Gio
  # #GZlibCompressor is an implementation of #GConverter that
  # compresses data using zlib.
  @[GObject::GeneratedWrapper]
  class ZlibCompressor < GObject::Object
    include Converter

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::ZlibCompressorClass), class_init,
        sizeof(LibGio::ZlibCompressor), instance_init, 0)
    end

    GICrystal.define_new_method(ZlibCompressor, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ZlibCompressor`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, file_info : Gio::FileInfo? = nil, format : Gio::ZlibCompressorFormat? = nil, level : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
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
      if !level.nil?
        (_names.to_unsafe + _n).value = "level".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, level)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ZlibCompressor.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_zlib_compressor_get_type
    end

    def file_info=(value : Gio::FileInfo?) : Gio::FileInfo?
      unsafe_value = value

      LibGObject.g_object_set(self, "file-info", unsafe_value, Pointer(Void).null)
      value
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

    def level=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "level", unsafe_value, Pointer(Void).null)
      value
    end

    def level : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "level", pointerof(value), Pointer(Void).null)
      value
    end

    # Creates a new #GZlibCompressor.
    def self.new(format : Gio::ZlibCompressorFormat, level : Int32) : self
      # g_zlib_compressor_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_zlib_compressor_new(format, level)

      # Return value handling

      Gio::ZlibCompressor.new(_retval, GICrystal::Transfer::Full)
    end

    # Returns the #GZlibCompressor:file-info property.
    def file_info : Gio::FileInfo?
      # g_zlib_compressor_get_file_info: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_zlib_compressor_get_file_info(@pointer)

      # Return value handling

      Gio::FileInfo.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Sets @file_info in @compressor. If non-%NULL, and @compressor's
    # #GZlibCompressor:format property is %G_ZLIB_COMPRESSOR_FORMAT_GZIP,
    # it will be used to set the file name and modification time in
    # the GZIP header of the compressed data.
    #
    # Note: it is an error to call this function while a compression is in
    # progress; it may only be called immediately after creation of @compressor,
    # or after resetting it with g_converter_reset().
    def file_info=(file_info : Gio::FileInfo?) : Nil
      # g_zlib_compressor_set_file_info: (Method | Setter)
      # @file_info: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      file_info = if file_info.nil?
                    Pointer(Void).null
                  else
                    file_info.to_unsafe
                  end

      # C call
      LibGio.g_zlib_compressor_set_file_info(@pointer, file_info)

      # Return value handling
    end
  end
end
