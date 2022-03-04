module HarfBuzz
  # Data type to hold math-variant information for a glyph.
  class OtMathGlyphVariantT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibHarfBuzz::OtMathGlyphVariantT))
      @pointer.copy_from(pointer, sizeof(LibHarfBuzz::OtMathGlyphVariantT))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(glyph : UInt32? = nil, advance : Int32? = nil)
      _ptr = Pointer(Void).malloc(8)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.glyph = glyph unless glyph.nil?
      _instance.advance = advance unless advance.nil?
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

    def advance : Int32
      # Property getter
      _var = (@pointer + 4).as(Pointer(Int32))
      _var.value
    end

    def advance=(value : Int32)
      # Property setter
      _var = (@pointer + 4).as(Pointer(Int32)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibHarfBuzz.hb_gobject_ot_math_glyph_variant_get_type
    end

    def to_unsafe
      @pointer
    end
  end
end
