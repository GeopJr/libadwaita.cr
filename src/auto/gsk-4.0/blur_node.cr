require "./render_node"

module Gsk
  # A render node applying a blur effect to its single child.
  class BlurNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_blur_node_get_type
    end

    def initialize(child : Gsk::RenderNode, radius : Float32)
      # gsk_blur_node_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGsk.gsk_blur_node_new(child, radius)
      @pointer = _retval
    end

    def child : Gsk::RenderNode
      # gsk_blur_node_get_child: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_blur_node_get_child(self)
      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    def radius : Float32
      # gsk_blur_node_get_radius: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_blur_node_get_radius(self)
      _retval
    end
  end
end
