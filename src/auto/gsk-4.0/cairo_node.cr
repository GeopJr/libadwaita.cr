require "./render_node"

module Gsk
  # A render node for a Cairo surface.
  class CairoNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_cairo_node_get_type
    end

    def initialize(bounds : Graphene::Rect)
      # gsk_cairo_node_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_cairo_node_new(bounds)

      # Return value handling
      @pointer = _retval
    end

    def draw_context : Cairo::Context
      # gsk_cairo_node_get_draw_context: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_cairo_node_get_draw_context(self)

      # Return value handling
      Cairo::Context.new(_retval, GICrystal::Transfer::Full)
    end

    def surface : Cairo::Surface
      # gsk_cairo_node_get_surface: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_cairo_node_get_surface(self)

      # Return value handling
      Cairo::Surface.new(_retval, GICrystal::Transfer::None)
    end
  end
end
