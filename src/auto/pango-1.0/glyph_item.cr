module Pango
  # A `PangoGlyphItem` is a pair of a `PangoItem` and the glyphs
  # resulting from shaping the items text.
  #
  # As an example of the usage of `PangoGlyphItem`, the results
  # of shaping text with `PangoLayout` is a list of `PangoLayoutLine`,
  # each of which contains a list of `PangoGlyphItem`.
  class GlyphItem
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::GlyphItem))
      @pointer.copy_from(pointer, sizeof(LibPango::GlyphItem))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(item : Pango::Item? = nil, glyphs : Pango::GlyphString? = nil, y_offset : Int32? = nil, start_x_offset : Int32? = nil, end_x_offset : Int32? = nil)
      _ptr = Pointer(Void).malloc(32)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.item = item unless item.nil?
      _instance.glyphs = glyphs unless glyphs.nil?
      _instance.y_offset = y_offset unless y_offset.nil?
      _instance.start_x_offset = start_x_offset unless start_x_offset.nil?
      _instance.end_x_offset = end_x_offset unless end_x_offset.nil?
      _instance
    end

    def finalize
    end

    def item : Pango::Item
      # Property getter
      _var = (@pointer + 0).as(Pointer(Pointer(Void)))
      Pango::Item.new(_var.value, GICrystal::Transfer::None)
    end

    def item=(value : Pango::Item)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Pointer(Void))).value = value.to_unsafe
      value
    end

    def glyphs : Pango::GlyphString
      # Property getter
      _var = (@pointer + 8).as(Pointer(Pointer(Void)))
      Pango::GlyphString.new(_var.value, GICrystal::Transfer::None)
    end

    def glyphs=(value : Pango::GlyphString)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Pointer(Void))).value = value.to_unsafe
      value
    end

    def y_offset : Int32
      # Property getter
      _var = (@pointer + 16).as(Pointer(Int32))
      _var.value
    end

    def y_offset=(value : Int32)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Int32)).value = value
      value
    end

    def start_x_offset : Int32
      # Property getter
      _var = (@pointer + 20).as(Pointer(Int32))
      _var.value
    end

    def start_x_offset=(value : Int32)
      # Property setter
      _var = (@pointer + 20).as(Pointer(Int32)).value = value
      value
    end

    def end_x_offset : Int32
      # Property getter
      _var = (@pointer + 24).as(Pointer(Int32))
      _var.value
    end

    def end_x_offset=(value : Int32)
      # Property setter
      _var = (@pointer + 24).as(Pointer(Int32)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_glyph_item_get_type
    end

    def apply_attrs(text : ::String, list : Pango::AttrList) : GLib::SList
      # pango_glyph_item_apply_attrs: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_glyph_item_apply_attrs(self, text, list)

      # Return value handling
      GLib::SList(Pango::GlyphItem).new(_retval, GICrystal::Transfer::Full)
    end

    def copy : Pango::GlyphItem?
      # pango_glyph_item_copy: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_glyph_item_copy(self)

      # Return value handling
      Pango::GlyphItem.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def free : Nil
      # pango_glyph_item_free: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_glyph_item_free(self)

      # Return value handling
    end

    def logical_widths(text : ::String, logical_widths : Enumerable(Int32)) : Nil
      # pango_glyph_item_get_logical_widths: (Method)
      # @logical_widths: (array element-type Int32)
      # Returns: (transfer none)

      # Handle parameters
      logical_widths = logical_widths.to_a.to_unsafe

      # C call
      LibPango.pango_glyph_item_get_logical_widths(self, text, logical_widths)

      # Return value handling
    end

    def letter_space(text : ::String, log_attrs : Enumerable(Pango::LogAttr), letter_spacing : Int32) : Nil
      # pango_glyph_item_letter_space: (Method)
      # @log_attrs: (array element-type Interface)
      # Returns: (transfer none)

      # Handle parameters
      log_attrs = log_attrs.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibPango.pango_glyph_item_letter_space(self, text, log_attrs, letter_spacing)

      # Return value handling
    end

    def split(text : ::String, split_index : Int32) : Pango::GlyphItem
      # pango_glyph_item_split: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_glyph_item_split(self, text, split_index)

      # Return value handling
      Pango::GlyphItem.new(_retval, GICrystal::Transfer::Full)
    end

    def to_unsafe
      @pointer
    end
  end
end
