require "./render_node"

module Gsk
  # A render node applying a blur effect to its single child.
  @[GObject::GeneratedWrapper]
  class BlurNode < RenderNode
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(BlurNode, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `BlurNode`.
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
      LibGsk.gsk_blur_node_get_type
    end

    # Creates a render node that blurs the child.
    def self.new(child : Gsk::RenderNode, radius : Float32) : self
      # gsk_blur_node_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_blur_node_new(child, radius)

      # Return value handling

      Gsk::BlurNode.new(_retval, GICrystal::Transfer::Full)
    end

    # Retrieves the child `GskRenderNode` of the blur @node.
    def child : Gsk::RenderNode
      # gsk_blur_node_get_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_blur_node_get_child(@pointer)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the blur radius of the @node.
    def radius : Float32
      # gsk_blur_node_get_radius: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_blur_node_get_radius(@pointer)

      # Return value handling

      _retval
    end
  end
end
