module HarfBuzz
  # Pairs of glyph and color index.
  class OtColorLayerT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibHarfBuzz::OtColorLayerT))
      @pointer.copy_from(pointer, sizeof(LibHarfBuzz::OtColorLayerT))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(glyph : UInt32? = nil, color_index : UInt32? = nil)
      _ptr = Pointer(Void).malloc(8)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.glyph = glyph unless glyph.nil?
      _instance.color_index = color_index unless color_index.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibHarfBuzz::OtColorLayerT)).zero?
    end

    def glyph : UInt32
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.value
    end

    def glyph=(value : UInt32)
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value
      value
    end

    def color_index : UInt32
      _var = (@pointer + 4).as(Pointer(UInt32))
      _var.value
    end

    def color_index=(value : UInt32)
      _var = (@pointer + 4).as(Pointer(UInt32)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
