module Graphene
  # A 3D volume delimited by 2D clip planes.
  #
  # The contents of the `graphene_frustum_t` are private, and should not be
  # modified directly.
  class Frustum
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGraphene::Frustum))
      @pointer.copy_from(pointer, sizeof(LibGraphene::Frustum))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(planes : Enumerable(Graphene::Plane)? = nil)
      _ptr = Pointer(Void).malloc(120)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.planes = planes unless planes.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGraphene::Frustum)).zero?
    end

    def planes : Enumerable(Graphene::Plane)
      _var = (@pointer + 0).as(Pointer(Void[6]))
      _var.value
    end

    def planes=(value : Enumerable(Graphene::Plane))
      _var = (@pointer + 0).as(Pointer(Void[6])).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGraphene.graphene_frustum_get_type
    end

    def self.alloc : self
      # graphene_frustum_alloc: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGraphene.graphene_frustum_alloc

      # Return value handling

      Graphene::Frustum.new(_retval, GICrystal::Transfer::Full)
    end

    def contains_point(point : Graphene::Point3D) : Bool
      # graphene_frustum_contains_point: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_frustum_contains_point(@pointer, point)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def equal(b : Graphene::Frustum) : Bool
      # graphene_frustum_equal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_frustum_equal(@pointer, b)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # graphene_frustum_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_frustum_free(@pointer)

      # Return value handling
    end

    def planes(planes : Enumerable(Graphene::Plane)) : Nil
      # graphene_frustum_get_planes: (Method)
      # @planes: (out) (caller-allocates) (array fixed-size=6 element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      raise ArgumentError.new("Enumerable of size < 6") if planes.size < 6

      planes = planes.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGraphene.graphene_frustum_get_planes(@pointer, planes)

      # Return value handling
    end

    def planes(*planes : Graphene::Plane)
      planes(planes)
    end

    def init(p0 : Graphene::Plane, p1 : Graphene::Plane, p2 : Graphene::Plane, p3 : Graphene::Plane, p4 : Graphene::Plane, p5 : Graphene::Plane) : Graphene::Frustum
      # graphene_frustum_init: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_frustum_init(@pointer, p0, p1, p2, p3, p4, p5)

      # Return value handling

      Graphene::Frustum.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_frustum(src : Graphene::Frustum) : Graphene::Frustum
      # graphene_frustum_init_from_frustum: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_frustum_init_from_frustum(@pointer, src)

      # Return value handling

      Graphene::Frustum.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_matrix(matrix : Graphene::Matrix) : Graphene::Frustum
      # graphene_frustum_init_from_matrix: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_frustum_init_from_matrix(@pointer, matrix)

      # Return value handling

      Graphene::Frustum.new(_retval, GICrystal::Transfer::None)
    end

    def intersects_box(box : Graphene::Box) : Bool
      # graphene_frustum_intersects_box: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_frustum_intersects_box(@pointer, box)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def intersects_sphere(sphere : Graphene::Sphere) : Bool
      # graphene_frustum_intersects_sphere: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_frustum_intersects_sphere(@pointer, sphere)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def to_unsafe
      @pointer
    end
  end
end
