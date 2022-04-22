require "./render_node"

module Gsk
  # A render node applying a rectangular clip to its single child node.
  @[GObject::GeneratedWrapper]
  class ClipNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGsk::ClipNode), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_clip_node_get_type
    end

    # Creates a `GskRenderNode` that will clip the @child to the area
    # given by @clip.
    def initialize(child : Gsk::RenderNode, clip : Graphene::Rect)
      # gsk_clip_node_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_clip_node_new(child, clip)

      # Return value handling

      @pointer = _retval
    end

    # Gets the child node that is getting clipped by the given @node.
    def child : Gsk::RenderNode
      # gsk_clip_node_get_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_clip_node_get_child(self)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the clip rectangle for @node.
    def clip : Graphene::Rect
      # gsk_clip_node_get_clip: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_clip_node_get_clip(self)

      # Return value handling

      Graphene::Rect.new(_retval, GICrystal::Transfer::None)
    end
  end
end
