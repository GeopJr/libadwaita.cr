require "./render_node"

module Gsk
  # A render node drawing one or more shadows behind its single child node.
  class ShadowNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_shadow_node_get_type
    end

    def initialize(child : Gsk::RenderNode, shadows : Enumerable(Gsk::Shadow))
      # gsk_shadow_node_new: (Constructor)
      # @shadows: (array length=n_shadows element-type Interface)
      # Returns: (transfer full)

      n_shadows = shadows.size
      shadows = shadows.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGsk.gsk_shadow_node_new(child, shadows, n_shadows)
      @pointer = _retval
    end

    def child : Gsk::RenderNode
      # gsk_shadow_node_get_child: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_shadow_node_get_child(self)
      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    def n_shadows : UInt64
      # gsk_shadow_node_get_n_shadows: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_shadow_node_get_n_shadows(self)
      _retval
    end

    def shadow(i : UInt64) : Gsk::Shadow
      # gsk_shadow_node_get_shadow: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_shadow_node_get_shadow(self, i)
      Gsk::Shadow.new(_retval, GICrystal::Transfer::None)
    end
  end
end