module Pango
  # The `PangoAttrFontFeatures` structure is used to represent OpenType
  # font features as an attribute.
  class AttrFontFeatures
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::AttrFontFeatures))
      @pointer.copy_from(pointer, sizeof(LibPango::AttrFontFeatures))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(attr : Pango::Attribute? = nil, features : ::String? = nil)
      _ptr = Pointer(Void).malloc(24)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.attr = attr unless attr.nil?
      _instance.features = features unless features.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibPango::AttrFontFeatures)).zero?
    end

    def attr : Pango::Attribute
      _var = (@pointer + 0).as(Pointer(Void))
      Pango::Attribute.new(_var, GICrystal::Transfer::None)
    end

    def attr=(value : Pango::Attribute)
      _var = (@pointer + 0).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibPango::AttrFontFeatures))
      value
    end

    def features!
      self.features.not_nil!
    end

    def features : ::String?
      _var = (@pointer + 16).as(Pointer(Pointer(LibC::Char)))
      return if _var.value.null?
      ::String.new(_var.value)
    end

    def features=(value : ::String?)
      _var = (@pointer + 16).as(Pointer(Pointer(LibC::Char))).value = value.nil? ? Pointer(LibC::Char).null : value.to_unsafe
      value
    end

    def self.new(features : ::String) : Pango::Attribute
      # pango_attr_font_features_new: (None)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_attr_font_features_new(features)

      # Return value handling

      Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
    end

    def to_unsafe
      @pointer
    end
  end
end
