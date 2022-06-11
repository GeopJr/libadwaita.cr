require "./render_node"

module Gsk
  # A render node applying a blending function between its two child nodes.
  @[GObject::GeneratedWrapper]
  class BlendNode < RenderNode
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(BlendNode, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `BlendNode`.
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
      LibGsk.gsk_blend_node_get_type
    end

    # Creates a `GskRenderNode` that will use @blend_mode to blend the @top
    # node onto the @bottom node.
    def self.new(bottom : Gsk::RenderNode, top : Gsk::RenderNode, blend_mode : Gsk::BlendMode) : self
      # gsk_blend_node_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_blend_node_new(bottom, top, blend_mode)

      # Return value handling

      Gsk::BlendNode.new(_retval, GICrystal::Transfer::Full)
    end

    # Retrieves the blend mode used by @node.
    def blend_mode : Gsk::BlendMode
      # gsk_blend_node_get_blend_mode: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_blend_node_get_blend_mode(@pointer)

      # Return value handling

      Gsk::BlendMode.new(_retval)
    end

    # Retrieves the bottom `GskRenderNode` child of the @node.
    def bottom_child : Gsk::RenderNode
      # gsk_blend_node_get_bottom_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_blend_node_get_bottom_child(@pointer)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the top `GskRenderNode` child of the @node.
    def top_child : Gsk::RenderNode
      # gsk_blend_node_get_top_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_blend_node_get_top_child(@pointer)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end
  end
end
