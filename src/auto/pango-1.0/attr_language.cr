module Pango
  # The `PangoAttrLanguage` structure is used to represent attributes that
  # are languages.
  class AttrLanguage
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

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

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibPango::AttrLanguage)).zero?
    end

    def attr : Pango::Attribute
      _var = (@pointer + 0).as(Pointer(Void))
      Pango::Attribute.new(_var, GICrystal::Transfer::None)
    end

    def attr=(value : Pango::Attribute)
      _var = (@pointer + 0).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibPango::AttrLanguage))
      value
    end

    def value!
      self.value.not_nil!
    end

    def value : Pango::Language?
      _var = (@pointer + 16).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      Pango::Language.new(_var.value, GICrystal::Transfer::None)
    end

    def value=(value : Pango::Language?)
      _var = (@pointer + 16).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value.to_unsafe
      value
    end

    def self.new(language : Pango::Language) : Pango::Attribute
      # pango_attr_language_new: (None)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_attr_language_new(language)

      # Return value handling

      Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
    end

    def to_unsafe
      @pointer
    end
  end
end
