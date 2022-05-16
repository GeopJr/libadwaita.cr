require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # The `GtkMenuButton` widget is used to display a popup when clicked.
  #
  # ![An example GtkMenuButton](menu-button.png)
  #
  # This popup can be provided either as a `GtkPopover` or as an abstract
  # `GMenuModel`.
  #
  # The `GtkMenuButton` widget can show either an icon (set with the
  # [property@Gtk.MenuButton:icon-name] property) or a label (set with the
  # `Gtk::MenuButton#label` property). If neither is explicitly set,
  # a `Gtk#Image` is automatically created, using an arrow image oriented
  # according to `Gtk::MenuButton#direction` or the generic
  # “open-menu-symbolic” icon if the direction is not set.
  #
  # The positioning of the popup is determined by the
  # `Gtk::MenuButton#direction` property of the menu button.
  #
  # For menus, the `Gtk::Widget#halign` and `Gtk::Widget#valign`
  # properties of the menu are also taken into account. For example, when the
  # direction is %GTK_ARROW_DOWN and the horizontal alignment is %GTK_ALIGN_START,
  # the menu will be positioned below the button, with the starting edge
  # (depending on the text direction) of the menu aligned with the starting
  # edge of the button. If there is not enough space below the button, the
  # menu is popped up above the button instead. If the alignment would move
  # part of the menu offscreen, it is “pushed in”.
  #
  # |           | start                | center                | end                |
  # | -         | ---                  | ---                   | ---                |
  # | **down**  | ![](down-start.png)  | ![](down-center.png)  | ![](down-end.png)  |
  # | **up**    | ![](up-start.png)    | ![](up-center.png)    | ![](up-end.png)    |
  # | **left**  | ![](left-start.png)  | ![](left-center.png)  | ![](left-end.png)  |
  # | **right** | ![](right-start.png) | ![](right-center.png) | ![](right-end.png) |
  #
  # # CSS nodes
  #
  # ```
  # menubutton
  # ╰── button.toggle
  # ╰── < content >
  #   ╰── [arrow]
  # ```
  #
  # `GtkMenuButton` has a single CSS node with name `menubutton`
  # which contains a `button` node with a `.toggle` style class.
  #
  # If the button contains an icon, it will have the `.image-button` style class,
  # if it contains text, it will have `.text-button` style class. If an arrow is
  # visible in addition to an icon, text or a custom child, it will also have
  # `.arrow-button` style class.
  #
  # Inside the toggle button content, there is an `arrow` node for
  # the indicator, which will carry one of the `.none`, `.up`, `.down`,
  # `.left` or `.right` style classes to indicate the direction that
  # the menu will appear in. The CSS is expected to provide a suitable
  # image for each of these cases using the `-gtk-icon-source` property.
  #
  # Optionally, the `menubutton` node can carry the `.circular` style class
  # to request a round appearance.
  #
  # # Accessibility
  #
  # `GtkMenuButton` uses the %GTK_ACCESSIBLE_ROLE_BUTTON role.
  @[GObject::GeneratedWrapper]
  class MenuButton < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::MenuButton), instance_init, 0)
    end

    GICrystal.define_new_method(MenuButton, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `MenuButton`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, always_show_arrow : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, direction : Gtk::ArrowType? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_frame : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, icon_name : ::String? = nil, label : ::String? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, menu_model : Gio::MenuModel? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, popover : Gtk::Popover? = nil, primary : Bool? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, use_underline : Bool? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[45]
      _values = StaticArray(LibGObject::Value, 45).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !always_show_arrow.nil?
        (_names.to_unsafe + _n).value = "always-show-arrow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, always_show_arrow)
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
      if !primary.nil?
        (_names.to_unsafe + _n).value = "primary".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, primary)
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

      @pointer = LibGObject.g_object_new_with_properties(MenuButton.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_menu_button_get_type
    end

    def always_show_arrow=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "always-show-arrow", unsafe_value, Pointer(Void).null)
      value
    end

    def always_show_arrow? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "always-show-arrow", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
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

    def primary=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "primary", unsafe_value, Pointer(Void).null)
      value
    end

    def primary? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "primary", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
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

    # Creates a new `GtkMenuButton` widget with downwards-pointing
    # arrow as the only child.
    #
    # You can replace the child widget with another `GtkWidget`
    # should you wish to.
    def initialize
      # gtk_menu_button_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_menu_button_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets whether to show a dropdown arrow even when using an icon.
    def always_show_arrow : Bool
      # gtk_menu_button_get_always_show_arrow: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_menu_button_get_always_show_arrow(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the child widget of @menu_button.
    def child : Gtk::Widget?
      # gtk_menu_button_get_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_menu_button_get_child(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the direction the popup will be pointing at when popped up.
    def direction : Gtk::ArrowType
      # gtk_menu_button_get_direction: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_menu_button_get_direction(@pointer)

      # Return value handling

      Gtk::ArrowType.new(_retval)
    end

    # Returns whether the button has a frame.
    def has_frame : Bool
      # gtk_menu_button_get_has_frame: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_menu_button_get_has_frame(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the name of the icon shown in the button.
    def icon_name : ::String?
      # gtk_menu_button_get_icon_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_menu_button_get_icon_name(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the label shown in the button
    def label : ::String?
      # gtk_menu_button_get_label: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_menu_button_get_label(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns the `GMenuModel` used to generate the popup.
    def menu_model : Gio::MenuModel?
      # gtk_menu_button_get_menu_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_menu_button_get_menu_model(@pointer)

      # Return value handling

      Gio::MenuModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the `GtkPopover` that pops out of the button.
    #
    # If the button is not using a `GtkPopover`, this function
    # returns %NULL.
    def popover : Gtk::Popover?
      # gtk_menu_button_get_popover: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_menu_button_get_popover(@pointer)

      # Return value handling

      Gtk::Popover.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether the menu button acts as a primary menu.
    def primary : Bool
      # gtk_menu_button_get_primary: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_menu_button_get_primary(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether an embedded underline in the text indicates a
    # mnemonic.
    def use_underline : Bool
      # gtk_menu_button_get_use_underline: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_menu_button_get_use_underline(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Dismiss the menu.
    def popdown : Nil
      # gtk_menu_button_popdown: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_menu_button_popdown(@pointer)

      # Return value handling
    end

    # Pop up the menu.
    def popup : Nil
      # gtk_menu_button_popup: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_menu_button_popup(@pointer)

      # Return value handling
    end

    # Sets whether to show a dropdown arrow even when using an icon or a custom
    # child.
    def always_show_arrow=(always_show_arrow : Bool) : Nil
      # gtk_menu_button_set_always_show_arrow: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_menu_button_set_always_show_arrow(@pointer, always_show_arrow)

      # Return value handling
    end

    # Sets the child widget of @menu_button.
    #
    # Setting a child resets `Gtk::MenuButton#label` and
    # [property@Gtk.MenuButton:icon-name].
    #
    # If [property@Gtk.MenuButton:always-show-arrow] is set to `TRUE` and
    # `Gtk::MenuButton#direction` is not `GTK_ARROW_NONE`, a dropdown arrow
    # will be shown next to the child.
    def child=(child : Gtk::Widget?) : Nil
      # gtk_menu_button_set_child: (Method | Setter)
      # @child: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      # C call
      LibGtk.gtk_menu_button_set_child(@pointer, child)

      # Return value handling
    end

    # Sets @func to be called when a popup is about to be shown.
    #
    # @func should use one of
    #
    #  - `Gtk::MenuButton#popover=`
    #  - `Gtk::MenuButton#menu_model=`
    #
    # to set a popup for @menu_button.
    # If @func is non-%NULL, @menu_button will always be sensitive.
    #
    # Using this function will not reset the menu widget attached to
    # @menu_button. Instead, this can be done manually in @func.
    def create_popup_func=(func : Gtk::MenuButtonCreatePopupFunc?) : Nil
      # gtk_menu_button_set_create_popup_func: (Method)
      # @func: (nullable)
      # @user_data: (nullable)
      # @destroy_notify: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if func
        _box = ::Box.box(func)
        func = ->(lib_menu_button : Pointer(Void), lib_user_data : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          menu_button = Gtk::MenuButton.new(lib_menu_button, :none)
          ::Box(Proc(Gtk::MenuButton, Nil)).unbox(lib_user_data).call(menu_button)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        destroy_notify = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        func = user_data = destroy_notify = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_menu_button_set_create_popup_func(@pointer, func, user_data, destroy_notify)

      # Return value handling
    end

    # Sets the direction in which the popup will be popped up.
    #
    # If the button is automatically populated with an arrow icon,
    # its direction will be changed to match.
    #
    # If the does not fit in the available space in the given direction,
    # GTK will its best to keep it inside the screen and fully visible.
    #
    # If you pass %GTK_ARROW_NONE for a @direction, the popup will behave
    # as if you passed %GTK_ARROW_DOWN (although you won’t see any arrows).
    def direction=(direction : Gtk::ArrowType) : Nil
      # gtk_menu_button_set_direction: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_menu_button_set_direction(@pointer, direction)

      # Return value handling
    end

    # Sets the style of the button.
    def has_frame=(has_frame : Bool) : Nil
      # gtk_menu_button_set_has_frame: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_menu_button_set_has_frame(@pointer, has_frame)

      # Return value handling
    end

    # Sets the name of an icon to show inside the menu button.
    #
    # Setting icon name resets `Gtk::MenuButton#label` and
    # `Gtk::MenuButton#child`.
    #
    # If [property@Gtk.MenuButton:always-show-arrow] is set to `TRUE` and
    # `Gtk::MenuButton#direction` is not `GTK_ARROW_NONE`, a dropdown arrow
    # will be shown next to the icon.
    def icon_name=(icon_name : ::String) : Nil
      # gtk_menu_button_set_icon_name: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_menu_button_set_icon_name(@pointer, icon_name)

      # Return value handling
    end

    # Sets the label to show inside the menu button.
    #
    # Setting a label resets [property@Gtk.MenuButton:icon-name] and
    # `Gtk::MenuButton#child`.
    #
    # If `Gtk::MenuButton#direction` is not `GTK_ARROW_NONE`, a dropdown
    # arrow will be shown next to the label.
    def label=(label : ::String) : Nil
      # gtk_menu_button_set_label: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_menu_button_set_label(@pointer, label)

      # Return value handling
    end

    # Sets the `GMenuModel` from which the popup will be constructed.
    #
    # If @menu_model is %NULL, the button is disabled.
    #
    # A `Gtk#Popover` will be created from the menu model with
    # `Gtk::PopoverMenu#new_from_model`. Actions will be connected
    # as documented for this function.
    #
    # If `Gtk::MenuButton#popover` is already set, it will be
    # dissociated from the @menu_button, and the property is set to %NULL.
    def menu_model=(menu_model : Gio::MenuModel?) : Nil
      # gtk_menu_button_set_menu_model: (Method | Setter)
      # @menu_model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      menu_model = if menu_model.nil?
                     Pointer(Void).null
                   else
                     menu_model.to_unsafe
                   end

      # C call
      LibGtk.gtk_menu_button_set_menu_model(@pointer, menu_model)

      # Return value handling
    end

    # Sets the `GtkPopover` that will be popped up when the @menu_button is clicked.
    #
    # If @popover is %NULL, the button is disabled.
    #
    # If [property@Gtk.MenuButton:menu-model] is set, the menu model is dissociated
    # from the @menu_button, and the property is set to %NULL.
    def popover=(popover : Gtk::Widget?) : Nil
      # gtk_menu_button_set_popover: (Method | Setter)
      # @popover: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      popover = if popover.nil?
                  Pointer(Void).null
                else
                  popover.to_unsafe
                end

      # C call
      LibGtk.gtk_menu_button_set_popover(@pointer, popover)

      # Return value handling
    end

    # Sets whether menu button acts as a primary menu.
    #
    # Primary menus can be opened with the <kbd>F10</kbd> key.
    def primary=(primary : Bool) : Nil
      # gtk_menu_button_set_primary: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_menu_button_set_primary(@pointer, primary)

      # Return value handling
    end

    # If true, an underline in the text indicates a mnemonic.
    def use_underline=(use_underline : Bool) : Nil
      # gtk_menu_button_set_use_underline: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_menu_button_set_use_underline(@pointer, use_underline)

      # Return value handling
    end

    # Emitted to when the menu button is activated.
    #
    # The `::activate` signal on `GtkMenuButton` is an action signal and
    # emitting it causes the button to pop up its menu.
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

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::MenuButton, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::MenuButton.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::MenuButton, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::MenuButton, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::MenuButton.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::MenuButton, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate")
      end
    end

    def activate_signal
      ActivateSignal.new(self)
    end
  end
end
