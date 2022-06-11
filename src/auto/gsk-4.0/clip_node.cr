require "./render_node"

module Gsk
  # A render node applying a rectangular clip to its single child node.
  @[GObject::GeneratedWrapper]
  class ClipNode < RenderNode
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(ClipNode, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ClipNode`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
    def self.new(child : Gsk::RenderNode, clip : Graphene::Rect) : self
      # gsk_clip_node_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_clip_node_new(child, clip)

      # Return value handling

      Gsk::ClipNode.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the child node that is getting clipped by the given @node.
    def child : Gsk::RenderNode
      # gsk_clip_node_get_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_clip_node_get_child(@pointer)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the clip rectangle for @node.
    def clip : Graphene::Rect
      # gsk_clip_node_get_clip: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_clip_node_get_clip(@pointer)

      # Return value handling

      Graphene::Rect.new(_retval, GICrystal::Transfer::None)
    end
  end
end
