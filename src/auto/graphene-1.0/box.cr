module Graphene
  # A 3D box, described as the volume between a minimum and
  # a maximum vertices.
  class Box
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGraphene::Box))
      @pointer.copy_from(pointer, sizeof(LibGraphene::Box))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(min : Graphene::Vec3? = nil, max : Graphene::Vec3? = nil)
      _ptr = Pointer(Void).malloc(32)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.min = min unless min.nil?
      _instance.max = max unless max.nil?
      _instance
    end

    def finalize
    end

    def min : Graphene::Vec3
      # Property getter
      _var = (@pointer + 0).as(Pointer(LibGraphene::Vec3))
      Graphene::Vec3.new(_var.value, GICrystal::Transfer::Full)
    end

    def min=(value : Graphene::Vec3)
      # Property setter
      _var = (@pointer + 0).as(Pointer(LibGraphene::Vec3)).value = value.to_unsafe
      value
    end

    def max : Graphene::Vec3
      # Property getter
      _var = (@pointer + 16).as(Pointer(LibGraphene::Vec3))
      Graphene::Vec3.new(_var.value, GICrystal::Transfer::Full)
    end

    def max=(value : Graphene::Vec3)
      # Property setter
      _var = (@pointer + 16).as(Pointer(LibGraphene::Vec3)).value = value.to_unsafe
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGraphene.graphene_box_get_type
    end

    def self.alloc : Graphene::Box
      # graphene_box_alloc: (Constructor)
      # Returns: (transfer full)

      _retval = LibGraphene.graphene_box_alloc
      Graphene::Box.new(_retval, GICrystal::Transfer::Full)
    end

    def contains_box(b : Graphene::Box) : Bool
      # graphene_box_contains_box: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_box_contains_box(self, b)
      GICrystal.to_bool(_retval)
    end

    def contains_point(point : Graphene::Point3D) : Bool
      # graphene_box_contains_point: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_box_contains_point(self, point)
      GICrystal.to_bool(_retval)
    end

    def equal(b : Graphene::Box) : Bool
      # graphene_box_equal: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_box_equal(self, b)
      GICrystal.to_bool(_retval)
    end

    def expand(point : Graphene::Point3D) : Graphene::Box
      # graphene_box_expand: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Box.new

      LibGraphene.graphene_box_expand(self, point, res)
      res
    end

    def expand_scalar(scalar : Float32) : Graphene::Box
      # graphene_box_expand_scalar: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Box.new

      LibGraphene.graphene_box_expand_scalar(self, scalar, res)
      res
    end

    def expand_vec3(vec : Graphene::Vec3) : Graphene::Box
      # graphene_box_expand_vec3: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Box.new

      LibGraphene.graphene_box_expand_vec3(self, vec, res)
      res
    end

    def free : Nil
      # graphene_box_free: (Method)
      # Returns: (transfer none)

      LibGraphene.graphene_box_free(self)
    end

    def bounding_sphere : Graphene::Sphere
      # graphene_box_get_bounding_sphere: (Method)
      # @sphere: (out) (caller-allocates)
      # Returns: (transfer none)

      sphere = Graphene::Sphere.new

      LibGraphene.graphene_box_get_bounding_sphere(self, sphere)
      sphere
    end

    def center : Graphene::Point3D
      # graphene_box_get_center: (Method)
      # @center: (out) (caller-allocates)
      # Returns: (transfer none)

      center = Graphene::Point3D.new

      LibGraphene.graphene_box_get_center(self, center)
      center
    end

    def depth : Float32
      # graphene_box_get_depth: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_box_get_depth(self)
      _retval
    end

    def height : Float32
      # graphene_box_get_height: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_box_get_height(self)
      _retval
    end

    def max : Graphene::Point3D
      # graphene_box_get_max: (Method)
      # @max: (out) (caller-allocates)
      # Returns: (transfer none)

      max = Graphene::Point3D.new

      LibGraphene.graphene_box_get_max(self, max)
      max
    end

    def min : Graphene::Point3D
      # graphene_box_get_min: (Method)
      # @min: (out) (caller-allocates)
      # Returns: (transfer none)

      min = Graphene::Point3D.new

      LibGraphene.graphene_box_get_min(self, min)
      min
    end

    def size : Graphene::Vec3
      # graphene_box_get_size: (Method)
      # @size: (out) (caller-allocates)
      # Returns: (transfer none)

      size = Graphene::Vec3.new

      LibGraphene.graphene_box_get_size(self, size)
      size
    end

    def vertices(vertices : Enumerable(Graphene::Vec3)) : Nil
      # graphene_box_get_vertices: (Method)
      # @vertices: (out) (caller-allocates) (array fixed-size=8 element-type Interface)
      # Returns: (transfer none)

      vertices = vertices.to_a.map(&.to_unsafe).to_unsafe

      LibGraphene.graphene_box_get_vertices(self, vertices)
    end

    def vertices(*vertices : Graphene::Vec3)
      vertices(vertices)
    end

    def width : Float32
      # graphene_box_get_width: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_box_get_width(self)
      _retval
    end

    def init(min : Graphene::Point3D?, max : Graphene::Point3D?) : Graphene::Box
      # graphene_box_init: (Method)
      # @min: (nullable)
      # @max: (nullable)
      # Returns: (transfer none)

      min = if min.nil?
              Pointer(Void).null
            else
              min.to_unsafe
            end
      max = if max.nil?
              Pointer(Void).null
            else
              max.to_unsafe
            end

      _retval = LibGraphene.graphene_box_init(self, min, max)
      Graphene::Box.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_box(src : Graphene::Box) : Graphene::Box
      # graphene_box_init_from_box: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_box_init_from_box(self, src)
      Graphene::Box.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_points(points : Enumerable(Graphene::Point3D)) : Graphene::Box
      # graphene_box_init_from_points: (Method)
      # @points: (array length=n_points element-type Interface)
      # Returns: (transfer none)

      n_points = points.size
      points = points.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGraphene.graphene_box_init_from_points(self, n_points, points)
      Graphene::Box.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_points(*points : Graphene::Point3D)
      init_from_points(points)
    end

    def init_from_vec3(min : Graphene::Vec3?, max : Graphene::Vec3?) : Graphene::Box
      # graphene_box_init_from_vec3: (Method)
      # @min: (nullable)
      # @max: (nullable)
      # Returns: (transfer none)

      min = if min.nil?
              Pointer(Void).null
            else
              min.to_unsafe
            end
      max = if max.nil?
              Pointer(Void).null
            else
              max.to_unsafe
            end

      _retval = LibGraphene.graphene_box_init_from_vec3(self, min, max)
      Graphene::Box.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_vectors(vectors : Enumerable(Graphene::Vec3)) : Graphene::Box
      # graphene_box_init_from_vectors: (Method)
      # @vectors: (array length=n_vectors element-type Interface)
      # Returns: (transfer none)

      n_vectors = vectors.size
      vectors = vectors.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGraphene.graphene_box_init_from_vectors(self, n_vectors, vectors)
      Graphene::Box.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_vectors(*vectors : Graphene::Vec3)
      init_from_vectors(vectors)
    end

    def intersection(b : Graphene::Box) : Graphene::Box
      # graphene_box_intersection: (Method)
      # @res: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      res = Pointer(Void).null
      res = Graphene::Box.new

      _retval = LibGraphene.graphene_box_intersection(self, b, res)
      res
    end

    def union(b : Graphene::Box) : Graphene::Box
      # graphene_box_union: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Box.new

      LibGraphene.graphene_box_union(self, b, res)
      res
    end

    def self.empty : Graphene::Box
      # graphene_box_empty: (None)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_box_empty
      Graphene::Box.new(_retval, GICrystal::Transfer::None)
    end

    def self.infinite : Graphene::Box
      # graphene_box_infinite: (None)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_box_infinite
      Graphene::Box.new(_retval, GICrystal::Transfer::None)
    end

    def self.minus_one : Graphene::Box
      # graphene_box_minus_one: (None)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_box_minus_one
      Graphene::Box.new(_retval, GICrystal::Transfer::None)
    end

    def self.one : Graphene::Box
      # graphene_box_one: (None)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_box_one
      Graphene::Box.new(_retval, GICrystal::Transfer::None)
    end

    def self.one_minus_one : Graphene::Box
      # graphene_box_one_minus_one: (None)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_box_one_minus_one
      Graphene::Box.new(_retval, GICrystal::Transfer::None)
    end

    def self.zero : Graphene::Box
      # graphene_box_zero: (None)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_box_zero
      Graphene::Box.new(_retval, GICrystal::Transfer::None)
    end

    def to_unsafe
      @pointer
    end
  end
end
