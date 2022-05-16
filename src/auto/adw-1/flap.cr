require "../gtk-4.0/widget"
require "./swipeable"

require "../gtk-4.0/accessible"

require "../gtk-4.0/buildable"

require "../gtk-4.0/constraint_target"

require "../gtk-4.0/orientable"

module Adw
  # An adaptive container acting like a box or an overlay.
  #
  # <picture>
  #   <source srcset="flap-wide-dark.png" media="(prefers-color-scheme: dark)">
  #   <img src="flap-wide.png" alt="flap-wide">
  # </picture>
  # <picture>
  #   <source srcset="flap-narrow-dark.png" media="(prefers-color-scheme: dark)">
  #   <img src="flap-narrow.png" alt="flap-narrow">
  # </picture>
  #
  # The `AdwFlap` widget can display its children like a `Gtk#Box` does or
  # like a `Gtk#Overlay` does, according to the
  # [property@Flap:fold-policy] value.
  #
  # `AdwFlap` has at most three children: `Flap#content`,
  # `Flap#flap` and `Flap#separator`. Content is the primary
  # child, flap is displayed next to it when unfolded, or overlays it when
  # folded. Flap can be shown or hidden by changing the
  # [property@Flap:reveal-flap] value, as well as via swipe gestures if
  # [property@Flap:swipe-to-open] and/or [property@Flap:swipe-to-close] are set
  # to `TRUE`.
  #
  # Optionally, a separator can be provided, which would be displayed between
  # the content and the flap when there's no shadow to separate them, depending
  # on the transition type.
  #
  # `Flap#flap` is transparent by default; add the
  # [`.background`](style-classes.html#background) style class to it if this is
  # unwanted.
  #
  # If `Flap#modal` is set to `TRUE`, content becomes completely
  # inaccessible when the flap is revealed while folded.
  #
  # The position of the flap and separator children relative to the content is
  # determined by orientation, as well as the [property@Flap:flap-position]
  # value.
  #
  # Folding the flap will automatically hide the flap widget, and unfolding it
  # will automatically reveal it. If this behavior is not desired, the
  # `Flap#locked` property can be used to override it.
  #
  # Common use cases include sidebars, header bars that need to be able to
  # overlap the window content (for example, in fullscreen mode) and bottom
  # sheets.
  #
  # ## AdwFlap as GtkBuildable
  #
  # The `AdwFlap` implementation of the `Gtk#Buildable` interface supports
  # setting the flap child by specifying “flap” as the “type” attribute of a
  # <child> element, and separator by specifying “separator”. Specifying
  # “content” child type or omitting it results in setting the content child.
  #
  # ## CSS nodes
  #
  # `AdwFlap` has a single CSS node with name `flap`. The node will get the style
  # classes `.folded` when it is folded, and `.unfolded` when it's not.
  @[GObject::GeneratedWrapper]
  class Flap < Gtk::Widget
    include Swipeable
    include Gtk::Accessible
    include Gtk::Buildable
    include Gtk::ConstraintTarget
    include Gtk::Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::FlapClass), class_init,
        sizeof(LibAdw::Flap), instance_init, 0)
    end

    GICrystal.define_new_method(Flap, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Flap`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, content : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, flap : Gtk::Widget? = nil, flap_position : Gtk::PackType? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, fold_duration : UInt32? = nil, fold_policy : Adw::FlapFoldPolicy? = nil, fold_threshold_policy : Adw::FoldThresholdPolicy? = nil, folded : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, locked : Bool? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, modal : Bool? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, reveal_flap : Bool? = nil, reveal_params : Adw::SpringParams? = nil, reveal_progress : Float64? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, separator : Gtk::Widget? = nil, swipe_to_close : Bool? = nil, swipe_to_open : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, transition_type : Adw::FlapTransitionType? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[52]
      _values = StaticArray(LibGObject::Value, 52).new(LibGObject::Value.new)
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
      if !content.nil?
        (_names.to_unsafe + _n).value = "content".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, content)
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
      if !flap.nil?
        (_names.to_unsafe + _n).value = "flap".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flap)
        _n += 1
      end
      if !flap_position.nil?
        (_names.to_unsafe + _n).value = "flap-position".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flap_position)
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
      if !fold_duration.nil?
        (_names.to_unsafe + _n).value = "fold-duration".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fold_duration)
        _n += 1
      end
      if !fold_policy.nil?
        (_names.to_unsafe + _n).value = "fold-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fold_policy)
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
      if !layout_manager.nil?
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if !locked.nil?
        (_names.to_unsafe + _n).value = "locked".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, locked)
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
      if !modal.nil?
        (_names.to_unsafe + _n).value = "modal".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, modal)
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
      if !reveal_flap.nil?
        (_names.to_unsafe + _n).value = "reveal-flap".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, reveal_flap)
        _n += 1
      end
      if !reveal_params.nil?
        (_names.to_unsafe + _n).value = "reveal-params".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, reveal_params)
        _n += 1
      end
      if !reveal_progress.nil?
        (_names.to_unsafe + _n).value = "reveal-progress".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, reveal_progress)
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
      if !separator.nil?
        (_names.to_unsafe + _n).value = "separator".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, separator)
        _n += 1
      end
      if !swipe_to_close.nil?
        (_names.to_unsafe + _n).value = "swipe-to-close".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, swipe_to_close)
        _n += 1
      end
      if !swipe_to_open.nil?
        (_names.to_unsafe + _n).value = "swipe-to-open".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, swipe_to_open)
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
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Flap.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      Gtk::PackType.new(value)
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
      Adw::FlapFoldPolicy.new(value)
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

    def reveal_params=(value : Adw::SpringParams?) : Adw::SpringParams?
      unsafe_value = value

      LibGObject.g_object_set(self, "reveal-params", unsafe_value, Pointer(Void).null)
      value
    end

    def reveal_params : Adw::SpringParams?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "reveal-params", pointerof(value), Pointer(Void).null)
      Adw::SpringParams.new(value, GICrystal::Transfer::None) unless value.null?
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
      Adw::FlapTransitionType.new(value)
    end

    # Creates a new `AdwFlap`.
    def initialize
      # adw_flap_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_flap_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the content widget for @self.
    def content : Gtk::Widget?
      # adw_flap_get_content: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_flap_get_content(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the flap widget for @self.
    def flap : Gtk::Widget?
      # adw_flap_get_flap: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_flap_get_flap(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the flap position for @self.
    def flap_position : Gtk::PackType
      # adw_flap_get_flap_position: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_flap_get_flap_position(@pointer)

      # Return value handling

      Gtk::PackType.new(_retval)
    end

    # Gets the duration that fold transitions in @self will take.
    def fold_duration : UInt32
      # adw_flap_get_fold_duration: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_flap_get_fold_duration(@pointer)

      # Return value handling

      _retval
    end

    # Gets the fold policy for @self.
    def fold_policy : Adw::FlapFoldPolicy
      # adw_flap_get_fold_policy: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_flap_get_fold_policy(@pointer)

      # Return value handling

      Adw::FlapFoldPolicy.new(_retval)
    end

    # Gets the fold threshold policy for @self.
    def fold_threshold_policy : Adw::FoldThresholdPolicy
      # adw_flap_get_fold_threshold_policy: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_flap_get_fold_threshold_policy(@pointer)

      # Return value handling

      Adw::FoldThresholdPolicy.new(_retval)
    end

    # Gets whether @self is currently folded.
    def folded : Bool
      # adw_flap_get_folded: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_flap_get_folded(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether @self is locked.
    def locked : Bool
      # adw_flap_get_locked: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_flap_get_locked(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether @self is modal.
    def modal : Bool
      # adw_flap_get_modal: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_flap_get_modal(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether the flap widget is revealed for @self.
    def reveal_flap : Bool
      # adw_flap_get_reveal_flap: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_flap_get_reveal_flap(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the reveal animation spring parameters for @self.
    def reveal_params : Adw::SpringParams
      # adw_flap_get_reveal_params: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibAdw.adw_flap_get_reveal_params(@pointer)

      # Return value handling

      Adw::SpringParams.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the current reveal progress for @self.
    def reveal_progress : Float64
      # adw_flap_get_reveal_progress: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_flap_get_reveal_progress(@pointer)

      # Return value handling

      _retval
    end

    # Gets the separator widget for @self.
    def separator : Gtk::Widget?
      # adw_flap_get_separator: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_flap_get_separator(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets whether @self can be closed with a swipe gesture.
    def swipe_to_close : Bool
      # adw_flap_get_swipe_to_close: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_flap_get_swipe_to_close(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether @self can be opened with a swipe gesture.
    def swipe_to_open : Bool
      # adw_flap_get_swipe_to_open: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_flap_get_swipe_to_open(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the type of animation used for reveal and fold transitions in @self.
    def transition_type : Adw::FlapTransitionType
      # adw_flap_get_transition_type: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_flap_get_transition_type(@pointer)

      # Return value handling

      Adw::FlapTransitionType.new(_retval)
    end

    # Sets the content widget for @self.
    def content=(content : Gtk::Widget?) : Nil
      # adw_flap_set_content: (Method | Setter)
      # @content: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      content = if content.nil?
                  Pointer(Void).null
                else
                  content.to_unsafe
                end

      # C call
      LibAdw.adw_flap_set_content(@pointer, content)

      # Return value handling
    end

    # Sets the flap widget for @self.
    def flap=(flap : Gtk::Widget?) : Nil
      # adw_flap_set_flap: (Method | Setter)
      # @flap: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      flap = if flap.nil?
               Pointer(Void).null
             else
               flap.to_unsafe
             end

      # C call
      LibAdw.adw_flap_set_flap(@pointer, flap)

      # Return value handling
    end

    # Sets the flap position for @self.
    def flap_position=(position : Gtk::PackType) : Nil
      # adw_flap_set_flap_position: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_flap_set_flap_position(@pointer, position)

      # Return value handling
    end

    # Sets the duration that fold transitions in @self will take.
    def fold_duration=(duration : UInt32) : Nil
      # adw_flap_set_fold_duration: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_flap_set_fold_duration(@pointer, duration)

      # Return value handling
    end

    # Sets the fold policy for @self.
    def fold_policy=(policy : Adw::FlapFoldPolicy) : Nil
      # adw_flap_set_fold_policy: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_flap_set_fold_policy(@pointer, policy)

      # Return value handling
    end

    # Sets the fold threshold policy for @self.
    def fold_threshold_policy=(policy : Adw::FoldThresholdPolicy) : Nil
      # adw_flap_set_fold_threshold_policy: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_flap_set_fold_threshold_policy(@pointer, policy)

      # Return value handling
    end

    # Sets whether @self is locked.
    def locked=(locked : Bool) : Nil
      # adw_flap_set_locked: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_flap_set_locked(@pointer, locked)

      # Return value handling
    end

    # Sets whether @self is modal.
    def modal=(modal : Bool) : Nil
      # adw_flap_set_modal: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_flap_set_modal(@pointer, modal)

      # Return value handling
    end

    # Sets whether the flap widget is revealed for @self.
    def reveal_flap=(reveal_flap : Bool) : Nil
      # adw_flap_set_reveal_flap: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_flap_set_reveal_flap(@pointer, reveal_flap)

      # Return value handling
    end

    # Sets the reveal animation spring parameters for @self.
    def reveal_params=(params : Adw::SpringParams) : Nil
      # adw_flap_set_reveal_params: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_flap_set_reveal_params(@pointer, params)

      # Return value handling
    end

    # Sets the separator widget for @self.
    def separator=(separator : Gtk::Widget?) : Nil
      # adw_flap_set_separator: (Method | Setter)
      # @separator: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      separator = if separator.nil?
                    Pointer(Void).null
                  else
                    separator.to_unsafe
                  end

      # C call
      LibAdw.adw_flap_set_separator(@pointer, separator)

      # Return value handling
    end

    # Sets whether @self can be closed with a swipe gesture.
    def swipe_to_close=(swipe_to_close : Bool) : Nil
      # adw_flap_set_swipe_to_close: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_flap_set_swipe_to_close(@pointer, swipe_to_close)

      # Return value handling
    end

    # Sets whether @self can be opened with a swipe gesture.
    def swipe_to_open=(swipe_to_open : Bool) : Nil
      # adw_flap_set_swipe_to_open: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_flap_set_swipe_to_open(@pointer, swipe_to_open)

      # Return value handling
    end

    # Sets the type of animation used for reveal and fold transitions in @self.
    def transition_type=(transition_type : Adw::FlapTransitionType) : Nil
      # adw_flap_set_transition_type: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_flap_set_transition_type(@pointer, transition_type)

      # Return value handling
    end
  end
end
