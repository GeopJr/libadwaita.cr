# Dependencies
require "../g_object-2.0/g_object.cr"

# C lib declaration
require "./lib_graphene.cr"

# Wrappers
require "./box.cr"
require "./euler.cr"
require "./frustum.cr"
require "./matrix.cr"
require "./plane.cr"
require "./point.cr"
require "./point3_d.cr"
require "./quad.cr"
require "./quaternion.cr"
require "./ray.cr"
require "./rect.cr"
require "./simd4_f.cr"
require "./simd4_x4_f.cr"
require "./size.cr"
require "./sphere.cr"
require "./triangle.cr"
require "./vec2.cr"
require "./vec3.cr"
require "./vec4.cr"

module Graphene
  PI   = 3.141593
  PI_2 = 1.570796
  # Evaluates to the number of components of a #graphene_vec2_t.
  #
  # This symbol is useful when declaring a C array of floating
  # point values to be used with graphene_vec2_init_from_float() and
  # graphene_vec2_to_float(), e.g.
  #
  # |[
  #   float v[GRAPHENE_VEC2_LEN];
  #
  #   // vec is defined elsewhere
  #   graphene_vec2_to_float (&vec, v);
  #
  #   for (int i = 0; i < GRAPHENE_VEC2_LEN; i++)
  #     fprintf (stdout, "component %d: %g\n", i, v[i]);
  # ]|
  VEC2_LEN = 2
  # Evaluates to the number of components of a #graphene_vec3_t.
  #
  # This symbol is useful when declaring a C array of floating
  # point values to be used with graphene_vec3_init_from_float() and
  # graphene_vec3_to_float(), e.g.
  #
  # |[
  #   float v[GRAPHENE_VEC3_LEN];
  #
  #   // vec is defined elsewhere
  #   graphene_vec3_to_float (&vec, v);
  #
  #   for (int i = 0; i < GRAPHENE_VEC2_LEN; i++)
  #     fprintf (stdout, "component %d: %g\n", i, v[i]);
  # ]|
  VEC3_LEN = 3
  # Evaluates to the number of components of a #graphene_vec4_t.
  #
  # This symbol is useful when declaring a C array of floating
  # point values to be used with graphene_vec4_init_from_float() and
  # graphene_vec4_to_float(), e.g.
  #
  # |[
  #   float v[GRAPHENE_VEC4_LEN];
  #
  #   // vec is defined elsewhere
  #   graphene_vec4_to_float (&vec, v);
  #
  #   for (int i = 0; i < GRAPHENE_VEC4_LEN; i++)
  #     fprintf (stdout, "component %d: %g\n", i, v[i]);
  # ]|
  VEC4_LEN = 4

  # Callbacks

  # Base class for all errors in this module.
  class GrapheneError < RuntimeError
    # :nodoc:
    def initialize(error : Pointer(LibGLib::Error))
      message_ptr = error.value.message
      super(String.new(message_ptr)) unless message_ptr.null?
      LibGLib.g_error_free(error)
    end
  end

  # Enums

  # Specify the order of the rotations on each axis.
  #
  # The %GRAPHENE_EULER_ORDER_DEFAULT value is special, and is used
  # as an alias for one of the other orders.
  enum EulerOrder : Int32
    # Rotate in the default order; the
    #   default order is one of the following enumeration values
    Default = -1
    # Rotate in the X, Y, and Z order. Deprecated in
    #   Graphene 1.10, it's an alias for %GRAPHENE_EULER_ORDER_SXYZ
    Xyz = 0
    # Rotate in the Y, Z, and X order. Deprecated in
    #   Graphene 1.10, it's an alias for %GRAPHENE_EULER_ORDER_SYZX
    Yzx = 1
    # Rotate in the Z, X, and Y order. Deprecated in
    #   Graphene 1.10, it's an alias for %GRAPHENE_EULER_ORDER_SZXY
    Zxy = 2
    # Rotate in the X, Z, and Y order. Deprecated in
    #   Graphene 1.10, it's an alias for %GRAPHENE_EULER_ORDER_SXZY
    Xzy = 3
    # Rotate in the Y, X, and Z order. Deprecated in
    #   Graphene 1.10, it's an alias for %GRAPHENE_EULER_ORDER_SYXZ
    Yxz = 4
    # Rotate in the Z, Y, and X order. Deprecated in
    #   Graphene 1.10, it's an alias for %GRAPHENE_EULER_ORDER_SZYX
    Zyx = 5
    # Defines a static rotation along the X, Y, and Z axes (Since: 1.10)
    Sxyz = 6
    # Defines a static rotation along the X, Y, and X axes (Since: 1.10)
    Sxyx = 7
    # Defines a static rotation along the X, Z, and Y axes (Since: 1.10)
    Sxzy = 8
    # Defines a static rotation along the X, Z, and X axes (Since: 1.10)
    Sxzx = 9
    # Defines a static rotation along the Y, Z, and X axes (Since: 1.10)
    Syzx = 10
    # Defines a static rotation along the Y, Z, and Y axes (Since: 1.10)
    Syzy = 11
    # Defines a static rotation along the Y, X, and Z axes (Since: 1.10)
    Syxz = 12
    # Defines a static rotation along the Y, X, and Y axes (Since: 1.10)
    Syxy = 13
    # Defines a static rotation along the Z, X, and Y axes (Since: 1.10)
    Szxy = 14
    # Defines a static rotation along the Z, X, and Z axes (Since: 1.10)
    Szxz = 15
    # Defines a static rotation along the Z, Y, and X axes (Since: 1.10)
    Szyx = 16
    # Defines a static rotation along the Z, Y, and Z axes (Since: 1.10)
    Szyz = 17
    # Defines a relative rotation along the Z, Y, and X axes (Since: 1.10)
    Rzyx = 18
    # Defines a relative rotation along the X, Y, and X axes (Since: 1.10)
    Rxyx = 19
    # Defines a relative rotation along the Y, Z, and X axes (Since: 1.10)
    Ryzx = 20
    # Defines a relative rotation along the X, Z, and X axes (Since: 1.10)
    Rxzx = 21
    # Defines a relative rotation along the X, Z, and Y axes (Since: 1.10)
    Rxzy = 22
    # Defines a relative rotation along the Y, Z, and Y axes (Since: 1.10)
    Ryzy = 23
    # Defines a relative rotation along the Z, X, and Y axes (Since: 1.10)
    Rzxy = 24
    # Defines a relative rotation along the Y, X, and Y axes (Since: 1.10)
    Ryxy = 25
    # Defines a relative rotation along the Y, X, and Z axes (Since: 1.10)
    Ryxz = 26
    # Defines a relative rotation along the Z, X, and Z axes (Since: 1.10)
    Rzxz = 27
    # Defines a relative rotation along the X, Y, and Z axes (Since: 1.10)
    Rxyz = 28
    # Defines a relative rotation along the Z, Y, and Z axes (Since: 1.10)
    Rzyz = 29
  end

  # The type of intersection.
  enum RayIntersectionKind : UInt32
    # No intersection
    None = 0
    # The ray is entering the intersected
    #   object
    Enter = 1
    # The ray is leaving the intersected
    #   object
    Leave = 2
  end

  # Flags

  def self.box_empty : Graphene::Box
    # graphene_box_empty: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_box_empty

    # Return value handling

    Graphene::Box.new(_retval, GICrystal::Transfer::None)
  end

  def self.box_infinite : Graphene::Box
    # graphene_box_infinite: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_box_infinite

    # Return value handling

    Graphene::Box.new(_retval, GICrystal::Transfer::None)
  end

  def self.box_minus_one : Graphene::Box
    # graphene_box_minus_one: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_box_minus_one

    # Return value handling

    Graphene::Box.new(_retval, GICrystal::Transfer::None)
  end

  def self.box_one : Graphene::Box
    # graphene_box_one: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_box_one

    # Return value handling

    Graphene::Box.new(_retval, GICrystal::Transfer::None)
  end

  def self.box_one_minus_one : Graphene::Box
    # graphene_box_one_minus_one: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_box_one_minus_one

    # Return value handling

    Graphene::Box.new(_retval, GICrystal::Transfer::None)
  end

  def self.box_zero : Graphene::Box
    # graphene_box_zero: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_box_zero

    # Return value handling

    Graphene::Box.new(_retval, GICrystal::Transfer::None)
  end

  def self.point3d_zero : Graphene::Point3D
    # graphene_point3d_zero: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_point3d_zero

    # Return value handling

    Graphene::Point3D.new(_retval, GICrystal::Transfer::None)
  end

  def self.point_zero : Graphene::Point
    # graphene_point_zero: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_point_zero

    # Return value handling

    Graphene::Point.new(_retval, GICrystal::Transfer::None)
  end

  def self.rect_alloc : Graphene::Rect
    # graphene_rect_alloc: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGraphene.graphene_rect_alloc

    # Return value handling

    Graphene::Rect.new(_retval, GICrystal::Transfer::Full)
  end

  def self.rect_zero : Graphene::Rect
    # graphene_rect_zero: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_rect_zero

    # Return value handling

    Graphene::Rect.new(_retval, GICrystal::Transfer::None)
  end

  def self.size_zero : Graphene::Size
    # graphene_size_zero: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_size_zero

    # Return value handling

    Graphene::Size.new(_retval, GICrystal::Transfer::None)
  end

  def self.vec2_one : Graphene::Vec2
    # graphene_vec2_one: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_vec2_one

    # Return value handling

    Graphene::Vec2.new(_retval, GICrystal::Transfer::None)
  end

  def self.vec2_x_axis : Graphene::Vec2
    # graphene_vec2_x_axis: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_vec2_x_axis

    # Return value handling

    Graphene::Vec2.new(_retval, GICrystal::Transfer::None)
  end

  def self.vec2_y_axis : Graphene::Vec2
    # graphene_vec2_y_axis: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_vec2_y_axis

    # Return value handling

    Graphene::Vec2.new(_retval, GICrystal::Transfer::None)
  end

  def self.vec2_zero : Graphene::Vec2
    # graphene_vec2_zero: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_vec2_zero

    # Return value handling

    Graphene::Vec2.new(_retval, GICrystal::Transfer::None)
  end

  def self.vec3_one : Graphene::Vec3
    # graphene_vec3_one: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_vec3_one

    # Return value handling

    Graphene::Vec3.new(_retval, GICrystal::Transfer::None)
  end

  def self.vec3_x_axis : Graphene::Vec3
    # graphene_vec3_x_axis: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_vec3_x_axis

    # Return value handling

    Graphene::Vec3.new(_retval, GICrystal::Transfer::None)
  end

  def self.vec3_y_axis : Graphene::Vec3
    # graphene_vec3_y_axis: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_vec3_y_axis

    # Return value handling

    Graphene::Vec3.new(_retval, GICrystal::Transfer::None)
  end

  def self.vec3_z_axis : Graphene::Vec3
    # graphene_vec3_z_axis: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_vec3_z_axis

    # Return value handling

    Graphene::Vec3.new(_retval, GICrystal::Transfer::None)
  end

  def self.vec3_zero : Graphene::Vec3
    # graphene_vec3_zero: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_vec3_zero

    # Return value handling

    Graphene::Vec3.new(_retval, GICrystal::Transfer::None)
  end

  def self.vec4_one : Graphene::Vec4
    # graphene_vec4_one: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_vec4_one

    # Return value handling

    Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
  end

  def self.vec4_w_axis : Graphene::Vec4
    # graphene_vec4_w_axis: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_vec4_w_axis

    # Return value handling

    Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
  end

  def self.vec4_x_axis : Graphene::Vec4
    # graphene_vec4_x_axis: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_vec4_x_axis

    # Return value handling

    Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
  end

  def self.vec4_y_axis : Graphene::Vec4
    # graphene_vec4_y_axis: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_vec4_y_axis

    # Return value handling

    Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
  end

  def self.vec4_z_axis : Graphene::Vec4
    # graphene_vec4_z_axis: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_vec4_z_axis

    # Return value handling

    Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
  end

  def self.vec4_zero : Graphene::Vec4
    # graphene_vec4_zero: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGraphene.graphene_vec4_zero

    # Return value handling

    Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
  end

  # Errors

  # :nodoc:
  def raise_exception(error : Pointer(LibGLib::Error))
    GObject.raise_exception(error)
  end

  extend self
end

# Extra includes
