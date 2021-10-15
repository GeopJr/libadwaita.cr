require "./render_node"

module Gsk
  # A render node for a repeating linear gradient.
  class RepeatingLinearGradientNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_repeating_linear_gradient_node_get_type
    end

    def initialize(bounds : Graphene::Rect, start : Graphene::Point, end _end : Graphene::Point, color_stops : Enumerable(Gsk::ColorStop))
      # gsk_repeating_linear_gradient_node_new: (Constructor)
      # @color_stops: (array length=n_color_stops element-type Interface)
      # Returns: (transfer full)

      n_color_stops = color_stops.size
      color_stops = color_stops.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGsk.gsk_repeating_linear_gradient_node_new(bounds, start, _end, color_stops, n_color_stops)
      @pointer = _retval
    end
  end
end
