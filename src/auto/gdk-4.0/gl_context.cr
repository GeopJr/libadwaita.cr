require "./draw_context"

module Gdk
  # `GdkGLContext` is an object representing a platform-specific
  # OpenGL draw context.
  #
  # `GdkGLContext`s are created for a surface using
  # `Gdk::Surface#create_gl_context`, and the context will match
  # the characteristics of the surface.
  #
  # A `GdkGLContext` is not tied to any particular normal framebuffer.
  # For instance, it cannot draw to the surface back buffer. The GDK
  # repaint system is in full control of the painting to that. Instead,
  # you can create render buffers or textures and use `#cairo_draw_from_gl`
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
  # A `GdkGLContext` is not realized until either `Gdk::GLContext#make_current`
  # or `Gdk::GLContext#realize` is called. It is possible to specify
  # details of the GL context like the OpenGL version to be used, or whether
  # the GL context should have extra state validation enabled after calling
  # `Gdk::Surface#create_gl_context` by calling `Gdk::GLContext#realize`.
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
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # gdk_gl_context_make_current (context);
  # ```
  #
  # You can now perform your drawing using OpenGL commands.
  #
  # You can check which `GdkGLContext` is the current one by using
  # `Gdk::GLContext#current`; you can also unset any `GdkGLContext`
  # that is currently set by calling `Gdk::GLContext#clear_current`.
  @[GObject::GeneratedWrapper]
  class GLContext < DrawContext
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::GLContext), instance_init, 0)
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

    def initialize(*, allowed_apis : Gdk::GLAPI? = nil, api : Gdk::GLAPI? = nil, display : Gdk::Display? = nil, shared_context : Gdk::GLContext? = nil, surface : Gdk::Surface? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if !allowed_apis.nil?
        (_names.to_unsafe + _n).value = "allowed-apis".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allowed_apis)
        _n += 1
      end
      if !api.nil?
        (_names.to_unsafe + _n).value = "api".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, api)
        _n += 1
      end
      if !display.nil?
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if !shared_context.nil?
        (_names.to_unsafe + _n).value = "shared-context".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, shared_context)
        _n += 1
      end
      if !surface.nil?
        (_names.to_unsafe + _n).value = "surface".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, surface)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(GLContext.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      Gdk::GLAPI.new(value)
    end

    def api : Gdk::GLAPI
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "api", pointerof(value), Pointer(Void).null)
      Gdk::GLAPI.new(value)
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

    # Clears the current `GdkGLContext`.
    #
    # Any OpenGL call after this function returns will be ignored
    # until `Gdk::GLContext#make_current` is called.
    def self.clear_current : Nil
      # gdk_gl_context_clear_current: (None)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_gl_context_clear_current

      # Return value handling
    end

    # Retrieves the current `GdkGLContext`.
    def self.current : Gdk::GLContext?
      # gdk_gl_context_get_current: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_gl_context_get_current

      # Return value handling

      Gdk::GLContext.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the allowed APIs set via gdk_gl_context_set_allowed_apis().
    def allowed_apis : Gdk::GLAPI
      # gdk_gl_context_get_allowed_apis: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_gl_context_get_allowed_apis(self)

      # Return value handling

      Gdk::GLAPI.new(_retval)
    end

    # Gets the API currently in use.
    #
    # If the renderer has not been realized yet, 0 is returned.
    def api : Gdk::GLAPI
      # gdk_gl_context_get_api: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_gl_context_get_api(self)

      # Return value handling

      Gdk::GLAPI.new(_retval)
    end

    # Retrieves whether the context is doing extra validations and runtime checking.
    #
    # See `Gdk::GLContext#debug_enabled=`.
    def debug_enabled : Bool
      # gdk_gl_context_get_debug_enabled: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_gl_context_get_debug_enabled(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves the display the @context is created for
    def display : Gdk::Display?
      # gdk_gl_context_get_display: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_gl_context_get_display(self)

      # Return value handling

      Gdk::Display.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Retrieves whether the context is forward-compatible.
    #
    # See `Gdk::GLContext#forward_compatible=`.
    def forward_compatible : Bool
      # gdk_gl_context_get_forward_compatible: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_gl_context_get_forward_compatible(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves required OpenGL version.
    #
    # See `Gdk::GLContext#required_version=`.
    def required_version(major : Int32?, minor : Int32?) : Nil
      # gdk_gl_context_get_required_version: (Method)
      # @major: (out) (transfer full) (nullable)
      # @minor: (out) (transfer full) (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      major = if major.nil?
                Int32.null
              else
                major.to_unsafe
              end
      # Generator::NullableArrayPlan
      minor = if minor.nil?
                Int32.null
              else
                minor.to_unsafe
              end

      # C call
      LibGdk.gdk_gl_context_get_required_version(self, major, minor)

      # Return value handling
    end

    # Used to retrieves the `GdkGLContext` that this @context share data with.
    #
    # As many contexts can share data now and no single shared context exists
    # anymore, this function has been deprecated and now always returns %NULL.
    def shared_context : Gdk::GLContext?
      # gdk_gl_context_get_shared_context: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_gl_context_get_shared_context(self)

      # Return value handling

      Gdk::GLContext.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Retrieves the surface used by the @context.
    def surface : Gdk::Surface?
      # gdk_gl_context_get_surface: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_gl_context_get_surface(self)

      # Return value handling

      Gdk::Surface.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Checks whether the @context is using an OpenGL or OpenGL ES profile.
    def use_es : Bool
      # gdk_gl_context_get_use_es: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_gl_context_get_use_es(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves the OpenGL version of the @context.
    #
    # The @context must be realized prior to calling this function.
    def version(major : Int32, minor : Int32) : Nil
      # gdk_gl_context_get_version: (Method)
      # @major: (out) (transfer full)
      # @minor: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_gl_context_get_version(self, major, minor)

      # Return value handling
    end

    # Whether the `GdkGLContext` is in legacy mode or not.
    #
    # The `GdkGLContext` must be realized before calling this function.
    #
    # When realizing a GL context, GDK will try to use the OpenGL 3.2 core
    # profile; this profile removes all the OpenGL API that was deprecated
    # prior to the 3.2 version of the specification. If the realization is
    # successful, this function will return %FALSE.
    #
    # If the underlying OpenGL implementation does not support core profiles,
    # GDK will fall back to a pre-3.2 compatibility profile, and this function
    # will return %TRUE.
    #
    # You can use the value returned by this function to decide which kind
    # of OpenGL API to use, or whether to do extension discovery, or what
    # kind of shader programs to load.
    def is_legacy : Bool
      # gdk_gl_context_is_legacy: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_gl_context_is_legacy(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks if the two GL contexts can share resources.
    #
    # When they can, the texture IDs from @other can be used in @self. This
    # is particularly useful when passing `GdkGLTexture` objects between
    # different contexts.
    #
    # Contexts created for the same display with the same properties will
    # always be compatible, even if they are created for different surfaces.
    # For other contexts it depends on the GL backend.
    #
    # Both contexts must be realized for this check to succeed. If either one
    # is not, this function will return %FALSE.
    def is_shared(other : Gdk::GLContext) : Bool
      # gdk_gl_context_is_shared: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_gl_context_is_shared(self, other)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Makes the @context the current one.
    def make_current : Nil
      # gdk_gl_context_make_current: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_gl_context_make_current(self)

      # Return value handling
    end

    # Realizes the given `GdkGLContext`.
    #
    # It is safe to call this function on a realized `GdkGLContext`.
    def realize : Bool
      # gdk_gl_context_realize: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdk.gdk_gl_context_realize(self, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the allowed APIs. When gdk_gl_context_realize() is called, only the
    # allowed APIs will be tried. If you set this to 0, realizing will always fail.
    #
    # If you set it on a realized context, the property will not have any effect.
    # It is only relevant during gdk_gl_context_realize().
    #
    # By default, all APIs are allowed.
    def allowed_apis=(apis : Gdk::GLAPI) : Nil
      # gdk_gl_context_set_allowed_apis: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_gl_context_set_allowed_apis(self, apis)

      # Return value handling
    end

    # Sets whether the `GdkGLContext` should perform extra validations and
    # runtime checking.
    #
    # This is useful during development, but has additional overhead.
    #
    # The `GdkGLContext` must not be realized or made current prior to
    # calling this function.
    def debug_enabled=(enabled : Bool) : Nil
      # gdk_gl_context_set_debug_enabled: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_gl_context_set_debug_enabled(self, enabled)

      # Return value handling
    end

    # Sets whether the `GdkGLContext` should be forward-compatible.
    #
    # Forward-compatible contexts must not support OpenGL functionality that
    # has been marked as deprecated in the requested version; non-forward
    # compatible contexts, on the other hand, must support both deprecated and
    # non deprecated functionality.
    #
    # The `GdkGLContext` must not be realized or made current prior to calling
    # this function.
    def forward_compatible=(compatible : Bool) : Nil
      # gdk_gl_context_set_forward_compatible: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_gl_context_set_forward_compatible(self, compatible)

      # Return value handling
    end

    # Sets the major and minor version of OpenGL to request.
    #
    # Setting @major and @minor to zero will use the default values.
    #
    # The `GdkGLContext` must not be realized or made current prior to calling
    # this function.
    def set_required_version(major : Int32, minor : Int32) : Nil
      # gdk_gl_context_set_required_version: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_gl_context_set_required_version(self, major, minor)

      # Return value handling
    end

    # Requests that GDK create an OpenGL ES context instead of an OpenGL one.
    #
    # Not all platforms support OpenGL ES.
    #
    # The @context must not have been realized.
    #
    # By default, GDK will attempt to automatically detect whether the
    # underlying GL implementation is OpenGL or OpenGL ES once the @context
    # is realized.
    #
    # You should check the return value of `Gdk::GLContext#use_es`
    # after calling `Gdk::GLContext#realize` to decide whether to use
    # the OpenGL or OpenGL ES API, extensions, or shaders.
    def use_es=(use_es : Int32) : Nil
      # gdk_gl_context_set_use_es: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_gl_context_set_use_es(self, use_es)

      # Return value handling
    end
  end
end
