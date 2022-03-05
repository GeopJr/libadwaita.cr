require "./draw_context"

module Gdk
  # `GdkGLContext` is an object representing a platform-specific
  # OpenGL draw context.
  #
  # `GdkGLContext`s are created for a surface using
  # [method@Gdk.Surface.create_gl_context], and the context will match
  # the characteristics of the surface.
  #
  # A `GdkGLContext` is not tied to any particular normal framebuffer.
  # For instance, it cannot draw to the surface back buffer. The GDK
  # repaint system is in full control of the painting to that. Instead,
  # you can create render buffers or textures and use [func@cairo_draw_from_gl]
  # in the draw function of your widget to draw them. Then GDK will handle
  # the integration of your rendering with that of other widgets.
  #
  # Support for `GdkGLContext` is platform-specific and context creation
  # can fail, returning %NULL context.
  #
  # A `GdkGLContext` has to be made "current" in order to start using
  # it, otherwise any OpenGL call will be ignored.
  #
  # ## Creating a new OpenGL context
  #
  # In order to create a new `GdkGLContext` instance you need a `GdkSurface`,
  # which you typically get during the realize call of a widget.
  #
  # A `GdkGLContext` is not realized until either [method@Gdk.GLContext.make_current]
  # or [method@Gdk.GLContext.realize] is called. It is possible to specify
  # details of the GL context like the OpenGL version to be used, or whether
  # the GL context should have extra state validation enabled after calling
  # [method@Gdk.Surface.create_gl_context] by calling [method@Gdk.GLContext.realize].
  # If the realization fails you have the option to change the settings of
  # the `GdkGLContext` and try again.
  #
  # ## Using a GdkGLContext
  #
  # You will need to make the `GdkGLContext` the current context before issuing
  # OpenGL calls; the system sends OpenGL commands to whichever context is current.
  # It is possible to have multiple contexts, so you always need to ensure that
  # the one which you want to draw with is the current one before issuing commands:
  #
  # ```c
  # gdk_gl_context_make_current (context);
  # ```
  #
  # You can now perform your drawing using OpenGL commands.
  #
  # You can check which `GdkGLContext` is the current one by using
  # [func@Gdk.GLContext.get_current]; you can also unset any `GdkGLContext`
  # that is currently set by calling [func@Gdk.GLContext.clear_current].
  class GLContext < DrawContext
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, allowed_apis : Gdk::GLAPI? = nil, api : Gdk::GLAPI? = nil, display : Gdk::Display? = nil, shared_context : Gdk::GLContext? = nil, surface : Gdk::Surface? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if allowed_apis
        (_names.to_unsafe + _n).value = "allowed-apis".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allowed_apis)
        _n += 1
      end
      if api
        (_names.to_unsafe + _n).value = "api".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, api)
        _n += 1
      end
      if display
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if shared_context
        (_names.to_unsafe + _n).value = "shared-context".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, shared_context)
        _n += 1
      end
      if surface
        (_names.to_unsafe + _n).value = "surface".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, surface)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(GLContext.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_gl_context_get_type
    end

    def allowed_apis=(value : Gdk::GLAPI) : Gdk::GLAPI
      unsafe_value = value

      LibGObject.g_object_set(self, "allowed-apis", unsafe_value, Pointer(Void).null)
      value
    end

    def allowed_apis : Gdk::GLAPI
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "allowed-apis", pointerof(value), Pointer(Void).null)
      Gdk::GLAPI.from_value(value)
    end

    def api : Gdk::GLAPI
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "api", pointerof(value), Pointer(Void).null)
      Gdk::GLAPI.from_value(value)
    end

    def shared_context=(value : Gdk::GLContext?) : Gdk::GLContext?
      unsafe_value = value

      LibGObject.g_object_set(self, "shared-context", unsafe_value, Pointer(Void).null)
      value
    end

    def shared_context : Gdk::GLContext?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "shared-context", pointerof(value), Pointer(Void).null)
      Gdk::GLContext.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def self.clear_current : Nil
      # gdk_gl_context_clear_current: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_gl_context_clear_current

      # Return value handling
    end

    def self.current : Gdk::GLContext?
      # gdk_gl_context_get_current: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_gl_context_get_current

      # Return value handling
      Gdk::GLContext.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def allowed_apis : Gdk::GLAPI
      # gdk_gl_context_get_allowed_apis: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_gl_context_get_allowed_apis(self)

      # Return value handling
      Gdk::GLAPI.from_value(_retval)
    end

    def api : Gdk::GLAPI
      # gdk_gl_context_get_api: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_gl_context_get_api(self)

      # Return value handling
      Gdk::GLAPI.from_value(_retval)
    end

    def debug_enabled : Bool
      # gdk_gl_context_get_debug_enabled: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_gl_context_get_debug_enabled(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def display : Gdk::Display?
      # gdk_gl_context_get_display: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_gl_context_get_display(self)

      # Return value handling
      Gdk::Display.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def forward_compatible : Bool
      # gdk_gl_context_get_forward_compatible: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_gl_context_get_forward_compatible(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def required_version(major : Int32?, minor : Int32?) : Nil
      # gdk_gl_context_get_required_version: (Method)
      # @major: (out) (transfer full) (nullable)
      # @minor: (out) (transfer full) (nullable)
      # Returns: (transfer none)

      # Handle parameters
      major = if major.nil?
                Int32.null
              else
                major.to_unsafe
              end
      minor = if minor.nil?
                Int32.null
              else
                minor.to_unsafe
              end

      # C call
      LibGdk.gdk_gl_context_get_required_version(self, major, minor)

      # Return value handling
    end

    def shared_context : Gdk::GLContext?
      # gdk_gl_context_get_shared_context: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_gl_context_get_shared_context(self)

      # Return value handling
      Gdk::GLContext.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def surface : Gdk::Surface?
      # gdk_gl_context_get_surface: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_gl_context_get_surface(self)

      # Return value handling
      Gdk::Surface.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def use_es : Bool
      # gdk_gl_context_get_use_es: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_gl_context_get_use_es(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def version(major : Int32, minor : Int32) : Nil
      # gdk_gl_context_get_version: (Method)
      # @major: (out) (transfer full)
      # @minor: (out) (transfer full)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_gl_context_get_version(self, major, minor)

      # Return value handling
    end

    def is_legacy : Bool
      # gdk_gl_context_is_legacy: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_gl_context_is_legacy(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def is_shared(other : Gdk::GLContext) : Bool
      # gdk_gl_context_is_shared: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_gl_context_is_shared(self, other)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def make_current : Nil
      # gdk_gl_context_make_current: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_gl_context_make_current(self)

      # Return value handling
    end

    def realize : Bool
      # gdk_gl_context_realize: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_gl_context_realize(self, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def allowed_apis=(apis : Gdk::GLAPI) : Nil
      # gdk_gl_context_set_allowed_apis: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_gl_context_set_allowed_apis(self, apis)

      # Return value handling
    end

    def debug_enabled=(enabled : Bool) : Nil
      # gdk_gl_context_set_debug_enabled: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_gl_context_set_debug_enabled(self, enabled)

      # Return value handling
    end

    def forward_compatible=(compatible : Bool) : Nil
      # gdk_gl_context_set_forward_compatible: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_gl_context_set_forward_compatible(self, compatible)

      # Return value handling
    end

    def set_required_version(major : Int32, minor : Int32) : Nil
      # gdk_gl_context_set_required_version: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_gl_context_set_required_version(self, major, minor)

      # Return value handling
    end

    def use_es=(use_es : Int32) : Nil
      # gdk_gl_context_set_use_es: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_gl_context_set_use_es(self, use_es)

      # Return value handling
    end
  end
end
