require "./render_node"

module Gsk
  # A render node applying a rectangular clip to its single child node.
  class ClipNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_clip_node_get_type
    end

    def initialize(child : Gsk::RenderNode, clip : Graphene::Rect)
      # gsk_clip_node_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGsk.gsk_clip_node_new(child, clip)
      @pointer = _retval
    end

    def child : Gsk::RenderNode
      # gsk_clip_node_get_child: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_clip_node_get_child(self)
      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    def clip : Graphene::Rect
      # gsk_clip_node_get_clip: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_clip_node_get_clip(self)
      Graphene::Rect.new(_retval, GICrystal::Transfer::None)
    end
  end
end
