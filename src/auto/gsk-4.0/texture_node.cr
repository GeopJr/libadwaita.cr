require "./render_node"

module Gsk
  # A render node for a `GdkTexture`.
  class TextureNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_texture_node_get_type
    end

    def initialize(texture : Gdk::Texture, bounds : Graphene::Rect)
      # gsk_texture_node_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_texture_node_new(texture, bounds)

      # Return value handling
      @pointer = _retval
    end

    def texture : Gdk::Texture
      # gsk_texture_node_get_texture: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_texture_node_get_texture(self)

      # Return value handling
      Gdk::Texture.new(_retval, GICrystal::Transfer::None)
    end
  end
end
