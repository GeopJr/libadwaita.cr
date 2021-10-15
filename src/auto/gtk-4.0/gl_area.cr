require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkGLArea` is a widget that allows drawing with OpenGL.
  #
  # ![An example GtkGLArea](glarea.png)
  #
  # `GtkGLArea` sets up its own [class@Gdk.GLContext], and creates a custom
  # GL framebuffer that the widget will do GL rendering onto. It also ensures
  # that this framebuffer is the default GL rendering target when rendering.
  #
  # In order to draw, you have to connect to the [signal@Gtk.GLArea::render]
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
  # create a widget instance and connect to the [signal@Gtk.GLArea::render] signal:
  #
  # The `render()` function will be called when the `GtkGLArea` is ready
  # for you to draw its content:
  #
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
  # shaders, you should use the [signal@Gtk.Widget::realize] signal;
  # you can use the [signal@Gtk.Widget::unrealize] signal to clean up.
  # Since the `GdkGLContext` creation and initialization may fail, you
  # will need to check for errors, using [method@Gtk.GLArea.get_error].
  #
  # An example of how to safely initialize the GL state is:
  #
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
  class GLArea < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, auto_render : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, context : Gdk::GLContext? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_depth_buffer : Bool? = nil, has_focus : Bool? = nil, has_stencil_buffer : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, use_es : Bool? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[40]
      _values = StaticArray(LibGObject::Value, 40).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if auto_render
        (_names.to_unsafe + _n).value = "auto-render".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, auto_render)
        _n += 1
      end
      if can_focus
        (_names.to_unsafe + _n).value = "can-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_focus)
        _n += 1
      end
      if can_target
        (_names.to_unsafe + _n).value = "can-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_target)
        _n += 1
      end
      if context
        (_names.to_unsafe + _n).value = "context".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, context)
        _n += 1
      end
      if css_classes
        (_names.to_unsafe + _n).value = "css-classes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_classes)
        _n += 1
      end
      if css_name
        (_names.to_unsafe + _n).value = "css-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_name)
        _n += 1
      end
      if cursor
        (_names.to_unsafe + _n).value = "cursor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor)
        _n += 1
      end
      if focus_on_click
        (_names.to_unsafe + _n).value = "focus-on-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_on_click)
        _n += 1
      end
      if focusable
        (_names.to_unsafe + _n).value = "focusable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focusable)
        _n += 1
      end
      if halign
        (_names.to_unsafe + _n).value = "halign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, halign)
        _n += 1
      end
      if has_default
        (_names.to_unsafe + _n).value = "has-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_default)
        _n += 1
      end
      if has_depth_buffer
        (_names.to_unsafe + _n).value = "has-depth-buffer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_depth_buffer)
        _n += 1
      end
      if has_focus
        (_names.to_unsafe + _n).value = "has-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_focus)
        _n += 1
      end
      if has_stencil_buffer
        (_names.to_unsafe + _n).value = "has-stencil-buffer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_stencil_buffer)
        _n += 1
      end
      if has_tooltip
        (_names.to_unsafe + _n).value = "has-tooltip".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_tooltip)
        _n += 1
      end
      if height_request
        (_names.to_unsafe + _n).value = "height-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height_request)
        _n += 1
      end
      if hexpand
        (_names.to_unsafe + _n).value = "hexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand)
        _n += 1
      end
      if hexpand_set
        (_names.to_unsafe + _n).value = "hexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand_set)
        _n += 1
      end
      if layout_manager
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if margin_bottom
        (_names.to_unsafe + _n).value = "margin-bottom".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_bottom)
        _n += 1
      end
      if margin_end
        (_names.to_unsafe + _n).value = "margin-end".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_end)
        _n += 1
      end
      if margin_start
        (_names.to_unsafe + _n).value = "margin-start".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_start)
        _n += 1
      end
      if margin_top
        (_names.to_unsafe + _n).value = "margin-top".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_top)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if opacity
        (_names.to_unsafe + _n).value = "opacity".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, opacity)
        _n += 1
      end
      if overflow
        (_names.to_unsafe + _n).value = "overflow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overflow)
        _n += 1
      end
      if parent
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if receives_default
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if root
        (_names.to_unsafe + _n).value = "root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, root)
        _n += 1
      end
      if scale_factor
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if tooltip_markup
        (_names.to_unsafe + _n).value = "tooltip-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_markup)
        _n += 1
      end
      if tooltip_text
        (_names.to_unsafe + _n).value = "tooltip-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_text)
        _n += 1
      end
      if use_es
        (_names.to_unsafe + _n).value = "use-es".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_es)
        _n += 1
      end
      if valign
        (_names.to_unsafe + _n).value = "valign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, valign)
        _n += 1
      end
      if vexpand
        (_names.to_unsafe + _n).value = "vexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand)
        _n += 1
      end
      if vexpand_set
        (_names.to_unsafe + _n).value = "vexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand_set)
        _n += 1
      end
      if visible
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if width_request
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(GLArea.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_gl_area_get_type
    end

    def initialize
      # gtk_gl_area_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_gl_area_new
      @pointer = _retval
    end

    def attach_buffers : Nil
      # gtk_gl_area_attach_buffers: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_gl_area_attach_buffers(self)
    end

    def auto_render? : Bool
      # gtk_gl_area_get_auto_render: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_gl_area_get_auto_render(self)
      GICrystal.to_bool(_retval)
    end

    def context : Gdk::GLContext
      # gtk_gl_area_get_context: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_gl_area_get_context(self)
      Gdk::GLContext.new(_retval, GICrystal::Transfer::None)
    end

    def error : GLib::Error?
      # gtk_gl_area_get_error: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_gl_area_get_error(self)
      GLib::Error.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def has_depth_buffer? : Bool
      # gtk_gl_area_get_has_depth_buffer: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_gl_area_get_has_depth_buffer(self)
      GICrystal.to_bool(_retval)
    end

    def has_stencil_buffer? : Bool
      # gtk_gl_area_get_has_stencil_buffer: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_gl_area_get_has_stencil_buffer(self)
      GICrystal.to_bool(_retval)
    end

    def required_version(major : Int32, minor : Int32) : Nil
      # gtk_gl_area_get_required_version: (Method)
      # @major: (out) (transfer full)
      # @minor: (out) (transfer full)
      # Returns: (transfer none)

      LibGtk.gtk_gl_area_get_required_version(self, major, minor)
    end

    def use_es? : Bool
      # gtk_gl_area_get_use_es: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_gl_area_get_use_es(self)
      GICrystal.to_bool(_retval)
    end

    def make_current : Nil
      # gtk_gl_area_make_current: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_gl_area_make_current(self)
    end

    def queue_render : Nil
      # gtk_gl_area_queue_render: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_gl_area_queue_render(self)
    end

    def auto_render=(auto_render : Bool) : Nil
      # gtk_gl_area_set_auto_render: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_gl_area_set_auto_render(self, auto_render)
    end

    def error=(error : GLib::Error?) : Nil
      # gtk_gl_area_set_error: (Method)
      # @error: (nullable)
      # Returns: (transfer none)

      error = if error.nil?
                Pointer(Void).null
              else
                error.to_unsafe
              end

      LibGtk.gtk_gl_area_set_error(self, error)
    end

    def has_depth_buffer=(has_depth_buffer : Bool) : Nil
      # gtk_gl_area_set_has_depth_buffer: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_gl_area_set_has_depth_buffer(self, has_depth_buffer)
    end

    def has_stencil_buffer=(has_stencil_buffer : Bool) : Nil
      # gtk_gl_area_set_has_stencil_buffer: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_gl_area_set_has_stencil_buffer(self, has_stencil_buffer)
    end

    def set_required_version(major : Int32, minor : Int32) : Nil
      # gtk_gl_area_set_required_version: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_gl_area_set_required_version(self, major, minor)
    end

    def use_es=(use_es : Bool) : Nil
      # gtk_gl_area_set_use_es: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_gl_area_set_use_es(self, use_es)
    end

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

      def connect(block : Proc(Gdk::GLContext))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Gdk::GLContext)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::GLContext))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Gdk::GLContext)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::GLArea, Gdk::GLContext))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::GLArea.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::GLArea, Gdk::GLContext)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::GLArea, Gdk::GLContext))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::GLArea.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::GLArea, Gdk::GLContext)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "create-context")
      end
    end

    def create_context_signal
      CreateContextSignal.new(self)
    end

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

      def connect(block : Proc(Gdk::GLContext, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::GLContext.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::GLContext, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::GLContext, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::GLContext.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::GLContext, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::GLArea, Gdk::GLContext, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::GLArea.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::GLContext.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::GLArea, Gdk::GLContext, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::GLArea, Gdk::GLContext, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::GLArea.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::GLContext.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::GLArea, Gdk::GLContext, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(context : Gdk::GLContext) : Nil
        LibGObject.g_signal_emit_by_name(@source, "render", context)
      end
    end

    def render_signal
      RenderSignal.new(self)
    end

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

      def connect(block : Proc(Gtk::GLArea, Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Gtk::GLArea.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::GLArea, Int32, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::GLArea, Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Gtk::GLArea.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gtk::GLArea, Int32, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
