module Gio
  # #GConverter is implemented by objects that convert
  # binary data in various ways. The conversion can be
  # stateful and may fail at any place.
  #
  # Some example conversions are: character set conversion,
  # compression, decompression and regular expression
  # replace.
  module Converter
    def convert(inbuf : Enumerable(UInt8), outbuf : Enumerable(UInt8), flags : Gio::ConverterFlags, bytes_read : UInt64, bytes_written : UInt64) : Gio::ConverterResult
      # g_converter_convert: (Method | Throws)
      # @inbuf: (array length=inbuf_size element-type UInt8)
      # @outbuf: (array length=outbuf_size element-type UInt8)
      # @bytes_read: (out) (transfer full)
      # @bytes_written: (out) (transfer full)
      # Returns: (transfer none)

      inbuf_size = inbuf.size
      outbuf_size = outbuf.size
      inbuf = inbuf.to_a.to_unsafe

      outbuf = outbuf.to_a.to_unsafe

      _retval = LibGio.g_converter_convert(self, inbuf, inbuf_size, outbuf, outbuf_size, flags, bytes_read, bytes_written)
      Gio::ConverterResult.from_value(_retval)
    end

    def reset : Nil
      # g_converter_reset: (Method)
      # Returns: (transfer none)

      LibGio.g_converter_reset(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class Converter__Impl
    include Converter

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_converter_get_type
    end

    # Cast a `GObject::Object` to `Converter`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Converter")
    end

    # Cast a `GObject::Object` to `Converter`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
