require "../g_object-2.0/object"

module Gsk
  # `GskRenderer` is a class that renders a scene graph defined via a
  # tree of [class@Gsk.RenderNode] instances.
  #
  # Typically you will use a `GskRenderer` instance to repeatedly call
  # [method@Gsk.Renderer.render] to update the contents of its associated
  # [class@Gdk.Surface].
  #
  # It is necessary to realize a `GskRenderer` instance using
  # [method@Gsk.Renderer.realize] before calling [method@Gsk.Renderer.render],
  # in order to create the appropriate windowing system resources needed
  # to render the scene.
  class Renderer < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, realized : Bool? = nil, surface : Gdk::Surface? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if realized
        (_names.to_unsafe + _n).value = "realized".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, realized)
        _n += 1
      end
      if surface
        (_names.to_unsafe + _n).value = "surface".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, surface)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Renderer.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_renderer_get_type
    end

    def realized? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "realized", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def surface : Gdk::Surface?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "surface", pointerof(value), Pointer(Void).null)
      Gdk::Surface.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def self.new_for_surface(surface : Gdk::Surface) : self?
      # gsk_renderer_new_for_surface: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_renderer_new_for_surface(surface)

      # Return value handling
      Gsk::Renderer.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def surface : Gdk::Surface?
      # gsk_renderer_get_surface: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_renderer_get_surface(self)

      # Return value handling
      Gdk::Surface.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def is_realized : Bool
      # gsk_renderer_is_realized: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_renderer_is_realized(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def realize(surface : Gdk::Surface) : Bool
      # gsk_renderer_realize: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_renderer_realize(self, surface, pointerof(_error))

      # Error check
      Gsk.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def render(root : Gsk::RenderNode, region : Cairo::Region?) : Nil
      # gsk_renderer_render: (Method)
      # @region: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      region = if region.nil?
                 Pointer(Void).null
               else
                 region.to_unsafe
               end

      # C call
      LibGsk.gsk_renderer_render(self, root, region)

      # Return value handling
    end

    def render_texture(root : Gsk::RenderNode, viewport : Graphene::Rect?) : Gdk::Texture
      # gsk_renderer_render_texture: (Method)
      # @viewport: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      viewport = if viewport.nil?
                   Pointer(Void).null
                 else
                   viewport.to_unsafe
                 end

      # C call
      _retval = LibGsk.gsk_renderer_render_texture(self, root, viewport)

      # Return value handling
      Gdk::Texture.new(_retval, GICrystal::Transfer::Full)
    end

    def unrealize : Nil
      # gsk_renderer_unrealize: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGsk.gsk_renderer_unrealize(self)

      # Return value handling
    end
  end
end
