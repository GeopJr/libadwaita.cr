module Graphene
  # A quaternion.
  #
  # The contents of the #graphene_quaternion_t structure are private
  # and should never be accessed directly.
  class Quaternion
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGraphene::Quaternion))
      @pointer.copy_from(pointer, sizeof(LibGraphene::Quaternion))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(x : Float32? = nil, y : Float32? = nil, z : Float32? = nil, w : Float32? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.x = x unless x.nil?
      _instance.y = y unless y.nil?
      _instance.z = z unless z.nil?
      _instance.w = w unless w.nil?
      _instance
    end

    def finalize
    end

    def x : Float32
      # Property getter
      _var = (@pointer + 0).as(Pointer(Float32))
      _var.value
    end

    def x=(value : Float32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Float32)).value = value
      value
    end

    def y : Float32
      # Property getter
      _var = (@pointer + 4).as(Pointer(Float32))
      _var.value
    end

    def y=(value : Float32)
      # Property setter
      _var = (@pointer + 4).as(Pointer(Float32)).value = value
      value
    end

    def z : Float32
      # Property getter
      _var = (@pointer + 8).as(Pointer(Float32))
      _var.value
    end

    def z=(value : Float32)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Float32)).value = value
      value
    end

    def w : Float32
      # Property getter
      _var = (@pointer + 12).as(Pointer(Float32))
      _var.value
    end

    def w=(value : Float32)
      # Property setter
      _var = (@pointer + 12).as(Pointer(Float32)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGraphene.graphene_quaternion_get_type
    end

    def self.alloc : Graphene::Quaternion
      # graphene_quaternion_alloc: (Constructor)
      # Returns: (transfer full)

      _retval = LibGraphene.graphene_quaternion_alloc
      Graphene::Quaternion.new(_retval, GICrystal::Transfer::Full)
    end

    def add(b : Graphene::Quaternion) : Graphene::Quaternion
      # graphene_quaternion_add: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Quaternion.new

      LibGraphene.graphene_quaternion_add(self, b, res)
      res
    end

    def dot(b : Graphene::Quaternion) : Float32
      # graphene_quaternion_dot: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_quaternion_dot(self, b)
      _retval
    end

    def equal(b : Graphene::Quaternion) : Bool
      # graphene_quaternion_equal: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_quaternion_equal(self, b)
      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # graphene_quaternion_free: (Method)
      # Returns: (transfer none)

      LibGraphene.graphene_quaternion_free(self)
    end

    def init(x : Float32, y : Float32, z : Float32, w : Float32) : Graphene::Quaternion
      # graphene_quaternion_init: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_quaternion_init(self, x, y, z, w)
      Graphene::Quaternion.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_angle_vec3(angle : Float32, axis : Graphene::Vec3) : Graphene::Quaternion
      # graphene_quaternion_init_from_angle_vec3: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_quaternion_init_from_angle_vec3(self, angle, axis)
      Graphene::Quaternion.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_angles(deg_x : Float32, deg_y : Float32, deg_z : Float32) : Graphene::Quaternion
      # graphene_quaternion_init_from_angles: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_quaternion_init_from_angles(self, deg_x, deg_y, deg_z)
      Graphene::Quaternion.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_euler(e : Graphene::Euler) : Graphene::Quaternion
      # graphene_quaternion_init_from_euler: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_quaternion_init_from_euler(self, e)
      Graphene::Quaternion.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_matrix(m : Graphene::Matrix) : Graphene::Quaternion
      # graphene_quaternion_init_from_matrix: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_quaternion_init_from_matrix(self, m)
      Graphene::Quaternion.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_quaternion(src : Graphene::Quaternion) : Graphene::Quaternion
      # graphene_quaternion_init_from_quaternion: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_quaternion_init_from_quaternion(self, src)
      Graphene::Quaternion.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_radians(rad_x : Float32, rad_y : Float32, rad_z : Float32) : Graphene::Quaternion
      # graphene_quaternion_init_from_radians: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_quaternion_init_from_radians(self, rad_x, rad_y, rad_z)
      Graphene::Quaternion.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_vec4(src : Graphene::Vec4) : Graphene::Quaternion
      # graphene_quaternion_init_from_vec4: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_quaternion_init_from_vec4(self, src)
      Graphene::Quaternion.new(_retval, GICrystal::Transfer::None)
    end

    def init_identity : Graphene::Quaternion
      # graphene_quaternion_init_identity: (Method)
      # Returns: (transfer none)

      _retval = LibGraphene.graphene_quaternion_init_identity(self)
      Graphene::Quaternion.new(_retval, GICrystal::Transfer::None)
    end

    def invert : Graphene::Quaternion
      # graphene_quaternion_invert: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Quaternion.new

      LibGraphene.graphene_quaternion_invert(self, res)
      res
    end

    def multiply(b : Graphene::Quaternion) : Graphene::Quaternion
      # graphene_quaternion_multiply: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Quaternion.new

      LibGraphene.graphene_quaternion_multiply(self, b, res)
      res
    end

    def normalize : Graphene::Quaternion
      # graphene_quaternion_normalize: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Quaternion.new

      LibGraphene.graphene_quaternion_normalize(self, res)
      res
    end

    def scale(factor : Float32) : Graphene::Quaternion
      # graphene_quaternion_scale: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Quaternion.new

      LibGraphene.graphene_quaternion_scale(self, factor, res)
      res
    end

    def slerp(b : Graphene::Quaternion, factor : Float32) : Graphene::Quaternion
      # graphene_quaternion_slerp: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Quaternion.new

      LibGraphene.graphene_quaternion_slerp(self, b, factor, res)
      res
    end

    def to_angle_vec3(angle : Float32) : Graphene::Vec3
      # graphene_quaternion_to_angle_vec3: (Method)
      # @angle: (out) (transfer full)
      # @axis: (out) (caller-allocates)
      # Returns: (transfer none)

      axis = Graphene::Vec3.new

      LibGraphene.graphene_quaternion_to_angle_vec3(self, angle, axis)
      axis
    end

    def to_angles : Nil
      # graphene_quaternion_to_angles: (Method)
      # @deg_x: (out) (transfer full) (optional)
      # @deg_y: (out) (transfer full) (optional)
      # @deg_z: (out) (transfer full) (optional)
      # Returns: (transfer none)

      deg_x = Pointer(Float32).null
      deg_y = Pointer(Float32).null
      deg_z = Pointer(Float32).null

      LibGraphene.graphene_quaternion_to_angles(self, deg_x, deg_y, deg_z)
    end

    def to_matrix : Graphene::Matrix
      # graphene_quaternion_to_matrix: (Method)
      # @m: (out) (caller-allocates)
      # Returns: (transfer none)

      m = Graphene::Matrix.new

      LibGraphene.graphene_quaternion_to_matrix(self, m)
      m
    end

    def to_radians : Nil
      # graphene_quaternion_to_radians: (Method)
      # @rad_x: (out) (transfer full) (optional)
      # @rad_y: (out) (transfer full) (optional)
      # @rad_z: (out) (transfer full) (optional)
      # Returns: (transfer none)

      rad_x = Pointer(Float32).null
      rad_y = Pointer(Float32).null
      rad_z = Pointer(Float32).null

      LibGraphene.graphene_quaternion_to_radians(self, rad_x, rad_y, rad_z)
    end

    def to_vec4 : Graphene::Vec4
      # graphene_quaternion_to_vec4: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      res = Graphene::Vec4.new

      LibGraphene.graphene_quaternion_to_vec4(self, res)
      res
    end

    def to_unsafe
      @pointer
    end
  end
end
