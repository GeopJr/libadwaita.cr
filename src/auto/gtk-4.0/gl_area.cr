require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkGLArea` is a widget that allows drawing with OpenGL.
  #
  # ![An example GtkGLArea](glarea.png)
  #
  # `GtkGLArea` sets up its own `Gdk#GLContext`, and creates a custom
  # GL framebuffer that the widget will do GL rendering onto. It also ensures
  # that this framebuffer is the default GL rendering target when rendering.
  #
  # In order to draw, you have to connect to the `Gtk::GLArea::#render`
  # signal, or subclass `GtkGLArea` and override the GtkGLAreaClass.render
  # virtual function.
  #
  # The `GtkGLArea` widget ensures that the `GdkGLContext` is associated with
  # the widget's drawing area, and it is kept updated when the size and
  # position of the drawing area changes.
  #
  # ## Drawing with GtkGLArea
  #
  # The simplest way to draw using OpenGL commands in a `GtkGLArea` is to
  # create a widget instance and connect to the `Gtk::GLArea::#render` signal:
  #
  # The `render()` function will be called when the `GtkGLArea` is ready
  # for you to draw its content:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # static gboolean
  # render (GtkGLArea *area, GdkGLContext *context)
  # {
  #   // inside this function it's safe to use GL; the given
  #   // GdkGLContext has been made current to the drawable
  #   // surface used by the `GtkGLArea` and the viewport has
  #   // already been set to be the size of the allocation
  #
  #   // we can start by clearing the buffer
  #   glClearColor (0, 0, 0, 0);
  #   glClear (GL_COLOR_BUFFER_BIT);
  #
  #   // draw your object
  #   // draw_an_object ();
  #
  #   // we completed our drawing; the draw commands will be
  #   // flushed at the end of the signal emission chain, and
  #   // the buffers will be drawn on the window
  #   return TRUE;
  # }
  #
  # void setup_glarea (void)
  # {
  #   // create a GtkGLArea instance
  #   GtkWidget *gl_area = gtk_gl_area_new ();
  #
  #   // connect to the "render" signal
  #   g_signal_connect (gl_area, "render", G_CALLBACK (render), NULL);
  # }
  # ```
  #
  # If you need to initialize OpenGL state, e.g. buffer objects or
  # shaders, you should use the `Gtk::Widget::#realize` signal;
  # you can use the `Gtk::Widget::#unrealize` signal to clean up.
  # Since the `GdkGLContext` creation and initialization may fail, you
  # will need to check for errors, using `Gtk::GLArea#error`.
  #
  # An example of how to safely initialize the GL state is:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # static void
  # on_realize (GtkGLarea *area)
  # {
  #   // We need to make the context current if we want to
  #   // call GL API
  #   gtk_gl_area_make_current (area);
  #
  #   // If there were errors during the initialization or
  #   // when trying to make the context current, this
  #   // function will return a GError for you to catch
  #   if (gtk_gl_area_get_error (area) != NULL)
  #     return;
  #
  #   // You can also use gtk_gl_area_set_error() in order
  #   // to show eventual initialization errors on the
  #   // GtkGLArea widget itself
  #   GError *internal_error = NULL;
  #   init_buffer_objects (&error);
  #   if (error != NULL)
  #     {
  #       gtk_gl_area_set_error (area, error);
  #       g_error_free (error);
  #       return;
  #     }
  #
  #   init_shaders (&error);
  #   if (error != NULL)
  #     {
  #       gtk_gl_area_set_error (area, error);
  #       g_error_free (error);
  #       return;
  #     }
  # }
  # ```
  #
  # If you need to change the options for creating the `GdkGLContext`
  # you should use the [signal@Gtk.GLArea::create-context] signal.
  @[GObject::GeneratedWrapper]
  class GLArea < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::GLAreaClass), class_init,
        sizeof(LibGtk::GLArea), instance_init, 0)
    end

    GICrystal.define_new_method(GLArea, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `GLArea`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, auto_render : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, context : Gdk::GLContext? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_depth_buffer : Bool? = nil, has_focus : Bool? = nil, has_stencil_buffer : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, use_es : Bool? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[40]
      _values = StaticArray(LibGObject::Value, 40).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !auto_render.nil?
        (_names.to_unsafe + _n).value = "auto-render".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, auto_render)
        _n += 1
      end
      if !can_focus.nil?
        (_names.to_unsafe + _n).value = "can-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_focus)
        _n += 1
      end
      if !can_target.nil?
        (_names.to_unsafe + _n).value = "can-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_target)
        _n += 1
      end
      if !context.nil?
        (_names.to_unsafe + _n).value = "context".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, context)
        _n += 1
      end
      if !css_classes.nil?
        (_names.to_unsafe + _n).value = "css-classes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_classes)
        _n += 1
      end
      if !css_name.nil?
        (_names.to_unsafe + _n).value = "css-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_name)
        _n += 1
      end
      if !cursor.nil?
        (_names.to_unsafe + _n).value = "cursor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor)
        _n += 1
      end
      if !focus_on_click.nil?
        (_names.to_unsafe + _n).value = "focus-on-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_on_click)
        _n += 1
      end
      if !focusable.nil?
        (_names.to_unsafe + _n).value = "focusable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focusable)
        _n += 1
      end
      if !halign.nil?
        (_names.to_unsafe + _n).value = "halign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, halign)
        _n += 1
      end
      if !has_default.nil?
        (_names.to_unsafe + _n).value = "has-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_default)
        _n += 1
      end
      if !has_depth_buffer.nil?
        (_names.to_unsafe + _n).value = "has-depth-buffer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_depth_buffer)
        _n += 1
      end
      if !has_focus.nil?
        (_names.to_unsafe + _n).value = "has-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_focus)
        _n += 1
      end
      if !has_stencil_buffer.nil?
        (_names.to_unsafe + _n).value = "has-stencil-buffer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_stencil_buffer)
        _n += 1
      end
      if !has_tooltip.nil?
        (_names.to_unsafe + _n).value = "has-tooltip".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_tooltip)
        _n += 1
      end
      if !height_request.nil?
        (_names.to_unsafe + _n).value = "height-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height_request)
        _n += 1
      end
      if !hexpand.nil?
        (_names.to_unsafe + _n).value = "hexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand)
        _n += 1
      end
      if !hexpand_set.nil?
        (_names.to_unsafe + _n).value = "hexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand_set)
        _n += 1
      end
      if !layout_manager.nil?
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if !margin_bottom.nil?
        (_names.to_unsafe + _n).value = "margin-bottom".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_bottom)
        _n += 1
      end
      if !margin_end.nil?
        (_names.to_unsafe + _n).value = "margin-end".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_end)
        _n += 1
      end
      if !margin_start.nil?
        (_names.to_unsafe + _n).value = "margin-start".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_start)
        _n += 1
      end
      if !margin_top.nil?
        (_names.to_unsafe + _n).value = "margin-top".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_top)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !opacity.nil?
        (_names.to_unsafe + _n).value = "opacity".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, opacity)
        _n += 1
      end
      if !overflow.nil?
        (_names.to_unsafe + _n).value = "overflow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overflow)
        _n += 1
      end
      if !parent.nil?
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if !receives_default.nil?
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if !root.nil?
        (_names.to_unsafe + _n).value = "root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, root)
        _n += 1
      end
      if !scale_factor.nil?
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if !tooltip_markup.nil?
        (_names.to_unsafe + _n).value = "tooltip-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_markup)
        _n += 1
      end
      if !tooltip_text.nil?
        (_names.to_unsafe + _n).value = "tooltip-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_text)
        _n += 1
      end
      if !use_es.nil?
        (_names.to_unsafe + _n).value = "use-es".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_es)
        _n += 1
      end
      if !valign.nil?
        (_names.to_unsafe + _n).value = "valign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, valign)
        _n += 1
      end
      if !vexpand.nil?
        (_names.to_unsafe + _n).value = "vexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand)
        _n += 1
      end
      if !vexpand_set.nil?
        (_names.to_unsafe + _n).value = "vexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand_set)
        _n += 1
      end
      if !visible.nil?
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(GLArea.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_gl_area_get_type
    end

    def auto_render=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "auto-render", unsafe_value, Pointer(Void).null)
      value
    end

    def auto_render? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "auto-render", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def context : Gdk::GLContext?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "context", pointerof(value), Pointer(Void).null)
      Gdk::GLContext.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def has_depth_buffer=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "has-depth-buffer", unsafe_value, Pointer(Void).null)
      value
    end

    def has_depth_buffer? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "has-depth-buffer", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def has_stencil_buffer=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "has-stencil-buffer", unsafe_value, Pointer(Void).null)
      value
    end

    def has_stencil_buffer? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "has-stencil-buffer", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def use_es=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "use-es", unsafe_value, Pointer(Void).null)
      value
    end

    def use_es? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "use-es", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a new `GtkGLArea` widget.
    def initialize
      # gtk_gl_area_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gl_area_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Binds buffers to the framebuffer.
    #
    # Ensures that the @area framebuffer object is made the current draw
    # and read target, and that all the required buffers for the @area
    # are created and bound to the framebuffer.
    #
    # This function is automatically called before emitting the
    # `Gtk::GLArea::#render` signal, and doesn't normally need to be
    # called by application code.
    def attach_buffers : Nil
      # gtk_gl_area_attach_buffers: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_gl_area_attach_buffers(@pointer)

      # Return value handling
    end

    # Returns whether the area is in auto render mode or not.
    def auto_render : Bool
      # gtk_gl_area_get_auto_render: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gl_area_get_auto_render(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves the `GdkGLContext` used by @area.
    def context : Gdk::GLContext?
      # gtk_gl_area_get_context: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gl_area_get_context(@pointer)

      # Return value handling

      Gdk::GLContext.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the current error set on the @area.
    def error : GLib::Error?
      # gtk_gl_area_get_error: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gl_area_get_error(@pointer)

      # Return value handling

      GLib::Error.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether the area has a depth buffer.
    def has_depth_buffer : Bool
      # gtk_gl_area_get_has_depth_buffer: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gl_area_get_has_depth_buffer(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the area has a stencil buffer.
    def has_stencil_buffer : Bool
      # gtk_gl_area_get_has_stencil_buffer: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gl_area_get_has_stencil_buffer(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves the required version of OpenGL.
    #
    # See `Gtk::GLArea#required_version=`.
    def required_version(major : Int32, minor : Int32) : Nil
      # gtk_gl_area_get_required_version: (Method)
      # @major: (out) (transfer full)
      # @minor: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_gl_area_get_required_version(@pointer, major, minor)

      # Return value handling
    end

    # Returns whether the `GtkGLArea` should use OpenGL ES.
    #
    # See `Gtk::GLArea#use_es=`.
    def use_es : Bool
      # gtk_gl_area_get_use_es: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gl_area_get_use_es(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Ensures that the `GdkGLContext` used by @area is associated with
    # the `GtkGLArea`.
    #
    # This function is automatically called before emitting the
    # `Gtk::GLArea::#render` signal, and doesn't normally need
    # to be called by application code.
    def make_current : Nil
      # gtk_gl_area_make_current: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_gl_area_make_current(@pointer)

      # Return value handling
    end

    # Marks the currently rendered data (if any) as invalid, and queues
    # a redraw of the widget.
    #
    # This ensures that the `Gtk::GLArea::#render` signal
    # is emitted during the draw.
    #
    # This is only needed when `Gtk::GLArea#auto_render=` has
    # been called with a %FALSE value. The default behaviour is to
    # emit `Gtk::GLArea::#render` on each draw.
    def queue_render : Nil
      # gtk_gl_area_queue_render: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_gl_area_queue_render(@pointer)

      # Return value handling
    end

    # Sets whether the `GtkGLArea` is in auto render mode.
    #
    # If @auto_render is %TRUE the `Gtk::GLArea::#render` signal will
    # be emitted every time the widget draws. This is the default and is
    # useful if drawing the widget is faster.
    #
    # If @auto_render is %FALSE the data from previous rendering is kept
    # around and will be used for drawing the widget the next time,
    # unless the window is resized. In order to force a rendering
    # `Gtk::GLArea#queue_render` must be called. This mode is
    # useful when the scene changes seldom, but takes a long time to redraw.
    def auto_render=(auto_render : Bool) : Nil
      # gtk_gl_area_set_auto_render: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_gl_area_set_auto_render(@pointer, auto_render)

      # Return value handling
    end

    # Sets an error on the area which will be shown instead of the
    # GL rendering.
    #
    # This is useful in the [signal@Gtk.GLArea::create-context]
    # signal if GL context creation fails.
    def error=(error : GLib::Error?) : Nil
      # gtk_gl_area_set_error: (Method)
      # @error: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      error = if error.nil?
                Pointer(Void).null
              else
                error.to_unsafe
              end

      # C call
      LibGtk.gtk_gl_area_set_error(@pointer, error)

      # Return value handling
    end

    # Sets whether the `GtkGLArea` should use a depth buffer.
    #
    # If @has_depth_buffer is %TRUE the widget will allocate and
    # enable a depth buffer for the target framebuffer. Otherwise
    # there will be none.
    def has_depth_buffer=(has_depth_buffer : Bool) : Nil
      # gtk_gl_area_set_has_depth_buffer: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_gl_area_set_has_depth_buffer(@pointer, has_depth_buffer)

      # Return value handling
    end

    # Sets whether the `GtkGLArea` should use a stencil buffer.
    #
    # If @has_stencil_buffer is %TRUE the widget will allocate and
    # enable a stencil buffer for the target framebuffer. Otherwise
    # there will be none.
    def has_stencil_buffer=(has_stencil_buffer : Bool) : Nil
      # gtk_gl_area_set_has_stencil_buffer: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_gl_area_set_has_stencil_buffer(@pointer, has_stencil_buffer)

      # Return value handling
    end

    # Sets the required version of OpenGL to be used when creating
    # the context for the widget.
    #
    # This function must be called before the area has been realized.
    def set_required_version(major : Int32, minor : Int32) : Nil
      # gtk_gl_area_set_required_version: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_gl_area_set_required_version(@pointer, major, minor)

      # Return value handling
    end

    # Sets whether the @area should create an OpenGL or an OpenGL ES context.
    #
    # You should check the capabilities of the `GdkGLContext` before drawing
    # with either API.
    def use_es=(use_es : Bool) : Nil
      # gtk_gl_area_set_use_es: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_gl_area_set_use_es(@pointer, use_es)

      # Return value handling
    end

    # Emitted when the widget is being realized.
    #
    # This allows you to override how the GL context is created.
    # This is useful when you want to reuse an existing GL context,
    # or if you want to try creating different kinds of GL options.
    #
    # If context creation fails then the signal handler can use
    # `Gtk::GLArea#error=` to register a more detailed error
    # of how the construction failed.
    struct CreateContextSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "create-context::#{@detail}" : "create-context"
      end

      def connect(&block : Proc(Gdk::GLContext))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::GLContext))
        connect(block)
      end

      def connect(handler : Proc(Gdk::GLContext))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Gdk::GLContext)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gdk::GLContext))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Gdk::GLContext)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::GLArea, Gdk::GLContext))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::GLArea.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::GLArea, Gdk::GLContext)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::GLArea, Gdk::GLContext))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::GLArea.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::GLArea, Gdk::GLContext)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "create-context")
      end
    end

    def create_context_signal
      CreateContextSignal.new(self)
    end

    # Emitted every time the contents of the `GtkGLArea` should be redrawn.
    #
    # The @context is bound to the @area prior to emitting this function,
    # and the buffers are painted to the window once the emission terminates.
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

      def connect(&block : Proc(Gdk::GLContext, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::GLContext, Bool))
        connect(block)
      end

      def connect(handler : Proc(Gdk::GLContext, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_context : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          context = Gdk::GLContext.new(lib_context, :none)
          ::Box(Proc(Gdk::GLContext, Bool)).unbox(_lib_box).call(context)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gdk::GLContext, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_context : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          context = Gdk::GLContext.new(lib_context, :none)
          ::Box(Proc(Gdk::GLContext, Bool)).unbox(_lib_box).call(context)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::GLArea, Gdk::GLContext, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_context : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::GLArea.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          context = Gdk::GLContext.new(lib_context, :none)
          ::Box(Proc(Gtk::GLArea, Gdk::GLContext, Bool)).unbox(_lib_box).call(_sender, context)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::GLArea, Gdk::GLContext, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_context : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::GLArea.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          context = Gdk::GLContext.new(lib_context, :none)
          ::Box(Proc(Gtk::GLArea, Gdk::GLContext, Bool)).unbox(_lib_box).call(_sender, context)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(context : Gdk::GLContext) : Nil
        LibGObject.g_signal_emit_by_name(@source, "render", context)
      end
    end

    def render_signal
      RenderSignal.new(self)
    end

    # Emitted once when the widget is realized, and then each time the widget
    # is changed while realized.
    #
    # This is useful in order to keep GL state up to date with the widget size,
    # like for instance camera properties which may depend on the width/height
    # ratio.
    #
    # The GL context for the area is guaranteed to be current when this signal
    # is emitted.
    #
    # The default handler sets up the GL viewport.
    struct ResizeSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "resize::#{@detail}" : "resize"
      end

      def connect(&block : Proc(Int32, Int32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Int32, Int32, Nil))
        connect(block)
      end

      def connect(handler : Proc(Int32, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_width : Int32, lib_height : Int32, _lib_box : Pointer(Void)) {
          width = lib_width
          height = lib_height
          ::Box(Proc(Int32, Int32, Nil)).unbox(_lib_box).call(width, height)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Int32, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_width : Int32, lib_height : Int32, _lib_box : Pointer(Void)) {
          width = lib_width
          height = lib_height
          ::Box(Proc(Int32, Int32, Nil)).unbox(_lib_box).call(width, height)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::GLArea, Int32, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_width : Int32, lib_height : Int32, _lib_box : Pointer(Void)) {
          _sender = Gtk::GLArea.new(_lib_sender, GICrystal::Transfer::None)
          width = lib_width
          height = lib_height
          ::Box(Proc(Gtk::GLArea, Int32, Int32, Nil)).unbox(_lib_box).call(_sender, width, height)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::GLArea, Int32, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_width : Int32, lib_height : Int32, _lib_box : Pointer(Void)) {
          _sender = Gtk::GLArea.new(_lib_sender, GICrystal::Transfer::None)
          width = lib_width
          height = lib_height
          ::Box(Proc(Gtk::GLArea, Int32, Int32, Nil)).unbox(_lib_box).call(_sender, width, height)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(width : Int32, height : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "resize", width, height)
      end
    end

    def resize_signal
      ResizeSignal.new(self)
    end
  end
end
