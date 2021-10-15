module Graphene
  # A sphere, represented by its center and radius.
  class Sphere
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

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

    def center : Graphene::Vec3
      # Property getter
      _var = (@pointer + 0).as(Pointer(LibGraphene::Vec3))
      Graphene::Vec3.new(_var.value, GICrystal::Transfer::Full)
    end

    def center=(value : Graphene::Vec3)
      # Property setter
      _var = (@pointer + 0).as(Pointer(LibGraphene::Vec3)).value = value.to_unsafe
      value
    end

    def radius : Float32
      # Property getter
      _var = (@pointer + 16).as(Pointer(Float32))
      _var.value
    end

    def radius=(value : Float32)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Float32)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGraphene.graphene_sphere_get_type
    end

    def self.alloc : Graphene::Sphere
      # graphene_sphere_alloc: (Constructor)
      # Returns: (transfer full)

      _retval = LibGraphene.graphene_sphere_alloc
      Graphene::Sphere.new(_retval, GICrystal::Transfer::Full)
    end

    def contains_point(point : Graphene::Point3D) : Bool
      # graphene_sphere_contains_point: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_sphere_contains_point(self, point)
      GICrystal.to_bool(_retval)
    end

    def distance(point : Graphene::Point3D) : Float32
      # graphene_sphere_distance: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_sphere_distance(self, point)
      _retval
    end

    def equal(b : Graphene::Sphere) : Bool
      # graphene_sphere_equal: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_sphere_equal(self, b)
      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # graphene_sphere_free: (Method)
      # Returns: (transfer none)

      LibGraphene.graphene_sphere_free(self)
    end

    def bounding_box : Graphene::Box
      # graphene_sphere_get_bounding_box: (Method)
      # @box: (out) (caller-allocates)
      # Returns: (transfer none)

      box = Graphene::Box.new

      LibGraphene.graphene_sphere_get_bounding_box(self, box)
      box
    end

    def center : Graphene::Point3D
      # graphene_sphere_get_center: (Method)
      # @center: (out) (caller-allocates)
      # Returns: (transfer none)

      center = Graphene::Point3D.new

      LibGraphene.graphene_sphere_get_center(self, center)
      center
    end

    def radius : Float32
      # graphene_sphere_get_radius: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_sphere_get_radius(self)
      _retval
    end

    def init(center : Graphene::Point3D?, radius : Float32) : Graphene::Sphere
      # graphene_sphere_init: (Method)
      # @center: (nullable)
      # Returns: (transfer none)

      center = if center.nil?
                 Pointer(Void).null
               else
                 center.to_unsafe
               end

      _retval = LibGraphene.graphene_sphere_init(self, center, radius)
      Graphene::Sphere.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_points(points : Enumerable(Graphene::Point3D), center : Graphene::Point3D?) : Graphene::Sphere
      # graphene_sphere_init_from_points: (Method)
      # @points: (array length=n_points element-type Interface)
      # @center: (nullable)
      # Returns: (transfer none)

      n_points = points.size
      center = if center.nil?
                 Pointer(Void).null
               else
                 center.to_unsafe
               end
      points = points.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGraphene.graphene_sphere_init_from_points(self, n_points, points, center)
      Graphene::Sphere.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_vectors(vectors : Enumerable(Graphene::Vec3), center : Graphene::Point3D?) : Graphene::Sphere
      # graphene_sphere_init_from_vectors: (Method)
      # @vectors: (array length=n_vectors element-type Interface)
      # @center: (nullable)
      # Returns: (transfer none)

      n_vectors = vectors.size
      center = if center.nil?
                 Pointer(Void).null
               else
                 center.to_unsafe
               end
      vectors = vectors.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGraphene.graphene_sphere_init_from_vectors(self, n_vectors, vectors, center)
      Graphene::Sphere.new(_retval, GICrystal::Transfer::None)
    end

    def is_empty : Bool
      # graphene_sphere_is_empty: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_sphere_is_empty(self)
      GICrystal.to_bool(_retval)
    end

    def translate(point : Graphene::Point3D) : Graphene::Sphere
      # graphene_sphere_translate: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Sphere.new

      LibGraphene.graphene_sphere_translate(self, point, res)
      res
    end

    def to_unsafe
      @pointer
    end
  end
end
