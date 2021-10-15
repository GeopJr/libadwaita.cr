module Graphene
  # The location and size of a rectangle region.
  #
  # The width and height of a #graphene_rect_t can be negative; for instance,
  # a #graphene_rect_t with an origin of [ 0, 0 ] and a size of [ 10, 10 ] is
  # equivalent to a #graphene_rect_t with an origin of [ 10, 10 ] and a size
  # of [ -10, -10 ].
  #
  # Application code can normalize rectangles using graphene_rect_normalize();
  # this function will ensure that the width and height of a rectangle are
  # positive values. All functions taking a #graphene_rect_t as an argument
  # will internally operate on a normalized copy; all functions returning a
  # #graphene_rect_t will always return a normalized rectangle.
  class Rect
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGraphene::Rect))
      @pointer.copy_from(pointer, sizeof(LibGraphene::Rect))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(origin : Graphene::Point? = nil, size : Graphene::Size? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.origin = origin unless origin.nil?
      _instance.size = size unless size.nil?
      _instance
    end

    def finalize
    end

    def origin : Graphene::Point
      # Property getter
      _var = (@pointer + 0).as(Pointer(LibGraphene::Point))
      Graphene::Point.new(_var.value, GICrystal::Transfer::Full)
    end

    def origin=(value : Graphene::Point)
      # Property setter
      _var = (@pointer + 0).as(Pointer(LibGraphene::Point)).value = value.to_unsafe
      value
    end

    def size : Graphene::Size
      # Property getter
      _var = (@pointer + 8).as(Pointer(LibGraphene::Size))
      Graphene::Size.new(_var.value, GICrystal::Transfer::Full)
    end

    def size=(value : Graphene::Size)
      # Property setter
      _var = (@pointer + 8).as(Pointer(LibGraphene::Size)).value = value.to_unsafe
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGraphene.graphene_rect_get_type
    end

    def contains_point(p : Graphene::Point) : Bool
      # graphene_rect_contains_point: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_rect_contains_point(self, p)
      GICrystal.to_bool(_retval)
    end

    def contains_rect(b : Graphene::Rect) : Bool
      # graphene_rect_contains_rect: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_rect_contains_rect(self, b)
      GICrystal.to_bool(_retval)
    end

    def equal(b : Graphene::Rect) : Bool
      # graphene_rect_equal: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_rect_equal(self, b)
      GICrystal.to_bool(_retval)
    end

    def expand(p : Graphene::Point) : Graphene::Rect
      # graphene_rect_expand: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Rect.new

      LibGraphene.graphene_rect_expand(self, p, res)
      res
    end

    def free : Nil
      # graphene_rect_free: (Method)
      # Returns: (transfer none)

      LibGraphene.graphene_rect_free(self)
    end

    def area : Float32
      # graphene_rect_get_area: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_rect_get_area(self)
      _retval
    end

    def bottom_left : Graphene::Point
      # graphene_rect_get_bottom_left: (Method)
      # @p: (out) (caller-allocates)
      # Returns: (transfer none)

      p = Graphene::Point.new

      LibGraphene.graphene_rect_get_bottom_left(self, p)
      p
    end

    def bottom_right : Graphene::Point
      # graphene_rect_get_bottom_right: (Method)
      # @p: (out) (caller-allocates)
      # Returns: (transfer none)

      p = Graphene::Point.new

      LibGraphene.graphene_rect_get_bottom_right(self, p)
      p
    end

    def center : Graphene::Point
      # graphene_rect_get_center: (Method)
      # @p: (out) (caller-allocates)
      # Returns: (transfer none)

      p = Graphene::Point.new

      LibGraphene.graphene_rect_get_center(self, p)
      p
    end

    def height : Float32
      # graphene_rect_get_height: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_rect_get_height(self)
      _retval
    end

    def top_left : Graphene::Point
      # graphene_rect_get_top_left: (Method)
      # @p: (out) (caller-allocates)
      # Returns: (transfer none)

      p = Graphene::Point.new

      LibGraphene.graphene_rect_get_top_left(self, p)
      p
    end

    def top_right : Graphene::Point
      # graphene_rect_get_top_right: (Method)
      # @p: (out) (caller-allocates)
      # Returns: (transfer none)

      p = Graphene::Point.new

      LibGraphene.graphene_rect_get_top_right(self, p)
      p
    end

    def vertices(vertices : Enumerable(Graphene::Vec2)) : Nil
      # graphene_rect_get_vertices: (Method)
      # @vertices: (out) (caller-allocates) (array fixed-size=4 element-type Interface)
      # Returns: (transfer none)

      vertices = vertices.to_a.map(&.to_unsafe).to_unsafe

      LibGraphene.graphene_rect_get_vertices(self, vertices)
    end

    def vertices(*vertices : Graphene::Vec2)
      vertices(vertices)
    end

    def width : Float32
      # graphene_rect_get_width: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_rect_get_width(self)
      _retval
    end

    def x : Float32
      # graphene_rect_get_x: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_rect_get_x(self)
      _retval
    end

    def y : Float32
      # graphene_rect_get_y: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_rect_get_y(self)
      _retval
    end

    def init(x : Float32, y : Float32, width : Float32, height : Float32) : Graphene::Rect
      # graphene_rect_init: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_rect_init(self, x, y, width, height)
      Graphene::Rect.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_rect(src : Graphene::Rect) : Graphene::Rect
      # graphene_rect_init_from_rect: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_rect_init_from_rect(self, src)
      Graphene::Rect.new(_retval, GICrystal::Transfer::None)
    end

    def inset(d_x : Float32, d_y : Float32) : Graphene::Rect
      # graphene_rect_inset: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_rect_inset(self, d_x, d_y)
      Graphene::Rect.new(_retval, GICrystal::Transfer::None)
    end

    def inset_r(d_x : Float32, d_y : Float32) : Graphene::Rect
      # graphene_rect_inset_r: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Rect.new

      LibGraphene.graphene_rect_inset_r(self, d_x, d_y, res)
      res
    end

    def interpolate(b : Graphene::Rect, factor : Float64) : Graphene::Rect
      # graphene_rect_interpolate: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Rect.new

      LibGraphene.graphene_rect_interpolate(self, b, factor, res)
      res
    end

    def intersection(b : Graphene::Rect) : Graphene::Rect
      # graphene_rect_intersection: (Method)
      # @res: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      res = Pointer(Void).null
      res = Graphene::Rect.new

      _retval = LibGraphene.graphene_rect_intersection(self, b, res)
      res
    end

    def normalize : Graphene::Rect
      # graphene_rect_normalize: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_rect_normalize(self)
      Graphene::Rect.new(_retval, GICrystal::Transfer::None)
    end

    def normalize_r : Graphene::Rect
      # graphene_rect_normalize_r: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Rect.new

      LibGraphene.graphene_rect_normalize_r(self, res)
      res
    end

    def offset(d_x : Float32, d_y : Float32) : Graphene::Rect
      # graphene_rect_offset: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_rect_offset(self, d_x, d_y)
      Graphene::Rect.new(_retval, GICrystal::Transfer::None)
    end

    def offset_r(d_x : Float32, d_y : Float32) : Graphene::Rect
      # graphene_rect_offset_r: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Rect.new

      LibGraphene.graphene_rect_offset_r(self, d_x, d_y, res)
      res
    end

    def round : Graphene::Rect
      # graphene_rect_round: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Rect.new

      LibGraphene.graphene_rect_round(self, res)
      res
    end

    def round_extents : Graphene::Rect
      # graphene_rect_round_extents: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Rect.new

      LibGraphene.graphene_rect_round_extents(self, res)
      res
    end

    def round_to_pixel : Graphene::Rect
      # graphene_rect_round_to_pixel: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_rect_round_to_pixel(self)
      Graphene::Rect.new(_retval, GICrystal::Transfer::None)
    end

    def scale(s_h : Float32, s_v : Float32) : Graphene::Rect
      # graphene_rect_scale: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Rect.new

      LibGraphene.graphene_rect_scale(self, s_h, s_v, res)
      res
    end

    def union(b : Graphene::Rect) : Graphene::Rect
      # graphene_rect_union: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Rect.new

      LibGraphene.graphene_rect_union(self, b, res)
      res
    end

    def self.alloc : Graphene::Rect
      # graphene_rect_alloc: (None)
      # Returns: (transfer full)

      _retval = LibGraphene.graphene_rect_alloc
      Graphene::Rect.new(_retval, GICrystal::Transfer::Full)
    end

    def self.zero : Graphene::Rect
      # graphene_rect_zero: (None)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_rect_zero
      Graphene::Rect.new(_retval, GICrystal::Transfer::None)
    end

    def to_unsafe
      @pointer
    end
  end
end
