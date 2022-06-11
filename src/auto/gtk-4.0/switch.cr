require "./widget"
require "./accessible"

require "./actionable"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkSwitch` is a "light switch" that has two states: on or off.
  #
  # ![An example GtkSwitch](switch.png)
  #
  # The user can control which state should be active by clicking the
  # empty area, or by dragging the handle.
  #
  # `GtkSwitch` can also handle situations where the underlying state
  # changes with a delay. See [signal@GtkSwitch::state-set] for details.
  #
  # # CSS nodes
  #
  # ```
  # switch
  # ├── label
  # ├── label
  # ╰── slider
  # ```
  #
  # `GtkSwitch` has four css nodes, the main node with the name switch and
  # subnodes for the slider and the on and off labels. Neither of them is
  # using any style classes.
  #
  # # Accessibility
  #
  # `GtkSwitch` uses the %GTK_ACCESSIBLE_ROLE_SWITCH role.
  @[GObject::GeneratedWrapper]
  class Switch < Widget
    include Accessible
    include Actionable
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(Switch, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Switch`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, action_name : ::String? = nil, action_target : GLib::Variant? = nil, active : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, state : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[39]
      _values = StaticArray(LibGObject::Value, 39).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !action_name.nil?
        (_names.to_unsafe + _n).value = "action-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action_name)
        _n += 1
      end
      if !action_target.nil?
        (_names.to_unsafe + _n).value = "action-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action_target)
        _n += 1
      end
      if !active.nil?
        (_names.to_unsafe + _n).value = "active".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, active)
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
      if !state.nil?
        (_names.to_unsafe + _n).value = "state".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, state)
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

      @pointer = LibGObject.g_object_new_with_properties(Switch.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_switch_get_type
    end

    def active=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "active", unsafe_value, Pointer(Void).null)
      value
    end

    def active? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "active", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def state=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "state", unsafe_value, Pointer(Void).null)
      value
    end

    def state? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "state", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Gets whether the `GtkSwitch` is in its “on” or “off” state.
    def active : Bool
      # gtk_switch_get_active: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_switch_get_active(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the underlying state of the `GtkSwitch`.
    def state : Bool
      # gtk_switch_get_state: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_switch_get_state(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Changes the state of @self to the desired one.
    def active=(is_active : Bool) : Nil
      # gtk_switch_set_active: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_switch_set_active(@pointer, is_active)

      # Return value handling
    end

    # Sets the underlying state of the `GtkSwitch`.
    #
    # Normally, this is the same as `Gtk::Switch#active`, unless
    # the switch is set up for delayed state changes. This function is
    # typically called from a [signal@Gtk.Switch::state-set] signal handler.
    #
    # See [signal@Gtk.Switch::state-set] for details.
    def state=(state : Bool) : Nil
      # gtk_switch_set_state: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_switch_set_state(@pointer, state)

      # Return value handling
    end

    # Emitted to animate the switch.
    #
    # Applications should never connect to this signal,
    # but use the `Gtk::Switch#active` property.
    struct ActivateSignal < GObject::Signal
      def name : String
        @detail ? "activate::#{@detail}" : "activate"
      end

      def connect(*, after : Bool = false, &block : Proc(Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Switch, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Switch.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Switch, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate")
      end
    end

    def activate_signal
      ActivateSignal.new(self)
    end

    # Emitted to change the underlying state.
    #
    # The ::state-set signal is emitted when the user changes the switch
    # position. The default handler keeps the state in sync with the
    # `Gtk::Switch#active` property.
    #
    # To implement delayed state change, applications can connect to this
    # signal, initiate the change of the underlying state, and call
    # `Gtk::Switch#state=` when the underlying state change is
    # complete. The signal handler should return %TRUE to prevent the
    # default handler from running.
    #
    # Visually, the underlying state is represented by the trough color of
    # the switch, while the `Gtk::Switch#active` property is
    # represented by the position of the switch.
    struct StateSetSignal < GObject::Signal
      def name : String
        @detail ? "state-set::#{@detail}" : "state-set"
      end

      def connect(*, after : Bool = false, &block : Proc(Bool, Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Bool, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_state : LibC::Int, _lib_box : Pointer(Void)) {
          state = lib_state
          ::Box(Proc(Bool, Bool)).unbox(_lib_box).call(state)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Switch, Bool, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_state : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::Switch.new(_lib_sender, GICrystal::Transfer::None)
          state = lib_state
          ::Box(Proc(Gtk::Switch, Bool, Bool)).unbox(_lib_box).call(_sender, state)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(state : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "state-set", state)
      end
    end

    def state_set_signal
      StateSetSignal.new(self)
    end
  end
end
