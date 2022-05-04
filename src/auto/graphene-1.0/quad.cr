module Graphene
  # A 4 vertex quadrilateral, as represented by four #graphene_point_t.
  #
  # The contents of a #graphene_quad_t are private and should never be
  # accessed directly.
  class Quad
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGraphene::Quad))
      @pointer.copy_from(pointer, sizeof(LibGraphene::Quad))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(points : Enumerable(Graphene::Point)? = nil)
      _ptr = Pointer(Void).malloc(32)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.points = points unless points.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGraphene::Quad)).zero?
    end

    def points : Enumerable(Graphene::Point)
      _var = (@pointer + 0).as(Pointer(Void[4]))
      _var.value
    end

    def points=(value : Enumerable(Graphene::Point))
      _var = (@pointer + 0).as(Pointer(Void[4])).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGraphene.graphene_quad_get_type
    end

    def self.alloc : self
      # graphene_quad_alloc: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGraphene.graphene_quad_alloc

      # Return value handling

      Graphene::Quad.new(_retval, GICrystal::Transfer::Full)
    end

    def bounds : Graphene::Rect
      # graphene_quad_bounds: (Method)
      # @r: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      r = Graphene::Rect.new
      # C call
      LibGraphene.graphene_quad_bounds(self, r)

      # Return value handling

      r
    end

    def contains(p : Graphene::Point) : Bool
      # graphene_quad_contains: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_quad_contains(self, p)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # graphene_quad_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_quad_free(self)

      # Return value handling
    end

    def point(index_ : UInt32) : Graphene::Point
      # graphene_quad_get_point: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_quad_get_point(self, index_)

      # Return value handling

      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end

    def init(p1 : Graphene::Point, p2 : Graphene::Point, p3 : Graphene::Point, p4 : Graphene::Point) : Graphene::Quad
      # graphene_quad_init: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_quad_init(self, p1, p2, p3, p4)

      # Return value handling

      Graphene::Quad.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_points(points : Enumerable(Graphene::Point)) : Graphene::Quad
      # graphene_quad_init_from_points: (Method)
      # @points: (array fixed-size=4 element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      raise ArgumentError.new("Enumerable of size < 4") if points.size < 4

      points = points.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGraphene.graphene_quad_init_from_points(self, points)

      # Return value handling

      Graphene::Quad.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_points(*points : Graphene::Point)
      init_from_points(points)
    end

    def init_from_rect(r : Graphene::Rect) : Graphene::Quad
      # graphene_quad_init_from_rect: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_quad_init_from_rect(self, r)

      # Return value handling

      Graphene::Quad.new(_retval, GICrystal::Transfer::None)
    end

    def to_unsafe
      @pointer
    end
  end
end
