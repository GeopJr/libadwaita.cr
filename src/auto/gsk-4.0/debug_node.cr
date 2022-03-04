require "./render_node"

module Gsk
  # A render node that emits a debugging message when drawing its
  # child node.
  class DebugNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_debug_node_get_type
    end

    def initialize(child : Gsk::RenderNode, message : ::String)
      # gsk_debug_node_new: (Constructor)
      # @message: (transfer full)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_debug_node_new(child, message)

      # Return value handling
      @pointer = _retval
    end

    def child : Gsk::RenderNode
      # gsk_debug_node_get_child: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_debug_node_get_child(self)

      # Return value handling
      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    def message : ::String
      # gsk_debug_node_get_message: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_debug_node_get_message(self)

      # Return value handling
      ::String.new(_retval)
    end
  end
end
