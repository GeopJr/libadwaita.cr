require "./render_node"

module Gsk
  # A render node controlling the opacity of its single child node.
  @[GObject::GeneratedWrapper]
  class OpacityNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGsk::OpacityNode), instance_init, 0)
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
    def initialize(child : Gsk::RenderNode, opacity : Float32)
      # gsk_opacity_node_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_opacity_node_new(child, opacity)

      # Return value handling

      @pointer = _retval
    end

    # Gets the child node that is getting opacityed by the given @node.
    def child : Gsk::RenderNode
      # gsk_opacity_node_get_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_opacity_node_get_child(self)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the transparency factor for an opacity node.
    def opacity : Float32
      # gsk_opacity_node_get_opacity: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_opacity_node_get_opacity(self)

      # Return value handling

      _retval
    end
  end
end
