module Graphene
  # A structure capable of holding a 4x4 matrix.
  #
  # The contents of the #graphene_matrix_t structure are private and
  # should never be accessed directly.
  class Matrix
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGraphene::Matrix))
      @pointer.copy_from(pointer, sizeof(LibGraphene::Matrix))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(value : Graphene::Simd4X4F? = nil)
      _ptr = Pointer(Void).malloc(64)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.value = value unless value.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGraphene::Matrix)).zero?
    end

    def value : Graphene::Simd4X4F
      _var = (@pointer + 0).as(Pointer(Void))
      Graphene::Simd4X4F.new(_var, GICrystal::Transfer::None)
    end

    def value=(value : Graphene::Simd4X4F)
      _var = (@pointer + 0).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGraphene::Matrix))
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGraphene.graphene_matrix_get_type
    end

    def self.alloc : self
      # graphene_matrix_alloc: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGraphene.graphene_matrix_alloc

      # Return value handling

      Graphene::Matrix.new(_retval, GICrystal::Transfer::Full)
    end

    def decompose : Graphene::Vec3
      # graphene_matrix_decompose: (Method)
      # @translate: (out) (caller-allocates)
      # @scale: (out) (caller-allocates)
      # @rotate: (out) (caller-allocates)
      # @shear: (out) (caller-allocates)
      # @perspective: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      translate = Graphene::Vec3.new    # Generator::CallerAllocatesPlan
      scale = Graphene::Vec3.new        # Generator::CallerAllocatesPlan
      rotate = Graphene::Quaternion.new # Generator::CallerAllocatesPlan
      shear = Graphene::Vec3.new        # Generator::CallerAllocatesPlan
      perspective = Graphene::Vec4.new
      # C call
      _retval = LibGraphene.graphene_matrix_decompose(self, translate, scale, rotate, shear, perspective)

      # Return value handling

      translate
    end

    def determinant : Float32
      # graphene_matrix_determinant: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_determinant(self)

      # Return value handling

      _retval
    end

    def equal(b : Graphene::Matrix) : Bool
      # graphene_matrix_equal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_equal(self, b)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def equal_fast(b : Graphene::Matrix) : Bool
      # graphene_matrix_equal_fast: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_equal_fast(self, b)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # graphene_matrix_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_matrix_free(self)

      # Return value handling
    end

    def row(index_ : UInt32) : Graphene::Vec4
      # graphene_matrix_get_row: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Vec4.new
      # C call
      LibGraphene.graphene_matrix_get_row(self, index_, res)

      # Return value handling

      res
    end

    def value(row : UInt32, col : UInt32) : Float32
      # graphene_matrix_get_value: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_get_value(self, row, col)

      # Return value handling

      _retval
    end

    def x_scale : Float32
      # graphene_matrix_get_x_scale: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_get_x_scale(self)

      # Return value handling

      _retval
    end

    def x_translation : Float32
      # graphene_matrix_get_x_translation: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_get_x_translation(self)

      # Return value handling

      _retval
    end

    def y_scale : Float32
      # graphene_matrix_get_y_scale: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_get_y_scale(self)

      # Return value handling

      _retval
    end

    def y_translation : Float32
      # graphene_matrix_get_y_translation: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_get_y_translation(self)

      # Return value handling

      _retval
    end

    def z_scale : Float32
      # graphene_matrix_get_z_scale: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_get_z_scale(self)

      # Return value handling

      _retval
    end

    def z_translation : Float32
      # graphene_matrix_get_z_translation: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_get_z_translation(self)

      # Return value handling

      _retval
    end

    def init_from_2d(xx : Float64, yx : Float64, xy : Float64, yy : Float64, x_0 : Float64, y_0 : Float64) : Graphene::Matrix
      # graphene_matrix_init_from_2d: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_init_from_2d(self, xx, yx, xy, yy, x_0, y_0)

      # Return value handling

      Graphene::Matrix.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_float(v : Enumerable(Float32)) : Graphene::Matrix
      # graphene_matrix_init_from_float: (Method)
      # @v: (array fixed-size=16 element-type Float)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      raise ArgumentError.new("Enumerable of size < 16") if v.size < 16

      v = v.to_a.to_unsafe

      # C call
      _retval = LibGraphene.graphene_matrix_init_from_float(self, v)

      # Return value handling

      Graphene::Matrix.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_float(*v : Float32)
      init_from_float(v)
    end

    def init_from_matrix(src : Graphene::Matrix) : Graphene::Matrix
      # graphene_matrix_init_from_matrix: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_init_from_matrix(self, src)

      # Return value handling

      Graphene::Matrix.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_vec4(v0 : Graphene::Vec4, v1 : Graphene::Vec4, v2 : Graphene::Vec4, v3 : Graphene::Vec4) : Graphene::Matrix
      # graphene_matrix_init_from_vec4: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_init_from_vec4(self, v0, v1, v2, v3)

      # Return value handling

      Graphene::Matrix.new(_retval, GICrystal::Transfer::None)
    end

    def init_frustum(left : Float32, right : Float32, bottom : Float32, top : Float32, z_near : Float32, z_far : Float32) : Graphene::Matrix
      # graphene_matrix_init_frustum: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_init_frustum(self, left, right, bottom, top, z_near, z_far)

      # Return value handling

      Graphene::Matrix.new(_retval, GICrystal::Transfer::None)
    end

    def init_identity : Graphene::Matrix
      # graphene_matrix_init_identity: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_init_identity(self)

      # Return value handling

      Graphene::Matrix.new(_retval, GICrystal::Transfer::None)
    end

    def init_look_at(eye : Graphene::Vec3, center : Graphene::Vec3, up : Graphene::Vec3) : Graphene::Matrix
      # graphene_matrix_init_look_at: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_init_look_at(self, eye, center, up)

      # Return value handling

      Graphene::Matrix.new(_retval, GICrystal::Transfer::None)
    end

    def init_ortho(left : Float32, right : Float32, top : Float32, bottom : Float32, z_near : Float32, z_far : Float32) : Graphene::Matrix
      # graphene_matrix_init_ortho: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_init_ortho(self, left, right, top, bottom, z_near, z_far)

      # Return value handling

      Graphene::Matrix.new(_retval, GICrystal::Transfer::None)
    end

    def init_perspective(fovy : Float32, aspect : Float32, z_near : Float32, z_far : Float32) : Graphene::Matrix
      # graphene_matrix_init_perspective: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_init_perspective(self, fovy, aspect, z_near, z_far)

      # Return value handling

      Graphene::Matrix.new(_retval, GICrystal::Transfer::None)
    end

    def init_rotate(angle : Float32, axis : Graphene::Vec3) : Graphene::Matrix
      # graphene_matrix_init_rotate: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_init_rotate(self, angle, axis)

      # Return value handling

      Graphene::Matrix.new(_retval, GICrystal::Transfer::None)
    end

    def init_scale(x : Float32, y : Float32, z : Float32) : Graphene::Matrix
      # graphene_matrix_init_scale: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_init_scale(self, x, y, z)

      # Return value handling

      Graphene::Matrix.new(_retval, GICrystal::Transfer::None)
    end

    def init_skew(x_skew : Float32, y_skew : Float32) : Graphene::Matrix
      # graphene_matrix_init_skew: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_init_skew(self, x_skew, y_skew)

      # Return value handling

      Graphene::Matrix.new(_retval, GICrystal::Transfer::None)
    end

    def init_translate(p : Graphene::Point3D) : Graphene::Matrix
      # graphene_matrix_init_translate: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_init_translate(self, p)

      # Return value handling

      Graphene::Matrix.new(_retval, GICrystal::Transfer::None)
    end

    def interpolate(b : Graphene::Matrix, factor : Float64) : Graphene::Matrix
      # graphene_matrix_interpolate: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Matrix.new
      # C call
      LibGraphene.graphene_matrix_interpolate(self, b, factor, res)

      # Return value handling

      res
    end

    def inverse : Graphene::Matrix
      # graphene_matrix_inverse: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Matrix.new
      # C call
      _retval = LibGraphene.graphene_matrix_inverse(self, res)

      # Return value handling

      res
    end

    def is_2d : Bool
      # graphene_matrix_is_2d: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_is_2d(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def is_backface_visible : Bool
      # graphene_matrix_is_backface_visible: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_is_backface_visible(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def is_identity : Bool
      # graphene_matrix_is_identity: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_is_identity(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def is_singular : Bool
      # graphene_matrix_is_singular: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_is_singular(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def multiply(b : Graphene::Matrix) : Graphene::Matrix
      # graphene_matrix_multiply: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Matrix.new
      # C call
      LibGraphene.graphene_matrix_multiply(self, b, res)

      # Return value handling

      res
    end

    def near(b : Graphene::Matrix, epsilon : Float32) : Bool
      # graphene_matrix_near: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_near(self, b, epsilon)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def normalize : Graphene::Matrix
      # graphene_matrix_normalize: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Matrix.new
      # C call
      LibGraphene.graphene_matrix_normalize(self, res)

      # Return value handling

      res
    end

    def perspective(depth : Float32) : Graphene::Matrix
      # graphene_matrix_perspective: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Matrix.new
      # C call
      LibGraphene.graphene_matrix_perspective(self, depth, res)

      # Return value handling

      res
    end

    def print : Nil
      # graphene_matrix_print: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_matrix_print(self)

      # Return value handling
    end

    def project_point(p : Graphene::Point) : Graphene::Point
      # graphene_matrix_project_point: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Point.new
      # C call
      LibGraphene.graphene_matrix_project_point(self, p, res)

      # Return value handling

      res
    end

    def project_rect(r : Graphene::Rect) : Graphene::Quad
      # graphene_matrix_project_rect: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Quad.new
      # C call
      LibGraphene.graphene_matrix_project_rect(self, r, res)

      # Return value handling

      res
    end

    def project_rect_bounds(r : Graphene::Rect) : Graphene::Rect
      # graphene_matrix_project_rect_bounds: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Rect.new
      # C call
      LibGraphene.graphene_matrix_project_rect_bounds(self, r, res)

      # Return value handling

      res
    end

    def rotate(angle : Float32, axis : Graphene::Vec3) : Nil
      # graphene_matrix_rotate: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_matrix_rotate(self, angle, axis)

      # Return value handling
    end

    def rotate_euler(e : Graphene::Euler) : Nil
      # graphene_matrix_rotate_euler: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_matrix_rotate_euler(self, e)

      # Return value handling
    end

    def rotate_quaternion(q : Graphene::Quaternion) : Nil
      # graphene_matrix_rotate_quaternion: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_matrix_rotate_quaternion(self, q)

      # Return value handling
    end

    def rotate_x(angle : Float32) : Nil
      # graphene_matrix_rotate_x: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_matrix_rotate_x(self, angle)

      # Return value handling
    end

    def rotate_y(angle : Float32) : Nil
      # graphene_matrix_rotate_y: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_matrix_rotate_y(self, angle)

      # Return value handling
    end

    def rotate_z(angle : Float32) : Nil
      # graphene_matrix_rotate_z: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_matrix_rotate_z(self, angle)

      # Return value handling
    end

    def scale(factor_x : Float32, factor_y : Float32, factor_z : Float32) : Nil
      # graphene_matrix_scale: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_matrix_scale(self, factor_x, factor_y, factor_z)

      # Return value handling
    end

    def skew_xy(factor : Float32) : Nil
      # graphene_matrix_skew_xy: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_matrix_skew_xy(self, factor)

      # Return value handling
    end

    def skew_xz(factor : Float32) : Nil
      # graphene_matrix_skew_xz: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_matrix_skew_xz(self, factor)

      # Return value handling
    end

    def skew_yz(factor : Float32) : Nil
      # graphene_matrix_skew_yz: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_matrix_skew_yz(self, factor)

      # Return value handling
    end

    def to_2d(xx : Float64, yx : Float64, xy : Float64, yy : Float64, x_0 : Float64, y_0 : Float64) : Bool
      # graphene_matrix_to_2d: (Method)
      # @xx: (out) (transfer full)
      # @yx: (out) (transfer full)
      # @xy: (out) (transfer full)
      # @yy: (out) (transfer full)
      # @x_0: (out) (transfer full)
      # @y_0: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGraphene.graphene_matrix_to_2d(self, xx, yx, xy, yy, x_0, y_0)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def to_float(v : Enumerable(Float32)) : Nil
      # graphene_matrix_to_float: (Method)
      # @v: (out) (caller-allocates) (array fixed-size=16 element-type Float)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      raise ArgumentError.new("Enumerable of size < 16") if v.size < 16

      v = v.to_a.to_unsafe

      # C call
      LibGraphene.graphene_matrix_to_float(self, v)

      # Return value handling
    end

    def to_float(*v : Float32)
      to_float(v)
    end

    def transform_bounds(r : Graphene::Rect) : Graphene::Rect
      # graphene_matrix_transform_bounds: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Rect.new
      # C call
      LibGraphene.graphene_matrix_transform_bounds(self, r, res)

      # Return value handling

      res
    end

    def transform_box(b : Graphene::Box) : Graphene::Box
      # graphene_matrix_transform_box: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Box.new
      # C call
      LibGraphene.graphene_matrix_transform_box(self, b, res)

      # Return value handling

      res
    end

    def transform_point(p : Graphene::Point) : Graphene::Point
      # graphene_matrix_transform_point: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Point.new
      # C call
      LibGraphene.graphene_matrix_transform_point(self, p, res)

      # Return value handling

      res
    end

    def transform_point3d(p : Graphene::Point3D) : Graphene::Point3D
      # graphene_matrix_transform_point3d: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Point3D.new
      # C call
      LibGraphene.graphene_matrix_transform_point3d(self, p, res)

      # Return value handling

      res
    end

    def transform_ray(r : Graphene::Ray) : Graphene::Ray
      # graphene_matrix_transform_ray: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Ray.new
      # C call
      LibGraphene.graphene_matrix_transform_ray(self, r, res)

      # Return value handling

      res
    end

    def transform_rect(r : Graphene::Rect) : Graphene::Quad
      # graphene_matrix_transform_rect: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Quad.new
      # C call
      LibGraphene.graphene_matrix_transform_rect(self, r, res)

      # Return value handling

      res
    end

    def transform_sphere(s : Graphene::Sphere) : Graphene::Sphere
      # graphene_matrix_transform_sphere: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Sphere.new
      # C call
      LibGraphene.graphene_matrix_transform_sphere(self, s, res)

      # Return value handling

      res
    end

    def transform_vec3(v : Graphene::Vec3) : Graphene::Vec3
      # graphene_matrix_transform_vec3: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Vec3.new
      # C call
      LibGraphene.graphene_matrix_transform_vec3(self, v, res)

      # Return value handling

      res
    end

    def transform_vec4(v : Graphene::Vec4) : Graphene::Vec4
      # graphene_matrix_transform_vec4: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Vec4.new
      # C call
      LibGraphene.graphene_matrix_transform_vec4(self, v, res)

      # Return value handling

      res
    end

    def translate(pos : Graphene::Point3D) : Nil
      # graphene_matrix_translate: (Method)
      # Returns: (transfer none)

      # C call
      LibGraphene.graphene_matrix_translate(self, pos)

      # Return value handling
    end

    def transpose : Graphene::Matrix
      # graphene_matrix_transpose: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Matrix.new
      # C call
      LibGraphene.graphene_matrix_transpose(self, res)

      # Return value handling

      res
    end

    def unproject_point3d(modelview : Graphene::Matrix, point : Graphene::Point3D) : Graphene::Point3D
      # graphene_matrix_unproject_point3d: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Point3D.new
      # C call
      LibGraphene.graphene_matrix_unproject_point3d(self, modelview, point, res)

      # Return value handling

      res
    end

    def untransform_bounds(r : Graphene::Rect, bounds : Graphene::Rect) : Graphene::Rect
      # graphene_matrix_untransform_bounds: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Rect.new
      # C call
      LibGraphene.graphene_matrix_untransform_bounds(self, r, bounds, res)

      # Return value handling

      res
    end

    def untransform_point(p : Graphene::Point, bounds : Graphene::Rect) : Graphene::Point
      # graphene_matrix_untransform_point: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      res = Graphene::Point.new
      # C call
      _retval = LibGraphene.graphene_matrix_untransform_point(self, p, bounds, res)

      # Return value handling

      res
    end

    def to_unsafe
      @pointer
    end
  end
end
