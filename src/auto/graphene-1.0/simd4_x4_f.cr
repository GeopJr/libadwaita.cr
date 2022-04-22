module Graphene
  class Simd4X4F
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGraphene::Simd4X4F))
      @pointer.copy_from(pointer, sizeof(LibGraphene::Simd4X4F))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(x : Graphene::Simd4F? = nil, y : Graphene::Simd4F? = nil, z : Graphene::Simd4F? = nil, w : Graphene::Simd4F? = nil)
      _ptr = Pointer(Void).malloc(64)
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
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGraphene::Simd4X4F)).zero?
    end

    def x : Graphene::Simd4F
      _var = (@pointer + 0).as(Pointer(Void))
      Graphene::Simd4F.new(_var, GICrystal::Transfer::None)
    end

    def x=(value : Graphene::Simd4F)
      _var = (@pointer + 0).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGraphene::Simd4X4F))
      value
    end

    def y : Graphene::Simd4F
      _var = (@pointer + 16).as(Pointer(Void))
      Graphene::Simd4F.new(_var, GICrystal::Transfer::None)
    end

    def y=(value : Graphene::Simd4F)
      _var = (@pointer + 16).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGraphene::Simd4X4F))
      value
    end

    def z : Graphene::Simd4F
      _var = (@pointer + 32).as(Pointer(Void))
      Graphene::Simd4F.new(_var, GICrystal::Transfer::None)
    end

    def z=(value : Graphene::Simd4F)
      _var = (@pointer + 32).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGraphene::Simd4X4F))
      value
    end

    def w : Graphene::Simd4F
      _var = (@pointer + 48).as(Pointer(Void))
      Graphene::Simd4F.new(_var, GICrystal::Transfer::None)
    end

    def w=(value : Graphene::Simd4F)
      _var = (@pointer + 48).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGraphene::Simd4X4F))
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
