require "./render_node"

module Gsk
  # A render node applying a `GskTransform` to its single child node.
  class TransformNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_transform_node_get_type
    end

    def initialize(child : Gsk::RenderNode, transform : Gsk::Transform)
      # gsk_transform_node_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_transform_node_new(child, transform)

      # Return value handling
      @pointer = _retval
    end

    def child : Gsk::RenderNode
      # gsk_transform_node_get_child: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_transform_node_get_child(self)

      # Return value handling
      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    def transform : Gsk::Transform
      # gsk_transform_node_get_transform: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_transform_node_get_transform(self)

      # Return value handling
      Gsk::Transform.new(_retval, GICrystal::Transfer::None)
    end
  end
end
