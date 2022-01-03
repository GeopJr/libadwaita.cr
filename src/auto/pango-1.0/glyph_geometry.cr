module Pango
  # The `PangoGlyphGeometry` structure contains width and positioning
  # information for a single glyph.
  #
  # Note that @width is not guaranteed to be the same as the glyph
  # extents. Kerning and other positioning applied during shaping will
  # affect both the @width and the @x_offset for the glyphs in the
  # glyph string that results from shaping.
  #
  # The information in this struct is intended for rendering the glyphs,
  # as follows:
  #
  # 1. Assume the current point is (x, y)
  # 2. Render the current glyph at (x + x_offset, y + y_offset),
  # 3. Advance the current point to (x + width, y)
  # 4. Render the next glyph
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
