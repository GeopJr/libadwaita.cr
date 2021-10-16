require "./preferences_row"
require "../gtk-4.0/accessible"

require "../gtk-4.0/actionable"

require "../gtk-4.0/buildable"

require "../gtk-4.0/constraint_target"

module Adw
  # A [class@Gtk.ListBoxRow] used to reveal widgets.
  #
  # The `AdwExpanderRow` widget allows the user to reveal or hide widgets below
  # it. It also allows the user to enable the expansion of the row, allowing to
  # disable all that the row contains.
  #
  # ## AdwExpanderRow as GtkBuildable
  #
  # The `AdwExpanderRow` implementation of the [iface@Gtk.Buildable] interface
  # supports adding a child as an action widget by specifying “action” as the
  # “type” attribute of a <child> element.
  #
  # It also supports adding it as a prefix widget by specifying “prefix” as the
  # “type” attribute of a <child> element.
  #
  # ## CSS nodes
  #
  # `AdwExpanderRow` has a main CSS node with name `row` and the `.expander`
  # style class. It has the `.empty` style class when it contains no children.
  #
  # It contains the subnodes `row.header` for its main embedded row,
  # `list.nested` for the list it can expand, and `image.expander-row-arrow` for
  # its arrow.
  class ExpanderRow < PreferencesRow
    include Gtk::Accessible
    include Gtk::Actionable
    include Gtk::Buildable
    include Gtk::ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, action_name : ::String? = nil, action_target : GLib::Variant? = nil, activatable : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, enable_expansion : Bool? = nil, expanded : Bool? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, icon_name : ::String? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, selectable : Bool? = nil, sensitive : Bool? = nil, show_enable_switch : Bool? = nil, subtitle : ::String? = nil, title : ::String? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, use_underline : Bool? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[47]
      _values = StaticArray(LibGObject::Value, 47).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if action_name
        (_names.to_unsafe + _n).value = "action-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action_name)
        _n += 1
      end
      if action_target
        (_names.to_unsafe + _n).value = "action-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action_target)
        _n += 1
      end
      if activatable
        (_names.to_unsafe + _n).value = "activatable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, activatable)
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
      if enable_expansion
        (_names.to_unsafe + _n).value = "enable-expansion".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_expansion)
        _n += 1
      end
      if expanded
        (_names.to_unsafe + _n).value = "expanded".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, expanded)
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
      if icon_name
        (_names.to_unsafe + _n).value = "icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_name)
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
      if selectable
        (_names.to_unsafe + _n).value = "selectable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selectable)
        _n += 1
      end
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if show_enable_switch
        (_names.to_unsafe + _n).value = "show-enable-switch".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_enable_switch)
        _n += 1
      end
      if subtitle
        (_names.to_unsafe + _n).value = "subtitle".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, subtitle)
        _n += 1
      end
      if title
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
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
      if use_underline
        (_names.to_unsafe + _n).value = "use-underline".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_underline)
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

      @pointer = LibGObject.g_object_new_with_properties(ExpanderRow.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_expander_row_get_type
    end

    def enable_expansion=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "enable-expansion", unsafe_value, Pointer(Void).null)
      value
    end

    def enable_expansion? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "enable-expansion", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def expanded=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "expanded", unsafe_value, Pointer(Void).null)
      value
    end

    def expanded? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "expanded", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def icon_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "icon-name", unsafe_value, Pointer(Void).null)
      value
    end

    def icon_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "icon-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def show_enable_switch=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-enable-switch", unsafe_value, Pointer(Void).null)
      value
    end

    def show_enable_switch? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-enable-switch", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def subtitle=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "subtitle", unsafe_value, Pointer(Void).null)
      value
    end

    def subtitle : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "subtitle", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def use_underline=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "use-underline", unsafe_value, Pointer(Void).null)
      value
    end

    def use_underline? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "use-underline", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def initialize
      # adw_expander_row_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibAdw.adw_expander_row_new
      @pointer = _retval
    end

    def add(child : Gtk::Widget) : Nil
      # adw_expander_row_add: (Method)
      # Returns: (transfer none)

      LibAdw.adw_expander_row_add(self, child)
    end

    def add_action(widget : Gtk::Widget) : Nil
      # adw_expander_row_add_action: (Method)
      # Returns: (transfer none)

      LibAdw.adw_expander_row_add_action(self, widget)
    end

    def add_prefix(widget : Gtk::Widget) : Nil
      # adw_expander_row_add_prefix: (Method)
      # Returns: (transfer none)

      LibAdw.adw_expander_row_add_prefix(self, widget)
    end

    def enable_expansion : Bool
      # adw_expander_row_get_enable_expansion: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_expander_row_get_enable_expansion(self)
      GICrystal.to_bool(_retval)
    end

    def expanded : Bool
      # adw_expander_row_get_expanded: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_expander_row_get_expanded(self)
      GICrystal.to_bool(_retval)
    end

    def icon_name : ::String?
      # adw_expander_row_get_icon_name: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_expander_row_get_icon_name(self)
      ::String.new(_retval) unless _retval.null?
    end

    def show_enable_switch : Bool
      # adw_expander_row_get_show_enable_switch: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_expander_row_get_show_enable_switch(self)
      GICrystal.to_bool(_retval)
    end

    def subtitle : ::String
      # adw_expander_row_get_subtitle: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_expander_row_get_subtitle(self)
      ::String.new(_retval)
    end

    def use_underline : Bool
      # adw_expander_row_get_use_underline: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_expander_row_get_use_underline(self)
      GICrystal.to_bool(_retval)
    end

    def remove(child : Gtk::Widget) : Nil
      # adw_expander_row_remove: (Method)
      # Returns: (transfer none)

      LibAdw.adw_expander_row_remove(self, child)
    end

    def enable_expansion=(enable_expansion : Bool) : Nil
      # adw_expander_row_set_enable_expansion: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_expander_row_set_enable_expansion(self, enable_expansion)
    end

    def expanded=(expanded : Bool) : Nil
      # adw_expander_row_set_expanded: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_expander_row_set_expanded(self, expanded)
    end

    def icon_name=(icon_name : ::String?) : Nil
      # adw_expander_row_set_icon_name: (Method | Setter)
      # @icon_name: (nullable)
      # Returns: (transfer none)

      icon_name = if icon_name.nil?
                    Pointer(LibC::Char).null
                  else
                    icon_name.to_unsafe
                  end

      LibAdw.adw_expander_row_set_icon_name(self, icon_name)
    end

    def show_enable_switch=(show_enable_switch : Bool) : Nil
      # adw_expander_row_set_show_enable_switch: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_expander_row_set_show_enable_switch(self, show_enable_switch)
    end

    def subtitle=(subtitle : ::String) : Nil
      # adw_expander_row_set_subtitle: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_expander_row_set_subtitle(self, subtitle)
    end

    def use_underline=(use_underline : Bool) : Nil
      # adw_expander_row_set_use_underline: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_expander_row_set_use_underline(self, use_underline)
    end
  end
end
