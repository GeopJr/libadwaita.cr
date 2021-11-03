require "./widget"
require "./accessible"

require "./actionable"

require "./buildable"

require "./constraint_target"

module Gtk
  # A `GtkCheckButton` places a label next to an indicator.
  #
  # ![Example GtkCheckButtons](check-button.png)
  #
  # A `GtkCheckButton` is created by calling either [ctor@Gtk.CheckButton.new]
  # or [ctor@Gtk.CheckButton.new_with_label].
  #
  # The state of a `GtkCheckButton` can be set specifically using
  # [method@Gtk.CheckButton.set_active], and retrieved using
  # [method@Gtk.CheckButton.get_active].
  #
  # # Inconsistent state
  #
  # In addition to "on" and "off", check buttons can be an
  # "in between" state that is neither on nor off. This can be used
  # e.g. when the user has selected a range of elements (such as some
  # text or spreadsheet cells) that are affected by a check button,
  # and the current values in that range are inconsistent.
  #
  # To set a `GtkCheckButton` to inconsistent state, use
  # [method@Gtk.CheckButton.set_inconsistent].
  #
  # # Grouping
  #
  # Check buttons can be grouped together, to form mutually exclusive
  # groups - only one of the buttons can be toggled at a time, and toggling
  # another one will switch the currently toggled one off.
  #
  # Grouped check buttons use a different indicator, and are commonly referred
  # to as *radio buttons*.
  #
  # ![Example GtkCheckButtons](radio-button.png)
  #
  # To add a `GtkCheckButton` to a group, use [method@Gtk.CheckButton.set_group].
  #
  # # CSS nodes
  #
  # ```
  # checkbutton[.text-button]
  # ├── check
  # ╰── [label]
  # ```
  #
  # A `GtkCheckButton` has a main node with name checkbutton. If the
  # [property@Gtk.CheckButton:label] property is set, it contains a label
  # child. The indicator node is named check when no group is set, and
  # radio if the checkbutton is grouped together with other checkbuttons.
  #
  # # Accessibility
  #
  # `GtkCheckButton` uses the %GTK_ACCESSIBLE_ROLE_CHECKBOX role.
  class CheckButton < Widget
    include Accessible
    include Actionable
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, action_name : ::String? = nil, action_target : GLib::Variant? = nil, active : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, group : Gtk::CheckButton? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, inconsistent : Bool? = nil, label : ::String? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, use_underline : Bool? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[42]
      _values = StaticArray(LibGObject::Value, 42).new(LibGObject::Value.new)
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
      if active
        (_names.to_unsafe + _n).value = "active".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, active)
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
      if group
        (_names.to_unsafe + _n).value = "group".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, group)
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
      if inconsistent
        (_names.to_unsafe + _n).value = "inconsistent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, inconsistent)
        _n += 1
      end
      if label
        (_names.to_unsafe + _n).value = "label".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, label)
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

      @pointer = LibGObject.g_object_new_with_properties(CheckButton.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_check_button_get_type
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

    def group=(value : Gtk::CheckButton?) : Gtk::CheckButton?
      unsafe_value = value

      LibGObject.g_object_set(self, "group", unsafe_value, Pointer(Void).null)
      value
    end

    def inconsistent=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "inconsistent", unsafe_value, Pointer(Void).null)
      value
    end

    def inconsistent? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "inconsistent", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def label=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "label", unsafe_value, Pointer(Void).null)
      value
    end

    def label : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "label", pointerof(value), Pointer(Void).null)
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
      # gtk_check_button_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_check_button_new
      @pointer = _retval
    end

    def self.new_with_label(label : ::String?) : Gtk::Widget
      # gtk_check_button_new_with_label: (Constructor)
      # @label: (nullable)
      # Returns: (transfer none)

      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      _retval = LibGtk.gtk_check_button_new_with_label(label)
      Gtk::CheckButton.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_with_mnemonic(label : ::String?) : Gtk::Widget
      # gtk_check_button_new_with_mnemonic: (Constructor)
      # @label: (nullable)
      # Returns: (transfer none)

      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      _retval = LibGtk.gtk_check_button_new_with_mnemonic(label)
      Gtk::CheckButton.new(_retval, GICrystal::Transfer::Full)
    end

    def active : Bool
      # gtk_check_button_get_active: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_check_button_get_active(self)
      GICrystal.to_bool(_retval)
    end

    def inconsistent : Bool
      # gtk_check_button_get_inconsistent: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_check_button_get_inconsistent(self)
      GICrystal.to_bool(_retval)
    end

    def label : ::String?
      # gtk_check_button_get_label: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_check_button_get_label(self)
      ::String.new(_retval) unless _retval.null?
    end

    def use_underline : Bool
      # gtk_check_button_get_use_underline: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_check_button_get_use_underline(self)
      GICrystal.to_bool(_retval)
    end

    def active=(setting : Bool) : Nil
      # gtk_check_button_set_active: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_check_button_set_active(self, setting)
    end

    def group=(group : Gtk::CheckButton?) : Nil
      # gtk_check_button_set_group: (Method | Setter)
      # @group: (nullable)
      # Returns: (transfer none)

      group = if group.nil?
                Pointer(Void).null
              else
                group.to_unsafe
              end

      LibGtk.gtk_check_button_set_group(self, group)
    end

    def inconsistent=(inconsistent : Bool) : Nil
      # gtk_check_button_set_inconsistent: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_check_button_set_inconsistent(self, inconsistent)
    end

    def label=(label : ::String?) : Nil
      # gtk_check_button_set_label: (Method | Setter)
      # @label: (nullable)
      # Returns: (transfer none)

      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      LibGtk.gtk_check_button_set_label(self, label)
    end

    def use_underline=(setting : Bool) : Nil
      # gtk_check_button_set_use_underline: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_check_button_set_use_underline(self, setting)
    end

    struct ActivateSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "activate::#{@detail}" : "activate"
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

      def connect(block : Proc(Gtk::CheckButton, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::CheckButton.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::CheckButton, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::CheckButton, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::CheckButton.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::CheckButton, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate")
      end
    end

    def activate_signal
      ActivateSignal.new(self)
    end

    struct ToggledSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "toggled::#{@detail}" : "toggled"
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

      def connect(block : Proc(Gtk::CheckButton, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::CheckButton.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::CheckButton, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::CheckButton, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::CheckButton.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::CheckButton, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "toggled")
      end
    end

    def toggled_signal
      ToggledSignal.new(self)
    end
  end
end
