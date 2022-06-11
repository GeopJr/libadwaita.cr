require "./render_node"

module Gsk
  # A render node for a repeating radial gradient.
  @[GObject::GeneratedWrapper]
  class RepeatingRadialGradientNode < RenderNode
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(RepeatingRadialGradientNode, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `RepeatingRadialGradientNode`.
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
      LibGsk.gsk_repeating_radial_gradient_node_get_type
    end

    # Creates a `GskRenderNode` that draws a repeating radial gradient.
    #
    # The radial gradient starts around @center. The size of the gradient
    # is dictated by @hradius in horizontal orientation and by @vradius
    # in vertial orientation.
    def self.new(bounds : Graphene::Rect, center : Graphene::Point, hradius : Float32, vradius : Float32, start : Float32, end _end : Float32, color_stops : Enumerable(Gsk::ColorStop)) : self
      # gsk_repeating_radial_gradient_node_new: (Constructor)
      # @color_stops: (array length=n_color_stops element-type Interface)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      n_color_stops = color_stops.size # Generator::ArrayArgPlan
      color_stops = color_stops.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGsk.gsk_repeating_radial_gradient_node_new(bounds, center, hradius, vradius, start, _end, color_stops, n_color_stops)

      # Return value handling

      Gsk::RepeatingRadialGradientNode.new(_retval, GICrystal::Transfer::Full)
    end
  end
end
