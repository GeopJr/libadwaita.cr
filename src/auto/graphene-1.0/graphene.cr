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
  PI       = 3.141593
  PI_2     = 1.570796
  VEC2_LEN =        2
  VEC3_LEN =        3
  VEC4_LEN =        4

  enum EulerOrder : Int32
    Default = -1
    Xyz     =  0
    Yzx     =  1
    Zxy     =  2
    Xzy     =  3
    Yxz     =  4
    Zyx     =  5
    Sxyz    =  6
    Sxyx    =  7
    Sxzy    =  8
    Sxzx    =  9
    Syzx    = 10
    Syzy    = 11
    Syxz    = 12
    Syxy    = 13
    Szxy    = 14
    Szxz    = 15
    Szyx    = 16
    Szyz    = 17
    Rzyx    = 18
    Rxyx    = 19
    Ryzx    = 20
    Rxzx    = 21
    Rxzy    = 22
    Ryzy    = 23
    Rzxy    = 24
    Ryxy    = 25
    Ryxz    = 26
    Rzxz    = 27
    Rxyz    = 28
    Rzyz    = 29
  end

  enum RayIntersectionKind : UInt32
    None  = 0
    Enter = 1
    Leave = 2
  end

  extend self
end

# Extra includes
