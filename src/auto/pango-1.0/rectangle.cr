module Pango
  # The `PangoRectangle` structure represents a rectangle.
  #
  # `PangoRectangle` is frequently used to represent the logical or ink
  # extents of a single glyph or section of text. (See, for instance,
  # [method@Pango.Font.get_glyph_extents].)
  class Rectangle
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::Rectangle))
      @pointer.copy_from(pointer, sizeof(LibPango::Rectangle))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(x : Int32? = nil, y : Int32? = nil, width : Int32? = nil, height : Int32? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.x = x unless x.nil?
      _instance.y = y unless y.nil?
      _instance.width = width unless width.nil?
      _instance.height = height unless height.nil?
      _instance
    end

    def finalize
    end

    def x : Int32
      # Property getter
      _var = (@pointer + 0).as(Pointer(Int32))
      _var.value
    end

    def x=(value : Int32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Int32)).value = value
      value
    end

    def y : Int32
      # Property getter
      _var = (@pointer + 4).as(Pointer(Int32))
      _var.value
    end

    def y=(value : Int32)
      # Property setter
      _var = (@pointer + 4).as(Pointer(Int32)).value = value
      value
    end

    def width : Int32
      # Property getter
      _var = (@pointer + 8).as(Pointer(Int32))
      _var.value
    end

    def width=(value : Int32)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Int32)).value = value
      value
    end

    def height : Int32
      # Property getter
      _var = (@pointer + 12).as(Pointer(Int32))
      _var.value
    end

    def height=(value : Int32)
      # Property setter
      _var = (@pointer + 12).as(Pointer(Int32)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
