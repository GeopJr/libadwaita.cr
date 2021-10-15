require "./render_node"

module Gsk
  # A render node for an inset shadow.
  class InsetShadowNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_inset_shadow_node_get_type
    end

    def initialize(outline : Gsk::RoundedRect, color : Gdk::RGBA, dx : Float32, dy : Float32, spread : Float32, blur_radius : Float32)
      # gsk_inset_shadow_node_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGsk.gsk_inset_shadow_node_new(outline, color, dx, dy, spread, blur_radius)
      @pointer = _retval
    end

    def blur_radius : Float32
      # gsk_inset_shadow_node_get_blur_radius: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_inset_shadow_node_get_blur_radius(self)
      _retval
    end

    def color : Gdk::RGBA
      # gsk_inset_shadow_node_get_color: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_inset_shadow_node_get_color(self)
      Gdk::RGBA.new(_retval, GICrystal::Transfer::None)
    end

    def dx : Float32
      # gsk_inset_shadow_node_get_dx: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_inset_shadow_node_get_dx(self)
      _retval
    end

    def dy : Float32
      # gsk_inset_shadow_node_get_dy: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_inset_shadow_node_get_dy(self)
      _retval
    end

    def outline : Gsk::RoundedRect
      # gsk_inset_shadow_node_get_outline: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_inset_shadow_node_get_outline(self)
      Gsk::RoundedRect.new(_retval, GICrystal::Transfer::None)
    end

    def spread : Float32
      # gsk_inset_shadow_node_get_spread: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_inset_shadow_node_get_spread(self)
      _retval
    end
  end
end
