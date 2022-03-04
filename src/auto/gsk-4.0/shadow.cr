module Gsk
  # The shadow parameters in a shadow node.
  class Shadow
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGsk::Shadow))
      @pointer.copy_from(pointer, sizeof(LibGsk::Shadow))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(color : Gdk::RGBA? = nil, dx : Float32? = nil, dy : Float32? = nil, radius : Float32? = nil)
      _ptr = Pointer(Void).malloc(28)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.color = color unless color.nil?
      _instance.dx = dx unless dx.nil?
      _instance.dy = dy unless dy.nil?
      _instance.radius = radius unless radius.nil?
      _instance
    end

    def finalize
    end

    def color : Gdk::RGBA
      # Property getter
      _var = (@pointer + 0).as(Pointer(Void))
      Gdk::RGBA.new(_var.value, GICrystal::Transfer::None)
    end

    def color=(value : Gdk::RGBA)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Void)).value = value.to_unsafe
      value
    end

    def dx : Float32
      # Property getter
      _var = (@pointer + 16).as(Pointer(Float32))
      _var.value
    end

    def dx=(value : Float32)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Float32)).value = value
      value
    end

    def dy : Float32
      # Property getter
      _var = (@pointer + 20).as(Pointer(Float32))
      _var.value
    end

    def dy=(value : Float32)
      # Property setter
      _var = (@pointer + 20).as(Pointer(Float32)).value = value
      value
    end

    def radius : Float32
      # Property getter
      _var = (@pointer + 24).as(Pointer(Float32))
      _var.value
    end

    def radius=(value : Float32)
      # Property setter
      _var = (@pointer + 24).as(Pointer(Float32)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
