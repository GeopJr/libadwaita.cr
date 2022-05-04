require "./filter_input_stream"
require "./pollable_input_stream"

module Gio
  # Converter input stream implements #GInputStream and allows
  # conversion of data of various types during reading.
  #
  # As of GLib 2.34, #GConverterInputStream implements
  # #GPollableInputStream.
  @[GObject::GeneratedWrapper]
  class ConverterInputStream < FilterInputStream
    include PollableInputStream

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::ConverterInputStreamClass), class_init,
        sizeof(LibGio::ConverterInputStream), instance_init, 0)
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

    def initialize(*, base_stream : Gio::InputStream? = nil, close_base_stream : Bool? = nil, converter : Gio::Converter? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !base_stream.nil?
        (_names.to_unsafe + _n).value = "base-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, base_stream)
        _n += 1
      end
      if !close_base_stream.nil?
        (_names.to_unsafe + _n).value = "close-base-stream".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, close_base_stream)
        _n += 1
      end
      if !converter.nil?
        (_names.to_unsafe + _n).value = "converter".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, converter)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ConverterInputStream.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_converter_input_stream_get_type
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

    # Creates a new converter input stream for the @base_stream.
    def initialize(base_stream : Gio::InputStream, converter : Gio::Converter)
      # g_converter_input_stream_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_converter_input_stream_new(base_stream, converter)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the #GConverter that is used by @converter_stream.
    def converter : Gio::Converter
      # g_converter_input_stream_get_converter: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_converter_input_stream_get_converter(self)

      # Return value handling

      Gio::Converter__Impl.new(_retval, GICrystal::Transfer::None)
    end
  end
end
