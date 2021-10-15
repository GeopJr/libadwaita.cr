require "../g_object-2.0/object"

module Pango
  # `PangoRenderer` is a base class for objects that can render text
  # provided as `PangoGlyphString` or `PangoLayout`.
  #
  # By subclassing `PangoRenderer` and overriding operations such as
  # @draw_glyphs and @draw_rectangle, renderers for particular font
  # backends and destinations can be created.
  class Renderer < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_renderer_get_type
    end

    def activate : Nil
      # pango_renderer_activate: (Method)
      # Returns: (transfer none)

      LibPango.pango_renderer_activate(self)
    end

    def deactivate : Nil
      # pango_renderer_deactivate: (Method)
      # Returns: (transfer none)

      LibPango.pango_renderer_deactivate(self)
    end

    def draw_error_underline(x : Int32, y : Int32, width : Int32, height : Int32) : Nil
      # pango_renderer_draw_error_underline: (Method)
      # Returns: (transfer none)

      LibPango.pango_renderer_draw_error_underline(self, x, y, width, height)
    end

    def draw_glyph(font : Pango::Font, glyph : UInt32, x : Float64, y : Float64) : Nil
      # pango_renderer_draw_glyph: (Method)
      # Returns: (transfer none)

      LibPango.pango_renderer_draw_glyph(self, font, glyph, x, y)
    end

    def draw_glyph_item(text : ::String?, glyph_item : Pango::GlyphItem, x : Int32, y : Int32) : Nil
      # pango_renderer_draw_glyph_item: (Method)
      # @text: (nullable)
      # Returns: (transfer none)

      text = if text.nil?
               Pointer(LibC::Char).null
             else
               text.to_unsafe
             end

      LibPango.pango_renderer_draw_glyph_item(self, text, glyph_item, x, y)
    end

    def draw_glyphs(font : Pango::Font, glyphs : Pango::GlyphString, x : Int32, y : Int32) : Nil
      # pango_renderer_draw_glyphs: (Method)
      # Returns: (transfer none)

      LibPango.pango_renderer_draw_glyphs(self, font, glyphs, x, y)
    end

    def draw_layout(layout : Pango::Layout, x : Int32, y : Int32) : Nil
      # pango_renderer_draw_layout: (Method)
      # Returns: (transfer none)

      LibPango.pango_renderer_draw_layout(self, layout, x, y)
    end

    def draw_layout_line(line : Pango::LayoutLine, x : Int32, y : Int32) : Nil
      # pango_renderer_draw_layout_line: (Method)
      # Returns: (transfer none)

      LibPango.pango_renderer_draw_layout_line(self, line, x, y)
    end

    def draw_rectangle(part : Pango::RenderPart, x : Int32, y : Int32, width : Int32, height : Int32) : Nil
      # pango_renderer_draw_rectangle: (Method)
      # Returns: (transfer none)

      LibPango.pango_renderer_draw_rectangle(self, part, x, y, width, height)
    end

    def draw_trapezoid(part : Pango::RenderPart, y1_ : Float64, x11 : Float64, x21 : Float64, y2 : Float64, x12 : Float64, x22 : Float64) : Nil
      # pango_renderer_draw_trapezoid: (Method)
      # Returns: (transfer none)

      LibPango.pango_renderer_draw_trapezoid(self, part, y1_, x11, x21, y2, x12, x22)
    end

    def alpha(part : Pango::RenderPart) : UInt16
      # pango_renderer_get_alpha: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_renderer_get_alpha(self, part)
      _retval
    end

    def color(part : Pango::RenderPart) : Pango::Color?
      # pango_renderer_get_color: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_renderer_get_color(self, part)
      Pango::Color.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def layout : Pango::Layout?
      # pango_renderer_get_layout: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_renderer_get_layout(self)
      Pango::Layout.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def layout_line : Pango::LayoutLine?
      # pango_renderer_get_layout_line: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_renderer_get_layout_line(self)
      Pango::LayoutLine.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def matrix : Pango::Matrix?
      # pango_renderer_get_matrix: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_renderer_get_matrix(self)
      Pango::Matrix.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def part_changed(part : Pango::RenderPart) : Nil
      # pango_renderer_part_changed: (Method)
      # Returns: (transfer none)

      LibPango.pango_renderer_part_changed(self, part)
    end

    def set_alpha(part : Pango::RenderPart, alpha : UInt16) : Nil
      # pango_renderer_set_alpha: (Method)
      # Returns: (transfer none)

      LibPango.pango_renderer_set_alpha(self, part, alpha)
    end

    def set_color(part : Pango::RenderPart, color : Pango::Color?) : Nil
      # pango_renderer_set_color: (Method)
      # @color: (nullable)
      # Returns: (transfer none)

      color = if color.nil?
                Pointer(Void).null
              else
                color.to_unsafe
              end

      LibPango.pango_renderer_set_color(self, part, color)
    end

    def matrix=(matrix : Pango::Matrix?) : Nil
      # pango_renderer_set_matrix: (Method)
      # @matrix: (nullable)
      # Returns: (transfer none)

      matrix = if matrix.nil?
                 Pointer(Void).null
               else
                 matrix.to_unsafe
               end

      LibPango.pango_renderer_set_matrix(self, matrix)
    end
  end
end
