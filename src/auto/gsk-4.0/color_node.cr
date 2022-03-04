require "./render_node"

module Gsk
  # A render node for a solid color.
  class ColorNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_color_node_get_type
    end

    def initialize(rgba : Gdk::RGBA, bounds : Graphene::Rect)
      # gsk_color_node_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_color_node_new(rgba, bounds)

      # Return value handling
      @pointer = _retval
    end

    def color : Gdk::RGBA
      # gsk_color_node_get_color: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_color_node_get_color(self)

      # Return value handling
      Gdk::RGBA.new(_retval, GICrystal::Transfer::None)
    end
  end
end
