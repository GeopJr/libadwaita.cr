module Pango
  # A `PangoLayoutIter` can be used to iterate over the visual
  # extents of a `PangoLayout`.
  #
  # To obtain a `PangoLayoutIter`, use `Pango::Layout#iter`.
  #
  # The `PangoLayoutIter` structure is opaque, and has no user-visible fields.
  class LayoutIter
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(LayoutIter.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(LayoutIter.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibPango::LayoutIter)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_layout_iter_get_type
    end

    def at_last_line : Bool
      # pango_layout_iter_at_last_line: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_iter_at_last_line(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def copy : Pango::LayoutIter?
      # pango_layout_iter_copy: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_layout_iter_copy(self)

      # Return value handling

      Pango::LayoutIter.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def free : Nil
      # pango_layout_iter_free: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_layout_iter_free(self)

      # Return value handling
    end

    def baseline : Int32
      # pango_layout_iter_get_baseline: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_iter_get_baseline(self)

      # Return value handling

      _retval
    end

    def char_extents : Pango::Rectangle
      # pango_layout_iter_get_char_extents: (Method)
      # @logical_rect: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      logical_rect = Pango::Rectangle.new

      # C call
      LibPango.pango_layout_iter_get_char_extents(self, logical_rect)

      # Return value handling

      logical_rect
    end

    def cluster_extents : Pango::Rectangle
      # pango_layout_iter_get_cluster_extents: (Method)
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
      LibPango.pango_layout_iter_get_cluster_extents(self, ink_rect, logical_rect)

      # Return value handling

      ink_rect
    end

    def index : Int32
      # pango_layout_iter_get_index: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_iter_get_index(self)

      # Return value handling

      _retval
    end

    def layout : Pango::Layout
      # pango_layout_iter_get_layout: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_iter_get_layout(self)

      # Return value handling

      Pango::Layout.new(_retval, GICrystal::Transfer::None)
    end

    def layout_extents : Pango::Rectangle
      # pango_layout_iter_get_layout_extents: (Method)
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
      LibPango.pango_layout_iter_get_layout_extents(self, ink_rect, logical_rect)

      # Return value handling

      ink_rect
    end

    def line : Pango::LayoutLine
      # pango_layout_iter_get_line: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_iter_get_line(self)

      # Return value handling

      Pango::LayoutLine.new(_retval, GICrystal::Transfer::None)
    end

    def line_extents : Pango::Rectangle
      # pango_layout_iter_get_line_extents: (Method)
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
      LibPango.pango_layout_iter_get_line_extents(self, ink_rect, logical_rect)

      # Return value handling

      ink_rect
    end

    def line_readonly : Pango::LayoutLine
      # pango_layout_iter_get_line_readonly: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_iter_get_line_readonly(self)

      # Return value handling

      Pango::LayoutLine.new(_retval, GICrystal::Transfer::None)
    end

    def line_yrange : Nil
      # pango_layout_iter_get_line_yrange: (Method)
      # @y0_: (out) (transfer full) (optional)
      # @y1_: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      y0_ = Pointer(Int32).null
      # Generator::OutArgUsedInReturnPlan
      y1_ = Pointer(Int32).null

      # C call
      LibPango.pango_layout_iter_get_line_yrange(self, y0_, y1_)

      # Return value handling
    end

    def run : Pango::GlyphItem?
      # pango_layout_iter_get_run: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_iter_get_run(self)

      # Return value handling

      Pango::GlyphItem.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def run_baseline : Int32
      # pango_layout_iter_get_run_baseline: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_iter_get_run_baseline(self)

      # Return value handling

      _retval
    end

    def run_extents : Pango::Rectangle
      # pango_layout_iter_get_run_extents: (Method)
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
      LibPango.pango_layout_iter_get_run_extents(self, ink_rect, logical_rect)

      # Return value handling

      ink_rect
    end

    def run_readonly : Pango::GlyphItem?
      # pango_layout_iter_get_run_readonly: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_iter_get_run_readonly(self)

      # Return value handling

      Pango::GlyphItem.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def next_char : Bool
      # pango_layout_iter_next_char: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_iter_next_char(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def next_cluster : Bool
      # pango_layout_iter_next_cluster: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_iter_next_cluster(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def next_line : Bool
      # pango_layout_iter_next_line: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_iter_next_line(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def next_run : Bool
      # pango_layout_iter_next_run: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_layout_iter_next_run(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def to_unsafe
      @pointer
    end
  end
end
