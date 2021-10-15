@[Link("graphene-1.0", pkg_config: "graphene-1.0")]

lib LibGraphene
  # Flags

  # Enums
  type EulerOrder = Int32
  type RayIntersectionKind = UInt32

  # Callbacks

  # Interface types

  # Structs

  struct Box # 32 bytes long
    min : LibGraphene::Vec3
    max : LibGraphene::Vec3
  end

  struct Euler # 20 bytes long
    angles : LibGraphene::Vec3
    order : Int32
  end

  struct Frustum # 120 bytes long
    planes : Void[6]
  end

  struct Matrix # 64 bytes long
    value : LibGraphene::Simd4X4F
  end

  struct Plane # 20 bytes long
    normal : LibGraphene::Vec3
    constant : Float32
  end

  struct Point # 8 bytes long
    x : Float32
    y : Float32
  end

  struct Point3D # 12 bytes long
    x : Float32
    y : Float32
    z : Float32
  end

  struct Quad # 32 bytes long
    points : Void[4]
  end

  struct Quaternion # 16 bytes long
    x : Float32
    y : Float32
    z : Float32
    w : Float32
  end

  struct Ray # 32 bytes long
    origin : LibGraphene::Vec3
    direction : LibGraphene::Vec3
  end

  struct Rect # 16 bytes long
    origin : LibGraphene::Point
    size : LibGraphene::Size
  end

  struct Simd4F # 16 bytes long
    x : Float32
    y : Float32
    z : Float32
    w : Float32
  end

  struct Simd4X4F # 64 bytes long
    x : LibGraphene::Simd4F
    y : LibGraphene::Simd4F
    z : LibGraphene::Simd4F
    w : LibGraphene::Simd4F
  end

  struct Size # 8 bytes long
    width : Float32
    height : Float32
  end

  struct Sphere # 20 bytes long
    center : LibGraphene::Vec3
    radius : Float32
  end

  struct Triangle # 48 bytes long
    a : LibGraphene::Vec3
    b : LibGraphene::Vec3
    c : LibGraphene::Vec3
  end

  struct Vec2 # 16 bytes long
    value : LibGraphene::Simd4F
  end

  struct Vec3 # 16 bytes long
    value : LibGraphene::Simd4F
  end

  struct Vec4 # 16 bytes long
    value : LibGraphene::Simd4F
  end

  # Unions

  # Objects

  # All C Functions
  fun graphene_box_alloc : Pointer(Void)
  fun graphene_box_contains_box(this : Void*, b : Pointer(Void)) : LibC::Int
  fun graphene_box_contains_point(this : Void*, point : Pointer(Void)) : LibC::Int
  fun graphene_box_empty : Pointer(Void)
  fun graphene_box_empty : Pointer(Void)
  fun graphene_box_equal(this : Void*, b : Pointer(Void)) : LibC::Int
  fun graphene_box_expand(this : Void*, point : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_box_expand_scalar(this : Void*, scalar : Float32, res : Pointer(Void)) : Void
  fun graphene_box_expand_vec3(this : Void*, vec : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_box_free(this : Void*) : Void
  fun graphene_box_get_bounding_sphere(this : Void*, sphere : Pointer(Void)) : Void
  fun graphene_box_get_center(this : Void*, center : Pointer(Void)) : Void
  fun graphene_box_get_depth(this : Void*) : Float32
  fun graphene_box_get_height(this : Void*) : Float32
  fun graphene_box_get_max(this : Void*, max : Pointer(Void)) : Void
  fun graphene_box_get_min(this : Void*, min : Pointer(Void)) : Void
  fun graphene_box_get_size(this : Void*, size : Pointer(Void)) : Void
  fun graphene_box_get_type : UInt64
  fun graphene_box_get_vertices(this : Void*, vertices : Pointer(Pointer(Void[8]))) : Void
  fun graphene_box_get_width(this : Void*) : Float32
  fun graphene_box_infinite : Pointer(Void)
  fun graphene_box_infinite : Pointer(Void)
  fun graphene_box_init(this : Void*, min : Pointer(Void), max : Pointer(Void)) : Pointer(Void)
  fun graphene_box_init_from_box(this : Void*, src : Pointer(Void)) : Pointer(Void)
  fun graphene_box_init_from_points(this : Void*, n_points : UInt32, points : Pointer(Void)) : Pointer(Void)
  fun graphene_box_init_from_vec3(this : Void*, min : Pointer(Void), max : Pointer(Void)) : Pointer(Void)
  fun graphene_box_init_from_vectors(this : Void*, n_vectors : UInt32, vectors : Pointer(Void)) : Pointer(Void)
  fun graphene_box_intersection(this : Void*, b : Pointer(Void), res : Pointer(Void)) : LibC::Int
  fun graphene_box_minus_one : Pointer(Void)
  fun graphene_box_minus_one : Pointer(Void)
  fun graphene_box_one : Pointer(Void)
  fun graphene_box_one : Pointer(Void)
  fun graphene_box_one_minus_one : Pointer(Void)
  fun graphene_box_one_minus_one : Pointer(Void)
  fun graphene_box_union(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_box_zero : Pointer(Void)
  fun graphene_box_zero : Pointer(Void)
  fun graphene_euler_alloc : Pointer(Void)
  fun graphene_euler_equal(this : Void*, b : Pointer(Void)) : LibC::Int
  fun graphene_euler_free(this : Void*) : Void
  fun graphene_euler_get_alpha(this : Void*) : Float32
  fun graphene_euler_get_beta(this : Void*) : Float32
  fun graphene_euler_get_gamma(this : Void*) : Float32
  fun graphene_euler_get_order(this : Void*) : Int32
  fun graphene_euler_get_type : UInt64
  fun graphene_euler_get_x(this : Void*) : Float32
  fun graphene_euler_get_y(this : Void*) : Float32
  fun graphene_euler_get_z(this : Void*) : Float32
  fun graphene_euler_init(this : Void*, x : Float32, y : Float32, z : Float32) : Pointer(Void)
  fun graphene_euler_init_from_euler(this : Void*, src : Pointer(Void)) : Pointer(Void)
  fun graphene_euler_init_from_matrix(this : Void*, m : Pointer(Void), order : Int32) : Pointer(Void)
  fun graphene_euler_init_from_quaternion(this : Void*, q : Pointer(Void), order : Int32) : Pointer(Void)
  fun graphene_euler_init_from_radians(this : Void*, x : Float32, y : Float32, z : Float32, order : Int32) : Pointer(Void)
  fun graphene_euler_init_from_vec3(this : Void*, v : Pointer(Void), order : Int32) : Pointer(Void)
  fun graphene_euler_init_with_order(this : Void*, x : Float32, y : Float32, z : Float32, order : Int32) : Pointer(Void)
  fun graphene_euler_reorder(this : Void*, order : Int32, res : Pointer(Void)) : Void
  fun graphene_euler_to_matrix(this : Void*, res : Pointer(Void)) : Void
  fun graphene_euler_to_quaternion(this : Void*, res : Pointer(Void)) : Void
  fun graphene_euler_to_vec3(this : Void*, res : Pointer(Void)) : Void
  fun graphene_frustum_alloc : Pointer(Void)
  fun graphene_frustum_contains_point(this : Void*, point : Pointer(Void)) : LibC::Int
  fun graphene_frustum_equal(this : Void*, b : Pointer(Void)) : LibC::Int
  fun graphene_frustum_free(this : Void*) : Void
  fun graphene_frustum_get_planes(this : Void*, planes : Pointer(Pointer(Void[6]))) : Void
  fun graphene_frustum_get_type : UInt64
  fun graphene_frustum_init(this : Void*, p0 : Pointer(Void), p1 : Pointer(Void), p2 : Pointer(Void), p3 : Pointer(Void), p4 : Pointer(Void), p5 : Pointer(Void)) : Pointer(Void)
  fun graphene_frustum_init_from_frustum(this : Void*, src : Pointer(Void)) : Pointer(Void)
  fun graphene_frustum_init_from_matrix(this : Void*, matrix : Pointer(Void)) : Pointer(Void)
  fun graphene_frustum_intersects_box(this : Void*, box : Pointer(Void)) : LibC::Int
  fun graphene_frustum_intersects_sphere(this : Void*, sphere : Pointer(Void)) : LibC::Int
  fun graphene_matrix_alloc : Pointer(Void)
  fun graphene_matrix_decompose(this : Void*, translate : Pointer(Void), scale : Pointer(Void), rotate : Pointer(Void), shear : Pointer(Void), perspective : Pointer(Void)) : LibC::Int
  fun graphene_matrix_determinant(this : Void*) : Float32
  fun graphene_matrix_equal(this : Void*, b : Pointer(Void)) : LibC::Int
  fun graphene_matrix_equal_fast(this : Void*, b : Pointer(Void)) : LibC::Int
  fun graphene_matrix_free(this : Void*) : Void
  fun graphene_matrix_get_row(this : Void*, index_ : UInt32, res : Pointer(Void)) : Void
  fun graphene_matrix_get_type : UInt64
  fun graphene_matrix_get_value(this : Void*, row : UInt32, col : UInt32) : Float32
  fun graphene_matrix_get_x_scale(this : Void*) : Float32
  fun graphene_matrix_get_x_translation(this : Void*) : Float32
  fun graphene_matrix_get_y_scale(this : Void*) : Float32
  fun graphene_matrix_get_y_translation(this : Void*) : Float32
  fun graphene_matrix_get_z_scale(this : Void*) : Float32
  fun graphene_matrix_get_z_translation(this : Void*) : Float32
  fun graphene_matrix_init_from_2d(this : Void*, xx : Float64, yx : Float64, xy : Float64, yy : Float64, x_0 : Float64, y_0 : Float64) : Pointer(Void)
  fun graphene_matrix_init_from_float(this : Void*, v : Pointer(Float32[16])) : Pointer(Void)
  fun graphene_matrix_init_from_matrix(this : Void*, src : Pointer(Void)) : Pointer(Void)
  fun graphene_matrix_init_from_vec4(this : Void*, v0 : Pointer(Void), v1 : Pointer(Void), v2 : Pointer(Void), v3 : Pointer(Void)) : Pointer(Void)
  fun graphene_matrix_init_frustum(this : Void*, left : Float32, right : Float32, bottom : Float32, top : Float32, z_near : Float32, z_far : Float32) : Pointer(Void)
  fun graphene_matrix_init_identity(this : Void*) : Pointer(Void)
  fun graphene_matrix_init_look_at(this : Void*, eye : Pointer(Void), center : Pointer(Void), up : Pointer(Void)) : Pointer(Void)
  fun graphene_matrix_init_ortho(this : Void*, left : Float32, right : Float32, top : Float32, bottom : Float32, z_near : Float32, z_far : Float32) : Pointer(Void)
  fun graphene_matrix_init_perspective(this : Void*, fovy : Float32, aspect : Float32, z_near : Float32, z_far : Float32) : Pointer(Void)
  fun graphene_matrix_init_rotate(this : Void*, angle : Float32, axis : Pointer(Void)) : Pointer(Void)
  fun graphene_matrix_init_scale(this : Void*, x : Float32, y : Float32, z : Float32) : Pointer(Void)
  fun graphene_matrix_init_skew(this : Void*, x_skew : Float32, y_skew : Float32) : Pointer(Void)
  fun graphene_matrix_init_translate(this : Void*, p : Pointer(Void)) : Pointer(Void)
  fun graphene_matrix_interpolate(this : Void*, b : Pointer(Void), factor : Float64, res : Pointer(Void)) : Void
  fun graphene_matrix_inverse(this : Void*, res : Pointer(Void)) : LibC::Int
  fun graphene_matrix_is_2d(this : Void*) : LibC::Int
  fun graphene_matrix_is_backface_visible(this : Void*) : LibC::Int
  fun graphene_matrix_is_identity(this : Void*) : LibC::Int
  fun graphene_matrix_is_singular(this : Void*) : LibC::Int
  fun graphene_matrix_multiply(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_matrix_near(this : Void*, b : Pointer(Void), epsilon : Float32) : LibC::Int
  fun graphene_matrix_normalize(this : Void*, res : Pointer(Void)) : Void
  fun graphene_matrix_perspective(this : Void*, depth : Float32, res : Pointer(Void)) : Void
  fun graphene_matrix_print(this : Void*) : Void
  fun graphene_matrix_project_point(this : Void*, p : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_matrix_project_rect(this : Void*, r : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_matrix_project_rect_bounds(this : Void*, r : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_matrix_rotate(this : Void*, angle : Float32, axis : Pointer(Void)) : Void
  fun graphene_matrix_rotate_euler(this : Void*, e : Pointer(Void)) : Void
  fun graphene_matrix_rotate_quaternion(this : Void*, q : Pointer(Void)) : Void
  fun graphene_matrix_rotate_x(this : Void*, angle : Float32) : Void
  fun graphene_matrix_rotate_y(this : Void*, angle : Float32) : Void
  fun graphene_matrix_rotate_z(this : Void*, angle : Float32) : Void
  fun graphene_matrix_scale(this : Void*, factor_x : Float32, factor_y : Float32, factor_z : Float32) : Void
  fun graphene_matrix_skew_xy(this : Void*, factor : Float32) : Void
  fun graphene_matrix_skew_xz(this : Void*, factor : Float32) : Void
  fun graphene_matrix_skew_yz(this : Void*, factor : Float32) : Void
  fun graphene_matrix_to_2d(this : Void*, xx : Pointer(Float64), yx : Pointer(Float64), xy : Pointer(Float64), yy : Pointer(Float64), x_0 : Pointer(Float64), y_0 : Pointer(Float64)) : LibC::Int
  fun graphene_matrix_to_float(this : Void*, v : Pointer(Pointer(Float32[16]))) : Void
  fun graphene_matrix_transform_bounds(this : Void*, r : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_matrix_transform_box(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_matrix_transform_point(this : Void*, p : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_matrix_transform_point3d(this : Void*, p : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_matrix_transform_ray(this : Void*, r : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_matrix_transform_rect(this : Void*, r : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_matrix_transform_sphere(this : Void*, s : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_matrix_transform_vec3(this : Void*, v : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_matrix_transform_vec4(this : Void*, v : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_matrix_translate(this : Void*, pos : Pointer(Void)) : Void
  fun graphene_matrix_transpose(this : Void*, res : Pointer(Void)) : Void
  fun graphene_matrix_unproject_point3d(this : Void*, modelview : Pointer(Void), point : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_matrix_untransform_bounds(this : Void*, r : Pointer(Void), bounds : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_matrix_untransform_point(this : Void*, p : Pointer(Void), bounds : Pointer(Void), res : Pointer(Void)) : LibC::Int
  fun graphene_plane_alloc : Pointer(Void)
  fun graphene_plane_distance(this : Void*, point : Pointer(Void)) : Float32
  fun graphene_plane_equal(this : Void*, b : Pointer(Void)) : LibC::Int
  fun graphene_plane_free(this : Void*) : Void
  fun graphene_plane_get_constant(this : Void*) : Float32
  fun graphene_plane_get_normal(this : Void*, normal : Pointer(Void)) : Void
  fun graphene_plane_get_type : UInt64
  fun graphene_plane_init(this : Void*, normal : Pointer(Void), constant : Float32) : Pointer(Void)
  fun graphene_plane_init_from_plane(this : Void*, src : Pointer(Void)) : Pointer(Void)
  fun graphene_plane_init_from_point(this : Void*, normal : Pointer(Void), point : Pointer(Void)) : Pointer(Void)
  fun graphene_plane_init_from_points(this : Void*, a : Pointer(Void), b : Pointer(Void), c : Pointer(Void)) : Pointer(Void)
  fun graphene_plane_init_from_vec4(this : Void*, src : Pointer(Void)) : Pointer(Void)
  fun graphene_plane_negate(this : Void*, res : Pointer(Void)) : Void
  fun graphene_plane_normalize(this : Void*, res : Pointer(Void)) : Void
  fun graphene_plane_transform(this : Void*, matrix : Pointer(Void), normal_matrix : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_point3d_alloc : Pointer(Void)
  fun graphene_point3d_cross(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_point3d_distance(this : Void*, b : Pointer(Void), delta : Pointer(Void)) : Float32
  fun graphene_point3d_dot(this : Void*, b : Pointer(Void)) : Float32
  fun graphene_point3d_equal(this : Void*, b : Pointer(Void)) : LibC::Int
  fun graphene_point3d_free(this : Void*) : Void
  fun graphene_point3d_get_type : UInt64
  fun graphene_point3d_init(this : Void*, x : Float32, y : Float32, z : Float32) : Pointer(Void)
  fun graphene_point3d_init_from_point(this : Void*, src : Pointer(Void)) : Pointer(Void)
  fun graphene_point3d_init_from_vec3(this : Void*, v : Pointer(Void)) : Pointer(Void)
  fun graphene_point3d_interpolate(this : Void*, b : Pointer(Void), factor : Float64, res : Pointer(Void)) : Void
  fun graphene_point3d_length(this : Void*) : Float32
  fun graphene_point3d_near(this : Void*, b : Pointer(Void), epsilon : Float32) : LibC::Int
  fun graphene_point3d_normalize(this : Void*, res : Pointer(Void)) : Void
  fun graphene_point3d_normalize_viewport(this : Void*, viewport : Pointer(Void), z_near : Float32, z_far : Float32, res : Pointer(Void)) : Void
  fun graphene_point3d_scale(this : Void*, factor : Float32, res : Pointer(Void)) : Void
  fun graphene_point3d_to_vec3(this : Void*, v : Pointer(Void)) : Void
  fun graphene_point3d_zero : Pointer(Void)
  fun graphene_point3d_zero : Pointer(Void)
  fun graphene_point_alloc : Pointer(Void)
  fun graphene_point_distance(this : Void*, b : Pointer(Void), d_x : Pointer(Float32), d_y : Pointer(Float32)) : Float32
  fun graphene_point_equal(this : Void*, b : Pointer(Void)) : LibC::Int
  fun graphene_point_free(this : Void*) : Void
  fun graphene_point_get_type : UInt64
  fun graphene_point_init(this : Void*, x : Float32, y : Float32) : Pointer(Void)
  fun graphene_point_init_from_point(this : Void*, src : Pointer(Void)) : Pointer(Void)
  fun graphene_point_init_from_vec2(this : Void*, src : Pointer(Void)) : Pointer(Void)
  fun graphene_point_interpolate(this : Void*, b : Pointer(Void), factor : Float64, res : Pointer(Void)) : Void
  fun graphene_point_near(this : Void*, b : Pointer(Void), epsilon : Float32) : LibC::Int
  fun graphene_point_to_vec2(this : Void*, v : Pointer(Void)) : Void
  fun graphene_point_zero : Pointer(Void)
  fun graphene_point_zero : Pointer(Void)
  fun graphene_quad_alloc : Pointer(Void)
  fun graphene_quad_bounds(this : Void*, r : Pointer(Void)) : Void
  fun graphene_quad_contains(this : Void*, p : Pointer(Void)) : LibC::Int
  fun graphene_quad_free(this : Void*) : Void
  fun graphene_quad_get_point(this : Void*, index_ : UInt32) : Pointer(Void)
  fun graphene_quad_get_type : UInt64
  fun graphene_quad_init(this : Void*, p1 : Pointer(Void), p2 : Pointer(Void), p3 : Pointer(Void), p4 : Pointer(Void)) : Pointer(Void)
  fun graphene_quad_init_from_points(this : Void*, points : Pointer(Void[4])) : Pointer(Void)
  fun graphene_quad_init_from_rect(this : Void*, r : Pointer(Void)) : Pointer(Void)
  fun graphene_quaternion_add(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_quaternion_alloc : Pointer(Void)
  fun graphene_quaternion_dot(this : Void*, b : Pointer(Void)) : Float32
  fun graphene_quaternion_equal(this : Void*, b : Pointer(Void)) : LibC::Int
  fun graphene_quaternion_free(this : Void*) : Void
  fun graphene_quaternion_get_type : UInt64
  fun graphene_quaternion_init(this : Void*, x : Float32, y : Float32, z : Float32, w : Float32) : Pointer(Void)
  fun graphene_quaternion_init_from_angle_vec3(this : Void*, angle : Float32, axis : Pointer(Void)) : Pointer(Void)
  fun graphene_quaternion_init_from_angles(this : Void*, deg_x : Float32, deg_y : Float32, deg_z : Float32) : Pointer(Void)
  fun graphene_quaternion_init_from_euler(this : Void*, e : Pointer(Void)) : Pointer(Void)
  fun graphene_quaternion_init_from_matrix(this : Void*, m : Pointer(Void)) : Pointer(Void)
  fun graphene_quaternion_init_from_quaternion(this : Void*, src : Pointer(Void)) : Pointer(Void)
  fun graphene_quaternion_init_from_radians(this : Void*, rad_x : Float32, rad_y : Float32, rad_z : Float32) : Pointer(Void)
  fun graphene_quaternion_init_from_vec4(this : Void*, src : Pointer(Void)) : Pointer(Void)
  fun graphene_quaternion_init_identity(this : Void*) : Pointer(Void)
  fun graphene_quaternion_invert(this : Void*, res : Pointer(Void)) : Void
  fun graphene_quaternion_multiply(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_quaternion_normalize(this : Void*, res : Pointer(Void)) : Void
  fun graphene_quaternion_scale(this : Void*, factor : Float32, res : Pointer(Void)) : Void
  fun graphene_quaternion_slerp(this : Void*, b : Pointer(Void), factor : Float32, res : Pointer(Void)) : Void
  fun graphene_quaternion_to_angle_vec3(this : Void*, angle : Pointer(Float32), axis : Pointer(Void)) : Void
  fun graphene_quaternion_to_angles(this : Void*, deg_x : Pointer(Float32), deg_y : Pointer(Float32), deg_z : Pointer(Float32)) : Void
  fun graphene_quaternion_to_matrix(this : Void*, m : Pointer(Void)) : Void
  fun graphene_quaternion_to_radians(this : Void*, rad_x : Pointer(Float32), rad_y : Pointer(Float32), rad_z : Pointer(Float32)) : Void
  fun graphene_quaternion_to_vec4(this : Void*, res : Pointer(Void)) : Void
  fun graphene_ray_alloc : Pointer(Void)
  fun graphene_ray_equal(this : Void*, b : Pointer(Void)) : LibC::Int
  fun graphene_ray_free(this : Void*) : Void
  fun graphene_ray_get_closest_point_to_point(this : Void*, p : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_ray_get_direction(this : Void*, direction : Pointer(Void)) : Void
  fun graphene_ray_get_distance_to_plane(this : Void*, p : Pointer(Void)) : Float32
  fun graphene_ray_get_distance_to_point(this : Void*, p : Pointer(Void)) : Float32
  fun graphene_ray_get_origin(this : Void*, origin : Pointer(Void)) : Void
  fun graphene_ray_get_position_at(this : Void*, t : Float32, position : Pointer(Void)) : Void
  fun graphene_ray_get_type : UInt64
  fun graphene_ray_init(this : Void*, origin : Pointer(Void), direction : Pointer(Void)) : Pointer(Void)
  fun graphene_ray_init_from_ray(this : Void*, src : Pointer(Void)) : Pointer(Void)
  fun graphene_ray_init_from_vec3(this : Void*, origin : Pointer(Void), direction : Pointer(Void)) : Pointer(Void)
  fun graphene_ray_intersect_box(this : Void*, b : Pointer(Void), t_out : Pointer(Float32)) : UInt32
  fun graphene_ray_intersect_sphere(this : Void*, s : Pointer(Void), t_out : Pointer(Float32)) : UInt32
  fun graphene_ray_intersect_triangle(this : Void*, t : Pointer(Void), t_out : Pointer(Float32)) : UInt32
  fun graphene_ray_intersects_box(this : Void*, b : Pointer(Void)) : LibC::Int
  fun graphene_ray_intersects_sphere(this : Void*, s : Pointer(Void)) : LibC::Int
  fun graphene_ray_intersects_triangle(this : Void*, t : Pointer(Void)) : LibC::Int
  fun graphene_rect_alloc : Pointer(Void)
  fun graphene_rect_alloc : Pointer(Void)
  fun graphene_rect_contains_point(this : Void*, p : Pointer(Void)) : LibC::Int
  fun graphene_rect_contains_rect(this : Void*, b : Pointer(Void)) : LibC::Int
  fun graphene_rect_equal(this : Void*, b : Pointer(Void)) : LibC::Int
  fun graphene_rect_expand(this : Void*, p : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_rect_free(this : Void*) : Void
  fun graphene_rect_get_area(this : Void*) : Float32
  fun graphene_rect_get_bottom_left(this : Void*, p : Pointer(Void)) : Void
  fun graphene_rect_get_bottom_right(this : Void*, p : Pointer(Void)) : Void
  fun graphene_rect_get_center(this : Void*, p : Pointer(Void)) : Void
  fun graphene_rect_get_height(this : Void*) : Float32
  fun graphene_rect_get_top_left(this : Void*, p : Pointer(Void)) : Void
  fun graphene_rect_get_top_right(this : Void*, p : Pointer(Void)) : Void
  fun graphene_rect_get_type : UInt64
  fun graphene_rect_get_vertices(this : Void*, vertices : Pointer(Pointer(Void[4]))) : Void
  fun graphene_rect_get_width(this : Void*) : Float32
  fun graphene_rect_get_x(this : Void*) : Float32
  fun graphene_rect_get_y(this : Void*) : Float32
  fun graphene_rect_init(this : Void*, x : Float32, y : Float32, width : Float32, height : Float32) : Pointer(Void)
  fun graphene_rect_init_from_rect(this : Void*, src : Pointer(Void)) : Pointer(Void)
  fun graphene_rect_inset(this : Void*, d_x : Float32, d_y : Float32) : Pointer(Void)
  fun graphene_rect_inset_r(this : Void*, d_x : Float32, d_y : Float32, res : Pointer(Void)) : Void
  fun graphene_rect_interpolate(this : Void*, b : Pointer(Void), factor : Float64, res : Pointer(Void)) : Void
  fun graphene_rect_intersection(this : Void*, b : Pointer(Void), res : Pointer(Void)) : LibC::Int
  fun graphene_rect_normalize(this : Void*) : Pointer(Void)
  fun graphene_rect_normalize_r(this : Void*, res : Pointer(Void)) : Void
  fun graphene_rect_offset(this : Void*, d_x : Float32, d_y : Float32) : Pointer(Void)
  fun graphene_rect_offset_r(this : Void*, d_x : Float32, d_y : Float32, res : Pointer(Void)) : Void
  fun graphene_rect_round(this : Void*, res : Pointer(Void)) : Void
  fun graphene_rect_round_extents(this : Void*, res : Pointer(Void)) : Void
  fun graphene_rect_round_to_pixel(this : Void*) : Pointer(Void)
  fun graphene_rect_scale(this : Void*, s_h : Float32, s_v : Float32, res : Pointer(Void)) : Void
  fun graphene_rect_union(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_rect_zero : Pointer(Void)
  fun graphene_rect_zero : Pointer(Void)
  fun graphene_size_alloc : Pointer(Void)
  fun graphene_size_equal(this : Void*, b : Pointer(Void)) : LibC::Int
  fun graphene_size_free(this : Void*) : Void
  fun graphene_size_get_type : UInt64
  fun graphene_size_init(this : Void*, width : Float32, height : Float32) : Pointer(Void)
  fun graphene_size_init_from_size(this : Void*, src : Pointer(Void)) : Pointer(Void)
  fun graphene_size_interpolate(this : Void*, b : Pointer(Void), factor : Float64, res : Pointer(Void)) : Void
  fun graphene_size_scale(this : Void*, factor : Float32, res : Pointer(Void)) : Void
  fun graphene_size_zero : Pointer(Void)
  fun graphene_size_zero : Pointer(Void)
  fun graphene_sphere_alloc : Pointer(Void)
  fun graphene_sphere_contains_point(this : Void*, point : Pointer(Void)) : LibC::Int
  fun graphene_sphere_distance(this : Void*, point : Pointer(Void)) : Float32
  fun graphene_sphere_equal(this : Void*, b : Pointer(Void)) : LibC::Int
  fun graphene_sphere_free(this : Void*) : Void
  fun graphene_sphere_get_bounding_box(this : Void*, box : Pointer(Void)) : Void
  fun graphene_sphere_get_center(this : Void*, center : Pointer(Void)) : Void
  fun graphene_sphere_get_radius(this : Void*) : Float32
  fun graphene_sphere_get_type : UInt64
  fun graphene_sphere_init(this : Void*, center : Pointer(Void), radius : Float32) : Pointer(Void)
  fun graphene_sphere_init_from_points(this : Void*, n_points : UInt32, points : Pointer(Void), center : Pointer(Void)) : Pointer(Void)
  fun graphene_sphere_init_from_vectors(this : Void*, n_vectors : UInt32, vectors : Pointer(Void), center : Pointer(Void)) : Pointer(Void)
  fun graphene_sphere_is_empty(this : Void*) : LibC::Int
  fun graphene_sphere_translate(this : Void*, point : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_triangle_alloc : Pointer(Void)
  fun graphene_triangle_contains_point(this : Void*, p : Pointer(Void)) : LibC::Int
  fun graphene_triangle_equal(this : Void*, b : Pointer(Void)) : LibC::Int
  fun graphene_triangle_free(this : Void*) : Void
  fun graphene_triangle_get_area(this : Void*) : Float32
  fun graphene_triangle_get_barycoords(this : Void*, p : Pointer(Void), res : Pointer(Void)) : LibC::Int
  fun graphene_triangle_get_bounding_box(this : Void*, res : Pointer(Void)) : Void
  fun graphene_triangle_get_midpoint(this : Void*, res : Pointer(Void)) : Void
  fun graphene_triangle_get_normal(this : Void*, res : Pointer(Void)) : Void
  fun graphene_triangle_get_plane(this : Void*, res : Pointer(Void)) : Void
  fun graphene_triangle_get_points(this : Void*, a : Pointer(Void), b : Pointer(Void), c : Pointer(Void)) : Void
  fun graphene_triangle_get_type : UInt64
  fun graphene_triangle_get_uv(this : Void*, p : Pointer(Void), uv_a : Pointer(Void), uv_b : Pointer(Void), uv_c : Pointer(Void), res : Pointer(Void)) : LibC::Int
  fun graphene_triangle_get_vertices(this : Void*, a : Pointer(Void), b : Pointer(Void), c : Pointer(Void)) : Void
  fun graphene_triangle_init_from_float(this : Void*, a : Pointer(Float32[3]), b : Pointer(Float32[3]), c : Pointer(Float32[3])) : Pointer(Void)
  fun graphene_triangle_init_from_point3d(this : Void*, a : Pointer(Void), b : Pointer(Void), c : Pointer(Void)) : Pointer(Void)
  fun graphene_triangle_init_from_vec3(this : Void*, a : Pointer(Void), b : Pointer(Void), c : Pointer(Void)) : Pointer(Void)
  fun graphene_vec2_add(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_vec2_alloc : Pointer(Void)
  fun graphene_vec2_divide(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_vec2_dot(this : Void*, b : Pointer(Void)) : Float32
  fun graphene_vec2_equal(this : Void*, v2 : Pointer(Void)) : LibC::Int
  fun graphene_vec2_free(this : Void*) : Void
  fun graphene_vec2_get_type : UInt64
  fun graphene_vec2_get_x(this : Void*) : Float32
  fun graphene_vec2_get_y(this : Void*) : Float32
  fun graphene_vec2_init(this : Void*, x : Float32, y : Float32) : Pointer(Void)
  fun graphene_vec2_init_from_float(this : Void*, src : Pointer(Float32[2])) : Pointer(Void)
  fun graphene_vec2_init_from_vec2(this : Void*, src : Pointer(Void)) : Pointer(Void)
  fun graphene_vec2_interpolate(this : Void*, v2 : Pointer(Void), factor : Float64, res : Pointer(Void)) : Void
  fun graphene_vec2_length(this : Void*) : Float32
  fun graphene_vec2_max(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_vec2_min(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_vec2_multiply(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_vec2_near(this : Void*, v2 : Pointer(Void), epsilon : Float32) : LibC::Int
  fun graphene_vec2_negate(this : Void*, res : Pointer(Void)) : Void
  fun graphene_vec2_normalize(this : Void*, res : Pointer(Void)) : Void
  fun graphene_vec2_one : Pointer(Void)
  fun graphene_vec2_one : Pointer(Void)
  fun graphene_vec2_scale(this : Void*, factor : Float32, res : Pointer(Void)) : Void
  fun graphene_vec2_subtract(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_vec2_to_float(this : Void*, dest : Pointer(Pointer(Float32[2]))) : Void
  fun graphene_vec2_x_axis : Pointer(Void)
  fun graphene_vec2_x_axis : Pointer(Void)
  fun graphene_vec2_y_axis : Pointer(Void)
  fun graphene_vec2_y_axis : Pointer(Void)
  fun graphene_vec2_zero : Pointer(Void)
  fun graphene_vec2_zero : Pointer(Void)
  fun graphene_vec3_add(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_vec3_alloc : Pointer(Void)
  fun graphene_vec3_cross(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_vec3_divide(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_vec3_dot(this : Void*, b : Pointer(Void)) : Float32
  fun graphene_vec3_equal(this : Void*, v2 : Pointer(Void)) : LibC::Int
  fun graphene_vec3_free(this : Void*) : Void
  fun graphene_vec3_get_type : UInt64
  fun graphene_vec3_get_x(this : Void*) : Float32
  fun graphene_vec3_get_xy(this : Void*, res : Pointer(Void)) : Void
  fun graphene_vec3_get_xy0(this : Void*, res : Pointer(Void)) : Void
  fun graphene_vec3_get_xyz0(this : Void*, res : Pointer(Void)) : Void
  fun graphene_vec3_get_xyz1(this : Void*, res : Pointer(Void)) : Void
  fun graphene_vec3_get_xyzw(this : Void*, w : Float32, res : Pointer(Void)) : Void
  fun graphene_vec3_get_y(this : Void*) : Float32
  fun graphene_vec3_get_z(this : Void*) : Float32
  fun graphene_vec3_init(this : Void*, x : Float32, y : Float32, z : Float32) : Pointer(Void)
  fun graphene_vec3_init_from_float(this : Void*, src : Pointer(Float32[3])) : Pointer(Void)
  fun graphene_vec3_init_from_vec3(this : Void*, src : Pointer(Void)) : Pointer(Void)
  fun graphene_vec3_interpolate(this : Void*, v2 : Pointer(Void), factor : Float64, res : Pointer(Void)) : Void
  fun graphene_vec3_length(this : Void*) : Float32
  fun graphene_vec3_max(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_vec3_min(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_vec3_multiply(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_vec3_near(this : Void*, v2 : Pointer(Void), epsilon : Float32) : LibC::Int
  fun graphene_vec3_negate(this : Void*, res : Pointer(Void)) : Void
  fun graphene_vec3_normalize(this : Void*, res : Pointer(Void)) : Void
  fun graphene_vec3_one : Pointer(Void)
  fun graphene_vec3_one : Pointer(Void)
  fun graphene_vec3_scale(this : Void*, factor : Float32, res : Pointer(Void)) : Void
  fun graphene_vec3_subtract(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_vec3_to_float(this : Void*, dest : Pointer(Pointer(Float32[3]))) : Void
  fun graphene_vec3_x_axis : Pointer(Void)
  fun graphene_vec3_x_axis : Pointer(Void)
  fun graphene_vec3_y_axis : Pointer(Void)
  fun graphene_vec3_y_axis : Pointer(Void)
  fun graphene_vec3_z_axis : Pointer(Void)
  fun graphene_vec3_z_axis : Pointer(Void)
  fun graphene_vec3_zero : Pointer(Void)
  fun graphene_vec3_zero : Pointer(Void)
  fun graphene_vec4_add(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_vec4_alloc : Pointer(Void)
  fun graphene_vec4_divide(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_vec4_dot(this : Void*, b : Pointer(Void)) : Float32
  fun graphene_vec4_equal(this : Void*, v2 : Pointer(Void)) : LibC::Int
  fun graphene_vec4_free(this : Void*) : Void
  fun graphene_vec4_get_type : UInt64
  fun graphene_vec4_get_w(this : Void*) : Float32
  fun graphene_vec4_get_x(this : Void*) : Float32
  fun graphene_vec4_get_xy(this : Void*, res : Pointer(Void)) : Void
  fun graphene_vec4_get_xyz(this : Void*, res : Pointer(Void)) : Void
  fun graphene_vec4_get_y(this : Void*) : Float32
  fun graphene_vec4_get_z(this : Void*) : Float32
  fun graphene_vec4_init(this : Void*, x : Float32, y : Float32, z : Float32, w : Float32) : Pointer(Void)
  fun graphene_vec4_init_from_float(this : Void*, src : Pointer(Float32[4])) : Pointer(Void)
  fun graphene_vec4_init_from_vec2(this : Void*, src : Pointer(Void), z : Float32, w : Float32) : Pointer(Void)
  fun graphene_vec4_init_from_vec3(this : Void*, src : Pointer(Void), w : Float32) : Pointer(Void)
  fun graphene_vec4_init_from_vec4(this : Void*, src : Pointer(Void)) : Pointer(Void)
  fun graphene_vec4_interpolate(this : Void*, v2 : Pointer(Void), factor : Float64, res : Pointer(Void)) : Void
  fun graphene_vec4_length(this : Void*) : Float32
  fun graphene_vec4_max(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_vec4_min(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_vec4_multiply(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_vec4_near(this : Void*, v2 : Pointer(Void), epsilon : Float32) : LibC::Int
  fun graphene_vec4_negate(this : Void*, res : Pointer(Void)) : Void
  fun graphene_vec4_normalize(this : Void*, res : Pointer(Void)) : Void
  fun graphene_vec4_one : Pointer(Void)
  fun graphene_vec4_one : Pointer(Void)
  fun graphene_vec4_scale(this : Void*, factor : Float32, res : Pointer(Void)) : Void
  fun graphene_vec4_subtract(this : Void*, b : Pointer(Void), res : Pointer(Void)) : Void
  fun graphene_vec4_to_float(this : Void*, dest : Pointer(Pointer(Float32[4]))) : Void
  fun graphene_vec4_w_axis : Pointer(Void)
  fun graphene_vec4_w_axis : Pointer(Void)
  fun graphene_vec4_x_axis : Pointer(Void)
  fun graphene_vec4_x_axis : Pointer(Void)
  fun graphene_vec4_y_axis : Pointer(Void)
  fun graphene_vec4_y_axis : Pointer(Void)
  fun graphene_vec4_z_axis : Pointer(Void)
  fun graphene_vec4_z_axis : Pointer(Void)
  fun graphene_vec4_zero : Pointer(Void)
  fun graphene_vec4_zero : Pointer(Void)
end
