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
  # the [iface@Gtk.Scrollable] interface, are added directly. For other types
  # of widget, the class [class@Gtk.Viewport] acts as an adaptor, giving
  # scrollability to other widgets. [method@Gtk.ScrolledWindow.set_child]
  # intelligently accounts for whether or not the added child is a `GtkScrollable`.
  # If it isn’t, then it wraps the child in a `GtkViewport`. Therefore, you can
  # just add any child widget and not worry about the details.
  #
  # If [method@Gtk.ScrolledWindow.set_child] has added a `GtkViewport` for you,
  # you can remove both your added child widget from the `GtkViewport`, and the
  # `GtkViewport` from the `GtkScrolledWindow`, like this:
  #
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
  # scrollbars, is controlled by the [property@Gtk.ScrolledWindow:hadjustment]
  # and [property@Gtk.ScrolledWindow:vadjustment] that are associated with the
  # `GtkScrolledWindow`. See the docs on [class@Gtk.Scrollbar] for the details,
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
  class ScrolledWindow < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, hadjustment : Gtk::Adjustment? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_frame : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hscrollbar_policy : Gtk::PolicyType? = nil, kinetic_scrolling : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, max_content_height : Int32? = nil, max_content_width : Int32? = nil, min_content_height : Int32? = nil, min_content_width : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, overlay_scrolling : Bool? = nil, parent : Gtk::Widget? = nil, propagate_natural_height : Bool? = nil, propagate_natural_width : Bool? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, vadjustment : Gtk::Adjustment? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, vscrollbar_policy : Gtk::PolicyType? = nil, width_request : Int32? = nil, window_placement : Gtk::CornerType? = nil)
      _names = uninitialized Pointer(LibC::Char)[50]
      _values = StaticArray(LibGObject::Value, 50).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
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
      if child
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
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
      if hadjustment
        (_names.to_unsafe + _n).value = "hadjustment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hadjustment)
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
      if has_focus
        (_names.to_unsafe + _n).value = "has-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_focus)
        _n += 1
      end
      if has_frame
        (_names.to_unsafe + _n).value = "has-frame".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_frame)
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
      if hscrollbar_policy
        (_names.to_unsafe + _n).value = "hscrollbar-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hscrollbar_policy)
        _n += 1
      end
      if kinetic_scrolling
        (_names.to_unsafe + _n).value = "kinetic-scrolling".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, kinetic_scrolling)
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
      if max_content_height
        (_names.to_unsafe + _n).value = "max-content-height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_content_height)
        _n += 1
      end
      if max_content_width
        (_names.to_unsafe + _n).value = "max-content-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_content_width)
        _n += 1
      end
      if min_content_height
        (_names.to_unsafe + _n).value = "min-content-height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, min_content_height)
        _n += 1
      end
      if min_content_width
        (_names.to_unsafe + _n).value = "min-content-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, min_content_width)
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
      if overlay_scrolling
        (_names.to_unsafe + _n).value = "overlay-scrolling".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overlay_scrolling)
        _n += 1
      end
      if parent
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if propagate_natural_height
        (_names.to_unsafe + _n).value = "propagate-natural-height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagate_natural_height)
        _n += 1
      end
      if propagate_natural_width
        (_names.to_unsafe + _n).value = "propagate-natural-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagate_natural_width)
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
      if vadjustment
        (_names.to_unsafe + _n).value = "vadjustment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vadjustment)
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
      if vscrollbar_policy
        (_names.to_unsafe + _n).value = "vscrollbar-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vscrollbar_policy)
        _n += 1
      end
      if width_request
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end
      if window_placement
        (_names.to_unsafe + _n).value = "window-placement".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, window_placement)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ScrolledWindow.g_type, _n, _names, _values)
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
      Gtk::PolicyType.from_value(value)
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
      Gtk::PolicyType.from_value(value)
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
      Gtk::CornerType.from_value(value)
    end

    def initialize
      # gtk_scrolled_window_new: (Constructor)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_scrolled_window_new

      # Return value handling
      @pointer = _retval
      LibGObject.g_object_ref(_retval)
    end

    def child : Gtk::Widget?
      # gtk_scrolled_window_get_child: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_child(self)

      # Return value handling
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def hadjustment : Gtk::Adjustment
      # gtk_scrolled_window_get_hadjustment: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_hadjustment(self)

      # Return value handling
      Gtk::Adjustment.new(_retval, GICrystal::Transfer::None)
    end

    def has_frame : Bool
      # gtk_scrolled_window_get_has_frame: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_has_frame(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def hscrollbar : Gtk::Widget
      # gtk_scrolled_window_get_hscrollbar: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_hscrollbar(self)

      # Return value handling
      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    def kinetic_scrolling : Bool
      # gtk_scrolled_window_get_kinetic_scrolling: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_kinetic_scrolling(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def max_content_height : Int32
      # gtk_scrolled_window_get_max_content_height: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_max_content_height(self)

      # Return value handling
      _retval
    end

    def max_content_width : Int32
      # gtk_scrolled_window_get_max_content_width: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_max_content_width(self)

      # Return value handling
      _retval
    end

    def min_content_height : Int32
      # gtk_scrolled_window_get_min_content_height: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_min_content_height(self)

      # Return value handling
      _retval
    end

    def min_content_width : Int32
      # gtk_scrolled_window_get_min_content_width: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_min_content_width(self)

      # Return value handling
      _retval
    end

    def overlay_scrolling : Bool
      # gtk_scrolled_window_get_overlay_scrolling: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_overlay_scrolling(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def placement : Gtk::CornerType
      # gtk_scrolled_window_get_placement: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_placement(self)

      # Return value handling
      Gtk::CornerType.from_value(_retval)
    end

    def policy : Nil
      # gtk_scrolled_window_get_policy: (Method)
      # @hscrollbar_policy: (out) (transfer full) (optional)
      # @vscrollbar_policy: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      hscrollbar_policy = Pointer(UInt32).null
      vscrollbar_policy = Pointer(UInt32).null

      # C call
      LibGtk.gtk_scrolled_window_get_policy(self, hscrollbar_policy, vscrollbar_policy)

      # Return value handling
    end

    def propagate_natural_height : Bool
      # gtk_scrolled_window_get_propagate_natural_height: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_propagate_natural_height(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def propagate_natural_width : Bool
      # gtk_scrolled_window_get_propagate_natural_width: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_propagate_natural_width(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def vadjustment : Gtk::Adjustment
      # gtk_scrolled_window_get_vadjustment: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_vadjustment(self)

      # Return value handling
      Gtk::Adjustment.new(_retval, GICrystal::Transfer::None)
    end

    def vscrollbar : Gtk::Widget
      # gtk_scrolled_window_get_vscrollbar: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_scrolled_window_get_vscrollbar(self)

      # Return value handling
      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    def child=(child : Gtk::Widget?) : Nil
      # gtk_scrolled_window_set_child: (Method | Setter)
      # @child: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      # C call
      LibGtk.gtk_scrolled_window_set_child(self, child)

      # Return value handling
    end

    def hadjustment=(hadjustment : Gtk::Adjustment?) : Nil
      # gtk_scrolled_window_set_hadjustment: (Method | Setter)
      # @hadjustment: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      hadjustment = if hadjustment.nil?
                      Pointer(Void).null
                    else
                      hadjustment.to_unsafe
                    end

      # C call
      LibGtk.gtk_scrolled_window_set_hadjustment(self, hadjustment)

      # Return value handling
    end

    def has_frame=(has_frame : Bool) : Nil
      # gtk_scrolled_window_set_has_frame: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_scrolled_window_set_has_frame(self, has_frame)

      # Return value handling
    end

    def kinetic_scrolling=(kinetic_scrolling : Bool) : Nil
      # gtk_scrolled_window_set_kinetic_scrolling: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_scrolled_window_set_kinetic_scrolling(self, kinetic_scrolling)

      # Return value handling
    end

    def max_content_height=(height : Int32) : Nil
      # gtk_scrolled_window_set_max_content_height: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_scrolled_window_set_max_content_height(self, height)

      # Return value handling
    end

    def max_content_width=(width : Int32) : Nil
      # gtk_scrolled_window_set_max_content_width: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_scrolled_window_set_max_content_width(self, width)

      # Return value handling
    end

    def min_content_height=(height : Int32) : Nil
      # gtk_scrolled_window_set_min_content_height: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_scrolled_window_set_min_content_height(self, height)

      # Return value handling
    end

    def min_content_width=(width : Int32) : Nil
      # gtk_scrolled_window_set_min_content_width: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_scrolled_window_set_min_content_width(self, width)

      # Return value handling
    end

    def overlay_scrolling=(overlay_scrolling : Bool) : Nil
      # gtk_scrolled_window_set_overlay_scrolling: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_scrolled_window_set_overlay_scrolling(self, overlay_scrolling)

      # Return value handling
    end

    def placement=(window_placement : Gtk::CornerType) : Nil
      # gtk_scrolled_window_set_placement: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_scrolled_window_set_placement(self, window_placement)

      # Return value handling
    end

    def set_policy(hscrollbar_policy : Gtk::PolicyType, vscrollbar_policy : Gtk::PolicyType) : Nil
      # gtk_scrolled_window_set_policy: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_scrolled_window_set_policy(self, hscrollbar_policy, vscrollbar_policy)

      # Return value handling
    end

    def propagate_natural_height=(propagate : Bool) : Nil
      # gtk_scrolled_window_set_propagate_natural_height: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_scrolled_window_set_propagate_natural_height(self, propagate)

      # Return value handling
    end

    def propagate_natural_width=(propagate : Bool) : Nil
      # gtk_scrolled_window_set_propagate_natural_width: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_scrolled_window_set_propagate_natural_width(self, propagate)

      # Return value handling
    end

    def vadjustment=(vadjustment : Gtk::Adjustment?) : Nil
      # gtk_scrolled_window_set_vadjustment: (Method | Setter)
      # @vadjustment: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      vadjustment = if vadjustment.nil?
                      Pointer(Void).null
                    else
                      vadjustment.to_unsafe
                    end

      # C call
      LibGtk.gtk_scrolled_window_set_vadjustment(self, vadjustment)

      # Return value handling
    end

    def unset_placement : Nil
      # gtk_scrolled_window_unset_placement: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_scrolled_window_unset_placement(self)

      # Return value handling
    end

    struct EdgeOvershotSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "edge-overshot::#{@detail}" : "edge-overshot"
      end

      def connect(&block : Proc(Gtk::PositionType, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::PositionType, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::PositionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::PositionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::PositionType, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PositionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::PositionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::PositionType, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::ScrolledWindow, Gtk::PositionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::ScrolledWindow.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PositionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::ScrolledWindow, Gtk::PositionType, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ScrolledWindow, Gtk::PositionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::ScrolledWindow.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PositionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::ScrolledWindow, Gtk::PositionType, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(pos : Gtk::PositionType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "edge-overshot", pos)
      end
    end

    def edge_overshot_signal
      EdgeOvershotSignal.new(self)
    end

    struct EdgeReachedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "edge-reached::#{@detail}" : "edge-reached"
      end

      def connect(&block : Proc(Gtk::PositionType, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::PositionType, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::PositionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::PositionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::PositionType, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PositionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::PositionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::PositionType, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::ScrolledWindow, Gtk::PositionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::ScrolledWindow.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PositionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::ScrolledWindow, Gtk::PositionType, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ScrolledWindow, Gtk::PositionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::ScrolledWindow.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PositionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::ScrolledWindow, Gtk::PositionType, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(pos : Gtk::PositionType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "edge-reached", pos)
      end
    end

    def edge_reached_signal
      EdgeReachedSignal.new(self)
    end

    struct MoveFocusOutSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "move-focus-out::#{@detail}" : "move-focus-out"
      end

      def connect(&block : Proc(Gtk::DirectionType, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::DirectionType, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::DirectionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::DirectionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::DirectionType, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DirectionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::DirectionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::DirectionType, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::ScrolledWindow, Gtk::DirectionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::ScrolledWindow.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::DirectionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::ScrolledWindow, Gtk::DirectionType, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ScrolledWindow, Gtk::DirectionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::ScrolledWindow.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::DirectionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::ScrolledWindow, Gtk::DirectionType, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(direction_type : Gtk::DirectionType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-focus-out", direction_type)
      end
    end

    def move_focus_out_signal
      MoveFocusOutSignal.new(self)
    end

    struct ScrollChildSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "scroll-child::#{@detail}" : "scroll-child"
      end

      def connect(&block : Proc(Gtk::ScrollType, Bool, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::ScrollType, Bool, Bool))
        connect(block)
      end

      def connect(block : Proc(Gtk::ScrollType, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : LibC::Int, box : Pointer(Void)) {
          arg0 = Gtk::ScrollType.from_value(lib_arg0)
          arg1 = GICrystal.to_bool(lib_arg1)
          ::Box(Proc(Gtk::ScrollType, Bool, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ScrollType, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : LibC::Int, box : Pointer(Void)) {
          arg0 = Gtk::ScrollType.from_value(lib_arg0)
          arg1 = GICrystal.to_bool(lib_arg1)
          ::Box(Proc(Gtk::ScrollType, Bool, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::ScrolledWindow, Gtk::ScrollType, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::ScrolledWindow.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ScrollType.from_value(lib_arg0)
          arg1 = GICrystal.to_bool(lib_arg1)
          ::Box(Proc(Gtk::ScrolledWindow, Gtk::ScrollType, Bool, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ScrolledWindow, Gtk::ScrollType, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::ScrolledWindow.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ScrollType.from_value(lib_arg0)
          arg1 = GICrystal.to_bool(lib_arg1)
          ::Box(Proc(Gtk::ScrolledWindow, Gtk::ScrollType, Bool, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
