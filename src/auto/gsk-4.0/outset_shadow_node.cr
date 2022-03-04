require "./render_node"

module Gsk
  # A render node for an outset shadow.
  class OutsetShadowNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_outset_shadow_node_get_type
    end

    def initialize(outline : Gsk::RoundedRect, color : Gdk::RGBA, dx : Float32, dy : Float32, spread : Float32, blur_radius : Float32)
      # gsk_outset_shadow_node_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_outset_shadow_node_new(outline, color, dx, dy, spread, blur_radius)

      # Return value handling
      @pointer = _retval
    end

    def blur_radius : Float32
      # gsk_outset_shadow_node_get_blur_radius: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_outset_shadow_node_get_blur_radius(self)

      # Return value handling
      _retval
    end

    def color : Gdk::RGBA
      # gsk_outset_shadow_node_get_color: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_outset_shadow_node_get_color(self)

      # Return value handling
      Gdk::RGBA.new(_retval, GICrystal::Transfer::None)
    end

    def dx : Float32
      # gsk_outset_shadow_node_get_dx: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_outset_shadow_node_get_dx(self)

      # Return value handling
      _retval
    end

    def dy : Float32
      # gsk_outset_shadow_node_get_dy: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_outset_shadow_node_get_dy(self)

      # Return value handling
      _retval
    end

    def outline : Gsk::RoundedRect
      # gsk_outset_shadow_node_get_outline: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_outset_shadow_node_get_outline(self)

      # Return value handling
      Gsk::RoundedRect.new(_retval, GICrystal::Transfer::None)
    end

    def spread : Float32
      # gsk_outset_shadow_node_get_spread: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_outset_shadow_node_get_spread(self)

      # Return value handling
      _retval
    end
  end
end
