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

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_text_node_new(font, glyphs, color, offset)

      # Return value handling
      @pointer = _retval unless _retval.null?
    end

    def color : Gdk::RGBA
      # gsk_text_node_get_color: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_text_node_get_color(self)

      # Return value handling
      Gdk::RGBA.new(_retval, GICrystal::Transfer::None)
    end

    def font : Pango::Font
      # gsk_text_node_get_font: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_text_node_get_font(self)

      # Return value handling
      Pango::Font.new(_retval, GICrystal::Transfer::None)
    end

    def glyphs : Enumerable(Pango::GlyphInfo)
      # gsk_text_node_get_glyphs: (Method)
      # @n_glyphs: (out) (transfer full) (optional)
      # Returns: (transfer none) (array length=n_glyphs element-type Interface)

      # Handle parameters
      n_glyphs = 0_u32

      # C call
      _retval = LibGsk.gsk_text_node_get_glyphs(self, pointerof(n_glyphs))

      # Return value handling
      GICrystal.transfer_array(_retval, n_glyphs, GICrystal::Transfer::None)
    end

    def num_glyphs : UInt32
      # gsk_text_node_get_num_glyphs: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_text_node_get_num_glyphs(self)

      # Return value handling
      _retval
    end

    def offset : Graphene::Point
      # gsk_text_node_get_offset: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_text_node_get_offset(self)

      # Return value handling
      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end

    def has_color_glyphs : Bool
      # gsk_text_node_has_color_glyphs: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_text_node_has_color_glyphs(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end
  end
end
