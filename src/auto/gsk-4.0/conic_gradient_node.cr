require "./render_node"

module Gsk
  # A render node for a conic gradient.
  class ConicGradientNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_conic_gradient_node_get_type
    end

    def initialize(bounds : Graphene::Rect, center : Graphene::Point, rotation : Float32, color_stops : Enumerable(Gsk::ColorStop))
      # gsk_conic_gradient_node_new: (Constructor)
      # @color_stops: (array length=n_color_stops element-type Interface)
      # Returns: (transfer full)

      # Handle parameters
      n_color_stops = color_stops.size
      color_stops = color_stops.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGsk.gsk_conic_gradient_node_new(bounds, center, rotation, color_stops, n_color_stops)

      # Return value handling
      @pointer = _retval
    end

    def angle : Float32
      # gsk_conic_gradient_node_get_angle: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_conic_gradient_node_get_angle(self)

      # Return value handling
      _retval
    end

    def center : Graphene::Point
      # gsk_conic_gradient_node_get_center: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_conic_gradient_node_get_center(self)

      # Return value handling
      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end

    def color_stops : Enumerable(Gsk::ColorStop)
      # gsk_conic_gradient_node_get_color_stops: (Method)
      # @n_stops: (out) (transfer full) (optional)
      # Returns: (transfer none) (array length=n_stops element-type Interface)

      # Handle parameters
      n_stops = 0_u64

      # C call
      _retval = LibGsk.gsk_conic_gradient_node_get_color_stops(self, pointerof(n_stops))

      # Return value handling
      GICrystal.transfer_array(_retval, n_stops, GICrystal::Transfer::None)
    end

    def n_color_stops : UInt64
      # gsk_conic_gradient_node_get_n_color_stops: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_conic_gradient_node_get_n_color_stops(self)

      # Return value handling
      _retval
    end

    def rotation : Float32
      # gsk_conic_gradient_node_get_rotation: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_conic_gradient_node_get_rotation(self)

      # Return value handling
      _retval
    end
  end
end
