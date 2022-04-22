require "./render_node"

module Gsk
  # A render node for a Cairo surface.
  @[GObject::GeneratedWrapper]
  class CairoNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGsk::CairoNode), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_cairo_node_get_type
    end

    # Creates a `GskRenderNode` that will render a cairo surface
    # into the area given by @bounds.
    #
    # You can draw to the cairo surface using `Gsk::CairoNode#draw_context`.
    def initialize(bounds : Graphene::Rect)
      # gsk_cairo_node_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_cairo_node_new(bounds)

      # Return value handling

      @pointer = _retval
    end

    # Creates a Cairo context for drawing using the surface associated
    # to the render node.
    #
    # If no surface exists yet, a surface will be created optimized for
    # rendering to @renderer.
    def draw_context : Cairo::Context
      # gsk_cairo_node_get_draw_context: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_cairo_node_get_draw_context(self)

      # Return value handling

      Cairo::Context.new(_retval, GICrystal::Transfer::Full)
    end

    # Retrieves the Cairo surface used by the render node.
    def surface : Cairo::Surface
      # gsk_cairo_node_get_surface: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_cairo_node_get_surface(self)

      # Return value handling

      Cairo::Surface.new(_retval, GICrystal::Transfer::None)
    end
  end
end
