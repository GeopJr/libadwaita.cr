require "./render_node"

module Gsk
  # A render node for a border.
  class BorderNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_border_node_get_type
    end

    def initialize(outline : Gsk::RoundedRect, border_width : Enumerable(Float32), border_color : Enumerable(Gdk::RGBA))
      # gsk_border_node_new: (Constructor)
      # @border_width: (array fixed-size=4 element-type Float)
      # @border_color: (array fixed-size=4 element-type Interface)
      # Returns: (transfer full)

      border_width = border_width.to_a.to_unsafe

      border_color = border_color.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGsk.gsk_border_node_new(outline, border_width, border_color)
      @pointer = _retval
    end

    def colors : Gdk::RGBA
      # gsk_border_node_get_colors: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_border_node_get_colors(self)
      Gdk::RGBA.new(_retval, GICrystal::Transfer::None)
    end

    def outline : Gsk::RoundedRect
      # gsk_border_node_get_outline: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_border_node_get_outline(self)
      Gsk::RoundedRect.new(_retval, GICrystal::Transfer::None)
    end

    def widths : Enumerable(Float32)
      # gsk_border_node_get_widths: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_border_node_get_widths(self)
      _retval
    end
  end
end
