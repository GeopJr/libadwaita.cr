require "./render_node"

module Gsk
  # A render node drawing a set of glyphs.
  @[GObject::GeneratedWrapper]
  class TextNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGsk::TextNode), instance_init, 0)
    end

    GICrystal.define_new_method(TextNode, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `TextNode`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_text_node_get_type
    end

    # Creates a render node that renders the given glyphs.
    #
    # Note that @color may not be used if the font contains
    # color glyphs.
    def initialize(font : Pango::Font, glyphs : Pango::GlyphString, color : Gdk::RGBA, offset : Graphene::Point)
      # gsk_text_node_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_text_node_new(font, glyphs, color, offset)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id)) unless _retval.null?
    end

    # Retrieves the color used by the text @node.
    def color : Gdk::RGBA
      # gsk_text_node_get_color: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_text_node_get_color(@pointer)

      # Return value handling

      Gdk::RGBA.new(_retval, GICrystal::Transfer::None)
    end

    # Returns the font used by the text @node.
    def font : Pango::Font
      # gsk_text_node_get_font: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_text_node_get_font(@pointer)

      # Return value handling

      Pango::Font.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the glyph information in the @node.
    def glyphs : Enumerable(Pango::GlyphInfo)
      # gsk_text_node_get_glyphs: (Method)
      # @n_glyphs: (out) (transfer full) (optional)
      # Returns: (transfer none) (array length=n_glyphs element-type Interface)

      # Generator::OutArgUsedInReturnPlan
      n_glyphs = 0_u32
      # C call
      _retval = LibGsk.gsk_text_node_get_glyphs(@pointer, pointerof(n_glyphs))

      # Return value handling

      GICrystal.transfer_array(_retval, n_glyphs, GICrystal::Transfer::None)
    end

    # Retrieves the number of glyphs in the text node.
    def num_glyphs : UInt32
      # gsk_text_node_get_num_glyphs: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_text_node_get_num_glyphs(@pointer)

      # Return value handling

      _retval
    end

    # Retrieves the offset applied to the text.
    def offset : Graphene::Point
      # gsk_text_node_get_offset: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_text_node_get_offset(@pointer)

      # Return value handling

      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end

    # Checks whether the text @node has color glyphs.
    def has_color_glyphs : Bool
      # gsk_text_node_has_color_glyphs: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_text_node_has_color_glyphs(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
