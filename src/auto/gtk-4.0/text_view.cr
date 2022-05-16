require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./scrollable"

module Gtk
  # A widget that displays the contents of a `Gtk#TextBuffer`.
  #
  # ![An example GtkTextview](multiline-text.png)
  #
  # You may wish to begin by reading the [conceptual overview](section-text-widget.html),
  # which gives an overview of all the objects and data types related to the
  # text widget and how they work together.
  #
  # ## CSS nodes
  #
  # ```
  # textview.view
  # ├── border.top
  # ├── border.left
  # ├── text
  # │ ╰── [selection]
  # ├── border.right
  # ├── border.bottom
  # ╰── [window.popup]
  # ```
  #
  # `GtkTextView` has a main css node with name textview and style class .view,
  # and subnodes for each of the border windows, and the main text area,
  # with names border and text, respectively. The border nodes each get
  # one of the style classes .left, .right, .top or .bottom.
  #
  # A node representing the selection will appear below the text node.
  #
  # If a context menu is opened, the window node will appear as a subnode
  # of the main node.
  #
  # ## Accessibility
  #
  # `GtkTextView` uses the %GTK_ACCESSIBLE_ROLE_TEXT_BOX role.
  @[GObject::GeneratedWrapper]
  class TextView < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Scrollable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::TextViewClass), class_init,
        sizeof(LibGtk::TextView), instance_init, 0)
    end

    GICrystal.define_new_method(TextView, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `TextView`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accepts_tab : Bool? = nil, accessible_role : Gtk::AccessibleRole? = nil, bottom_margin : Int32? = nil, buffer : Gtk::TextBuffer? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, cursor_visible : Bool? = nil, editable : Bool? = nil, extra_menu : Gio::MenuModel? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, hadjustment : Gtk::Adjustment? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hscroll_policy : Gtk::ScrollablePolicy? = nil, im_module : ::String? = nil, indent : Int32? = nil, input_hints : Gtk::InputHints? = nil, input_purpose : Gtk::InputPurpose? = nil, justification : Gtk::Justification? = nil, layout_manager : Gtk::LayoutManager? = nil, left_margin : Int32? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, monospace : Bool? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, overwrite : Bool? = nil, parent : Gtk::Widget? = nil, pixels_above_lines : Int32? = nil, pixels_below_lines : Int32? = nil, pixels_inside_wrap : Int32? = nil, receives_default : Bool? = nil, right_margin : Int32? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tabs : Pango::TabArray? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, top_margin : Int32? = nil, vadjustment : Gtk::Adjustment? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, vscroll_policy : Gtk::ScrollablePolicy? = nil, width_request : Int32? = nil, wrap_mode : Gtk::WrapMode? = nil)
      _names = uninitialized Pointer(LibC::Char)[60]
      _values = StaticArray(LibGObject::Value, 60).new(LibGObject::Value.new)
      _n = 0

      if !accepts_tab.nil?
        (_names.to_unsafe + _n).value = "accepts-tab".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accepts_tab)
        _n += 1
      end
      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !bottom_margin.nil?
        (_names.to_unsafe + _n).value = "bottom-margin".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, bottom_margin)
        _n += 1
      end
      if !buffer.nil?
        (_names.to_unsafe + _n).value = "buffer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, buffer)
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
      if !cursor_visible.nil?
        (_names.to_unsafe + _n).value = "cursor-visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor_visible)
        _n += 1
      end
      if !editable.nil?
        (_names.to_unsafe + _n).value = "editable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editable)
        _n += 1
      end
      if !extra_menu.nil?
        (_names.to_unsafe + _n).value = "extra-menu".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, extra_menu)
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
      if !hscroll_policy.nil?
        (_names.to_unsafe + _n).value = "hscroll-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hscroll_policy)
        _n += 1
      end
      if !im_module.nil?
        (_names.to_unsafe + _n).value = "im-module".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, im_module)
        _n += 1
      end
      if !indent.nil?
        (_names.to_unsafe + _n).value = "indent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, indent)
        _n += 1
      end
      if !input_hints.nil?
        (_names.to_unsafe + _n).value = "input-hints".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_hints)
        _n += 1
      end
      if !input_purpose.nil?
        (_names.to_unsafe + _n).value = "input-purpose".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_purpose)
        _n += 1
      end
      if !justification.nil?
        (_names.to_unsafe + _n).value = "justification".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, justification)
        _n += 1
      end
      if !layout_manager.nil?
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if !left_margin.nil?
        (_names.to_unsafe + _n).value = "left-margin".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, left_margin)
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
      if !monospace.nil?
        (_names.to_unsafe + _n).value = "monospace".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, monospace)
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
      if !overwrite.nil?
        (_names.to_unsafe + _n).value = "overwrite".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overwrite)
        _n += 1
      end
      if !parent.nil?
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if !pixels_above_lines.nil?
        (_names.to_unsafe + _n).value = "pixels-above-lines".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixels_above_lines)
        _n += 1
      end
      if !pixels_below_lines.nil?
        (_names.to_unsafe + _n).value = "pixels-below-lines".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixels_below_lines)
        _n += 1
      end
      if !pixels_inside_wrap.nil?
        (_names.to_unsafe + _n).value = "pixels-inside-wrap".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixels_inside_wrap)
        _n += 1
      end
      if !receives_default.nil?
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if !right_margin.nil?
        (_names.to_unsafe + _n).value = "right-margin".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, right_margin)
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
      if !tabs.nil?
        (_names.to_unsafe + _n).value = "tabs".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tabs)
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
      if !top_margin.nil?
        (_names.to_unsafe + _n).value = "top-margin".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, top_margin)
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
      if !vscroll_policy.nil?
        (_names.to_unsafe + _n).value = "vscroll-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vscroll_policy)
        _n += 1
      end
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end
      if !wrap_mode.nil?
        (_names.to_unsafe + _n).value = "wrap-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, wrap_mode)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TextView.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_text_view_get_type
    end

    def accepts_tab=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "accepts-tab", unsafe_value, Pointer(Void).null)
      value
    end

    def accepts_tab? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "accepts-tab", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def bottom_margin=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "bottom-margin", unsafe_value, Pointer(Void).null)
      value
    end

    def bottom_margin : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "bottom-margin", pointerof(value), Pointer(Void).null)
      value
    end

    def buffer=(value : Gtk::TextBuffer?) : Gtk::TextBuffer?
      unsafe_value = value

      LibGObject.g_object_set(self, "buffer", unsafe_value, Pointer(Void).null)
      value
    end

    def buffer : Gtk::TextBuffer?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "buffer", pointerof(value), Pointer(Void).null)
      Gtk::TextBuffer.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def cursor_visible=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "cursor-visible", unsafe_value, Pointer(Void).null)
      value
    end

    def cursor_visible? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "cursor-visible", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def editable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "editable", unsafe_value, Pointer(Void).null)
      value
    end

    def editable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "editable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def extra_menu=(value : Gio::MenuModel?) : Gio::MenuModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "extra-menu", unsafe_value, Pointer(Void).null)
      value
    end

    def extra_menu : Gio::MenuModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "extra-menu", pointerof(value), Pointer(Void).null)
      Gio::MenuModel.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def im_module=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "im-module", unsafe_value, Pointer(Void).null)
      value
    end

    def im_module : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "im-module", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def indent=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "indent", unsafe_value, Pointer(Void).null)
      value
    end

    def indent : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "indent", pointerof(value), Pointer(Void).null)
      value
    end

    def input_hints=(value : Gtk::InputHints) : Gtk::InputHints
      unsafe_value = value

      LibGObject.g_object_set(self, "input-hints", unsafe_value, Pointer(Void).null)
      value
    end

    def input_hints : Gtk::InputHints
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "input-hints", pointerof(value), Pointer(Void).null)
      Gtk::InputHints.new(value)
    end

    def input_purpose=(value : Gtk::InputPurpose) : Gtk::InputPurpose
      unsafe_value = value

      LibGObject.g_object_set(self, "input-purpose", unsafe_value, Pointer(Void).null)
      value
    end

    def input_purpose : Gtk::InputPurpose
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "input-purpose", pointerof(value), Pointer(Void).null)
      Gtk::InputPurpose.new(value)
    end

    def justification=(value : Gtk::Justification) : Gtk::Justification
      unsafe_value = value

      LibGObject.g_object_set(self, "justification", unsafe_value, Pointer(Void).null)
      value
    end

    def justification : Gtk::Justification
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "justification", pointerof(value), Pointer(Void).null)
      Gtk::Justification.new(value)
    end

    def left_margin=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "left-margin", unsafe_value, Pointer(Void).null)
      value
    end

    def left_margin : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "left-margin", pointerof(value), Pointer(Void).null)
      value
    end

    def monospace=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "monospace", unsafe_value, Pointer(Void).null)
      value
    end

    def monospace? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "monospace", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def overwrite=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "overwrite", unsafe_value, Pointer(Void).null)
      value
    end

    def overwrite? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "overwrite", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def pixels_above_lines=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "pixels-above-lines", unsafe_value, Pointer(Void).null)
      value
    end

    def pixels_above_lines : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "pixels-above-lines", pointerof(value), Pointer(Void).null)
      value
    end

    def pixels_below_lines=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "pixels-below-lines", unsafe_value, Pointer(Void).null)
      value
    end

    def pixels_below_lines : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "pixels-below-lines", pointerof(value), Pointer(Void).null)
      value
    end

    def pixels_inside_wrap=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "pixels-inside-wrap", unsafe_value, Pointer(Void).null)
      value
    end

    def pixels_inside_wrap : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "pixels-inside-wrap", pointerof(value), Pointer(Void).null)
      value
    end

    def right_margin=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "right-margin", unsafe_value, Pointer(Void).null)
      value
    end

    def right_margin : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "right-margin", pointerof(value), Pointer(Void).null)
      value
    end

    def tabs=(value : Pango::TabArray?) : Pango::TabArray?
      unsafe_value = value

      LibGObject.g_object_set(self, "tabs", unsafe_value, Pointer(Void).null)
      value
    end

    def tabs : Pango::TabArray?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "tabs", pointerof(value), Pointer(Void).null)
      Pango::TabArray.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def top_margin=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "top-margin", unsafe_value, Pointer(Void).null)
      value
    end

    def top_margin : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "top-margin", pointerof(value), Pointer(Void).null)
      value
    end

    def wrap_mode=(value : Gtk::WrapMode) : Gtk::WrapMode
      unsafe_value = value

      LibGObject.g_object_set(self, "wrap-mode", unsafe_value, Pointer(Void).null)
      value
    end

    def wrap_mode : Gtk::WrapMode
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "wrap-mode", pointerof(value), Pointer(Void).null)
      Gtk::WrapMode.new(value)
    end

    # Creates a new `GtkTextView`.
    #
    # If you don’t call `Gtk::TextView#buffer=` before using the
    # text view, an empty default buffer will be created for you. Get the
    # buffer with `Gtk::TextView#buffer`. If you want to specify
    # your own buffer, consider `Gtk::TextView#new_with_buffer`.
    def initialize
      # gtk_text_view_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Creates a new `GtkTextView` widget displaying the buffer @buffer.
    #
    # One buffer can be shared among many widgets. @buffer may be %NULL
    # to create a default buffer, in which case this function is equivalent
    # to `Gtk::TextView.new`. The text view adds its own reference count
    # to the buffer; it does not take over an existing reference.
    def self.new_with_buffer(buffer : Gtk::TextBuffer) : self
      # gtk_text_view_new_with_buffer: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_new_with_buffer(buffer)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::TextView.new(_retval, GICrystal::Transfer::Full)
    end

    # Adds a child widget in the text buffer, at the given @anchor.
    def add_child_at_anchor(child : Gtk::Widget, anchor : Gtk::TextChildAnchor) : Nil
      # gtk_text_view_add_child_at_anchor: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_add_child_at_anchor(@pointer, child, anchor)

      # Return value handling
    end

    # Adds @child at a fixed coordinate in the `GtkTextView`'s text window.
    #
    # The @xpos and @ypos must be in buffer coordinates (see
    # `Gtk::TextView#iter_location` to convert to
    # buffer coordinates).
    #
    # @child will scroll with the text view.
    #
    # If instead you want a widget that will not move with the
    # `GtkTextView` contents see `GtkOverlay`.
    def add_overlay(child : Gtk::Widget, xpos : Int32, ypos : Int32) : Nil
      # gtk_text_view_add_overlay: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_add_overlay(@pointer, child, xpos, ypos)

      # Return value handling
    end

    # Moves the given @iter backward by one display (wrapped) line.
    #
    # A display line is different from a paragraph. Paragraphs are
    # separated by newlines or other paragraph separator characters.
    # Display lines are created by line-wrapping a paragraph. If
    # wrapping is turned off, display lines and paragraphs will be the
    # same. Display lines are divided differently for each view, since
    # they depend on the view’s width; paragraphs are the same in all
    # views, since they depend on the contents of the `GtkTextBuffer`.
    def backward_display_line(iter : Gtk::TextIter) : Bool
      # gtk_text_view_backward_display_line: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_backward_display_line(@pointer, iter)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Moves the given @iter backward to the next display line start.
    #
    # A display line is different from a paragraph. Paragraphs are
    # separated by newlines or other paragraph separator characters.
    # Display lines are created by line-wrapping a paragraph. If
    # wrapping is turned off, display lines and paragraphs will be the
    # same. Display lines are divided differently for each view, since
    # they depend on the view’s width; paragraphs are the same in all
    # views, since they depend on the contents of the `GtkTextBuffer`.
    def backward_display_line_start(iter : Gtk::TextIter) : Bool
      # gtk_text_view_backward_display_line_start: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_backward_display_line_start(@pointer, iter)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Converts buffer coordinates to window coordinates.
    def buffer_to_window_coords(win : Gtk::TextWindowType, buffer_x : Int32, buffer_y : Int32) : Nil
      # gtk_text_view_buffer_to_window_coords: (Method)
      # @window_x: (out) (transfer full) (optional)
      # @window_y: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      window_x = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      window_y = Pointer(Int32).null
      # C call
      LibGtk.gtk_text_view_buffer_to_window_coords(@pointer, win, buffer_x, buffer_y, window_x, window_y)

      # Return value handling
    end

    # Moves the given @iter forward by one display (wrapped) line.
    #
    # A display line is different from a paragraph. Paragraphs are
    # separated by newlines or other paragraph separator characters.
    # Display lines are created by line-wrapping a paragraph. If
    # wrapping is turned off, display lines and paragraphs will be the
    # same. Display lines are divided differently for each view, since
    # they depend on the view’s width; paragraphs are the same in all
    # views, since they depend on the contents of the `GtkTextBuffer`.
    def forward_display_line(iter : Gtk::TextIter) : Bool
      # gtk_text_view_forward_display_line: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_forward_display_line(@pointer, iter)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Moves the given @iter forward to the next display line end.
    #
    # A display line is different from a paragraph. Paragraphs are
    # separated by newlines or other paragraph separator characters.
    # Display lines are created by line-wrapping a paragraph. If
    # wrapping is turned off, display lines and paragraphs will be the
    # same. Display lines are divided differently for each view, since
    # they depend on the view’s width; paragraphs are the same in all
    # views, since they depend on the contents of the `GtkTextBuffer`.
    def forward_display_line_end(iter : Gtk::TextIter) : Bool
      # gtk_text_view_forward_display_line_end: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_forward_display_line_end(@pointer, iter)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether pressing the <kbd>Tab</kbd> key inserts a tab characters.
    #
    # See `Gtk::TextView#accepts_tab=`.
    def accepts_tab : Bool
      # gtk_text_view_get_accepts_tab: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_accepts_tab(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the bottom margin for text in the @text_view.
    def bottom_margin : Int32
      # gtk_text_view_get_bottom_margin: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_bottom_margin(@pointer)

      # Return value handling

      _retval
    end

    # Returns the `GtkTextBuffer` being displayed by this text view.
    #
    # The reference count on the buffer is not incremented; the caller
    # of this function won’t own a new reference.
    def buffer : Gtk::TextBuffer
      # gtk_text_view_get_buffer: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_buffer(@pointer)

      # Return value handling

      Gtk::TextBuffer.new(_retval, GICrystal::Transfer::None)
    end

    # Determine the positions of the strong and weak cursors if the
    # insertion point is at @iter.
    #
    # The position of each cursor is stored as a zero-width rectangle.
    # The strong cursor location is the location where characters of
    # the directionality equal to the base direction of the paragraph
    # are inserted. The weak cursor location is the location where
    # characters of the directionality opposite to the base direction
    # of the paragraph are inserted.
    #
    # If @iter is %NULL, the actual cursor position is used.
    #
    # Note that if @iter happens to be the actual cursor position, and
    # there is currently an IM preedit sequence being entered, the
    # returned locations will be adjusted to account for the preedit
    # cursor’s offset within the preedit sequence.
    #
    # The rectangle position is in buffer coordinates; use
    # `Gtk::TextView#buffer_to_window_coords` to convert these
    # coordinates to coordinates for one of the windows in the text view.
    def cursor_locations(iter : Gtk::TextIter?) : Gdk::Rectangle
      # gtk_text_view_get_cursor_locations: (Method)
      # @iter: (nullable)
      # @strong: (out) (caller-allocates) (optional)
      # @weak: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      iter = if iter.nil?
               Pointer(Void).null
             else
               iter.to_unsafe
             end
      # Generator::OutArgUsedInReturnPlan
      strong = Pointer(Void).null # Generator::CallerAllocatesPlan
      strong = Gdk::Rectangle.new # Generator::OutArgUsedInReturnPlan
      weak = Pointer(Void).null   # Generator::CallerAllocatesPlan
      weak = Gdk::Rectangle.new
      # C call
      LibGtk.gtk_text_view_get_cursor_locations(@pointer, iter, strong, weak)

      # Return value handling

      strong
    end

    # Find out whether the cursor should be displayed.
    def cursor_visible : Bool
      # gtk_text_view_get_cursor_visible: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_cursor_visible(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the default editability of the `GtkTextView`.
    #
    # Tags in the buffer may override this setting for some ranges of text.
    def editable : Bool
      # gtk_text_view_get_editable: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_editable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the menu model that gets added to the context menu
    # or %NULL if none has been set.
    def extra_menu : Gio::MenuModel
      # gtk_text_view_get_extra_menu: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_extra_menu(@pointer)

      # Return value handling

      Gio::MenuModel.new(_retval, GICrystal::Transfer::None)
    end

    # Gets a `GtkWidget` that has previously been set as gutter.
    #
    # See `Gtk::TextView#gutter=`.
    #
    # @win must be one of %GTK_TEXT_WINDOW_LEFT, %GTK_TEXT_WINDOW_RIGHT,
    # %GTK_TEXT_WINDOW_TOP, or %GTK_TEXT_WINDOW_BOTTOM.
    def gutter(win : Gtk::TextWindowType) : Gtk::Widget?
      # gtk_text_view_get_gutter: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_gutter(@pointer, win)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the default indentation of paragraphs in @text_view.
    #
    # Tags in the view’s buffer may override the default.
    # The indentation may be negative.
    def indent : Int32
      # gtk_text_view_get_indent: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_indent(@pointer)

      # Return value handling

      _retval
    end

    # Gets the `input-hints` of the `GtkTextView`.
    def input_hints : Gtk::InputHints
      # gtk_text_view_get_input_hints: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_input_hints(@pointer)

      # Return value handling

      Gtk::InputHints.new(_retval)
    end

    # Gets the `input-purpose` of the `GtkTextView`.
    def input_purpose : Gtk::InputPurpose
      # gtk_text_view_get_input_purpose: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_input_purpose(@pointer)

      # Return value handling

      Gtk::InputPurpose.new(_retval)
    end

    # Retrieves the iterator at buffer coordinates @x and @y.
    #
    # Buffer coordinates are coordinates for the entire buffer, not just
    # the currently-displayed portion. If you have coordinates from an
    # event, you have to convert those to buffer coordinates with
    # `Gtk::TextView#window_to_buffer_coords`.
    def iter_at_location(x : Int32, y : Int32) : Gtk::TextIter
      # gtk_text_view_get_iter_at_location: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::TextIter.new
      # C call
      _retval = LibGtk.gtk_text_view_get_iter_at_location(@pointer, iter, x, y)

      # Return value handling

      iter
    end

    # Retrieves the iterator pointing to the character at buffer
    # coordinates @x and @y.
    #
    # Buffer coordinates are coordinates for the entire buffer, not just
    # the currently-displayed portion. If you have coordinates from an event,
    # you have to convert those to buffer coordinates with
    # `Gtk::TextView#window_to_buffer_coords`.
    #
    # Note that this is different from `Gtk::TextView#iter_at_location`,
    # which returns cursor locations, i.e. positions between characters.
    def iter_at_position(x : Int32, y : Int32) : Gtk::TextIter
      # gtk_text_view_get_iter_at_position: (Method)
      # @iter: (out) (caller-allocates)
      # @trailing: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::TextIter.new # Generator::OutArgUsedInReturnPlan
      trailing = Pointer(Int32).null
      # C call
      _retval = LibGtk.gtk_text_view_get_iter_at_position(@pointer, iter, trailing, x, y)

      # Return value handling

      iter
    end

    # Gets a rectangle which roughly contains the character at @iter.
    #
    # The rectangle position is in buffer coordinates; use
    # `Gtk::TextView#buffer_to_window_coords` to convert these
    # coordinates to coordinates for one of the windows in the text view.
    def iter_location(iter : Gtk::TextIter) : Gdk::Rectangle
      # gtk_text_view_get_iter_location: (Method)
      # @location: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      location = Gdk::Rectangle.new
      # C call
      LibGtk.gtk_text_view_get_iter_location(@pointer, iter, location)

      # Return value handling

      location
    end

    # Gets the default justification of paragraphs in @text_view.
    #
    # Tags in the buffer may override the default.
    def justification : Gtk::Justification
      # gtk_text_view_get_justification: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_justification(@pointer)

      # Return value handling

      Gtk::Justification.new(_retval)
    end

    # Gets the default left margin size of paragraphs in the @text_view.
    #
    # Tags in the buffer may override the default.
    def left_margin : Int32
      # gtk_text_view_get_left_margin: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_left_margin(@pointer)

      # Return value handling

      _retval
    end

    # Gets the `GtkTextIter` at the start of the line containing
    # the coordinate @y.
    #
    # @y is in buffer coordinates, convert from window coordinates with
    # `Gtk::TextView#window_to_buffer_coords`. If non-%NULL,
    # @line_top will be filled with the coordinate of the top edge
    # of the line.
    def line_at_y(y : Int32, line_top : Int32) : Gtk::TextIter
      # gtk_text_view_get_line_at_y: (Method)
      # @target_iter: (out) (caller-allocates)
      # @line_top: (out) (transfer full)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      target_iter = Gtk::TextIter.new
      # C call
      LibGtk.gtk_text_view_get_line_at_y(@pointer, target_iter, y, line_top)

      # Return value handling

      target_iter
    end

    # Gets the y coordinate of the top of the line containing @iter,
    # and the height of the line.
    #
    # The coordinate is a buffer coordinate; convert to window
    # coordinates with `Gtk::TextView#buffer_to_window_coords`.
    def line_yrange(iter : Gtk::TextIter, y : Int32, height : Int32) : Nil
      # gtk_text_view_get_line_yrange: (Method)
      # @y: (out) (transfer full)
      # @height: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_get_line_yrange(@pointer, iter, y, height)

      # Return value handling
    end

    # Gets the `PangoContext` that is used for rendering LTR directed
    # text layouts.
    #
    # The context may be replaced when CSS changes occur.
    def ltr_context : Pango::Context
      # gtk_text_view_get_ltr_context: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_ltr_context(@pointer)

      # Return value handling

      Pango::Context.new(_retval, GICrystal::Transfer::None)
    end

    # Gets whether the `GtkTextView` uses monospace styling.
    def monospace : Bool
      # gtk_text_view_get_monospace: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_monospace(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the `GtkTextView` is in overwrite mode or not.
    def overwrite : Bool
      # gtk_text_view_get_overwrite: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_overwrite(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the default number of pixels to put above paragraphs.
    #
    # Adding this function with `Gtk::TextView#pixels_below_lines`
    # is equal to the line space between each paragraph.
    def pixels_above_lines : Int32
      # gtk_text_view_get_pixels_above_lines: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_pixels_above_lines(@pointer)

      # Return value handling

      _retval
    end

    # Gets the default number of pixels to put below paragraphs.
    #
    # The line space is the sum of the value returned by this function and
    # the value returned by `Gtk::TextView#pixels_above_lines`.
    def pixels_below_lines : Int32
      # gtk_text_view_get_pixels_below_lines: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_pixels_below_lines(@pointer)

      # Return value handling

      _retval
    end

    # Gets the default number of pixels to put between wrapped lines
    # inside a paragraph.
    def pixels_inside_wrap : Int32
      # gtk_text_view_get_pixels_inside_wrap: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_pixels_inside_wrap(@pointer)

      # Return value handling

      _retval
    end

    # Gets the default right margin for text in @text_view.
    #
    # Tags in the buffer may override the default.
    def right_margin : Int32
      # gtk_text_view_get_right_margin: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_right_margin(@pointer)

      # Return value handling

      _retval
    end

    # Gets the `PangoContext` that is used for rendering RTL directed
    # text layouts.
    #
    # The context may be replaced when CSS changes occur.
    def rtl_context : Pango::Context
      # gtk_text_view_get_rtl_context: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_rtl_context(@pointer)

      # Return value handling

      Pango::Context.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the default tabs for @text_view.
    #
    # Tags in the buffer may override the defaults. The returned array
    # will be %NULL if “standard” (8-space) tabs are used. Free the
    # return value with `Pango::TabArray#free`.
    def tabs : Pango::TabArray?
      # gtk_text_view_get_tabs: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_text_view_get_tabs(@pointer)

      # Return value handling

      Pango::TabArray.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets the top margin for text in the @text_view.
    def top_margin : Int32
      # gtk_text_view_get_top_margin: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_top_margin(@pointer)

      # Return value handling

      _retval
    end

    # Fills @visible_rect with the currently-visible
    # region of the buffer, in buffer coordinates.
    #
    # Convert to window coordinates with
    # `Gtk::TextView#buffer_to_window_coords`.
    def visible_rect : Gdk::Rectangle
      # gtk_text_view_get_visible_rect: (Method)
      # @visible_rect: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      visible_rect = Gdk::Rectangle.new
      # C call
      LibGtk.gtk_text_view_get_visible_rect(@pointer, visible_rect)

      # Return value handling

      visible_rect
    end

    # Gets the line wrapping for the view.
    def wrap_mode : Gtk::WrapMode
      # gtk_text_view_get_wrap_mode: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_get_wrap_mode(@pointer)

      # Return value handling

      Gtk::WrapMode.new(_retval)
    end

    # Allow the `GtkTextView` input method to internally handle key press
    # and release events.
    #
    # If this function returns %TRUE, then no further processing should be
    # done for this key event. See `Gtk::IMContext#filter_keypress`.
    #
    # Note that you are expected to call this function from your handler
    # when overriding key event handling. This is needed in the case when
    # you need to insert your own key handling between the input method
    # and the default key event handling of the `GtkTextView`.
    #
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # static gboolean
    # gtk_foo_bar_key_press_event (GtkWidget *widget,
    #                              GdkEvent  *event)
    # {
    #   guint keyval;
    #
    #   gdk_event_get_keyval ((GdkEvent*)event, &keyval);
    #
    #   if (keyval == GDK_KEY_Return || keyval == GDK_KEY_KP_Enter)
    #     {
    #       if (gtk_text_view_im_context_filter_keypress (GTK_TEXT_VIEW (widget), event))
    #         return TRUE;
    #     }
    #
    #   // Do some stuff
    #
    #   return GTK_WIDGET_CLASS (gtk_foo_bar_parent_class)->key_press_event (widget, event);
    # }
    # ```
    def im_context_filter_keypress(event : Gdk::Event) : Bool
      # gtk_text_view_im_context_filter_keypress: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_im_context_filter_keypress(@pointer, event)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Moves a mark within the buffer so that it's
    # located within the currently-visible text area.
    def move_mark_onscreen(mark : Gtk::TextMark) : Bool
      # gtk_text_view_move_mark_onscreen: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_move_mark_onscreen(@pointer, mark)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Updates the position of a child.
    #
    # See `Gtk::TextView#add_overlay`.
    def move_overlay(child : Gtk::Widget, xpos : Int32, ypos : Int32) : Nil
      # gtk_text_view_move_overlay: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_move_overlay(@pointer, child, xpos, ypos)

      # Return value handling
    end

    # Move the iterator a given number of characters visually, treating
    # it as the strong cursor position.
    #
    # If @count is positive, then the new strong cursor position will
    # be @count positions to the right of the old cursor position.
    # If @count is negative then the new strong cursor position will
    # be @count positions to the left of the old cursor position.
    #
    # In the presence of bi-directional text, the correspondence
    # between logical and visual order will depend on the direction
    # of the current run, and there may be jumps when the cursor
    # is moved off of the end of a run.
    def move_visually(iter : Gtk::TextIter, count : Int32) : Bool
      # gtk_text_view_move_visually: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_move_visually(@pointer, iter, count)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Moves the cursor to the currently visible region of the
    # buffer.
    def place_cursor_onscreen : Bool
      # gtk_text_view_place_cursor_onscreen: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_place_cursor_onscreen(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Removes a child widget from @text_view.
    def remove(child : Gtk::Widget) : Nil
      # gtk_text_view_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_remove(@pointer, child)

      # Return value handling
    end

    # Ensures that the cursor is shown.
    #
    # This also resets the time that it will stay blinking (or
    # visible, in case blinking is disabled).
    #
    # This function should be called in response to user input
    # (e.g. from derived classes that override the textview's
    # event handlers).
    def reset_cursor_blink : Nil
      # gtk_text_view_reset_cursor_blink: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_reset_cursor_blink(@pointer)

      # Return value handling
    end

    # Reset the input method context of the text view if needed.
    #
    # This can be necessary in the case where modifying the buffer
    # would confuse on-going input method behavior.
    def reset_im_context : Nil
      # gtk_text_view_reset_im_context: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_reset_im_context(@pointer)

      # Return value handling
    end

    # Scrolls @text_view the minimum distance such that @mark is contained
    # within the visible area of the widget.
    def scroll_mark_onscreen(mark : Gtk::TextMark) : Nil
      # gtk_text_view_scroll_mark_onscreen: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_scroll_mark_onscreen(@pointer, mark)

      # Return value handling
    end

    # Scrolls @text_view so that @iter is on the screen in the position
    # indicated by @xalign and @yalign.
    #
    # An alignment of 0.0 indicates left or top, 1.0 indicates right or
    # bottom, 0.5 means center. If @use_align is %FALSE, the text scrolls
    # the minimal distance to get the mark onscreen, possibly not scrolling
    # at all. The effective screen for purposes of this function is reduced
    # by a margin of size @within_margin.
    #
    # Note that this function uses the currently-computed height of the
    # lines in the text buffer. Line heights are computed in an idle
    # handler; so this function may not have the desired effect if it’s
    # called before the height computations. To avoid oddness, consider
    # using `Gtk::TextView#scroll_to_mark` which saves a point to be
    # scrolled to after line validation.
    def scroll_to_iter(iter : Gtk::TextIter, within_margin : Float64, use_align : Bool, xalign : Float64, yalign : Float64) : Bool
      # gtk_text_view_scroll_to_iter: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_scroll_to_iter(@pointer, iter, within_margin, use_align, xalign, yalign)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Scrolls @text_view so that @mark is on the screen in the position
    # indicated by @xalign and @yalign.
    #
    # An alignment of 0.0 indicates left or top, 1.0 indicates right or
    # bottom, 0.5 means center. If @use_align is %FALSE, the text scrolls
    # the minimal distance to get the mark onscreen, possibly not scrolling
    # at all. The effective screen for purposes of this function is reduced
    # by a margin of size @within_margin.
    def scroll_to_mark(mark : Gtk::TextMark, within_margin : Float64, use_align : Bool, xalign : Float64, yalign : Float64) : Nil
      # gtk_text_view_scroll_to_mark: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_scroll_to_mark(@pointer, mark, within_margin, use_align, xalign, yalign)

      # Return value handling
    end

    # Sets the behavior of the text widget when the <kbd>Tab</kbd> key is pressed.
    #
    # If @accepts_tab is %TRUE, a tab character is inserted. If @accepts_tab
    # is %FALSE the keyboard focus is moved to the next widget in the focus
    # chain.
    def accepts_tab=(accepts_tab : Bool) : Nil
      # gtk_text_view_set_accepts_tab: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_set_accepts_tab(@pointer, accepts_tab)

      # Return value handling
    end

    # Sets the bottom margin for text in @text_view.
    #
    # Note that this function is confusingly named.
    # In CSS terms, the value set here is padding.
    def bottom_margin=(bottom_margin : Int32) : Nil
      # gtk_text_view_set_bottom_margin: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_set_bottom_margin(@pointer, bottom_margin)

      # Return value handling
    end

    # Sets @buffer as the buffer being displayed by @text_view.
    #
    # The previous buffer displayed by the text view is unreferenced, and
    # a reference is added to @buffer. If you owned a reference to @buffer
    # before passing it to this function, you must remove that reference
    # yourself; `GtkTextView` will not “adopt” it.
    def buffer=(buffer : Gtk::TextBuffer?) : Nil
      # gtk_text_view_set_buffer: (Method | Setter)
      # @buffer: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      buffer = if buffer.nil?
                 Pointer(Void).null
               else
                 buffer.to_unsafe
               end

      # C call
      LibGtk.gtk_text_view_set_buffer(@pointer, buffer)

      # Return value handling
    end

    # Toggles whether the insertion point should be displayed.
    #
    # A buffer with no editable text probably shouldn’t have a visible
    # cursor, so you may want to turn the cursor off.
    #
    # Note that this property may be overridden by the
    # [property@GtkSettings:gtk-keynav-use-caret] setting.
    def cursor_visible=(setting : Bool) : Nil
      # gtk_text_view_set_cursor_visible: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_set_cursor_visible(@pointer, setting)

      # Return value handling
    end

    # Sets the default editability of the `GtkTextView`.
    #
    # You can override this default setting with tags in the buffer,
    # using the “editable” attribute of tags.
    def editable=(setting : Bool) : Nil
      # gtk_text_view_set_editable: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_set_editable(@pointer, setting)

      # Return value handling
    end

    # Sets a menu model to add when constructing the context
    # menu for @text_view.
    #
    # You can pass %NULL to remove a previously set extra menu.
    def extra_menu=(model : Gio::MenuModel?) : Nil
      # gtk_text_view_set_extra_menu: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_text_view_set_extra_menu(@pointer, model)

      # Return value handling
    end

    # Places @widget into the gutter specified by @win.
    #
    # @win must be one of %GTK_TEXT_WINDOW_LEFT, %GTK_TEXT_WINDOW_RIGHT,
    # %GTK_TEXT_WINDOW_TOP, or %GTK_TEXT_WINDOW_BOTTOM.
    def set_gutter(win : Gtk::TextWindowType, widget : Gtk::Widget?) : Nil
      # gtk_text_view_set_gutter: (Method)
      # @widget: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      # C call
      LibGtk.gtk_text_view_set_gutter(@pointer, win, widget)

      # Return value handling
    end

    # Sets the default indentation for paragraphs in @text_view.
    #
    # Tags in the buffer may override the default.
    def indent=(indent : Int32) : Nil
      # gtk_text_view_set_indent: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_set_indent(@pointer, indent)

      # Return value handling
    end

    # Sets the `input-hints` of the `GtkTextView`.
    #
    # The `input-hints` allow input methods to fine-tune
    # their behaviour.
    def input_hints=(hints : Gtk::InputHints) : Nil
      # gtk_text_view_set_input_hints: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_set_input_hints(@pointer, hints)

      # Return value handling
    end

    # Sets the `input-purpose` of the `GtkTextView`.
    #
    # The `input-purpose` can be used by on-screen keyboards
    # and other input methods to adjust their behaviour.
    def input_purpose=(purpose : Gtk::InputPurpose) : Nil
      # gtk_text_view_set_input_purpose: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_set_input_purpose(@pointer, purpose)

      # Return value handling
    end

    # Sets the default justification of text in @text_view.
    #
    # Tags in the view’s buffer may override the default.
    def justification=(justification : Gtk::Justification) : Nil
      # gtk_text_view_set_justification: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_set_justification(@pointer, justification)

      # Return value handling
    end

    # Sets the default left margin for text in @text_view.
    #
    # Tags in the buffer may override the default.
    #
    # Note that this function is confusingly named.
    # In CSS terms, the value set here is padding.
    def left_margin=(left_margin : Int32) : Nil
      # gtk_text_view_set_left_margin: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_set_left_margin(@pointer, left_margin)

      # Return value handling
    end

    # Sets whether the `GtkTextView` should display text in
    # monospace styling.
    def monospace=(monospace : Bool) : Nil
      # gtk_text_view_set_monospace: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_set_monospace(@pointer, monospace)

      # Return value handling
    end

    # Changes the `GtkTextView` overwrite mode.
    def overwrite=(overwrite : Bool) : Nil
      # gtk_text_view_set_overwrite: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_set_overwrite(@pointer, overwrite)

      # Return value handling
    end

    # Sets the default number of blank pixels above paragraphs in @text_view.
    #
    # Tags in the buffer for @text_view may override the defaults.
    def pixels_above_lines=(pixels_above_lines : Int32) : Nil
      # gtk_text_view_set_pixels_above_lines: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_set_pixels_above_lines(@pointer, pixels_above_lines)

      # Return value handling
    end

    # Sets the default number of pixels of blank space
    # to put below paragraphs in @text_view.
    #
    # May be overridden by tags applied to @text_view’s buffer.
    def pixels_below_lines=(pixels_below_lines : Int32) : Nil
      # gtk_text_view_set_pixels_below_lines: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_set_pixels_below_lines(@pointer, pixels_below_lines)

      # Return value handling
    end

    # Sets the default number of pixels of blank space to leave between
    # display/wrapped lines within a paragraph.
    #
    # May be overridden by tags in @text_view’s buffer.
    def pixels_inside_wrap=(pixels_inside_wrap : Int32) : Nil
      # gtk_text_view_set_pixels_inside_wrap: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_set_pixels_inside_wrap(@pointer, pixels_inside_wrap)

      # Return value handling
    end

    # Sets the default right margin for text in the text view.
    #
    # Tags in the buffer may override the default.
    #
    # Note that this function is confusingly named.
    # In CSS terms, the value set here is padding.
    def right_margin=(right_margin : Int32) : Nil
      # gtk_text_view_set_right_margin: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_set_right_margin(@pointer, right_margin)

      # Return value handling
    end

    # Sets the default tab stops for paragraphs in @text_view.
    #
    # Tags in the buffer may override the default.
    def tabs=(tabs : Pango::TabArray) : Nil
      # gtk_text_view_set_tabs: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_set_tabs(@pointer, tabs)

      # Return value handling
    end

    # Sets the top margin for text in @text_view.
    #
    # Note that this function is confusingly named.
    # In CSS terms, the value set here is padding.
    def top_margin=(top_margin : Int32) : Nil
      # gtk_text_view_set_top_margin: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_set_top_margin(@pointer, top_margin)

      # Return value handling
    end

    # Sets the line wrapping for the view.
    def wrap_mode=(wrap_mode : Gtk::WrapMode) : Nil
      # gtk_text_view_set_wrap_mode: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_view_set_wrap_mode(@pointer, wrap_mode)

      # Return value handling
    end

    # Determines whether @iter is at the start of a display line.
    #
    # See `Gtk::TextView#forward_display_line` for an
    # explanation of display lines vs. paragraphs.
    def starts_display_line(iter : Gtk::TextIter) : Bool
      # gtk_text_view_starts_display_line: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_view_starts_display_line(@pointer, iter)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Converts coordinates on the window identified by @win to buffer
    # coordinates.
    def window_to_buffer_coords(win : Gtk::TextWindowType, window_x : Int32, window_y : Int32) : Nil
      # gtk_text_view_window_to_buffer_coords: (Method)
      # @buffer_x: (out) (transfer full) (optional)
      # @buffer_y: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      buffer_x = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      buffer_y = Pointer(Int32).null
      # C call
      LibGtk.gtk_text_view_window_to_buffer_coords(@pointer, win, window_x, window_y, buffer_x, buffer_y)

      # Return value handling
    end

    # Gets emitted when the user asks for it.
    #
    # The ::backspace signal is a [keybinding signal](class.SignalAction.html).
    #
    # The default bindings for this signal are
    # <kbd>Backspace</kbd> and <kbd>Shift</kbd>-<kbd>Backspace</kbd>.
    struct BackspaceSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "backspace::#{@detail}" : "backspace"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "backspace")
      end
    end

    def backspace_signal
      BackspaceSignal.new(self)
    end

    # Gets emitted to copy the selection to the clipboard.
    #
    # The ::copy-clipboard signal is a [keybinding signal](class.SignalAction.html).
    #
    # The default bindings for this signal are
    # <kbd>Ctrl</kbd>-<kbd>c</kbd> and
    # <kbd>Ctrl</kbd>-<kbd>Insert</kbd>.
    struct CopyClipboardSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "copy-clipboard::#{@detail}" : "copy-clipboard"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "copy-clipboard")
      end
    end

    def copy_clipboard_signal
      CopyClipboardSignal.new(self)
    end

    # Gets emitted to cut the selection to the clipboard.
    #
    # The ::cut-clipboard signal is a [keybinding signal](class.SignalAction.html).
    #
    # The default bindings for this signal are
    # <kbd>Ctrl</kbd>-<kbd>x</kbd> and
    # <kbd>Shift</kbd>-<kbd>Delete</kbd>.
    struct CutClipboardSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "cut-clipboard::#{@detail}" : "cut-clipboard"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "cut-clipboard")
      end
    end

    def cut_clipboard_signal
      CutClipboardSignal.new(self)
    end

    # Gets emitted when the user initiates a text deletion.
    #
    # The ::delete-from-cursor signal is a [keybinding signal](class.SignalAction.html).
    #
    # If the @type is %GTK_DELETE_CHARS, GTK deletes the selection
    # if there is one, otherwise it deletes the requested number
    # of characters.
    #
    # The default bindings for this signal are <kbd>Delete</kbd> for
    # deleting a character, <kbd>Ctrl</kbd>-<kbd>Delete</kbd> for
    # deleting a word and <kbd>Ctrl</kbd>-<kbd>Backspace</kbd> for
    # deleting a word backwards.
    struct DeleteFromCursorSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "delete-from-cursor::#{@detail}" : "delete-from-cursor"
      end

      def connect(&block : Proc(Gtk::DeleteType, Int32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::DeleteType, Int32, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gtk::DeleteType, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_type : UInt32, lib_count : Int32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          type = Gtk::DeleteType.new(lib_type)
          count = lib_count
          ::Box(Proc(Gtk::DeleteType, Int32, Nil)).unbox(_lib_box).call(type, count)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::DeleteType, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_type : UInt32, lib_count : Int32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          type = Gtk::DeleteType.new(lib_type)
          count = lib_count
          ::Box(Proc(Gtk::DeleteType, Int32, Nil)).unbox(_lib_box).call(type, count)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextView, Gtk::DeleteType, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_type : UInt32, lib_count : Int32, _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          type = Gtk::DeleteType.new(lib_type)
          count = lib_count
          ::Box(Proc(Gtk::TextView, Gtk::DeleteType, Int32, Nil)).unbox(_lib_box).call(_sender, type, count)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextView, Gtk::DeleteType, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_type : UInt32, lib_count : Int32, _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          type = Gtk::DeleteType.new(lib_type)
          count = lib_count
          ::Box(Proc(Gtk::TextView, Gtk::DeleteType, Int32, Nil)).unbox(_lib_box).call(_sender, type, count)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(type : Gtk::DeleteType, count : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "delete-from-cursor", type, count)
      end
    end

    def delete_from_cursor_signal
      DeleteFromCursorSignal.new(self)
    end

    # Emitted when the selection needs to be extended at @location.
    struct ExtendSelectionSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "extend-selection::#{@detail}" : "extend-selection"
      end

      def connect(&block : Proc(Gtk::TextExtendSelection, Gtk::TextIter, Gtk::TextIter, Gtk::TextIter, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TextExtendSelection, Gtk::TextIter, Gtk::TextIter, Gtk::TextIter, Bool))
        connect(block)
      end

      def connect(handler : Proc(Gtk::TextExtendSelection, Gtk::TextIter, Gtk::TextIter, Gtk::TextIter, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_granularity : UInt32, lib_location : Pointer(Void), lib_start : Pointer(Void), lib__end : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          granularity = Gtk::TextExtendSelection.new(lib_granularity)
          # Generator::BuiltInTypeArgPlan
          location = Gtk::TextIter.new(lib_location, :none)
          # Generator::BuiltInTypeArgPlan
          start = Gtk::TextIter.new(lib_start, :none)
          # Generator::BuiltInTypeArgPlan
          _end = Gtk::TextIter.new(lib__end, :none)
          ::Box(Proc(Gtk::TextExtendSelection, Gtk::TextIter, Gtk::TextIter, Gtk::TextIter, Bool)).unbox(_lib_box).call(granularity, location, start, _end)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextExtendSelection, Gtk::TextIter, Gtk::TextIter, Gtk::TextIter, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_granularity : UInt32, lib_location : Pointer(Void), lib_start : Pointer(Void), lib__end : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          granularity = Gtk::TextExtendSelection.new(lib_granularity)
          # Generator::BuiltInTypeArgPlan
          location = Gtk::TextIter.new(lib_location, :none)
          # Generator::BuiltInTypeArgPlan
          start = Gtk::TextIter.new(lib_start, :none)
          # Generator::BuiltInTypeArgPlan
          _end = Gtk::TextIter.new(lib__end, :none)
          ::Box(Proc(Gtk::TextExtendSelection, Gtk::TextIter, Gtk::TextIter, Gtk::TextIter, Bool)).unbox(_lib_box).call(granularity, location, start, _end)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextView, Gtk::TextExtendSelection, Gtk::TextIter, Gtk::TextIter, Gtk::TextIter, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_granularity : UInt32, lib_location : Pointer(Void), lib_start : Pointer(Void), lib__end : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          granularity = Gtk::TextExtendSelection.new(lib_granularity)
          # Generator::BuiltInTypeArgPlan
          location = Gtk::TextIter.new(lib_location, :none)
          # Generator::BuiltInTypeArgPlan
          start = Gtk::TextIter.new(lib_start, :none)
          # Generator::BuiltInTypeArgPlan
          _end = Gtk::TextIter.new(lib__end, :none)
          ::Box(Proc(Gtk::TextView, Gtk::TextExtendSelection, Gtk::TextIter, Gtk::TextIter, Gtk::TextIter, Bool)).unbox(_lib_box).call(_sender, granularity, location, start, _end)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextView, Gtk::TextExtendSelection, Gtk::TextIter, Gtk::TextIter, Gtk::TextIter, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_granularity : UInt32, lib_location : Pointer(Void), lib_start : Pointer(Void), lib__end : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          granularity = Gtk::TextExtendSelection.new(lib_granularity)
          # Generator::BuiltInTypeArgPlan
          location = Gtk::TextIter.new(lib_location, :none)
          # Generator::BuiltInTypeArgPlan
          start = Gtk::TextIter.new(lib_start, :none)
          # Generator::BuiltInTypeArgPlan
          _end = Gtk::TextIter.new(lib__end, :none)
          ::Box(Proc(Gtk::TextView, Gtk::TextExtendSelection, Gtk::TextIter, Gtk::TextIter, Gtk::TextIter, Bool)).unbox(_lib_box).call(_sender, granularity, location, start, _end)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(granularity : Gtk::TextExtendSelection, location : Gtk::TextIter, start : Gtk::TextIter, end _end : Gtk::TextIter) : Nil
        LibGObject.g_signal_emit_by_name(@source, "extend-selection", granularity, location, start, _end)
      end
    end

    def extend_selection_signal
      ExtendSelectionSignal.new(self)
    end

    # Gets emitted when the user initiates the insertion of a
    # fixed string at the cursor.
    #
    # The ::insert-at-cursor signal is a [keybinding signal](class.SignalAction.html).
    #
    # This signal has no default bindings.
    struct InsertAtCursorSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "insert-at-cursor::#{@detail}" : "insert-at-cursor"
      end

      def connect(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect(handler : Proc(::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_string : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          string = ::String.new(lib_string)
          ::Box(Proc(::String, Nil)).unbox(_lib_box).call(string)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_string : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          string = ::String.new(lib_string)
          ::Box(Proc(::String, Nil)).unbox(_lib_box).call(string)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextView, ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_string : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          string = ::String.new(lib_string)
          ::Box(Proc(Gtk::TextView, ::String, Nil)).unbox(_lib_box).call(_sender, string)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextView, ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_string : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          string = ::String.new(lib_string)
          ::Box(Proc(Gtk::TextView, ::String, Nil)).unbox(_lib_box).call(_sender, string)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(string : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "insert-at-cursor", string)
      end
    end

    def insert_at_cursor_signal
      InsertAtCursorSignal.new(self)
    end

    # Gets emitted to present the Emoji chooser for the @text_view.
    #
    # The ::insert-emoji signal is a [keybinding signal](class.SignalAction.html).
    #
    # The default bindings for this signal are
    # <kbd>Ctrl</kbd>-<kbd>.</kbd> and
    # <kbd>Ctrl</kbd>-<kbd>;</kbd>
    struct InsertEmojiSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "insert-emoji::#{@detail}" : "insert-emoji"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "insert-emoji")
      end
    end

    def insert_emoji_signal
      InsertEmojiSignal.new(self)
    end

    # Gets emitted when the user initiates a cursor movement.
    #
    # The ::move-cursor signal is a [keybinding signal](class.SignalAction.html).
    # If the cursor is not visible in @text_view, this signal causes
    # the viewport to be moved instead.
    #
    # Applications should not connect to it, but may emit it with
    # g_signal_emit_by_name() if they need to control the cursor
    # programmatically.
    #
    #
    # The default bindings for this signal come in two variants,
    # the variant with the <kbd>Shift</kbd> modifier extends the
    # selection, the variant without it does not.
    # There are too many key combinations to list them all here.
    #
    # - <kbd>←</kbd>, <kbd>→</kbd>, <kbd>↑</kbd>, <kbd>↓</kbd>
    #   move by individual characters/lines
    # - <kbd>Ctrl</kbd>-<kbd>→</kbd>, etc. move by words/paragraphs
    # - <kbd>Home</kbd>, <kbd>End</kbd> move to the ends of the buffer
    # - <kbd>PgUp</kbd>, <kbd>PgDn</kbd> move vertically by pages
    # - <kbd>Ctrl</kbd>-<kbd>PgUp</kbd>, <kbd>Ctrl</kbd>-<kbd>PgDn</kbd>
    #   move horizontally by pages
    struct MoveCursorSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "move-cursor::#{@detail}" : "move-cursor"
      end

      def connect(&block : Proc(Gtk::MovementStep, Int32, Bool, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::MovementStep, Int32, Bool, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gtk::MovementStep, Int32, Bool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, lib_count : Int32, lib_extend_selection : LibC::Int, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          step = Gtk::MovementStep.new(lib_step)
          count = lib_count
          extend_selection = lib_extend_selection
          ::Box(Proc(Gtk::MovementStep, Int32, Bool, Nil)).unbox(_lib_box).call(step, count, extend_selection)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::MovementStep, Int32, Bool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, lib_count : Int32, lib_extend_selection : LibC::Int, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          step = Gtk::MovementStep.new(lib_step)
          count = lib_count
          extend_selection = lib_extend_selection
          ::Box(Proc(Gtk::MovementStep, Int32, Bool, Nil)).unbox(_lib_box).call(step, count, extend_selection)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextView, Gtk::MovementStep, Int32, Bool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, lib_count : Int32, lib_extend_selection : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          step = Gtk::MovementStep.new(lib_step)
          count = lib_count
          extend_selection = lib_extend_selection
          ::Box(Proc(Gtk::TextView, Gtk::MovementStep, Int32, Bool, Nil)).unbox(_lib_box).call(_sender, step, count, extend_selection)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextView, Gtk::MovementStep, Int32, Bool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, lib_count : Int32, lib_extend_selection : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          step = Gtk::MovementStep.new(lib_step)
          count = lib_count
          extend_selection = lib_extend_selection
          ::Box(Proc(Gtk::TextView, Gtk::MovementStep, Int32, Bool, Nil)).unbox(_lib_box).call(_sender, step, count, extend_selection)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(step : Gtk::MovementStep, count : Int32, extend_selection : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-cursor", step, count, extend_selection)
      end
    end

    def move_cursor_signal
      MoveCursorSignal.new(self)
    end

    # Gets emitted to move the viewport.
    #
    # The ::move-viewport signal is a [keybinding signal](class.SignalAction.html),
    # which can be bound to key combinations to allow the user to move the viewport,
    # i.e. change what part of the text view is visible in a containing scrolled
    # window.
    #
    # There are no default bindings for this signal.
    struct MoveViewportSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "move-viewport::#{@detail}" : "move-viewport"
      end

      def connect(&block : Proc(Gtk::ScrollStep, Int32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::ScrollStep, Int32, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gtk::ScrollStep, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, lib_count : Int32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          step = Gtk::ScrollStep.new(lib_step)
          count = lib_count
          ::Box(Proc(Gtk::ScrollStep, Int32, Nil)).unbox(_lib_box).call(step, count)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ScrollStep, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, lib_count : Int32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          step = Gtk::ScrollStep.new(lib_step)
          count = lib_count
          ::Box(Proc(Gtk::ScrollStep, Int32, Nil)).unbox(_lib_box).call(step, count)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextView, Gtk::ScrollStep, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, lib_count : Int32, _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          step = Gtk::ScrollStep.new(lib_step)
          count = lib_count
          ::Box(Proc(Gtk::TextView, Gtk::ScrollStep, Int32, Nil)).unbox(_lib_box).call(_sender, step, count)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextView, Gtk::ScrollStep, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, lib_count : Int32, _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          step = Gtk::ScrollStep.new(lib_step)
          count = lib_count
          ::Box(Proc(Gtk::TextView, Gtk::ScrollStep, Int32, Nil)).unbox(_lib_box).call(_sender, step, count)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(step : Gtk::ScrollStep, count : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-viewport", step, count)
      end
    end

    def move_viewport_signal
      MoveViewportSignal.new(self)
    end

    # Gets emitted to paste the contents of the clipboard
    # into the text view.
    #
    # The ::paste-clipboard signal is a [keybinding signal](class.SignalAction.html).
    #
    # The default bindings for this signal are
    # <kbd>Ctrl</kbd>-<kbd>v</kbd> and
    # <kbd>Shift</kbd>-<kbd>Insert</kbd>.
    struct PasteClipboardSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "paste-clipboard::#{@detail}" : "paste-clipboard"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "paste-clipboard")
      end
    end

    def paste_clipboard_signal
      PasteClipboardSignal.new(self)
    end

    # Emitted when preedit text of the active IM changes.
    #
    # If an input method is used, the typed text will not immediately
    # be committed to the buffer. So if you are interested in the text,
    # connect to this signal.
    #
    # This signal is only emitted if the text at the given position
    # is actually editable.
    struct PreeditChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "preedit-changed::#{@detail}" : "preedit-changed"
      end

      def connect(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect(handler : Proc(::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_preedit : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          preedit = ::String.new(lib_preedit)
          ::Box(Proc(::String, Nil)).unbox(_lib_box).call(preedit)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_preedit : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          preedit = ::String.new(lib_preedit)
          ::Box(Proc(::String, Nil)).unbox(_lib_box).call(preedit)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextView, ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_preedit : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          preedit = ::String.new(lib_preedit)
          ::Box(Proc(Gtk::TextView, ::String, Nil)).unbox(_lib_box).call(_sender, preedit)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextView, ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_preedit : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          preedit = ::String.new(lib_preedit)
          ::Box(Proc(Gtk::TextView, ::String, Nil)).unbox(_lib_box).call(_sender, preedit)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(preedit : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "preedit-changed", preedit)
      end
    end

    def preedit_changed_signal
      PreeditChangedSignal.new(self)
    end

    # Gets emitted to select or unselect the complete contents of the text view.
    #
    # The ::select-all signal is a [keybinding signal](class.SignalAction.html).
    #
    # The default bindings for this signal are
    # <kbd>Ctrl</kbd>-<kbd>a</kbd> and
    # <kbd>Ctrl</kbd>-<kbd>/</kbd> for selecting and
    # <kbd>Shift</kbd>-<kbd>Ctrl</kbd>-<kbd>a</kbd> and
    # <kbd>Ctrl</kbd>-<kbd>\</kbd> for unselecting.
    struct SelectAllSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "select-all::#{@detail}" : "select-all"
      end

      def connect(&block : Proc(Bool, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Bool, Nil))
        connect(block)
      end

      def connect(handler : Proc(Bool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib__select : LibC::Int, _lib_box : Pointer(Void)) {
          _select = lib_select
          ::Box(Proc(Bool, Nil)).unbox(_lib_box).call(_select)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Bool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib__select : LibC::Int, _lib_box : Pointer(Void)) {
          _select = lib_select
          ::Box(Proc(Bool, Nil)).unbox(_lib_box).call(_select)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextView, Bool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib__select : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          _select = lib_select
          ::Box(Proc(Gtk::TextView, Bool, Nil)).unbox(_lib_box).call(_sender, _select)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextView, Bool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib__select : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          _select = lib_select
          ::Box(Proc(Gtk::TextView, Bool, Nil)).unbox(_lib_box).call(_sender, _select)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(select _select : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "select-all", _select)
      end
    end

    def select_all_signal
      SelectAllSignal.new(self)
    end

    # Gets emitted when the user initiates settings the "anchor" mark.
    #
    # The ::set-anchor signal is a [keybinding signal](class.SignalAction.html)
    # which gets emitted when the user initiates setting the "anchor"
    # mark. The "anchor" mark gets placed at the same position as the
    # "insert" mark.
    #
    # This signal has no default bindings.
    struct SetAnchorSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "set-anchor::#{@detail}" : "set-anchor"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "set-anchor")
      end
    end

    def set_anchor_signal
      SetAnchorSignal.new(self)
    end

    # Gets emitted to toggle the `cursor-visible` property.
    #
    # The ::toggle-cursor-visible signal is a
    # [keybinding signal](class.SignalAction.html).
    #
    # The default binding for this signal is <kbd>F7</kbd>.
    struct ToggleCursorVisibleSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "toggle-cursor-visible::#{@detail}" : "toggle-cursor-visible"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "toggle-cursor-visible")
      end
    end

    def toggle_cursor_visible_signal
      ToggleCursorVisibleSignal.new(self)
    end

    # Gets emitted to toggle the overwrite mode of the text view.
    #
    # The ::toggle-overwrite signal is a [keybinding signal](class.SignalAction.html).
    #
    # The default binding for this signal is <kbd>Insert</kbd>.
    struct ToggleOverwriteSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "toggle-overwrite::#{@detail}" : "toggle-overwrite"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextView, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "toggle-overwrite")
      end
    end

    def toggle_overwrite_signal
      ToggleOverwriteSignal.new(self)
    end
  end
end
