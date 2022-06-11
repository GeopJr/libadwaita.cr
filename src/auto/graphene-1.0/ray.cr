module Graphene
  # A ray emitted from an origin in a given direction.
  #
  # The contents of the `graphene_ray_t` structure are private, and should not
  # be modified directly.
  class Ray
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

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

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGraphene::Ray)).zero?
    end

    def origin : Graphene::Vec3
      _var = (@pointer + 0).as(Pointer(Void))
      Graphene::Vec3.new(_var, GICrystal::Transfer::None)
    end

    def origin=(value : Graphene::Vec3)
      _var = (@pointer + 0).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGraphene::Ray))
      value
    end

    def direction : Graphene::Vec3
      _var = (@pointer + 16).as(Pointer(Void))
      Graphene::Vec3.new(_var, GICrystal::Transfer::None)
    end

    def direction=(value : Graphene::Vec3)
      _var = (@pointer + 16).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGraphene::Ray))
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGraphene.graphene_ray_get_type
    end

    def equal(b : Graphene::Ray) : Bool
      # graphene_ray_equal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_ray_equal(@pointer, b)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # graphene_ray_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_ray_free(@pointer)

      # Return value handling
    end

    def closest_point_to_point(p : Graphene::Point3D) : Graphene::Point3D
      # graphene_ray_get_closest_point_to_point: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Point3D.new
      # C call
      LibGraphene.graphene_ray_get_closest_point_to_point(@pointer, p, res)

      # Return value handling

      res
    end

    def direction : Graphene::Vec3
      # graphene_ray_get_direction: (Method)
      # @direction: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      direction = Graphene::Vec3.new
      # C call
      LibGraphene.graphene_ray_get_direction(@pointer, direction)

      # Return value handling

      direction
    end

    def distance_to_plane(p : Graphene::Plane) : Float32
      # graphene_ray_get_distance_to_plane: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_ray_get_distance_to_plane(@pointer, p)

      # Return value handling

      _retval
    end

    def distance_to_point(p : Graphene::Point3D) : Float32
      # graphene_ray_get_distance_to_point: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_ray_get_distance_to_point(@pointer, p)

      # Return value handling

      _retval
    end

    def origin : Graphene::Point3D
      # graphene_ray_get_origin: (Method)
      # @origin: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      origin = Graphene::Point3D.new
      # C call
      LibGraphene.graphene_ray_get_origin(@pointer, origin)

      # Return value handling

      origin
    end

    def position_at(t : Float32) : Graphene::Point3D
      # graphene_ray_get_position_at: (Method)
      # @position: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      position = Graphene::Point3D.new
      # C call
      LibGraphene.graphene_ray_get_position_at(@pointer, t, position)

      # Return value handling

      position
    end

    def init(origin : Graphene::Point3D?, direction : Graphene::Vec3?) : Graphene::Ray
      # graphene_ray_init: (Method)
      # @origin: (nullable)
      # @direction: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      origin = if origin.nil?
                 Pointer(Void).null
               else
                 origin.to_unsafe
               end
      # Generator::NullableArrayPlan
      direction = if direction.nil?
                    Pointer(Void).null
                  else
                    direction.to_unsafe
                  end

      # C call
      _retval = LibGraphene.graphene_ray_init(@pointer, origin, direction)

      # Return value handling

      Graphene::Ray.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_ray(src : Graphene::Ray) : Graphene::Ray
      # graphene_ray_init_from_ray: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_ray_init_from_ray(@pointer, src)

      # Return value handling

      Graphene::Ray.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_vec3(origin : Graphene::Vec3?, direction : Graphene::Vec3?) : Graphene::Ray
      # graphene_ray_init_from_vec3: (Method)
      # @origin: (nullable)
      # @direction: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      origin = if origin.nil?
                 Pointer(Void).null
               else
                 origin.to_unsafe
               end
      # Generator::NullableArrayPlan
      direction = if direction.nil?
                    Pointer(Void).null
                  else
                    direction.to_unsafe
                  end

      # C call
      _retval = LibGraphene.graphene_ray_init_from_vec3(@pointer, origin, direction)

      # Return value handling

      Graphene::Ray.new(_retval, GICrystal::Transfer::None)
    end

    def intersect_box(b : Graphene::Box, t_out : Float32) : Graphene::RayIntersectionKind
      # graphene_ray_intersect_box: (Method)
      # @t_out: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_ray_intersect_box(@pointer, b, t_out)

      # Return value handling

      Graphene::RayIntersectionKind.new(_retval)
    end

    def intersect_sphere(s : Graphene::Sphere, t_out : Float32) : Graphene::RayIntersectionKind
      # graphene_ray_intersect_sphere: (Method)
      # @t_out: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_ray_intersect_sphere(@pointer, s, t_out)

      # Return value handling

      Graphene::RayIntersectionKind.new(_retval)
    end

    def intersect_triangle(t : Graphene::Triangle, t_out : Float32) : Graphene::RayIntersectionKind
      # graphene_ray_intersect_triangle: (Method)
      # @t_out: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_ray_intersect_triangle(@pointer, t, t_out)

      # Return value handling

      Graphene::RayIntersectionKind.new(_retval)
    end

    def intersects_box(b : Graphene::Box) : Bool
      # graphene_ray_intersects_box: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_ray_intersects_box(@pointer, b)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def intersects_sphere(s : Graphene::Sphere) : Bool
      # graphene_ray_intersects_sphere: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_ray_intersects_sphere(@pointer, s)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def intersects_triangle(t : Graphene::Triangle) : Bool
      # graphene_ray_intersects_triangle: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_ray_intersects_triangle(@pointer, t)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def to_unsafe
      @pointer
    end
  end
end
