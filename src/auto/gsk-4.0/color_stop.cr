module Gsk
  # A color stop in a gradient node.
  class ColorStop
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGsk::ColorStop))
      @pointer.copy_from(pointer, sizeof(LibGsk::ColorStop))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(offset : Float32? = nil, color : Gdk::RGBA? = nil)
      _ptr = Pointer(Void).malloc(20)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.offset = offset unless offset.nil?
      _instance.color = color unless color.nil?
      _instance
    end

    def finalize
    end

    def offset : Float32
      # Property getter
      _var = (@pointer + 0).as(Pointer(Float32))
      _var.value
    end

    def offset=(value : Float32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Float32)).value = value
      value
    end

    def color : Gdk::RGBA
      # Property getter
      _var = (@pointer + 4).as(Pointer(LibGdk::RGBA))
      Gdk::RGBA.new(_var.value, GICrystal::Transfer::Full)
    end

    def color=(value : Gdk::RGBA)
      # Property setter
      _var = (@pointer + 4).as(Pointer(LibGdk::RGBA)).value = value.to_unsafe
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
