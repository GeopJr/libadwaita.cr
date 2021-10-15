require "../g_object-2.0/object"
require "./converter"

require "./initable"

module Gio
  # #GCharsetConverter is an implementation of #GConverter based on
  # GIConv.
  class CharsetConverter < GObject::Object
    include Converter
    include Initable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, from_charset : ::String? = nil, to_charset : ::String? = nil, use_fallback : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if from_charset
        (_names.to_unsafe + _n).value = "from-charset".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, from_charset)
        _n += 1
      end
      if to_charset
        (_names.to_unsafe + _n).value = "to-charset".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, to_charset)
        _n += 1
      end
      if use_fallback
        (_names.to_unsafe + _n).value = "use-fallback".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_fallback)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(CharsetConverter.g_type, _n, _names, _values)
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

    def initialize(to_charset : ::String, from_charset : ::String)
      # g_charset_converter_new: (Constructor | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_charset_converter_new(to_charset, from_charset)
      @pointer = _retval
    end

    def num_fallbacks : UInt32
      # g_charset_converter_get_num_fallbacks: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_charset_converter_get_num_fallbacks(self)
      _retval
    end

    def use_fallback? : Bool
      # g_charset_converter_get_use_fallback: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_charset_converter_get_use_fallback(self)
      GICrystal.to_bool(_retval)
    end

    def use_fallback=(use_fallback : Bool) : Nil
      # g_charset_converter_set_use_fallback: (Method | Setter)
      # Returns: (transfer none)

      LibGio.g_charset_converter_set_use_fallback(self, use_fallback)
    end
  end
end
