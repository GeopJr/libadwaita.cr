module HarfBuzz
  # Glyph extent values, measured in font units.
  #
  # Note that @height is negative, in coordinate systems that grow up.
  class GlyphExtentsT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibHarfBuzz::GlyphExtentsT))
      @pointer.copy_from(pointer, sizeof(LibHarfBuzz::GlyphExtentsT))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(x_bearing : Int32? = nil, y_bearing : Int32? = nil, width : Int32? = nil, height : Int32? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.x_bearing = x_bearing unless x_bearing.nil?
      _instance.y_bearing = y_bearing unless y_bearing.nil?
      _instance.width = width unless width.nil?
      _instance.height = height unless height.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibHarfBuzz::GlyphExtentsT)).zero?
    end

    def x_bearing : Int32
      _var = (@pointer + 0).as(Pointer(Int32))
      _var.value
    end

    def x_bearing=(value : Int32)
      _var = (@pointer + 0).as(Pointer(Int32)).value = value
      value
    end

    def y_bearing : Int32
      _var = (@pointer + 4).as(Pointer(Int32))
      _var.value
    end

    def y_bearing=(value : Int32)
      _var = (@pointer + 4).as(Pointer(Int32)).value = value
      value
    end

    def width : Int32
      _var = (@pointer + 8).as(Pointer(Int32))
      _var.value
    end

    def width=(value : Int32)
      _var = (@pointer + 8).as(Pointer(Int32)).value = value
      value
    end

    def height : Int32
      _var = (@pointer + 12).as(Pointer(Int32))
      _var.value
    end

    def height=(value : Int32)
      _var = (@pointer + 12).as(Pointer(Int32)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
