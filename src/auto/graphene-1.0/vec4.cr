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
      _var = (@pointer + 0).as(Pointer(LibGraphene::Simd4F))
      Graphene::Simd4F.new(_var.value, GICrystal::Transfer::Full)
    end

    def value=(value : Graphene::Simd4F)
      # Property setter
      _var = (@pointer + 0).as(Pointer(LibGraphene::Simd4F)).value = value.to_unsafe
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGraphene.graphene_vec4_get_type
    end

    def self.alloc : Graphene::Vec4
      # graphene_vec4_alloc: (Constructor)
      # Returns: (transfer full)

      _retval = LibGraphene.graphene_vec4_alloc
      Graphene::Vec4.new(_retval, GICrystal::Transfer::Full)
    end

    def add(b : Graphene::Vec4) : Graphene::Vec4
      # graphene_vec4_add: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Vec4.new

      LibGraphene.graphene_vec4_add(self, b, res)
      res
    end

    def divide(b : Graphene::Vec4) : Graphene::Vec4
      # graphene_vec4_divide: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Vec4.new

      LibGraphene.graphene_vec4_divide(self, b, res)
      res
    end

    def dot(b : Graphene::Vec4) : Float32
      # graphene_vec4_dot: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_vec4_dot(self, b)
      _retval
    end

    def equal(v2 : Graphene::Vec4) : Bool
      # graphene_vec4_equal: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_vec4_equal(self, v2)
      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # graphene_vec4_free: (Method)
      # Returns: (transfer none)

      LibGraphene.graphene_vec4_free(self)
    end

    def w : Float32
      # graphene_vec4_get_w: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_vec4_get_w(self)
      _retval
    end

    def x : Float32
      # graphene_vec4_get_x: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_vec4_get_x(self)
      _retval
    end

    def xy : Graphene::Vec2
      # graphene_vec4_get_xy: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Vec2.new

      LibGraphene.graphene_vec4_get_xy(self, res)
      res
    end

    def xyz : Graphene::Vec3
      # graphene_vec4_get_xyz: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Vec3.new

      LibGraphene.graphene_vec4_get_xyz(self, res)
      res
    end

    def y : Float32
      # graphene_vec4_get_y: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_vec4_get_y(self)
      _retval
    end

    def z : Float32
      # graphene_vec4_get_z: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_vec4_get_z(self)
      _retval
    end

    def init(x : Float32, y : Float32, z : Float32, w : Float32) : Graphene::Vec4
      # graphene_vec4_init: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_vec4_init(self, x, y, z, w)
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_float(src : Enumerable(Float32)) : Graphene::Vec4
      # graphene_vec4_init_from_float: (Method)
      # @src: (array fixed-size=4 element-type Float)
      # Returns: (transfer none)

      src = src.to_a.to_unsafe

      _retval = LibGraphene.graphene_vec4_init_from_float(self, src)
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_float(*src : Float32)
      init_from_float(src)
    end

    def init_from_vec2(src : Graphene::Vec2, z : Float32, w : Float32) : Graphene::Vec4
      # graphene_vec4_init_from_vec2: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_vec4_init_from_vec2(self, src, z, w)
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_vec3(src : Graphene::Vec3, w : Float32) : Graphene::Vec4
      # graphene_vec4_init_from_vec3: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_vec4_init_from_vec3(self, src, w)
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_vec4(src : Graphene::Vec4) : Graphene::Vec4
      # graphene_vec4_init_from_vec4: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_vec4_init_from_vec4(self, src)
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def interpolate(v2 : Graphene::Vec4, factor : Float64) : Graphene::Vec4
      # graphene_vec4_interpolate: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Vec4.new

      LibGraphene.graphene_vec4_interpolate(self, v2, factor, res)
      res
    end

    def length : Float32
      # graphene_vec4_length: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_vec4_length(self)
      _retval
    end

    def max(b : Graphene::Vec4) : Graphene::Vec4
      # graphene_vec4_max: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Vec4.new

      LibGraphene.graphene_vec4_max(self, b, res)
      res
    end

    def min(b : Graphene::Vec4) : Graphene::Vec4
      # graphene_vec4_min: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Vec4.new

      LibGraphene.graphene_vec4_min(self, b, res)
      res
    end

    def multiply(b : Graphene::Vec4) : Graphene::Vec4
      # graphene_vec4_multiply: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Vec4.new

      LibGraphene.graphene_vec4_multiply(self, b, res)
      res
    end

    def near(v2 : Graphene::Vec4, epsilon : Float32) : Bool
      # graphene_vec4_near: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_vec4_near(self, v2, epsilon)
      GICrystal.to_bool(_retval)
    end

    def negate : Graphene::Vec4
      # graphene_vec4_negate: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Vec4.new

      LibGraphene.graphene_vec4_negate(self, res)
      res
    end

    def normalize : Graphene::Vec4
      # graphene_vec4_normalize: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Vec4.new

      LibGraphene.graphene_vec4_normalize(self, res)
      res
    end

    def scale(factor : Float32) : Graphene::Vec4
      # graphene_vec4_scale: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Vec4.new

      LibGraphene.graphene_vec4_scale(self, factor, res)
      res
    end

    def subtract(b : Graphene::Vec4) : Graphene::Vec4
      # graphene_vec4_subtract: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Vec4.new

      LibGraphene.graphene_vec4_subtract(self, b, res)
      res
    end

    def to_float(dest : Enumerable(Float32)) : Nil
      # graphene_vec4_to_float: (Method)
      # @dest: (out) (caller-allocates) (array fixed-size=4 element-type Float)
      # Returns: (transfer none)

      dest = dest.to_a.to_unsafe

      LibGraphene.graphene_vec4_to_float(self, dest)
    end

    def to_float(*dest : Float32)
      to_float(dest)
    end

    def self.one : Graphene::Vec4
      # graphene_vec4_one: (None)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_vec4_one
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def self.w_axis : Graphene::Vec4
      # graphene_vec4_w_axis: (None)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_vec4_w_axis
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def self.x_axis : Graphene::Vec4
      # graphene_vec4_x_axis: (None)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_vec4_x_axis
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def self.y_axis : Graphene::Vec4
      # graphene_vec4_y_axis: (None)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_vec4_y_axis
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def self.z_axis : Graphene::Vec4
      # graphene_vec4_z_axis: (None)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_vec4_z_axis
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def self.zero : Graphene::Vec4
      # graphene_vec4_zero: (None)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_vec4_zero
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end

    def to_unsafe
      @pointer
    end
  end
end
