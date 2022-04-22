require "./render_node"

module Gsk
  # A render node repeating its single child node.
  @[GObject::GeneratedWrapper]
  class RepeatNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGsk::RepeatNode), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_repeat_node_get_type
    end

    # Creates a `GskRenderNode` that will repeat the drawing of @child across
    # the given @bounds.
    def initialize(bounds : Graphene::Rect, child : Gsk::RenderNode, child_bounds : Graphene::Rect?)
      # gsk_repeat_node_new: (Constructor)
      # @child_bounds: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      child_bounds = if child_bounds.nil?
                       Pointer(Void).null
                     else
                       child_bounds.to_unsafe
                     end

      # C call
      _retval = LibGsk.gsk_repeat_node_new(bounds, child, child_bounds)

      # Return value handling

      @pointer = _retval
    end

    # Retrieves the child of @node.
    def child : Gsk::RenderNode
      # gsk_repeat_node_get_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_repeat_node_get_child(self)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the bounding rectangle of the child of @node.
    def child_bounds : Graphene::Rect
      # gsk_repeat_node_get_child_bounds: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_repeat_node_get_child_bounds(self)

      # Return value handling

      Graphene::Rect.new(_retval, GICrystal::Transfer::None)
    end
  end
end
