require "./draw_context"

module Gdk
  # `GdkCairoContext` is an object representing the platform-specific
  # draw context.
  #
  # `GdkCairoContext`s are created for a surface using
  # [method@Gdk.Surface.create_cairo_context], and the context
  # can then be used to draw on that surface.
  class CairoContext < DrawContext
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, display : Gdk::Display? = nil, surface : Gdk::Surface? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if display
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if surface
        (_names.to_unsafe + _n).value = "surface".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, surface)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(CairoContext.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_cairo_context_get_type
    end

    def cairo_create : Cairo::Context?
      # gdk_cairo_context_cairo_create: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_cairo_context_cairo_create(self)

      # Return value handling
      Cairo::Context.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end
  end
end
