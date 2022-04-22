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
  @[GObject::GeneratedWrapper]
  class Layout < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibPango::LayoutClass), class_init,
        sizeof(LibPango::Layout), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_layout_get_type
    end

    # Create a new `PangoLayout` object with attributes initialized to
    # default values for a particular `PangoContext`.
    def initialize(context : Pango::Context)
      # pango_layout_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_layout_new(context)

      # Return value handling

      @pointer = _retval
    end

    def deserialize(context : Pango::Context, bytes : GLib::Bytes, flags : Pango::LayoutDeserializeFlags) : Pango::Layout?
      # pango_layout_deserialize: (Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibPango.pango_layout_deserialize(context, bytes, flags, pointerof(_error))

      # Error check
      Pango.raise_exception(_error) unless _error.null?

      # Return value handling

      Pango::Layout.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Forces recomputation of any state in the `PangoLayout` that
    # might depend on the layout's context.
    #
    # This function should be called if you make changes to the context
    # subsequent to creating the layout.
    def context_changed : Nil
      # pango_layout_context_changed: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_layout_context_changed(self)

      # Return value handling
    end

    # Creates a deep copy-by-value of the layout.
    #
    # The attribute list, tab array, and text from the original layout
    # are all copied by value.
    def copy : Pango::Layout
      # pango_layout_copy: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_layout_copy(self)

      # Return value handling

      Pango::Layout.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the alignment for the layout: how partial lines are
    # positioned within the horizontal space available.
    def alignment : Pango::Alignment
      # pango_layout_get_alignment: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_alignment(self)

      # Return value handling

      Pango::Alignment.new(_retval)
    end

    # Gets the attribute list for the layout, if any.
    def attributes : Pango::AttrList?
      # pango_layout_get_attributes: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_attributes(self)

      # Return value handling

      Pango::AttrList.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets whether to calculate the base direction for the layout
    # according to its contents.
    #
    # See `Pango::Layout#auto_dir=`.
    def auto_dir : Bool
      # pango_layout_get_auto_dir: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_auto_dir(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the Y position of baseline of the first line in @layout.
    def baseline : Int32
      # pango_layout_get_baseline: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_baseline(self)

      # Return value handling

      _retval
    end

    # Given an index within a layout, determines the positions that of the
    # strong and weak cursors if the insertion point is at that index.
    #
    # This is a variant of `Pango::Layout#cursor_pos` that applies
    # font metric information about caret slope and offset to the positions
    # it returns.
    #
    # <picture>
    #   <source srcset="caret-metrics-dark.png" media="(prefers-color-scheme: dark)">
    #   <img alt="Caret metrics" src="caret-metrics-light.png">
    # </picture>
    def caret_pos(index_ : Int32) : Pango::Rectangle
      # pango_layout_get_caret_pos: (Method)
      # @strong_pos: (out) (caller-allocates) (optional)
      # @weak_pos: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      strong_pos = Pointer(Void).null
      # Generator::CallerAllocatesPlan
      strong_pos = Pango::Rectangle.new
      # Generator::OutArgUsedInReturnPlan
      weak_pos = Pointer(Void).null
      # Generator::CallerAllocatesPlan
      weak_pos = Pango::Rectangle.new

      # C call
      LibPango.pango_layout_get_caret_pos(self, index_, strong_pos, weak_pos)

      # Return value handling

      strong_pos
    end

    # Returns the number of Unicode characters in the
    # the text of @layout.
    def character_count : Int32
      # pango_layout_get_character_count: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_character_count(self)

      # Return value handling

      _retval
    end

    # Retrieves the `PangoContext` used for this layout.
    def context : Pango::Context
      # pango_layout_get_context: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_context(self)

      # Return value handling

      Pango::Context.new(_retval, GICrystal::Transfer::None)
    end

    # Given an index within a layout, determines the positions that of the
    # strong and weak cursors if the insertion point is at that index.
    #
    # The position of each cursor is stored as a zero-width rectangle
    # with the height of the run extents.
    #
    # <picture>
    #   <source srcset="cursor-positions-dark.png" media="(prefers-color-scheme: dark)">
    #   <img alt="Cursor positions" src="cursor-positions-light.png">
    # </picture>
    #
    # The strong cursor location is the location where characters of the
    # directionality equal to the base direction of the layout are inserted.
    # The weak cursor location is the location where characters of the
    # directionality opposite to the base direction of the layout are inserted.
    #
    # The following example shows text with both a strong and a weak cursor.
    #
    # <picture>
    #   <source srcset="split-cursor-dark.png" media="(prefers-color-scheme: dark)">
    #   <img alt="Strong and weak cursors" src="split-cursor-light.png">
    # </picture>
    #
    # The strong cursor has a little arrow pointing to the right, the weak
    # cursor to the left. Typing a 'c' in this situation will insert the
    # character after the 'b', and typing another Hebrew character, like 'ג',
    # will insert it at the end.
    def cursor_pos(index_ : Int32) : Pango::Rectangle
      # pango_layout_get_cursor_pos: (Method)
      # @strong_pos: (out) (caller-allocates) (optional)
      # @weak_pos: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      strong_pos = Pointer(Void).null
      # Generator::CallerAllocatesPlan
      strong_pos = Pango::Rectangle.new
      # Generator::OutArgUsedInReturnPlan
      weak_pos = Pointer(Void).null
      # Generator::CallerAllocatesPlan
      weak_pos = Pango::Rectangle.new

      # C call
      LibPango.pango_layout_get_cursor_pos(self, index_, strong_pos, weak_pos)

      # Return value handling

      strong_pos
    end

    # Gets the text direction at the given character position in @layout.
    def direction(index : Int32) : Pango::Direction
      # pango_layout_get_direction: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_direction(self, index)

      # Return value handling

      Pango::Direction.new(_retval)
    end

    # Gets the type of ellipsization being performed for @layout.
    #
    # See `Pango::Layout#ellipsize=`.
    #
    # Use `Pango::Layout#is_ellipsized?` to query whether any
    # paragraphs were actually ellipsized.
    def ellipsize : Pango::EllipsizeMode
      # pango_layout_get_ellipsize: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_ellipsize(self)

      # Return value handling

      Pango::EllipsizeMode.new(_retval)
    end

    # Computes the logical and ink extents of @layout.
    #
    # Logical extents are usually what you want for positioning things. Note
    # that both extents may have non-zero x and y. You may want to use those
    # to offset where you render the layout. Not doing that is a very typical
    # bug that shows up as right-to-left layouts not being correctly positioned
    # in a layout with a set width.
    #
    # The extents are given in layout coordinates and in Pango units; layout
    # coordinates begin at the top left corner of the layout.
    def extents : Pango::Rectangle
      # pango_layout_get_extents: (Method)
      # @ink_rect: (out) (caller-allocates) (optional)
      # @logical_rect: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      ink_rect = Pointer(Void).null
      # Generator::CallerAllocatesPlan
      ink_rect = Pango::Rectangle.new
      # Generator::OutArgUsedInReturnPlan
      logical_rect = Pointer(Void).null
      # Generator::CallerAllocatesPlan
      logical_rect = Pango::Rectangle.new

      # C call
      LibPango.pango_layout_get_extents(self, ink_rect, logical_rect)

      # Return value handling

      ink_rect
    end

    # Gets the font description for the layout, if any.
    def font_description : Pango::FontDescription?
      # pango_layout_get_font_description: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_font_description(self)

      # Return value handling

      Pango::FontDescription.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the height of layout used for ellipsization.
    #
    # See `Pango::Layout#height=` for details.
    def height : Int32
      # pango_layout_get_height: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_height(self)

      # Return value handling

      _retval
    end

    # Gets the paragraph indent width in Pango units.
    #
    # A negative value indicates a hanging indentation.
    def indent : Int32
      # pango_layout_get_indent: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_indent(self)

      # Return value handling

      _retval
    end

    # Returns an iterator to iterate over the visual extents of the layout.
    def iter : Pango::LayoutIter
      # pango_layout_get_iter: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_layout_get_iter(self)

      # Return value handling

      Pango::LayoutIter.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets whether each complete line should be stretched to fill the entire
    # width of the layout.
    def justify : Bool
      # pango_layout_get_justify: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_justify(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether the last line should be stretched
    # to fill the entire width of the layout.
    def justify_last_line : Bool
      # pango_layout_get_justify_last_line: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_justify_last_line(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves a particular line from a `PangoLayout`.
    #
    # Use the faster `Pango::Layout#line_readonly` if you do not
    # plan to modify the contents of the line (glyphs, glyph widths, etc.).
    def line(line : Int32) : Pango::LayoutLine?
      # pango_layout_get_line: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_line(self, line)

      # Return value handling

      Pango::LayoutLine.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Retrieves the count of lines for the @layout.
    def line_count : Int32
      # pango_layout_get_line_count: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_line_count(self)

      # Return value handling

      _retval
    end

    # Retrieves a particular line from a `PangoLayout`.
    #
    # This is a faster alternative to `Pango::Layout#line`,
    # but the user is not expected to modify the contents of the line
    # (glyphs, glyph widths, etc.).
    def line_readonly(line : Int32) : Pango::LayoutLine?
      # pango_layout_get_line_readonly: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_line_readonly(self, line)

      # Return value handling

      Pango::LayoutLine.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the line spacing factor of @layout.
    #
    # See `Pango::Layout#line_spacing=`.
    def line_spacing : Float32
      # pango_layout_get_line_spacing: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_line_spacing(self)

      # Return value handling

      _retval
    end

    # Returns the lines of the @layout as a list.
    #
    # Use the faster `Pango::Layout#lines_readonly` if you do not
    # plan to modify the contents of the lines (glyphs, glyph widths, etc.).
    def lines : GLib::SList
      # pango_layout_get_lines: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_lines(self)

      # Return value handling

      GLib::SList(Pango::LayoutLine).new(_retval, GICrystal::Transfer::None)
    end

    # Returns the lines of the @layout as a list.
    #
    # This is a faster alternative to `Pango::Layout#lines`,
    # but the user is not expected to modify the contents of the lines
    # (glyphs, glyph widths, etc.).
    def lines_readonly : GLib::SList
      # pango_layout_get_lines_readonly: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_lines_readonly(self)

      # Return value handling

      GLib::SList(Pango::LayoutLine).new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves an array of logical attributes for each character in
    # the @layout.
    def log_attrs(attrs : Enumerable(Pango::LogAttr)) : Nil
      # pango_layout_get_log_attrs: (Method)
      # @attrs: (out) (transfer container) (array length=n_attrs element-type Interface)
      # @n_attrs: (out) (transfer full)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_attrs = attrs.size
      # Generator::ArrayArgPlan
      attrs = attrs.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibPango.pango_layout_get_log_attrs(self, attrs, n_attrs)

      # Return value handling
    end

    def log_attrs(*attrs : Pango::LogAttr)
      log_attrs(attrs)
    end

    # Retrieves an array of logical attributes for each character in
    # the @layout.
    #
    # This is a faster alternative to `Pango::Layout#log_attrs`.
    # The returned array is part of @layout and must not be modified.
    # Modifying the layout will invalidate the returned array.
    #
    # The number of attributes returned in @n_attrs will be one more
    # than the total number of characters in the layout, since there
    # need to be attributes corresponding to both the position before
    # the first character and the position after the last character.
    def log_attrs_readonly : Enumerable(Pango::LogAttr)
      # pango_layout_get_log_attrs_readonly: (Method)
      # @n_attrs: (out) (transfer full)
      # Returns: (transfer none) (array length=n_attrs element-type Interface)

      # Generator::OutArgUsedInReturnPlan
      n_attrs = 0

      # C call
      _retval = LibPango.pango_layout_get_log_attrs_readonly(self, pointerof(n_attrs))

      # Return value handling

      GICrystal.transfer_array(_retval, n_attrs, GICrystal::Transfer::None)
    end

    # Computes the logical and ink extents of @layout in device units.
    #
    # This function just calls `Pango::Layout#extents` followed by
    # two `#extents_to_pixels` calls, rounding @ink_rect and @logical_rect
    # such that the rounded rectangles fully contain the unrounded one (that is,
    # passes them as first argument to `Pango#extents_to_pixels`).
    def pixel_extents : Pango::Rectangle
      # pango_layout_get_pixel_extents: (Method)
      # @ink_rect: (out) (caller-allocates) (optional)
      # @logical_rect: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      ink_rect = Pointer(Void).null
      # Generator::CallerAllocatesPlan
      ink_rect = Pango::Rectangle.new
      # Generator::OutArgUsedInReturnPlan
      logical_rect = Pointer(Void).null
      # Generator::CallerAllocatesPlan
      logical_rect = Pango::Rectangle.new

      # C call
      LibPango.pango_layout_get_pixel_extents(self, ink_rect, logical_rect)

      # Return value handling

      ink_rect
    end

    # Determines the logical width and height of a `PangoLayout` in device
    # units.
    #
    # `Pango::Layout#size` returns the width and height
    # scaled by %PANGO_SCALE. This is simply a convenience function
    # around `Pango::Layout#pixel_extents`.
    def pixel_size : Nil
      # pango_layout_get_pixel_size: (Method)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      width = Pointer(Int32).null
      # Generator::OutArgUsedInReturnPlan
      height = Pointer(Int32).null

      # C call
      LibPango.pango_layout_get_pixel_size(self, width, height)

      # Return value handling
    end

    # Returns the current serial number of @layout.
    #
    # The serial number is initialized to an small number larger than zero
    # when a new layout is created and is increased whenever the layout is
    # changed using any of the setter functions, or the `PangoContext` it
    # uses has changed. The serial may wrap, but will never have the value 0.
    # Since it can wrap, never compare it with "less than", always use "not equals".
    #
    # This can be used to automatically detect changes to a `PangoLayout`,
    # and is useful for example to decide whether a layout needs redrawing.
    # To force the serial to be increased, use
    # `Pango::Layout#context_changed`.
    def serial : UInt32
      # pango_layout_get_serial: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_serial(self)

      # Return value handling

      _retval
    end

    # Obtains whether @layout is in single paragraph mode.
    #
    # See `Pango::Layout#single_paragraph_mode=`.
    def single_paragraph_mode : Bool
      # pango_layout_get_single_paragraph_mode: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_single_paragraph_mode(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Determines the logical width and height of a `PangoLayout` in Pango
    # units.
    #
    # This is simply a convenience function around `Pango::Layout#extents`.
    def size : Nil
      # pango_layout_get_size: (Method)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      width = Pointer(Int32).null
      # Generator::OutArgUsedInReturnPlan
      height = Pointer(Int32).null

      # C call
      LibPango.pango_layout_get_size(self, width, height)

      # Return value handling
    end

    # Gets the amount of spacing between the lines of the layout.
    def spacing : Int32
      # pango_layout_get_spacing: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_spacing(self)

      # Return value handling

      _retval
    end

    # Gets the current `PangoTabArray` used by this layout.
    #
    # If no `PangoTabArray` has been set, then the default tabs are
    # in use and %NULL is returned. Default tabs are every 8 spaces.
    #
    # The return value should be freed with `Pango::TabArray#free`.
    def tabs : Pango::TabArray?
      # pango_layout_get_tabs: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_layout_get_tabs(self)

      # Return value handling

      Pango::TabArray.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets the text in the layout.
    #
    # The returned text should not be freed or modified.
    def text : ::String
      # pango_layout_get_text: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_text(self)

      # Return value handling

      ::String.new(_retval)
    end

    # Counts the number of unknown glyphs in @layout.
    #
    # This function can be used to determine if there are any fonts
    # available to render all characters in a certain string, or when
    # used in combination with %PANGO_ATTR_FALLBACK, to check if a
    # certain font supports all the characters in the string.
    def unknown_glyphs_count : Int32
      # pango_layout_get_unknown_glyphs_count: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_unknown_glyphs_count(self)

      # Return value handling

      _retval
    end

    # Gets the width to which the lines of the `PangoLayout` should wrap.
    def width : Int32
      # pango_layout_get_width: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_width(self)

      # Return value handling

      _retval
    end

    # Gets the wrap mode for the layout.
    #
    # Use `Pango::Layout#is_wrapped?` to query whether
    # any paragraphs were actually wrapped.
    def wrap : Pango::WrapMode
      # pango_layout_get_wrap: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_get_wrap(self)

      # Return value handling

      Pango::WrapMode.new(_retval)
    end

    # Converts from byte @index_ within the @layout to line and X position.
    #
    # The X position is measured from the left edge of the line.
    def index_to_line_x(index_ : Int32, trailing : Bool) : Nil
      # pango_layout_index_to_line_x: (Method)
      # @line: (out) (transfer full) (optional)
      # @x_pos: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      line = Pointer(Int32).null
      # Generator::OutArgUsedInReturnPlan
      x_pos = Pointer(Int32).null

      # C call
      LibPango.pango_layout_index_to_line_x(self, index_, trailing, line, x_pos)

      # Return value handling
    end

    # Converts from an index within a `PangoLayout` to the onscreen position
    # corresponding to the grapheme at that index.
    #
    # The return value is represented as rectangle. Note that `pos->x` is
    # always the leading edge of the grapheme and `pos->x + pos->width` the
    # trailing edge of the grapheme. If the directionality of the grapheme
    # is right-to-left, then `pos->width` will be negative.
    def index_to_pos(index_ : Int32) : Pango::Rectangle
      # pango_layout_index_to_pos: (Method)
      # @pos: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      pos = Pango::Rectangle.new

      # C call
      LibPango.pango_layout_index_to_pos(self, index_, pos)

      # Return value handling

      pos
    end

    # Queries whether the layout had to ellipsize any paragraphs.
    #
    # This returns %TRUE if the ellipsization mode for @layout
    # is not %PANGO_ELLIPSIZE_NONE, a positive width is set on @layout,
    # and there are paragraphs exceeding that width that have to be
    # ellipsized.
    def is_ellipsized : Bool
      # pango_layout_is_ellipsized: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_is_ellipsized(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Queries whether the layout had to wrap any paragraphs.
    #
    # This returns %TRUE if a positive width is set on @layout,
    # ellipsization mode of @layout is set to %PANGO_ELLIPSIZE_NONE,
    # and there are paragraphs exceeding the layout width that have
    # to be wrapped.
    def is_wrapped : Bool
      # pango_layout_is_wrapped: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_is_wrapped(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Computes a new cursor position from an old position and a direction.
    #
    # If @direction is positive, then the new position will cause the strong
    # or weak cursor to be displayed one position to right of where it was
    # with the old cursor position. If @direction is negative, it will be
    # moved to the left.
    #
    # In the presence of bidirectional text, the correspondence between
    # logical and visual order will depend on the direction of the current
    # run, and there may be jumps when the cursor is moved off of the end
    # of a run.
    #
    # Motion here is in cursor positions, not in characters, so a single
    # call to this function may move the cursor over multiple characters
    # when multiple characters combine to form a single grapheme.
    def move_cursor_visually(strong : Bool, old_index : Int32, old_trailing : Int32, direction : Int32, new_index : Int32, new_trailing : Int32) : Nil
      # pango_layout_move_cursor_visually: (Method)
      # @new_index: (out) (transfer full)
      # @new_trailing: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibPango.pango_layout_move_cursor_visually(self, strong, old_index, old_trailing, direction, new_index, new_trailing)

      # Return value handling
    end

    # Serializes the @layout for later deserialization via `Pango::Layout#deserialize`.
    #
    # There are no guarantees about the format of the output across different
    # versions of Pango and `Pango::Layout#deserialize` will reject data
    # that it cannot parse.
    #
    # The intended use of this function is testing, benchmarking and debugging.
    # The format is not meant as a permanent storage format.
    def serialize(flags : Pango::LayoutSerializeFlags) : GLib::Bytes
      # pango_layout_serialize: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_layout_serialize(self, flags)

      # Return value handling

      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    # Sets the alignment for the layout: how partial lines are
    # positioned within the horizontal space available.
    #
    # The default alignment is %PANGO_ALIGN_LEFT.
    def alignment=(alignment : Pango::Alignment) : Nil
      # pango_layout_set_alignment: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_layout_set_alignment(self, alignment)

      # Return value handling
    end

    # Sets the text attributes for a layout object.
    #
    # References @attrs, so the caller can unref its reference.
    def attributes=(attrs : Pango::AttrList?) : Nil
      # pango_layout_set_attributes: (Method)
      # @attrs: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      attrs = if attrs.nil?
                Pointer(Void).null
              else
                attrs.to_unsafe
              end

      # C call
      LibPango.pango_layout_set_attributes(self, attrs)

      # Return value handling
    end

    # Sets whether to calculate the base direction
    # for the layout according to its contents.
    #
    # When this flag is on (the default), then paragraphs in @layout that
    # begin with strong right-to-left characters (Arabic and Hebrew principally),
    # will have right-to-left layout, paragraphs with letters from other scripts
    # will have left-to-right layout. Paragraphs with only neutral characters
    # get their direction from the surrounding paragraphs.
    #
    # When %FALSE, the choice between left-to-right and right-to-left
    # layout is done according to the base direction of the layout's
    # `PangoContext`. (See `Pango::Context#base_dir=`).
    #
    # When the auto-computed direction of a paragraph differs from the
    # base direction of the context, the interpretation of
    # %PANGO_ALIGN_LEFT and %PANGO_ALIGN_RIGHT are swapped.
    def auto_dir=(auto_dir : Bool) : Nil
      # pango_layout_set_auto_dir: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_layout_set_auto_dir(self, auto_dir)

      # Return value handling
    end

    # Sets the type of ellipsization being performed for @layout.
    #
    # Depending on the ellipsization mode @ellipsize text is
    # removed from the start, middle, or end of text so they
    # fit within the width and height of layout set with
    # `Pango::Layout#width=` and `Pango::Layout#height=`.
    #
    # If the layout contains characters such as newlines that
    # force it to be layed out in multiple paragraphs, then whether
    # each paragraph is ellipsized separately or the entire layout
    # is ellipsized as a whole depends on the set height of the layout.
    #
    # The default value is %PANGO_ELLIPSIZE_NONE.
    #
    # See `Pango::Layout#height=` for details.
    def ellipsize=(ellipsize : Pango::EllipsizeMode) : Nil
      # pango_layout_set_ellipsize: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_layout_set_ellipsize(self, ellipsize)

      # Return value handling
    end

    # Sets the default font description for the layout.
    #
    # If no font description is set on the layout, the
    # font description from the layout's context is used.
    def font_description=(desc : Pango::FontDescription?) : Nil
      # pango_layout_set_font_description: (Method)
      # @desc: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      desc = if desc.nil?
               Pointer(Void).null
             else
               desc.to_unsafe
             end

      # C call
      LibPango.pango_layout_set_font_description(self, desc)

      # Return value handling
    end

    # Sets the height to which the `PangoLayout` should be ellipsized at.
    #
    # There are two different behaviors, based on whether @height is positive
    # or negative.
    #
    # If @height is positive, it will be the maximum height of the layout. Only
    # lines would be shown that would fit, and if there is any text omitted,
    # an ellipsis added. At least one line is included in each paragraph regardless
    # of how small the height value is. A value of zero will render exactly one
    # line for the entire layout.
    #
    # If @height is negative, it will be the (negative of) maximum number of lines
    # per paragraph. That is, the total number of lines shown may well be more than
    # this value if the layout contains multiple paragraphs of text.
    # The default value of -1 means that the first line of each paragraph is ellipsized.
    # This behavior may be changed in the future to act per layout instead of per
    # paragraph. File a bug against pango at
    # [https://gitlab.gnome.org/gnome/pango](https://gitlab.gnome.org/gnome/pango)
    # if your code relies on this behavior.
    #
    # Height setting only has effect if a positive width is set on
    # @layout and ellipsization mode of @layout is not %PANGO_ELLIPSIZE_NONE.
    # The behavior is undefined if a height other than -1 is set and
    # ellipsization mode is set to %PANGO_ELLIPSIZE_NONE, and may change in the
    # future.
    def height=(height : Int32) : Nil
      # pango_layout_set_height: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_layout_set_height(self, height)

      # Return value handling
    end

    # Sets the width in Pango units to indent each paragraph.
    #
    # A negative value of @indent will produce a hanging indentation.
    # That is, the first line will have the full width, and subsequent
    # lines will be indented by the absolute value of @indent.
    #
    # The indent setting is ignored if layout alignment is set to
    # %PANGO_ALIGN_CENTER.
    #
    # The default value is 0.
    def indent=(indent : Int32) : Nil
      # pango_layout_set_indent: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_layout_set_indent(self, indent)

      # Return value handling
    end

    # Sets whether each complete line should be stretched to fill the
    # entire width of the layout.
    #
    # Stretching is typically done by adding whitespace, but for some scripts
    # (such as Arabic), the justification may be done in more complex ways,
    # like extending the characters.
    #
    # Note that this setting is not implemented and so is ignored in
    # Pango older than 1.18.
    #
    # Note that tabs and justification conflict with each other:
    # Justification will move content away from its tab-aligned
    # positions.
    #
    # The default value is %FALSE.
    #
    # Also see `Pango::Layout#justify_last_line=`.
    def justify=(justify : Bool) : Nil
      # pango_layout_set_justify: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_layout_set_justify(self, justify)

      # Return value handling
    end

    # Sets whether the last line should be stretched to fill the
    # entire width of the layout.
    #
    # This only has an effect if `Pango::Layout#justify=` has
    # been called as well.
    #
    # The default value is %FALSE.
    def justify_last_line=(justify : Bool) : Nil
      # pango_layout_set_justify_last_line: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_layout_set_justify_last_line(self, justify)

      # Return value handling
    end

    # Sets a factor for line spacing.
    #
    # Typical values are: 0, 1, 1.5, 2. The default values is 0.
    #
    # If @factor is non-zero, lines are placed so that
    #
    #     baseline2 = baseline1 + factor * height2
    #
    # where height2 is the line height of the second line
    # (as determined by the font(s)). In this case, the spacing
    # set with `Pango::Layout#spacing=` is ignored.
    #
    # If @factor is zero (the default), spacing is applied as before.
    #
    # Note: for semantics that are closer to the CSS line-height
    # property, see `Pango#attr_line_height_new`.
    def line_spacing=(factor : Float32) : Nil
      # pango_layout_set_line_spacing: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_layout_set_line_spacing(self, factor)

      # Return value handling
    end

    # Sets the layout text and attribute list from marked-up text.
    #
    # See [Pango Markup](pango_markup.html)).
    #
    # Replaces the current text and attribute list.
    #
    # This is the same as `Pango::Layout#markup_with_accel=`,
    # but the markup text isn't scanned for accelerators.
    def set_markup(markup : ::String, length : Int32) : Nil
      # pango_layout_set_markup: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_layout_set_markup(self, markup, length)

      # Return value handling
    end

    # Sets the layout text and attribute list from marked-up text.
    #
    # See [Pango Markup](pango_markup.html)).
    #
    # Replaces the current text and attribute list.
    #
    # If @accel_marker is nonzero, the given character will mark the
    # character following it as an accelerator. For example, @accel_marker
    # might be an ampersand or underscore. All characters marked
    # as an accelerator will receive a %PANGO_UNDERLINE_LOW attribute,
    # and the first character so marked will be returned in @accel_char.
    # Two @accel_marker characters following each other produce a single
    # literal @accel_marker character.
    def set_markup_with_accel(markup : ::String, length : Int32, accel_marker : UInt32) : UInt32
      # pango_layout_set_markup_with_accel: (Method)
      # @accel_char: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      accel_char = Pointer(UInt32).null
      # Generator::CallerAllocatesPlan
      accel_char = UInt32.new

      # C call
      LibPango.pango_layout_set_markup_with_accel(self, markup, length, accel_marker, accel_char)

      # Return value handling

      accel_char
    end

    # Sets the single paragraph mode of @layout.
    #
    # If @setting is %TRUE, do not treat newlines and similar characters
    # as paragraph separators; instead, keep all text in a single paragraph,
    # and display a glyph for paragraph separator characters. Used when
    # you want to allow editing of newlines on a single text line.
    #
    # The default value is %FALSE.
    def single_paragraph_mode=(setting : Bool) : Nil
      # pango_layout_set_single_paragraph_mode: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_layout_set_single_paragraph_mode(self, setting)

      # Return value handling
    end

    # Sets the amount of spacing in Pango units between
    # the lines of the layout.
    #
    # When placing lines with spacing, Pango arranges things so that
    #
    #     line2.top = line1.bottom + spacing
    #
    # The default value is 0.
    #
    # Note: Since 1.44, Pango is using the line height (as determined
    # by the font) for placing lines when the line spacing factor is set
    # to a non-zero value with `Pango::Layout#line_spacing=`.
    # In that case, the @spacing set with this function is ignored.
    #
    # Note: for semantics that are closer to the CSS line-height
    # property, see `Pango#attr_line_height_new`.
    def spacing=(spacing : Int32) : Nil
      # pango_layout_set_spacing: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_layout_set_spacing(self, spacing)

      # Return value handling
    end

    # Sets the tabs to use for @layout, overriding the default tabs.
    #
    # `PangoLayout` will place content at the next tab position
    # whenever it meets a Tab character (U+0009).
    #
    # By default, tabs are every 8 spaces. If @tabs is %NULL, the
    # default tabs are reinstated. @tabs is copied into the layout;
    # you must free your copy of @tabs yourself.
    #
    # Note that tabs and justification conflict with each other:
    # Justification will move content away from its tab-aligned
    # positions. The same is true for alignments other than
    # %PANGO_ALIGN_LEFT.
    def tabs=(tabs : Pango::TabArray?) : Nil
      # pango_layout_set_tabs: (Method)
      # @tabs: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      tabs = if tabs.nil?
               Pointer(Void).null
             else
               tabs.to_unsafe
             end

      # C call
      LibPango.pango_layout_set_tabs(self, tabs)

      # Return value handling
    end

    # Sets the text of the layout.
    #
    # This function validates @text and renders invalid UTF-8
    # with a placeholder glyph.
    #
    # Note that if you have used `Pango::Layout#markup=` or
    # `Pango::Layout#markup_with_accel=` on @layout before, you
    # may want to call `Pango::Layout#attributes=` to clear the
    # attributes set on the layout from the markup as this function does
    # not clear attributes.
    def set_text(text : ::String, length : Int32) : Nil
      # pango_layout_set_text: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_layout_set_text(self, text, length)

      # Return value handling
    end

    # Sets the width to which the lines of the `PangoLayout` should wrap or
    # ellipsized.
    #
    # The default value is -1: no width set.
    def width=(width : Int32) : Nil
      # pango_layout_set_width: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_layout_set_width(self, width)

      # Return value handling
    end

    # Sets the wrap mode.
    #
    # The wrap mode only has effect if a width is set on the layout
    # with `Pango::Layout#width=`. To turn off wrapping,
    # set the width to -1.
    #
    # The default value is %PANGO_WRAP_WORD.
    def wrap=(wrap : Pango::WrapMode) : Nil
      # pango_layout_set_wrap: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_layout_set_wrap(self, wrap)

      # Return value handling
    end

    # A convenience method to serialize a layout to a file.
    #
    # It is equivalent to calling `Pango::Layout#serialize`
    # followed by `GLib#file_set_contents`.
    #
    # See those two functions for details on the arguments.
    #
    # It is mostly intended for use inside a debugger to quickly dump
    # a layout to a file for later inspection.
    def write_to_file(flags : Pango::LayoutSerializeFlags, filename : ::String) : Bool
      # pango_layout_write_to_file: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibPango.pango_layout_write_to_file(self, flags, filename, pointerof(_error))

      # Error check
      Pango.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Converts from X and Y position within a layout to the byte index to the
    # character at that logical position.
    #
    # If the Y position is not inside the layout, the closest position is
    # chosen (the position will be clamped inside the layout). If the X position
    # is not within the layout, then the start or the end of the line is
    # chosen as described for `Pango::LayoutLine#x_to_index`. If either
    # the X or Y positions were not inside the layout, then the function returns
    # %FALSE; on an exact hit, it returns %TRUE.
    def xy_to_index(x : Int32, y : Int32, index_ : Int32, trailing : Int32) : Bool
      # pango_layout_xy_to_index: (Method)
      # @index_: (out) (transfer full)
      # @trailing: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_xy_to_index(self, x, y, index_, trailing)

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
