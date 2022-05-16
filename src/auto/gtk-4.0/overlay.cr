require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkOverlay` is a container which contains a single main child, on top
  # of which it can place “overlay” widgets.
  #
  # ![An example GtkOverlay](overlay.png)
  #
  # The position of each overlay widget is determined by its
  # `Gtk::Widget#halign` and `Gtk::Widget#valign`
  # properties. E.g. a widget with both alignments set to %GTK_ALIGN_START
  # will be placed at the top left corner of the `GtkOverlay` container,
  # whereas an overlay with halign set to %GTK_ALIGN_CENTER and valign set
  # to %GTK_ALIGN_END will be placed a the bottom edge of the `GtkOverlay`,
  # horizontally centered. The position can be adjusted by setting the margin
  # properties of the child to non-zero values.
  #
  # More complicated placement of overlays is possible by connecting
  # to the [signal@Gtk.Overlay::get-child-position] signal.
  #
  # An overlay’s minimum and natural sizes are those of its main child.
  # The sizes of overlay children are not considered when measuring these
  # preferred sizes.
  #
  # # GtkOverlay as GtkBuildable
  #
  # The `GtkOverlay` implementation of the `GtkBuildable` interface
  # supports placing a child as an overlay by specifying “overlay” as
  # the “type” attribute of a `<child>` element.
  #
  # # CSS nodes
  #
  # `GtkOverlay` has a single CSS node with the name “overlay”. Overlay children
  # whose alignments cause them to be positioned at an edge get the style classes
  # “.left”, “.right”, “.top”, and/or “.bottom” according to their position.
  @[GObject::GeneratedWrapper]
  class Overlay < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::Overlay), instance_init, 0)
    end

    GICrystal.define_new_method(Overlay, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Overlay`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[36]
      _values = StaticArray(LibGObject::Value, 36).new(LibGObject::Value.new)
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
      if !child.nil?
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
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

      @pointer = LibGObject.g_object_new_with_properties(Overlay.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_overlay_get_type
    end

    def child=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "child", unsafe_value, Pointer(Void).null)
      value
    end

    def child : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "child", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Creates a new `GtkOverlay`.
    def initialize
      # gtk_overlay_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_overlay_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Adds @widget to @overlay.
    #
    # The widget will be stacked on top of the main widget
    # added with `Gtk::Overlay#child=`.
    #
    # The position at which @widget is placed is determined
    # from its `Gtk::Widget#halign` and
    # `Gtk::Widget#valign` properties.
    def add_overlay(widget : Gtk::Widget) : Nil
      # gtk_overlay_add_overlay: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_overlay_add_overlay(@pointer, widget)

      # Return value handling
    end

    # Gets the child widget of @overlay.
    def child : Gtk::Widget?
      # gtk_overlay_get_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_overlay_get_child(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets whether @widget should be clipped within the parent.
    def clip_overlay(widget : Gtk::Widget) : Bool
      # gtk_overlay_get_clip_overlay: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_overlay_get_clip_overlay(@pointer, widget)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether @widget's size is included in the measurement of
    # @overlay.
    def measure_overlay(widget : Gtk::Widget) : Bool
      # gtk_overlay_get_measure_overlay: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_overlay_get_measure_overlay(@pointer, widget)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Removes an overlay that was added with gtk_overlay_add_overlay().
    def remove_overlay(widget : Gtk::Widget) : Nil
      # gtk_overlay_remove_overlay: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_overlay_remove_overlay(@pointer, widget)

      # Return value handling
    end

    # Sets the child widget of @overlay.
    def child=(child : Gtk::Widget?) : Nil
      # gtk_overlay_set_child: (Method | Setter)
      # @child: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      # C call
      LibGtk.gtk_overlay_set_child(@pointer, child)

      # Return value handling
    end

    # Sets whether @widget should be clipped within the parent.
    def set_clip_overlay(widget : Gtk::Widget, clip_overlay : Bool) : Nil
      # gtk_overlay_set_clip_overlay: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_overlay_set_clip_overlay(@pointer, widget, clip_overlay)

      # Return value handling
    end

    # Sets whether @widget is included in the measured size of @overlay.
    #
    # The overlay will request the size of the largest child that has
    # this property set to %TRUE. Children who are not included may
    # be drawn outside of @overlay's allocation if they are too large.
    def set_measure_overlay(widget : Gtk::Widget, measure : Bool) : Nil
      # gtk_overlay_set_measure_overlay: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_overlay_set_measure_overlay(@pointer, widget, measure)

      # Return value handling
    end

    # Emitted to determine the position and size of any overlay
    # child widgets.
    #
    # A handler for this signal should fill @allocation with
    # the desired position and size for @widget, relative to
    # the 'main' child of @overlay.
    #
    # The default handler for this signal uses the @widget's
    # halign and valign properties to determine the position
    # and gives the widget its natural size (except that an
    # alignment of %GTK_ALIGN_FILL will cause the overlay to
    # be full-width/height). If the main child is a
    # `GtkScrolledWindow`, the overlays are placed relative
    # to its contents.
    struct GetChildPositionSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "get-child-position::#{@detail}" : "get-child-position"
      end

      def connect(&block : Proc(Gtk::Widget, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::Widget, Bool))
        connect(block)
      end

      def connect(handler : Proc(Gtk::Widget, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_widget : Pointer(Void), lib_allocation : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          widget = Gtk::Widget.new(lib_widget, :none)
          # Generator::CallerAllocatesPlan
          ::Box(Proc(Gtk::Widget, Bool)).unbox(_lib_box).call(widget)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::Widget, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_widget : Pointer(Void), lib_allocation : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          widget = Gtk::Widget.new(lib_widget, :none)
          # Generator::CallerAllocatesPlan
          ::Box(Proc(Gtk::Widget, Bool)).unbox(_lib_box).call(widget)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::Overlay, Gtk::Widget, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_widget : Pointer(Void), lib_allocation : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Overlay.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          widget = Gtk::Widget.new(lib_widget, :none)
          # Generator::CallerAllocatesPlan
          ::Box(Proc(Gtk::Overlay, Gtk::Widget, Bool)).unbox(_lib_box).call(_sender, widget)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::Overlay, Gtk::Widget, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_widget : Pointer(Void), lib_allocation : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Overlay.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          widget = Gtk::Widget.new(lib_widget, :none)
          # Generator::CallerAllocatesPlan
          ::Box(Proc(Gtk::Overlay, Gtk::Widget, Bool)).unbox(_lib_box).call(_sender, widget)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(widget : Gtk::Widget) : Nil
        # Generator::CallerAllocatesPlan
        allocation = Gdk::Rectangle.new
        LibGObject.g_signal_emit_by_name(@source, "get-child-position", widget, allocation)
      end
    end

    def get_child_position_signal
      GetChildPositionSignal.new(self)
    end
  end
end
