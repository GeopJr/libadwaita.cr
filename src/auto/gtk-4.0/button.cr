require "./widget"
require "./accessible"

require "./actionable"

require "./buildable"

require "./constraint_target"

module Gtk
  # The `GtkButton` widget is generally used to trigger a callback function that is
  # called when the button is pressed.
  #
  # ![An example GtkButton](button.png)
  #
  # The `GtkButton` widget can hold any valid child widget. That is, it can hold
  # almost any other standard `GtkWidget`. The most commonly used child is the
  # `GtkLabel`.
  #
  # # CSS nodes
  #
  # `GtkButton` has a single CSS node with name button. The node will get the
  # style classes .image-button or .text-button, if the content is just an
  # image or label, respectively. It may also receive the .flat style class.
  # When activating a button via the keyboard, the button will temporarily
  # gain the .keyboard-activating style class.
  #
  # Other style classes that are commonly used with `GtkButton` include
  # .suggested-action and .destructive-action. In special cases, buttons
  # can be made round by adding the .circular style class.
  #
  # Button-like widgets like `Gtk#ToggleButton`, `Gtk#MenuButton`,
  # `Gtk#VolumeButton`, `Gtk#LockButton`, `Gtk#ColorButton`
  # or `Gtk#FontButton` use style classes such as .toggle, .popup, .scale,
  # .lock, .color on the button node to differentiate themselves from a plain
  # `GtkButton`.
  #
  # # Accessibility
  #
  # `GtkButton` uses the %GTK_ACCESSIBLE_ROLE_BUTTON role.
  @[GObject::GeneratedWrapper]
  class Button < Widget
    include Accessible
    include Actionable
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::ButtonClass), class_init,
        sizeof(LibGtk::Button), instance_init, 0)
    end

    GICrystal.define_new_method(Button, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Button`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, action_name : ::String? = nil, action_target : GLib::Variant? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_frame : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, icon_name : ::String? = nil, label : ::String? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, use_underline : Bool? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[42]
      _values = StaticArray(LibGObject::Value, 42).new(LibGObject::Value.new)
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
      if !has_frame.nil?
        (_names.to_unsafe + _n).value = "has-frame".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_frame)
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

      @pointer = LibGObject.g_object_new_with_properties(Button.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_button_get_type
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

    def has_frame=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "has-frame", unsafe_value, Pointer(Void).null)
      value
    end

    def has_frame? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "has-frame", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
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

    # Creates a new button containing an icon from the current icon theme.
    #
    # If the icon name isn’t known, a “broken image” icon will be
    # displayed instead. If the current icon theme is changed, the icon
    # will be updated appropriately.
    def self.new_from_icon_name(icon_name : ::String?) : self
      # gtk_button_new_from_icon_name: (Constructor)
      # @icon_name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      icon_name = if icon_name.nil?
                    Pointer(LibC::Char).null
                  else
                    icon_name.to_unsafe
                  end

      # C call
      _retval = LibGtk.gtk_button_new_from_icon_name(icon_name)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::Button.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a `GtkButton` widget with a `GtkLabel` child.
    def self.new_with_label(label : ::String) : self
      # gtk_button_new_with_label: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_button_new_with_label(label)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::Button.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new `GtkButton` containing a label.
    #
    # If characters in @label are preceded by an underscore, they are underlined.
    # If you need a literal underscore character in a label, use “__” (two
    # underscores). The first underlined character represents a keyboard
    # accelerator called a mnemonic. Pressing Alt and that key activates the button.
    def self.new_with_mnemonic(label : ::String) : self
      # gtk_button_new_with_mnemonic: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_button_new_with_mnemonic(label)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::Button.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the child widget of @button.
    def child : Gtk::Widget?
      # gtk_button_get_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_button_get_child(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether the button has a frame.
    def has_frame : Bool
      # gtk_button_get_has_frame: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_button_get_has_frame(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the icon name of the button.
    #
    # If the icon name has not been set with `Gtk::Button#icon_name=`
    # the return value will be %NULL. This will be the case if you create
    # an empty button with `Gtk::Button.new` to use as a container.
    def icon_name : ::String?
      # gtk_button_get_icon_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_button_get_icon_name(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Fetches the text from the label of the button.
    #
    # If the label text has not been set with `Gtk::Button#label=`
    # the return value will be %NULL. This will be the case if you create
    # an empty button with `Gtk::Button.new` to use as a container.
    def label : ::String?
      # gtk_button_get_label: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_button_get_label(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # gets whether underlines are interpreted as mnemonics.
    #
    # See `Gtk::Button#use_underline=`.
    def use_underline : Bool
      # gtk_button_get_use_underline: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_button_get_use_underline(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the child widget of @button.
    #
    # Note that by using this API, you take full responsibility for setting
    # up the proper accessibility label and description information for @button.
    # Most likely, you'll either set the accessibility label or description
    # for @button explicitly, or you'll set a labelled-by or described-by
    # relations from @child to @button.
    def child=(child : Gtk::Widget?) : Nil
      # gtk_button_set_child: (Method | Setter)
      # @child: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      # C call
      LibGtk.gtk_button_set_child(@pointer, child)

      # Return value handling
    end

    # Sets the style of the button.
    #
    # Buttons can has a flat appearance or have a frame drawn around them.
    def has_frame=(has_frame : Bool) : Nil
      # gtk_button_set_has_frame: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_button_set_has_frame(@pointer, has_frame)

      # Return value handling
    end

    # Adds a `GtkImage` with the given icon name as a child.
    #
    # If @button already contains a child widget, that child widget will
    # be removed and replaced with the image.
    def icon_name=(icon_name : ::String) : Nil
      # gtk_button_set_icon_name: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_button_set_icon_name(@pointer, icon_name)

      # Return value handling
    end

    # Sets the text of the label of the button to @label.
    #
    # This will also clear any previously set labels.
    def label=(label : ::String) : Nil
      # gtk_button_set_label: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_button_set_label(@pointer, label)

      # Return value handling
    end

    # Sets whether to use underlines as mnemonics.
    #
    # If true, an underline in the text of the button label indicates
    # the next character should be used for the mnemonic accelerator key.
    def use_underline=(use_underline : Bool) : Nil
      # gtk_button_set_use_underline: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_button_set_use_underline(@pointer, use_underline)

      # Return value handling
    end

    # Emitted to animate press then release.
    #
    # This is an action signal. Applications should never connect
    # to this signal, but use the `Gtk::Button::#clicked` signal.
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

      def connect(handler : Proc(Gtk::Button, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Button.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Button, Nil)).unbox(_lib_box).call(_sender)
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

      def connect(handler : Proc(Gtk::Button, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Button.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Button, Nil)).unbox(_lib_box).call(_sender)
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
