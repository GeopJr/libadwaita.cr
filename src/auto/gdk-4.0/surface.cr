require "../g_object-2.0/object"

module Gdk
  # A `GdkSurface` is a rectangular region on the screen.
  #
  # It’s a low-level object, used to implement high-level objects
  # such as `Gtk#Window` or `Gtk#Dialog` in GTK.
  #
  # The surfaces you see in practice are either `Gdk#Toplevel` or
  # `Gdk#Popup`, and those interfaces provide much of the required
  # API to interact with these surfaces. Other, more specialized surface
  # types exist, but you will rarely interact with them directly.
  @[GObject::GeneratedWrapper]
  class Surface < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGdk::SurfaceClass), class_init,
        sizeof(LibGdk::Surface), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, cursor : Gdk::Cursor? = nil, display : Gdk::Display? = nil, frame_clock : Gdk::FrameClock? = nil, height : Int32? = nil, mapped : Bool? = nil, scale_factor : Int32? = nil, width : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[7]
      _values = StaticArray(LibGObject::Value, 7).new(LibGObject::Value.new)
      _n = 0

      if !cursor.nil?
        (_names.to_unsafe + _n).value = "cursor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor)
        _n += 1
      end
      if !display.nil?
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if !frame_clock.nil?
        (_names.to_unsafe + _n).value = "frame-clock".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, frame_clock)
        _n += 1
      end
      if !height.nil?
        (_names.to_unsafe + _n).value = "height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height)
        _n += 1
      end
      if !mapped.nil?
        (_names.to_unsafe + _n).value = "mapped".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mapped)
        _n += 1
      end
      if !scale_factor.nil?
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if !width.nil?
        (_names.to_unsafe + _n).value = "width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Surface.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_surface_get_type
    end

    def cursor=(value : Gdk::Cursor?) : Gdk::Cursor?
      unsafe_value = value

      LibGObject.g_object_set(self, "cursor", unsafe_value, Pointer(Void).null)
      value
    end

    def cursor : Gdk::Cursor?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "cursor", pointerof(value), Pointer(Void).null)
      Gdk::Cursor.new(value, GICrystal::Transfer::None) unless value.null?
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

    def frame_clock=(value : Gdk::FrameClock?) : Gdk::FrameClock?
      unsafe_value = value

      LibGObject.g_object_set(self, "frame-clock", unsafe_value, Pointer(Void).null)
      value
    end

    def frame_clock : Gdk::FrameClock?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "frame-clock", pointerof(value), Pointer(Void).null)
      Gdk::FrameClock.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def height : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "height", pointerof(value), Pointer(Void).null)
      value
    end

    def mapped? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "mapped", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def scale_factor : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "scale-factor", pointerof(value), Pointer(Void).null)
      value
    end

    def width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "width", pointerof(value), Pointer(Void).null)
      value
    end

    # Create a new popup surface.
    #
    # The surface will be attached to @parent and can be positioned
    # relative to it using `Gdk::Popup#present`.
    def self.new_popup(parent : Gdk::Surface, autohide : Bool) : self
      # gdk_surface_new_popup: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_surface_new_popup(parent, autohide)

      # Return value handling

      Gdk::Surface.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new toplevel surface.
    def self.new_toplevel(display : Gdk::Display) : self
      # gdk_surface_new_toplevel: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_surface_new_toplevel(display)

      # Return value handling

      Gdk::Surface.new(_retval, GICrystal::Transfer::Full)
    end

    # Emits a short beep associated to @surface.
    #
    # If the display of @surface does not support per-surface beeps,
    # emits a short beep on the display just as `Gdk::Display#beep`.
    def beep : Nil
      # gdk_surface_beep: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_surface_beep(self)

      # Return value handling
    end

    # Creates a new `GdkCairoContext` for rendering on @surface.
    def create_cairo_context : Gdk::CairoContext
      # gdk_surface_create_cairo_context: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_surface_create_cairo_context(self)

      # Return value handling

      Gdk::CairoContext.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new `GdkGLContext` for the `GdkSurface`.
    #
    # The context is disconnected from any particular surface or surface.
    # If the creation of the `GdkGLContext` failed, @error will be set.
    # Before using the returned `GdkGLContext`, you will need to
    # call `Gdk::GLContext#make_current` or `Gdk::GLContext#realize`.
    def create_gl_context : Gdk::GLContext
      # gdk_surface_create_gl_context: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdk.gdk_surface_create_gl_context(self, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?

      # Return value handling

      Gdk::GLContext.new(_retval, GICrystal::Transfer::Full)
    end

    # Create a new Cairo surface that is as compatible as possible with the
    # given @surface.
    #
    # For example the new surface will have the same fallback resolution
    # and font options as @surface. Generally, the new surface will also
    # use the same backend as @surface, unless that is not possible for
    # some reason. The type of the returned surface may be examined with
    # cairo_surface_get_type().
    #
    # Initially the surface contents are all 0 (transparent if contents
    # have transparency, black otherwise.)
    #
    # This function always returns a valid pointer, but it will return a
    # pointer to a “nil” surface if @other is already in an error state
    # or any other error occurs.
    def create_similar_surface(content : Cairo::Content, width : Int32, height : Int32) : Cairo::Surface
      # gdk_surface_create_similar_surface: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_surface_create_similar_surface(self, content, width, height)

      # Return value handling

      Cairo::Surface.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new `GdkVulkanContext` for rendering on @surface.
    #
    # If the creation of the `GdkVulkanContext` failed, @error will be set.
    def create_vulkan_context : Gdk::VulkanContext
      # gdk_surface_create_vulkan_context: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdk.gdk_surface_create_vulkan_context(self, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?

      # Return value handling

      Gdk::VulkanContext.new(_retval, GICrystal::Transfer::Full)
    end

    # Destroys the window system resources associated with @surface and
    # decrements @surface's reference count.
    #
    # The window system resources for all children of @surface are also
    # destroyed, but the children’s reference counts are not decremented.
    #
    # Note that a surface will not be destroyed automatically when its
    # reference count reaches zero. You must call this function yourself
    # before that happens.
    def destroy : Nil
      # gdk_surface_destroy: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_surface_destroy(self)

      # Return value handling
    end

    # Retrieves a `GdkCursor` pointer for the cursor currently set on the
    # `GdkSurface`.
    #
    # If the return value is %NULL then there is no custom cursor set on
    # the surface, and it is using the cursor for its parent surface.
    #
    # Use `Gdk::Surface#cursor=` to unset the cursor of the surface.
    def cursor : Gdk::Cursor?
      # gdk_surface_get_cursor: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_surface_get_cursor(self)

      # Return value handling

      Gdk::Cursor.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Retrieves a `GdkCursor` pointer for the @device currently set on the
    # specified `GdkSurface`.
    #
    # If the return value is %NULL then there is no custom cursor set on the
    # specified surface, and it is using the cursor for its parent surface.
    #
    # Use `Gdk::Surface#cursor=` to unset the cursor of the surface.
    def device_cursor(device : Gdk::Device) : Gdk::Cursor?
      # gdk_surface_get_device_cursor: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_surface_get_device_cursor(self, device)

      # Return value handling

      Gdk::Cursor.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Obtains the current device position and modifier state.
    #
    # The position is given in coordinates relative to the upper
    # left corner of @surface.
    def device_position(device : Gdk::Device) : Bool
      # gdk_surface_get_device_position: (Method)
      # @x: (out) (transfer full) (optional)
      # @y: (out) (transfer full) (optional)
      # @mask: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      x = Pointer(Float64).null
      # Generator::OutArgUsedInReturnPlan
      y = Pointer(Float64).null
      # Generator::OutArgUsedInReturnPlan
      mask = Pointer(UInt32).null

      # C call
      _retval = LibGdk.gdk_surface_get_device_position(self, device, x, y, mask)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the `GdkDisplay` associated with a `GdkSurface`.
    def display : Gdk::Display
      # gdk_surface_get_display: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_surface_get_display(self)

      # Return value handling

      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the frame clock for the surface.
    #
    # The frame clock for a surface never changes unless the surface is
    # reparented to a new toplevel surface.
    def frame_clock : Gdk::FrameClock
      # gdk_surface_get_frame_clock: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_surface_get_frame_clock(self)

      # Return value handling

      Gdk::FrameClock.new(_retval, GICrystal::Transfer::None)
    end

    # Returns the height of the given @surface.
    #
    # Surface size is reported in ”application pixels”, not
    # ”device pixels” (see `Gdk::Surface#scale_factor`).
    def height : Int32
      # gdk_surface_get_height: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_surface_get_height(self)

      # Return value handling

      _retval
    end

    # Checks whether the surface has been mapped.
    #
    # A surface is mapped with `Gdk::Toplevel#present`
    # or `Gdk::Popup#present`.
    def mapped : Bool
      # gdk_surface_get_mapped: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_surface_get_mapped(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the internal scale factor that maps from surface coordinates
    # to the actual device pixels.
    #
    # On traditional systems this is 1, but on very high density outputs
    # this can be a higher value (often 2). A higher value means that drawing
    # is automatically scaled up to a higher resolution, so any code doing
    # drawing will automatically look nicer. However, if you are supplying
    # pixel-based data the scale value can be used to determine whether to
    # use a pixel resource with higher resolution data.
    #
    # The scale of a surface may change during runtime.
    def scale_factor : Int32
      # gdk_surface_get_scale_factor: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_surface_get_scale_factor(self)

      # Return value handling

      _retval
    end

    # Returns the width of the given @surface.
    #
    # Surface size is reported in ”application pixels”, not
    # ”device pixels” (see `Gdk::Surface#scale_factor`).
    def width : Int32
      # gdk_surface_get_width: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_surface_get_width(self)

      # Return value handling

      _retval
    end

    # Hide the surface.
    #
    # For toplevel surfaces, withdraws them, so they will no longer be
    # known to the window manager; for all surfaces, unmaps them, so
    # they won’t be displayed. Normally done automatically as
    # part of `Gtk::Widget#hide`.
    def hide : Nil
      # gdk_surface_hide: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_surface_hide(self)

      # Return value handling
    end

    # Check to see if a surface is destroyed.
    def is_destroyed : Bool
      # gdk_surface_is_destroyed: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_surface_is_destroyed(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Forces a `Gdk::Surface::#render` signal emission for @surface
    # to be scheduled.
    #
    # This function is useful for implementations that track invalid
    # regions on their own.
    def queue_render : Nil
      # gdk_surface_queue_render: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_surface_queue_render(self)

      # Return value handling
    end

    # Request a layout phase from the surface's frame clock.
    #
    # See `Gdk::FrameClock#request_phase`.
    def request_layout : Nil
      # gdk_surface_request_layout: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_surface_request_layout(self)

      # Return value handling
    end

    # Sets the default mouse pointer for a `GdkSurface`.
    #
    # Passing %NULL for the @cursor argument means that @surface will use
    # the cursor of its parent surface. Most surfaces should use this default.
    # Note that @cursor must be for the same display as @surface.
    #
    # Use `Gdk::Cursor#new_from_name` or `Gdk::Cursor#new_from_texture`
    # to create the cursor. To make the cursor invisible, use %GDK_BLANK_CURSOR.
    def cursor=(cursor : Gdk::Cursor?) : Nil
      # gdk_surface_set_cursor: (Method | Setter)
      # @cursor: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cursor = if cursor.nil?
                 Pointer(Void).null
               else
                 cursor.to_unsafe
               end

      # C call
      LibGdk.gdk_surface_set_cursor(self, cursor)

      # Return value handling
    end

    # Sets a specific `GdkCursor` for a given device when it gets inside @surface.
    #
    # Passing %NULL for the @cursor argument means that @surface will use the
    # cursor of its parent surface. Most surfaces should use this default.
    #
    # Use `Gdk::Cursor#new_from_name` or `Gdk::Cursor#new_from_texture`
    # to create the cursor. To make the cursor invisible, use %GDK_BLANK_CURSOR.
    def set_device_cursor(device : Gdk::Device, cursor : Gdk::Cursor) : Nil
      # gdk_surface_set_device_cursor: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_surface_set_device_cursor(self, device, cursor)

      # Return value handling
    end

    # Apply the region to the surface for the purpose of event
    # handling.
    #
    # Mouse events which happen while the pointer position corresponds
    # to an unset bit in the mask will be passed on the surface below
    # @surface.
    #
    # An input region is typically used with RGBA surfaces. The alpha
    # channel of the surface defines which pixels are invisible and
    # allows for nicely antialiased borders, and the input region
    # controls where the surface is “clickable”.
    #
    # Use `Gdk::Display#supports_input_shapes` to find out if
    # a particular backend supports input regions.
    def input_region=(region : Cairo::Region) : Nil
      # gdk_surface_set_input_region: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_surface_set_input_region(self, region)

      # Return value handling
    end

    # Marks a region of the `GdkSurface` as opaque.
    #
    # For optimisation purposes, compositing window managers may
    # like to not draw obscured regions of surfaces, or turn off blending
    # during for these regions. With RGB windows with no transparency,
    # this is just the shape of the window, but with ARGB32 windows, the
    # compositor does not know what regions of the window are transparent
    # or not.
    #
    # This function only works for toplevel surfaces.
    #
    # GTK will update this property automatically if the @surface background
    # is opaque, as we know where the opaque regions are. If your surface
    # background is not opaque, please update this property in your
    # `Gtk::Widget#css_changed` handler.
    def opaque_region=(region : Cairo::Region?) : Nil
      # gdk_surface_set_opaque_region: (Method)
      # @region: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      region = if region.nil?
                 Pointer(Void).null
               else
                 region.to_unsafe
               end

      # C call
      LibGdk.gdk_surface_set_opaque_region(self, region)

      # Return value handling
    end

    # Translates coordinates between two surfaces.
    #
    # Note that this only works if @to and @from are popups or
    # transient-for to the same toplevel (directly or indirectly).
    def translate_coordinates(to : Gdk::Surface, x : Float64, y : Float64) : Bool
      # gdk_surface_translate_coordinates: (Method)
      # @x: (inout) (transfer full)
      # @y: (inout) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_surface_translate_coordinates(self, to, x, y)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Emitted when @surface starts being present on the monitor.
    struct EnterMonitorSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "enter-monitor::#{@detail}" : "enter-monitor"
      end

      def connect(&block : Proc(Gdk::Monitor, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Monitor, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::Monitor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Monitor.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Monitor, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Monitor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Monitor.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Monitor, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Surface, Gdk::Monitor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Surface.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Monitor.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Surface, Gdk::Monitor, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Surface, Gdk::Monitor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Surface.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Monitor.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Surface, Gdk::Monitor, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(monitor : Gdk::Monitor) : Nil
        LibGObject.g_signal_emit_by_name(@source, "enter-monitor", monitor)
      end
    end

    def enter_monitor_signal
      EnterMonitorSignal.new(self)
    end

    # Emitted when GDK receives an input event for @surface.
    struct EventSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "event::#{@detail}" : "event"
      end

      def connect(&block : Proc(Gdk::Event, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Event, Bool))
        connect(block)
      end

      def connect(block : Proc(Gdk::Event, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Event.new(lib_arg0, GICrystal::Transfer::None)
          _retval = ::Box(Proc(Gdk::Event, Bool)).unbox(box).call(arg0)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Event, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Event.new(lib_arg0, GICrystal::Transfer::None)
          _retval = ::Box(Proc(Gdk::Event, Bool)).unbox(box).call(arg0)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Surface, Gdk::Event, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Surface.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Event.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Surface, Gdk::Event, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Surface, Gdk::Event, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Surface.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Event.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Surface, Gdk::Event, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(event : Gdk::Event) : Nil
        LibGObject.g_signal_emit_by_name(@source, "event", event)
      end
    end

    def event_signal
      EventSignal.new(self)
    end

    # Emitted when the size of @surface is changed, or when relayout should
    # be performed.
    #
    # Surface size is reported in ”application pixels”, not
    # ”device pixels” (see gdk_surface_get_scale_factor()).
    struct LayoutSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "layout::#{@detail}" : "layout"
      end

      def connect(&block : Proc(Int32, Int32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Int32, Int32, Nil))
        connect(block)
      end

      def connect(block : Proc(Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Int32, Int32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Int32, Int32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Surface, Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Gdk::Surface.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gdk::Surface, Int32, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Surface, Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Gdk::Surface.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gdk::Surface, Int32, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(width : Int32, height : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "layout", width, height)
      end
    end

    def layout_signal
      LayoutSignal.new(self)
    end

    # Emitted when @surface stops being present on the monitor.
    struct LeaveMonitorSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "leave-monitor::#{@detail}" : "leave-monitor"
      end

      def connect(&block : Proc(Gdk::Monitor, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Monitor, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::Monitor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Monitor.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Monitor, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Monitor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Monitor.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Monitor, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Surface, Gdk::Monitor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Surface.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Monitor.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Surface, Gdk::Monitor, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Surface, Gdk::Monitor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Surface.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Monitor.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Surface, Gdk::Monitor, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(monitor : Gdk::Monitor) : Nil
        LibGObject.g_signal_emit_by_name(@source, "leave-monitor", monitor)
      end
    end

    def leave_monitor_signal
      LeaveMonitorSignal.new(self)
    end

    # Emitted when part of the surface needs to be redrawn.
    struct RenderSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "render::#{@detail}" : "render"
      end

      def connect(&block : Proc(Cairo::Region, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Cairo::Region, Bool))
        connect(block)
      end

      def connect(block : Proc(Cairo::Region, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Cairo::Region.new(lib_arg0, GICrystal::Transfer::None)
          _retval = ::Box(Proc(Cairo::Region, Bool)).unbox(box).call(arg0)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Cairo::Region, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Cairo::Region.new(lib_arg0, GICrystal::Transfer::None)
          _retval = ::Box(Proc(Cairo::Region, Bool)).unbox(box).call(arg0)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Surface, Cairo::Region, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Surface.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Cairo::Region.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Surface, Cairo::Region, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Surface, Cairo::Region, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Surface.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Cairo::Region.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Surface, Cairo::Region, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(region : Cairo::Region) : Nil
        LibGObject.g_signal_emit_by_name(@source, "render", region)
      end
    end

    def render_signal
      RenderSignal.new(self)
    end
  end
end
