require "./render_node"

module Gsk
  # A render node for a conic gradient.
  @[GObject::GeneratedWrapper]
  class ConicGradientNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGsk::ConicGradientNode), instance_init, 0)
    end

    GICrystal.define_new_method(ConicGradientNode, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ConicGradientNode`.
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
      LibGsk.gsk_conic_gradient_node_get_type
    end

    # Creates a `GskRenderNode` that draws a conic gradient.
    #
    # The conic gradient
    # starts around @center in the direction of @rotation. A rotation of 0 means
    # that the gradient points up. Color stops are then added clockwise.
    def initialize(bounds : Graphene::Rect, center : Graphene::Point, rotation : Float32, color_stops : Enumerable(Gsk::ColorStop))
      # gsk_conic_gradient_node_new: (Constructor)
      # @color_stops: (array length=n_color_stops element-type Interface)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      n_color_stops = color_stops.size # Generator::ArrayArgPlan
      color_stops = color_stops.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGsk.gsk_conic_gradient_node_new(bounds, center, rotation, color_stops, n_color_stops)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Retrieves the angle for the gradient in radians, normalized in [0, 2 * PI].
    #
    # The angle is starting at the top and going clockwise, as expressed
    # in the css specification:
    #
    #     angle = 90 - gsk_conic_gradient_node_get_rotation()
    def angle : Float32
      # gsk_conic_gradient_node_get_angle: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_conic_gradient_node_get_angle(@pointer)

      # Return value handling

      _retval
    end

    # Retrieves the center pointer for the gradient.
    def center : Graphene::Point
      # gsk_conic_gradient_node_get_center: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_conic_gradient_node_get_center(@pointer)

      # Return value handling

      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the color stops in the gradient.
    def color_stops : Enumerable(Gsk::ColorStop)
      # gsk_conic_gradient_node_get_color_stops: (Method)
      # @n_stops: (out) (transfer full) (optional)
      # Returns: (transfer none) (array length=n_stops element-type Interface)

      # Generator::OutArgUsedInReturnPlan
      n_stops = 0_u64
      # C call
      _retval = LibGsk.gsk_conic_gradient_node_get_color_stops(@pointer, pointerof(n_stops))

      # Return value handling

      GICrystal.transfer_array(_retval, n_stops, GICrystal::Transfer::None)
    end

    # Retrieves the number of color stops in the gradient.
    def n_color_stops : UInt64
      # gsk_conic_gradient_node_get_n_color_stops: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_conic_gradient_node_get_n_color_stops(@pointer)

      # Return value handling

      _retval
    end

    # Retrieves the rotation for the gradient in degrees.
    def rotation : Float32
      # gsk_conic_gradient_node_get_rotation: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_conic_gradient_node_get_rotation(@pointer)

      # Return value handling

      _retval
    end
  end
end
