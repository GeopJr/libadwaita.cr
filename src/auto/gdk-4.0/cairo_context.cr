require "./draw_context"

module Gdk
  # `GdkCairoContext` is an object representing the platform-specific
  # draw context.
  #
  # `GdkCairoContext`s are created for a surface using
  # `Gdk::Surface#create_cairo_context`, and the context
  # can then be used to draw on that surface.
  @[GObject::GeneratedWrapper]
  class CairoContext < DrawContext
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::CairoContext), instance_init, 0)
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

    def initialize(*, display : Gdk::Display? = nil, surface : Gdk::Surface? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !display.nil?
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if !surface.nil?
        (_names.to_unsafe + _n).value = "surface".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, surface)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(CairoContext.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_cairo_context_get_type
    end

    # Retrieves a Cairo context to be used to draw on the `GdkSurface`
    # of @context.
    #
    # A call to `Gdk::DrawContext#begin_frame` with this
    # @context must have been done or this function will return %NULL.
    #
    # The returned context is guaranteed to be valid until
    # `Gdk::DrawContext#end_frame` is called.
    def cairo_create : Cairo::Context?
      # gdk_cairo_context_cairo_create: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_cairo_context_cairo_create(self)

      # Return value handling

      Cairo::Context.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end
  end
end
