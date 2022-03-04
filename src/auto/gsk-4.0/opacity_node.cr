require "./render_node"

module Gsk
  # A render node controlling the opacity of its single child node.
  class OpacityNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_opacity_node_get_type
    end

    def initialize(child : Gsk::RenderNode, opacity : Float32)
      # gsk_opacity_node_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_opacity_node_new(child, opacity)

      # Return value handling
      @pointer = _retval
    end

    def child : Gsk::RenderNode
      # gsk_opacity_node_get_child: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_opacity_node_get_child(self)

      # Return value handling
      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    def opacity : Float32
      # gsk_opacity_node_get_opacity: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_opacity_node_get_opacity(self)

      # Return value handling
      _retval
    end
  end
end
