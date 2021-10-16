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
  # [property@Gtk.MenuButton:label] property). If neither is explicitly set,
  # a [class@Gtk.Image] is automatically created, using an arrow image oriented
  # according to [property@Gtk.MenuButton:direction] or the generic
  # “open-menu-symbolic” icon if the direction is not set.
  #
  # The positioning of the popup is determined by the
  # [property@Gtk.MenuButton:direction] property of the menu button.
  #
  # For menus, the [property@Gtk.Widget:halign] and [property@Gtk.Widget:valign]
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
  # If the button contains only an icon or an arrow, it will have the
  # `.image-button` style class, if it contains both, it will have the
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
  class MenuButton < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, always_show_arrow : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, direction : Gtk::ArrowType? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_frame : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, icon_name : ::String? = nil, label : ::String? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, menu_model : Gio::MenuModel? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, popover : Gtk::Popover? = nil, primary : Bool? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, use_underline : Bool? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[44]
      _values = StaticArray(LibGObject::Value, 44).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if always_show_arrow
        (_names.to_unsafe + _n).value = "always-show-arrow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, always_show_arrow)
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
      if direction
        (_names.to_unsafe + _n).value = "direction".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, direction)
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
      if has_frame
        (_names.to_unsafe + _n).value = "has-frame".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_frame)
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
      if icon_name
        (_names.to_unsafe + _n).value = "icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_name)
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
      if menu_model
        (_names.to_unsafe + _n).value = "menu-model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, menu_model)
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
      if popover
        (_names.to_unsafe + _n).value = "popover".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, popover)
        _n += 1
      end
      if primary
        (_names.to_unsafe + _n).value = "primary".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, primary)
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

      @pointer = LibGObject.g_object_new_with_properties(MenuButton.g_type, _n, _names, _values)
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

    def direction=(value : Gtk::ArrowType) : Gtk::ArrowType
      unsafe_value = value

      LibGObject.g_object_set(self, "direction", unsafe_value, Pointer(Void).null)
      value
    end

    def direction : Gtk::ArrowType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "direction", pointerof(value), Pointer(Void).null)
      Gtk::ArrowType.from_value(value)
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

    def initialize
      # gtk_menu_button_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_menu_button_new
      @pointer = _retval
    end

    def always_show_arrow : Bool
      # gtk_menu_button_get_always_show_arrow: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_menu_button_get_always_show_arrow(self)
      GICrystal.to_bool(_retval)
    end

    def direction : Gtk::ArrowType
      # gtk_menu_button_get_direction: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_menu_button_get_direction(self)
      Gtk::ArrowType.from_value(_retval)
    end

    def has_frame : Bool
      # gtk_menu_button_get_has_frame: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_menu_button_get_has_frame(self)
      GICrystal.to_bool(_retval)
    end

    def icon_name : ::String
      # gtk_menu_button_get_icon_name: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_menu_button_get_icon_name(self)
      ::String.new(_retval)
    end

    def label : ::String
      # gtk_menu_button_get_label: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_menu_button_get_label(self)
      ::String.new(_retval)
    end

    def menu_model : Gio::MenuModel?
      # gtk_menu_button_get_menu_model: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_menu_button_get_menu_model(self)
      Gio::MenuModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def popover : Gtk::Popover?
      # gtk_menu_button_get_popover: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_menu_button_get_popover(self)
      Gtk::Popover.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def primary : Bool
      # gtk_menu_button_get_primary: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_menu_button_get_primary(self)
      GICrystal.to_bool(_retval)
    end

    def use_underline : Bool
      # gtk_menu_button_get_use_underline: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_menu_button_get_use_underline(self)
      GICrystal.to_bool(_retval)
    end

    def popdown : Nil
      # gtk_menu_button_popdown: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_menu_button_popdown(self)
    end

    def popup : Nil
      # gtk_menu_button_popup: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_menu_button_popup(self)
    end

    def always_show_arrow=(always_show_arrow : Bool) : Nil
      # gtk_menu_button_set_always_show_arrow: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_menu_button_set_always_show_arrow(self, always_show_arrow)
    end

    def set_create_popup_func(func : Pointer(Void)?, user_data : Pointer(Nil)?, destroy_notify : Pointer(Void)?) : Nil
      # gtk_menu_button_set_create_popup_func: (Method)
      # @func: (nullable)
      # @user_data: (nullable)
      # @destroy_notify: (nullable)
      # Returns: (transfer none)

      func = if func.nil?
               LibGtk::MenuButtonCreatePopupFunc.null
             else
               func.to_unsafe
             end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      destroy_notify = if destroy_notify.nil?
                         LibGLib::DestroyNotify.null
                       else
                         destroy_notify.to_unsafe
                       end

      LibGtk.gtk_menu_button_set_create_popup_func(self, func, user_data, destroy_notify)
    end

    def direction=(direction : Gtk::ArrowType) : Nil
      # gtk_menu_button_set_direction: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_menu_button_set_direction(self, direction)
    end

    def has_frame=(has_frame : Bool) : Nil
      # gtk_menu_button_set_has_frame: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_menu_button_set_has_frame(self, has_frame)
    end

    def icon_name=(icon_name : ::String) : Nil
      # gtk_menu_button_set_icon_name: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_menu_button_set_icon_name(self, icon_name)
    end

    def label=(label : ::String) : Nil
      # gtk_menu_button_set_label: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_menu_button_set_label(self, label)
    end

    def menu_model=(menu_model : Gio::MenuModel?) : Nil
      # gtk_menu_button_set_menu_model: (Method)
      # @menu_model: (nullable)
      # Returns: (transfer none)

      menu_model = if menu_model.nil?
                     Pointer(Void).null
                   else
                     menu_model.to_unsafe
                   end

      LibGtk.gtk_menu_button_set_menu_model(self, menu_model)
    end

    def popover=(popover : Gtk::Widget?) : Nil
      # gtk_menu_button_set_popover: (Method)
      # @popover: (nullable)
      # Returns: (transfer none)

      popover = if popover.nil?
                  Pointer(Void).null
                else
                  popover.to_unsafe
                end

      LibGtk.gtk_menu_button_set_popover(self, popover)
    end

    def primary=(primary : Bool) : Nil
      # gtk_menu_button_set_primary: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_menu_button_set_primary(self, primary)
    end

    def use_underline=(use_underline : Bool) : Nil
      # gtk_menu_button_set_use_underline: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_menu_button_set_use_underline(self, use_underline)
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

      def connect(block : Proc(Gtk::MenuButton, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::MenuButton.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::MenuButton, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::MenuButton, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::MenuButton.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::MenuButton, Nil)).unbox(box).call(sender)
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
  end
end
