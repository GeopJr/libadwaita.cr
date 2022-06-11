module Graphene
  # A sphere, represented by its center and radius.
  class Sphere
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGraphene::Sphere))
      @pointer.copy_from(pointer, sizeof(LibGraphene::Sphere))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(center : Graphene::Vec3? = nil, radius : Float32? = nil)
      _ptr = Pointer(Void).malloc(20)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.center = center unless center.nil?
      _instance.radius = radius unless radius.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGraphene::Sphere)).zero?
    end

    def center : Graphene::Vec3
      _var = (@pointer + 0).as(Pointer(Void))
      Graphene::Vec3.new(_var, GICrystal::Transfer::None)
    end

    def center=(value : Graphene::Vec3)
      _var = (@pointer + 0).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGraphene::Sphere))
      value
    end

    def radius : Float32
      _var = (@pointer + 16).as(Pointer(Float32))
      _var.value
    end

    def radius=(value : Float32)
      _var = (@pointer + 16).as(Pointer(Float32)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGraphene.graphene_sphere_get_type
    end

    def contains_point(point : Graphene::Point3D) : Bool
      # graphene_sphere_contains_point: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_sphere_contains_point(@pointer, point)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def distance(point : Graphene::Point3D) : Float32
      # graphene_sphere_distance: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_sphere_distance(@pointer, point)

      # Return value handling

      _retval
    end

    def equal(b : Graphene::Sphere) : Bool
      # graphene_sphere_equal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_sphere_equal(@pointer, b)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # graphene_sphere_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_sphere_free(@pointer)

      # Return value handling
    end

    def bounding_box : Graphene::Box
      # graphene_sphere_get_bounding_box: (Method)
      # @box: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      box = Graphene::Box.new
      # C call
      LibGraphene.graphene_sphere_get_bounding_box(@pointer, box)

      # Return value handling

      box
    end

    def center : Graphene::Point3D
      # graphene_sphere_get_center: (Method)
      # @center: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      center = Graphene::Point3D.new
      # C call
      LibGraphene.graphene_sphere_get_center(@pointer, center)

      # Return value handling

      center
    end

    def radius : Float32
      # graphene_sphere_get_radius: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_sphere_get_radius(@pointer)

      # Return value handling

      _retval
    end

    def init(center : Graphene::Point3D?, radius : Float32) : Graphene::Sphere
      # graphene_sphere_init: (Method)
      # @center: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      center = if center.nil?
                 Pointer(Void).null
               else
                 center.to_unsafe
               end

      # C call
      _retval = LibGraphene.graphene_sphere_init(@pointer, center, radius)

      # Return value handling

      Graphene::Sphere.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_points(points : Enumerable(Graphene::Point3D), center : Graphene::Point3D?) : Graphene::Sphere
      # graphene_sphere_init_from_points: (Method)
      # @points: (array length=n_points element-type Interface)
      # @center: (nullable)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_points = points.size # Generator::ArrayArgPlan
      points = points.to_a.map(&.to_unsafe).to_unsafe
      # Generator::NullableArrayPlan
      center = if center.nil?
                 Pointer(Void).null
               else
                 center.to_unsafe
               end

      # C call
      _retval = LibGraphene.graphene_sphere_init_from_points(@pointer, n_points, points, center)

      # Return value handling

      Graphene::Sphere.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_vectors(vectors : Enumerable(Graphene::Vec3), center : Graphene::Point3D?) : Graphene::Sphere
      # graphene_sphere_init_from_vectors: (Method)
      # @vectors: (array length=n_vectors element-type Interface)
      # @center: (nullable)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_vectors = vectors.size # Generator::ArrayArgPlan
      vectors = vectors.to_a.map(&.to_unsafe).to_unsafe
      # Generator::NullableArrayPlan
      center = if center.nil?
                 Pointer(Void).null
               else
                 center.to_unsafe
               end

      # C call
      _retval = LibGraphene.graphene_sphere_init_from_vectors(@pointer, n_vectors, vectors, center)

      # Return value handling

      Graphene::Sphere.new(_retval, GICrystal::Transfer::None)
    end

    def is_empty : Bool
      # graphene_sphere_is_empty: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_sphere_is_empty(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def translate(point : Graphene::Point3D) : Graphene::Sphere
      # graphene_sphere_translate: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Sphere.new
      # C call
      LibGraphene.graphene_sphere_translate(@pointer, point, res)

      # Return value handling

      res
    end

    def to_unsafe
      @pointer
    end
  end
end
