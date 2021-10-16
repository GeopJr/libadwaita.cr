require "../gtk-4.0/widget"
require "./swipeable"

require "../gtk-4.0/accessible"

require "../gtk-4.0/buildable"

require "../gtk-4.0/constraint_target"

require "../gtk-4.0/orientable"

module Adw
  # An adaptive container acting like a box or an overlay.
  #
  # The `AdwFlap` widget can display its children like a [class@Gtk.Box] does or
  # like a [class@Gtk.Overlay] does, according to the
  # [property@Adw.Flap:fold-policy] value.
  #
  # `AdwFlap` has at most three children: [property@Adw.Flap:content],
  # [property@Adw.Flap:flap] and [property@Adw.Flap:separator]. Content is the
  # primary child, flap is displayed next to it when unfolded, or overlays it
  # when folded. Flap can be shown or hidden by changing th
  # [property@Adw.Flap:reveal-flap] value, as well as via swipe gestures if
  # [property@Adw.Flap:swipe-to-open] and/or [property@Adw.Flap:swipe-to-close] are
  # set to `TRUE`.
  #
  # Optionally, a separator can be provided, which would be displayed between
  # the content and the flap when there's no shadow to separate them, depending
  # on the transition type.
  #
  # [property@Adw.Flap:flap] is transparent by default; add the `.background`
  # style class to it if this is unwanted.
  #
  # If [property@Adw.Flap:modal] is set to `TRUE`, content becomes completely
  # inaccessible when the flap is revealed while folded.
  #
  # The position of the flap and separator children relative to the content is
  # determined by orientation, as well as the [property@Adw.Flap:flap-position]
  # value.
  #
  # Folding the flap will automatically hide the flap widget, and unfolding it
  # will automatically reveal it. If this behavior is not desired, the
  # [property@Adw.Flap:locked] property can be used to override it.
  #
  # Common use cases include sidebars, header bars that need to be able to
  # overlap the window content (for example, in fullscreen mode) and bottom
  # sheets.
  #
  # ## AdwFlap as GtkBuildable
  #
  # The `AdwFlap` implementation of the [iface@Gtk.Buildable] interface supports
  # setting the flap child by specifying “flap” as the “type” attribute of a
  # <child> element, and separator by specifying “separator”. Specifying
  # “content” child type or omitting it results in setting the content child.
  #
  # ## CSS nodes
  #
  # `AdwFlap` has a single CSS node with name `flap`. The node will get the style
  # classes `.folded` when it is folded, and `.unfolded` when it's not.
  class Flap < Gtk::Widget
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

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, content : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, flap : Gtk::Widget? = nil, flap_position : Gtk::PackType? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, fold_duration : UInt32? = nil, fold_policy : Adw::FlapFoldPolicy? = nil, fold_threshold_policy : Adw::FoldThresholdPolicy? = nil, folded : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, locked : Bool? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, modal : Bool? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, reveal_duration : UInt32? = nil, reveal_flap : Bool? = nil, reveal_progress : Float64? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, separator : Gtk::Widget? = nil, swipe_to_close : Bool? = nil, swipe_to_open : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, transition_type : Adw::FlapTransitionType? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[52]
      _values = StaticArray(LibGObject::Value, 52).new(LibGObject::Value.new)
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
      if content
        (_names.to_unsafe + _n).value = "content".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, content)
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
      if flap
        (_names.to_unsafe + _n).value = "flap".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flap)
        _n += 1
      end
      if flap_position
        (_names.to_unsafe + _n).value = "flap-position".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flap_position)
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
      if fold_duration
        (_names.to_unsafe + _n).value = "fold-duration".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fold_duration)
        _n += 1
      end
      if fold_policy
        (_names.to_unsafe + _n).value = "fold-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fold_policy)
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
      if layout_manager
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if locked
        (_names.to_unsafe + _n).value = "locked".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, locked)
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
      if modal
        (_names.to_unsafe + _n).value = "modal".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, modal)
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
      if reveal_duration
        (_names.to_unsafe + _n).value = "reveal-duration".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, reveal_duration)
        _n += 1
      end
      if reveal_flap
        (_names.to_unsafe + _n).value = "reveal-flap".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, reveal_flap)
        _n += 1
      end
      if reveal_progress
        (_names.to_unsafe + _n).value = "reveal-progress".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, reveal_progress)
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
      if separator
        (_names.to_unsafe + _n).value = "separator".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, separator)
        _n += 1
      end
      if swipe_to_close
        (_names.to_unsafe + _n).value = "swipe-to-close".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, swipe_to_close)
        _n += 1
      end
      if swipe_to_open
        (_names.to_unsafe + _n).value = "swipe-to-open".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, swipe_to_open)
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
      if width_request
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Flap.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_flap_get_type
    end

    def content=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "content", unsafe_value, Pointer(Void).null)
      value
    end

    def content : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "content", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def flap=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "flap", unsafe_value, Pointer(Void).null)
      value
    end

    def flap : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "flap", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def flap_position=(value : Gtk::PackType) : Gtk::PackType
      unsafe_value = value

      LibGObject.g_object_set(self, "flap-position", unsafe_value, Pointer(Void).null)
      value
    end

    def flap_position : Gtk::PackType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "flap-position", pointerof(value), Pointer(Void).null)
      Gtk::PackType.from_value(value)
    end

    def fold_duration=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "fold-duration", unsafe_value, Pointer(Void).null)
      value
    end

    def fold_duration : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "fold-duration", pointerof(value), Pointer(Void).null)
      value
    end

    def fold_policy=(value : Adw::FlapFoldPolicy) : Adw::FlapFoldPolicy
      unsafe_value = value

      LibGObject.g_object_set(self, "fold-policy", unsafe_value, Pointer(Void).null)
      value
    end

    def fold_policy : Adw::FlapFoldPolicy
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "fold-policy", pointerof(value), Pointer(Void).null)
      Adw::FlapFoldPolicy.from_value(value)
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

    def locked=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "locked", unsafe_value, Pointer(Void).null)
      value
    end

    def locked? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "locked", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def modal=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "modal", unsafe_value, Pointer(Void).null)
      value
    end

    def modal? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "modal", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def reveal_duration=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "reveal-duration", unsafe_value, Pointer(Void).null)
      value
    end

    def reveal_duration : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "reveal-duration", pointerof(value), Pointer(Void).null)
      value
    end

    def reveal_flap=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "reveal-flap", unsafe_value, Pointer(Void).null)
      value
    end

    def reveal_flap? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "reveal-flap", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def reveal_progress : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "reveal-progress", pointerof(value), Pointer(Void).null)
      value
    end

    def separator=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "separator", unsafe_value, Pointer(Void).null)
      value
    end

    def separator : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "separator", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def swipe_to_close=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "swipe-to-close", unsafe_value, Pointer(Void).null)
      value
    end

    def swipe_to_close? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "swipe-to-close", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def swipe_to_open=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "swipe-to-open", unsafe_value, Pointer(Void).null)
      value
    end

    def swipe_to_open? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "swipe-to-open", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def transition_type=(value : Adw::FlapTransitionType) : Adw::FlapTransitionType
      unsafe_value = value

      LibGObject.g_object_set(self, "transition-type", unsafe_value, Pointer(Void).null)
      value
    end

    def transition_type : Adw::FlapTransitionType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "transition-type", pointerof(value), Pointer(Void).null)
      Adw::FlapTransitionType.from_value(value)
    end

    def initialize
      # adw_flap_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibAdw.adw_flap_new
      @pointer = _retval
    end

    def content : Gtk::Widget?
      # adw_flap_get_content: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_flap_get_content(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def flap : Gtk::Widget?
      # adw_flap_get_flap: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_flap_get_flap(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def flap_position : Gtk::PackType
      # adw_flap_get_flap_position: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_flap_get_flap_position(self)
      Gtk::PackType.from_value(_retval)
    end

    def fold_duration : UInt32
      # adw_flap_get_fold_duration: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_flap_get_fold_duration(self)
      _retval
    end

    def fold_policy : Adw::FlapFoldPolicy
      # adw_flap_get_fold_policy: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_flap_get_fold_policy(self)
      Adw::FlapFoldPolicy.from_value(_retval)
    end

    def fold_threshold_policy : Adw::FoldThresholdPolicy
      # adw_flap_get_fold_threshold_policy: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_flap_get_fold_threshold_policy(self)
      Adw::FoldThresholdPolicy.from_value(_retval)
    end

    def folded : Bool
      # adw_flap_get_folded: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_flap_get_folded(self)
      GICrystal.to_bool(_retval)
    end

    def locked : Bool
      # adw_flap_get_locked: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_flap_get_locked(self)
      GICrystal.to_bool(_retval)
    end

    def modal : Bool
      # adw_flap_get_modal: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_flap_get_modal(self)
      GICrystal.to_bool(_retval)
    end

    def reveal_duration : UInt32
      # adw_flap_get_reveal_duration: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_flap_get_reveal_duration(self)
      _retval
    end

    def reveal_flap : Bool
      # adw_flap_get_reveal_flap: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_flap_get_reveal_flap(self)
      GICrystal.to_bool(_retval)
    end

    def reveal_progress : Float64
      # adw_flap_get_reveal_progress: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_flap_get_reveal_progress(self)
      _retval
    end

    def separator : Gtk::Widget?
      # adw_flap_get_separator: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_flap_get_separator(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def swipe_to_close : Bool
      # adw_flap_get_swipe_to_close: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_flap_get_swipe_to_close(self)
      GICrystal.to_bool(_retval)
    end

    def swipe_to_open : Bool
      # adw_flap_get_swipe_to_open: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_flap_get_swipe_to_open(self)
      GICrystal.to_bool(_retval)
    end

    def transition_type : Adw::FlapTransitionType
      # adw_flap_get_transition_type: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_flap_get_transition_type(self)
      Adw::FlapTransitionType.from_value(_retval)
    end

    def content=(content : Gtk::Widget?) : Nil
      # adw_flap_set_content: (Method | Setter)
      # @content: (nullable)
      # Returns: (transfer none)

      content = if content.nil?
                  Pointer(Void).null
                else
                  content.to_unsafe
                end

      LibAdw.adw_flap_set_content(self, content)
    end

    def flap=(flap : Gtk::Widget?) : Nil
      # adw_flap_set_flap: (Method | Setter)
      # @flap: (nullable)
      # Returns: (transfer none)

      flap = if flap.nil?
               Pointer(Void).null
             else
               flap.to_unsafe
             end

      LibAdw.adw_flap_set_flap(self, flap)
    end

    def flap_position=(position : Gtk::PackType) : Nil
      # adw_flap_set_flap_position: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_flap_set_flap_position(self, position)
    end

    def fold_duration=(duration : UInt32) : Nil
      # adw_flap_set_fold_duration: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_flap_set_fold_duration(self, duration)
    end

    def fold_policy=(policy : Adw::FlapFoldPolicy) : Nil
      # adw_flap_set_fold_policy: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_flap_set_fold_policy(self, policy)
    end

    def fold_threshold_policy=(policy : Adw::FoldThresholdPolicy) : Nil
      # adw_flap_set_fold_threshold_policy: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_flap_set_fold_threshold_policy(self, policy)
    end

    def locked=(locked : Bool) : Nil
      # adw_flap_set_locked: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_flap_set_locked(self, locked)
    end

    def modal=(modal : Bool) : Nil
      # adw_flap_set_modal: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_flap_set_modal(self, modal)
    end

    def reveal_duration=(duration : UInt32) : Nil
      # adw_flap_set_reveal_duration: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_flap_set_reveal_duration(self, duration)
    end

    def reveal_flap=(reveal_flap : Bool) : Nil
      # adw_flap_set_reveal_flap: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_flap_set_reveal_flap(self, reveal_flap)
    end

    def separator=(separator : Gtk::Widget?) : Nil
      # adw_flap_set_separator: (Method | Setter)
      # @separator: (nullable)
      # Returns: (transfer none)

      separator = if separator.nil?
                    Pointer(Void).null
                  else
                    separator.to_unsafe
                  end

      LibAdw.adw_flap_set_separator(self, separator)
    end

    def swipe_to_close=(swipe_to_close : Bool) : Nil
      # adw_flap_set_swipe_to_close: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_flap_set_swipe_to_close(self, swipe_to_close)
    end

    def swipe_to_open=(swipe_to_open : Bool) : Nil
      # adw_flap_set_swipe_to_open: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_flap_set_swipe_to_open(self, swipe_to_open)
    end

    def transition_type=(transition_type : Adw::FlapTransitionType) : Nil
      # adw_flap_set_transition_type: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_flap_set_transition_type(self, transition_type)
    end
  end
end
