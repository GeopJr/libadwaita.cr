require "./render_node"

module Gsk
  # A render node for a repeating linear gradient.
  @[GObject::GeneratedWrapper]
  class RepeatingLinearGradientNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGsk::RepeatingLinearGradientNode), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_repeating_linear_gradient_node_get_type
    end

    # Creates a `GskRenderNode` that will create a repeating linear gradient
    # from the given points and color stops, and render that into the area
    # given by @bounds.
    def initialize(bounds : Graphene::Rect, start : Graphene::Point, end _end : Graphene::Point, color_stops : Enumerable(Gsk::ColorStop))
      # gsk_repeating_linear_gradient_node_new: (Constructor)
      # @color_stops: (array length=n_color_stops element-type Interface)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      n_color_stops = color_stops.size
      # Generator::ArrayArgPlan
      color_stops = color_stops.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGsk.gsk_repeating_linear_gradient_node_new(bounds, start, _end, color_stops, n_color_stops)

      # Return value handling

      @pointer = _retval
    end
  end
end
