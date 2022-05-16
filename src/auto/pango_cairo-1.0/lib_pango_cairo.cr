@[Link("pangocairo-1.0", pkg_config: "pangocairo-1.0")]
lib LibPangoCairo
  # Flags

  # Enums

  # Callbacks
  alias ShapeRendererFunc = Pointer(LibCairo::Context), Pointer(LibPango::AttrShape), LibC::Int, Pointer(Void) -> Void

  # Interface types
  type Font = Void
  type FontMap = Void

  # Structs

  # Unions

  # Objects

  # All C Functions
  fun pango_cairo_context_get_font_options(context : Pointer(Void)) : Pointer(Void)
  fun pango_cairo_context_get_resolution(context : Pointer(Void)) : Float64
  fun pango_cairo_context_set_font_options(context : Pointer(Void), options : Pointer(Void)) : Void
  fun pango_cairo_context_set_resolution(context : Pointer(Void), dpi : Float64) : Void
  fun pango_cairo_context_set_shape_renderer(context : Pointer(Void), func : Void*, data : Pointer(Void), dnotify : Void*) : Void
  fun pango_cairo_create_context(cr : Pointer(Void)) : Pointer(Void)
  fun pango_cairo_create_layout(cr : Pointer(Void)) : Pointer(Void)
  fun pango_cairo_error_underline_path(cr : Pointer(Void), x : Float64, y : Float64, width : Float64, height : Float64) : Void
  fun pango_cairo_font_get_scaled_font(this : Void*) : Pointer(Void)
  fun pango_cairo_font_get_type : UInt64
  fun pango_cairo_font_map_get_default : Pointer(Void)
  fun pango_cairo_font_map_get_default : Pointer(Void)
  fun pango_cairo_font_map_get_font_type(this : Void*) : UInt32
  fun pango_cairo_font_map_get_resolution(this : Void*) : Float64
  fun pango_cairo_font_map_get_type : UInt64
  fun pango_cairo_font_map_new : Pointer(Void)
  fun pango_cairo_font_map_new : Pointer(Void)
  fun pango_cairo_font_map_new_for_font_type(fonttype : UInt32) : Pointer(Void)
  fun pango_cairo_font_map_new_for_font_type(fonttype : UInt32) : Pointer(Void)
  fun pango_cairo_font_map_set_default(this : Void*) : Void
  fun pango_cairo_font_map_set_resolution(this : Void*, dpi : Float64) : Void
  fun pango_cairo_glyph_string_path(cr : Pointer(Void), font : Pointer(Void), glyphs : Pointer(Void)) : Void
  fun pango_cairo_layout_line_path(cr : Pointer(Void), line : Pointer(Void)) : Void
  fun pango_cairo_layout_path(cr : Pointer(Void), layout : Pointer(Void)) : Void
  fun pango_cairo_show_error_underline(cr : Pointer(Void), x : Float64, y : Float64, width : Float64, height : Float64) : Void
  fun pango_cairo_show_glyph_item(cr : Pointer(Void), text : Pointer(LibC::Char), glyph_item : Pointer(Void)) : Void
  fun pango_cairo_show_glyph_string(cr : Pointer(Void), font : Pointer(Void), glyphs : Pointer(Void)) : Void
  fun pango_cairo_show_layout(cr : Pointer(Void), layout : Pointer(Void)) : Void
  fun pango_cairo_show_layout_line(cr : Pointer(Void), line : Pointer(Void)) : Void
  fun pango_cairo_update_context(cr : Pointer(Void), context : Pointer(Void)) : Void
  fun pango_cairo_update_layout(cr : Pointer(Void), layout : Pointer(Void)) : Void
end
