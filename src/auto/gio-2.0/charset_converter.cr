require "../g_object-2.0/object"
require "./converter"

require "./initable"

module Gio
  # #GCharsetConverter is an implementation of #GConverter based on
  # GIConv.
  @[GObject::GeneratedWrapper]
  class CharsetConverter < GObject::Object
    include Converter
    include Initable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::CharsetConverterClass), class_init,
        sizeof(LibGio::CharsetConverter), instance_init, 0)
    end

    GICrystal.define_new_method(CharsetConverter, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `CharsetConverter`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, from_charset : ::String? = nil, to_charset : ::String? = nil, use_fallback : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !from_charset.nil?
        (_names.to_unsafe + _n).value = "from-charset".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, from_charset)
        _n += 1
      end
      if !to_charset.nil?
        (_names.to_unsafe + _n).value = "to-charset".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, to_charset)
        _n += 1
      end
      if !use_fallback.nil?
        (_names.to_unsafe + _n).value = "use-fallback".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_fallback)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(CharsetConverter.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_charset_converter_get_type
    end

    def from_charset=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "from-charset", unsafe_value, Pointer(Void).null)
      value
    end

    def from_charset : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "from-charset", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def to_charset=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "to-charset", unsafe_value, Pointer(Void).null)
      value
    end

    def to_charset : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "to-charset", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def use_fallback=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "use-fallback", unsafe_value, Pointer(Void).null)
      value
    end

    def use_fallback? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "use-fallback", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a new #GCharsetConverter.
    def self.new(to_charset : ::String, from_charset : ::String) : self
      # g_charset_converter_new: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_charset_converter_new(to_charset, from_charset, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::CharsetConverter.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the number of fallbacks that @converter has applied so far.
    def num_fallbacks : UInt32
      # g_charset_converter_get_num_fallbacks: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_charset_converter_get_num_fallbacks(@pointer)

      # Return value handling

      _retval
    end

    # Gets the #GCharsetConverter:use-fallback property.
    def use_fallback : Bool
      # g_charset_converter_get_use_fallback: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_charset_converter_get_use_fallback(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the #GCharsetConverter:use-fallback property.
    def use_fallback=(use_fallback : Bool) : Nil
      # g_charset_converter_set_use_fallback: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_charset_converter_set_use_fallback(@pointer, use_fallback)

      # Return value handling
    end
  end
end
