module Graphene
  # A triangle.
  class Triangle
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGraphene::Triangle))
      @pointer.copy_from(pointer, sizeof(LibGraphene::Triangle))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(a : Graphene::Vec3? = nil, b : Graphene::Vec3? = nil, c : Graphene::Vec3? = nil)
      _ptr = Pointer(Void).malloc(48)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.a = a unless a.nil?
      _instance.b = b unless b.nil?
      _instance.c = c unless c.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGraphene::Triangle)).zero?
    end

    def a : Graphene::Vec3
      _var = (@pointer + 0).as(Pointer(Void))
      Graphene::Vec3.new(_var, GICrystal::Transfer::None)
    end

    def a=(value : Graphene::Vec3)
      _var = (@pointer + 0).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGraphene::Triangle))
      value
    end

    def b : Graphene::Vec3
      _var = (@pointer + 16).as(Pointer(Void))
      Graphene::Vec3.new(_var, GICrystal::Transfer::None)
    end

    def b=(value : Graphene::Vec3)
      _var = (@pointer + 16).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGraphene::Triangle))
      value
    end

    def c : Graphene::Vec3
      _var = (@pointer + 32).as(Pointer(Void))
      Graphene::Vec3.new(_var, GICrystal::Transfer::None)
    end

    def c=(value : Graphene::Vec3)
      _var = (@pointer + 32).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGraphene::Triangle))
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGraphene.graphene_triangle_get_type
    end

    def self.alloc : self
      # graphene_triangle_alloc: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGraphene.graphene_triangle_alloc

      # Return value handling

      Graphene::Triangle.new(_retval, GICrystal::Transfer::Full)
    end

    def contains_point(p : Graphene::Point3D) : Bool
      # graphene_triangle_contains_point: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_triangle_contains_point(self, p)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def equal(b : Graphene::Triangle) : Bool
      # graphene_triangle_equal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_triangle_equal(self, b)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # graphene_triangle_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_triangle_free(self)

      # Return value handling
    end

    def area : Float32
      # graphene_triangle_get_area: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_triangle_get_area(self)

      # Return value handling

      _retval
    end

    def barycoords(p : Graphene::Point3D?) : Graphene::Vec2
      # graphene_triangle_get_barycoords: (Method)
      # @p: (nullable)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      p = if p.nil?
            Pointer(Void).null
          else
            p.to_unsafe
          end
      # Generator::CallerAllocatesPlan
      res = Graphene::Vec2.new
      # C call
      _retval = LibGraphene.graphene_triangle_get_barycoords(self, p, res)

      # Return value handling

      res
    end

    def bounding_box : Graphene::Box
      # graphene_triangle_get_bounding_box: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Box.new
      # C call
      LibGraphene.graphene_triangle_get_bounding_box(self, res)

      # Return value handling

      res
    end

    def midpoint : Graphene::Point3D
      # graphene_triangle_get_midpoint: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Point3D.new
      # C call
      LibGraphene.graphene_triangle_get_midpoint(self, res)

      # Return value handling

      res
    end

    def normal : Graphene::Vec3
      # graphene_triangle_get_normal: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Vec3.new
      # C call
      LibGraphene.graphene_triangle_get_normal(self, res)

      # Return value handling

      res
    end

    def plane : Graphene::Plane
      # graphene_triangle_get_plane: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Plane.new
      # C call
      LibGraphene.graphene_triangle_get_plane(self, res)

      # Return value handling

      res
    end

    def points : Graphene::Point3D
      # graphene_triangle_get_points: (Method)
      # @a: (out) (caller-allocates) (optional)
      # @b: (out) (caller-allocates) (optional)
      # @c: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      a = Pointer(Void).null    # Generator::CallerAllocatesPlan
      a = Graphene::Point3D.new # Generator::OutArgUsedInReturnPlan
      b = Pointer(Void).null    # Generator::CallerAllocatesPlan
      b = Graphene::Point3D.new # Generator::OutArgUsedInReturnPlan
      c = Pointer(Void).null    # Generator::CallerAllocatesPlan
      c = Graphene::Point3D.new
      # C call
      LibGraphene.graphene_triangle_get_points(self, a, b, c)

      # Return value handling

      a
    end

    def uv(p : Graphene::Point3D?, uv_a : Graphene::Vec2, uv_b : Graphene::Vec2, uv_c : Graphene::Vec2) : Graphene::Vec2
      # graphene_triangle_get_uv: (Method)
      # @p: (nullable)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      p = if p.nil?
            Pointer(Void).null
          else
            p.to_unsafe
          end
      # Generator::CallerAllocatesPlan
      res = Graphene::Vec2.new
      # C call
      _retval = LibGraphene.graphene_triangle_get_uv(self, p, uv_a, uv_b, uv_c, res)

      # Return value handling

      res
    end

    def vertices : Graphene::Vec3
      # graphene_triangle_get_vertices: (Method)
      # @a: (out) (caller-allocates) (optional)
      # @b: (out) (caller-allocates) (optional)
      # @c: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      a = Pointer(Void).null # Generator::CallerAllocatesPlan
      a = Graphene::Vec3.new # Generator::OutArgUsedInReturnPlan
      b = Pointer(Void).null # Generator::CallerAllocatesPlan
      b = Graphene::Vec3.new # Generator::OutArgUsedInReturnPlan
      c = Pointer(Void).null # Generator::CallerAllocatesPlan
      c = Graphene::Vec3.new
      # C call
      LibGraphene.graphene_triangle_get_vertices(self, a, b, c)

      # Return value handling

      a
    end

    def init_from_float(a : Enumerable(Float32), b : Enumerable(Float32), c : Enumerable(Float32)) : Graphene::Triangle
      # graphene_triangle_init_from_float: (Method)
      # @a: (array fixed-size=3 element-type Float)
      # @b: (array fixed-size=3 element-type Float)
      # @c: (array fixed-size=3 element-type Float)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      raise ArgumentError.new("Enumerable of size < 3") if a.size < 3

      a = a.to_a.to_unsafe
      # Generator::ArrayArgPlan
      raise ArgumentError.new("Enumerable of size < 3") if b.size < 3

      b = b.to_a.to_unsafe
      # Generator::ArrayArgPlan
      raise ArgumentError.new("Enumerable of size < 3") if c.size < 3

      c = c.to_a.to_unsafe

      # C call
      _retval = LibGraphene.graphene_triangle_init_from_float(self, a, b, c)

      # Return value handling

      Graphene::Triangle.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_point3d(a : Graphene::Point3D?, b : Graphene::Point3D?, c : Graphene::Point3D?) : Graphene::Triangle
      # graphene_triangle_init_from_point3d: (Method)
      # @a: (nullable)
      # @b: (nullable)
      # @c: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      a = if a.nil?
            Pointer(Void).null
          else
            a.to_unsafe
          end
      # Generator::NullableArrayPlan
      b = if b.nil?
            Pointer(Void).null
          else
            b.to_unsafe
          end
      # Generator::NullableArrayPlan
      c = if c.nil?
            Pointer(Void).null
          else
            c.to_unsafe
          end

      # C call
      _retval = LibGraphene.graphene_triangle_init_from_point3d(self, a, b, c)

      # Return value handling

      Graphene::Triangle.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_vec3(a : Graphene::Vec3?, b : Graphene::Vec3?, c : Graphene::Vec3?) : Graphene::Triangle
      # graphene_triangle_init_from_vec3: (Method)
      # @a: (nullable)
      # @b: (nullable)
      # @c: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      a = if a.nil?
            Pointer(Void).null
          else
            a.to_unsafe
          end
      # Generator::NullableArrayPlan
      b = if b.nil?
            Pointer(Void).null
          else
            b.to_unsafe
          end
      # Generator::NullableArrayPlan
      c = if c.nil?
            Pointer(Void).null
          else
            c.to_unsafe
          end

      # C call
      _retval = LibGraphene.graphene_triangle_init_from_vec3(self, a, b, c)

      # Return value handling

      Graphene::Triangle.new(_retval, GICrystal::Transfer::None)
    end

    def to_unsafe
      @pointer
    end
  end
end
