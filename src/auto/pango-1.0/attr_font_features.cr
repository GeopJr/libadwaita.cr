module Pango
  # The `PangoAttrFontFeatures` structure is used to represent OpenType
  # font features as an attribute.
  class AttrFontFeatures
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

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

    def features : ::String
      # Property getter
      _var = (@pointer + 16).as(Pointer(Pointer(LibC::Char)))
      GICrystal.transfer_full(_var.value)
    end

    def features=(value : ::String)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def self.new(features : ::String) : Pango::Attribute
      # pango_attr_font_features_new: (None)
      # Returns: (transfer full)

      _retval = LibPango.pango_attr_font_features_new(features)
      Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
    end

    def to_unsafe
      @pointer
    end
  end
end
