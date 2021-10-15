require "./render_node"

module Gsk
  # A render node cross fading between two child nodes.
  class CrossFadeNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_cross_fade_node_get_type
    end

    def initialize(start : Gsk::RenderNode, end _end : Gsk::RenderNode, progress : Float32)
      # gsk_cross_fade_node_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGsk.gsk_cross_fade_node_new(start, _end, progress)
      @pointer = _retval
    end

    def end_child : Gsk::RenderNode
      # gsk_cross_fade_node_get_end_child: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_cross_fade_node_get_end_child(self)
      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    def progress : Float32
      # gsk_cross_fade_node_get_progress: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_cross_fade_node_get_progress(self)
      _retval
    end

    def start_child : Gsk::RenderNode
      # gsk_cross_fade_node_get_start_child: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_cross_fade_node_get_start_child(self)
      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end
  end
end
