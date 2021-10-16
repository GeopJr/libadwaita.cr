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
  # ![Pango Layout Parameters](layout.png)
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

      _retval = LibPango.pango_layout_new(context)
      @pointer = _retval
    end

    def context_changed : Nil
      # pango_layout_context_changed: (Method)
      # Returns: (transfer none)

      LibPango.pango_layout_context_changed(self)
    end

    def copy : Pango::Layout
      # pango_layout_copy: (Method)
      # Returns: (transfer full)

      _retval = LibPango.pango_layout_copy(self)
      Pango::Layout.new(_retval, GICrystal::Transfer::Full)
    end

    def alignment : Pango::Alignment
      # pango_layout_get_alignment: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_alignment(self)
      Pango::Alignment.from_value(_retval)
    end

    def attributes : Pango::AttrList?
      # pango_layout_get_attributes: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_attributes(self)
      Pango::AttrList.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def auto_dir : Bool
      # pango_layout_get_auto_dir: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_auto_dir(self)
      GICrystal.to_bool(_retval)
    end

    def baseline : Int32
      # pango_layout_get_baseline: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_baseline(self)
      _retval
    end

    def character_count : Int32
      # pango_layout_get_character_count: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_character_count(self)
      _retval
    end

    def context : Pango::Context
      # pango_layout_get_context: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_context(self)
      Pango::Context.new(_retval, GICrystal::Transfer::None)
    end

    def cursor_pos(index_ : Int32) : Pango::Rectangle
      # pango_layout_get_cursor_pos: (Method)
      # @strong_pos: (out) (caller-allocates) (optional)
      # @weak_pos: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      strong_pos = Pointer(Void).null
      weak_pos = Pointer(Void).null
      strong_pos = Pango::Rectangle.new

      LibPango.pango_layout_get_cursor_pos(self, index_, strong_pos, weak_pos)
      strong_pos
    end

    def direction(index : Int32) : Pango::Direction
      # pango_layout_get_direction: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_direction(self, index)
      Pango::Direction.from_value(_retval)
    end

    def ellipsize : Pango::EllipsizeMode
      # pango_layout_get_ellipsize: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_ellipsize(self)
      Pango::EllipsizeMode.from_value(_retval)
    end

    def extents : Pango::Rectangle
      # pango_layout_get_extents: (Method)
      # @ink_rect: (out) (caller-allocates) (optional)
      # @logical_rect: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      ink_rect = Pointer(Void).null
      logical_rect = Pointer(Void).null
      ink_rect = Pango::Rectangle.new

      LibPango.pango_layout_get_extents(self, ink_rect, logical_rect)
      ink_rect
    end

    def font_description : Pango::FontDescription?
      # pango_layout_get_font_description: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_font_description(self)
      Pango::FontDescription.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def height : Int32
      # pango_layout_get_height: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_height(self)
      _retval
    end

    def indent : Int32
      # pango_layout_get_indent: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_indent(self)
      _retval
    end

    def iter : Pango::LayoutIter
      # pango_layout_get_iter: (Method)
      # Returns: (transfer full)

      _retval = LibPango.pango_layout_get_iter(self)
      Pango::LayoutIter.new(_retval, GICrystal::Transfer::Full)
    end

    def justify : Bool
      # pango_layout_get_justify: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_justify(self)
      GICrystal.to_bool(_retval)
    end

    def line(line : Int32) : Pango::LayoutLine?
      # pango_layout_get_line: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_line(self, line)
      Pango::LayoutLine.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def line_count : Int32
      # pango_layout_get_line_count: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_line_count(self)
      _retval
    end

    def line_readonly(line : Int32) : Pango::LayoutLine?
      # pango_layout_get_line_readonly: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_line_readonly(self, line)
      Pango::LayoutLine.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def line_spacing : Float32
      # pango_layout_get_line_spacing: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_line_spacing(self)
      _retval
    end

    def lines : GLib::SList
      # pango_layout_get_lines: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_lines(self)
      GLib::SList(Pango::LayoutLine).new(_retval, GICrystal::Transfer::None)
    end

    def lines_readonly : GLib::SList
      # pango_layout_get_lines_readonly: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_lines_readonly(self)
      GLib::SList(Pango::LayoutLine).new(_retval, GICrystal::Transfer::None)
    end

    def log_attrs(attrs : Enumerable(Pango::LogAttr)) : Nil
      # pango_layout_get_log_attrs: (Method)
      # @attrs: (out) (transfer container) (array length=n_attrs element-type Interface)
      # @n_attrs: (out) (transfer full)
      # Returns: (transfer none)

      n_attrs = attrs.size
      attrs = attrs.to_a.map(&.to_unsafe).to_unsafe

      LibPango.pango_layout_get_log_attrs(self, attrs, n_attrs)
    end

    def log_attrs(*attrs : Pango::LogAttr)
      log_attrs(attrs)
    end

    def log_attrs_readonly(n_attrs : Int32) : Enumerable(Pango::LogAttr)
      # pango_layout_get_log_attrs_readonly: (Method)
      # @n_attrs: (out) (transfer full)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_log_attrs_readonly(self, n_attrs)
      _retval
    end

    def pixel_extents : Pango::Rectangle
      # pango_layout_get_pixel_extents: (Method)
      # @ink_rect: (out) (caller-allocates) (optional)
      # @logical_rect: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      ink_rect = Pointer(Void).null
      logical_rect = Pointer(Void).null
      ink_rect = Pango::Rectangle.new

      LibPango.pango_layout_get_pixel_extents(self, ink_rect, logical_rect)
      ink_rect
    end

    def pixel_size : Nil
      # pango_layout_get_pixel_size: (Method)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      width = Pointer(Int32).null
      height = Pointer(Int32).null

      LibPango.pango_layout_get_pixel_size(self, width, height)
    end

    def serial : UInt32
      # pango_layout_get_serial: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_serial(self)
      _retval
    end

    def single_paragraph_mode : Bool
      # pango_layout_get_single_paragraph_mode: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_single_paragraph_mode(self)
      GICrystal.to_bool(_retval)
    end

    def size : Nil
      # pango_layout_get_size: (Method)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      width = Pointer(Int32).null
      height = Pointer(Int32).null

      LibPango.pango_layout_get_size(self, width, height)
    end

    def spacing : Int32
      # pango_layout_get_spacing: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_spacing(self)
      _retval
    end

    def tabs : Pango::TabArray?
      # pango_layout_get_tabs: (Method)
      # Returns: (transfer full)

      _retval = LibPango.pango_layout_get_tabs(self)
      Pango::TabArray.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def text : ::String
      # pango_layout_get_text: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_text(self)
      ::String.new(_retval)
    end

    def unknown_glyphs_count : Int32
      # pango_layout_get_unknown_glyphs_count: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_unknown_glyphs_count(self)
      _retval
    end

    def width : Int32
      # pango_layout_get_width: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_width(self)
      _retval
    end

    def wrap : Pango::WrapMode
      # pango_layout_get_wrap: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_get_wrap(self)
      Pango::WrapMode.from_value(_retval)
    end

    def index_to_line_x(index_ : Int32, trailing : Bool) : Nil
      # pango_layout_index_to_line_x: (Method)
      # @line: (out) (transfer full) (optional)
      # @x_pos: (out) (transfer full) (optional)
      # Returns: (transfer none)

      line = Pointer(Int32).null
      x_pos = Pointer(Int32).null

      LibPango.pango_layout_index_to_line_x(self, index_, trailing, line, x_pos)
    end

    def index_to_pos(index_ : Int32) : Pango::Rectangle
      # pango_layout_index_to_pos: (Method)
      # @pos: (out) (caller-allocates)
      # Returns: (transfer none)

      pos = Pango::Rectangle.new

      LibPango.pango_layout_index_to_pos(self, index_, pos)
      pos
    end

    def is_ellipsized : Bool
      # pango_layout_is_ellipsized: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_is_ellipsized(self)
      GICrystal.to_bool(_retval)
    end

    def is_wrapped : Bool
      # pango_layout_is_wrapped: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_is_wrapped(self)
      GICrystal.to_bool(_retval)
    end

    def move_cursor_visually(strong : Bool, old_index : Int32, old_trailing : Int32, direction : Int32, new_index : Int32, new_trailing : Int32) : Nil
      # pango_layout_move_cursor_visually: (Method)
      # @new_index: (out) (transfer full)
      # @new_trailing: (out) (transfer full)
      # Returns: (transfer none)

      LibPango.pango_layout_move_cursor_visually(self, strong, old_index, old_trailing, direction, new_index, new_trailing)
    end

    def alignment=(alignment : Pango::Alignment) : Nil
      # pango_layout_set_alignment: (Method)
      # Returns: (transfer none)

      LibPango.pango_layout_set_alignment(self, alignment)
    end

    def attributes=(attrs : Pango::AttrList?) : Nil
      # pango_layout_set_attributes: (Method)
      # @attrs: (nullable)
      # Returns: (transfer none)

      attrs = if attrs.nil?
                Pointer(Void).null
              else
                attrs.to_unsafe
              end

      LibPango.pango_layout_set_attributes(self, attrs)
    end

    def auto_dir=(auto_dir : Bool) : Nil
      # pango_layout_set_auto_dir: (Method)
      # Returns: (transfer none)

      LibPango.pango_layout_set_auto_dir(self, auto_dir)
    end

    def ellipsize=(ellipsize : Pango::EllipsizeMode) : Nil
      # pango_layout_set_ellipsize: (Method)
      # Returns: (transfer none)

      LibPango.pango_layout_set_ellipsize(self, ellipsize)
    end

    def font_description=(desc : Pango::FontDescription?) : Nil
      # pango_layout_set_font_description: (Method)
      # @desc: (nullable)
      # Returns: (transfer none)

      desc = if desc.nil?
               Pointer(Void).null
             else
               desc.to_unsafe
             end

      LibPango.pango_layout_set_font_description(self, desc)
    end

    def height=(height : Int32) : Nil
      # pango_layout_set_height: (Method)
      # Returns: (transfer none)

      LibPango.pango_layout_set_height(self, height)
    end

    def indent=(indent : Int32) : Nil
      # pango_layout_set_indent: (Method)
      # Returns: (transfer none)

      LibPango.pango_layout_set_indent(self, indent)
    end

    def justify=(justify : Bool) : Nil
      # pango_layout_set_justify: (Method)
      # Returns: (transfer none)

      LibPango.pango_layout_set_justify(self, justify)
    end

    def line_spacing=(factor : Float32) : Nil
      # pango_layout_set_line_spacing: (Method)
      # Returns: (transfer none)

      LibPango.pango_layout_set_line_spacing(self, factor)
    end

    def set_markup(markup : ::String, length : Int32) : Nil
      # pango_layout_set_markup: (Method)
      # Returns: (transfer none)

      LibPango.pango_layout_set_markup(self, markup, length)
    end

    def set_markup_with_accel(markup : ::String, length : Int32, accel_marker : UInt32) : UInt32
      # pango_layout_set_markup_with_accel: (Method)
      # @accel_char: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      accel_char = Pointer(UInt32).null
      accel_char = UInt32.new

      LibPango.pango_layout_set_markup_with_accel(self, markup, length, accel_marker, accel_char)
      accel_char
    end

    def single_paragraph_mode=(setting : Bool) : Nil
      # pango_layout_set_single_paragraph_mode: (Method)
      # Returns: (transfer none)

      LibPango.pango_layout_set_single_paragraph_mode(self, setting)
    end

    def spacing=(spacing : Int32) : Nil
      # pango_layout_set_spacing: (Method)
      # Returns: (transfer none)

      LibPango.pango_layout_set_spacing(self, spacing)
    end

    def tabs=(tabs : Pango::TabArray?) : Nil
      # pango_layout_set_tabs: (Method)
      # @tabs: (nullable)
      # Returns: (transfer none)

      tabs = if tabs.nil?
               Pointer(Void).null
             else
               tabs.to_unsafe
             end

      LibPango.pango_layout_set_tabs(self, tabs)
    end

    def set_text(text : ::String, length : Int32) : Nil
      # pango_layout_set_text: (Method)
      # Returns: (transfer none)

      LibPango.pango_layout_set_text(self, text, length)
    end

    def width=(width : Int32) : Nil
      # pango_layout_set_width: (Method)
      # Returns: (transfer none)

      LibPango.pango_layout_set_width(self, width)
    end

    def wrap=(wrap : Pango::WrapMode) : Nil
      # pango_layout_set_wrap: (Method)
      # Returns: (transfer none)

      LibPango.pango_layout_set_wrap(self, wrap)
    end

    def xy_to_index(x : Int32, y : Int32, index_ : Int32, trailing : Int32) : Bool
      # pango_layout_xy_to_index: (Method)
      # @index_: (out) (transfer full)
      # @trailing: (out) (transfer full)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_xy_to_index(self, x, y, index_, trailing)
      GICrystal.to_bool(_retval)
    end
  end
end
