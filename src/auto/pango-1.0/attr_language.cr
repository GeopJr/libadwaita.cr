module Pango
  # The `PangoAttrLanguage` structure is used to represent attributes that
  # are languages.
  class AttrLanguage
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::AttrLanguage))
      @pointer.copy_from(pointer, sizeof(LibPango::AttrLanguage))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(attr : Pango::Attribute? = nil, value : Pango::Language? = nil)
      _ptr = Pointer(Void).malloc(24)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.attr = attr unless attr.nil?
      _instance.value = value unless value.nil?
      _instance
    end

    def finalize
    end

    def attr : Pango::Attribute
      # Property getter
      _var = (@pointer + 0).as(Pointer(LibPango::Attribute))
      Pango::Attribute.new(_var.value, GICrystal::Transfer::Full)
    end

    def attr=(value : Pango::Attribute)
      # Property setter
      _var = (@pointer + 0).as(Pointer(LibPango::Attribute)).value = value.to_unsafe
      value
    end

    def value : Pango::Language
      # Property getter
      _var = (@pointer + 16).as(Pointer(Pointer(LibPango::Language)))
      Pango::Language.new(_var.value, GICrystal::Transfer::Full)
    end

    def value=(value : Pango::Language)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Pointer(LibPango::Language))).value = value.to_unsafe
      value
    end

    def self.new(language : Pango::Language) : Pango::Attribute
      # pango_attr_language_new: (None)
      # Returns: (transfer full)

      _retval = LibPango.pango_attr_language_new(language)
      Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
    end

    def to_unsafe
      @pointer
    end
  end
end
