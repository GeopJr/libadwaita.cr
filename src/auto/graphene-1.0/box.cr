module Graphene
  # A 3D box, described as the volume between a minimum and
  # a maximum vertices.
  class Box
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

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

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGraphene::Box)).zero?
    end

    def min : Graphene::Vec3
      _var = (@pointer + 0).as(Pointer(Void))
      Graphene::Vec3.new(_var, GICrystal::Transfer::None)
    end

    def min=(value : Graphene::Vec3)
      _var = (@pointer + 0).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGraphene::Box))
      value
    end

    def max : Graphene::Vec3
      _var = (@pointer + 16).as(Pointer(Void))
      Graphene::Vec3.new(_var, GICrystal::Transfer::None)
    end

    def max=(value : Graphene::Vec3)
      _var = (@pointer + 16).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGraphene::Box))
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGraphene.graphene_box_get_type
    end

    def self.alloc : self
      # graphene_box_alloc: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGraphene.graphene_box_alloc

      # Return value handling

      Graphene::Box.new(_retval, GICrystal::Transfer::Full)
    end

    def contains_box(b : Graphene::Box) : Bool
      # graphene_box_contains_box: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_box_contains_box(@pointer, b)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def contains_point(point : Graphene::Point3D) : Bool
      # graphene_box_contains_point: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_box_contains_point(@pointer, point)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def equal(b : Graphene::Box) : Bool
      # graphene_box_equal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_box_equal(@pointer, b)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def expand(point : Graphene::Point3D) : Graphene::Box
      # graphene_box_expand: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Box.new
      # C call
      LibGraphene.graphene_box_expand(@pointer, point, res)

      # Return value handling

      res
    end

    def expand_scalar(scalar : Float32) : Graphene::Box
      # graphene_box_expand_scalar: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Box.new
      # C call
      LibGraphene.graphene_box_expand_scalar(@pointer, scalar, res)

      # Return value handling

      res
    end

    def expand_vec3(vec : Graphene::Vec3) : Graphene::Box
      # graphene_box_expand_vec3: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Box.new
      # C call
      LibGraphene.graphene_box_expand_vec3(@pointer, vec, res)

      # Return value handling

      res
    end

    def free : Nil
      # graphene_box_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_box_free(@pointer)

      # Return value handling
    end

    def bounding_sphere : Graphene::Sphere
      # graphene_box_get_bounding_sphere: (Method)
      # @sphere: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      sphere = Graphene::Sphere.new
      # C call
      LibGraphene.graphene_box_get_bounding_sphere(@pointer, sphere)

      # Return value handling

      sphere
    end

    def center : Graphene::Point3D
      # graphene_box_get_center: (Method)
      # @center: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      center = Graphene::Point3D.new
      # C call
      LibGraphene.graphene_box_get_center(@pointer, center)

      # Return value handling

      center
    end

    def depth : Float32
      # graphene_box_get_depth: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_box_get_depth(@pointer)

      # Return value handling

      _retval
    end

    def height : Float32
      # graphene_box_get_height: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_box_get_height(@pointer)

      # Return value handling

      _retval
    end

    def max : Graphene::Point3D
      # graphene_box_get_max: (Method)
      # @max: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      max = Graphene::Point3D.new
      # C call
      LibGraphene.graphene_box_get_max(@pointer, max)

      # Return value handling

      max
    end

    def min : Graphene::Point3D
      # graphene_box_get_min: (Method)
      # @min: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      min = Graphene::Point3D.new
      # C call
      LibGraphene.graphene_box_get_min(@pointer, min)

      # Return value handling

      min
    end

    def size : Graphene::Vec3
      # graphene_box_get_size: (Method)
      # @size: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      size = Graphene::Vec3.new
      # C call
      LibGraphene.graphene_box_get_size(@pointer, size)

      # Return value handling

      size
    end

    def vertices(vertices : Enumerable(Graphene::Vec3)) : Nil
      # graphene_box_get_vertices: (Method)
      # @vertices: (out) (caller-allocates) (array fixed-size=8 element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      raise ArgumentError.new("Enumerable of size < 8") if vertices.size < 8

      vertices = vertices.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGraphene.graphene_box_get_vertices(@pointer, vertices)

      # Return value handling
    end

    def vertices(*vertices : Graphene::Vec3)
      vertices(vertices)
    end

    def width : Float32
      # graphene_box_get_width: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_box_get_width(@pointer)

      # Return value handling

      _retval
    end

    def init(min : Graphene::Point3D?, max : Graphene::Point3D?) : Graphene::Box
      # graphene_box_init: (Method)
      # @min: (nullable)
      # @max: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      min = if min.nil?
              Pointer(Void).null
            else
              min.to_unsafe
            end
      # Generator::NullableArrayPlan
      max = if max.nil?
              Pointer(Void).null
            else
              max.to_unsafe
            end

      # C call
      _retval = LibGraphene.graphene_box_init(@pointer, min, max)

      # Return value handling

      Graphene::Box.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_box(src : Graphene::Box) : Graphene::Box
      # graphene_box_init_from_box: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_box_init_from_box(@pointer, src)

      # Return value handling

      Graphene::Box.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_points(points : Enumerable(Graphene::Point3D)) : Graphene::Box
      # graphene_box_init_from_points: (Method)
      # @points: (array length=n_points element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_points = points.size # Generator::ArrayArgPlan
      points = points.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGraphene.graphene_box_init_from_points(@pointer, n_points, points)

      # Return value handling

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

      # Generator::NullableArrayPlan
      min = if min.nil?
              Pointer(Void).null
            else
              min.to_unsafe
            end
      # Generator::NullableArrayPlan
      max = if max.nil?
              Pointer(Void).null
            else
              max.to_unsafe
            end

      # C call
      _retval = LibGraphene.graphene_box_init_from_vec3(@pointer, min, max)

      # Return value handling

      Graphene::Box.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_vectors(vectors : Enumerable(Graphene::Vec3)) : Graphene::Box
      # graphene_box_init_from_vectors: (Method)
      # @vectors: (array length=n_vectors element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_vectors = vectors.size # Generator::ArrayArgPlan
      vectors = vectors.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGraphene.graphene_box_init_from_vectors(@pointer, n_vectors, vectors)

      # Return value handling

      Graphene::Box.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_vectors(*vectors : Graphene::Vec3)
      init_from_vectors(vectors)
    end

    def intersection(b : Graphene::Box) : Graphene::Box
      # graphene_box_intersection: (Method)
      # @res: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      res = Pointer(Void).null # Generator::CallerAllocatesPlan
      res = Graphene::Box.new
      # C call
      _retval = LibGraphene.graphene_box_intersection(@pointer, b, res)

      # Return value handling

      res
    end

    def union(b : Graphene::Box) : Graphene::Box
      # graphene_box_union: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Box.new
      # C call
      LibGraphene.graphene_box_union(@pointer, b, res)

      # Return value handling

      res
    end

    def self.empty : Graphene::Box
      # graphene_box_empty: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_box_empty

      # Return value handling

      Graphene::Box.new(_retval, GICrystal::Transfer::None)
    end

    def self.infinite : Graphene::Box
      # graphene_box_infinite: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_box_infinite

      # Return value handling

      Graphene::Box.new(_retval, GICrystal::Transfer::None)
    end

    def self.minus_one : Graphene::Box
      # graphene_box_minus_one: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_box_minus_one

      # Return value handling

      Graphene::Box.new(_retval, GICrystal::Transfer::None)
    end

    def self.one : Graphene::Box
      # graphene_box_one: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_box_one

      # Return value handling

      Graphene::Box.new(_retval, GICrystal::Transfer::None)
    end

    def self.one_minus_one : Graphene::Box
      # graphene_box_one_minus_one: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_box_one_minus_one

      # Return value handling

      Graphene::Box.new(_retval, GICrystal::Transfer::None)
    end

    def self.zero : Graphene::Box
      # graphene_box_zero: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_box_zero

      # Return value handling

      Graphene::Box.new(_retval, GICrystal::Transfer::None)
    end

    def to_unsafe
      @pointer
    end
  end
end
