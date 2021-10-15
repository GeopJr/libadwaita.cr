require "./render_node"

module Gsk
  # A render node for a radial gradient.
  class RadialGradientNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_radial_gradient_node_get_type
    end

    def initialize(bounds : Graphene::Rect, center : Graphene::Point, hradius : Float32, vradius : Float32, start : Float32, end _end : Float32, color_stops : Enumerable(Gsk::ColorStop))
      # gsk_radial_gradient_node_new: (Constructor)
      # @color_stops: (array length=n_color_stops element-type Interface)
      # Returns: (transfer full)

      n_color_stops = color_stops.size
      color_stops = color_stops.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGsk.gsk_radial_gradient_node_new(bounds, center, hradius, vradius, start, _end, color_stops, n_color_stops)
      @pointer = _retval
    end

    def center : Graphene::Point
      # gsk_radial_gradient_node_get_center: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_radial_gradient_node_get_center(self)
      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end

    def color_stops : Enumerable(Gsk::ColorStop)
      # gsk_radial_gradient_node_get_color_stops: (Method)
      # @n_stops: (out) (transfer full) (optional)
      # Returns: (transfer none)

      n_stops = Pointer(UInt64).null

      _retval = LibGsk.gsk_radial_gradient_node_get_color_stops(self, n_stops)
      _retval
    end

    def end : Float32
      # gsk_radial_gradient_node_get_end: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_radial_gradient_node_get_end(self)
      _retval
    end

    def hradius : Float32
      # gsk_radial_gradient_node_get_hradius: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_radial_gradient_node_get_hradius(self)
      _retval
    end

    def n_color_stops : UInt64
      # gsk_radial_gradient_node_get_n_color_stops: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_radial_gradient_node_get_n_color_stops(self)
      _retval
    end

    def start : Float32
      # gsk_radial_gradient_node_get_start: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_radial_gradient_node_get_start(self)
      _retval
    end

    def vradius : Float32
      # gsk_radial_gradient_node_get_vradius: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_radial_gradient_node_get_vradius(self)
      _retval
    end
  end
end
