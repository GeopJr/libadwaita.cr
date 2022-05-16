require "./render_node"

module Gsk
  # A render node applying a blur effect to its single child.
  @[GObject::GeneratedWrapper]
  class BlurNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGsk::BlurNode), instance_init, 0)
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
    def initialize(child : Gsk::RenderNode, radius : Float32)
      # gsk_blur_node_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_blur_node_new(child, radius)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
