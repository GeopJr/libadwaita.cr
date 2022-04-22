module Pango
  # A `PangoGlyphInfo` structure represents a single glyph with
  # positioning information and visual attributes.
  class GlyphInfo
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::GlyphInfo))
      @pointer.copy_from(pointer, sizeof(LibPango::GlyphInfo))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(glyph : UInt32? = nil, geometry : Pango::GlyphGeometry? = nil, attr : Pango::GlyphVisAttr? = nil)
      _ptr = Pointer(Void).malloc(24)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.glyph = glyph unless glyph.nil?
      _instance.geometry = geometry unless geometry.nil?
      _instance.attr = attr unless attr.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibPango::GlyphInfo)).zero?
    end

    def glyph : UInt32
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.value
    end

    def glyph=(value : UInt32)
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value
      value
    end

    def geometry : Pango::GlyphGeometry
      _var = (@pointer + 4).as(Pointer(Void))
      Pango::GlyphGeometry.new(_var, GICrystal::Transfer::None)
    end

    def geometry=(value : Pango::GlyphGeometry)
      _var = (@pointer + 4).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibPango::GlyphInfo))
      value
    end

    def attr : Pango::GlyphVisAttr
      _var = (@pointer + 16).as(Pointer(Void))
      Pango::GlyphVisAttr.new(_var, GICrystal::Transfer::None)
    end

    def attr=(value : Pango::GlyphVisAttr)
      _var = (@pointer + 16).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibPango::GlyphInfo))
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
