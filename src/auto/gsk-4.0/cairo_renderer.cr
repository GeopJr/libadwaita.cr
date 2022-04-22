require "./renderer"

module Gsk
  # A GSK renderer that is using cairo.
  #
  # Since it is using cairo, this renderer cannot support
  # 3D transformations.
  @[GObject::GeneratedWrapper]
  class CairoRenderer < Renderer
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGsk::CairoRendererClass), class_init,
        sizeof(LibGsk::CairoRenderer), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, realized : Bool? = nil, surface : Gdk::Surface? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !realized.nil?
        (_names.to_unsafe + _n).value = "realized".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, realized)
        _n += 1
      end
      if !surface.nil?
        (_names.to_unsafe + _n).value = "surface".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, surface)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(CairoRenderer.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_cairo_renderer_get_type
    end

    # Creates a new Cairo renderer.
    #
    # The Cairo renderer is the fallback renderer drawing in ways similar
    # to how GTK 3 drew its content. Its primary use is as comparison tool.
    #
    # The Cairo renderer is incomplete. It cannot render 3D transformed
    # content and will instead render an error marker. Its usage should be
    # avoided.
    def initialize
      # gsk_cairo_renderer_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_cairo_renderer_new

      # Return value handling

      @pointer = _retval
    end
  end
end
