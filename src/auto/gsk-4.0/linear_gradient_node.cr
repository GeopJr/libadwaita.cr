require "./render_node"

module Gsk
  # A render node for a linear gradient.
  @[GObject::GeneratedWrapper]
  class LinearGradientNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGsk::LinearGradientNode), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
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
    def initialize(bounds : Graphene::Rect, start : Graphene::Point, end _end : Graphene::Point, color_stops : Enumerable(Gsk::ColorStop))
      # gsk_linear_gradient_node_new: (Constructor)
      # @color_stops: (array length=n_color_stops element-type Interface)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      n_color_stops = color_stops.size # Generator::ArrayArgPlan
      color_stops = color_stops.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGsk.gsk_linear_gradient_node_new(bounds, start, _end, color_stops, n_color_stops)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Retrieves the color stops in the gradient.
    def color_stops : Enumerable(Gsk::ColorStop)
      # gsk_linear_gradient_node_get_color_stops: (Method)
      # @n_stops: (out) (transfer full) (optional)
      # Returns: (transfer none) (array length=n_stops element-type Interface)

      # Generator::OutArgUsedInReturnPlan
      n_stops = 0_u64
      # C call
      _retval = LibGsk.gsk_linear_gradient_node_get_color_stops(self, pointerof(n_stops))

      # Return value handling

      GICrystal.transfer_array(_retval, n_stops, GICrystal::Transfer::None)
    end

    # Retrieves the final point of the linear gradient.
    def end : Graphene::Point
      # gsk_linear_gradient_node_get_end: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_linear_gradient_node_get_end(self)

      # Return value handling

      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the number of color stops in the gradient.
    def n_color_stops : UInt64
      # gsk_linear_gradient_node_get_n_color_stops: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_linear_gradient_node_get_n_color_stops(self)

      # Return value handling

      _retval
    end

    # Retrieves the initial point of the linear gradient.
    def start : Graphene::Point
      # gsk_linear_gradient_node_get_start: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_linear_gradient_node_get_start(self)

      # Return value handling

      Graphene::Point.new(_retval, GICrystal::Transfer::None)
    end
  end
end
