require "../g_object-2.0/object"

module Pango
  # `PangoRenderer` is a base class for objects that can render text
  # provided as `PangoGlyphString` or `PangoLayout`.
  #
  # By subclassing `PangoRenderer` and overriding operations such as
  # @draw_glyphs and @draw_rectangle, renderers for particular font
  # backends and destinations can be created.
  @[GObject::GeneratedWrapper]
  class Renderer < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibPango::RendererClass), class_init,
        sizeof(LibPango::Renderer), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_renderer_get_type
    end

    # Does initial setup before rendering operations on @renderer.
    #
    # `Pango::Renderer#deactivate` should be called when done drawing.
    # Calls such as `Pango::Renderer#draw_layout` automatically
    # activate the layout before drawing on it.
    #
    # Calls to `Pango::Renderer#activate` and
    # `Pango::Renderer#deactivate` can be nested and the
    # renderer will only be initialized and deinitialized once.
    def activate : Nil
      # pango_renderer_activate: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_renderer_activate(self)

      # Return value handling
    end

    # Cleans up after rendering operations on @renderer.
    #
    # See docs for `Pango::Renderer#activate`.
    def deactivate : Nil
      # pango_renderer_deactivate: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_renderer_deactivate(self)

      # Return value handling
    end

    # Draw a squiggly line that approximately covers the given rectangle
    # in the style of an underline used to indicate a spelling error.
    #
    # The width of the underline is rounded to an integer number
    # of up/down segments and the resulting rectangle is centered
    # in the original rectangle.
    #
    # This should be called while @renderer is already active.
    # Use `Pango::Renderer#activate` to activate a renderer.
    def draw_error_underline(x : Int32, y : Int32, width : Int32, height : Int32) : Nil
      # pango_renderer_draw_error_underline: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_renderer_draw_error_underline(self, x, y, width, height)

      # Return value handling
    end

    # Draws a single glyph with coordinates in device space.
    def draw_glyph(font : Pango::Font, glyph : UInt32, x : Float64, y : Float64) : Nil
      # pango_renderer_draw_glyph: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_renderer_draw_glyph(self, font, glyph, x, y)

      # Return value handling
    end

    # Draws the glyphs in @glyph_item with the specified `PangoRenderer`,
    # embedding the text associated with the glyphs in the output if the
    # output format supports it.
    #
    # This is useful for rendering text in PDF.
    #
    # Note that this method does not handle attributes in @glyph_item.
    # If you want colors, shapes and lines handled automatically according
    # to those attributes, you need to use pango_renderer_draw_layout_line()
    # or pango_renderer_draw_layout().
    #
    # Note that @text is the start of the text for layout, which is then
    # indexed by `glyph_item->item->offset`.
    #
    # If @text is %NULL, this simply calls `Pango::Renderer#draw_glyphs`.
    #
    # The default implementation of this method simply falls back to
    # `Pango::Renderer#draw_glyphs`.
    def draw_glyph_item(text : ::String?, glyph_item : Pango::GlyphItem, x : Int32, y : Int32) : Nil
      # pango_renderer_draw_glyph_item: (Method)
      # @text: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      text = if text.nil?
               Pointer(LibC::Char).null
             else
               text.to_unsafe
             end

      # C call
      LibPango.pango_renderer_draw_glyph_item(self, text, glyph_item, x, y)

      # Return value handling
    end

    # Draws the glyphs in @glyphs with the specified `PangoRenderer`.
    def draw_glyphs(font : Pango::Font, glyphs : Pango::GlyphString, x : Int32, y : Int32) : Nil
      # pango_renderer_draw_glyphs: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_renderer_draw_glyphs(self, font, glyphs, x, y)

      # Return value handling
    end

    # Draws @layout with the specified `PangoRenderer`.
    #
    # This is equivalent to drawing the lines of the layout, at their
    # respective positions relative to @x, @y.
    def draw_layout(layout : Pango::Layout, x : Int32, y : Int32) : Nil
      # pango_renderer_draw_layout: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_renderer_draw_layout(self, layout, x, y)

      # Return value handling
    end

    # Draws @line with the specified `PangoRenderer`.
    #
    # This draws the glyph items that make up the line, as well as
    # shapes, backgrounds and lines that are specified by the attributes
    # of those items.
    def draw_layout_line(line : Pango::LayoutLine, x : Int32, y : Int32) : Nil
      # pango_renderer_draw_layout_line: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_renderer_draw_layout_line(self, line, x, y)

      # Return value handling
    end

    # Draws an axis-aligned rectangle in user space coordinates with the
    # specified `PangoRenderer`.
    #
    # This should be called while @renderer is already active.
    # Use `Pango::Renderer#activate` to activate a renderer.
    def draw_rectangle(part : Pango::RenderPart, x : Int32, y : Int32, width : Int32, height : Int32) : Nil
      # pango_renderer_draw_rectangle: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_renderer_draw_rectangle(self, part, x, y, width, height)

      # Return value handling
    end

    # Draws a trapezoid with the parallel sides aligned with the X axis
    # using the given `PangoRenderer`; coordinates are in device space.
    def draw_trapezoid(part : Pango::RenderPart, y1_ : Float64, x11 : Float64, x21 : Float64, y2 : Float64, x12 : Float64, x22 : Float64) : Nil
      # pango_renderer_draw_trapezoid: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_renderer_draw_trapezoid(self, part, y1_, x11, x21, y2, x12, x22)

      # Return value handling
    end

    # Gets the current alpha for the specified part.
    def alpha(part : Pango::RenderPart) : UInt16
      # pango_renderer_get_alpha: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_renderer_get_alpha(self, part)

      # Return value handling

      _retval
    end

    # Gets the current rendering color for the specified part.
    def color(part : Pango::RenderPart) : Pango::Color?
      # pango_renderer_get_color: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_renderer_get_color(self, part)

      # Return value handling

      Pango::Color.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the layout currently being rendered using @renderer.
    #
    # Calling this function only makes sense from inside a subclass's
    # methods, like in its draw_shape vfunc, for example.
    #
    # The returned layout should not be modified while still being
    # rendered.
    def layout : Pango::Layout?
      # pango_renderer_get_layout: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_renderer_get_layout(self)

      # Return value handling

      Pango::Layout.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the layout line currently being rendered using @renderer.
    #
    # Calling this function only makes sense from inside a subclass's
    # methods, like in its draw_shape vfunc, for example.
    #
    # The returned layout line should not be modified while still being
    # rendered.
    def layout_line : Pango::LayoutLine?
      # pango_renderer_get_layout_line: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_renderer_get_layout_line(self)

      # Return value handling

      Pango::LayoutLine.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the transformation matrix that will be applied when
    # rendering.
    #
    # See `Pango::Renderer#matrix=`.
    def matrix : Pango::Matrix?
      # pango_renderer_get_matrix: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_renderer_get_matrix(self)

      # Return value handling

      Pango::Matrix.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Informs Pango that the way that the rendering is done
    # for @part has changed.
    #
    # This should be called if the rendering changes in a way that would
    # prevent multiple pieces being joined together into one drawing call.
    # For instance, if a subclass of `PangoRenderer` was to add a stipple
    # option for drawing underlines, it needs to call
    #
    # ```
    # pango_renderer_part_changed (render, PANGO_RENDER_PART_UNDERLINE);
    # ```
    #
    # When the stipple changes or underlines with different stipples
    # might be joined together. Pango automatically calls this for
    # changes to colors. (See `Pango::Renderer#color=`)
    def part_changed(part : Pango::RenderPart) : Nil
      # pango_renderer_part_changed: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_renderer_part_changed(self, part)

      # Return value handling
    end

    # Sets the alpha for part of the rendering.
    #
    # Note that the alpha may only be used if a color is
    # specified for @part as well.
    def set_alpha(part : Pango::RenderPart, alpha : UInt16) : Nil
      # pango_renderer_set_alpha: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_renderer_set_alpha(self, part, alpha)

      # Return value handling
    end

    # Sets the color for part of the rendering.
    #
    # Also see `Pango::Renderer#alpha=`.
    def set_color(part : Pango::RenderPart, color : Pango::Color?) : Nil
      # pango_renderer_set_color: (Method)
      # @color: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      color = if color.nil?
                Pointer(Void).null
              else
                color.to_unsafe
              end

      # C call
      LibPango.pango_renderer_set_color(self, part, color)

      # Return value handling
    end

    # Sets the transformation matrix that will be applied when rendering.
    def matrix=(matrix : Pango::Matrix?) : Nil
      # pango_renderer_set_matrix: (Method)
      # @matrix: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      matrix = if matrix.nil?
                 Pointer(Void).null
               else
                 matrix.to_unsafe
               end

      # C call
      LibPango.pango_renderer_set_matrix(self, matrix)

      # Return value handling
    end
  end
end
