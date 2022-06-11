require "../gtk-4.0/widget"
require "../gtk-4.0/accessible"

require "../gtk-4.0/actionable"

require "../gtk-4.0/buildable"

require "../gtk-4.0/constraint_target"

module Adw
  # A combined button and dropdown widget.
  #
  # <picture>
  #   <source srcset="split-button-dark.png" media="(prefers-color-scheme: dark)">
  #   <img src="split-button.png" alt="split-button">
  # </picture>
  #
  # `AdwSplitButton` is typically used to present a set of actions in a menu,
  # but allow access to one of them with a single click.
  #
  # The API is very similar to `Gtk#Button` and `Gtk#MenuButton`, see
  # their documentation for details.
  #
  # ## CSS nodes
  #
  # ```
  # splitbutton[.image-button][.text-button]
  # ├── button
  # │   ╰── <content>
  # ├── separator
  # ╰── menubutton
  #     ╰── button.toggle
  #         ╰── arrow
  # ```
  #
  # `AdwSplitButton`'s CSS node is called `splitbutton`. It contains the css
  # nodes: `button`, `separator`, `menubutton`. See `Gtk#MenuButton`
  # documentation for the `menubutton` contents.
  #
  # The main CSS node will contain the `.image-button` or `.text-button` style
  # classes matching the button contents. The nested button nodes will never
  # contain them.
  #
  # ## Accessibility
  #
  # `AdwSplitButton` uses the `GTK_ACCESSIBLE_ROLE_GROUP` role.
  @[GObject::GeneratedWrapper]
  class SplitButton < Gtk::Widget
    include Gtk::Accessible
    include Gtk::Actionable
    include Gtk::Buildable
    include Gtk::ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::SplitButtonClass), class_init,
        sizeof(LibAdw::SplitButton), instance_init, 0)
    end

    GICrystal.define_new_method(SplitButton, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `SplitButton`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, action_name : ::String? = nil, action_target : GLib::Variant? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, direction : Gtk::ArrowType? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, icon_name : ::String? = nil, label : ::String? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, menu_model : Gio::MenuModel? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, popover : Gtk::Popover? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, use_underline : Bool? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[44]
      _values = StaticArray(LibGObject::Value, 44).new(LibGObject::Value.new)
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
      if !direction.nil?
        (_names.to_unsafe + _n).value = "direction".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, direction)
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
      if !icon_name.nil?
        (_names.to_unsafe + _n).value = "icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_name)
        _n += 1
      end
      if !label.nil?
        (_names.to_unsafe + _n).value = "label".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, label)
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
      if !menu_model.nil?
        (_names.to_unsafe + _n).value = "menu-model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, menu_model)
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
      if !popover.nil?
        (_names.to_unsafe + _n).value = "popover".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, popover)
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
      if !use_underline.nil?
        (_names.to_unsafe + _n).value = "use-underline".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_underline)
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

      @pointer = LibGObject.g_object_new_with_properties(SplitButton.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_split_button_get_type
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

    def direction=(value : Gtk::ArrowType) : Gtk::ArrowType
      unsafe_value = value

      LibGObject.g_object_set(self, "direction", unsafe_value, Pointer(Void).null)
      value
    end

    def direction : Gtk::ArrowType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "direction", pointerof(value), Pointer(Void).null)
      Gtk::ArrowType.new(value)
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

    def menu_model=(value : Gio::MenuModel?) : Gio::MenuModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "menu-model", unsafe_value, Pointer(Void).null)
      value
    end

    def menu_model : Gio::MenuModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "menu-model", pointerof(value), Pointer(Void).null)
      Gio::MenuModel.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def popover=(value : Gtk::Popover?) : Gtk::Popover?
      unsafe_value = value

      LibGObject.g_object_set(self, "popover", unsafe_value, Pointer(Void).null)
      value
    end

    def popover : Gtk::Popover?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "popover", pointerof(value), Pointer(Void).null)
      Gtk::Popover.new(value, GICrystal::Transfer::None) unless value.null?
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

    # Gets the child widget.
    def child : Gtk::Widget?
      # adw_split_button_get_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_split_button_get_child(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the direction in which the popup will be popped up.
    def direction : Gtk::ArrowType
      # adw_split_button_get_direction: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_split_button_get_direction(@pointer)

      # Return value handling

      Gtk::ArrowType.new(_retval)
    end

    # Gets the name of the icon used to automatically populate the button.
    #
    # If the icon name has not been set with `SplitButton#icon_name=`
    # the return value will be `NULL`.
    def icon_name : ::String?
      # adw_split_button_get_icon_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_split_button_get_icon_name(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the label for @self.
    def label : ::String?
      # adw_split_button_get_label: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_split_button_get_label(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the menu model from which the popup will be created.
    def menu_model : Gio::MenuModel?
      # adw_split_button_get_menu_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_split_button_get_menu_model(@pointer)

      # Return value handling

      Gio::MenuModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the popover that will be popped up when the dropdown is clicked.
    def popover : Gtk::Popover?
      # adw_split_button_get_popover: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_split_button_get_popover(@pointer)

      # Return value handling

      Gtk::Popover.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets whether an underline in the text indicates a mnemonic.
    def use_underline : Bool
      # adw_split_button_get_use_underline: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_split_button_get_use_underline(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Dismisses the menu.
    def popdown : Nil
      # adw_split_button_popdown: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_split_button_popdown(@pointer)

      # Return value handling
    end

    # Pops up the menu.
    def popup : Nil
      # adw_split_button_popup: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_split_button_popup(@pointer)

      # Return value handling
    end

    # Sets the child widget.
    def child=(child : Gtk::Widget?) : Nil
      # adw_split_button_set_child: (Method | Setter)
      # @child: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      # C call
      LibAdw.adw_split_button_set_child(@pointer, child)

      # Return value handling
    end

    # Sets the direction in which the popup will be popped up.
    def direction=(direction : Gtk::ArrowType) : Nil
      # adw_split_button_set_direction: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_split_button_set_direction(@pointer, direction)

      # Return value handling
    end

    # Sets the name of the icon used to automatically populate the button.
    def icon_name=(icon_name : ::String) : Nil
      # adw_split_button_set_icon_name: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_split_button_set_icon_name(@pointer, icon_name)

      # Return value handling
    end

    # Sets the label for @self.
    def label=(label : ::String) : Nil
      # adw_split_button_set_label: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_split_button_set_label(@pointer, label)

      # Return value handling
    end

    # Sets the menu model from which the popup will be created.
    def menu_model=(menu_model : Gio::MenuModel?) : Nil
      # adw_split_button_set_menu_model: (Method | Setter)
      # @menu_model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      menu_model = if menu_model.nil?
                     Pointer(Void).null
                   else
                     menu_model.to_unsafe
                   end

      # C call
      LibAdw.adw_split_button_set_menu_model(@pointer, menu_model)

      # Return value handling
    end

    # Sets the popover that will be popped up when the dropdown is clicked.
    def popover=(popover : Gtk::Popover?) : Nil
      # adw_split_button_set_popover: (Method | Setter)
      # @popover: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      popover = if popover.nil?
                  Pointer(Void).null
                else
                  popover.to_unsafe
                end

      # C call
      LibAdw.adw_split_button_set_popover(@pointer, popover)

      # Return value handling
    end

    # Sets whether an underline in the text indicates a mnemonic.
    def use_underline=(use_underline : Bool) : Nil
      # adw_split_button_set_use_underline: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_split_button_set_use_underline(@pointer, use_underline)

      # Return value handling
    end

    # Emitted to animate press then release.
    #
    # This is an action signal. Applications should never connect to this signal,
    # but use the `SplitButton::#clicked` signal.
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

      def connect(handler : Proc(Adw::SplitButton, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Adw::SplitButton.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Adw::SplitButton, Nil)).unbox(_lib_box).call(_sender)
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

    # Emitted when the button has been activated (pressed and released).
    struct ClickedSignal < GObject::Signal
      def name : String
        @detail ? "clicked::#{@detail}" : "clicked"
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

      def connect(handler : Proc(Adw::SplitButton, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Adw::SplitButton.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Adw::SplitButton, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "clicked")
      end
    end

    def clicked_signal
      ClickedSignal.new(self)
    end
  end
end
