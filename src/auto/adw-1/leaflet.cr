require "../gtk-4.0/widget"
require "./swipeable"

require "../gtk-4.0/accessible"

require "../gtk-4.0/buildable"

require "../gtk-4.0/constraint_target"

require "../gtk-4.0/orientable"

module Adw
  # An adaptive container acting like a box or a stack.
  #
  # <picture>
  #   <source srcset="leaflet-wide-dark.png" media="(prefers-color-scheme: dark)">
  #   <img src="leaflet-wide.png" alt="leaflet-wide">
  # </picture>
  # <picture>
  #   <source srcset="leaflet-narrow-dark.png" media="(prefers-color-scheme: dark)">
  #   <img src="leaflet-narrow.png" alt="leaflet-narrow">
  # </picture>
  #
  # The `AdwLeaflet` widget can display its children like a `Gtk#Box` does
  # or like a `Gtk#Stack` does, adapting to size changes by switching
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
  @[GObject::GeneratedWrapper]
  class Leaflet < Gtk::Widget
    include Swipeable
    include Gtk::Accessible
    include Gtk::Buildable
    include Gtk::ConstraintTarget
    include Gtk::Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::LeafletClass), class_init,
        sizeof(LibAdw::Leaflet), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_navigate_back : Bool? = nil, can_navigate_forward : Bool? = nil, can_target : Bool? = nil, can_unfold : Bool? = nil, child_transition_params : Adw::SpringParams? = nil, child_transition_running : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, fold_threshold_policy : Adw::FoldThresholdPolicy? = nil, folded : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, homogeneous : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, mode_transition_duration : UInt32? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, pages : Gtk::SelectionModel? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, transition_type : Adw::LeafletTransitionType? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, visible_child : Gtk::Widget? = nil, visible_child_name : ::String? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[49]
      _values = StaticArray(LibGObject::Value, 49).new(LibGObject::Value.new)
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
      if !can_navigate_back.nil?
        (_names.to_unsafe + _n).value = "can-navigate-back".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_navigate_back)
        _n += 1
      end
      if !can_navigate_forward.nil?
        (_names.to_unsafe + _n).value = "can-navigate-forward".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_navigate_forward)
        _n += 1
      end
      if !can_target.nil?
        (_names.to_unsafe + _n).value = "can-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_target)
        _n += 1
      end
      if !can_unfold.nil?
        (_names.to_unsafe + _n).value = "can-unfold".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_unfold)
        _n += 1
      end
      if !child_transition_params.nil?
        (_names.to_unsafe + _n).value = "child-transition-params".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child_transition_params)
        _n += 1
      end
      if !child_transition_running.nil?
        (_names.to_unsafe + _n).value = "child-transition-running".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child_transition_running)
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
      if !fold_threshold_policy.nil?
        (_names.to_unsafe + _n).value = "fold-threshold-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fold_threshold_policy)
        _n += 1
      end
      if !folded.nil?
        (_names.to_unsafe + _n).value = "folded".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, folded)
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
      if !homogeneous.nil?
        (_names.to_unsafe + _n).value = "homogeneous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, homogeneous)
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
      if !mode_transition_duration.nil?
        (_names.to_unsafe + _n).value = "mode-transition-duration".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mode_transition_duration)
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
      if !orientation.nil?
        (_names.to_unsafe + _n).value = "orientation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, orientation)
        _n += 1
      end
      if !overflow.nil?
        (_names.to_unsafe + _n).value = "overflow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overflow)
        _n += 1
      end
      if !pages.nil?
        (_names.to_unsafe + _n).value = "pages".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pages)
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
      if !transition_type.nil?
        (_names.to_unsafe + _n).value = "transition-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transition_type)
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
      if !visible_child.nil?
        (_names.to_unsafe + _n).value = "visible-child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible_child)
        _n += 1
      end
      if !visible_child_name.nil?
        (_names.to_unsafe + _n).value = "visible-child-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible_child_name)
        _n += 1
      end
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Leaflet.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
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
      Adw::FoldThresholdPolicy.new(value)
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
      Adw::LeafletTransitionType.new(value)
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

    # Creates a new `AdwLeaflet`.
    def initialize
      # adw_leaflet_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_leaflet_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
    end

    # Adds a child to @self.
    def append(child : Gtk::Widget) : Adw::LeafletPage
      # adw_leaflet_append: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_leaflet_append(self, child)

      # Return value handling

      Adw::LeafletPage.new(_retval, GICrystal::Transfer::None)
    end

    # Finds the previous or next navigatable child.
    #
    # This will be the same child `Leaflet#navigate` or swipe gestures will
    # navigate to.
    #
    # If there's no child to navigate to, `NULL` will be returned instead.
    #
    # See `LeafletPage#navigatable`.
    def adjacent_child(direction : Adw::NavigationDirection) : Gtk::Widget?
      # adw_leaflet_get_adjacent_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_leaflet_get_adjacent_child(self, direction)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets whether gestures and shortcuts for navigating backward are enabled.
    def can_navigate_back : Bool
      # adw_leaflet_get_can_navigate_back: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_leaflet_get_can_navigate_back(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether gestures and shortcuts for navigating forward are enabled.
    def can_navigate_forward : Bool
      # adw_leaflet_get_can_navigate_forward: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_leaflet_get_can_navigate_forward(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether @self can unfold.
    def can_unfold : Bool
      # adw_leaflet_get_can_unfold: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_leaflet_get_can_unfold(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Finds the child of @self with @name.
    #
    # Returns `NULL` if there is no child with this name.
    #
    # See `LeafletPage#name`.
    def child_by_name(name : ::String) : Gtk::Widget?
      # adw_leaflet_get_child_by_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_leaflet_get_child_by_name(self, name)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the child transition spring parameters for @self.
    def child_transition_params : Adw::SpringParams
      # adw_leaflet_get_child_transition_params: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibAdw.adw_leaflet_get_child_transition_params(self)

      # Return value handling

      Adw::SpringParams.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets whether a child transition is currently running for @self.
    def child_transition_running : Bool
      # adw_leaflet_get_child_transition_running: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_leaflet_get_child_transition_running(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the fold threshold policy for @self.
    def fold_threshold_policy : Adw::FoldThresholdPolicy
      # adw_leaflet_get_fold_threshold_policy: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_leaflet_get_fold_threshold_policy(self)

      # Return value handling

      Adw::FoldThresholdPolicy.new(_retval)
    end

    # Gets whether @self is folded.
    def folded : Bool
      # adw_leaflet_get_folded: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_leaflet_get_folded(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether @self is homogeneous.
    def homogeneous : Bool
      # adw_leaflet_get_homogeneous: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_leaflet_get_homogeneous(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the mode transition animation duration for @self.
    def mode_transition_duration : UInt32
      # adw_leaflet_get_mode_transition_duration: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_leaflet_get_mode_transition_duration(self)

      # Return value handling

      _retval
    end

    # Returns the `#LeafletPage` object for @child.
    def page(child : Gtk::Widget) : Adw::LeafletPage
      # adw_leaflet_get_page: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_leaflet_get_page(self, child)

      # Return value handling

      Adw::LeafletPage.new(_retval, GICrystal::Transfer::None)
    end

    # Returns a `Gio#ListModel` that contains the pages of the leaflet.
    #
    # This can be used to keep an up-to-date view. The model also implements
    # `Gtk#SelectionModel` and can be used to track and change the visible
    # page.
    def pages : Gtk::SelectionModel
      # adw_leaflet_get_pages: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibAdw.adw_leaflet_get_pages(self)

      # Return value handling

      Gtk::SelectionModel__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the type of animation used for transitions between modes and children.
    def transition_type : Adw::LeafletTransitionType
      # adw_leaflet_get_transition_type: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_leaflet_get_transition_type(self)

      # Return value handling

      Adw::LeafletTransitionType.new(_retval)
    end

    # Gets the widget currently visible when the leaflet is folded.
    def visible_child : Gtk::Widget?
      # adw_leaflet_get_visible_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_leaflet_get_visible_child(self)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the name of the currently visible child widget.
    def visible_child_name : ::String?
      # adw_leaflet_get_visible_child_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_leaflet_get_visible_child_name(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Inserts @child in the position after @sibling in the list of children.
    #
    # If @sibling is `NULL`, inserts @child at the first position.
    def insert_child_after(child : Gtk::Widget, sibling : Gtk::Widget?) : Adw::LeafletPage
      # adw_leaflet_insert_child_after: (Method)
      # @sibling: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      sibling = if sibling.nil?
                  Pointer(Void).null
                else
                  sibling.to_unsafe
                end

      # C call
      _retval = LibAdw.adw_leaflet_insert_child_after(self, child, sibling)

      # Return value handling

      Adw::LeafletPage.new(_retval, GICrystal::Transfer::None)
    end

    # Navigates to the previous or next child.
    #
    # The child must have the `LeafletPage#navigatable` property set to
    # `TRUE`, otherwise it will be skipped.
    #
    # This will be the same child as returned by
    # `Leaflet#adjacent_child` or navigated to via swipe gestures.
    def navigate(direction : Adw::NavigationDirection) : Bool
      # adw_leaflet_navigate: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_leaflet_navigate(self, direction)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Inserts @child at the first position in @self.
    def prepend(child : Gtk::Widget) : Adw::LeafletPage
      # adw_leaflet_prepend: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_leaflet_prepend(self, child)

      # Return value handling

      Adw::LeafletPage.new(_retval, GICrystal::Transfer::None)
    end

    # Removes a child widget from @self.
    def remove(child : Gtk::Widget) : Nil
      # adw_leaflet_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_leaflet_remove(self, child)

      # Return value handling
    end

    # Moves @child to the position after @sibling in the list of children.
    #
    # If @sibling is `NULL`, moves @child to the first position.
    def reorder_child_after(child : Gtk::Widget, sibling : Gtk::Widget?) : Nil
      # adw_leaflet_reorder_child_after: (Method)
      # @sibling: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      sibling = if sibling.nil?
                  Pointer(Void).null
                else
                  sibling.to_unsafe
                end

      # C call
      LibAdw.adw_leaflet_reorder_child_after(self, child, sibling)

      # Return value handling
    end

    # Sets whether gestures and shortcuts for navigating backward are enabled.
    def can_navigate_back=(can_navigate_back : Bool) : Nil
      # adw_leaflet_set_can_navigate_back: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_leaflet_set_can_navigate_back(self, can_navigate_back)

      # Return value handling
    end

    # Sets whether gestures and shortcuts for navigating forward are enabled.
    def can_navigate_forward=(can_navigate_forward : Bool) : Nil
      # adw_leaflet_set_can_navigate_forward: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_leaflet_set_can_navigate_forward(self, can_navigate_forward)

      # Return value handling
    end

    # Sets whether @self can unfold.
    def can_unfold=(can_unfold : Bool) : Nil
      # adw_leaflet_set_can_unfold: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_leaflet_set_can_unfold(self, can_unfold)

      # Return value handling
    end

    # Sets the child transition spring parameters for @self.
    def child_transition_params=(params : Adw::SpringParams) : Nil
      # adw_leaflet_set_child_transition_params: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_leaflet_set_child_transition_params(self, params)

      # Return value handling
    end

    # Sets the fold threshold policy for @self.
    def fold_threshold_policy=(policy : Adw::FoldThresholdPolicy) : Nil
      # adw_leaflet_set_fold_threshold_policy: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_leaflet_set_fold_threshold_policy(self, policy)

      # Return value handling
    end

    # Sets @self to be homogeneous or not.
    #
    # If set to `FALSE`, different children can have different size along the
    # opposite orientation.
    def homogeneous=(homogeneous : Bool) : Nil
      # adw_leaflet_set_homogeneous: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_leaflet_set_homogeneous(self, homogeneous)

      # Return value handling
    end

    # Sets the mode transition animation duration for @self.
    def mode_transition_duration=(duration : UInt32) : Nil
      # adw_leaflet_set_mode_transition_duration: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_leaflet_set_mode_transition_duration(self, duration)

      # Return value handling
    end

    # Sets the type of animation used for transitions between modes and children.
    def transition_type=(transition : Adw::LeafletTransitionType) : Nil
      # adw_leaflet_set_transition_type: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_leaflet_set_transition_type(self, transition)

      # Return value handling
    end

    # Sets the widget currently visible when the leaflet is folded.
    def visible_child=(visible_child : Gtk::Widget) : Nil
      # adw_leaflet_set_visible_child: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_leaflet_set_visible_child(self, visible_child)

      # Return value handling
    end

    # Makes the child with the name @name visible.
    #
    # See adw_leaflet_set_visible_child() for more details.
    def visible_child_name=(name : ::String) : Nil
      # adw_leaflet_set_visible_child_name: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_leaflet_set_visible_child_name(self, name)

      # Return value handling
    end
  end
end
