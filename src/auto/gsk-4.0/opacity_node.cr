require "./render_node"

module Gsk
  # A render node controlling the opacity of its single child node.
  @[GObject::GeneratedWrapper]
  class OpacityNode < RenderNode
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(OpacityNode, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `OpacityNode`.
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
      LibGsk.gsk_opacity_node_get_type
    end

    # Creates a `GskRenderNode` that will drawn the @child with reduced
    # @opacity.
    def self.new(child : Gsk::RenderNode, opacity : Float32) : self
      # gsk_opacity_node_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_opacity_node_new(child, opacity)

      # Return value handling

      Gsk::OpacityNode.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the child node that is getting opacityed by the given @node.
    def child : Gsk::RenderNode
      # gsk_opacity_node_get_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_opacity_node_get_child(@pointer)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the transparency factor for an opacity node.
    def opacity : Float32
      # gsk_opacity_node_get_opacity: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_opacity_node_get_opacity(@pointer)

      # Return value handling

      _retval
    end
  end
end
