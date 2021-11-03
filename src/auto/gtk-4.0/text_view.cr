require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./scrollable"

module Gtk
  # A widget that displays the contents of a [class@Gtk.TextBuffer].
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
  class TextView < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Scrollable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accepts_tab : Bool? = nil, accessible_role : Gtk::AccessibleRole? = nil, bottom_margin : Int32? = nil, buffer : Gtk::TextBuffer? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, cursor_visible : Bool? = nil, editable : Bool? = nil, extra_menu : Gio::MenuModel? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, hadjustment : Gtk::Adjustment? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hscroll_policy : Gtk::ScrollablePolicy? = nil, im_module : ::String? = nil, indent : Int32? = nil, input_hints : Gtk::InputHints? = nil, input_purpose : Gtk::InputPurpose? = nil, justification : Gtk::Justification? = nil, layout_manager : Gtk::LayoutManager? = nil, left_margin : Int32? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, monospace : Bool? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, overwrite : Bool? = nil, parent : Gtk::Widget? = nil, pixels_above_lines : Int32? = nil, pixels_below_lines : Int32? = nil, pixels_inside_wrap : Int32? = nil, receives_default : Bool? = nil, right_margin : Int32? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tabs : Pango::TabArray? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, top_margin : Int32? = nil, vadjustment : Gtk::Adjustment? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, vscroll_policy : Gtk::ScrollablePolicy? = nil, width_request : Int32? = nil, wrap_mode : Gtk::WrapMode? = nil)
      _names = uninitialized Pointer(LibC::Char)[60]
      _values = StaticArray(LibGObject::Value, 60).new(LibGObject::Value.new)
      _n = 0

      if accepts_tab
        (_names.to_unsafe + _n).value = "accepts-tab".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accepts_tab)
        _n += 1
      end
      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if bottom_margin
        (_names.to_unsafe + _n).value = "bottom-margin".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, bottom_margin)
        _n += 1
      end
      if buffer
        (_names.to_unsafe + _n).value = "buffer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, buffer)
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
      if cursor_visible
        (_names.to_unsafe + _n).value = "cursor-visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor_visible)
        _n += 1
      end
      if editable
        (_names.to_unsafe + _n).value = "editable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editable)
        _n += 1
      end
      if extra_menu
        (_names.to_unsafe + _n).value = "extra-menu".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, extra_menu)
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
      if hscroll_policy
        (_names.to_unsafe + _n).value = "hscroll-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hscroll_policy)
        _n += 1
      end
      if im_module
        (_names.to_unsafe + _n).value = "im-module".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, im_module)
        _n += 1
      end
      if indent
        (_names.to_unsafe + _n).value = "indent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, indent)
        _n += 1
      end
      if input_hints
        (_names.to_unsafe + _n).value = "input-hints".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_hints)
        _n += 1
      end
      if input_purpose
        (_names.to_unsafe + _n).value = "input-purpose".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_purpose)
        _n += 1
      end
      if justification
        (_names.to_unsafe + _n).value = "justification".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, justification)
        _n += 1
      end
      if layout_manager
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if left_margin
        (_names.to_unsafe + _n).value = "left-margin".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, left_margin)
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
      if monospace
        (_names.to_unsafe + _n).value = "monospace".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, monospace)
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
      if overwrite
        (_names.to_unsafe + _n).value = "overwrite".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overwrite)
        _n += 1
      end
      if parent
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if pixels_above_lines
        (_names.to_unsafe + _n).value = "pixels-above-lines".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixels_above_lines)
        _n += 1
      end
      if pixels_below_lines
        (_names.to_unsafe + _n).value = "pixels-below-lines".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixels_below_lines)
        _n += 1
      end
      if pixels_inside_wrap
        (_names.to_unsafe + _n).value = "pixels-inside-wrap".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixels_inside_wrap)
        _n += 1
      end
      if receives_default
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if right_margin
        (_names.to_unsafe + _n).value = "right-margin".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, right_margin)
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
      if tabs
        (_names.to_unsafe + _n).value = "tabs".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tabs)
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
      if top_margin
        (_names.to_unsafe + _n).value = "top-margin".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, top_margin)
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
      if vscroll_policy
        (_names.to_unsafe + _n).value = "vscroll-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vscroll_policy)
        _n += 1
      end
      if width_request
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end
      if wrap_mode
        (_names.to_unsafe + _n).value = "wrap-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, wrap_mode)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TextView.g_type, _n, _names, _values)
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
      Gtk::InputHints.from_value(value)
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
      Gtk::InputPurpose.from_value(value)
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
      Gtk::Justification.from_value(value)
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
      Gtk::WrapMode.from_value(value)
    end

    def initialize
      # gtk_text_view_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_new
      @pointer = _retval
    end

    def self.new_with_buffer(buffer : Gtk::TextBuffer) : Gtk::Widget
      # gtk_text_view_new_with_buffer: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_new_with_buffer(buffer)
      Gtk::TextView.new(_retval, GICrystal::Transfer::Full)
    end

    def add_child_at_anchor(child : Gtk::Widget, anchor : Gtk::TextChildAnchor) : Nil
      # gtk_text_view_add_child_at_anchor: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_add_child_at_anchor(self, child, anchor)
    end

    def add_overlay(child : Gtk::Widget, xpos : Int32, ypos : Int32) : Nil
      # gtk_text_view_add_overlay: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_add_overlay(self, child, xpos, ypos)
    end

    def backward_display_line(iter : Gtk::TextIter) : Bool
      # gtk_text_view_backward_display_line: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_backward_display_line(self, iter)
      GICrystal.to_bool(_retval)
    end

    def backward_display_line_start(iter : Gtk::TextIter) : Bool
      # gtk_text_view_backward_display_line_start: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_backward_display_line_start(self, iter)
      GICrystal.to_bool(_retval)
    end

    def buffer_to_window_coords(win : Gtk::TextWindowType, buffer_x : Int32, buffer_y : Int32) : Nil
      # gtk_text_view_buffer_to_window_coords: (Method)
      # @window_x: (out) (transfer full) (optional)
      # @window_y: (out) (transfer full) (optional)
      # Returns: (transfer none)

      window_x = Pointer(Int32).null
      window_y = Pointer(Int32).null

      LibGtk.gtk_text_view_buffer_to_window_coords(self, win, buffer_x, buffer_y, window_x, window_y)
    end

    def forward_display_line(iter : Gtk::TextIter) : Bool
      # gtk_text_view_forward_display_line: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_forward_display_line(self, iter)
      GICrystal.to_bool(_retval)
    end

    def forward_display_line_end(iter : Gtk::TextIter) : Bool
      # gtk_text_view_forward_display_line_end: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_forward_display_line_end(self, iter)
      GICrystal.to_bool(_retval)
    end

    def accepts_tab : Bool
      # gtk_text_view_get_accepts_tab: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_accepts_tab(self)
      GICrystal.to_bool(_retval)
    end

    def bottom_margin : Int32
      # gtk_text_view_get_bottom_margin: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_bottom_margin(self)
      _retval
    end

    def buffer : Gtk::TextBuffer
      # gtk_text_view_get_buffer: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_buffer(self)
      Gtk::TextBuffer.new(_retval, GICrystal::Transfer::None)
    end

    def cursor_locations(iter : Gtk::TextIter?) : Gdk::Rectangle
      # gtk_text_view_get_cursor_locations: (Method)
      # @iter: (nullable)
      # @strong: (out) (caller-allocates) (optional)
      # @weak: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      strong = Pointer(Void).null
      weak = Pointer(Void).null
      iter = if iter.nil?
               Pointer(Void).null
             else
               iter.to_unsafe
             end
      strong = Gdk::Rectangle.new

      LibGtk.gtk_text_view_get_cursor_locations(self, iter, strong, weak)
      strong
    end

    def cursor_visible : Bool
      # gtk_text_view_get_cursor_visible: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_cursor_visible(self)
      GICrystal.to_bool(_retval)
    end

    def editable : Bool
      # gtk_text_view_get_editable: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_editable(self)
      GICrystal.to_bool(_retval)
    end

    def extra_menu : Gio::MenuModel
      # gtk_text_view_get_extra_menu: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_extra_menu(self)
      Gio::MenuModel.new(_retval, GICrystal::Transfer::None)
    end

    def gutter(win : Gtk::TextWindowType) : Gtk::Widget?
      # gtk_text_view_get_gutter: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_gutter(self, win)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def indent : Int32
      # gtk_text_view_get_indent: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_indent(self)
      _retval
    end

    def input_hints : Gtk::InputHints
      # gtk_text_view_get_input_hints: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_input_hints(self)
      Gtk::InputHints.from_value(_retval)
    end

    def input_purpose : Gtk::InputPurpose
      # gtk_text_view_get_input_purpose: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_input_purpose(self)
      Gtk::InputPurpose.from_value(_retval)
    end

    def iter_at_location(x : Int32, y : Int32) : Gtk::TextIter
      # gtk_text_view_get_iter_at_location: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      iter = Gtk::TextIter.new

      _retval = LibGtk.gtk_text_view_get_iter_at_location(self, iter, x, y)
      iter
    end

    def iter_at_position(x : Int32, y : Int32) : Gtk::TextIter
      # gtk_text_view_get_iter_at_position: (Method)
      # @iter: (out) (caller-allocates)
      # @trailing: (out) (transfer full) (optional)
      # Returns: (transfer none)

      trailing = Pointer(Int32).null
      iter = Gtk::TextIter.new

      _retval = LibGtk.gtk_text_view_get_iter_at_position(self, iter, trailing, x, y)
      iter
    end

    def iter_location(iter : Gtk::TextIter) : Gdk::Rectangle
      # gtk_text_view_get_iter_location: (Method)
      # @location: (out) (caller-allocates)
      # Returns: (transfer none)

      location = Gdk::Rectangle.new

      LibGtk.gtk_text_view_get_iter_location(self, iter, location)
      location
    end

    def justification : Gtk::Justification
      # gtk_text_view_get_justification: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_justification(self)
      Gtk::Justification.from_value(_retval)
    end

    def left_margin : Int32
      # gtk_text_view_get_left_margin: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_left_margin(self)
      _retval
    end

    def line_at_y(y : Int32, line_top : Int32) : Gtk::TextIter
      # gtk_text_view_get_line_at_y: (Method)
      # @target_iter: (out) (caller-allocates)
      # @line_top: (out) (transfer full)
      # Returns: (transfer none)

      target_iter = Gtk::TextIter.new

      LibGtk.gtk_text_view_get_line_at_y(self, target_iter, y, line_top)
      target_iter
    end

    def line_yrange(iter : Gtk::TextIter, y : Int32, height : Int32) : Nil
      # gtk_text_view_get_line_yrange: (Method)
      # @y: (out) (transfer full)
      # @height: (out) (transfer full)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_get_line_yrange(self, iter, y, height)
    end

    def ltr_context : Pango::Context
      # gtk_text_view_get_ltr_context: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_ltr_context(self)
      Pango::Context.new(_retval, GICrystal::Transfer::None)
    end

    def monospace : Bool
      # gtk_text_view_get_monospace: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_monospace(self)
      GICrystal.to_bool(_retval)
    end

    def overwrite : Bool
      # gtk_text_view_get_overwrite: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_overwrite(self)
      GICrystal.to_bool(_retval)
    end

    def pixels_above_lines : Int32
      # gtk_text_view_get_pixels_above_lines: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_pixels_above_lines(self)
      _retval
    end

    def pixels_below_lines : Int32
      # gtk_text_view_get_pixels_below_lines: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_pixels_below_lines(self)
      _retval
    end

    def pixels_inside_wrap : Int32
      # gtk_text_view_get_pixels_inside_wrap: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_pixels_inside_wrap(self)
      _retval
    end

    def right_margin : Int32
      # gtk_text_view_get_right_margin: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_right_margin(self)
      _retval
    end

    def rtl_context : Pango::Context
      # gtk_text_view_get_rtl_context: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_rtl_context(self)
      Pango::Context.new(_retval, GICrystal::Transfer::None)
    end

    def tabs : Pango::TabArray?
      # gtk_text_view_get_tabs: (Method | Getter)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_text_view_get_tabs(self)
      Pango::TabArray.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def top_margin : Int32
      # gtk_text_view_get_top_margin: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_top_margin(self)
      _retval
    end

    def visible_rect : Gdk::Rectangle
      # gtk_text_view_get_visible_rect: (Method)
      # @visible_rect: (out) (caller-allocates)
      # Returns: (transfer none)

      visible_rect = Gdk::Rectangle.new

      LibGtk.gtk_text_view_get_visible_rect(self, visible_rect)
      visible_rect
    end

    def wrap_mode : Gtk::WrapMode
      # gtk_text_view_get_wrap_mode: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_get_wrap_mode(self)
      Gtk::WrapMode.from_value(_retval)
    end

    def im_context_filter_keypress(event : Gdk::Event) : Bool
      # gtk_text_view_im_context_filter_keypress: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_im_context_filter_keypress(self, event)
      GICrystal.to_bool(_retval)
    end

    def move_mark_onscreen(mark : Gtk::TextMark) : Bool
      # gtk_text_view_move_mark_onscreen: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_move_mark_onscreen(self, mark)
      GICrystal.to_bool(_retval)
    end

    def move_overlay(child : Gtk::Widget, xpos : Int32, ypos : Int32) : Nil
      # gtk_text_view_move_overlay: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_move_overlay(self, child, xpos, ypos)
    end

    def move_visually(iter : Gtk::TextIter, count : Int32) : Bool
      # gtk_text_view_move_visually: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_move_visually(self, iter, count)
      GICrystal.to_bool(_retval)
    end

    def place_cursor_onscreen : Bool
      # gtk_text_view_place_cursor_onscreen: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_place_cursor_onscreen(self)
      GICrystal.to_bool(_retval)
    end

    def remove(child : Gtk::Widget) : Nil
      # gtk_text_view_remove: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_remove(self, child)
    end

    def reset_cursor_blink : Nil
      # gtk_text_view_reset_cursor_blink: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_reset_cursor_blink(self)
    end

    def reset_im_context : Nil
      # gtk_text_view_reset_im_context: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_reset_im_context(self)
    end

    def scroll_mark_onscreen(mark : Gtk::TextMark) : Nil
      # gtk_text_view_scroll_mark_onscreen: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_scroll_mark_onscreen(self, mark)
    end

    def scroll_to_iter(iter : Gtk::TextIter, within_margin : Float64, use_align : Bool, xalign : Float64, yalign : Float64) : Bool
      # gtk_text_view_scroll_to_iter: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_scroll_to_iter(self, iter, within_margin, use_align, xalign, yalign)
      GICrystal.to_bool(_retval)
    end

    def scroll_to_mark(mark : Gtk::TextMark, within_margin : Float64, use_align : Bool, xalign : Float64, yalign : Float64) : Nil
      # gtk_text_view_scroll_to_mark: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_scroll_to_mark(self, mark, within_margin, use_align, xalign, yalign)
    end

    def accepts_tab=(accepts_tab : Bool) : Nil
      # gtk_text_view_set_accepts_tab: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_set_accepts_tab(self, accepts_tab)
    end

    def bottom_margin=(bottom_margin : Int32) : Nil
      # gtk_text_view_set_bottom_margin: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_set_bottom_margin(self, bottom_margin)
    end

    def buffer=(buffer : Gtk::TextBuffer?) : Nil
      # gtk_text_view_set_buffer: (Method | Setter)
      # @buffer: (nullable)
      # Returns: (transfer none)

      buffer = if buffer.nil?
                 Pointer(Void).null
               else
                 buffer.to_unsafe
               end

      LibGtk.gtk_text_view_set_buffer(self, buffer)
    end

    def cursor_visible=(setting : Bool) : Nil
      # gtk_text_view_set_cursor_visible: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_set_cursor_visible(self, setting)
    end

    def editable=(setting : Bool) : Nil
      # gtk_text_view_set_editable: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_set_editable(self, setting)
    end

    def extra_menu=(model : Gio::MenuModel?) : Nil
      # gtk_text_view_set_extra_menu: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      LibGtk.gtk_text_view_set_extra_menu(self, model)
    end

    def set_gutter(win : Gtk::TextWindowType, widget : Gtk::Widget?) : Nil
      # gtk_text_view_set_gutter: (Method)
      # @widget: (nullable)
      # Returns: (transfer none)

      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      LibGtk.gtk_text_view_set_gutter(self, win, widget)
    end

    def indent=(indent : Int32) : Nil
      # gtk_text_view_set_indent: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_set_indent(self, indent)
    end

    def input_hints=(hints : Gtk::InputHints) : Nil
      # gtk_text_view_set_input_hints: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_set_input_hints(self, hints)
    end

    def input_purpose=(purpose : Gtk::InputPurpose) : Nil
      # gtk_text_view_set_input_purpose: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_set_input_purpose(self, purpose)
    end

    def justification=(justification : Gtk::Justification) : Nil
      # gtk_text_view_set_justification: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_set_justification(self, justification)
    end

    def left_margin=(left_margin : Int32) : Nil
      # gtk_text_view_set_left_margin: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_set_left_margin(self, left_margin)
    end

    def monospace=(monospace : Bool) : Nil
      # gtk_text_view_set_monospace: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_set_monospace(self, monospace)
    end

    def overwrite=(overwrite : Bool) : Nil
      # gtk_text_view_set_overwrite: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_set_overwrite(self, overwrite)
    end

    def pixels_above_lines=(pixels_above_lines : Int32) : Nil
      # gtk_text_view_set_pixels_above_lines: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_set_pixels_above_lines(self, pixels_above_lines)
    end

    def pixels_below_lines=(pixels_below_lines : Int32) : Nil
      # gtk_text_view_set_pixels_below_lines: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_set_pixels_below_lines(self, pixels_below_lines)
    end

    def pixels_inside_wrap=(pixels_inside_wrap : Int32) : Nil
      # gtk_text_view_set_pixels_inside_wrap: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_set_pixels_inside_wrap(self, pixels_inside_wrap)
    end

    def right_margin=(right_margin : Int32) : Nil
      # gtk_text_view_set_right_margin: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_set_right_margin(self, right_margin)
    end

    def tabs=(tabs : Pango::TabArray) : Nil
      # gtk_text_view_set_tabs: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_set_tabs(self, tabs)
    end

    def top_margin=(top_margin : Int32) : Nil
      # gtk_text_view_set_top_margin: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_set_top_margin(self, top_margin)
    end

    def wrap_mode=(wrap_mode : Gtk::WrapMode) : Nil
      # gtk_text_view_set_wrap_mode: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_text_view_set_wrap_mode(self, wrap_mode)
    end

    def starts_display_line(iter : Gtk::TextIter) : Bool
      # gtk_text_view_starts_display_line: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_view_starts_display_line(self, iter)
      GICrystal.to_bool(_retval)
    end

    def window_to_buffer_coords(win : Gtk::TextWindowType, window_x : Int32, window_y : Int32) : Nil
      # gtk_text_view_window_to_buffer_coords: (Method)
      # @buffer_x: (out) (transfer full) (optional)
      # @buffer_y: (out) (transfer full) (optional)
      # Returns: (transfer none)

      buffer_x = Pointer(Int32).null
      buffer_y = Pointer(Int32).null

      LibGtk.gtk_text_view_window_to_buffer_coords(self, win, window_x, window_y, buffer_x, buffer_y)
    end

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

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "backspace")
      end
    end

    def backspace_signal
      BackspaceSignal.new(self)
    end

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

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "copy-clipboard")
      end
    end

    def copy_clipboard_signal
      CopyClipboardSignal.new(self)
    end

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

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "cut-clipboard")
      end
    end

    def cut_clipboard_signal
      CutClipboardSignal.new(self)
    end

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

      def connect(block : Proc(Gtk::DeleteType, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = Gtk::DeleteType.from_value(lib_arg0)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::DeleteType, Int32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DeleteType, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = Gtk::DeleteType.from_value(lib_arg0)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::DeleteType, Int32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextView, Gtk::DeleteType, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::DeleteType.from_value(lib_arg0)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::TextView, Gtk::DeleteType, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextView, Gtk::DeleteType, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::DeleteType.from_value(lib_arg0)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::TextView, Gtk::DeleteType, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(type : Gtk::DeleteType, count : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "delete-from-cursor", type, count)
      end
    end

    def delete_from_cursor_signal
      DeleteFromCursorSignal.new(self)
    end

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

      def connect(block : Proc(Gtk::TextExtendSelection, Gtk::TextIter, Gtk::TextIter, Gtk::TextIter, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), lib_arg3 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TextExtendSelection.from_value(lib_arg0)
          arg1 = Gtk::TextIter.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gtk::TextIter.new(lib_arg2, GICrystal::Transfer::None)
          arg3 = Gtk::TextIter.new(lib_arg3, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextExtendSelection, Gtk::TextIter, Gtk::TextIter, Gtk::TextIter, Bool)).unbox(box).call(arg0, arg1, arg2, arg3).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextExtendSelection, Gtk::TextIter, Gtk::TextIter, Gtk::TextIter, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), lib_arg3 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TextExtendSelection.from_value(lib_arg0)
          arg1 = Gtk::TextIter.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gtk::TextIter.new(lib_arg2, GICrystal::Transfer::None)
          arg3 = Gtk::TextIter.new(lib_arg3, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextExtendSelection, Gtk::TextIter, Gtk::TextIter, Gtk::TextIter, Bool)).unbox(box).call(arg0, arg1, arg2, arg3).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextView, Gtk::TextExtendSelection, Gtk::TextIter, Gtk::TextIter, Gtk::TextIter, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), lib_arg3 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextExtendSelection.from_value(lib_arg0)
          arg1 = Gtk::TextIter.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gtk::TextIter.new(lib_arg2, GICrystal::Transfer::None)
          arg3 = Gtk::TextIter.new(lib_arg3, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Gtk::TextExtendSelection, Gtk::TextIter, Gtk::TextIter, Gtk::TextIter, Bool)).unbox(box).call(sender, arg0, arg1, arg2, arg3).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextView, Gtk::TextExtendSelection, Gtk::TextIter, Gtk::TextIter, Gtk::TextIter, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), lib_arg3 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextExtendSelection.from_value(lib_arg0)
          arg1 = Gtk::TextIter.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gtk::TextIter.new(lib_arg2, GICrystal::Transfer::None)
          arg3 = Gtk::TextIter.new(lib_arg3, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Gtk::TextExtendSelection, Gtk::TextIter, Gtk::TextIter, Gtk::TextIter, Bool)).unbox(box).call(sender, arg0, arg1, arg2, arg3).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(granularity : Gtk::TextExtendSelection, location : Gtk::TextIter, start : Gtk::TextIter, _end : Gtk::TextIter) : Nil
        LibGObject.g_signal_emit_by_name(@source, "extend-selection", granularity, location, start, _end)
      end
    end

    def extend_selection_signal
      ExtendSelectionSignal.new(self)
    end

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

      def connect(block : Proc(::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextView, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::TextView, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextView, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::TextView, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(string : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "insert-at-cursor", string)
      end
    end

    def insert_at_cursor_signal
      InsertAtCursorSignal.new(self)
    end

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

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "insert-emoji")
      end
    end

    def insert_emoji_signal
      InsertEmojiSignal.new(self)
    end

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

      def connect(block : Proc(Gtk::MovementStep, Int32, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, box : Pointer(Void)) {
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          ::Box(Proc(Gtk::MovementStep, Int32, Bool, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::MovementStep, Int32, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, box : Pointer(Void)) {
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          ::Box(Proc(Gtk::MovementStep, Int32, Bool, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextView, Gtk::MovementStep, Int32, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          ::Box(Proc(Gtk::TextView, Gtk::MovementStep, Int32, Bool, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextView, Gtk::MovementStep, Int32, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          ::Box(Proc(Gtk::TextView, Gtk::MovementStep, Int32, Bool, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(step : Gtk::MovementStep, count : Int32, extend_selection : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-cursor", step, count, extend_selection)
      end
    end

    def move_cursor_signal
      MoveCursorSignal.new(self)
    end

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

      def connect(block : Proc(Gtk::ScrollStep, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = Gtk::ScrollStep.from_value(lib_arg0)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::ScrollStep, Int32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ScrollStep, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = Gtk::ScrollStep.from_value(lib_arg0)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::ScrollStep, Int32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextView, Gtk::ScrollStep, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ScrollStep.from_value(lib_arg0)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::TextView, Gtk::ScrollStep, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextView, Gtk::ScrollStep, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ScrollStep.from_value(lib_arg0)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::TextView, Gtk::ScrollStep, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(step : Gtk::ScrollStep, count : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-viewport", step, count)
      end
    end

    def move_viewport_signal
      MoveViewportSignal.new(self)
    end

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

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "paste-clipboard")
      end
    end

    def paste_clipboard_signal
      PasteClipboardSignal.new(self)
    end

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

      def connect(block : Proc(::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextView, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::TextView, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextView, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::TextView, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(preedit : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "preedit-changed", preedit)
      end
    end

    def preedit_changed_signal
      PreeditChangedSignal.new(self)
    end

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

      def connect(block : Proc(Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Bool, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Bool, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextView, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Gtk::TextView, Bool, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextView, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Gtk::TextView, Bool, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(_select : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "select-all", _select)
      end
    end

    def select_all_signal
      SelectAllSignal.new(self)
    end

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

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "set-anchor")
      end
    end

    def set_anchor_signal
      SetAnchorSignal.new(self)
    end

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

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "toggle-cursor-visible")
      end
    end

    def toggle_cursor_visible_signal
      ToggleCursorVisibleSignal.new(self)
    end

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

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextView, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextView, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
