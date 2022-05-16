# Dependencies
require "../cairo-1.0/cairo.cr"
require "../pango-1.0/pango.cr"
require "../g_object-2.0/g_object.cr"

# C lib declaration
require "./lib_pango_cairo.cr"

# Wrappers
require "./font.cr"
require "./font_map.cr"

module PangoCairo
  # Callbacks

  # Function type for rendering attributes of type %PANGO_ATTR_SHAPE
  # with Pango's Cairo renderer.
  alias ShapeRendererFunc = Proc(Cairo::Context, Pango::AttrShape, Bool, Nil)

  # Base class for all errors in this module.
  class PangoCairoError < RuntimeError
    # :nodoc:
    def initialize(error : Pointer(LibGLib::Error))
      message_ptr = error.value.message
      super(String.new(message_ptr)) unless message_ptr.null?
      LibGLib.g_error_free(error)
    end
  end

  # Enums

  # Flags

  def self.context_get_font_options(context : Pango::Context) : Cairo::FontOptions?
    # pango_cairo_context_get_font_options: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPangoCairo.pango_cairo_context_get_font_options(context)

    # Return value handling

    Cairo::FontOptions.new(_retval, GICrystal::Transfer::None) unless _retval.null?
  end

  def self.context_get_resolution(context : Pango::Context) : Float64
    # pango_cairo_context_get_resolution: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPangoCairo.pango_cairo_context_get_resolution(context)

    # Return value handling

    _retval
  end

  def self.context_set_font_options(context : Pango::Context, options : Cairo::FontOptions?) : Nil
    # pango_cairo_context_set_font_options: (None)
    # @options: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    options = if options.nil?
                Pointer(Void).null
              else
                options.to_unsafe
              end

    # C call
    LibPangoCairo.pango_cairo_context_set_font_options(context, options)

    # Return value handling
  end

  def self.context_set_resolution(context : Pango::Context, dpi : Float64) : Nil
    # pango_cairo_context_set_resolution: (None)
    # Returns: (transfer none)

    # C call
    LibPangoCairo.pango_cairo_context_set_resolution(context, dpi)

    # Return value handling
  end

  def self.context_set_shape_renderer(context : Pango::Context, func : PangoCairo::ShapeRendererFunc?) : Nil
    # pango_cairo_context_set_shape_renderer: (None)
    # @func: (nullable)
    # @data: (nullable)
    # @dnotify: (nullable)
    # Returns: (transfer none)

    # Generator::CallbackArgPlan
    if func
      _box = ::Box.box(func)
      func = ->(lib_cr : Pointer(Void), lib_attr : Pointer(Void), lib_do_path : LibC::Int, lib_data : Pointer(Void)) {
        # Generator::BuiltInTypeArgPlan
        cr = Cairo::Context.new(lib_cr, :none)
        # Generator::BuiltInTypeArgPlan
        attr = Pango::AttrShape.new(lib_attr, :none)
        do_path = lib_do_path
        ::Box(Proc(Cairo::Context, Pango::AttrShape, Bool, Nil)).unbox(lib_data).call(cr, attr, do_path)
      }.pointer
      data = GICrystal::ClosureDataManager.register(_box)
      dnotify = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
    else
      func = data = dnotify = Pointer(Void).null
    end

    # C call
    LibPangoCairo.pango_cairo_context_set_shape_renderer(context, func, data, dnotify)

    # Return value handling
  end

  def self.create_context(cr : Cairo::Context) : Pango::Context
    # pango_cairo_create_context: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPangoCairo.pango_cairo_create_context(cr)

    # Return value handling

    Pango::Context.new(_retval, GICrystal::Transfer::Full)
  end

  def self.create_layout(cr : Cairo::Context) : Pango::Layout
    # pango_cairo_create_layout: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPangoCairo.pango_cairo_create_layout(cr)

    # Return value handling

    Pango::Layout.new(_retval, GICrystal::Transfer::Full)
  end

  def self.error_underline_path(cr : Cairo::Context, x : Float64, y : Float64, width : Float64, height : Float64) : Nil
    # pango_cairo_error_underline_path: (None)
    # Returns: (transfer none)

    # C call
    LibPangoCairo.pango_cairo_error_underline_path(cr, x, y, width, height)

    # Return value handling
  end

  def self.font_map_get_default : Pango::FontMap
    # pango_cairo_font_map_get_default: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibPangoCairo.pango_cairo_font_map_get_default

    # Return value handling

    Pango::FontMap.new(_retval, GICrystal::Transfer::None)
  end

  def self.font_map_new : Pango::FontMap
    # pango_cairo_font_map_new: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPangoCairo.pango_cairo_font_map_new

    # Return value handling

    Pango::FontMap.new(_retval, GICrystal::Transfer::Full)
  end

  def self.font_map_new_for_font_type(fonttype : Cairo::FontType) : Pango::FontMap?
    # pango_cairo_font_map_new_for_font_type: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibPangoCairo.pango_cairo_font_map_new_for_font_type(fonttype)

    # Return value handling

    Pango::FontMap.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
  end

  def self.glyph_string_path(cr : Cairo::Context, font : Pango::Font, glyphs : Pango::GlyphString) : Nil
    # pango_cairo_glyph_string_path: (None)
    # Returns: (transfer none)

    # C call
    LibPangoCairo.pango_cairo_glyph_string_path(cr, font, glyphs)

    # Return value handling
  end

  def self.layout_line_path(cr : Cairo::Context, line : Pango::LayoutLine) : Nil
    # pango_cairo_layout_line_path: (None)
    # Returns: (transfer none)

    # C call
    LibPangoCairo.pango_cairo_layout_line_path(cr, line)

    # Return value handling
  end

  def self.layout_path(cr : Cairo::Context, layout : Pango::Layout) : Nil
    # pango_cairo_layout_path: (None)
    # Returns: (transfer none)

    # C call
    LibPangoCairo.pango_cairo_layout_path(cr, layout)

    # Return value handling
  end

  def self.show_error_underline(cr : Cairo::Context, x : Float64, y : Float64, width : Float64, height : Float64) : Nil
    # pango_cairo_show_error_underline: (None)
    # Returns: (transfer none)

    # C call
    LibPangoCairo.pango_cairo_show_error_underline(cr, x, y, width, height)

    # Return value handling
  end

  def self.show_glyph_item(cr : Cairo::Context, text : ::String, glyph_item : Pango::GlyphItem) : Nil
    # pango_cairo_show_glyph_item: (None)
    # Returns: (transfer none)

    # C call
    LibPangoCairo.pango_cairo_show_glyph_item(cr, text, glyph_item)

    # Return value handling
  end

  def self.show_glyph_string(cr : Cairo::Context, font : Pango::Font, glyphs : Pango::GlyphString) : Nil
    # pango_cairo_show_glyph_string: (None)
    # Returns: (transfer none)

    # C call
    LibPangoCairo.pango_cairo_show_glyph_string(cr, font, glyphs)

    # Return value handling
  end

  def self.show_layout(cr : Cairo::Context, layout : Pango::Layout) : Nil
    # pango_cairo_show_layout: (None)
    # Returns: (transfer none)

    # C call
    LibPangoCairo.pango_cairo_show_layout(cr, layout)

    # Return value handling
  end

  def self.show_layout_line(cr : Cairo::Context, line : Pango::LayoutLine) : Nil
    # pango_cairo_show_layout_line: (None)
    # Returns: (transfer none)

    # C call
    LibPangoCairo.pango_cairo_show_layout_line(cr, line)

    # Return value handling
  end

  def self.update_context(cr : Cairo::Context, context : Pango::Context) : Nil
    # pango_cairo_update_context: (None)
    # Returns: (transfer none)

    # C call
    LibPangoCairo.pango_cairo_update_context(cr, context)

    # Return value handling
  end

  def self.update_layout(cr : Cairo::Context, layout : Pango::Layout) : Nil
    # pango_cairo_update_layout: (None)
    # Returns: (transfer none)

    # C call
    LibPangoCairo.pango_cairo_update_layout(cr, layout)

    # Return value handling
  end

  # Errors

  # :nodoc:
  def raise_exception(error : Pointer(LibGLib::Error))
    Cairo.raise_exception(error)
    Pango.raise_exception(error)
    GObject.raise_exception(error)
  end

  extend self
end

# Extra includes
