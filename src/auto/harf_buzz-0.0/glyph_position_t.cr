module HarfBuzz
  # The #hb_glyph_position_t is the structure that holds the positions of the
  # glyph in both horizontal and vertical directions. All positions in
  # #hb_glyph_position_t are relative to the current point.
  class GlyphPositionT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibHarfBuzz::GlyphPositionT))
      @pointer.copy_from(pointer, sizeof(LibHarfBuzz::GlyphPositionT))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(x_advance : Int32? = nil, y_advance : Int32? = nil, x_offset : Int32? = nil, y_offset : Int32? = nil, var : HarfBuzz::VarIntT? = nil)
      _ptr = Pointer(Void).malloc(20)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.x_advance = x_advance unless x_advance.nil?
      _instance.y_advance = y_advance unless y_advance.nil?
      _instance.x_offset = x_offset unless x_offset.nil?
      _instance.y_offset = y_offset unless y_offset.nil?
      _instance.var = var unless var.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibHarfBuzz::GlyphPositionT)).zero?
    end

    def x_advance : Int32
      _var = (@pointer + 0).as(Pointer(Int32))
      _var.value
    end

    def x_advance=(value : Int32)
      _var = (@pointer + 0).as(Pointer(Int32)).value = value
      value
    end

    def y_advance : Int32
      _var = (@pointer + 4).as(Pointer(Int32))
      _var.value
    end

    def y_advance=(value : Int32)
      _var = (@pointer + 4).as(Pointer(Int32)).value = value
      value
    end

    def x_offset : Int32
      _var = (@pointer + 8).as(Pointer(Int32))
      _var.value
    end

    def x_offset=(value : Int32)
      _var = (@pointer + 8).as(Pointer(Int32)).value = value
      value
    end

    def y_offset : Int32
      _var = (@pointer + 12).as(Pointer(Int32))
      _var.value
    end

    def y_offset=(value : Int32)
      _var = (@pointer + 12).as(Pointer(Int32)).value = value
      value
    end

    def var : HarfBuzz::VarIntT
      _var = (@pointer + 16).as(Pointer(LibHarfBuzz::VarIntT))
      HarfBuzz::VarIntT.new(_var, GICrystal::Transfer::None)
    end

    def var=(value : HarfBuzz::VarIntT)
      _var = (@pointer + 16).as(Pointer(LibHarfBuzz::VarIntT))
      _var.copy_from(value.to_unsafe, sizeof(LibHarfBuzz::GlyphPositionT))
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibHarfBuzz.hb_gobject_glyph_position_get_type
    end

    def to_unsafe
      @pointer
    end
  end
end
