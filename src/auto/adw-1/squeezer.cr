require "../gtk-4.0/widget"
require "../gtk-4.0/accessible"

require "../gtk-4.0/buildable"

require "../gtk-4.0/constraint_target"

require "../gtk-4.0/orientable"

module Adw
  # A best fit container.
  #
  # The `AdwSqueezer` widget is a container which only shows the first of its
  # children that fits in the available size. It is convenient to offer different
  # widgets to represent the same data with different levels of detail, making
  # the widget seem to squeeze itself to fit in the available space.
  #
  # Transitions between children can be animated as fades. This can be controlled
  # with [property@Adw.Squeezer:transition-type].
  #
  # ## CSS nodes
  #
  # `AdwSqueezer` has a single CSS node with name `squeezer`.
  class Squeezer < Gtk::Widget
    include Gtk::Accessible
    include Gtk::Buildable
    include Gtk::ConstraintTarget
    include Gtk::Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, allow_none : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, homogeneous : Bool? = nil, interpolate_size : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, pages : Gtk::SelectionModel? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, switch_threshold_policy : Adw::FoldThresholdPolicy? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, transition_duration : UInt32? = nil, transition_running : Bool? = nil, transition_type : Adw::SqueezerTransitionType? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, visible_child : Gtk::Widget? = nil, width_request : Int32? = nil, xalign : Float32? = nil, yalign : Float32? = nil)
      _names = uninitialized Pointer(LibC::Char)[47]
      _values = StaticArray(LibGObject::Value, 47).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if allow_none
        (_names.to_unsafe + _n).value = "allow-none".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allow_none)
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
      if homogeneous
        (_names.to_unsafe + _n).value = "homogeneous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, homogeneous)
        _n += 1
      end
      if interpolate_size
        (_names.to_unsafe + _n).value = "interpolate-size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, interpolate_size)
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
      if orientation
        (_names.to_unsafe + _n).value = "orientation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, orientation)
        _n += 1
      end
      if overflow
        (_names.to_unsafe + _n).value = "overflow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overflow)
        _n += 1
      end
      if pages
        (_names.to_unsafe + _n).value = "pages".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pages)
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
      if switch_threshold_policy
        (_names.to_unsafe + _n).value = "switch-threshold-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, switch_threshold_policy)
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
      if transition_duration
        (_names.to_unsafe + _n).value = "transition-duration".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transition_duration)
        _n += 1
      end
      if transition_running
        (_names.to_unsafe + _n).value = "transition-running".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transition_running)
        _n += 1
      end
      if transition_type
        (_names.to_unsafe + _n).value = "transition-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transition_type)
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
      if visible_child
        (_names.to_unsafe + _n).value = "visible-child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible_child)
        _n += 1
      end
      if width_request
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end
      if xalign
        (_names.to_unsafe + _n).value = "xalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, xalign)
        _n += 1
      end
      if yalign
        (_names.to_unsafe + _n).value = "yalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, yalign)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Squeezer.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_squeezer_get_type
    end

    def initialize
      # adw_squeezer_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibAdw.adw_squeezer_new
      @pointer = _retval
    end

    def add(child : Gtk::Widget) : Adw::SqueezerPage
      # adw_squeezer_add: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_squeezer_add(self, child)
      Adw::SqueezerPage.new(_retval, GICrystal::Transfer::None)
    end

    def allow_none? : Bool
      # adw_squeezer_get_allow_none: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_squeezer_get_allow_none(self)
      GICrystal.to_bool(_retval)
    end

    def homogeneous? : Bool
      # adw_squeezer_get_homogeneous: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_squeezer_get_homogeneous(self)
      GICrystal.to_bool(_retval)
    end

    def interpolate_size? : Bool
      # adw_squeezer_get_interpolate_size: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_squeezer_get_interpolate_size(self)
      GICrystal.to_bool(_retval)
    end

    def page(child : Gtk::Widget) : Adw::SqueezerPage
      # adw_squeezer_get_page: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_squeezer_get_page(self, child)
      Adw::SqueezerPage.new(_retval, GICrystal::Transfer::None)
    end

    def pages : Gtk::SelectionModel
      # adw_squeezer_get_pages: (Method | Getter)
      # Returns: (transfer full)

      _retval = LibAdw.adw_squeezer_get_pages(self)
      Gtk::SelectionModel__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def switch_threshold_policy : Adw::FoldThresholdPolicy
      # adw_squeezer_get_switch_threshold_policy: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_squeezer_get_switch_threshold_policy(self)
      Adw::FoldThresholdPolicy.from_value(_retval)
    end

    def transition_duration : UInt32
      # adw_squeezer_get_transition_duration: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_squeezer_get_transition_duration(self)
      _retval
    end

    def transition_running? : Bool
      # adw_squeezer_get_transition_running: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_squeezer_get_transition_running(self)
      GICrystal.to_bool(_retval)
    end

    def transition_type : Adw::SqueezerTransitionType
      # adw_squeezer_get_transition_type: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_squeezer_get_transition_type(self)
      Adw::SqueezerTransitionType.from_value(_retval)
    end

    def visible_child : Gtk::Widget?
      # adw_squeezer_get_visible_child: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_squeezer_get_visible_child(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def xalign : Float32
      # adw_squeezer_get_xalign: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_squeezer_get_xalign(self)
      _retval
    end

    def yalign : Float32
      # adw_squeezer_get_yalign: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_squeezer_get_yalign(self)
      _retval
    end

    def remove(child : Gtk::Widget) : Nil
      # adw_squeezer_remove: (Method)
      # Returns: (transfer none)

      LibAdw.adw_squeezer_remove(self, child)
    end

    def allow_none=(allow_none : Bool) : Nil
      # adw_squeezer_set_allow_none: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_squeezer_set_allow_none(self, allow_none)
    end

    def homogeneous=(homogeneous : Bool) : Nil
      # adw_squeezer_set_homogeneous: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_squeezer_set_homogeneous(self, homogeneous)
    end

    def interpolate_size=(interpolate_size : Bool) : Nil
      # adw_squeezer_set_interpolate_size: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_squeezer_set_interpolate_size(self, interpolate_size)
    end

    def switch_threshold_policy=(policy : Adw::FoldThresholdPolicy) : Nil
      # adw_squeezer_set_switch_threshold_policy: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_squeezer_set_switch_threshold_policy(self, policy)
    end

    def transition_duration=(duration : UInt32) : Nil
      # adw_squeezer_set_transition_duration: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_squeezer_set_transition_duration(self, duration)
    end

    def transition_type=(transition : Adw::SqueezerTransitionType) : Nil
      # adw_squeezer_set_transition_type: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_squeezer_set_transition_type(self, transition)
    end

    def xalign=(xalign : Float32) : Nil
      # adw_squeezer_set_xalign: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_squeezer_set_xalign(self, xalign)
    end

    def yalign=(yalign : Float32) : Nil
      # adw_squeezer_set_yalign: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_squeezer_set_yalign(self, yalign)
    end
  end
end
