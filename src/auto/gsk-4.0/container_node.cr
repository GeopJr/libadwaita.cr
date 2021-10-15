require "./render_node"

module Gsk
  # A render node that can contain other render nodes.
  class ContainerNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_container_node_get_type
    end

    def initialize(children : Enumerable(Gsk::RenderNode))
      # gsk_container_node_new: (Constructor)
      # @children: (array length=n_children element-type Interface)
      # Returns: (transfer full)

      n_children = children.size
      children = children.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGsk.gsk_container_node_new(children, n_children)
      @pointer = _retval
    end

    def initialize(*children : Gsk::RenderNode)
      initialize(children)
    end

    def child(idx : UInt32) : Gsk::RenderNode
      # gsk_container_node_get_child: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_container_node_get_child(self, idx)
      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    def n_children : UInt32
      # gsk_container_node_get_n_children: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_container_node_get_n_children(self)
      _retval
    end
  end
end
