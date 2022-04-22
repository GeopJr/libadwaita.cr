module Gsk
  # A color stop in a gradient node.
  class ColorStop
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

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

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGsk::ColorStop)).zero?
    end

    def offset : Float32
      _var = (@pointer + 0).as(Pointer(Float32))
      _var.value
    end

    def offset=(value : Float32)
      _var = (@pointer + 0).as(Pointer(Float32)).value = value
      value
    end

    def color : Gdk::RGBA
      _var = (@pointer + 4).as(Pointer(Void))
      Gdk::RGBA.new(_var, GICrystal::Transfer::None)
    end

    def color=(value : Gdk::RGBA)
      _var = (@pointer + 4).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGsk::ColorStop))
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
