require "../gtk-4.0/widget"
require "./swipeable"

require "../gtk-4.0/accessible"

require "../gtk-4.0/buildable"

require "../gtk-4.0/constraint_target"

require "../gtk-4.0/orientable"

module Adw
  # An adaptive container acting like a box or a stack.
  #
  # The `AdwLeaflet` widget can display its children like a [class@Gtk.Box] does
  # or like a [class@Gtk.Stack] does, adapting to size changes by switching
  # between the two modes.
  #
  # When there is enough space the children are displayed side by side, otherwise
  # only one is displayed and the leaflet is said to be “folded”.
  # The threshold is dictated by the preferred minimum sizes of the children.
  # When a leaflet is folded, the children can be navigated using swipe gestures.
  #
  # The “over” and “under” transition types stack the children one on top of the
  # other, while the “slide” transition puts the children side by side. While
  # navigating to a child on the side or below can be performed by swiping the
  # current child away, navigating to an upper child requires dragging it from
  # the edge where it resides. This doesn't affect non-dragging swipes.
  #
  # ## CSS nodes
  #
  # `AdwLeaflet` has a single CSS node with name `leaflet`. The node will get the
  # style classes `.folded` when it is folded, `.unfolded` when it's not, or none
  # if it hasn't computed its fold yet.
  class Leaflet < Gtk::Widget
    include Swipeable
    include Gtk::Accessible
    include Gtk::Buildable
    include Gtk::ConstraintTarget
    include Gtk::Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_navigate_back : Bool? = nil, can_navigate_forward : Bool? = nil, can_target : Bool? = nil, can_unfold : Bool? = nil, child_transition_params : Adw::SpringParams? = nil, child_transition_running : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, fold_threshold_policy : Adw::FoldThresholdPolicy? = nil, folded : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, homogeneous : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, mode_transition_duration : UInt32? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, pages : Gtk::SelectionModel? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, transition_type : Adw::LeafletTransitionType? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, visible_child : Gtk::Widget? = nil, visible_child_name : ::String? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[49]
      _values = StaticArray(LibGObject::Value, 49).new(LibGObject::Value.new)
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
      if can_navigate_back
        (_names.to_unsafe + _n).value = "can-navigate-back".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_navigate_back)
        _n += 1
      end
      if can_navigate_forward
        (_names.to_unsafe + _n).value = "can-navigate-forward".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_navigate_forward)
        _n += 1
      end
      if can_target
        (_names.to_unsafe + _n).value = "can-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_target)
        _n += 1
      end
      if can_unfold
        (_names.to_unsafe + _n).value = "can-unfold".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_unfold)
        _n += 1
      end
      if child_transition_params
        (_names.to_unsafe + _n).value = "child-transition-params".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child_transition_params)
        _n += 1
      end
      if child_transition_running
        (_names.to_unsafe + _n).value = "child-transition-running".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child_transition_running)
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
      if fold_threshold_policy
        (_names.to_unsafe + _n).value = "fold-threshold-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fold_threshold_policy)
        _n += 1
      end
      if folded
        (_names.to_unsafe + _n).value = "folded".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, folded)
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
      if mode_transition_duration
        (_names.to_unsafe + _n).value = "mode-transition-duration".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mode_transition_duration)
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
      if visible_child_name
        (_names.to_unsafe + _n).value = "visible-child-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible_child_name)
        _n += 1
      end
      if width_request
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Leaflet.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_leaflet_get_type
    end

    def can_navigate_back=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "can-navigate-back", unsafe_value, Pointer(Void).null)
      value
    end

    def can_navigate_back? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "can-navigate-back", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def can_navigate_forward=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "can-navigate-forward", unsafe_value, Pointer(Void).null)
      value
    end

    def can_navigate_forward? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "can-navigate-forward", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def can_unfold=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "can-unfold", unsafe_value, Pointer(Void).null)
      value
    end

    def can_unfold? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "can-unfold", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def child_transition_params=(value : Adw::SpringParams?) : Adw::SpringParams?
      unsafe_value = value

      LibGObject.g_object_set(self, "child-transition-params", unsafe_value, Pointer(Void).null)
      value
    end

    def child_transition_params : Adw::SpringParams?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "child-transition-params", pointerof(value), Pointer(Void).null)
      Adw::SpringParams.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def child_transition_running? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "child-transition-running", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def fold_threshold_policy=(value : Adw::FoldThresholdPolicy) : Adw::FoldThresholdPolicy
      unsafe_value = value

      LibGObject.g_object_set(self, "fold-threshold-policy", unsafe_value, Pointer(Void).null)
      value
    end

    def fold_threshold_policy : Adw::FoldThresholdPolicy
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "fold-threshold-policy", pointerof(value), Pointer(Void).null)
      Adw::FoldThresholdPolicy.from_value(value)
    end

    def folded? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "folded", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def homogeneous=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "homogeneous", unsafe_value, Pointer(Void).null)
      value
    end

    def homogeneous? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "homogeneous", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def mode_transition_duration=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "mode-transition-duration", unsafe_value, Pointer(Void).null)
      value
    end

    def mode_transition_duration : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "mode-transition-duration", pointerof(value), Pointer(Void).null)
      value
    end

    def pages : Gtk::SelectionModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "pages", pointerof(value), Pointer(Void).null)
      Gtk::SelectionModel__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def transition_type=(value : Adw::LeafletTransitionType) : Adw::LeafletTransitionType
      unsafe_value = value

      LibGObject.g_object_set(self, "transition-type", unsafe_value, Pointer(Void).null)
      value
    end

    def transition_type : Adw::LeafletTransitionType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "transition-type", pointerof(value), Pointer(Void).null)
      Adw::LeafletTransitionType.from_value(value)
    end

    def visible_child=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "visible-child", unsafe_value, Pointer(Void).null)
      value
    end

    def visible_child : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "visible-child", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def visible_child_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "visible-child-name", unsafe_value, Pointer(Void).null)
      value
    end

    def visible_child_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "visible-child-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def initialize
      # adw_leaflet_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibAdw.adw_leaflet_new
      @pointer = _retval
    end

    def append(child : Gtk::Widget) : Adw::LeafletPage
      # adw_leaflet_append: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_leaflet_append(self, child)
      Adw::LeafletPage.new(_retval, GICrystal::Transfer::None)
    end

    def adjacent_child(direction : Adw::NavigationDirection) : Gtk::Widget?
      # adw_leaflet_get_adjacent_child: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_leaflet_get_adjacent_child(self, direction)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def can_navigate_back : Bool
      # adw_leaflet_get_can_navigate_back: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_leaflet_get_can_navigate_back(self)
      GICrystal.to_bool(_retval)
    end

    def can_navigate_forward : Bool
      # adw_leaflet_get_can_navigate_forward: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_leaflet_get_can_navigate_forward(self)
      GICrystal.to_bool(_retval)
    end

    def can_unfold : Bool
      # adw_leaflet_get_can_unfold: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_leaflet_get_can_unfold(self)
      GICrystal.to_bool(_retval)
    end

    def child_by_name(name : ::String) : Gtk::Widget?
      # adw_leaflet_get_child_by_name: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_leaflet_get_child_by_name(self, name)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def child_transition_params : Adw::SpringParams
      # adw_leaflet_get_child_transition_params: (Method | Getter)
      # Returns: (transfer full)

      _retval = LibAdw.adw_leaflet_get_child_transition_params(self)
      Adw::SpringParams.new(_retval, GICrystal::Transfer::Full)
    end

    def child_transition_running : Bool
      # adw_leaflet_get_child_transition_running: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_leaflet_get_child_transition_running(self)
      GICrystal.to_bool(_retval)
    end

    def fold_threshold_policy : Adw::FoldThresholdPolicy
      # adw_leaflet_get_fold_threshold_policy: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_leaflet_get_fold_threshold_policy(self)
      Adw::FoldThresholdPolicy.from_value(_retval)
    end

    def folded : Bool
      # adw_leaflet_get_folded: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_leaflet_get_folded(self)
      GICrystal.to_bool(_retval)
    end

    def homogeneous : Bool
      # adw_leaflet_get_homogeneous: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_leaflet_get_homogeneous(self)
      GICrystal.to_bool(_retval)
    end

    def mode_transition_duration : UInt32
      # adw_leaflet_get_mode_transition_duration: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_leaflet_get_mode_transition_duration(self)
      _retval
    end

    def page(child : Gtk::Widget) : Adw::LeafletPage
      # adw_leaflet_get_page: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_leaflet_get_page(self, child)
      Adw::LeafletPage.new(_retval, GICrystal::Transfer::None)
    end

    def pages : Gtk::SelectionModel
      # adw_leaflet_get_pages: (Method | Getter)
      # Returns: (transfer full)

      _retval = LibAdw.adw_leaflet_get_pages(self)
      Gtk::SelectionModel__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def transition_type : Adw::LeafletTransitionType
      # adw_leaflet_get_transition_type: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_leaflet_get_transition_type(self)
      Adw::LeafletTransitionType.from_value(_retval)
    end

    def visible_child : Gtk::Widget?
      # adw_leaflet_get_visible_child: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_leaflet_get_visible_child(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def visible_child_name : ::String?
      # adw_leaflet_get_visible_child_name: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_leaflet_get_visible_child_name(self)
      ::String.new(_retval) unless _retval.null?
    end

    def insert_child_after(child : Gtk::Widget, sibling : Gtk::Widget?) : Adw::LeafletPage
      # adw_leaflet_insert_child_after: (Method)
      # @sibling: (nullable)
      # Returns: (transfer none)

      sibling = if sibling.nil?
                  Pointer(Void).null
                else
                  sibling.to_unsafe
                end

      _retval = LibAdw.adw_leaflet_insert_child_after(self, child, sibling)
      Adw::LeafletPage.new(_retval, GICrystal::Transfer::None)
    end

    def navigate(direction : Adw::NavigationDirection) : Bool
      # adw_leaflet_navigate: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_leaflet_navigate(self, direction)
      GICrystal.to_bool(_retval)
    end

    def prepend(child : Gtk::Widget) : Adw::LeafletPage
      # adw_leaflet_prepend: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_leaflet_prepend(self, child)
      Adw::LeafletPage.new(_retval, GICrystal::Transfer::None)
    end

    def remove(child : Gtk::Widget) : Nil
      # adw_leaflet_remove: (Method)
      # Returns: (transfer none)

      LibAdw.adw_leaflet_remove(self, child)
    end

    def reorder_child_after(child : Gtk::Widget, sibling : Gtk::Widget?) : Nil
      # adw_leaflet_reorder_child_after: (Method)
      # @sibling: (nullable)
      # Returns: (transfer none)

      sibling = if sibling.nil?
                  Pointer(Void).null
                else
                  sibling.to_unsafe
                end

      LibAdw.adw_leaflet_reorder_child_after(self, child, sibling)
    end

    def can_navigate_back=(can_navigate_back : Bool) : Nil
      # adw_leaflet_set_can_navigate_back: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_leaflet_set_can_navigate_back(self, can_navigate_back)
    end

    def can_navigate_forward=(can_navigate_forward : Bool) : Nil
      # adw_leaflet_set_can_navigate_forward: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_leaflet_set_can_navigate_forward(self, can_navigate_forward)
    end

    def can_unfold=(can_unfold : Bool) : Nil
      # adw_leaflet_set_can_unfold: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_leaflet_set_can_unfold(self, can_unfold)
    end

    def child_transition_params=(params : Adw::SpringParams) : Nil
      # adw_leaflet_set_child_transition_params: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_leaflet_set_child_transition_params(self, params)
    end

    def fold_threshold_policy=(policy : Adw::FoldThresholdPolicy) : Nil
      # adw_leaflet_set_fold_threshold_policy: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_leaflet_set_fold_threshold_policy(self, policy)
    end

    def homogeneous=(homogeneous : Bool) : Nil
      # adw_leaflet_set_homogeneous: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_leaflet_set_homogeneous(self, homogeneous)
    end

    def mode_transition_duration=(duration : UInt32) : Nil
      # adw_leaflet_set_mode_transition_duration: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_leaflet_set_mode_transition_duration(self, duration)
    end

    def transition_type=(transition : Adw::LeafletTransitionType) : Nil
      # adw_leaflet_set_transition_type: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_leaflet_set_transition_type(self, transition)
    end

    def visible_child=(visible_child : Gtk::Widget) : Nil
      # adw_leaflet_set_visible_child: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_leaflet_set_visible_child(self, visible_child)
    end

    def visible_child_name=(name : ::String) : Nil
      # adw_leaflet_set_visible_child_name: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_leaflet_set_visible_child_name(self, name)
    end
  end
end
