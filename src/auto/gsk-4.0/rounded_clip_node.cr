require "./render_node"

module Gsk
  # A render node applying a rounded rectangle clip to its single child.
  @[GObject::GeneratedWrapper]
  class RoundedClipNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGsk::RoundedClipNode), instance_init, 0)
    end

    GICrystal.define_new_method(RoundedClipNode, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `RoundedClipNode`.
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
      LibGsk.gsk_rounded_clip_node_get_type
    end

    # Creates a `GskRenderNode` that will clip the @child to the area
    # given by @clip.
    def initialize(child : Gsk::RenderNode, clip : Gsk::RoundedRect)
      # gsk_rounded_clip_node_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_rounded_clip_node_new(child, clip)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the child node that is getting clipped by the given @node.
    def child : Gsk::RenderNode
      # gsk_rounded_clip_node_get_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_rounded_clip_node_get_child(@pointer)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the rounded rectangle used to clip the contents of the @node.
    def clip : Gsk::RoundedRect
      # gsk_rounded_clip_node_get_clip: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_rounded_clip_node_get_clip(@pointer)

      # Return value handling

      Gsk::RoundedRect.new(_retval, GICrystal::Transfer::None)
    end
  end
end
