module Graphene
  # A structure capable of holding a vector with four dimensions: x, y, z, and w.
  #
  # The contents of the #graphene_vec4_t structure are private and should
  # never be accessed directly.
  class Vec4
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGraphene::Vec4))
      @pointer.copy_from(pointer, sizeof(LibGraphene::Vec4))
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

    def value : Graphene::Simd4F
      # Property getter
      _var = (@pointer + 0).as(Pointer(Void))
      Graphene::Simd4F.new(_var.value, GICrystal::Transfer::None)
    end

    def value=(value : Graphene::Simd4F)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Void)).value = value.to_unsafe
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGraphene.graphene_vec4_get_type
    end

    def self.alloc : self
      # graphene_vec4_alloc: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec4_alloc

      # Return value handling
      Graphene::Vec4.new(_retval, GICrystal::Transfer::Full)
    end

    def add(b : Graphene::Vec4) : Graphene::Vec4
      # graphene_vec4_add: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec4.new

      # C call
      LibGraphene.graphene_vec4_add(self, b, res)

      # Return value handling
      res
    end

    def divide(b : Graphene::Vec4) : Graphene::Vec4
      # graphene_vec4_divide: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec4.new

      # C call
      LibGraphene.graphene_vec4_divide(self, b, res)

      # Return value handling
      res
    end

    def dot(b : Graphene::Vec4) : Float32
      # graphene_vec4_dot: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec4_dot(self, b)

      # Return value handling
      _retval
    end

    def equal(v2 : Graphene::Vec4) : Bool
      # graphene_vec4_equal: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec4_equal(self, v2)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # graphene_vec4_free: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGraphene.graphene_vec4_free(self)

      # Return value handling
    end

    def w : Float32
      # graphene_vec4_get_w: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec4_get_w(self)

      # Return value handling
      _retval
    end

    def x : Float32
      # graphene_vec4_get_x: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec4_get_x(self)

      # Return value handling
      _retval
    end

    def xy : Graphene::Vec2
      # graphene_vec4_get_xy: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec2.new

      # C call
      LibGraphene.graphene_vec4_get_xy(self, res)

      # Return value handling
      res
    end

    def xyz : Graphene::Vec3
      # graphene_vec4_get_xyz: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec3.new

      # C call
      LibGraphene.graphene_vec4_get_xyz(self, res)

      # Return value handling
      res
    end

    def y : Float32
      # graphene_vec4_get_y: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec4_get_y(self)

      # Return value handling
      _retval
    end

    def z : Float32
      # graphene_vec4_get_z: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec4_get_z(self)

      # Return value handling
      _retval
    end

    def init(x : Float32, y : Float32, z : Float32, w : Float32) : Graphene::Vec4
      # graphene_vec4_init: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec4_init(self, x, y, z, w)

      # Return value handling
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_float(src : Enumerable(Float32)) : Graphene::Vec4
      # graphene_vec4_init_from_float: (Method)
      # @src: (array fixed-size=4 element-type Float)
      # Returns: (transfer none)

      # Handle parameters
      src = src.to_a.to_unsafe

      # C call
      _retval = LibGraphene.graphene_vec4_init_from_float(self, src)

      # Return value handling
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_float(*src : Float32)
      init_from_float(src)
    end

    def init_from_vec2(src : Graphene::Vec2, z : Float32, w : Float32) : Graphene::Vec4
      # graphene_vec4_init_from_vec2: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec4_init_from_vec2(self, src, z, w)

      # Return value handling
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_vec3(src : Graphene::Vec3, w : Float32) : Graphene::Vec4
      # graphene_vec4_init_from_vec3: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec4_init_from_vec3(self, src, w)

      # Return value handling
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_vec4(src : Graphene::Vec4) : Graphene::Vec4
      # graphene_vec4_init_from_vec4: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec4_init_from_vec4(self, src)

      # Return value handling
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def interpolate(v2 : Graphene::Vec4, factor : Float64) : Graphene::Vec4
      # graphene_vec4_interpolate: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec4.new

      # C call
      LibGraphene.graphene_vec4_interpolate(self, v2, factor, res)

      # Return value handling
      res
    end

    def length : Float32
      # graphene_vec4_length: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec4_length(self)

      # Return value handling
      _retval
    end

    def max(b : Graphene::Vec4) : Graphene::Vec4
      # graphene_vec4_max: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec4.new

      # C call
      LibGraphene.graphene_vec4_max(self, b, res)

      # Return value handling
      res
    end

    def min(b : Graphene::Vec4) : Graphene::Vec4
      # graphene_vec4_min: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec4.new

      # C call
      LibGraphene.graphene_vec4_min(self, b, res)

      # Return value handling
      res
    end

    def multiply(b : Graphene::Vec4) : Graphene::Vec4
      # graphene_vec4_multiply: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec4.new

      # C call
      LibGraphene.graphene_vec4_multiply(self, b, res)

      # Return value handling
      res
    end

    def near(v2 : Graphene::Vec4, epsilon : Float32) : Bool
      # graphene_vec4_near: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec4_near(self, v2, epsilon)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def negate : Graphene::Vec4
      # graphene_vec4_negate: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec4.new

      # C call
      LibGraphene.graphene_vec4_negate(self, res)

      # Return value handling
      res
    end

    def normalize : Graphene::Vec4
      # graphene_vec4_normalize: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec4.new

      # C call
      LibGraphene.graphene_vec4_normalize(self, res)

      # Return value handling
      res
    end

    def scale(factor : Float32) : Graphene::Vec4
      # graphene_vec4_scale: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec4.new

      # C call
      LibGraphene.graphene_vec4_scale(self, factor, res)

      # Return value handling
      res
    end

    def subtract(b : Graphene::Vec4) : Graphene::Vec4
      # graphene_vec4_subtract: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec4.new

      # C call
      LibGraphene.graphene_vec4_subtract(self, b, res)

      # Return value handling
      res
    end

    def to_float(dest : Enumerable(Float32)) : Nil
      # graphene_vec4_to_float: (Method)
      # @dest: (out) (caller-allocates) (array fixed-size=4 element-type Float)
      # Returns: (transfer none)

      # Handle parameters
      dest = dest.to_a.to_unsafe

      # C call
      LibGraphene.graphene_vec4_to_float(self, dest)

      # Return value handling
    end

    def to_float(*dest : Float32)
      to_float(dest)
    end

    def self.one : Graphene::Vec4
      # graphene_vec4_one: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec4_one

      # Return value handling
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def self.w_axis : Graphene::Vec4
      # graphene_vec4_w_axis: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec4_w_axis

      # Return value handling
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def self.x_axis : Graphene::Vec4
      # graphene_vec4_x_axis: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec4_x_axis

      # Return value handling
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def self.y_axis : Graphene::Vec4
      # graphene_vec4_y_axis: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec4_y_axis

      # Return value handling
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def self.z_axis : Graphene::Vec4
      # graphene_vec4_z_axis: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec4_z_axis

      # Return value handling
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def self.zero : Graphene::Vec4
      # graphene_vec4_zero: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec4_zero

      # Return value handling
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def to_unsafe
      @pointer
    end
  end
end
