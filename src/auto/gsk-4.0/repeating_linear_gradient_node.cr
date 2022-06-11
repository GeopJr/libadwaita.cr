require "./render_node"

module Gsk
  # A render node for a repeating linear gradient.
  @[GObject::GeneratedWrapper]
  class RepeatingLinearGradientNode < RenderNode
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(RepeatingLinearGradientNode, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `RepeatingLinearGradientNode`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
    def self.new(bounds : Graphene::Rect, start : Graphene::Point, end _end : Graphene::Point, color_stops : Enumerable(Gsk::ColorStop)) : self
      # gsk_repeating_linear_gradient_node_new: (Constructor)
      # @color_stops: (array length=n_color_stops element-type Interface)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      n_color_stops = color_stops.size # Generator::ArrayArgPlan
      color_stops = color_stops.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGsk.gsk_repeating_linear_gradient_node_new(bounds, start, _end, color_stops, n_color_stops)

      # Return value handling

      Gsk::RepeatingLinearGradientNode.new(_retval, GICrystal::Transfer::Full)
    end
  end
end
