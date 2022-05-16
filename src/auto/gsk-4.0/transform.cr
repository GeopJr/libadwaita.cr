module Gsk
  # `GskTransform` is an object to describe transform matrices.
  #
  # Unlike `graphene_matrix_t`, `GskTransform` retains the steps in how
  # a transform was constructed, and allows inspecting them. It is modeled
  # after the way CSS describes transforms.
  #
  # `GskTransform` objects are immutable and cannot be changed after creation.
  # This means code can safely expose them as properties of objects without
  # having to worry about others changing them.
  class Transform
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(Transform.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(Transform.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGsk::Transform)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_transform_get_type
    end

    def initialize
      # gsk_transform_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_transform_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    def equal(second : Gsk::Transform?) : Bool
      # gsk_transform_equal: (Method)
      # @second: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      second = if second.nil?
                 Pointer(Void).null
               else
                 second.to_unsafe
               end

      # C call
      _retval = LibGsk.gsk_transform_equal(@pointer, second)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def category : Gsk::TransformCategory
      # gsk_transform_get_category: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_transform_get_category(@pointer)

      # Return value handling

      Gsk::TransformCategory.new(_retval)
    end

    def invert : Gsk::Transform?
      # gsk_transform_invert: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_transform_invert(@pointer)

      # Return value handling

      Gsk::Transform.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def matrix(matrix : Graphene::Matrix) : Gsk::Transform
      # gsk_transform_matrix: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_transform_matrix(@pointer, matrix)

      # Return value handling

      Gsk::Transform.new(_retval, GICrystal::Transfer::Full)
    end

    def perspective(depth : Float32) : Gsk::Transform
      # gsk_transform_perspective: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_transform_perspective(@pointer, depth)

      # Return value handling

      Gsk::Transform.new(_retval, GICrystal::Transfer::Full)
    end

    def print(string : GLib::String) : Nil
      # gsk_transform_print: (Method)
      # Returns: (transfer none)

      # C call
      LibGsk.gsk_transform_print(@pointer, string)

      # Return value handling
    end

    def ref : Gsk::Transform?
      # gsk_transform_ref: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_transform_ref(@pointer)

      # Return value handling

      Gsk::Transform.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def rotate(angle : Float32) : Gsk::Transform?
      # gsk_transform_rotate: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_transform_rotate(@pointer, angle)

      # Return value handling

      Gsk::Transform.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def rotate_3d(angle : Float32, axis : Graphene::Vec3) : Gsk::Transform?
      # gsk_transform_rotate_3d: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_transform_rotate_3d(@pointer, angle, axis)

      # Return value handling

      Gsk::Transform.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def scale(factor_x : Float32, factor_y : Float32) : Gsk::Transform?
      # gsk_transform_scale: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_transform_scale(@pointer, factor_x, factor_y)

      # Return value handling

      Gsk::Transform.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def scale_3d(factor_x : Float32, factor_y : Float32, factor_z : Float32) : Gsk::Transform?
      # gsk_transform_scale_3d: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_transform_scale_3d(@pointer, factor_x, factor_y, factor_z)

      # Return value handling

      Gsk::Transform.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def skew(skew_x : Float32, skew_y : Float32) : Gsk::Transform?
      # gsk_transform_skew: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_transform_skew(@pointer, skew_x, skew_y)

      # Return value handling

      Gsk::Transform.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def to_2d(out_xx : Float32, out_yx : Float32, out_xy : Float32, out_yy : Float32, out_dx : Float32, out_dy : Float32) : Nil
      # gsk_transform_to_2d: (Method)
      # @out_xx: (out) (transfer full)
      # @out_yx: (out) (transfer full)
      # @out_xy: (out) (transfer full)
      # @out_yy: (out) (transfer full)
      # @out_dx: (out) (transfer full)
      # @out_dy: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGsk.gsk_transform_to_2d(@pointer, out_xx, out_yx, out_xy, out_yy, out_dx, out_dy)

      # Return value handling
    end

    def to_2d_components(out_skew_x : Float32, out_skew_y : Float32, out_scale_x : Float32, out_scale_y : Float32, out_angle : Float32, out_dx : Float32, out_dy : Float32) : Nil
      # gsk_transform_to_2d_components: (Method)
      # @out_skew_x: (out) (transfer full)
      # @out_skew_y: (out) (transfer full)
      # @out_scale_x: (out) (transfer full)
      # @out_scale_y: (out) (transfer full)
      # @out_angle: (out) (transfer full)
      # @out_dx: (out) (transfer full)
      # @out_dy: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGsk.gsk_transform_to_2d_components(@pointer, out_skew_x, out_skew_y, out_scale_x, out_scale_y, out_angle, out_dx, out_dy)

      # Return value handling
    end

    def to_affine(out_scale_x : Float32, out_scale_y : Float32, out_dx : Float32, out_dy : Float32) : Nil
      # gsk_transform_to_affine: (Method)
      # @out_scale_x: (out) (transfer full)
      # @out_scale_y: (out) (transfer full)
      # @out_dx: (out) (transfer full)
      # @out_dy: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGsk.gsk_transform_to_affine(@pointer, out_scale_x, out_scale_y, out_dx, out_dy)

      # Return value handling
    end

    def to_matrix : Graphene::Matrix
      # gsk_transform_to_matrix: (Method)
      # @out_matrix: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      out_matrix = Graphene::Matrix.new
      # C call
      LibGsk.gsk_transform_to_matrix(@pointer, out_matrix)

      # Return value handling

      out_matrix
    end

    def to_string : ::String
      # gsk_transform_to_string: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_transform_to_string(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def to_translate(out_dx : Float32, out_dy : Float32) : Nil
      # gsk_transform_to_translate: (Method)
      # @out_dx: (out) (transfer full)
      # @out_dy: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGsk.gsk_transform_to_translate(@pointer, out_dx, out_dy)

      # Return value handling
    end

    def transform(other : Gsk::Transform?) : Gsk::Transform?
      # gsk_transform_transform: (Method)
      # @other: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      other = if other.nil?
                Pointer(Void).null
              else
                other.to_unsafe
              end

      # C call
      _retval = LibGsk.gsk_transform_transform(@pointer, other)

      # Return value handling

      Gsk::Transform.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def transform_bounds(rect : Graphene::Rect) : Graphene::Rect
      # gsk_transform_transform_bounds: (Method)
      # @out_rect: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      out_rect = Graphene::Rect.new
      # C call
      LibGsk.gsk_transform_transform_bounds(@pointer, rect, out_rect)

      # Return value handling

      out_rect
    end

    def transform_point(point : Graphene::Point) : Graphene::Point
      # gsk_transform_transform_point: (Method)
      # @out_point: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      out_point = Graphene::Point.new
      # C call
      LibGsk.gsk_transform_transform_point(@pointer, point, out_point)

      # Return value handling

      out_point
    end

    def translate(point : Graphene::Point) : Gsk::Transform?
      # gsk_transform_translate: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_transform_translate(@pointer, point)

      # Return value handling

      Gsk::Transform.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def translate_3d(point : Graphene::Point3D) : Gsk::Transform?
      # gsk_transform_translate_3d: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_transform_translate_3d(@pointer, point)

      # Return value handling

      Gsk::Transform.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def unref : Nil
      # gsk_transform_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGsk.gsk_transform_unref(@pointer)

      # Return value handling
    end

    def self.parse(string : ::String, out_transform : Gsk::Transform) : Bool
      # gsk_transform_parse: (None)
      # @out_transform: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_transform_parse(string, out_transform)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def to_unsafe
      @pointer
    end
  end
end
