require "../g_object-2.0/object"

module Gdk
  # Base class for objects implementing different rendering methods.
  #
  # `GdkDrawContext` is the base object used by contexts implementing different
  # rendering methods, such as `Gdk#CairoContext` or `Gdk#GLContext`.
  # It provides shared functionality between those contexts.
  #
  # You will always interact with one of those subclasses.
  #
  # A `GdkDrawContext` is always associated with a single toplevel surface.
  @[GObject::GeneratedWrapper]
  class DrawContext < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::DrawContext), instance_init, 0)
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

      @pointer = LibGObject.g_object_new_with_properties(DrawContext.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_draw_context_get_type
    end

    def display=(value : Gdk::Display?) : Gdk::Display?
      unsafe_value = value

      LibGObject.g_object_set(self, "display", unsafe_value, Pointer(Void).null)
      value
    end

    def display : Gdk::Display?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "display", pointerof(value), Pointer(Void).null)
      Gdk::Display.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def surface=(value : Gdk::Surface?) : Gdk::Surface?
      unsafe_value = value

      LibGObject.g_object_set(self, "surface", unsafe_value, Pointer(Void).null)
      value
    end

    def surface : Gdk::Surface?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "surface", pointerof(value), Pointer(Void).null)
      Gdk::Surface.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Indicates that you are beginning the process of redrawing @region
    # on the @context's surface.
    #
    # Calling this function begins a drawing operation using @context on the
    # surface that @context was created from. The actual requirements and
    # guarantees for the drawing operation vary for different implementations
    # of drawing, so a `Gdk#CairoContext` and a `Gdk#GLContext`
    # need to be treated differently.
    #
    # A call to this function is a requirement for drawing and must be
    # followed by a call to `Gdk::DrawContext#end_frame`, which will
    # complete the drawing operation and ensure the contents become visible
    # on screen.
    #
    # Note that the @region passed to this function is the minimum region that
    # needs to be drawn and depending on implementation, windowing system and
    # hardware in use, it might be necessary to draw a larger region. Drawing
    # implementation must use `Gdk::DrawContext#frame_region` to
    # query the region that must be drawn.
    #
    # When using GTK, the widget system automatically places calls to
    # gdk_draw_context_begin_frame() and gdk_draw_context_end_frame() via the
    # use of `Gsk#Renderer`s, so application code does not need to call
    # these functions explicitly.
    def begin_frame(region : Cairo::Region) : Nil
      # gdk_draw_context_begin_frame: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_draw_context_begin_frame(self, region)

      # Return value handling
    end

    # Ends a drawing operation started with gdk_draw_context_begin_frame().
    #
    # This makes the drawing available on screen.
    # See `Gdk::DrawContext#begin_frame` for more details about drawing.
    #
    # When using a `Gdk#GLContext`, this function may call `glFlush()`
    # implicitly before returning; it is not recommended to call `glFlush()`
    # explicitly before calling this function.
    def end_frame : Nil
      # gdk_draw_context_end_frame: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_draw_context_end_frame(self)

      # Return value handling
    end

    # Retrieves the `GdkDisplay` the @context is created for
    def display : Gdk::Display?
      # gdk_draw_context_get_display: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_draw_context_get_display(self)

      # Return value handling

      Gdk::Display.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Retrieves the region that is currently being repainted.
    #
    # After a call to `Gdk::DrawContext#begin_frame` this function will
    # return a union of the region passed to that function and the area of the
    # surface that the @context determined needs to be repainted.
    #
    # If @context is not in between calls to `Gdk::DrawContext#begin_frame`
    # and `Gdk::DrawContext#end_frame`, %NULL will be returned.
    def frame_region : Cairo::Region?
      # gdk_draw_context_get_frame_region: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_draw_context_get_frame_region(self)

      # Return value handling

      Cairo::Region.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Retrieves the surface that @context is bound to.
    def surface : Gdk::Surface?
      # gdk_draw_context_get_surface: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_draw_context_get_surface(self)

      # Return value handling

      Gdk::Surface.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns %TRUE if @context is in the process of drawing to its surface.
    #
    # This is the case between calls to `Gdk::DrawContext#begin_frame`
    # and `Gdk::DrawContext#end_frame`. In this situation, drawing commands
    # may be effecting the contents of the @context's surface.
    def is_in_frame : Bool
      # gdk_draw_context_is_in_frame: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_draw_context_is_in_frame(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
