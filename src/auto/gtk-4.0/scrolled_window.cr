require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkScrolledWindow` is a container that makes its child scrollable.
  #
  # It does so using either internally added scrollbars or externally
  # associated adjustments, and optionally draws a frame around the child.
  #
  # Widgets with native scrolling support, i.e. those whose classes implement
  # the `Gtk#Scrollable` interface, are added directly. For other types
  # of widget, the class `Gtk#Viewport` acts as an adaptor, giving
  # scrollability to other widgets. `Gtk::ScrolledWindow#child=`
  # intelligently accounts for whether or not the added child is a `GtkScrollable`.
  # If it isn’t, then it wraps the child in a `GtkViewport`. Therefore, you can
  # just add any child widget and not worry about the details.
  #
  # If `Gtk::ScrolledWindow#child=` has added a `GtkViewport` for you,
  # you can remove both your added child widget from the `GtkViewport`, and the
  # `GtkViewport` from the `GtkScrolledWindow`, like this:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # GtkWidget *scrolled_window = gtk_scrolled_window_new ();
  # GtkWidget *child_widget = gtk_button_new ();
  #
  # // GtkButton is not a GtkScrollable, so GtkScrolledWindow will automatically
  # // add a GtkViewport.
  # gtk_box_append (GTK_BOX (scrolled_window), child_widget);
  #
  # // Either of these will result in child_widget being unparented:
  # gtk_box_remove (GTK_BOX (scrolled_window), child_widget);
  # // or
  # gtk_box_remove (GTK_BOX (scrolled_window),
  #                       gtk_bin_get_child (GTK_BIN (scrolled_window)));
  # ```
  #
  # Unless [property@Gtk.ScrolledWindow:hscrollbar-policy] and
  # [property@Gtk.ScrolledWindow:vscrollbar-policy] are %GTK_POLICY_NEVER or
  # %GTK_POLICY_EXTERNAL, `GtkScrolledWindow` adds internal `GtkScrollbar` widgets
  # around its child. The scroll position of the child, and if applicable the
  # scrollbars, is controlled by the `Gtk::ScrolledWindow#hadjustment`
  # and `Gtk::ScrolledWindow#vadjustment` that are associated with the
  # `GtkScrolledWindow`. See the docs on `Gtk#Scrollbar` for the details,
  # but note that the “step_increment” and “page_increment” fields are only
  # effective if the policy causes scrollbars to be present.
  #
  # If a `GtkScrolledWindow` doesn’t behave quite as you would like, or
  # doesn’t have exactly the right layout, it’s very possible to set up
  # your own scrolling with `GtkScrollbar` and for example a `GtkGrid`.
  #
  # # Touch support
  #
  # `GtkScrolledWindow` has built-in support for touch devices. When a
  # touchscreen is used, swiping will move the scrolled window, and will
  # expose 'kinetic' behavior. This can be turned off with the
  # [property@Gtk.ScrolledWindow:kinetic-scrolling] property if it is undesired.
  #
  # `GtkScrolledWindow` also displays visual 'overshoot' indication when
  # the content is pulled beyond the end, and this situation can be
  # captured with the [signal@Gtk.ScrolledWindow::edge-overshot] signal.
  #
  # If no mouse device is present, the scrollbars will overlaid as
  # narrow, auto-hiding indicators over the content. If traditional
  # scrollbars are desired although no mouse is present, this behaviour
  # can be turned off with the [property@Gtk.ScrolledWindow:overlay-scrolling]
  # property.
  #
  # # CSS nodes
  #
  # `GtkScrolledWindow` has a main CSS node with name scrolledwindow.
  # It gets a .frame style class added when [property@Gtk.ScrolledWindow:has-frame]
  # is %TRUE.
  #
  # It uses subnodes with names overshoot and undershoot to draw the overflow
  # and underflow indications. These nodes get the .left, .right, .top or .bottom
  # style class added depending on where the indication is drawn.
  #
  # `GtkScrolledWindow` also sets the positional style classes (.left, .right,
  # .top, .bottom) and style classes related to overlay scrolling
  # (.overlay-indicator, .dragging, .hovering) on its scrollbars.
  #
  # If both scrollbars are visible, the area where they meet is drawn
  # with a subnode named junction.
  #
  # # Accessibility
  #
  # `GtkScrolledWindow` uses the %GTK_ACCESSIBLE_ROLE_GROUP role.
  @[GObject::GeneratedWrapper]
  class ScrolledWindow < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(ScrolledWindow, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ScrolledWindow`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, hadjustment : Gtk::Adjustment? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_frame : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hscrollbar_policy : Gtk::PolicyType? = nil, kinetic_scrolling : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, max_content_height : Int32? = nil, max_content_width : Int32? = nil, min_content_height : Int32? = nil, min_content_width : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, overlay_scrolling : Bool? = nil, parent : Gtk::Widget? = nil, propagate_natural_height : Bool? = nil, propagate_natural_width : Bool? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, vadjustment : Gtk::Adjustment? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, vscrollbar_policy : Gtk::PolicyType? = nil, width_request : Int32? = nil, window_placement : Gtk::CornerType? = nil)
      _names = uninitialized Pointer(LibC::Char)[50]
      _values = StaticArray(LibGObject::Value, 50).new(LibGObject::Value.new)
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
      if !hadjustment.nil?
        (_names.to_unsafe + _n).value = "hadjustment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hadjustment)
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
      if !has_frame.nil?
        (_names.to_unsafe + _n).value = "has-frame".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_frame)
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
      if !hscrollbar_policy.nil?
        (_names.to_unsafe + _n).value = "hscrollbar-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hscrollbar_policy)
        _n += 1
      end
      if !kinetic_scrolling.nil?
        (_names.to_unsafe + _n).value = "kinetic-scrolling".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, kinetic_scrolling)
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
      if !max_content_height.nil?
        (_names.to_unsafe + _n).value = "max-content-height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_content_height)
        _n += 1
      end
      if !max_content_width.nil?
        (_names.to_unsafe + _n).value = "max-content-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_content_width)
        _n += 1
      end
      if !min_content_height.nil?
        (_names.to_unsafe + _n).value = "min-content-height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, min_content_height)
        _n += 1
      end
      if !min_content_width.nil?
        (_names.to_unsafe + _n).value = "min-content-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, min_content_width)
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
      if !overlay_scrolling.nil?
        (_names.to_unsafe + _n).value = "overlay-scrolling".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overlay_scrolling)
        _n += 1
      end
      if !parent.nil?
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if !propagate_natural_height.nil?
        (_names.to_unsafe + _n).value = "propagate-natural-height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagate_natural_height)
        _n += 1
      end
      if !propagate_natural_width.nil?
        (_names.to_unsafe + _n).value = "propagate-natural-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagate_natural_width)
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
      if !vadjustment.nil?
        (_names.to_unsafe + _n).value = "vadjustment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vadjustment)
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
      if !vscrollbar_policy.nil?
        (_names.to_unsafe + _n).value = "vscrollbar-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vscrollbar_policy)
        _n += 1
      end
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end
      if !window_placement.nil?
        (_names.to_unsafe + _n).value = "window-placement".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, window_placement)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ScrolledWindow.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_scrolled_window_get_type
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

    def hadjustment=(value : Gtk::Adjustment?) : Gtk::Adjustment?
      unsafe_value = value

      LibGObject.g_object_set(self, "hadjustment", unsafe_value, Pointer(Void).null)
      value
    end

    def hadjustment : Gtk::Adjustment?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "hadjustment", pointerof(value), Pointer(Void).null)
      Gtk::Adjustment.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def has_frame=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "has-frame", unsafe_value, Pointer(Void).null)
      value
    end

    def has_frame? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "has-frame", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def hscrollbar_policy=(value : Gtk::PolicyType) : Gtk::PolicyType
      unsafe_value = value

      LibGObject.g_object_set(self, "hscrollbar-policy", unsafe_value, Pointer(Void).null)
      value
    end

    def hscrollbar_policy : Gtk::PolicyType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "hscrollbar-policy", pointerof(value), Pointer(Void).null)
      Gtk::PolicyType.new(value)
    end

    def kinetic_scrolling=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "kinetic-scrolling", unsafe_value, Pointer(Void).null)
      value
    end

    def kinetic_scrolling? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "kinetic-scrolling", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def max_content_height=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "max-content-height", unsafe_value, Pointer(Void).null)
      value
    end

    def max_content_height : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "max-content-height", pointerof(value), Pointer(Void).null)
      value
    end

    def max_content_width=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "max-content-width", unsafe_value, Pointer(Void).null)
      value
    end

    def max_content_width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "max-content-width", pointerof(value), Pointer(Void).null)
      value
    end

    def min_content_height=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "min-content-height", unsafe_value, Pointer(Void).null)
      value
    end

    def min_content_height : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "min-content-height", pointerof(value), Pointer(Void).null)
      value
    end

    def min_content_width=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "min-content-width", unsafe_value, Pointer(Void).null)
      value
    end

    def min_content_width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "min-content-width", pointerof(value), Pointer(Void).null)
      value
    end

    def overlay_scrolling=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "overlay-scrolling", unsafe_value, Pointer(Void).null)
      value
    end

    def overlay_scrolling? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "overlay-scrolling", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def propagate_natural_height=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "propagate-natural-height", unsafe_value, Pointer(Void).null)
      value
    end

    def propagate_natural_height? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "propagate-natural-height", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def propagate_natural_width=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "propagate-natural-width", unsafe_value, Pointer(Void).null)
      value
    end

    def propagate_natural_width? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "propagate-natural-width", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def vadjustment=(value : Gtk::Adjustment?) : Gtk::Adjustment?
      unsafe_value = value

      LibGObject.g_object_set(self, "vadjustment", unsafe_value, Pointer(Void).null)
      value
    end

    def vadjustment : Gtk::Adjustment?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "vadjustment", pointerof(value), Pointer(Void).null)
      Gtk::Adjustment.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def vscrollbar_policy=(value : Gtk::PolicyType) : Gtk::PolicyType
      unsafe_value = value

      LibGObject.g_object_set(self, "vscrollbar-policy", unsafe_value, Pointer(Void).null)
      value
    end

    def vscrollbar_policy : Gtk::PolicyType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "vscrollbar-policy", pointerof(value), Pointer(Void).null)
      Gtk::PolicyType.new(value)
    end

    def window_placement=(value : Gtk::CornerType) : Gtk::CornerType
      unsafe_value = value

      LibGObject.g_object_set(self, "window-placement", unsafe_value, Pointer(Void).null)
      value
    end

    def window_placement : Gtk::CornerType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "window-placement", pointerof(value), Pointer(Void).null)
      Gtk::CornerType.new(value)
    end

    # Gets the child widget of @scrolled_window.
    def child : Gtk::Widget?
      # gtk_scrolled_window_get_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_child(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the horizontal scrollbar’s adjustment.
    #
    # This is the adjustment used to connect the horizontal scrollbar
    # to the child widget’s horizontal scroll functionality.
    def hadjustment : Gtk::Adjustment
      # gtk_scrolled_window_get_hadjustment: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_hadjustment(@pointer)

      # Return value handling

      Gtk::Adjustment.new(_retval, GICrystal::Transfer::None)
    end

    # Gets whether the scrolled window draws a frame.
    def has_frame : Bool
      # gtk_scrolled_window_get_has_frame: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_has_frame(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the horizontal scrollbar of @scrolled_window.
    def hscrollbar : Gtk::Widget
      # gtk_scrolled_window_get_hscrollbar: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_hscrollbar(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    # Returns the specified kinetic scrolling behavior.
    def kinetic_scrolling : Bool
      # gtk_scrolled_window_get_kinetic_scrolling: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_kinetic_scrolling(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the maximum content height set.
    def max_content_height : Int32
      # gtk_scrolled_window_get_max_content_height: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_max_content_height(@pointer)

      # Return value handling

      _retval
    end

    # Returns the maximum content width set.
    def max_content_width : Int32
      # gtk_scrolled_window_get_max_content_width: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_max_content_width(@pointer)

      # Return value handling

      _retval
    end

    # Gets the minimal content height of @scrolled_window.
    def min_content_height : Int32
      # gtk_scrolled_window_get_min_content_height: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_min_content_height(@pointer)

      # Return value handling

      _retval
    end

    # Gets the minimum content width of @scrolled_window.
    def min_content_width : Int32
      # gtk_scrolled_window_get_min_content_width: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_min_content_width(@pointer)

      # Return value handling

      _retval
    end

    # Returns whether overlay scrolling is enabled for this scrolled window.
    def overlay_scrolling : Bool
      # gtk_scrolled_window_get_overlay_scrolling: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_overlay_scrolling(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the placement of the contents with respect to the scrollbars.
    def placement : Gtk::CornerType
      # gtk_scrolled_window_get_placement: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_placement(@pointer)

      # Return value handling

      Gtk::CornerType.new(_retval)
    end

    # Retrieves the current policy values for the horizontal and vertical
    # scrollbars.
    #
    # See `Gtk::ScrolledWindow#policy=`.
    def policy : Nil
      # gtk_scrolled_window_get_policy: (Method)
      # @hscrollbar_policy: (out) (transfer full) (optional)
      # @vscrollbar_policy: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      hscrollbar_policy = Pointer(UInt32).null # Generator::OutArgUsedInReturnPlan
      vscrollbar_policy = Pointer(UInt32).null
      # C call
      LibGtk.gtk_scrolled_window_get_policy(@pointer, hscrollbar_policy, vscrollbar_policy)

      # Return value handling
    end

    # Reports whether the natural height of the child will be calculated
    # and propagated through the scrolled window’s requested natural height.
    def propagate_natural_height : Bool
      # gtk_scrolled_window_get_propagate_natural_height: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_propagate_natural_height(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Reports whether the natural width of the child will be calculated
    # and propagated through the scrolled window’s requested natural width.
    def propagate_natural_width : Bool
      # gtk_scrolled_window_get_propagate_natural_width: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_propagate_natural_width(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the vertical scrollbar’s adjustment.
    #
    # This is the adjustment used to connect the vertical
    # scrollbar to the child widget’s vertical scroll functionality.
    def vadjustment : Gtk::Adjustment
      # gtk_scrolled_window_get_vadjustment: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_vadjustment(@pointer)

      # Return value handling

      Gtk::Adjustment.new(_retval, GICrystal::Transfer::None)
    end

    # Returns the vertical scrollbar of @scrolled_window.
    def vscrollbar : Gtk::Widget
      # gtk_scrolled_window_get_vscrollbar: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_vscrollbar(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    # Sets the child widget of @scrolled_window.
    def child=(child : Gtk::Widget?) : Nil
      # gtk_scrolled_window_set_child: (Method | Setter)
      # @child: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      # C call
      LibGtk.gtk_scrolled_window_set_child(@pointer, child)

      # Return value handling
    end

    # Sets the `GtkAdjustment` for the horizontal scrollbar.
    def hadjustment=(hadjustment : Gtk::Adjustment?) : Nil
      # gtk_scrolled_window_set_hadjustment: (Method | Setter)
      # @hadjustment: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      hadjustment = if hadjustment.nil?
                      Pointer(Void).null
                    else
                      hadjustment.to_unsafe
                    end

      # C call
      LibGtk.gtk_scrolled_window_set_hadjustment(@pointer, hadjustment)

      # Return value handling
    end

    # Changes the frame drawn around the contents of @scrolled_window.
    def has_frame=(has_frame : Bool) : Nil
      # gtk_scrolled_window_set_has_frame: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_scrolled_window_set_has_frame(@pointer, has_frame)

      # Return value handling
    end

    # Turns kinetic scrolling on or off.
    #
    # Kinetic scrolling only applies to devices with source
    # %GDK_SOURCE_TOUCHSCREEN.
    def kinetic_scrolling=(kinetic_scrolling : Bool) : Nil
      # gtk_scrolled_window_set_kinetic_scrolling: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_scrolled_window_set_kinetic_scrolling(@pointer, kinetic_scrolling)

      # Return value handling
    end

    # Sets the maximum height that @scrolled_window should keep visible.
    #
    # The @scrolled_window will grow up to this height before it starts
    # scrolling the content.
    #
    # It is a programming error to set the maximum content height to a value
    # smaller than [property@Gtk.ScrolledWindow:min-content-height].
    def max_content_height=(height : Int32) : Nil
      # gtk_scrolled_window_set_max_content_height: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_scrolled_window_set_max_content_height(@pointer, height)

      # Return value handling
    end

    # Sets the maximum width that @scrolled_window should keep visible.
    #
    # The @scrolled_window will grow up to this width before it starts
    # scrolling the content.
    #
    # It is a programming error to set the maximum content width to a
    # value smaller than [property@Gtk.ScrolledWindow:min-content-width].
    def max_content_width=(width : Int32) : Nil
      # gtk_scrolled_window_set_max_content_width: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_scrolled_window_set_max_content_width(@pointer, width)

      # Return value handling
    end

    # Sets the minimum height that @scrolled_window should keep visible.
    #
    # Note that this can and (usually will) be smaller than the minimum
    # size of the content.
    #
    # It is a programming error to set the minimum content height to a
    # value greater than [property@Gtk.ScrolledWindow:max-content-height].
    def min_content_height=(height : Int32) : Nil
      # gtk_scrolled_window_set_min_content_height: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_scrolled_window_set_min_content_height(@pointer, height)

      # Return value handling
    end

    # Sets the minimum width that @scrolled_window should keep visible.
    #
    # Note that this can and (usually will) be smaller than the minimum
    # size of the content.
    #
    # It is a programming error to set the minimum content width to a
    # value greater than [property@Gtk.ScrolledWindow:max-content-width].
    def min_content_width=(width : Int32) : Nil
      # gtk_scrolled_window_set_min_content_width: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_scrolled_window_set_min_content_width(@pointer, width)

      # Return value handling
    end

    # Enables or disables overlay scrolling for this scrolled window.
    def overlay_scrolling=(overlay_scrolling : Bool) : Nil
      # gtk_scrolled_window_set_overlay_scrolling: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_scrolled_window_set_overlay_scrolling(@pointer, overlay_scrolling)

      # Return value handling
    end

    # Sets the placement of the contents with respect to the scrollbars
    # for the scrolled window.
    #
    # The default is %GTK_CORNER_TOP_LEFT, meaning the child is
    # in the top left, with the scrollbars underneath and to the right.
    # Other values in `Gtk#CornerType` are %GTK_CORNER_TOP_RIGHT,
    # %GTK_CORNER_BOTTOM_LEFT, and %GTK_CORNER_BOTTOM_RIGHT.
    #
    # See also `Gtk::ScrolledWindow#placement` and
    # `Gtk::ScrolledWindow#unset_placement`.
    def placement=(window_placement : Gtk::CornerType) : Nil
      # gtk_scrolled_window_set_placement: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_scrolled_window_set_placement(@pointer, window_placement)

      # Return value handling
    end

    # Sets the scrollbar policy for the horizontal and vertical scrollbars.
    #
    # The policy determines when the scrollbar should appear; it is a value
    # from the `Gtk#PolicyType` enumeration. If %GTK_POLICY_ALWAYS, the
    # scrollbar is always present; if %GTK_POLICY_NEVER, the scrollbar is
    # never present; if %GTK_POLICY_AUTOMATIC, the scrollbar is present only
    # if needed (that is, if the slider part of the bar would be smaller
    # than the trough — the display is larger than the page size).
    def set_policy(hscrollbar_policy : Gtk::PolicyType, vscrollbar_policy : Gtk::PolicyType) : Nil
      # gtk_scrolled_window_set_policy: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_scrolled_window_set_policy(@pointer, hscrollbar_policy, vscrollbar_policy)

      # Return value handling
    end

    # Sets whether the natural height of the child should be calculated
    # and propagated through the scrolled window’s requested natural height.
    def propagate_natural_height=(propagate : Bool) : Nil
      # gtk_scrolled_window_set_propagate_natural_height: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_scrolled_window_set_propagate_natural_height(@pointer, propagate)

      # Return value handling
    end

    # Sets whether the natural width of the child should be calculated
    # and propagated through the scrolled window’s requested natural width.
    def propagate_natural_width=(propagate : Bool) : Nil
      # gtk_scrolled_window_set_propagate_natural_width: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_scrolled_window_set_propagate_natural_width(@pointer, propagate)

      # Return value handling
    end

    # Sets the `GtkAdjustment` for the vertical scrollbar.
    def vadjustment=(vadjustment : Gtk::Adjustment?) : Nil
      # gtk_scrolled_window_set_vadjustment: (Method | Setter)
      # @vadjustment: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      vadjustment = if vadjustment.nil?
                      Pointer(Void).null
                    else
                      vadjustment.to_unsafe
                    end

      # C call
      LibGtk.gtk_scrolled_window_set_vadjustment(@pointer, vadjustment)

      # Return value handling
    end

    # Unsets the placement of the contents with respect to the scrollbars.
    #
    # If no window placement is set for a scrolled window,
    # it defaults to %GTK_CORNER_TOP_LEFT.
    def unset_placement : Nil
      # gtk_scrolled_window_unset_placement: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_scrolled_window_unset_placement(@pointer)

      # Return value handling
    end

    # Emitted whenever user initiated scrolling makes the scrolled
    # window firmly surpass the limits defined by the adjustment
    # in that orientation.
    #
    # A similar behavior without edge resistance is provided by the
    # [signal@Gtk.ScrolledWindow::edge-reached] signal.
    #
    # Note: The @pos argument is LTR/RTL aware, so callers should be
    # aware too if intending to provide behavior on horizontal edges.
    struct EdgeOvershotSignal < GObject::Signal
      def name : String
        @detail ? "edge-overshot::#{@detail}" : "edge-overshot"
      end

      def connect(*, after : Bool = false, &block : Proc(Gtk::PositionType, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gtk::PositionType, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_pos : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          pos = Gtk::PositionType.new(lib_pos)
          ::Box(Proc(Gtk::PositionType, Nil)).unbox(_lib_box).call(pos)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::ScrolledWindow, Gtk::PositionType, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_pos : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::ScrolledWindow.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          pos = Gtk::PositionType.new(lib_pos)
          ::Box(Proc(Gtk::ScrolledWindow, Gtk::PositionType, Nil)).unbox(_lib_box).call(_sender, pos)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(pos : Gtk::PositionType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "edge-overshot", pos)
      end
    end

    def edge_overshot_signal
      EdgeOvershotSignal.new(self)
    end

    # Emitted whenever user-initiated scrolling makes the scrolled
    # window exactly reach the lower or upper limits defined by the
    # adjustment in that orientation.
    #
    # A similar behavior with edge resistance is provided by the
    # [signal@Gtk.ScrolledWindow::edge-overshot] signal.
    #
    # Note: The @pos argument is LTR/RTL aware, so callers should be
    # aware too if intending to provide behavior on horizontal edges.
    struct EdgeReachedSignal < GObject::Signal
      def name : String
        @detail ? "edge-reached::#{@detail}" : "edge-reached"
      end

      def connect(*, after : Bool = false, &block : Proc(Gtk::PositionType, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gtk::PositionType, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_pos : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          pos = Gtk::PositionType.new(lib_pos)
          ::Box(Proc(Gtk::PositionType, Nil)).unbox(_lib_box).call(pos)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::ScrolledWindow, Gtk::PositionType, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_pos : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::ScrolledWindow.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          pos = Gtk::PositionType.new(lib_pos)
          ::Box(Proc(Gtk::ScrolledWindow, Gtk::PositionType, Nil)).unbox(_lib_box).call(_sender, pos)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(pos : Gtk::PositionType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "edge-reached", pos)
      end
    end

    def edge_reached_signal
      EdgeReachedSignal.new(self)
    end

    # Emitted when focus is moved away from the scrolled window by a
    # keybinding.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # The default bindings for this signal are
    # `Ctrl + Tab` to move forward and `Ctrl + Shift + Tab` to
    # move backward.
    struct MoveFocusOutSignal < GObject::Signal
      def name : String
        @detail ? "move-focus-out::#{@detail}" : "move-focus-out"
      end

      def connect(*, after : Bool = false, &block : Proc(Gtk::DirectionType, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gtk::DirectionType, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_direction_type : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          direction_type = Gtk::DirectionType.new(lib_direction_type)
          ::Box(Proc(Gtk::DirectionType, Nil)).unbox(_lib_box).call(direction_type)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::ScrolledWindow, Gtk::DirectionType, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_direction_type : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::ScrolledWindow.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          direction_type = Gtk::DirectionType.new(lib_direction_type)
          ::Box(Proc(Gtk::ScrolledWindow, Gtk::DirectionType, Nil)).unbox(_lib_box).call(_sender, direction_type)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(direction_type : Gtk::DirectionType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-focus-out", direction_type)
      end
    end

    def move_focus_out_signal
      MoveFocusOutSignal.new(self)
    end

    # Emitted when a keybinding that scrolls is pressed.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # The horizontal or vertical adjustment is updated which triggers a
    # signal that the scrolled window’s child may listen to and scroll itself.
    struct ScrollChildSignal < GObject::Signal
      def name : String
        @detail ? "scroll-child::#{@detail}" : "scroll-child"
      end

      def connect(*, after : Bool = false, &block : Proc(Gtk::ScrollType, Bool, Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gtk::ScrollType, Bool, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_scroll : UInt32, lib_horizontal : LibC::Int, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          scroll = Gtk::ScrollType.new(lib_scroll)
          horizontal = lib_horizontal
          ::Box(Proc(Gtk::ScrollType, Bool, Bool)).unbox(_lib_box).call(scroll, horizontal)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::ScrolledWindow, Gtk::ScrollType, Bool, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_scroll : UInt32, lib_horizontal : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::ScrolledWindow.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          scroll = Gtk::ScrollType.new(lib_scroll)
          horizontal = lib_horizontal
          ::Box(Proc(Gtk::ScrolledWindow, Gtk::ScrollType, Bool, Bool)).unbox(_lib_box).call(_sender, scroll, horizontal)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(scroll : Gtk::ScrollType, horizontal : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "scroll-child", scroll, horizontal)
      end
    end

    def scroll_child_signal
      ScrollChildSignal.new(self)
    end
  end
end
