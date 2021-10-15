module Graphene
  # A ray emitted from an origin in a given direction.
  #
  # The contents of the `graphene_ray_t` structure are private, and should not
  # be modified directly.
  class Ray
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGraphene::Ray))
      @pointer.copy_from(pointer, sizeof(LibGraphene::Ray))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(origin : Graphene::Vec3? = nil, direction : Graphene::Vec3? = nil)
      _ptr = Pointer(Void).malloc(32)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.origin = origin unless origin.nil?
      _instance.direction = direction unless direction.nil?
      _instance
    end

    def finalize
    end

    def origin : Graphene::Vec3
      # Property getter
      _var = (@pointer + 0).as(Pointer(LibGraphene::Vec3))
      Graphene::Vec3.new(_var.value, GICrystal::Transfer::Full)
    end

    def origin=(value : Graphene::Vec3)
      # Property setter
      _var = (@pointer + 0).as(Pointer(LibGraphene::Vec3)).value = value.to_unsafe
      value
    end

    def direction : Graphene::Vec3
      # Property getter
      _var = (@pointer + 16).as(Pointer(LibGraphene::Vec3))
      Graphene::Vec3.new(_var.value, GICrystal::Transfer::Full)
    end

    def direction=(value : Graphene::Vec3)
      # Property setter
      _var = (@pointer + 16).as(Pointer(LibGraphene::Vec3)).value = value.to_unsafe
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGraphene.graphene_ray_get_type
    end

    def self.alloc : Graphene::Ray
      # graphene_ray_alloc: (Constructor)
      # Returns: (transfer full)

      _retval = LibGraphene.graphene_ray_alloc
      Graphene::Ray.new(_retval, GICrystal::Transfer::Full)
    end

    def equal(b : Graphene::Ray) : Bool
      # graphene_ray_equal: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_ray_equal(self, b)
      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # graphene_ray_free: (Method)
      # Returns: (transfer none)

      LibGraphene.graphene_ray_free(self)
    end

    def closest_point_to_point(p : Graphene::Point3D) : Graphene::Point3D
      # graphene_ray_get_closest_point_to_point: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Point3D.new

      LibGraphene.graphene_ray_get_closest_point_to_point(self, p, res)
      res
    end

    def direction : Graphene::Vec3
      # graphene_ray_get_direction: (Method)
      # @direction: (out) (caller-allocates)
      # Returns: (transfer none)

      direction = Graphene::Vec3.new

      LibGraphene.graphene_ray_get_direction(self, direction)
      direction
    end

    def distance_to_plane(p : Graphene::Plane) : Float32
      # graphene_ray_get_distance_to_plane: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_ray_get_distance_to_plane(self, p)
      _retval
    end

    def distance_to_point(p : Graphene::Point3D) : Float32
      # graphene_ray_get_distance_to_point: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_ray_get_distance_to_point(self, p)
      _retval
    end

    def origin : Graphene::Point3D
      # graphene_ray_get_origin: (Method)
      # @origin: (out) (caller-allocates)
      # Returns: (transfer none)

      origin = Graphene::Point3D.new

      LibGraphene.graphene_ray_get_origin(self, origin)
      origin
    end

    def position_at(t : Float32) : Graphene::Point3D
      # graphene_ray_get_position_at: (Method)
      # @position: (out) (caller-allocates)
      # Returns: (transfer none)

      position = Graphene::Point3D.new

      LibGraphene.graphene_ray_get_position_at(self, t, position)
      position
    end

    def init(origin : Graphene::Point3D?, direction : Graphene::Vec3?) : Graphene::Ray
      # graphene_ray_init: (Method)
      # @origin: (nullable)
      # @direction: (nullable)
      # Returns: (transfer none)

      origin = if origin.nil?
                 Pointer(Void).null
               else
                 origin.to_unsafe
               end
      direction = if direction.nil?
                    Pointer(Void).null
                  else
                    direction.to_unsafe
                  end

      _retval = LibGraphene.graphene_ray_init(self, origin, direction)
      Graphene::Ray.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_ray(src : Graphene::Ray) : Graphene::Ray
      # graphene_ray_init_from_ray: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_ray_init_from_ray(self, src)
      Graphene::Ray.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_vec3(origin : Graphene::Vec3?, direction : Graphene::Vec3?) : Graphene::Ray
      # graphene_ray_init_from_vec3: (Method)
      # @origin: (nullable)
      # @direction: (nullable)
      # Returns: (transfer none)

      origin = if origin.nil?
                 Pointer(Void).null
               else
                 origin.to_unsafe
               end
      direction = if direction.nil?
                    Pointer(Void).null
                  else
                    direction.to_unsafe
                  end

      _retval = LibGraphene.graphene_ray_init_from_vec3(self, origin, direction)
      Graphene::Ray.new(_retval, GICrystal::Transfer::None)
    end

    def intersect_box(b : Graphene::Box, t_out : Float32) : Graphene::RayIntersectionKind
      # graphene_ray_intersect_box: (Method)
      # @t_out: (out) (transfer full)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_ray_intersect_box(self, b, t_out)
      Graphene::RayIntersectionKind.from_value(_retval)
    end

    def intersect_sphere(s : Graphene::Sphere, t_out : Float32) : Graphene::RayIntersectionKind
      # graphene_ray_intersect_sphere: (Method)
      # @t_out: (out) (transfer full)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_ray_intersect_sphere(self, s, t_out)
      Graphene::RayIntersectionKind.from_value(_retval)
    end

    def intersect_triangle(t : Graphene::Triangle, t_out : Float32) : Graphene::RayIntersectionKind
      # graphene_ray_intersect_triangle: (Method)
      # @t_out: (out) (transfer full)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_ray_intersect_triangle(self, t, t_out)
      Graphene::RayIntersectionKind.from_value(_retval)
    end

    def intersects_box(b : Graphene::Box) : Bool
      # graphene_ray_intersects_box: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_ray_intersects_box(self, b)
      GICrystal.to_bool(_retval)
    end

    def intersects_sphere(s : Graphene::Sphere) : Bool
      # graphene_ray_intersects_sphere: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_ray_intersects_sphere(self, s)
      GICrystal.to_bool(_retval)
    end

    def intersects_triangle(t : Graphene::Triangle) : Bool
      # graphene_ray_intersects_triangle: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_ray_intersects_triangle(self, t)
      GICrystal.to_bool(_retval)
    end

    def to_unsafe
      @pointer
    end
  end
end
