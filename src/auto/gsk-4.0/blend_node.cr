require "./render_node"

module Gsk
  # A render node applying a blending function between its two child nodes.
  class BlendNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_blend_node_get_type
    end

    def initialize(bottom : Gsk::RenderNode, top : Gsk::RenderNode, blend_mode : Gsk::BlendMode)
      # gsk_blend_node_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_blend_node_new(bottom, top, blend_mode)

      # Return value handling
      @pointer = _retval
    end

    def blend_mode : Gsk::BlendMode
      # gsk_blend_node_get_blend_mode: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_blend_node_get_blend_mode(self)

      # Return value handling
      Gsk::BlendMode.from_value(_retval)
    end

    def bottom_child : Gsk::RenderNode
      # gsk_blend_node_get_bottom_child: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_blend_node_get_bottom_child(self)

      # Return value handling
      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    def top_child : Gsk::RenderNode
      # gsk_blend_node_get_top_child: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_blend_node_get_top_child(self)

      # Return value handling
      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end
  end
end
