module Graphene
  # A point with three components: X, Y, and Z.
  class Point3D
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGraphene::Point3D))
      @pointer.copy_from(pointer, sizeof(LibGraphene::Point3D))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(x : Float32? = nil, y : Float32? = nil, z : Float32? = nil)
      _ptr = Pointer(Void).malloc(12)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.x = x unless x.nil?
      _instance.y = y unless y.nil?
      _instance.z = z unless z.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGraphene::Point3D)).zero?
    end

    def x : Float32
      _var = (@pointer + 0).as(Pointer(Float32))
      _var.value
    end

    def x=(value : Float32)
      _var = (@pointer + 0).as(Pointer(Float32)).value = value
      value
    end

    def y : Float32
      _var = (@pointer + 4).as(Pointer(Float32))
      _var.value
    end

    def y=(value : Float32)
      _var = (@pointer + 4).as(Pointer(Float32)).value = value
      value
    end

    def z : Float32
      _var = (@pointer + 8).as(Pointer(Float32))
      _var.value
    end

    def z=(value : Float32)
      _var = (@pointer + 8).as(Pointer(Float32)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGraphene.graphene_point3d_get_type
    end

    def self.alloc : self
      # graphene_point3d_alloc: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGraphene.graphene_point3d_alloc

      # Return value handling

      Graphene::Point3D.new(_retval, GICrystal::Transfer::Full)
    end

    def cross(b : Graphene::Point3D) : Graphene::Point3D
      # graphene_point3d_cross: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Point3D.new

      # C call
      LibGraphene.graphene_point3d_cross(self, b, res)

      # Return value handling

      res
    end

    def distance(b : Graphene::Point3D) : Graphene::Vec3
      # graphene_point3d_distance: (Method)
      # @delta: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      delta = Pointer(Void).null
      # Generator::CallerAllocatesPlan
      delta = Graphene::Vec3.new

      # C call
      _retval = LibGraphene.graphene_point3d_distance(self, b, delta)

      # Return value handling

      delta
    end

    def dot(b : Graphene::Point3D) : Float32
      # graphene_point3d_dot: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_point3d_dot(self, b)

      # Return value handling

      _retval
    end

    def equal(b : Graphene::Point3D) : Bool
      # graphene_point3d_equal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_point3d_equal(self, b)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # graphene_point3d_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_point3d_free(self)

      # Return value handling
    end

    def init(x : Float32, y : Float32, z : Float32) : Graphene::Point3D
      # graphene_point3d_init: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_point3d_init(self, x, y, z)

      # Return value handling

      Graphene::Point3D.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_point(src : Graphene::Point3D) : Graphene::Point3D
      # graphene_point3d_init_from_point: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_point3d_init_from_point(self, src)

      # Return value handling

      Graphene::Point3D.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_vec3(v : Graphene::Vec3) : Graphene::Point3D
      # graphene_point3d_init_from_vec3: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_point3d_init_from_vec3(self, v)

      # Return value handling

      Graphene::Point3D.new(_retval, GICrystal::Transfer::None)
    end

    def interpolate(b : Graphene::Point3D, factor : Float64) : Graphene::Point3D
      # graphene_point3d_interpolate: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Point3D.new

      # C call
      LibGraphene.graphene_point3d_interpolate(self, b, factor, res)

      # Return value handling

      res
    end

    def length : Float32
      # graphene_point3d_length: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_point3d_length(self)

      # Return value handling

      _retval
    end

    def near(b : Graphene::Point3D, epsilon : Float32) : Bool
      # graphene_point3d_near: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_point3d_near(self, b, epsilon)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def normalize : Graphene::Point3D
      # graphene_point3d_normalize: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Point3D.new

      # C call
      LibGraphene.graphene_point3d_normalize(self, res)

      # Return value handling

      res
    end

    def normalize_viewport(viewport : Graphene::Rect, z_near : Float32, z_far : Float32) : Graphene::Point3D
      # graphene_point3d_normalize_viewport: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Point3D.new

      # C call
      LibGraphene.graphene_point3d_normalize_viewport(self, viewport, z_near, z_far, res)

      # Return value handling

      res
    end

    def scale(factor : Float32) : Graphene::Point3D
      # graphene_point3d_scale: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Point3D.new

      # C call
      LibGraphene.graphene_point3d_scale(self, factor, res)

      # Return value handling

      res
    end

    def to_vec3 : Graphene::Vec3
      # graphene_point3d_to_vec3: (Method)
      # @v: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      v = Graphene::Vec3.new

      # C call
      LibGraphene.graphene_point3d_to_vec3(self, v)

      # Return value handling

      v
    end

    def self.zero : Graphene::Point3D
      # graphene_point3d_zero: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_point3d_zero

      # Return value handling

      Graphene::Point3D.new(_retval, GICrystal::Transfer::None)
    end

    def to_unsafe
      @pointer
    end
  end
end
