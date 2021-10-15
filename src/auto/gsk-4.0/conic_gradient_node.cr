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

      n_color_stops = color_stops.size
      color_stops = color_stops.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGsk.gsk_conic_gradient_node_new(bounds, center, rotation, color_stops, n_color_stops)
      @pointer = _retval
    end

    def angle : Float32
      # gsk_conic_gradient_node_get_angle: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_conic_gradient_node_get_angle(self)
      _retval
    end

    def center : Graphene::Point
      # gsk_conic_gradient_node_get_center: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_conic_gradient_node_get_center(self)
      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end

    def color_stops : Enumerable(Gsk::ColorStop)
      # gsk_conic_gradient_node_get_color_stops: (Method)
      # @n_stops: (out) (transfer full) (optional)
      # Returns: (transfer none)

      n_stops = Pointer(UInt64).null

      _retval = LibGsk.gsk_conic_gradient_node_get_color_stops(self, n_stops)
      _retval
    end

    def n_color_stops : UInt64
      # gsk_conic_gradient_node_get_n_color_stops: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_conic_gradient_node_get_n_color_stops(self)
      _retval
    end

    def rotation : Float32
      # gsk_conic_gradient_node_get_rotation: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_conic_gradient_node_get_rotation(self)
      _retval
    end
  end
end
