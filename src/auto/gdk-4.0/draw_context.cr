require "../g_object-2.0/object"

module Gdk
  # Base class for objects implementing different rendering methods.
  #
  # `GdkDrawContext` is the base object used by contexts implementing different
  # rendering methods, such as [class@Gdk.CairoContext] or [class@Gdk.GLContext].
  # It provides shared functionality between those contexts.
  #
  # You will always interact with one of those subclasses.
  #
  # A `GdkDrawContext` is always associated with a single toplevel surface.
  class DrawContext < GObject::Object
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

      @pointer = LibGObject.g_object_new_with_properties(DrawContext.g_type, _n, _names, _values)
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

    def begin_frame(region : Cairo::Region) : Nil
      # gdk_draw_context_begin_frame: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_draw_context_begin_frame(self, region)
    end

    def end_frame : Nil
      # gdk_draw_context_end_frame: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_draw_context_end_frame(self)
    end

    def display : Gdk::Display?
      # gdk_draw_context_get_display: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_draw_context_get_display(self)
      Gdk::Display.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def frame_region : Cairo::Region?
      # gdk_draw_context_get_frame_region: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_draw_context_get_frame_region(self)
      Cairo::Region.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def surface : Gdk::Surface?
      # gdk_draw_context_get_surface: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_draw_context_get_surface(self)
      Gdk::Surface.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def is_in_frame : Bool
      # gdk_draw_context_is_in_frame: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_draw_context_is_in_frame(self)
      GICrystal.to_bool(_retval)
    end
  end
end
