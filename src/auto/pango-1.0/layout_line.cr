module Pango
  # A `PangoLayoutLine` represents one of the lines resulting from laying
  # out a paragraph via `PangoLayout`.
  #
  # `PangoLayoutLine` structures are obtained by calling
  # `Pango::Layout#line` and are only valid until the text,
  # attributes, or settings of the parent `PangoLayout` are modified.
  class LayoutLine
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::LayoutLine))
      @pointer.copy_from(pointer, sizeof(LibPango::LayoutLine))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(layout : Pango::Layout? = nil, start_index : Int32? = nil, length : Int32? = nil, runs : GLib::SList? = nil, is_paragraph_start : UInt32? = nil, resolved_dir : UInt32? = nil)
      _ptr = Pointer(Void).malloc(32)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.layout = layout unless layout.nil?
      _instance.start_index = start_index unless start_index.nil?
      _instance.length = length unless length.nil?
      _instance.runs = runs unless runs.nil?
      _instance.is_paragraph_start = is_paragraph_start unless is_paragraph_start.nil?
      _instance.resolved_dir = resolved_dir unless resolved_dir.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibPango::LayoutLine)).zero?
    end

    def layout!
      self.layout.not_nil!
    end

    def layout : Pango::Layout?
      _var = (@pointer + 0).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      Pango::Layout.new(_var.value, GICrystal::Transfer::None)
    end

    def layout=(value : Pango::Layout?)
      _var = (@pointer + 0).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value.to_unsafe
      value
    end

    def start_index : Int32
      _var = (@pointer + 8).as(Pointer(Int32))
      _var.value
    end

    def start_index=(value : Int32)
      _var = (@pointer + 8).as(Pointer(Int32)).value = value
      value
    end

    def length : Int32
      _var = (@pointer + 12).as(Pointer(Int32))
      _var.value
    end

    def length=(value : Int32)
      _var = (@pointer + 12).as(Pointer(Int32)).value = value
      value
    end

    def runs!
      self.runs.not_nil!
    end

    def runs : GLib::SList?
      _var = (@pointer + 16).as(Pointer(Pointer(LibGLib::SList)))
      return if _var.value.null?
      GLib::SList(Pango::GlyphItem).new(_var.value, GICrystal::Transfer::None)
    end

    def runs=(value : GLib::SList?)
      _var = (@pointer + 16).as(Pointer(Pointer(LibGLib::SList))).value = value.nil? ? Pointer(LibGLib::SList).null : value
      value
    end

    def is_paragraph_start : UInt32
      _var = (@pointer + 24).as(Pointer(UInt32))
      _var.value
    end

    def is_paragraph_start=(value : UInt32)
      _var = (@pointer + 24).as(Pointer(UInt32)).value = value
      value
    end

    def resolved_dir : UInt32
      _var = (@pointer + 28).as(Pointer(UInt32))
      _var.value
    end

    def resolved_dir=(value : UInt32)
      _var = (@pointer + 28).as(Pointer(UInt32)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_layout_line_get_type
    end

    def extents : Pango::Rectangle
      # pango_layout_line_get_extents: (Method)
      # @ink_rect: (out) (caller-allocates) (optional)
      # @logical_rect: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      ink_rect = Pointer(Void).null     # Generator::CallerAllocatesPlan
      ink_rect = Pango::Rectangle.new   # Generator::OutArgUsedInReturnPlan
      logical_rect = Pointer(Void).null # Generator::CallerAllocatesPlan
      logical_rect = Pango::Rectangle.new
      # C call
      LibPango.pango_layout_line_get_extents(self, ink_rect, logical_rect)

      # Return value handling

      ink_rect
    end

    def height : Nil
      # pango_layout_line_get_height: (Method)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      height = Pointer(Int32).null
      # C call
      LibPango.pango_layout_line_get_height(self, height)

      # Return value handling
    end

    def length : Int32
      # pango_layout_line_get_length: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_line_get_length(self)

      # Return value handling

      _retval
    end

    def pixel_extents : Pango::Rectangle
      # pango_layout_line_get_pixel_extents: (Method)
      # @ink_rect: (out) (caller-allocates) (optional)
      # @logical_rect: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      ink_rect = Pointer(Void).null     # Generator::CallerAllocatesPlan
      ink_rect = Pango::Rectangle.new   # Generator::OutArgUsedInReturnPlan
      logical_rect = Pointer(Void).null # Generator::CallerAllocatesPlan
      logical_rect = Pango::Rectangle.new
      # C call
      LibPango.pango_layout_line_get_pixel_extents(self, ink_rect, logical_rect)

      # Return value handling

      ink_rect
    end

    def resolved_direction : Pango::Direction
      # pango_layout_line_get_resolved_direction: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_line_get_resolved_direction(self)

      # Return value handling

      Pango::Direction.new(_retval)
    end

    def start_index : Int32
      # pango_layout_line_get_start_index: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_line_get_start_index(self)

      # Return value handling

      _retval
    end

    def x_ranges(start_index : Int32, end_index : Int32, ranges : Enumerable(Int32)) : Nil
      # pango_layout_line_get_x_ranges: (Method)
      # @ranges: (out) (transfer full) (array length=n_ranges element-type Int32)
      # @n_ranges: (out) (transfer full)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_ranges = ranges.size # Generator::ArrayArgPlan
      ranges = ranges.to_a.to_unsafe

      # C call
      LibPango.pango_layout_line_get_x_ranges(self, start_index, end_index, ranges, n_ranges)

      # Return value handling
    end

    def index_to_x(index_ : Int32, trailing : Bool, x_pos : Int32) : Nil
      # pango_layout_line_index_to_x: (Method)
      # @x_pos: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibPango.pango_layout_line_index_to_x(self, index_, trailing, x_pos)

      # Return value handling
    end

    def is_paragraph_start : Bool
      # pango_layout_line_is_paragraph_start: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_line_is_paragraph_start(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def ref : Pango::LayoutLine
      # pango_layout_line_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_layout_line_ref(self)

      # Return value handling

      Pango::LayoutLine.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # pango_layout_line_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_layout_line_unref(self)

      # Return value handling
    end

    def x_to_index(x_pos : Int32, index_ : Int32, trailing : Int32) : Bool
      # pango_layout_line_x_to_index: (Method)
      # @index_: (out) (transfer full)
      # @trailing: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_line_x_to_index(self, x_pos, index_, trailing)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def to_unsafe
      @pointer
    end
  end
end
