require "./render_node"

module Gsk
  # A render node applying a blending function between its two child nodes.
  @[GObject::GeneratedWrapper]
  class BlendNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGsk::BlendNode), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_blend_node_get_type
    end

    # Creates a `GskRenderNode` that will use @blend_mode to blend the @top
    # node onto the @bottom node.
    def initialize(bottom : Gsk::RenderNode, top : Gsk::RenderNode, blend_mode : Gsk::BlendMode)
      # gsk_blend_node_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_blend_node_new(bottom, top, blend_mode)

      # Return value handling

      @pointer = _retval
    end

    # Retrieves the blend mode used by @node.
    def blend_mode : Gsk::BlendMode
      # gsk_blend_node_get_blend_mode: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_blend_node_get_blend_mode(self)

      # Return value handling

      Gsk::BlendMode.new(_retval)
    end

    # Retrieves the bottom `GskRenderNode` child of the @node.
    def bottom_child : Gsk::RenderNode
      # gsk_blend_node_get_bottom_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_blend_node_get_bottom_child(self)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the top `GskRenderNode` child of the @node.
    def top_child : Gsk::RenderNode
      # gsk_blend_node_get_top_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_blend_node_get_top_child(self)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end
  end
end
