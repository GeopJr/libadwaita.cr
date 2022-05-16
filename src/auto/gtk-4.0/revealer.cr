require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # A `GtkRevealer` animates the transition of its child from invisible to visible.
  #
  # The style of transition can be controlled with
  # `Gtk::Revealer#transition_type=`.
  #
  # These animations respect the [property@Gtk.Settings:gtk-enable-animations]
  # setting.
  #
  # # CSS nodes
  #
  # `GtkRevealer` has a single CSS node with name revealer.
  # When styling `GtkRevealer` using CSS, remember that it only hides its contents,
  # not itself. That means applied margin, padding and borders will be visible even
  # when the [property@Gtk.Revealer:reveal-child] property is set to %FALSE.
  #
  # # Accessibility
  #
  # `GtkRevealer` uses the %GTK_ACCESSIBLE_ROLE_GROUP role.
  #
  # The child of `GtkRevealer`, if set, is always available in the accessibility
  # tree, regardless of the state of the revealer widget.
  @[GObject::GeneratedWrapper]
  class Revealer < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::Revealer), instance_init, 0)
    end

    GICrystal.define_new_method(Revealer, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Revealer`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, child_revealed : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, reveal_child : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, transition_duration : UInt32? = nil, transition_type : Gtk::RevealerTransitionType? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[40]
      _values = StaticArray(LibGObject::Value, 40).new(LibGObject::Value.new)
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
      if !child.nil?
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
        _n += 1
      end
      if !child_revealed.nil?
        (_names.to_unsafe + _n).value = "child-revealed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child_revealed)
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
      if !reveal_child.nil?
        (_names.to_unsafe + _n).value = "reveal-child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, reveal_child)
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
      if !transition_duration.nil?
        (_names.to_unsafe + _n).value = "transition-duration".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transition_duration)
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

      @pointer = LibGObject.g_object_new_with_properties(Revealer.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_revealer_get_type
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

    def child_revealed? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "child-revealed", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def reveal_child=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "reveal-child", unsafe_value, Pointer(Void).null)
      value
    end

    def reveal_child? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "reveal-child", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
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

    def transition_type=(value : Gtk::RevealerTransitionType) : Gtk::RevealerTransitionType
      unsafe_value = value

      LibGObject.g_object_set(self, "transition-type", unsafe_value, Pointer(Void).null)
      value
    end

    def transition_type : Gtk::RevealerTransitionType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "transition-type", pointerof(value), Pointer(Void).null)
      Gtk::RevealerTransitionType.new(value)
    end

    # Creates a new `GtkRevealer`.
    def initialize
      # gtk_revealer_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_revealer_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the child widget of @revealer.
    def child : Gtk::Widget?
      # gtk_revealer_get_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_revealer_get_child(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether the child is fully revealed.
    #
    # In other words, this returns whether the transition
    # to the revealed state is completed.
    def child_revealed : Bool
      # gtk_revealer_get_child_revealed: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_revealer_get_child_revealed(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the child is currently revealed.
    #
    # This function returns %TRUE as soon as the transition
    # is to the revealed state is started. To learn whether
    # the child is fully revealed (ie the transition is completed),
    # use `Gtk::Revealer#child_revealed`.
    def reveal_child : Bool
      # gtk_revealer_get_reveal_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_revealer_get_reveal_child(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the amount of time (in milliseconds) that
    # transitions will take.
    def transition_duration : UInt32
      # gtk_revealer_get_transition_duration: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_revealer_get_transition_duration(@pointer)

      # Return value handling

      _retval
    end

    # Gets the type of animation that will be used
    # for transitions in @revealer.
    def transition_type : Gtk::RevealerTransitionType
      # gtk_revealer_get_transition_type: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_revealer_get_transition_type(@pointer)

      # Return value handling

      Gtk::RevealerTransitionType.new(_retval)
    end

    # Sets the child widget of @revealer.
    def child=(child : Gtk::Widget?) : Nil
      # gtk_revealer_set_child: (Method | Setter)
      # @child: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      # C call
      LibGtk.gtk_revealer_set_child(@pointer, child)

      # Return value handling
    end

    # Tells the `GtkRevealer` to reveal or conceal its child.
    #
    # The transition will be animated with the current
    # transition type of @revealer.
    def reveal_child=(reveal_child : Bool) : Nil
      # gtk_revealer_set_reveal_child: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_revealer_set_reveal_child(@pointer, reveal_child)

      # Return value handling
    end

    # Sets the duration that transitions will take.
    def transition_duration=(duration : UInt32) : Nil
      # gtk_revealer_set_transition_duration: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_revealer_set_transition_duration(@pointer, duration)

      # Return value handling
    end

    # Sets the type of animation that will be used for
    # transitions in @revealer.
    #
    # Available types include various kinds of fades and slides.
    def transition_type=(transition : Gtk::RevealerTransitionType) : Nil
      # gtk_revealer_set_transition_type: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_revealer_set_transition_type(@pointer, transition)

      # Return value handling
    end
  end
end
