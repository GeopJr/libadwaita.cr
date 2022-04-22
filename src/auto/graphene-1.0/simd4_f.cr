module Graphene
  class Simd4F
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGraphene::Simd4F))
      @pointer.copy_from(pointer, sizeof(LibGraphene::Simd4F))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(x : Float32? = nil, y : Float32? = nil, z : Float32? = nil, w : Float32? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.x = x unless x.nil?
      _instance.y = y unless y.nil?
      _instance.z = z unless z.nil?
      _instance.w = w unless w.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGraphene::Simd4F)).zero?
    end

    def x : Float32
      _var = (@pointer + 0).as(Pointer(Float32))
      _var.value
    end

    def x=(value : Float32)
      _var = (@pointer + 0).as(Pointer(Float32)).value = value
      value
    end

    def y : Float32
      _var = (@pointer + 4).as(Pointer(Float32))
      _var.value
    end

    def y=(value : Float32)
      _var = (@pointer + 4).as(Pointer(Float32)).value = value
      value
    end

    def z : Float32
      _var = (@pointer + 8).as(Pointer(Float32))
      _var.value
    end

    def z=(value : Float32)
      _var = (@pointer + 8).as(Pointer(Float32)).value = value
      value
    end

    def w : Float32
      _var = (@pointer + 12).as(Pointer(Float32))
      _var.value
    end

    def w=(value : Float32)
      _var = (@pointer + 12).as(Pointer(Float32)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
