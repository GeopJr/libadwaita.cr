module Graphene
  # A structure capable of holding a vector with three dimensions: x, y, and z.
  #
  # The contents of the #graphene_vec3_t structure are private and should
  # never be accessed directly.
  class Vec3
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGraphene::Vec3))
      @pointer.copy_from(pointer, sizeof(LibGraphene::Vec3))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(value : Graphene::Simd4F? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.value = value unless value.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGraphene::Vec3)).zero?
    end

    def value : Graphene::Simd4F
      _var = (@pointer + 0).as(Pointer(Void))
      Graphene::Simd4F.new(_var, GICrystal::Transfer::None)
    end

    def value=(value : Graphene::Simd4F)
      _var = (@pointer + 0).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGraphene::Vec3))
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGraphene.graphene_vec3_get_type
    end

    def self.alloc : self
      # graphene_vec3_alloc: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGraphene.graphene_vec3_alloc

      # Return value handling

      Graphene::Vec3.new(_retval, GICrystal::Transfer::Full)
    end

    def add(b : Graphene::Vec3) : Graphene::Vec3
      # graphene_vec3_add: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Vec3.new
      # C call
      LibGraphene.graphene_vec3_add(self, b, res)

      # Return value handling

      res
    end

    def cross(b : Graphene::Vec3) : Graphene::Vec3
      # graphene_vec3_cross: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Vec3.new
      # C call
      LibGraphene.graphene_vec3_cross(self, b, res)

      # Return value handling

      res
    end

    def divide(b : Graphene::Vec3) : Graphene::Vec3
      # graphene_vec3_divide: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Vec3.new
      # C call
      LibGraphene.graphene_vec3_divide(self, b, res)

      # Return value handling

      res
    end

    def dot(b : Graphene::Vec3) : Float32
      # graphene_vec3_dot: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_vec3_dot(self, b)

      # Return value handling

      _retval
    end

    def equal(v2 : Graphene::Vec3) : Bool
      # graphene_vec3_equal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_vec3_equal(self, v2)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # graphene_vec3_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_vec3_free(self)

      # Return value handling
    end

    def x : Float32
      # graphene_vec3_get_x: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_vec3_get_x(self)

      # Return value handling

      _retval
    end

    def xy : Graphene::Vec2
      # graphene_vec3_get_xy: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Vec2.new
      # C call
      LibGraphene.graphene_vec3_get_xy(self, res)

      # Return value handling

      res
    end

    def xy0 : Graphene::Vec3
      # graphene_vec3_get_xy0: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Vec3.new
      # C call
      LibGraphene.graphene_vec3_get_xy0(self, res)

      # Return value handling

      res
    end

    def xyz0 : Graphene::Vec4
      # graphene_vec3_get_xyz0: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Vec4.new
      # C call
      LibGraphene.graphene_vec3_get_xyz0(self, res)

      # Return value handling

      res
    end

    def xyz1 : Graphene::Vec4
      # graphene_vec3_get_xyz1: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Vec4.new
      # C call
      LibGraphene.graphene_vec3_get_xyz1(self, res)

      # Return value handling

      res
    end

    def xyzw(w : Float32) : Graphene::Vec4
      # graphene_vec3_get_xyzw: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Vec4.new
      # C call
      LibGraphene.graphene_vec3_get_xyzw(self, w, res)

      # Return value handling

      res
    end

    def y : Float32
      # graphene_vec3_get_y: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_vec3_get_y(self)

      # Return value handling

      _retval
    end

    def z : Float32
      # graphene_vec3_get_z: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_vec3_get_z(self)

      # Return value handling

      _retval
    end

    def init(x : Float32, y : Float32, z : Float32) : Graphene::Vec3
      # graphene_vec3_init: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_vec3_init(self, x, y, z)

      # Return value handling

      Graphene::Vec3.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_float(src : Enumerable(Float32)) : Graphene::Vec3
      # graphene_vec3_init_from_float: (Method)
      # @src: (array fixed-size=3 element-type Float)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      raise ArgumentError.new("Enumerable of size < 3") if src.size < 3

      src = src.to_a.to_unsafe

      # C call
      _retval = LibGraphene.graphene_vec3_init_from_float(self, src)

      # Return value handling

      Graphene::Vec3.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_float(*src : Float32)
      init_from_float(src)
    end

    def init_from_vec3(src : Graphene::Vec3) : Graphene::Vec3
      # graphene_vec3_init_from_vec3: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_vec3_init_from_vec3(self, src)

      # Return value handling

      Graphene::Vec3.new(_retval, GICrystal::Transfer::None)
    end

    def interpolate(v2 : Graphene::Vec3, factor : Float64) : Graphene::Vec3
      # graphene_vec3_interpolate: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Vec3.new
      # C call
      LibGraphene.graphene_vec3_interpolate(self, v2, factor, res)

      # Return value handling

      res
    end

    def length : Float32
      # graphene_vec3_length: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_vec3_length(self)

      # Return value handling

      _retval
    end

    def max(b : Graphene::Vec3) : Graphene::Vec3
      # graphene_vec3_max: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Vec3.new
      # C call
      LibGraphene.graphene_vec3_max(self, b, res)

      # Return value handling

      res
    end

    def min(b : Graphene::Vec3) : Graphene::Vec3
      # graphene_vec3_min: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Vec3.new
      # C call
      LibGraphene.graphene_vec3_min(self, b, res)

      # Return value handling

      res
    end

    def multiply(b : Graphene::Vec3) : Graphene::Vec3
      # graphene_vec3_multiply: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Vec3.new
      # C call
      LibGraphene.graphene_vec3_multiply(self, b, res)

      # Return value handling

      res
    end

    def near(v2 : Graphene::Vec3, epsilon : Float32) : Bool
      # graphene_vec3_near: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_vec3_near(self, v2, epsilon)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def negate : Graphene::Vec3
      # graphene_vec3_negate: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Vec3.new
      # C call
      LibGraphene.graphene_vec3_negate(self, res)

      # Return value handling

      res
    end

    def normalize : Graphene::Vec3
      # graphene_vec3_normalize: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Vec3.new
      # C call
      LibGraphene.graphene_vec3_normalize(self, res)

      # Return value handling

      res
    end

    def scale(factor : Float32) : Graphene::Vec3
      # graphene_vec3_scale: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Vec3.new
      # C call
      LibGraphene.graphene_vec3_scale(self, factor, res)

      # Return value handling

      res
    end

    def subtract(b : Graphene::Vec3) : Graphene::Vec3
      # graphene_vec3_subtract: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Vec3.new
      # C call
      LibGraphene.graphene_vec3_subtract(self, b, res)

      # Return value handling

      res
    end

    def to_float(dest : Enumerable(Float32)) : Nil
      # graphene_vec3_to_float: (Method)
      # @dest: (out) (caller-allocates) (array fixed-size=3 element-type Float)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      raise ArgumentError.new("Enumerable of size < 3") if dest.size < 3

      dest = dest.to_a.to_unsafe

      # C call
      LibGraphene.graphene_vec3_to_float(self, dest)

      # Return value handling
    end

    def to_float(*dest : Float32)
      to_float(dest)
    end

    def self.one : Graphene::Vec3
      # graphene_vec3_one: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_vec3_one

      # Return value handling

      Graphene::Vec3.new(_retval, GICrystal::Transfer::None)
    end

    def self.x_axis : Graphene::Vec3
      # graphene_vec3_x_axis: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_vec3_x_axis

      # Return value handling

      Graphene::Vec3.new(_retval, GICrystal::Transfer::None)
    end

    def self.y_axis : Graphene::Vec3
      # graphene_vec3_y_axis: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_vec3_y_axis

      # Return value handling

      Graphene::Vec3.new(_retval, GICrystal::Transfer::None)
    end

    def self.z_axis : Graphene::Vec3
      # graphene_vec3_z_axis: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_vec3_z_axis

      # Return value handling

      Graphene::Vec3.new(_retval, GICrystal::Transfer::None)
    end

    def self.zero : Graphene::Vec3
      # graphene_vec3_zero: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_vec3_zero

      # Return value handling

      Graphene::Vec3.new(_retval, GICrystal::Transfer::None)
    end

    def to_unsafe
      @pointer
    end
  end
end
