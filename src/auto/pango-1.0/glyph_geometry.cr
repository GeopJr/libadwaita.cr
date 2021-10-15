module Pango
  # The `PangoGlyphGeometry` structure contains width and positioning
  # information for a single glyph.
  class GlyphGeometry
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::GlyphGeometry))
      @pointer.copy_from(pointer, sizeof(LibPango::GlyphGeometry))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(width : Int32? = nil, x_offset : Int32? = nil, y_offset : Int32? = nil)
      _ptr = Pointer(Void).malloc(12)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.width = width unless width.nil?
      _instance.x_offset = x_offset unless x_offset.nil?
      _instance.y_offset = y_offset unless y_offset.nil?
      _instance
    end

    def finalize
    end

    def width : Int32
      # Property getter
      _var = (@pointer + 0).as(Pointer(Int32))
      _var.value
    end

    def width=(value : Int32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Int32)).value = value
      value
    end

    def x_offset : Int32
      # Property getter
      _var = (@pointer + 4).as(Pointer(Int32))
      _var.value
    end

    def x_offset=(value : Int32)
      # Property setter
      _var = (@pointer + 4).as(Pointer(Int32)).value = value
      value
    end

    def y_offset : Int32
      # Property getter
      _var = (@pointer + 8).as(Pointer(Int32))
      _var.value
    end

    def y_offset=(value : Int32)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Int32)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
