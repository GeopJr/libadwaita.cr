module Cairo
  class Rectangle
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibCairo::Rectangle))
      @pointer.copy_from(pointer, sizeof(LibCairo::Rectangle))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(x : Float64? = nil, y : Float64? = nil, width : Float64? = nil, height : Float64? = nil)
      _ptr = Pointer(Void).malloc(32)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.x = x unless x.nil?
      _instance.y = y unless y.nil?
      _instance.width = width unless width.nil?
      _instance.height = height unless height.nil?
      _instance
    end

    def finalize
    end

    def x : Float64
      # Property getter
      _var = (@pointer + 0).as(Pointer(Float64))
      _var.value
    end

    def x=(value : Float64)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Float64)).value = value
      value
    end

    def y : Float64
      # Property getter
      _var = (@pointer + 8).as(Pointer(Float64))
      _var.value
    end

    def y=(value : Float64)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Float64)).value = value
      value
    end

    def width : Float64
      # Property getter
      _var = (@pointer + 16).as(Pointer(Float64))
      _var.value
    end

    def width=(value : Float64)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Float64)).value = value
      value
    end

    def height : Float64
      # Property getter
      _var = (@pointer + 24).as(Pointer(Float64))
      _var.value
    end

    def height=(value : Float64)
      # Property setter
      _var = (@pointer + 24).as(Pointer(Float64)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibCairo.cairo_gobject_rectangle_get_type
    end

    def to_unsafe
      @pointer
    end
  end
end
