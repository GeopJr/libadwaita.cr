module Graphene
  # A point with two coordinates.
  class Point
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

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

    def x : Float32
      # Property getter
      _var = (@pointer + 0).as(Pointer(Float32))
      _var.value
    end

    def x=(value : Float32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Float32)).value = value
      value
    end

    def y : Float32
      # Property getter
      _var = (@pointer + 4).as(Pointer(Float32))
      _var.value
    end

    def y=(value : Float32)
      # Property setter
      _var = (@pointer + 4).as(Pointer(Float32)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGraphene.graphene_point_get_type
    end

    def self.alloc : Graphene::Point
      # graphene_point_alloc: (Constructor)
      # Returns: (transfer full)

      _retval = LibGraphene.graphene_point_alloc
      Graphene::Point.new(_retval, GICrystal::Transfer::Full)
    end

    def distance(b : Graphene::Point) : Float32
      # graphene_point_distance: (Method)
      # @d_x: (out) (transfer full) (optional)
      # @d_y: (out) (transfer full) (optional)
      # Returns: (transfer none)

      d_x = Pointer(Float32).null
      d_y = Pointer(Float32).null

      _retval = LibGraphene.graphene_point_distance(self, b, d_x, d_y)
      _retval
    end

    def equal(b : Graphene::Point) : Bool
      # graphene_point_equal: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_point_equal(self, b)
      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # graphene_point_free: (Method)
      # Returns: (transfer none)

      LibGraphene.graphene_point_free(self)
    end

    def init(x : Float32, y : Float32) : Graphene::Point
      # graphene_point_init: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_point_init(self, x, y)
      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_point(src : Graphene::Point) : Graphene::Point
      # graphene_point_init_from_point: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_point_init_from_point(self, src)
      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_vec2(src : Graphene::Vec2) : Graphene::Point
      # graphene_point_init_from_vec2: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_point_init_from_vec2(self, src)
      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end

    def interpolate(b : Graphene::Point, factor : Float64) : Graphene::Point
      # graphene_point_interpolate: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Point.new

      LibGraphene.graphene_point_interpolate(self, b, factor, res)
      res
    end

    def near(b : Graphene::Point, epsilon : Float32) : Bool
      # graphene_point_near: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_point_near(self, b, epsilon)
      GICrystal.to_bool(_retval)
    end

    def to_vec2 : Graphene::Vec2
      # graphene_point_to_vec2: (Method)
      # @v: (out) (caller-allocates)
      # Returns: (transfer none)

      v = Graphene::Vec2.new

      LibGraphene.graphene_point_to_vec2(self, v)
      v
    end

    def self.zero : Graphene::Point
      # graphene_point_zero: (None)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_point_zero
      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end

    def to_unsafe
      @pointer
    end
  end
end