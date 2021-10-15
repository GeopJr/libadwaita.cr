module Pango
  # A `PangoGlyphString` is used to store strings of glyphs with geometry
  # and visual attribute information.
  #
  # The storage for the glyph information is owned by the structure
  # which simplifies memory management.
  class GlyphString
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::GlyphString))
      @pointer.copy_from(pointer, sizeof(LibPango::GlyphString))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(num_glyphs : Int32? = nil, glyphs : Enumerable(Pango::GlyphInfo)? = nil, log_clusters : Pointer(Int32)? = nil, space : Int32? = nil)
      _ptr = Pointer(Void).malloc(32)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.num_glyphs = num_glyphs unless num_glyphs.nil?
      _instance.glyphs = glyphs unless glyphs.nil?
      _instance.log_clusters = log_clusters unless log_clusters.nil?
      _instance.space = space unless space.nil?
      _instance
    end

    def finalize
    end

    def num_glyphs : Int32
      # Property getter
      _var = (@pointer + 0).as(Pointer(Int32))
      _var.value
    end

    def num_glyphs=(value : Int32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Int32)).value = value
      value
    end

    def glyphs : Enumerable(Pango::GlyphInfo)
      # Property getter
      _var = (@pointer + 8).as(Pointer(Pointer(Void)))
      _var.value
    end

    def glyphs=(value : Enumerable(Pango::GlyphInfo))
      # Property setter
      _var = (@pointer + 8).as(Pointer(Pointer(Void))).value = value
      value
    end

    def log_clusters : Pointer(Int32)
      # Property getter
      _var = (@pointer + 16).as(Pointer(Pointer(Int32)))
      _var.value
    end

    def log_clusters=(value : Pointer(Int32))
      # Property setter
      _var = (@pointer + 16).as(Pointer(Pointer(Int32))).value = value
      value
    end

    def space : Int32
      # Property getter
      _var = (@pointer + 24).as(Pointer(Int32))
      _var.value
    end

    def space=(value : Int32)
      # Property setter
      _var = (@pointer + 24).as(Pointer(Int32)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_glyph_string_get_type
    end

    def initialize
      # pango_glyph_string_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibPango.pango_glyph_string_new
      @pointer = _retval
    end

    def copy : Pango::GlyphString?
      # pango_glyph_string_copy: (Method)
      # Returns: (transfer full)

      _retval = LibPango.pango_glyph_string_copy(self)
      Pango::GlyphString.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def extents(font : Pango::Font) : Pango::Rectangle
      # pango_glyph_string_extents: (Method)
      # @ink_rect: (out) (caller-allocates) (optional)
      # @logical_rect: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      ink_rect = Pointer(Void).null
      logical_rect = Pointer(Void).null
      ink_rect = Pango::Rectangle.new

      LibPango.pango_glyph_string_extents(self, font, ink_rect, logical_rect)
      ink_rect
    end

    def extents_range(start : Int32, end _end : Int32, font : Pango::Font) : Pango::Rectangle
      # pango_glyph_string_extents_range: (Method)
      # @ink_rect: (out) (caller-allocates) (optional)
      # @logical_rect: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      ink_rect = Pointer(Void).null
      logical_rect = Pointer(Void).null
      ink_rect = Pango::Rectangle.new

      LibPango.pango_glyph_string_extents_range(self, start, _end, font, ink_rect, logical_rect)
      ink_rect
    end

    def free : Nil
      # pango_glyph_string_free: (Method)
      # Returns: (transfer none)

      LibPango.pango_glyph_string_free(self)
    end

    def logical_widths(text : ::String, length : Int32, embedding_level : Int32, logical_widths : Enumerable(Int32)) : Nil
      # pango_glyph_string_get_logical_widths: (Method)
      # @logical_widths: (array element-type Int32)
      # Returns: (transfer none)

      logical_widths = logical_widths.to_a.to_unsafe

      LibPango.pango_glyph_string_get_logical_widths(self, text, length, embedding_level, logical_widths)
    end

    def width : Int32
      # pango_glyph_string_get_width: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_glyph_string_get_width(self)
      _retval
    end

    def index_to_x(text : ::String, length : Int32, analysis : Pango::Analysis, index_ : Int32, trailing : Bool, x_pos : Int32) : Nil
      # pango_glyph_string_index_to_x: (Method)
      # @x_pos: (out) (transfer full)
      # Returns: (transfer none)

      LibPango.pango_glyph_string_index_to_x(self, text, length, analysis, index_, trailing, x_pos)
    end

    def size=(new_len : Int32) : Nil
      # pango_glyph_string_set_size: (Method)
      # Returns: (transfer none)

      LibPango.pango_glyph_string_set_size(self, new_len)
    end

    def x_to_index(text : ::String, length : Int32, analysis : Pango::Analysis, x_pos : Int32, index_ : Int32, trailing : Int32) : Nil
      # pango_glyph_string_x_to_index: (Method)
      # @index_: (out) (transfer full)
      # @trailing: (out) (transfer full)
      # Returns: (transfer none)

      LibPango.pango_glyph_string_x_to_index(self, text, length, analysis, x_pos, index_, trailing)
    end

    def to_unsafe
      @pointer
    end
  end
end
