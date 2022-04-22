module Graphene
  # A 2D plane that extends infinitely in a 3D volume.
  #
  # The contents of the `graphene_plane_t` are private, and should not be
  # modified directly.
  class Plane
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGraphene::Plane))
      @pointer.copy_from(pointer, sizeof(LibGraphene::Plane))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(normal : Graphene::Vec3? = nil, constant : Float32? = nil)
      _ptr = Pointer(Void).malloc(20)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.normal = normal unless normal.nil?
      _instance.constant = constant unless constant.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGraphene::Plane)).zero?
    end

    def normal : Graphene::Vec3
      _var = (@pointer + 0).as(Pointer(Void))
      Graphene::Vec3.new(_var, GICrystal::Transfer::None)
    end

    def normal=(value : Graphene::Vec3)
      _var = (@pointer + 0).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGraphene::Plane))
      value
    end

    def constant : Float32
      _var = (@pointer + 16).as(Pointer(Float32))
      _var.value
    end

    def constant=(value : Float32)
      _var = (@pointer + 16).as(Pointer(Float32)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGraphene.graphene_plane_get_type
    end

    def self.alloc : self
      # graphene_plane_alloc: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGraphene.graphene_plane_alloc

      # Return value handling

      Graphene::Plane.new(_retval, GICrystal::Transfer::Full)
    end

    def distance(point : Graphene::Point3D) : Float32
      # graphene_plane_distance: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_plane_distance(self, point)

      # Return value handling

      _retval
    end

    def equal(b : Graphene::Plane) : Bool
      # graphene_plane_equal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_plane_equal(self, b)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # graphene_plane_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_plane_free(self)

      # Return value handling
    end

    def constant : Float32
      # graphene_plane_get_constant: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_plane_get_constant(self)

      # Return value handling

      _retval
    end

    def normal : Graphene::Vec3
      # graphene_plane_get_normal: (Method)
      # @normal: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      normal = Graphene::Vec3.new

      # C call
      LibGraphene.graphene_plane_get_normal(self, normal)

      # Return value handling

      normal
    end

    def init(normal : Graphene::Vec3?, constant : Float32) : Graphene::Plane
      # graphene_plane_init: (Method)
      # @normal: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      normal = if normal.nil?
                 Pointer(Void).null
               else
                 normal.to_unsafe
               end

      # C call
      _retval = LibGraphene.graphene_plane_init(self, normal, constant)

      # Return value handling

      Graphene::Plane.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_plane(src : Graphene::Plane) : Graphene::Plane
      # graphene_plane_init_from_plane: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_plane_init_from_plane(self, src)

      # Return value handling

      Graphene::Plane.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_point(normal : Graphene::Vec3, point : Graphene::Point3D) : Graphene::Plane
      # graphene_plane_init_from_point: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_plane_init_from_point(self, normal, point)

      # Return value handling

      Graphene::Plane.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_points(a : Graphene::Point3D, b : Graphene::Point3D, c : Graphene::Point3D) : Graphene::Plane
      # graphene_plane_init_from_points: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_plane_init_from_points(self, a, b, c)

      # Return value handling

      Graphene::Plane.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_vec4(src : Graphene::Vec4) : Graphene::Plane
      # graphene_plane_init_from_vec4: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_plane_init_from_vec4(self, src)

      # Return value handling

      Graphene::Plane.new(_retval, GICrystal::Transfer::None)
    end

    def negate : Graphene::Plane
      # graphene_plane_negate: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Plane.new

      # C call
      LibGraphene.graphene_plane_negate(self, res)

      # Return value handling

      res
    end

    def normalize : Graphene::Plane
      # graphene_plane_normalize: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Plane.new

      # C call
      LibGraphene.graphene_plane_normalize(self, res)

      # Return value handling

      res
    end

    def transform(matrix : Graphene::Matrix, normal_matrix : Graphene::Matrix?) : Graphene::Plane
      # graphene_plane_transform: (Method)
      # @normal_matrix: (nullable)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      normal_matrix = if normal_matrix.nil?
                        Pointer(Void).null
                      else
                        normal_matrix.to_unsafe
                      end

      # Generator::CallerAllocatesPlan
      res = Graphene::Plane.new

      # C call
      LibGraphene.graphene_plane_transform(self, matrix, normal_matrix, res)

      # Return value handling

      res
    end

    def to_unsafe
      @pointer
    end
  end
end
