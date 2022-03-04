module Graphene
  # Describe a rotation using Euler angles.
  #
  # The contents of the #graphene_euler_t structure are private
  # and should never be accessed directly.
  class Euler
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGraphene::Euler))
      @pointer.copy_from(pointer, sizeof(LibGraphene::Euler))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(angles : Graphene::Vec3? = nil, order : Graphene::EulerOrder? = nil)
      _ptr = Pointer(Void).malloc(20)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.angles = angles unless angles.nil?
      _instance.order = order unless order.nil?
      _instance
    end

    def finalize
    end

    def angles : Graphene::Vec3
      # Property getter
      _var = (@pointer + 0).as(Pointer(Void))
      Graphene::Vec3.new(_var.value, GICrystal::Transfer::None)
    end

    def angles=(value : Graphene::Vec3)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Void)).value = value.to_unsafe
      value
    end

    def order : Graphene::EulerOrder
      # Property getter
      _var = (@pointer + 16).as(Pointer(Int32))
      Graphene::EulerOrder.from_value(_var.value)
    end

    def order=(value : Graphene::EulerOrder)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Int32)).value = value.to_unsafe
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGraphene.graphene_euler_get_type
    end

    def self.alloc : self
      # graphene_euler_alloc: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_euler_alloc

      # Return value handling
      Graphene::Euler.new(_retval, GICrystal::Transfer::Full)
    end

    def equal(b : Graphene::Euler) : Bool
      # graphene_euler_equal: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_euler_equal(self, b)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # graphene_euler_free: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGraphene.graphene_euler_free(self)

      # Return value handling
    end

    def alpha : Float32
      # graphene_euler_get_alpha: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_euler_get_alpha(self)

      # Return value handling
      _retval
    end

    def beta : Float32
      # graphene_euler_get_beta: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_euler_get_beta(self)

      # Return value handling
      _retval
    end

    def gamma : Float32
      # graphene_euler_get_gamma: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_euler_get_gamma(self)

      # Return value handling
      _retval
    end

    def order : Graphene::EulerOrder
      # graphene_euler_get_order: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_euler_get_order(self)

      # Return value handling
      Graphene::EulerOrder.from_value(_retval)
    end

    def x : Float32
      # graphene_euler_get_x: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_euler_get_x(self)

      # Return value handling
      _retval
    end

    def y : Float32
      # graphene_euler_get_y: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_euler_get_y(self)

      # Return value handling
      _retval
    end

    def z : Float32
      # graphene_euler_get_z: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_euler_get_z(self)

      # Return value handling
      _retval
    end

    def init(x : Float32, y : Float32, z : Float32) : Graphene::Euler
      # graphene_euler_init: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_euler_init(self, x, y, z)

      # Return value handling
      Graphene::Euler.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_euler(src : Graphene::Euler?) : Graphene::Euler
      # graphene_euler_init_from_euler: (Method)
      # @src: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      src = if src.nil?
              Pointer(Void).null
            else
              src.to_unsafe
            end

      # C call
      _retval = LibGraphene.graphene_euler_init_from_euler(self, src)

      # Return value handling
      Graphene::Euler.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_matrix(m : Graphene::Matrix?, order : Graphene::EulerOrder) : Graphene::Euler
      # graphene_euler_init_from_matrix: (Method)
      # @m: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      m = if m.nil?
            Pointer(Void).null
          else
            m.to_unsafe
          end

      # C call
      _retval = LibGraphene.graphene_euler_init_from_matrix(self, m, order)

      # Return value handling
      Graphene::Euler.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_quaternion(q : Graphene::Quaternion?, order : Graphene::EulerOrder) : Graphene::Euler
      # graphene_euler_init_from_quaternion: (Method)
      # @q: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      q = if q.nil?
            Pointer(Void).null
          else
            q.to_unsafe
          end

      # C call
      _retval = LibGraphene.graphene_euler_init_from_quaternion(self, q, order)

      # Return value handling
      Graphene::Euler.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_radians(x : Float32, y : Float32, z : Float32, order : Graphene::EulerOrder) : Graphene::Euler
      # graphene_euler_init_from_radians: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_euler_init_from_radians(self, x, y, z, order)

      # Return value handling
      Graphene::Euler.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_vec3(v : Graphene::Vec3?, order : Graphene::EulerOrder) : Graphene::Euler
      # graphene_euler_init_from_vec3: (Method)
      # @v: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      v = if v.nil?
            Pointer(Void).null
          else
            v.to_unsafe
          end

      # C call
      _retval = LibGraphene.graphene_euler_init_from_vec3(self, v, order)

      # Return value handling
      Graphene::Euler.new(_retval, GICrystal::Transfer::None)
    end

    def init_with_order(x : Float32, y : Float32, z : Float32, order : Graphene::EulerOrder) : Graphene::Euler
      # graphene_euler_init_with_order: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_euler_init_with_order(self, x, y, z, order)

      # Return value handling
      Graphene::Euler.new(_retval, GICrystal::Transfer::None)
    end

    def reorder(order : Graphene::EulerOrder) : Graphene::Euler
      # graphene_euler_reorder: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Euler.new

      # C call
      LibGraphene.graphene_euler_reorder(self, order, res)

      # Return value handling
      res
    end

    def to_matrix : Graphene::Matrix
      # graphene_euler_to_matrix: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Matrix.new

      # C call
      LibGraphene.graphene_euler_to_matrix(self, res)

      # Return value handling
      res
    end

    def to_quaternion : Graphene::Quaternion
      # graphene_euler_to_quaternion: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Quaternion.new

      # C call
      LibGraphene.graphene_euler_to_quaternion(self, res)

      # Return value handling
      res
    end

    def to_vec3 : Graphene::Vec3
      # graphene_euler_to_vec3: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Vec3.new

      # C call
      LibGraphene.graphene_euler_to_vec3(self, res)

      # Return value handling
      res
    end

    def to_unsafe
      @pointer
    end
  end
end
