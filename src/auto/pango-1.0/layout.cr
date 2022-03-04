require "../g_object-2.0/object"

module Pango
  # A `PangoLayout` structure represents an entire paragraph of text.
  #
  # While complete access to the layout capabilities of Pango is provided
  # using the detailed interfaces for itemization and shaping, using
  # that functionality directly involves writing a fairly large amount
  # of code. `PangoLayout` provides a high-level driver for formatting
  # entire paragraphs of text at once. This includes paragraph-level
  # functionality such as line breaking, justification, alignment and
  # ellipsization.
  #
  # A `PangoLayout` is initialized with a `PangoContext`, UTF-8 string
  # and set of attributes for that string. Once that is done, the set of
  # formatted lines can be extracted from the object, the layout can be
  # rendered, and conversion between logical character positions within
  # the layout's text, and the physical position of the resulting glyphs
  # can be made.
  #
  # There are a number of parameters to adjust the formatting of a
  # `PangoLayout`. The following image shows adjustable parameters
  # (on the left) and font metrics (on the right):
  #
  # <picture>
  #   <source srcset="layout-dark.png" media="(prefers-color-scheme: dark)">
  #   <img alt="Pango Layout Parameters" src="layout-light.png">
  # </picture>
  #
  # The following images demonstrate the effect of alignment and
  # justification on the layout of text:
  #
  # | | |
  # | --- | --- |
  # | ![align=left](align-left.png) | ![align=left, justify](align-left-justify.png) |
  # | ![align=center](align-center.png) | ![align=center, justify](align-center-justify.png) |
  # | ![align=right](align-right.png) | ![align=right, justify](align-right-justify.png) |
  #
  #
  # It is possible, as well, to ignore the 2-D setup,
  # and simply treat the results of a `PangoLayout` as a list of lines.
  class Layout < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_layout_get_type
    end

    def initialize(context : Pango::Context)
      # pango_layout_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_new(context)

      # Return value handling
      @pointer = _retval
    end

    def deserialize(context : Pango::Context, bytes : GLib::Bytes, flags : Pango::LayoutDeserializeFlags) : Pango::Layout?
      # pango_layout_deserialize: (Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_deserialize(context, bytes, flags, pointerof(_error))

      # Error check
      Pango.raise_exception(_error) unless _error.null?
      # Return value handling
      Pango::Layout.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def context_changed : Nil
      # pango_layout_context_changed: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_layout_context_changed(self)

      # Return value handling
    end

    def copy : Pango::Layout
      # pango_layout_copy: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_copy(self)

      # Return value handling
      Pango::Layout.new(_retval, GICrystal::Transfer::Full)
    end

    def alignment : Pango::Alignment
      # pango_layout_get_alignment: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_alignment(self)

      # Return value handling
      Pango::Alignment.from_value(_retval)
    end

    def attributes : Pango::AttrList?
      # pango_layout_get_attributes: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_attributes(self)

      # Return value handling
      Pango::AttrList.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def auto_dir : Bool
      # pango_layout_get_auto_dir: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_auto_dir(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def baseline : Int32
      # pango_layout_get_baseline: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_baseline(self)

      # Return value handling
      _retval
    end

    def caret_pos(index_ : Int32) : Pango::Rectangle
      # pango_layout_get_caret_pos: (Method)
      # @strong_pos: (out) (caller-allocates) (optional)
      # @weak_pos: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Handle parameters
      strong_pos = Pointer(Void).null
      weak_pos = Pointer(Void).null
      strong_pos = Pango::Rectangle.new

      # C call
      LibPango.pango_layout_get_caret_pos(self, index_, strong_pos, weak_pos)

      # Return value handling
      strong_pos
    end

    def character_count : Int32
      # pango_layout_get_character_count: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_character_count(self)

      # Return value handling
      _retval
    end

    def context : Pango::Context
      # pango_layout_get_context: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_context(self)

      # Return value handling
      Pango::Context.new(_retval, GICrystal::Transfer::None)
    end

    def cursor_pos(index_ : Int32) : Pango::Rectangle
      # pango_layout_get_cursor_pos: (Method)
      # @strong_pos: (out) (caller-allocates) (optional)
      # @weak_pos: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Handle parameters
      strong_pos = Pointer(Void).null
      weak_pos = Pointer(Void).null
      strong_pos = Pango::Rectangle.new

      # C call
      LibPango.pango_layout_get_cursor_pos(self, index_, strong_pos, weak_pos)

      # Return value handling
      strong_pos
    end

    def direction(index : Int32) : Pango::Direction
      # pango_layout_get_direction: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_direction(self, index)

      # Return value handling
      Pango::Direction.from_value(_retval)
    end

    def ellipsize : Pango::EllipsizeMode
      # pango_layout_get_ellipsize: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_ellipsize(self)

      # Return value handling
      Pango::EllipsizeMode.from_value(_retval)
    end

    def extents : Pango::Rectangle
      # pango_layout_get_extents: (Method)
      # @ink_rect: (out) (caller-allocates) (optional)
      # @logical_rect: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Handle parameters
      ink_rect = Pointer(Void).null
      logical_rect = Pointer(Void).null
      ink_rect = Pango::Rectangle.new

      # C call
      LibPango.pango_layout_get_extents(self, ink_rect, logical_rect)

      # Return value handling
      ink_rect
    end

    def font_description : Pango::FontDescription?
      # pango_layout_get_font_description: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_font_description(self)

      # Return value handling
      Pango::FontDescription.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def height : Int32
      # pango_layout_get_height: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_height(self)

      # Return value handling
      _retval
    end

    def indent : Int32
      # pango_layout_get_indent: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_indent(self)

      # Return value handling
      _retval
    end

    def iter : Pango::LayoutIter
      # pango_layout_get_iter: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_iter(self)

      # Return value handling
      Pango::LayoutIter.new(_retval, GICrystal::Transfer::Full)
    end

    def justify : Bool
      # pango_layout_get_justify: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_justify(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def justify_last_line : Bool
      # pango_layout_get_justify_last_line: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_justify_last_line(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def line(line : Int32) : Pango::LayoutLine?
      # pango_layout_get_line: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_line(self, line)

      # Return value handling
      Pango::LayoutLine.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def line_count : Int32
      # pango_layout_get_line_count: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_line_count(self)

      # Return value handling
      _retval
    end

    def line_readonly(line : Int32) : Pango::LayoutLine?
      # pango_layout_get_line_readonly: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_line_readonly(self, line)

      # Return value handling
      Pango::LayoutLine.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def line_spacing : Float32
      # pango_layout_get_line_spacing: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_line_spacing(self)

      # Return value handling
      _retval
    end

    def lines : GLib::SList
      # pango_layout_get_lines: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_lines(self)

      # Return value handling
      GLib::SList(Pango::LayoutLine).new(_retval, GICrystal::Transfer::None)
    end

    def lines_readonly : GLib::SList
      # pango_layout_get_lines_readonly: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_lines_readonly(self)

      # Return value handling
      GLib::SList(Pango::LayoutLine).new(_retval, GICrystal::Transfer::None)
    end

    def log_attrs(attrs : Enumerable(Pango::LogAttr)) : Nil
      # pango_layout_get_log_attrs: (Method)
      # @attrs: (out) (transfer container) (array length=n_attrs element-type Interface)
      # @n_attrs: (out) (transfer full)
      # Returns: (transfer none)

      # Handle parameters
      n_attrs = attrs.size
      attrs = attrs.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibPango.pango_layout_get_log_attrs(self, attrs, n_attrs)

      # Return value handling
    end

    def log_attrs(*attrs : Pango::LogAttr)
      log_attrs(attrs)
    end

    def log_attrs_readonly : Enumerable(Pango::LogAttr)
      # pango_layout_get_log_attrs_readonly: (Method)
      # @n_attrs: (out) (transfer full)
      # Returns: (transfer none) (array length=n_attrs element-type Interface)

      # Handle parameters
      n_attrs = 0

      # C call
      _retval = LibPango.pango_layout_get_log_attrs_readonly(self, pointerof(n_attrs))

      # Return value handling
      GICrystal.transfer_array(_retval, n_attrs, GICrystal::Transfer::None)
    end

    def pixel_extents : Pango::Rectangle
      # pango_layout_get_pixel_extents: (Method)
      # @ink_rect: (out) (caller-allocates) (optional)
      # @logical_rect: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Handle parameters
      ink_rect = Pointer(Void).null
      logical_rect = Pointer(Void).null
      ink_rect = Pango::Rectangle.new

      # C call
      LibPango.pango_layout_get_pixel_extents(self, ink_rect, logical_rect)

      # Return value handling
      ink_rect
    end

    def pixel_size : Nil
      # pango_layout_get_pixel_size: (Method)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      width = Pointer(Int32).null
      height = Pointer(Int32).null

      # C call
      LibPango.pango_layout_get_pixel_size(self, width, height)

      # Return value handling
    end

    def serial : UInt32
      # pango_layout_get_serial: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_serial(self)

      # Return value handling
      _retval
    end

    def single_paragraph_mode : Bool
      # pango_layout_get_single_paragraph_mode: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_single_paragraph_mode(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def size : Nil
      # pango_layout_get_size: (Method)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      width = Pointer(Int32).null
      height = Pointer(Int32).null

      # C call
      LibPango.pango_layout_get_size(self, width, height)

      # Return value handling
    end

    def spacing : Int32
      # pango_layout_get_spacing: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_spacing(self)

      # Return value handling
      _retval
    end

    def tabs : Pango::TabArray?
      # pango_layout_get_tabs: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_tabs(self)

      # Return value handling
      Pango::TabArray.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def text : ::String
      # pango_layout_get_text: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_text(self)

      # Return value handling
      ::String.new(_retval)
    end

    def unknown_glyphs_count : Int32
      # pango_layout_get_unknown_glyphs_count: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_unknown_glyphs_count(self)

      # Return value handling
      _retval
    end

    def width : Int32
      # pango_layout_get_width: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_width(self)

      # Return value handling
      _retval
    end

    def wrap : Pango::WrapMode
      # pango_layout_get_wrap: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_get_wrap(self)

      # Return value handling
      Pango::WrapMode.from_value(_retval)
    end

    def index_to_line_x(index_ : Int32, trailing : Bool) : Nil
      # pango_layout_index_to_line_x: (Method)
      # @line: (out) (transfer full) (optional)
      # @x_pos: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      line = Pointer(Int32).null
      x_pos = Pointer(Int32).null

      # C call
      LibPango.pango_layout_index_to_line_x(self, index_, trailing, line, x_pos)

      # Return value handling
    end

    def index_to_pos(index_ : Int32) : Pango::Rectangle
      # pango_layout_index_to_pos: (Method)
      # @pos: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      pos = Pango::Rectangle.new

      # C call
      LibPango.pango_layout_index_to_pos(self, index_, pos)

      # Return value handling
      pos
    end

    def is_ellipsized : Bool
      # pango_layout_is_ellipsized: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_is_ellipsized(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def is_wrapped : Bool
      # pango_layout_is_wrapped: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_is_wrapped(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def move_cursor_visually(strong : Bool, old_index : Int32, old_trailing : Int32, direction : Int32, new_index : Int32, new_trailing : Int32) : Nil
      # pango_layout_move_cursor_visually: (Method)
      # @new_index: (out) (transfer full)
      # @new_trailing: (out) (transfer full)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_layout_move_cursor_visually(self, strong, old_index, old_trailing, direction, new_index, new_trailing)

      # Return value handling
    end

    def serialize(flags : Pango::LayoutSerializeFlags) : GLib::Bytes
      # pango_layout_serialize: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_serialize(self, flags)

      # Return value handling
      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    def alignment=(alignment : Pango::Alignment) : Nil
      # pango_layout_set_alignment: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_layout_set_alignment(self, alignment)

      # Return value handling
    end

    def attributes=(attrs : Pango::AttrList?) : Nil
      # pango_layout_set_attributes: (Method)
      # @attrs: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      attrs = if attrs.nil?
                Pointer(Void).null
              else
                attrs.to_unsafe
              end

      # C call
      LibPango.pango_layout_set_attributes(self, attrs)

      # Return value handling
    end

    def auto_dir=(auto_dir : Bool) : Nil
      # pango_layout_set_auto_dir: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_layout_set_auto_dir(self, auto_dir)

      # Return value handling
    end

    def ellipsize=(ellipsize : Pango::EllipsizeMode) : Nil
      # pango_layout_set_ellipsize: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_layout_set_ellipsize(self, ellipsize)

      # Return value handling
    end

    def font_description=(desc : Pango::FontDescription?) : Nil
      # pango_layout_set_font_description: (Method)
      # @desc: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      desc = if desc.nil?
               Pointer(Void).null
             else
               desc.to_unsafe
             end

      # C call
      LibPango.pango_layout_set_font_description(self, desc)

      # Return value handling
    end

    def height=(height : Int32) : Nil
      # pango_layout_set_height: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_layout_set_height(self, height)

      # Return value handling
    end

    def indent=(indent : Int32) : Nil
      # pango_layout_set_indent: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_layout_set_indent(self, indent)

      # Return value handling
    end

    def justify=(justify : Bool) : Nil
      # pango_layout_set_justify: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_layout_set_justify(self, justify)

      # Return value handling
    end

    def justify_last_line=(justify : Bool) : Nil
      # pango_layout_set_justify_last_line: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_layout_set_justify_last_line(self, justify)

      # Return value handling
    end

    def line_spacing=(factor : Float32) : Nil
      # pango_layout_set_line_spacing: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_layout_set_line_spacing(self, factor)

      # Return value handling
    end

    def set_markup(markup : ::String, length : Int32) : Nil
      # pango_layout_set_markup: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_layout_set_markup(self, markup, length)

      # Return value handling
    end

    def set_markup_with_accel(markup : ::String, length : Int32, accel_marker : UInt32) : UInt32
      # pango_layout_set_markup_with_accel: (Method)
      # @accel_char: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Handle parameters
      accel_char = Pointer(UInt32).null
      accel_char = UInt32.new

      # C call
      LibPango.pango_layout_set_markup_with_accel(self, markup, length, accel_marker, accel_char)

      # Return value handling
      accel_char
    end

    def single_paragraph_mode=(setting : Bool) : Nil
      # pango_layout_set_single_paragraph_mode: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_layout_set_single_paragraph_mode(self, setting)

      # Return value handling
    end

    def spacing=(spacing : Int32) : Nil
      # pango_layout_set_spacing: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_layout_set_spacing(self, spacing)

      # Return value handling
    end

    def tabs=(tabs : Pango::TabArray?) : Nil
      # pango_layout_set_tabs: (Method)
      # @tabs: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      tabs = if tabs.nil?
               Pointer(Void).null
             else
               tabs.to_unsafe
             end

      # C call
      LibPango.pango_layout_set_tabs(self, tabs)

      # Return value handling
    end

    def set_text(text : ::String, length : Int32) : Nil
      # pango_layout_set_text: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_layout_set_text(self, text, length)

      # Return value handling
    end

    def width=(width : Int32) : Nil
      # pango_layout_set_width: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_layout_set_width(self, width)

      # Return value handling
    end

    def wrap=(wrap : Pango::WrapMode) : Nil
      # pango_layout_set_wrap: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_layout_set_wrap(self, wrap)

      # Return value handling
    end

    def write_to_file(flags : Pango::LayoutSerializeFlags, filename : ::String) : Bool
      # pango_layout_write_to_file: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_write_to_file(self, flags, filename, pointerof(_error))

      # Error check
      Pango.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def xy_to_index(x : Int32, y : Int32, index_ : Int32, trailing : Int32) : Bool
      # pango_layout_xy_to_index: (Method)
      # @index_: (out) (transfer full)
      # @trailing: (out) (transfer full)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_layout_xy_to_index(self, x, y, index_, trailing)

      # Return value handling
      GICrystal.to_bool(_retval)
    end
  end
end
