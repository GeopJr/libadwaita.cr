require "./render_node"

module Gsk
  # A render node drawing a set of glyphs.
  class TextNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_text_node_get_type
    end

    def initialize(font : Pango::Font, glyphs : Pango::GlyphString, color : Gdk::RGBA, offset : Graphene::Point)
      # gsk_text_node_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGsk.gsk_text_node_new(font, glyphs, color, offset)
      @pointer = _retval unless _retval.null?
    end

    def color : Gdk::RGBA
      # gsk_text_node_get_color: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_text_node_get_color(self)
      Gdk::RGBA.new(_retval, GICrystal::Transfer::None)
    end

    def font : Pango::Font
      # gsk_text_node_get_font: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_text_node_get_font(self)
      Pango::Font.new(_retval, GICrystal::Transfer::None)
    end

    def glyphs : Enumerable(Pango::GlyphInfo)
      # gsk_text_node_get_glyphs: (Method)
      # @n_glyphs: (out) (transfer full) (optional)
      # Returns: (transfer none)

      n_glyphs = Pointer(UInt32).null

      _retval = LibGsk.gsk_text_node_get_glyphs(self, n_glyphs)
      _retval
    end

    def num_glyphs : UInt32
      # gsk_text_node_get_num_glyphs: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_text_node_get_num_glyphs(self)
      _retval
    end

    def offset : Graphene::Point
      # gsk_text_node_get_offset: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_text_node_get_offset(self)
      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end

    def has_color_glyphs : Bool
      # gsk_text_node_has_color_glyphs: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_text_node_has_color_glyphs(self)
      GICrystal.to_bool(_retval)
    end
  end
end
