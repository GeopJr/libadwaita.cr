require "./render_node"

module Gsk
  # A render node for a linear gradient.
  class LinearGradientNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_linear_gradient_node_get_type
    end

    def initialize(bounds : Graphene::Rect, start : Graphene::Point, end _end : Graphene::Point, color_stops : Enumerable(Gsk::ColorStop))
      # gsk_linear_gradient_node_new: (Constructor)
      # @color_stops: (array length=n_color_stops element-type Interface)
      # Returns: (transfer full)

      # Handle parameters
      n_color_stops = color_stops.size
      color_stops = color_stops.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGsk.gsk_linear_gradient_node_new(bounds, start, _end, color_stops, n_color_stops)

      # Return value handling
      @pointer = _retval
    end

    def color_stops : Enumerable(Gsk::ColorStop)
      # gsk_linear_gradient_node_get_color_stops: (Method)
      # @n_stops: (out) (transfer full) (optional)
      # Returns: (transfer none) (array length=n_stops element-type Interface)

      # Handle parameters
      n_stops = 0_u64

      # C call
      _retval = LibGsk.gsk_linear_gradient_node_get_color_stops(self, pointerof(n_stops))

      # Return value handling
      GICrystal.transfer_array(_retval, n_stops, GICrystal::Transfer::None)
    end

    def end : Graphene::Point
      # gsk_linear_gradient_node_get_end: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_linear_gradient_node_get_end(self)

      # Return value handling
      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end

    def n_color_stops : UInt64
      # gsk_linear_gradient_node_get_n_color_stops: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_linear_gradient_node_get_n_color_stops(self)

      # Return value handling
      _retval
    end

    def start : Graphene::Point
      # gsk_linear_gradient_node_get_start: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_linear_gradient_node_get_start(self)

      # Return value handling
      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end
  end
end