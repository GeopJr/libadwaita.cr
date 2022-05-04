require "../gtk-4.0/widget"
require "../gtk-4.0/accessible"

require "../gtk-4.0/buildable"

require "../gtk-4.0/constraint_target"

require "../gtk-4.0/orientable"

module Adw
  # A best fit container.
  #
  # <picture>
  #   <source srcset="squeezer-wide-dark.png" media="(prefers-color-scheme: dark)">
  #   <img src="squeezer-wide.png" alt="squeezer-wide">
  # </picture>
  # <picture>
  #   <source srcset="squeezer-narrow-dark.png" media="(prefers-color-scheme: dark)">
  #   <img src="squeezer-narrow.png" alt="squeezer-narrow">
  # </picture>
  #
  # The `AdwSqueezer` widget is a container which only shows the first of its
  # children that fits in the available size. It is convenient to offer different
  # widgets to represent the same data with different levels of detail, making
  # the widget seem to squeeze itself to fit in the available space.
  #
  # Transitions between children can be animated as fades. This can be controlled
  # with [property@Squeezer:transition-type].
  #
  # ## CSS nodes
  #
  # `AdwSqueezer` has a single CSS node with name `squeezer`.
  @[GObject::GeneratedWrapper]
  class Squeezer < Gtk::Widget
    include Gtk::Accessible
    include Gtk::Buildable
    include Gtk::ConstraintTarget
    include Gtk::Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::SqueezerClass), class_init,
        sizeof(LibAdw::Squeezer), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, allow_none : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, homogeneous : Bool? = nil, interpolate_size : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, pages : Gtk::SelectionModel? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, switch_threshold_policy : Adw::FoldThresholdPolicy? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, transition_duration : UInt32? = nil, transition_running : Bool? = nil, transition_type : Adw::SqueezerTransitionType? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, visible_child : Gtk::Widget? = nil, width_request : Int32? = nil, xalign : Float32? = nil, yalign : Float32? = nil)
      _names = uninitialized Pointer(LibC::Char)[47]
      _values = StaticArray(LibGObject::Value, 47).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !allow_none.nil?
        (_names.to_unsafe + _n).value = "allow-none".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allow_none)
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
      if !interpolate_size.nil?
        (_names.to_unsafe + _n).value = "interpolate-size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, interpolate_size)
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
      if !switch_threshold_policy.nil?
        (_names.to_unsafe + _n).value = "switch-threshold-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, switch_threshold_policy)
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
      if !transition_duration.nil?
        (_names.to_unsafe + _n).value = "transition-duration".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transition_duration)
        _n += 1
      end
      if !transition_running.nil?
        (_names.to_unsafe + _n).value = "transition-running".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transition_running)
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
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end
      if !xalign.nil?
        (_names.to_unsafe + _n).value = "xalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, xalign)
        _n += 1
      end
      if !yalign.nil?
        (_names.to_unsafe + _n).value = "yalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, yalign)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Squeezer.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_squeezer_get_type
    end

    def allow_none=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "allow-none", unsafe_value, Pointer(Void).null)
      value
    end

    def allow_none? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "allow-none", pointerof(value), Pointer(Void).null)
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

    def interpolate_size=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "interpolate-size", unsafe_value, Pointer(Void).null)
      value
    end

    def interpolate_size? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "interpolate-size", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def pages : Gtk::SelectionModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "pages", pointerof(value), Pointer(Void).null)
      Gtk::SelectionModel__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def switch_threshold_policy=(value : Adw::FoldThresholdPolicy) : Adw::FoldThresholdPolicy
      unsafe_value = value

      LibGObject.g_object_set(self, "switch-threshold-policy", unsafe_value, Pointer(Void).null)
      value
    end

    def switch_threshold_policy : Adw::FoldThresholdPolicy
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "switch-threshold-policy", pointerof(value), Pointer(Void).null)
      Adw::FoldThresholdPolicy.new(value)
    end

    def transition_duration=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "transition-duration", unsafe_value, Pointer(Void).null)
      value
    end

    def transition_duration : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "transition-duration", pointerof(value), Pointer(Void).null)
      value
    end

    def transition_running? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "transition-running", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def transition_type=(value : Adw::SqueezerTransitionType) : Adw::SqueezerTransitionType
      unsafe_value = value

      LibGObject.g_object_set(self, "transition-type", unsafe_value, Pointer(Void).null)
      value
    end

    def transition_type : Adw::SqueezerTransitionType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "transition-type", pointerof(value), Pointer(Void).null)
      Adw::SqueezerTransitionType.new(value)
    end

    def visible_child : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "visible-child", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def xalign=(value : Float32) : Float32
      unsafe_value = value

      LibGObject.g_object_set(self, "xalign", unsafe_value, Pointer(Void).null)
      value
    end

    def xalign : Float32
      # Returns: None

      value = uninitialized Float32
      LibGObject.g_object_get(self, "xalign", pointerof(value), Pointer(Void).null)
      value
    end

    def yalign=(value : Float32) : Float32
      unsafe_value = value

      LibGObject.g_object_set(self, "yalign", unsafe_value, Pointer(Void).null)
      value
    end

    def yalign : Float32
      # Returns: None

      value = uninitialized Float32
      LibGObject.g_object_get(self, "yalign", pointerof(value), Pointer(Void).null)
      value
    end

    # Creates a new `AdwSqueezer`.
    def initialize
      # adw_squeezer_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_squeezer_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Adds a child to @self.
    def add(child : Gtk::Widget) : Adw::SqueezerPage
      # adw_squeezer_add: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_squeezer_add(self, child)

      # Return value handling

      Adw::SqueezerPage.new(_retval, GICrystal::Transfer::None)
    end

    # Gets whether to allow squeezing beyond the last child's minimum size.
    def allow_none : Bool
      # adw_squeezer_get_allow_none: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_squeezer_get_allow_none(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether all children have the same size for the opposite orientation.
    def homogeneous : Bool
      # adw_squeezer_get_homogeneous: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_squeezer_get_homogeneous(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether @self interpolates its size when changing the visible child.
    def interpolate_size : Bool
      # adw_squeezer_get_interpolate_size: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_squeezer_get_interpolate_size(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the `#SqueezerPage` object for @child.
    def page(child : Gtk::Widget) : Adw::SqueezerPage
      # adw_squeezer_get_page: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_squeezer_get_page(self, child)

      # Return value handling

      Adw::SqueezerPage.new(_retval, GICrystal::Transfer::None)
    end

    # Returns a `Gio#ListModel` that contains the pages of @self.
    #
    # This can be used to keep an up-to-date view. The model also implements
    # `Gtk#SelectionModel` and can be used to track the visible page.
    def pages : Gtk::SelectionModel
      # adw_squeezer_get_pages: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibAdw.adw_squeezer_get_pages(self)

      # Return value handling

      Gtk::SelectionModel__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the fold threshold policy for @self.
    def switch_threshold_policy : Adw::FoldThresholdPolicy
      # adw_squeezer_get_switch_threshold_policy: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_squeezer_get_switch_threshold_policy(self)

      # Return value handling

      Adw::FoldThresholdPolicy.new(_retval)
    end

    # Gets the transition animation duration for @self.
    def transition_duration : UInt32
      # adw_squeezer_get_transition_duration: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_squeezer_get_transition_duration(self)

      # Return value handling

      _retval
    end

    # Gets whether a transition is currently running for @self.
    def transition_running : Bool
      # adw_squeezer_get_transition_running: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_squeezer_get_transition_running(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the type of animation used for transitions between children in @self.
    def transition_type : Adw::SqueezerTransitionType
      # adw_squeezer_get_transition_type: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_squeezer_get_transition_type(self)

      # Return value handling

      Adw::SqueezerTransitionType.new(_retval)
    end

    # Gets the currently visible child of @self.
    def visible_child : Gtk::Widget?
      # adw_squeezer_get_visible_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_squeezer_get_visible_child(self)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the horizontal alignment, from 0 (start) to 1 (end).
    def xalign : Float32
      # adw_squeezer_get_xalign: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_squeezer_get_xalign(self)

      # Return value handling

      _retval
    end

    # Gets the vertical alignment, from 0 (top) to 1 (bottom).
    def yalign : Float32
      # adw_squeezer_get_yalign: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_squeezer_get_yalign(self)

      # Return value handling

      _retval
    end

    # Removes a child widget from @self.
    def remove(child : Gtk::Widget) : Nil
      # adw_squeezer_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_squeezer_remove(self, child)

      # Return value handling
    end

    # Sets whether to allow squeezing beyond the last child's minimum size.
    def allow_none=(allow_none : Bool) : Nil
      # adw_squeezer_set_allow_none: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_squeezer_set_allow_none(self, allow_none)

      # Return value handling
    end

    # Sets whether all children have the same size for the opposite orientation.
    def homogeneous=(homogeneous : Bool) : Nil
      # adw_squeezer_set_homogeneous: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_squeezer_set_homogeneous(self, homogeneous)

      # Return value handling
    end

    # Sets whether @self interpolates its size when changing the visible child.
    def interpolate_size=(interpolate_size : Bool) : Nil
      # adw_squeezer_set_interpolate_size: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_squeezer_set_interpolate_size(self, interpolate_size)

      # Return value handling
    end

    # Sets the fold threshold policy for @self.
    def switch_threshold_policy=(policy : Adw::FoldThresholdPolicy) : Nil
      # adw_squeezer_set_switch_threshold_policy: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_squeezer_set_switch_threshold_policy(self, policy)

      # Return value handling
    end

    # Sets the transition animation duration for @self.
    def transition_duration=(duration : UInt32) : Nil
      # adw_squeezer_set_transition_duration: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_squeezer_set_transition_duration(self, duration)

      # Return value handling
    end

    # Sets the type of animation used for transitions between children in @self.
    def transition_type=(transition : Adw::SqueezerTransitionType) : Nil
      # adw_squeezer_set_transition_type: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_squeezer_set_transition_type(self, transition)

      # Return value handling
    end

    # Sets the horizontal alignment, from 0 (start) to 1 (end).
    def xalign=(xalign : Float32) : Nil
      # adw_squeezer_set_xalign: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_squeezer_set_xalign(self, xalign)

      # Return value handling
    end

    # Sets the vertical alignment, from 0 (top) to 1 (bottom).
    def yalign=(yalign : Float32) : Nil
      # adw_squeezer_set_yalign: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_squeezer_set_yalign(self, yalign)

      # Return value handling
    end
  end
end
