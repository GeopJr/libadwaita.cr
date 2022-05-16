require "./render_node"

module Gsk
  # A render node for a `GdkTexture`.
  @[GObject::GeneratedWrapper]
  class TextureNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGsk::TextureNode), instance_init, 0)
    end

    GICrystal.define_new_method(TextureNode, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `TextureNode`.
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
      LibGsk.gsk_texture_node_get_type
    end

    # Creates a `GskRenderNode` that will render the given
    # @texture into the area given by @bounds.
    def initialize(texture : Gdk::Texture, bounds : Graphene::Rect)
      # gsk_texture_node_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_texture_node_new(texture, bounds)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Retrieves the `GdkTexture` used when creating this `GskRenderNode`.
    def texture : Gdk::Texture
      # gsk_texture_node_get_texture: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_texture_node_get_texture(@pointer)

      # Return value handling

      Gdk::Texture.new(_retval, GICrystal::Transfer::None)
    end
  end
end
