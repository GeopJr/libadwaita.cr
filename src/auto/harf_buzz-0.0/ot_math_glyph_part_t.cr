module HarfBuzz
  # Data type to hold information for a "part" component of a math-variant glyph.
  # Large variants for stretchable math glyphs (such as parentheses) can be constructed
  # on the fly from parts.
  class OtMathGlyphPartT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibHarfBuzz::OtMathGlyphPartT))
      @pointer.copy_from(pointer, sizeof(LibHarfBuzz::OtMathGlyphPartT))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(glyph : UInt32? = nil, start_connector_length : Int32? = nil, end_connector_length : Int32? = nil, full_advance : Int32? = nil, flags : HarfBuzz::OtMathGlyphPartFlagsT? = nil)
      _ptr = Pointer(Void).malloc(20)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.glyph = glyph unless glyph.nil?
      _instance.start_connector_length = start_connector_length unless start_connector_length.nil?
      _instance.end_connector_length = end_connector_length unless end_connector_length.nil?
      _instance.full_advance = full_advance unless full_advance.nil?
      _instance.flags = flags unless flags.nil?
      _instance
    end

    def finalize
    end

    def glyph : UInt32
      # Property getter
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.value
    end

    def glyph=(value : UInt32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value
      value
    end

    def start_connector_length : Int32
      # Property getter
      _var = (@pointer + 4).as(Pointer(Int32))
      _var.value
    end

    def start_connector_length=(value : Int32)
      # Property setter
      _var = (@pointer + 4).as(Pointer(Int32)).value = value
      value
    end

    def end_connector_length : Int32
      # Property getter
      _var = (@pointer + 8).as(Pointer(Int32))
      _var.value
    end

    def end_connector_length=(value : Int32)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Int32)).value = value
      value
    end

    def full_advance : Int32
      # Property getter
      _var = (@pointer + 12).as(Pointer(Int32))
      _var.value
    end

    def full_advance=(value : Int32)
      # Property setter
      _var = (@pointer + 12).as(Pointer(Int32)).value = value
      value
    end

    def flags : HarfBuzz::OtMathGlyphPartFlagsT
      # Property getter
      _var = (@pointer + 16).as(Pointer(UInt32))
      HarfBuzz::OtMathGlyphPartFlagsT.from_value(_var.value)
    end

    def flags=(value : HarfBuzz::OtMathGlyphPartFlagsT)
      # Property setter
      _var = (@pointer + 16).as(Pointer(UInt32)).value = value.to_unsafe
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibHarfBuzz.hb_gobject_ot_math_glyph_part_get_type
    end

    def to_unsafe
      @pointer
    end
  end
end
