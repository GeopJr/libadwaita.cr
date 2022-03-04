module Graphene
  # A structure capable of holding a vector with two dimensions, x and y.
  #
  # The contents of the #graphene_vec2_t structure are private and should
  # never be accessed directly.
  class Vec2
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGraphene::Vec2))
      @pointer.copy_from(pointer, sizeof(LibGraphene::Vec2))
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
      LibGraphene.graphene_vec2_get_type
    end

    def self.alloc : self
      # graphene_vec2_alloc: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec2_alloc

      # Return value handling
      Graphene::Vec2.new(_retval, GICrystal::Transfer::Full)
    end

    def add(b : Graphene::Vec2) : Graphene::Vec2
      # graphene_vec2_add: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec2.new

      # C call
      LibGraphene.graphene_vec2_add(self, b, res)

      # Return value handling
      res
    end

    def divide(b : Graphene::Vec2) : Graphene::Vec2
      # graphene_vec2_divide: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec2.new

      # C call
      LibGraphene.graphene_vec2_divide(self, b, res)

      # Return value handling
      res
    end

    def dot(b : Graphene::Vec2) : Float32
      # graphene_vec2_dot: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec2_dot(self, b)

      # Return value handling
      _retval
    end

    def equal(v2 : Graphene::Vec2) : Bool
      # graphene_vec2_equal: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec2_equal(self, v2)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # graphene_vec2_free: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGraphene.graphene_vec2_free(self)

      # Return value handling
    end

    def x : Float32
      # graphene_vec2_get_x: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec2_get_x(self)

      # Return value handling
      _retval
    end

    def y : Float32
      # graphene_vec2_get_y: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec2_get_y(self)

      # Return value handling
      _retval
    end

    def init(x : Float32, y : Float32) : Graphene::Vec2
      # graphene_vec2_init: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec2_init(self, x, y)

      # Return value handling
      Graphene::Vec2.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_float(src : Enumerable(Float32)) : Graphene::Vec2
      # graphene_vec2_init_from_float: (Method)
      # @src: (array fixed-size=2 element-type Float)
      # Returns: (transfer none)

      # Handle parameters
      src = src.to_a.to_unsafe

      # C call
      _retval = LibGraphene.graphene_vec2_init_from_float(self, src)

      # Return value handling
      Graphene::Vec2.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_float(*src : Float32)
      init_from_float(src)
    end

    def init_from_vec2(src : Graphene::Vec2) : Graphene::Vec2
      # graphene_vec2_init_from_vec2: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec2_init_from_vec2(self, src)

      # Return value handling
      Graphene::Vec2.new(_retval, GICrystal::Transfer::None)
    end

    def interpolate(v2 : Graphene::Vec2, factor : Float64) : Graphene::Vec2
      # graphene_vec2_interpolate: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec2.new

      # C call
      LibGraphene.graphene_vec2_interpolate(self, v2, factor, res)

      # Return value handling
      res
    end

    def length : Float32
      # graphene_vec2_length: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec2_length(self)

      # Return value handling
      _retval
    end

    def max(b : Graphene::Vec2) : Graphene::Vec2
      # graphene_vec2_max: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec2.new

      # C call
      LibGraphene.graphene_vec2_max(self, b, res)

      # Return value handling
      res
    end

    def min(b : Graphene::Vec2) : Graphene::Vec2
      # graphene_vec2_min: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec2.new

      # C call
      LibGraphene.graphene_vec2_min(self, b, res)

      # Return value handling
      res
    end

    def multiply(b : Graphene::Vec2) : Graphene::Vec2
      # graphene_vec2_multiply: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec2.new

      # C call
      LibGraphene.graphene_vec2_multiply(self, b, res)

      # Return value handling
      res
    end

    def near(v2 : Graphene::Vec2, epsilon : Float32) : Bool
      # graphene_vec2_near: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec2_near(self, v2, epsilon)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def negate : Graphene::Vec2
      # graphene_vec2_negate: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec2.new

      # C call
      LibGraphene.graphene_vec2_negate(self, res)

      # Return value handling
      res
    end

    def normalize : Graphene::Vec2
      # graphene_vec2_normalize: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec2.new

      # C call
      LibGraphene.graphene_vec2_normalize(self, res)

      # Return value handling
      res
    end

    def scale(factor : Float32) : Graphene::Vec2
      # graphene_vec2_scale: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec2.new

      # C call
      LibGraphene.graphene_vec2_scale(self, factor, res)

      # Return value handling
      res
    end

    def subtract(b : Graphene::Vec2) : Graphene::Vec2
      # graphene_vec2_subtract: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec2.new

      # C call
      LibGraphene.graphene_vec2_subtract(self, b, res)

      # Return value handling
      res
    end

    def to_float(dest : Enumerable(Float32)) : Nil
      # graphene_vec2_to_float: (Method)
      # @dest: (out) (caller-allocates) (array fixed-size=2 element-type Float)
      # Returns: (transfer none)

      # Handle parameters
      dest = dest.to_a.to_unsafe

      # C call
      LibGraphene.graphene_vec2_to_float(self, dest)

      # Return value handling
    end

    def to_float(*dest : Float32)
      to_float(dest)
    end

    def self.one : Graphene::Vec2
      # graphene_vec2_one: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec2_one

      # Return value handling
      Graphene::Vec2.new(_retval, GICrystal::Transfer::None)
    end

    def self.x_axis : Graphene::Vec2
      # graphene_vec2_x_axis: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec2_x_axis

      # Return value handling
      Graphene::Vec2.new(_retval, GICrystal::Transfer::None)
    end

    def self.y_axis : Graphene::Vec2
      # graphene_vec2_y_axis: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec2_y_axis

      # Return value handling
      Graphene::Vec2.new(_retval, GICrystal::Transfer::None)
    end

    def self.zero : Graphene::Vec2
      # graphene_vec2_zero: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_vec2_zero

      # Return value handling
      Graphene::Vec2.new(_retval, GICrystal::Transfer::None)
    end

    def to_unsafe
      @pointer
    end
  end
end
