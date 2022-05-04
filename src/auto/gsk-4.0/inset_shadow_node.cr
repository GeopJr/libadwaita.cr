require "./render_node"

module Gsk
  # A render node for an inset shadow.
  @[GObject::GeneratedWrapper]
  class InsetShadowNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGsk::InsetShadowNode), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_inset_shadow_node_get_type
    end

    # Creates a `GskRenderNode` that will render an inset shadow
    # into the box given by @outline.
    def initialize(outline : Gsk::RoundedRect, color : Gdk::RGBA, dx : Float32, dy : Float32, spread : Float32, blur_radius : Float32)
      # gsk_inset_shadow_node_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_inset_shadow_node_new(outline, color, dx, dy, spread, blur_radius)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Retrieves the blur radius to apply to the shadow.
    def blur_radius : Float32
      # gsk_inset_shadow_node_get_blur_radius: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_inset_shadow_node_get_blur_radius(self)

      # Return value handling

      _retval
    end

    # Retrieves the color of the inset shadow.
    def color : Gdk::RGBA
      # gsk_inset_shadow_node_get_color: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_inset_shadow_node_get_color(self)

      # Return value handling

      Gdk::RGBA.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the horizontal offset of the inset shadow.
    def dx : Float32
      # gsk_inset_shadow_node_get_dx: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_inset_shadow_node_get_dx(self)

      # Return value handling

      _retval
    end

    # Retrieves the vertical offset of the inset shadow.
    def dy : Float32
      # gsk_inset_shadow_node_get_dy: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_inset_shadow_node_get_dy(self)

      # Return value handling

      _retval
    end

    # Retrieves the outline rectangle of the inset shadow.
    def outline : Gsk::RoundedRect
      # gsk_inset_shadow_node_get_outline: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_inset_shadow_node_get_outline(self)

      # Return value handling

      Gsk::RoundedRect.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves how much the shadow spreads inwards.
    def spread : Float32
      # gsk_inset_shadow_node_get_spread: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_inset_shadow_node_get_spread(self)

      # Return value handling

      _retval
    end
  end
end
