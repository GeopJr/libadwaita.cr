require "../g_object-2.0/object"

module Gsk
  # `GskRenderer` is a class that renders a scene graph defined via a
  # tree of `Gsk#RenderNode` instances.
  #
  # Typically you will use a `GskRenderer` instance to repeatedly call
  # `Gsk::Renderer#render` to update the contents of its associated
  # `Gdk#Surface`.
  #
  # It is necessary to realize a `GskRenderer` instance using
  # `Gsk::Renderer#realize` before calling `Gsk::Renderer#render`,
  # in order to create the appropriate windowing system resources needed
  # to render the scene.
  @[GObject::GeneratedWrapper]
  class Renderer < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGsk::RendererClass), class_init,
        sizeof(LibGsk::Renderer), instance_init, 0)
    end

    GICrystal.define_new_method(Renderer, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Renderer`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

      @pointer = LibGObject.g_object_new_with_properties(Renderer.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Creates an appropriate `GskRenderer` instance for the given @surface.
    #
    # If the `GSK_RENDERER` environment variable is set, GSK will
    # try that renderer first, before trying the backend-specific
    # default. The ultimate fallback is the cairo renderer.
    #
    # The renderer will be realized before it is returned.
    def self.new_for_surface(surface : Gdk::Surface) : self?
      # gsk_renderer_new_for_surface: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_renderer_new_for_surface(surface)

      # Return value handling

      Gsk::Renderer.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Retrieves the `GdkSurface` set using gsk_enderer_realize().
    #
    # If the renderer has not been realized yet, %NULL will be returned.
    def surface : Gdk::Surface?
      # gsk_renderer_get_surface: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_renderer_get_surface(@pointer)

      # Return value handling

      Gdk::Surface.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Checks whether the @renderer is realized or not.
    def is_realized : Bool
      # gsk_renderer_is_realized: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_renderer_is_realized(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Creates the resources needed by the @renderer to render the scene
    # graph.
    #
    # Since GTK 4.6, the surface may be `NULL`, which allows using
    # renderers without having to create a surface.
    #
    # Note that it is mandatory to call `Gsk::Renderer#unrealize` before
    # destroying the renderer.
    def realize(surface : Gdk::Surface?) : Bool
      # gsk_renderer_realize: (Method | Throws)
      # @surface: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      surface = if surface.nil?
                  Pointer(Void).null
                else
                  surface.to_unsafe
                end

      # C call
      _retval = LibGsk.gsk_renderer_realize(@pointer, surface, pointerof(_error))

      # Error check
      Gsk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Renders the scene graph, described by a tree of `GskRenderNode` instances
    # to the renderer's surface,  ensuring that the given @region gets redrawn.
    #
    # If the renderer has no associated surface, this function does nothing.
    #
    # Renderers must ensure that changes of the contents given by the @root
    # node as well as the area given by @region are redrawn. They are however
    # free to not redraw any pixel outside of @region if they can guarantee that
    # it didn't change.
    #
    # The @renderer will acquire a reference on the `GskRenderNode` tree while
    # the rendering is in progress.
    def render(root : Gsk::RenderNode, region : Cairo::Region?) : Nil
      # gsk_renderer_render: (Method)
      # @region: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      region = if region.nil?
                 Pointer(Void).null
               else
                 region.to_unsafe
               end

      # C call
      LibGsk.gsk_renderer_render(@pointer, root, region)

      # Return value handling
    end

    # Renders the scene graph, described by a tree of `GskRenderNode` instances,
    # to a `GdkTexture`.
    #
    # The @renderer will acquire a reference on the `GskRenderNode` tree while
    # the rendering is in progress.
    #
    # If you want to apply any transformations to @root, you should put it into a
    # transform node and pass that node instead.
    def render_texture(root : Gsk::RenderNode, viewport : Graphene::Rect?) : Gdk::Texture
      # gsk_renderer_render_texture: (Method)
      # @viewport: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      viewport = if viewport.nil?
                   Pointer(Void).null
                 else
                   viewport.to_unsafe
                 end

      # C call
      _retval = LibGsk.gsk_renderer_render_texture(@pointer, root, viewport)

      # Return value handling

      Gdk::Texture.new(_retval, GICrystal::Transfer::Full)
    end

    # Releases all the resources created by gsk_renderer_realize().
    def unrealize : Nil
      # gsk_renderer_unrealize: (Method)
      # Returns: (transfer none)

      # C call
      LibGsk.gsk_renderer_unrealize(@pointer)

      # Return value handling
    end
  end
end
