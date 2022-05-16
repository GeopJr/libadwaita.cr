@[Link("gtk-4", pkg_config: "gtk-4")]
lib LibGsk
  # Flags

  # Enums
  type BlendMode = UInt32
  type Corner = UInt32
  type GLUniformType = UInt32
  type RenderNodeType = UInt32
  type ScalingFilter = UInt32
  type SerializationError = UInt32
  type TransformCategory = UInt32

  # Callbacks
  alias ParseErrorFunc = Pointer(LibGsk::ParseLocation), Pointer(LibGsk::ParseLocation), Pointer(Void), Pointer(Void) -> Void

  # Interface types

  # Structs
  type BroadwayRendererClass = Void # Struct with zero bytes

  type CairoRendererClass = Void # Struct with zero bytes

  struct ColorStop # 20 bytes long
    offset : Float32
    color : LibGdk::RGBA
  end

  type GLRendererClass = Void # Struct with zero bytes

  struct GLShaderClass # 136 bytes long
    parent_class : LibGObject::ObjectClass
  end

  struct ParseLocation # 40 bytes long
    bytes : UInt64
    chars : UInt64
    lines : UInt64
    line_bytes : UInt64
    line_chars : UInt64
  end

  type RendererClass = Void # Struct with zero bytes

  struct RoundedRect # 48 bytes long
    bounds : LibGraphene::Rect
    corner : Void[4]
  end

  type ShaderArgsBuilder = Void # Struct with zero bytes

  struct Shadow # 28 bytes long
    color : LibGdk::RGBA
    dx : Float32
    dy : Float32
    radius : Float32
  end

  type Transform = Void # Struct with zero bytes

  type VulkanRendererClass = Void # Struct with zero bytes

  # Unions

  # Objects
  type BlendNode = Void # Object struct with no fields

  type BlurNode = Void # Object struct with no fields

  type BorderNode = Void # Object struct with no fields

  type BroadwayRenderer = Void # Object struct with no fields

  type CairoNode = Void # Object struct with no fields

  type CairoRenderer = Void # Object struct with no fields

  type ClipNode = Void # Object struct with no fields

  type ColorMatrixNode = Void # Object struct with no fields

  type ColorNode = Void # Object struct with no fields

  type ConicGradientNode = Void # Object struct with no fields

  type ContainerNode = Void # Object struct with no fields

  type CrossFadeNode = Void # Object struct with no fields

  type DebugNode = Void # Object struct with no fields

  type GLRenderer = Void # Object struct with no fields

  type GLShader = Void # Object struct with no fields

  type GLShaderNode = Void # Object struct with no fields

  type InsetShadowNode = Void # Object struct with no fields

  type LinearGradientNode = Void # Object struct with no fields

  type NglRenderer = Void # Object struct with no fields

  type OpacityNode = Void # Object struct with no fields

  type OutsetShadowNode = Void # Object struct with no fields

  type RadialGradientNode = Void # Object struct with no fields

  type RenderNode = Void # Object struct with no fields

  type Renderer = Void # Object struct with no fields

  type RepeatNode = Void # Object struct with no fields

  type RepeatingLinearGradientNode = Void # Object struct with no fields

  type RepeatingRadialGradientNode = Void # Object struct with no fields

  type RoundedClipNode = Void # Object struct with no fields

  type ShadowNode = Void # Object struct with no fields

  type TextNode = Void # Object struct with no fields

  type TextureNode = Void # Object struct with no fields

  type TransformNode = Void # Object struct with no fields

  type VulkanRenderer = Void # Object struct with no fields

  # All C Functions
  fun gsk_blend_node_get_blend_mode(this : Void*) : UInt32
  fun gsk_blend_node_get_bottom_child(this : Void*) : Pointer(Void)
  fun gsk_blend_node_get_top_child(this : Void*) : Pointer(Void)
  fun gsk_blend_node_get_type : UInt64
  fun gsk_blend_node_new(bottom : Pointer(Void), top : Pointer(Void), blend_mode : UInt32) : Pointer(Void)
  fun gsk_blur_node_get_child(this : Void*) : Pointer(Void)
  fun gsk_blur_node_get_radius(this : Void*) : Float32
  fun gsk_blur_node_get_type : UInt64
  fun gsk_blur_node_new(child : Pointer(Void), radius : Float32) : Pointer(Void)
  fun gsk_border_node_get_colors(this : Void*) : Pointer(Void)
  fun gsk_border_node_get_outline(this : Void*) : Pointer(Void)
  fun gsk_border_node_get_type : UInt64
  fun gsk_border_node_get_widths(this : Void*) : Pointer(Float32[4])
  fun gsk_border_node_new(outline : Pointer(Void), border_width : Pointer(Float32), border_color : Pointer(Void)) : Pointer(Void)
  fun gsk_broadway_renderer_get_type : UInt64
  fun gsk_broadway_renderer_new : Pointer(Void)
  fun gsk_cairo_node_get_draw_context(this : Void*) : Pointer(Void)
  fun gsk_cairo_node_get_surface(this : Void*) : Pointer(Void)
  fun gsk_cairo_node_get_type : UInt64
  fun gsk_cairo_node_new(bounds : Pointer(Void)) : Pointer(Void)
  fun gsk_cairo_renderer_get_type : UInt64
  fun gsk_cairo_renderer_new : Pointer(Void)
  fun gsk_clip_node_get_child(this : Void*) : Pointer(Void)
  fun gsk_clip_node_get_clip(this : Void*) : Pointer(Void)
  fun gsk_clip_node_get_type : UInt64
  fun gsk_clip_node_new(child : Pointer(Void), clip : Pointer(Void)) : Pointer(Void)
  fun gsk_color_matrix_node_get_child(this : Void*) : Pointer(Void)
  fun gsk_color_matrix_node_get_color_matrix(this : Void*) : Pointer(Void)
  fun gsk_color_matrix_node_get_color_offset(this : Void*) : Pointer(Void)
  fun gsk_color_matrix_node_get_type : UInt64
  fun gsk_color_matrix_node_new(child : Pointer(Void), color_matrix : Pointer(Void), color_offset : Pointer(Void)) : Pointer(Void)
  fun gsk_color_node_get_color(this : Void*) : Pointer(Void)
  fun gsk_color_node_get_type : UInt64
  fun gsk_color_node_new(rgba : Pointer(Void), bounds : Pointer(Void)) : Pointer(Void)
  fun gsk_conic_gradient_node_get_angle(this : Void*) : Float32
  fun gsk_conic_gradient_node_get_center(this : Void*) : Pointer(Void)
  fun gsk_conic_gradient_node_get_color_stops(this : Void*, n_stops : Pointer(UInt64)) : Pointer(Void)
  fun gsk_conic_gradient_node_get_n_color_stops(this : Void*) : UInt64
  fun gsk_conic_gradient_node_get_rotation(this : Void*) : Float32
  fun gsk_conic_gradient_node_get_type : UInt64
  fun gsk_conic_gradient_node_new(bounds : Pointer(Void), center : Pointer(Void), rotation : Float32, color_stops : Pointer(Void), n_color_stops : UInt64) : Pointer(Void)
  fun gsk_container_node_get_child(this : Void*, idx : UInt32) : Pointer(Void)
  fun gsk_container_node_get_n_children(this : Void*) : UInt32
  fun gsk_container_node_get_type : UInt64
  fun gsk_container_node_new(children : Pointer(Pointer(Void)), n_children : UInt32) : Pointer(Void)
  fun gsk_cross_fade_node_get_end_child(this : Void*) : Pointer(Void)
  fun gsk_cross_fade_node_get_progress(this : Void*) : Float32
  fun gsk_cross_fade_node_get_start_child(this : Void*) : Pointer(Void)
  fun gsk_cross_fade_node_get_type : UInt64
  fun gsk_cross_fade_node_new(start : Pointer(Void), _end : Pointer(Void), progress : Float32) : Pointer(Void)
  fun gsk_debug_node_get_child(this : Void*) : Pointer(Void)
  fun gsk_debug_node_get_message(this : Void*) : Pointer(LibC::Char)
  fun gsk_debug_node_get_type : UInt64
  fun gsk_debug_node_new(child : Pointer(Void), message : Pointer(LibC::Char)) : Pointer(Void)
  fun gsk_gl_renderer_get_type : UInt64
  fun gsk_gl_renderer_new : Pointer(Void)
  fun gsk_gl_shader_compile(this : Void*, renderer : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun gsk_gl_shader_find_uniform_by_name(this : Void*, name : Pointer(LibC::Char)) : Int32
  fun gsk_gl_shader_get_arg_bool(this : Void*, args : Pointer(Void), idx : Int32) : LibC::Int
  fun gsk_gl_shader_get_arg_float(this : Void*, args : Pointer(Void), idx : Int32) : Float32
  fun gsk_gl_shader_get_arg_int(this : Void*, args : Pointer(Void), idx : Int32) : Int32
  fun gsk_gl_shader_get_arg_uint(this : Void*, args : Pointer(Void), idx : Int32) : UInt32
  fun gsk_gl_shader_get_arg_vec2(this : Void*, args : Pointer(Void), idx : Int32, out_value : Pointer(Void)) : Void
  fun gsk_gl_shader_get_arg_vec3(this : Void*, args : Pointer(Void), idx : Int32, out_value : Pointer(Void)) : Void
  fun gsk_gl_shader_get_arg_vec4(this : Void*, args : Pointer(Void), idx : Int32, out_value : Pointer(Void)) : Void
  fun gsk_gl_shader_get_args_size(this : Void*) : UInt64
  fun gsk_gl_shader_get_n_textures(this : Void*) : Int32
  fun gsk_gl_shader_get_n_uniforms(this : Void*) : Int32
  fun gsk_gl_shader_get_resource(this : Void*) : Pointer(LibC::Char)
  fun gsk_gl_shader_get_source(this : Void*) : Pointer(Void)
  fun gsk_gl_shader_get_type : UInt64
  fun gsk_gl_shader_get_uniform_name(this : Void*, idx : Int32) : Pointer(LibC::Char)
  fun gsk_gl_shader_get_uniform_offset(this : Void*, idx : Int32) : Int32
  fun gsk_gl_shader_get_uniform_type(this : Void*, idx : Int32) : UInt32
  fun gsk_gl_shader_new_from_bytes(sourcecode : Pointer(Void)) : Pointer(Void)
  fun gsk_gl_shader_new_from_resource(resource_path : Pointer(LibC::Char)) : Pointer(Void)
  fun gsk_gl_shader_node_get_args(this : Void*) : Pointer(Void)
  fun gsk_gl_shader_node_get_child(this : Void*, idx : UInt32) : Pointer(Void)
  fun gsk_gl_shader_node_get_n_children(this : Void*) : UInt32
  fun gsk_gl_shader_node_get_shader(this : Void*) : Pointer(Void)
  fun gsk_gl_shader_node_get_type : UInt64
  fun gsk_gl_shader_node_new(shader : Pointer(Void), bounds : Pointer(Void), args : Pointer(Void), children : Pointer(Pointer(Void)), n_children : UInt32) : Pointer(Void)
  fun gsk_inset_shadow_node_get_blur_radius(this : Void*) : Float32
  fun gsk_inset_shadow_node_get_color(this : Void*) : Pointer(Void)
  fun gsk_inset_shadow_node_get_dx(this : Void*) : Float32
  fun gsk_inset_shadow_node_get_dy(this : Void*) : Float32
  fun gsk_inset_shadow_node_get_outline(this : Void*) : Pointer(Void)
  fun gsk_inset_shadow_node_get_spread(this : Void*) : Float32
  fun gsk_inset_shadow_node_get_type : UInt64
  fun gsk_inset_shadow_node_new(outline : Pointer(Void), color : Pointer(Void), dx : Float32, dy : Float32, spread : Float32, blur_radius : Float32) : Pointer(Void)
  fun gsk_linear_gradient_node_get_color_stops(this : Void*, n_stops : Pointer(UInt64)) : Pointer(Void)
  fun gsk_linear_gradient_node_get_end(this : Void*) : Pointer(Void)
  fun gsk_linear_gradient_node_get_n_color_stops(this : Void*) : UInt64
  fun gsk_linear_gradient_node_get_start(this : Void*) : Pointer(Void)
  fun gsk_linear_gradient_node_get_type : UInt64
  fun gsk_linear_gradient_node_new(bounds : Pointer(Void), start : Pointer(Void), _end : Pointer(Void), color_stops : Pointer(Void), n_color_stops : UInt64) : Pointer(Void)
  fun gsk_ngl_renderer_get_type : UInt64
  fun gsk_ngl_renderer_new : Pointer(Void)
  fun gsk_opacity_node_get_child(this : Void*) : Pointer(Void)
  fun gsk_opacity_node_get_opacity(this : Void*) : Float32
  fun gsk_opacity_node_get_type : UInt64
  fun gsk_opacity_node_new(child : Pointer(Void), opacity : Float32) : Pointer(Void)
  fun gsk_outset_shadow_node_get_blur_radius(this : Void*) : Float32
  fun gsk_outset_shadow_node_get_color(this : Void*) : Pointer(Void)
  fun gsk_outset_shadow_node_get_dx(this : Void*) : Float32
  fun gsk_outset_shadow_node_get_dy(this : Void*) : Float32
  fun gsk_outset_shadow_node_get_outline(this : Void*) : Pointer(Void)
  fun gsk_outset_shadow_node_get_spread(this : Void*) : Float32
  fun gsk_outset_shadow_node_get_type : UInt64
  fun gsk_outset_shadow_node_new(outline : Pointer(Void), color : Pointer(Void), dx : Float32, dy : Float32, spread : Float32, blur_radius : Float32) : Pointer(Void)
  fun gsk_radial_gradient_node_get_center(this : Void*) : Pointer(Void)
  fun gsk_radial_gradient_node_get_color_stops(this : Void*, n_stops : Pointer(UInt64)) : Pointer(Void)
  fun gsk_radial_gradient_node_get_end(this : Void*) : Float32
  fun gsk_radial_gradient_node_get_hradius(this : Void*) : Float32
  fun gsk_radial_gradient_node_get_n_color_stops(this : Void*) : UInt64
  fun gsk_radial_gradient_node_get_start(this : Void*) : Float32
  fun gsk_radial_gradient_node_get_type : UInt64
  fun gsk_radial_gradient_node_get_vradius(this : Void*) : Float32
  fun gsk_radial_gradient_node_new(bounds : Pointer(Void), center : Pointer(Void), hradius : Float32, vradius : Float32, start : Float32, _end : Float32, color_stops : Pointer(Void), n_color_stops : UInt64) : Pointer(Void)
  fun gsk_render_node_deserialize(bytes : Pointer(Void), error_func : Void*, user_data : Pointer(Void)) : Pointer(Void)
  fun gsk_render_node_draw(this : Void*, cr : Pointer(Void)) : Void
  fun gsk_render_node_get_bounds(this : Void*, bounds : Pointer(Void)) : Void
  fun gsk_render_node_get_node_type(this : Void*) : UInt32
  fun gsk_render_node_get_type : UInt64
  fun gsk_render_node_ref(this : Void*) : Pointer(Void)
  fun gsk_render_node_serialize(this : Void*) : Pointer(Void)
  fun gsk_render_node_unref(this : Void*) : Void
  fun gsk_render_node_write_to_file(this : Void*, filename : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun gsk_renderer_get_surface(this : Void*) : Pointer(Void)
  fun gsk_renderer_get_type : UInt64
  fun gsk_renderer_is_realized(this : Void*) : LibC::Int
  fun gsk_renderer_new_for_surface(surface : Pointer(Void)) : Pointer(Void)
  fun gsk_renderer_realize(this : Void*, surface : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun gsk_renderer_render(this : Void*, root : Pointer(Void), region : Pointer(Void)) : Void
  fun gsk_renderer_render_texture(this : Void*, root : Pointer(Void), viewport : Pointer(Void)) : Pointer(Void)
  fun gsk_renderer_unrealize(this : Void*) : Void
  fun gsk_repeat_node_get_child(this : Void*) : Pointer(Void)
  fun gsk_repeat_node_get_child_bounds(this : Void*) : Pointer(Void)
  fun gsk_repeat_node_get_type : UInt64
  fun gsk_repeat_node_new(bounds : Pointer(Void), child : Pointer(Void), child_bounds : Pointer(Void)) : Pointer(Void)
  fun gsk_repeating_linear_gradient_node_get_type : UInt64
  fun gsk_repeating_linear_gradient_node_new(bounds : Pointer(Void), start : Pointer(Void), _end : Pointer(Void), color_stops : Pointer(Void), n_color_stops : UInt64) : Pointer(Void)
  fun gsk_repeating_radial_gradient_node_get_type : UInt64
  fun gsk_repeating_radial_gradient_node_new(bounds : Pointer(Void), center : Pointer(Void), hradius : Float32, vradius : Float32, start : Float32, _end : Float32, color_stops : Pointer(Void), n_color_stops : UInt64) : Pointer(Void)
  fun gsk_rounded_clip_node_get_child(this : Void*) : Pointer(Void)
  fun gsk_rounded_clip_node_get_clip(this : Void*) : Pointer(Void)
  fun gsk_rounded_clip_node_get_type : UInt64
  fun gsk_rounded_clip_node_new(child : Pointer(Void), clip : Pointer(Void)) : Pointer(Void)
  fun gsk_rounded_rect_contains_point(this : Void*, point : Pointer(Void)) : LibC::Int
  fun gsk_rounded_rect_contains_rect(this : Void*, rect : Pointer(Void)) : LibC::Int
  fun gsk_rounded_rect_init(this : Void*, bounds : Pointer(Void), top_left : Pointer(Void), top_right : Pointer(Void), bottom_right : Pointer(Void), bottom_left : Pointer(Void)) : Pointer(Void)
  fun gsk_rounded_rect_init_copy(this : Void*, src : Pointer(Void)) : Pointer(Void)
  fun gsk_rounded_rect_init_from_rect(this : Void*, bounds : Pointer(Void), radius : Float32) : Pointer(Void)
  fun gsk_rounded_rect_intersects_rect(this : Void*, rect : Pointer(Void)) : LibC::Int
  fun gsk_rounded_rect_is_rectilinear(this : Void*) : LibC::Int
  fun gsk_rounded_rect_normalize(this : Void*) : Pointer(Void)
  fun gsk_rounded_rect_offset(this : Void*, dx : Float32, dy : Float32) : Pointer(Void)
  fun gsk_rounded_rect_shrink(this : Void*, top : Float32, right : Float32, bottom : Float32, left : Float32) : Pointer(Void)
  fun gsk_serialization_error_quark : UInt32
  fun gsk_shader_args_builder_get_type : UInt64
  fun gsk_shader_args_builder_new(shader : Pointer(Void), initial_values : Pointer(Void)) : Pointer(Void)
  fun gsk_shader_args_builder_ref(this : Void*) : Pointer(Void)
  fun gsk_shader_args_builder_set_bool(this : Void*, idx : Int32, value : LibC::Int) : Void
  fun gsk_shader_args_builder_set_float(this : Void*, idx : Int32, value : Float32) : Void
  fun gsk_shader_args_builder_set_int(this : Void*, idx : Int32, value : Int32) : Void
  fun gsk_shader_args_builder_set_uint(this : Void*, idx : Int32, value : UInt32) : Void
  fun gsk_shader_args_builder_set_vec2(this : Void*, idx : Int32, value : Pointer(Void)) : Void
  fun gsk_shader_args_builder_set_vec3(this : Void*, idx : Int32, value : Pointer(Void)) : Void
  fun gsk_shader_args_builder_set_vec4(this : Void*, idx : Int32, value : Pointer(Void)) : Void
  fun gsk_shader_args_builder_to_args(this : Void*) : Pointer(Void)
  fun gsk_shader_args_builder_unref(this : Void*) : Void
  fun gsk_shadow_node_get_child(this : Void*) : Pointer(Void)
  fun gsk_shadow_node_get_n_shadows(this : Void*) : UInt64
  fun gsk_shadow_node_get_shadow(this : Void*, i : UInt64) : Pointer(Void)
  fun gsk_shadow_node_get_type : UInt64
  fun gsk_shadow_node_new(child : Pointer(Void), shadows : Pointer(Void), n_shadows : UInt64) : Pointer(Void)
  fun gsk_text_node_get_color(this : Void*) : Pointer(Void)
  fun gsk_text_node_get_font(this : Void*) : Pointer(Void)
  fun gsk_text_node_get_glyphs(this : Void*, n_glyphs : Pointer(UInt32)) : Pointer(Void)
  fun gsk_text_node_get_num_glyphs(this : Void*) : UInt32
  fun gsk_text_node_get_offset(this : Void*) : Pointer(Void)
  fun gsk_text_node_get_type : UInt64
  fun gsk_text_node_has_color_glyphs(this : Void*) : LibC::Int
  fun gsk_text_node_new(font : Pointer(Void), glyphs : Pointer(Void), color : Pointer(Void), offset : Pointer(Void)) : Pointer(Void)
  fun gsk_texture_node_get_texture(this : Void*) : Pointer(Void)
  fun gsk_texture_node_get_type : UInt64
  fun gsk_texture_node_new(texture : Pointer(Void), bounds : Pointer(Void)) : Pointer(Void)
  fun gsk_transform_equal(this : Void*, second : Pointer(Void)) : LibC::Int
  fun gsk_transform_get_category(this : Void*) : UInt32
  fun gsk_transform_get_type : UInt64
  fun gsk_transform_invert(this : Void*) : Pointer(Void)
  fun gsk_transform_matrix(this : Void*, matrix : Pointer(Void)) : Pointer(Void)
  fun gsk_transform_new : Pointer(Void)
  fun gsk_transform_node_get_child(this : Void*) : Pointer(Void)
  fun gsk_transform_node_get_transform(this : Void*) : Pointer(Void)
  fun gsk_transform_node_get_type : UInt64
  fun gsk_transform_node_new(child : Pointer(Void), transform : Pointer(Void)) : Pointer(Void)
  fun gsk_transform_parse(string : Pointer(LibC::Char), out_transform : Pointer(Pointer(Void))) : LibC::Int
  fun gsk_transform_parse(string : Pointer(LibC::Char), out_transform : Pointer(Pointer(Void))) : LibC::Int
  fun gsk_transform_perspective(this : Void*, depth : Float32) : Pointer(Void)
  fun gsk_transform_print(this : Void*, string : Pointer(Void)) : Void
  fun gsk_transform_ref(this : Void*) : Pointer(Void)
  fun gsk_transform_rotate(this : Void*, angle : Float32) : Pointer(Void)
  fun gsk_transform_rotate_3d(this : Void*, angle : Float32, axis : Pointer(Void)) : Pointer(Void)
  fun gsk_transform_scale(this : Void*, factor_x : Float32, factor_y : Float32) : Pointer(Void)
  fun gsk_transform_scale_3d(this : Void*, factor_x : Float32, factor_y : Float32, factor_z : Float32) : Pointer(Void)
  fun gsk_transform_skew(this : Void*, skew_x : Float32, skew_y : Float32) : Pointer(Void)
  fun gsk_transform_to_2d(this : Void*, out_xx : Pointer(Float32), out_yx : Pointer(Float32), out_xy : Pointer(Float32), out_yy : Pointer(Float32), out_dx : Pointer(Float32), out_dy : Pointer(Float32)) : Void
  fun gsk_transform_to_2d_components(this : Void*, out_skew_x : Pointer(Float32), out_skew_y : Pointer(Float32), out_scale_x : Pointer(Float32), out_scale_y : Pointer(Float32), out_angle : Pointer(Float32), out_dx : Pointer(Float32), out_dy : Pointer(Float32)) : Void
  fun gsk_transform_to_affine(this : Void*, out_scale_x : Pointer(Float32), out_scale_y : Pointer(Float32), out_dx : Pointer(Float32), out_dy : Pointer(Float32)) : Void
  fun gsk_transform_to_matrix(this : Void*, out_matrix : Pointer(Void)) : Void
  fun gsk_transform_to_string(this : Void*) : Pointer(LibC::Char)
  fun gsk_transform_to_translate(this : Void*, out_dx : Pointer(Float32), out_dy : Pointer(Float32)) : Void
  fun gsk_transform_transform(this : Void*, other : Pointer(Void)) : Pointer(Void)
  fun gsk_transform_transform_bounds(this : Void*, rect : Pointer(Void), out_rect : Pointer(Void)) : Void
  fun gsk_transform_transform_point(this : Void*, point : Pointer(Void), out_point : Pointer(Void)) : Void
  fun gsk_transform_translate(this : Void*, point : Pointer(Void)) : Pointer(Void)
  fun gsk_transform_translate_3d(this : Void*, point : Pointer(Void)) : Pointer(Void)
  fun gsk_transform_unref(this : Void*) : Void
  fun gsk_value_dup_render_node(value : Pointer(Void)) : Pointer(Void)
  fun gsk_value_get_render_node(value : Pointer(Void)) : Pointer(Void)
  fun gsk_value_set_render_node(value : Pointer(Void), node : Pointer(Void)) : Void
  fun gsk_value_take_render_node(value : Pointer(Void), node : Pointer(Void)) : Void
  fun gsk_vulkan_renderer_get_type : UInt64
  fun gsk_vulkan_renderer_new : Pointer(Void)
end
