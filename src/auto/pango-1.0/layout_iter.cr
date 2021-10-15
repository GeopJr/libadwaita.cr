module Pango
  # A `PangoLayoutIter` can be used to iterate over the visual
  # extents of a `PangoLayout`.
  #
  # To obtain a `PangoLayoutIter`, use [method@Pango.Layout.get_iter].
  #
  # The `PangoLayoutIter` structure is opaque, and has no user-visible fields.
  class LayoutIter
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(LayoutIter.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(LayoutIter.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_layout_iter_get_type
    end

    def at_last_line : Bool
      # pango_layout_iter_at_last_line: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_iter_at_last_line(self)
      GICrystal.to_bool(_retval)
    end

    def copy : Pango::LayoutIter?
      # pango_layout_iter_copy: (Method)
      # Returns: (transfer full)

      _retval = LibPango.pango_layout_iter_copy(self)
      Pango::LayoutIter.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def free : Nil
      # pango_layout_iter_free: (Method)
      # Returns: (transfer none)

      LibPango.pango_layout_iter_free(self)
    end

    def baseline : Int32
      # pango_layout_iter_get_baseline: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_iter_get_baseline(self)
      _retval
    end

    def char_extents : Pango::Rectangle
      # pango_layout_iter_get_char_extents: (Method)
      # @logical_rect: (out) (caller-allocates)
      # Returns: (transfer none)

      logical_rect = Pango::Rectangle.new

      LibPango.pango_layout_iter_get_char_extents(self, logical_rect)
      logical_rect
    end

    def cluster_extents : Pango::Rectangle
      # pango_layout_iter_get_cluster_extents: (Method)
      # @ink_rect: (out) (caller-allocates) (optional)
      # @logical_rect: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      ink_rect = Pointer(Void).null
      logical_rect = Pointer(Void).null
      ink_rect = Pango::Rectangle.new

      LibPango.pango_layout_iter_get_cluster_extents(self, ink_rect, logical_rect)
      ink_rect
    end

    def index : Int32
      # pango_layout_iter_get_index: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_iter_get_index(self)
      _retval
    end

    def layout : Pango::Layout
      # pango_layout_iter_get_layout: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_iter_get_layout(self)
      Pango::Layout.new(_retval, GICrystal::Transfer::None)
    end

    def layout_extents : Pango::Rectangle
      # pango_layout_iter_get_layout_extents: (Method)
      # @ink_rect: (out) (caller-allocates) (optional)
      # @logical_rect: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      ink_rect = Pointer(Void).null
      logical_rect = Pointer(Void).null
      ink_rect = Pango::Rectangle.new

      LibPango.pango_layout_iter_get_layout_extents(self, ink_rect, logical_rect)
      ink_rect
    end

    def line : Pango::LayoutLine
      # pango_layout_iter_get_line: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_iter_get_line(self)
      Pango::LayoutLine.new(_retval, GICrystal::Transfer::None)
    end

    def line_extents : Pango::Rectangle
      # pango_layout_iter_get_line_extents: (Method)
      # @ink_rect: (out) (caller-allocates) (optional)
      # @logical_rect: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      ink_rect = Pointer(Void).null
      logical_rect = Pointer(Void).null
      ink_rect = Pango::Rectangle.new

      LibPango.pango_layout_iter_get_line_extents(self, ink_rect, logical_rect)
      ink_rect
    end

    def line_readonly : Pango::LayoutLine
      # pango_layout_iter_get_line_readonly: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_iter_get_line_readonly(self)
      Pango::LayoutLine.new(_retval, GICrystal::Transfer::None)
    end

    def line_yrange : Nil
      # pango_layout_iter_get_line_yrange: (Method)
      # @y0_: (out) (transfer full) (optional)
      # @y1_: (out) (transfer full) (optional)
      # Returns: (transfer none)

      y0_ = Pointer(Int32).null
      y1_ = Pointer(Int32).null

      LibPango.pango_layout_iter_get_line_yrange(self, y0_, y1_)
    end

    def run : Pango::GlyphItem?
      # pango_layout_iter_get_run: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_iter_get_run(self)
      Pango::GlyphItem.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def run_extents : Pango::Rectangle
      # pango_layout_iter_get_run_extents: (Method)
      # @ink_rect: (out) (caller-allocates) (optional)
      # @logical_rect: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      ink_rect = Pointer(Void).null
      logical_rect = Pointer(Void).null
      ink_rect = Pango::Rectangle.new

      LibPango.pango_layout_iter_get_run_extents(self, ink_rect, logical_rect)
      ink_rect
    end

    def run_readonly : Pango::GlyphItem?
      # pango_layout_iter_get_run_readonly: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_iter_get_run_readonly(self)
      Pango::GlyphItem.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def next_char : Bool
      # pango_layout_iter_next_char: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_iter_next_char(self)
      GICrystal.to_bool(_retval)
    end

    def next_cluster : Bool
      # pango_layout_iter_next_cluster: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_iter_next_cluster(self)
      GICrystal.to_bool(_retval)
    end

    def next_line : Bool
      # pango_layout_iter_next_line: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_iter_next_line(self)
      GICrystal.to_bool(_retval)
    end

    def next_run : Bool
      # pango_layout_iter_next_run: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_layout_iter_next_run(self)
      GICrystal.to_bool(_retval)
    end

    def to_unsafe
      @pointer
    end
  end
end
