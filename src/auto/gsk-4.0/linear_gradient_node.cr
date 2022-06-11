require "./render_node"

module Gsk
  # A render node for a linear gradient.
  @[GObject::GeneratedWrapper]
  class LinearGradientNode < RenderNode
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(LinearGradientNode, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `LinearGradientNode`.
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
      LibGsk.gsk_linear_gradient_node_get_type
    end

    # Creates a `GskRenderNode` that will create a linear gradient from the given
    # points and color stops, and render that into the area given by @bounds.
    def self.new(bounds : Graphene::Rect, start : Graphene::Point, end _end : Graphene::Point, color_stops : Enumerable(Gsk::ColorStop)) : self
      # gsk_linear_gradient_node_new: (Constructor)
      # @color_stops: (array length=n_color_stops element-type Interface)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      n_color_stops = color_stops.size # Generator::ArrayArgPlan
      color_stops = color_stops.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGsk.gsk_linear_gradient_node_new(bounds, start, _end, color_stops, n_color_stops)

      # Return value handling

      Gsk::LinearGradientNode.new(_retval, GICrystal::Transfer::Full)
    end

    # Retrieves the color stops in the gradient.
    def color_stops : Enumerable(Gsk::ColorStop)
      # gsk_linear_gradient_node_get_color_stops: (Method)
      # @n_stops: (out) (transfer full) (optional)
      # Returns: (transfer none) (array length=n_stops element-type Interface)

      # Generator::OutArgUsedInReturnPlan
      n_stops = 0_u64
      # C call
      _retval = LibGsk.gsk_linear_gradient_node_get_color_stops(@pointer, pointerof(n_stops))

      # Return value handling

      GICrystal.transfer_array(_retval, n_stops, GICrystal::Transfer::None)
    end

    # Retrieves the final point of the linear gradient.
    def end : Graphene::Point
      # gsk_linear_gradient_node_get_end: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_linear_gradient_node_get_end(@pointer)

      # Return value handling

      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the number of color stops in the gradient.
    def n_color_stops : UInt64
      # gsk_linear_gradient_node_get_n_color_stops: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_linear_gradient_node_get_n_color_stops(@pointer)

      # Return value handling

      _retval
    end

    # Retrieves the initial point of the linear gradient.
    def start : Graphene::Point
      # gsk_linear_gradient_node_get_start: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_linear_gradient_node_get_start(@pointer)

      # Return value handling

      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end
  end
end
