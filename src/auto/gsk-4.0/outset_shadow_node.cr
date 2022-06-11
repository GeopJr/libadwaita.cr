require "./render_node"

module Gsk
  # A render node for an outset shadow.
  @[GObject::GeneratedWrapper]
  class OutsetShadowNode < RenderNode
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(OutsetShadowNode, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `OutsetShadowNode`.
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
      LibGsk.gsk_outset_shadow_node_get_type
    end

    # Creates a `GskRenderNode` that will render an outset shadow
    # around the box given by @outline.
    def self.new(outline : Gsk::RoundedRect, color : Gdk::RGBA, dx : Float32, dy : Float32, spread : Float32, blur_radius : Float32) : self
      # gsk_outset_shadow_node_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_outset_shadow_node_new(outline, color, dx, dy, spread, blur_radius)

      # Return value handling

      Gsk::OutsetShadowNode.new(_retval, GICrystal::Transfer::Full)
    end

    # Retrieves the blur radius of the shadow.
    def blur_radius : Float32
      # gsk_outset_shadow_node_get_blur_radius: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_outset_shadow_node_get_blur_radius(@pointer)

      # Return value handling

      _retval
    end

    # Retrieves the color of the outset shadow.
    def color : Gdk::RGBA
      # gsk_outset_shadow_node_get_color: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_outset_shadow_node_get_color(@pointer)

      # Return value handling

      Gdk::RGBA.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the horizontal offset of the outset shadow.
    def dx : Float32
      # gsk_outset_shadow_node_get_dx: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_outset_shadow_node_get_dx(@pointer)

      # Return value handling

      _retval
    end

    # Retrieves the vertical offset of the outset shadow.
    def dy : Float32
      # gsk_outset_shadow_node_get_dy: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_outset_shadow_node_get_dy(@pointer)

      # Return value handling

      _retval
    end

    # Retrieves the outline rectangle of the outset shadow.
    def outline : Gsk::RoundedRect
      # gsk_outset_shadow_node_get_outline: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_outset_shadow_node_get_outline(@pointer)

      # Return value handling

      Gsk::RoundedRect.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves how much the shadow spreads outwards.
    def spread : Float32
      # gsk_outset_shadow_node_get_spread: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_outset_shadow_node_get_spread(@pointer)

      # Return value handling

      _retval
    end
  end
end
