module Graphene
  # A point with two coordinates.
  class Point
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGraphene::Point))
      @pointer.copy_from(pointer, sizeof(LibGraphene::Point))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(x : Float32? = nil, y : Float32? = nil)
      _ptr = Pointer(Void).malloc(8)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.x = x unless x.nil?
      _instance.y = y unless y.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGraphene::Point)).zero?
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

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGraphene.graphene_point_get_type
    end

    def self.alloc : self
      # graphene_point_alloc: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGraphene.graphene_point_alloc

      # Return value handling

      Graphene::Point.new(_retval, GICrystal::Transfer::Full)
    end

    def distance(b : Graphene::Point) : Float32
      # graphene_point_distance: (Method)
      # @d_x: (out) (transfer full) (optional)
      # @d_y: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      d_x = Pointer(Float32).null
      # Generator::OutArgUsedInReturnPlan
      d_y = Pointer(Float32).null

      # C call
      _retval = LibGraphene.graphene_point_distance(self, b, d_x, d_y)

      # Return value handling

      _retval
    end

    def equal(b : Graphene::Point) : Bool
      # graphene_point_equal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_point_equal(self, b)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # graphene_point_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_point_free(self)

      # Return value handling
    end

    def init(x : Float32, y : Float32) : Graphene::Point
      # graphene_point_init: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_point_init(self, x, y)

      # Return value handling

      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_point(src : Graphene::Point) : Graphene::Point
      # graphene_point_init_from_point: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_point_init_from_point(self, src)

      # Return value handling

      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_vec2(src : Graphene::Vec2) : Graphene::Point
      # graphene_point_init_from_vec2: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_point_init_from_vec2(self, src)

      # Return value handling

      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end

    def interpolate(b : Graphene::Point, factor : Float64) : Graphene::Point
      # graphene_point_interpolate: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Point.new

      # C call
      LibGraphene.graphene_point_interpolate(self, b, factor, res)

      # Return value handling

      res
    end

    def near(b : Graphene::Point, epsilon : Float32) : Bool
      # graphene_point_near: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_point_near(self, b, epsilon)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def to_vec2 : Graphene::Vec2
      # graphene_point_to_vec2: (Method)
      # @v: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      v = Graphene::Vec2.new

      # C call
      LibGraphene.graphene_point_to_vec2(self, v)

      # Return value handling

      v
    end

    def self.zero : Graphene::Point
      # graphene_point_zero: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_point_zero

      # Return value handling

      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end

    def to_unsafe
      @pointer
    end
  end
end
