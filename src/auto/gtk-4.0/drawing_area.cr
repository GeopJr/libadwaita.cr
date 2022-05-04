require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkDrawingArea` is a widget that allows drawing with cairo.
  #
  # ![An example GtkDrawingArea](drawingarea.png)
  #
  # It’s essentially a blank widget; you can draw on it. After
  # creating a drawing area, the application may want to connect to:
  #
  # - The `Gtk::Widget::#realize` signal to take any necessary actions
  #   when the widget is instantiated on a particular display.
  #   (Create GDK resources in response to this signal.)
  #
  # - The `Gtk::DrawingArea::#resize` signal to take any necessary
  #   actions when the widget changes size.
  #
  # - Call `Gtk::DrawingArea#draw_func=` to handle redrawing the
  #   contents of the widget.
  #
  # The following code portion demonstrates using a drawing
  # area to display a circle in the normal widget foreground
  # color.
  #
  # ## Simple GtkDrawingArea usage
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # static void
  # draw_function (GtkDrawingArea *area,
  #                cairo_t        *cr,
  #                int             width,
  #                int             height,
  #                gpointer        data)
  # {
  #   GdkRGBA color;
  #   GtkStyleContext *context;
  #
  #   context = gtk_widget_get_style_context (GTK_WIDGET (area));
  #
  #   cairo_arc (cr,
  #              width / 2.0, height / 2.0,
  #              MIN (width, height) / 2.0,
  #              0, 2 * G_PI);
  #
  #   gtk_style_context_get_color (context,
  #                                &color);
  #   gdk_cairo_set_source_rgba (cr, &color);
  #
  #   cairo_fill (cr);
  # }
  #
  # int
  # main (int argc, char **argv)
  # {
  #   gtk_init ();
  #
  #   GtkWidget *area = gtk_drawing_area_new ();
  #   gtk_drawing_area_set_content_width (GTK_DRAWING_AREA (area), 100);
  #   gtk_drawing_area_set_content_height (GTK_DRAWING_AREA (area), 100);
  #   gtk_drawing_area_set_draw_func (GTK_DRAWING_AREA (area),
  #                                   draw_function,
  #                                   NULL, NULL);
  #   return 0;
  # }
  # ```
  #
  # The draw function is normally called when a drawing area first comes
  # onscreen, or when it’s covered by another window and then uncovered.
  # You can also force a redraw by adding to the “damage region” of the
  # drawing area’s window using `Gtk::Widget#queue_draw`.
  # This will cause the drawing area to call the draw function again.
  #
  # The available routines for drawing are documented in the
  # [Cairo documentation](https://www.cairographics.org/manual/); GDK
  # offers additional API to integrate with Cairo, like `Gdk#cairo_set_source_rgba`
  # or `Gdk#cairo_set_source_pixbuf`.
  #
  # To receive mouse events on a drawing area, you will need to use
  # event controllers. To receive keyboard events, you will need to set
  # the “can-focus” property on the drawing area, and you should probably
  # draw some user-visible indication that the drawing area is focused.
  #
  # If you need more complex control over your widget, you should consider
  # creating your own `GtkWidget` subclass.
  @[GObject::GeneratedWrapper]
  class DrawingArea < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::DrawingAreaClass), class_init,
        sizeof(LibGtk::DrawingArea), instance_init, 0)
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

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, content_height : Int32? = nil, content_width : Int32? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[37]
      _values = StaticArray(LibGObject::Value, 37).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
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
      if !content_height.nil?
        (_names.to_unsafe + _n).value = "content-height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, content_height)
        _n += 1
      end
      if !content_width.nil?
        (_names.to_unsafe + _n).value = "content-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, content_width)
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
      if !has_focus.nil?
        (_names.to_unsafe + _n).value = "has-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_focus)
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

      @pointer = LibGObject.g_object_new_with_properties(DrawingArea.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_drawing_area_get_type
    end

    def content_height=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "content-height", unsafe_value, Pointer(Void).null)
      value
    end

    def content_height : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "content-height", pointerof(value), Pointer(Void).null)
      value
    end

    def content_width=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "content-width", unsafe_value, Pointer(Void).null)
      value
    end

    def content_width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "content-width", pointerof(value), Pointer(Void).null)
      value
    end

    # Creates a new drawing area.
    def initialize
      # gtk_drawing_area_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drawing_area_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Retrieves the content height of the `GtkDrawingArea`.
    def content_height : Int32
      # gtk_drawing_area_get_content_height: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drawing_area_get_content_height(self)

      # Return value handling

      _retval
    end

    # Retrieves the content width of the `GtkDrawingArea`.
    def content_width : Int32
      # gtk_drawing_area_get_content_width: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_drawing_area_get_content_width(self)

      # Return value handling

      _retval
    end

    # Sets the desired height of the contents of the drawing area.
    #
    # Note that because widgets may be allocated larger sizes than they
    # requested, it is possible that the actual height passed to your draw
    # function is larger than the height set here. You can use
    # `Gtk::Widget#valign=` to avoid that.
    #
    # If the height is set to 0 (the default), the drawing area may disappear.
    def content_height=(height : Int32) : Nil
      # gtk_drawing_area_set_content_height: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_drawing_area_set_content_height(self, height)

      # Return value handling
    end

    # Sets the desired width of the contents of the drawing area.
    #
    # Note that because widgets may be allocated larger sizes than they
    # requested, it is possible that the actual width passed to your draw
    # function is larger than the width set here. You can use
    # `Gtk::Widget#halign=` to avoid that.
    #
    # If the width is set to 0 (the default), the drawing area may disappear.
    def content_width=(width : Int32) : Nil
      # gtk_drawing_area_set_content_width: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_drawing_area_set_content_width(self, width)

      # Return value handling
    end

    # Setting a draw function is the main thing you want to do when using
    # a drawing area.
    #
    # The draw function is called whenever GTK needs to draw the contents
    # of the drawing area to the screen.
    #
    # The draw function will be called during the drawing stage of GTK.
    # In the drawing stage it is not allowed to change properties of any
    # GTK widgets or call any functions that would cause any properties
    # to be changed. You should restrict yourself exclusively to drawing
    # your contents in the draw function.
    #
    # If what you are drawing does change, call `Gtk::Widget#queue_draw`
    # on the drawing area. This will cause a redraw and will call @draw_func again.
    def draw_func=(draw_func : Gtk::DrawingAreaDrawFunc?) : Nil
      # gtk_drawing_area_set_draw_func: (Method)
      # @draw_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if draw_func
        _box = ::Box.box(draw_func)
        draw_func = ->(lib_drawing_area : Pointer(Void), lib_cr : Pointer(Void), lib_width : Int32, lib_height : Int32, lib_user_data : Pointer(Void)) {
          # Generator::GObjectArgPlan
          drawing_area = Gtk::DrawingArea.new(lib_drawing_area, :none)
          # Generator::GObjectArgPlan
          cr = Cairo::Context.new(lib_cr, :none)
          width = lib_width
          height = lib_height
          user_data = lib_user_data
          ::Box(Proc(Gtk::DrawingArea, Cairo::Context, Int32, Int32, Nil)).unbox(user_data).call(drawing_area, cr, width, height)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        draw_func = user_data = destroy = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_drawing_area_set_draw_func(self, draw_func, user_data, destroy)

      # Return value handling
    end

    # Emitted once when the widget is realized, and then each time the widget
    # is changed while realized.
    #
    # This is useful in order to keep state up to date with the widget size,
    # like for instance a backing surface.
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

      def connect(handler : Proc(Gtk::DrawingArea, Int32, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_width : Int32, lib_height : Int32, _lib_box : Pointer(Void)) {
          _sender = Gtk::DrawingArea.new(_lib_sender, GICrystal::Transfer::None)
          width = lib_width
          height = lib_height
          ::Box(Proc(Gtk::DrawingArea, Int32, Int32, Nil)).unbox(_lib_box).call(_sender, width, height)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::DrawingArea, Int32, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_width : Int32, lib_height : Int32, _lib_box : Pointer(Void)) {
          _sender = Gtk::DrawingArea.new(_lib_sender, GICrystal::Transfer::None)
          width = lib_width
          height = lib_height
          ::Box(Proc(Gtk::DrawingArea, Int32, Int32, Nil)).unbox(_lib_box).call(_sender, width, height)
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
