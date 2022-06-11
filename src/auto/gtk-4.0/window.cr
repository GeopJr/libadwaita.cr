require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./native"

require "./root"

require "./shortcut_manager"

module Gtk
  # A `GtkWindow` is a toplevel window which can contain other widgets.
  #
  # ![An example GtkWindow](window.png)
  #
  # Windows normally have decorations that are under the control
  # of the windowing system and allow the user to manipulate the window
  # (resize it, move it, close it,...).
  #
  # # GtkWindow as GtkBuildable
  #
  # The `GtkWindow` implementation of the `Gtk#Buildable` interface supports
  # setting a child as the titlebar by specifying “titlebar” as the “type”
  # attribute of a <child> element.
  #
  # # CSS nodes
  #
  # ```
  # window.background [.csd / .solid-csd / .ssd] [.maximized / .fullscreen / .tiled]
  # ├── <child>
  # ╰── <titlebar child>.titlebar [.default-decoration]
  # ```
  #
  # `GtkWindow` has a main CSS node with name window and style class .background.
  #
  # Style classes that are typically used with the main CSS node are .csd (when
  # client-side decorations are in use), .solid-csd (for client-side decorations
  # without invisible borders), .ssd (used by mutter when rendering server-side
  # decorations). GtkWindow also represents window states with the following
  # style classes on the main node: .maximized, .fullscreen, .tiled (when supported,
  # also .tiled-top, .tiled-left, .tiled-right, .tiled-bottom).
  #
  # `GtkWindow` subclasses often add their own discriminating style classes,
  # such as .dialog, .popup or .tooltip.
  #
  # Generally, some CSS properties don't make sense on the toplevel window node,
  # such as margins or padding. When client-side decorations without invisible
  # borders are in use (i.e. the .solid-csd style class is added to the
  # main window node), the CSS border of the toplevel window is used for
  # resize drags. In the .csd case, the shadow area outside of the window
  # can be used to resize it.
  #
  # `GtkWindow` adds the .titlebar and .default-decoration style classes to the
  # widget that is added as a titlebar child.
  #
  # # Accessibility
  #
  # `GtkWindow` uses the %GTK_ACCESSIBLE_ROLE_WINDOW role.
  #
  # # Actions
  #
  # `GtkWindow` defines a set of built-in actions:
  # - `default.activate`: Activate the default widget.
  # - `window.minimize`: Minimize the window.
  # - `window.toggle-maximized`: Maximize or restore the window.
  # - `window.close`: Close the window.
  @[GObject::GeneratedWrapper]
  class Window < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Native
    include Root
    include ShortcutManager

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::WindowClass), class_init,
        sizeof(LibGtk::Window), instance_init, 0)
    end

    GICrystal.define_new_method(Window, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Window`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, application : Gtk::Application? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, decorated : Bool? = nil, default_height : Int32? = nil, default_widget : Gtk::Widget? = nil, default_width : Int32? = nil, deletable : Bool? = nil, destroy_with_parent : Bool? = nil, display : Gdk::Display? = nil, focus_on_click : Bool? = nil, focus_visible : Bool? = nil, focus_widget : Gtk::Widget? = nil, focusable : Bool? = nil, fullscreened : Bool? = nil, halign : Gtk::Align? = nil, handle_menubar_accel : Bool? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hide_on_close : Bool? = nil, icon_name : ::String? = nil, is_active : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, maximized : Bool? = nil, mnemonics_visible : Bool? = nil, modal : Bool? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, resizable : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, startup_id : ::String? = nil, title : ::String? = nil, titlebar : Gtk::Widget? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, transient_for : Gtk::Window? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[59]
      _values = StaticArray(LibGObject::Value, 59).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !application.nil?
        (_names.to_unsafe + _n).value = "application".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, application)
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
      if !decorated.nil?
        (_names.to_unsafe + _n).value = "decorated".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, decorated)
        _n += 1
      end
      if !default_height.nil?
        (_names.to_unsafe + _n).value = "default-height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_height)
        _n += 1
      end
      if !default_widget.nil?
        (_names.to_unsafe + _n).value = "default-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_widget)
        _n += 1
      end
      if !default_width.nil?
        (_names.to_unsafe + _n).value = "default-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_width)
        _n += 1
      end
      if !deletable.nil?
        (_names.to_unsafe + _n).value = "deletable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, deletable)
        _n += 1
      end
      if !destroy_with_parent.nil?
        (_names.to_unsafe + _n).value = "destroy-with-parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, destroy_with_parent)
        _n += 1
      end
      if !display.nil?
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if !focus_on_click.nil?
        (_names.to_unsafe + _n).value = "focus-on-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_on_click)
        _n += 1
      end
      if !focus_visible.nil?
        (_names.to_unsafe + _n).value = "focus-visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_visible)
        _n += 1
      end
      if !focus_widget.nil?
        (_names.to_unsafe + _n).value = "focus-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_widget)
        _n += 1
      end
      if !focusable.nil?
        (_names.to_unsafe + _n).value = "focusable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focusable)
        _n += 1
      end
      if !fullscreened.nil?
        (_names.to_unsafe + _n).value = "fullscreened".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fullscreened)
        _n += 1
      end
      if !halign.nil?
        (_names.to_unsafe + _n).value = "halign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, halign)
        _n += 1
      end
      if !handle_menubar_accel.nil?
        (_names.to_unsafe + _n).value = "handle-menubar-accel".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, handle_menubar_accel)
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
      if !hide_on_close.nil?
        (_names.to_unsafe + _n).value = "hide-on-close".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hide_on_close)
        _n += 1
      end
      if !icon_name.nil?
        (_names.to_unsafe + _n).value = "icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_name)
        _n += 1
      end
      if !is_active.nil?
        (_names.to_unsafe + _n).value = "is-active".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_active)
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
      if !maximized.nil?
        (_names.to_unsafe + _n).value = "maximized".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, maximized)
        _n += 1
      end
      if !mnemonics_visible.nil?
        (_names.to_unsafe + _n).value = "mnemonics-visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mnemonics_visible)
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
      if !resizable.nil?
        (_names.to_unsafe + _n).value = "resizable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, resizable)
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
      if !startup_id.nil?
        (_names.to_unsafe + _n).value = "startup-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, startup_id)
        _n += 1
      end
      if !title.nil?
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end
      if !titlebar.nil?
        (_names.to_unsafe + _n).value = "titlebar".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, titlebar)
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
      if !transient_for.nil?
        (_names.to_unsafe + _n).value = "transient-for".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transient_for)
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

      @pointer = LibGObject.g_object_new_with_properties(Window.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_window_get_type
    end

    def application=(value : Gtk::Application?) : Gtk::Application?
      unsafe_value = value

      LibGObject.g_object_set(self, "application", unsafe_value, Pointer(Void).null)
      value
    end

    def application : Gtk::Application?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "application", pointerof(value), Pointer(Void).null)
      Gtk::Application.new(value, GICrystal::Transfer::None) unless value.null?
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

    def decorated=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "decorated", unsafe_value, Pointer(Void).null)
      value
    end

    def decorated? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "decorated", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def default_height=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "default-height", unsafe_value, Pointer(Void).null)
      value
    end

    def default_height : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "default-height", pointerof(value), Pointer(Void).null)
      value
    end

    def default_widget=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "default-widget", unsafe_value, Pointer(Void).null)
      value
    end

    def default_widget : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "default-widget", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def default_width=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "default-width", unsafe_value, Pointer(Void).null)
      value
    end

    def default_width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "default-width", pointerof(value), Pointer(Void).null)
      value
    end

    def deletable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "deletable", unsafe_value, Pointer(Void).null)
      value
    end

    def deletable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "deletable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def destroy_with_parent=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "destroy-with-parent", unsafe_value, Pointer(Void).null)
      value
    end

    def destroy_with_parent? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "destroy-with-parent", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def display=(value : Gdk::Display?) : Gdk::Display?
      unsafe_value = value

      LibGObject.g_object_set(self, "display", unsafe_value, Pointer(Void).null)
      value
    end

    def display : Gdk::Display?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "display", pointerof(value), Pointer(Void).null)
      Gdk::Display.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def focus_visible=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "focus-visible", unsafe_value, Pointer(Void).null)
      value
    end

    def focus_visible? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "focus-visible", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def focus_widget=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "focus-widget", unsafe_value, Pointer(Void).null)
      value
    end

    def focus_widget : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "focus-widget", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def fullscreened=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "fullscreened", unsafe_value, Pointer(Void).null)
      value
    end

    def fullscreened? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "fullscreened", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def handle_menubar_accel=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "handle-menubar-accel", unsafe_value, Pointer(Void).null)
      value
    end

    def handle_menubar_accel? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "handle-menubar-accel", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def hide_on_close=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "hide-on-close", unsafe_value, Pointer(Void).null)
      value
    end

    def hide_on_close? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "hide-on-close", pointerof(value), Pointer(Void).null)
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

    def is_active? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-active", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def maximized=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "maximized", unsafe_value, Pointer(Void).null)
      value
    end

    def maximized? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "maximized", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def mnemonics_visible=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "mnemonics-visible", unsafe_value, Pointer(Void).null)
      value
    end

    def mnemonics_visible? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "mnemonics-visible", pointerof(value), Pointer(Void).null)
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

    def resizable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "resizable", unsafe_value, Pointer(Void).null)
      value
    end

    def resizable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "resizable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def startup_id=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "startup-id", unsafe_value, Pointer(Void).null)
      value
    end

    def title=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "title", unsafe_value, Pointer(Void).null)
      value
    end

    def title : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "title", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def titlebar=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "titlebar", unsafe_value, Pointer(Void).null)
      value
    end

    def titlebar : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "titlebar", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def transient_for=(value : Gtk::Window?) : Gtk::Window?
      unsafe_value = value

      LibGObject.g_object_set(self, "transient-for", unsafe_value, Pointer(Void).null)
      value
    end

    def transient_for : Gtk::Window?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "transient-for", pointerof(value), Pointer(Void).null)
      Gtk::Window.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Returns the fallback icon name for windows.
    #
    # The returned string is owned by GTK and should not
    # be modified. It is only valid until the next call to
    # `Gtk::Window#default_icon_name=`.
    def self.default_icon_name : ::String?
      # gtk_window_get_default_icon_name: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_get_default_icon_name

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns a list of all existing toplevel windows.
    #
    # If you want to iterate through the list and perform actions involving
    # callbacks that might destroy the widgets or add new ones, be aware that
    # the list of toplevels will change and emit the "items-changed" signal.
    def self.toplevels : Gio::ListModel
      # gtk_window_get_toplevels: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_get_toplevels

      # Return value handling

      Gio::AbstractListModel.new(_retval, GICrystal::Transfer::None)
    end

    # Returns a list of all existing toplevel windows.
    #
    # The widgets in the list are not individually referenced.
    # If you want to iterate through the list and perform actions
    # involving callbacks that might destroy the widgets, you must
    # call `g_list_foreach (result, (GFunc)g_object_ref, NULL)` first,
    # and then unref all the widgets afterwards.
    def self.list_toplevels : GLib::List
      # gtk_window_list_toplevels: (None)
      # Returns: (transfer container)

      # C call
      _retval = LibGtk.gtk_window_list_toplevels

      # Return value handling

      GLib::List(Gtk::Widget).new(_retval, GICrystal::Transfer::Container)
    end

    # Sets whether the window should request startup notification.
    #
    # By default, after showing the first `GtkWindow`, GTK calls
    # `Gdk::Display#notify_startup_complete`. Call this function
    # to disable the automatic startup notification. You might do this
    # if your first window is a splash screen, and you want to delay
    # notification until after your real main window has been shown,
    # for example.
    #
    # In that example, you would disable startup notification
    # temporarily, show your splash screen, then re-enable it so that
    # showing the main window would automatically result in notification.
    def self.auto_startup_notification=(setting : Bool) : Nil
      # gtk_window_set_auto_startup_notification: (None)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_set_auto_startup_notification(setting)

      # Return value handling
    end

    # Sets an icon to be used as fallback.
    #
    # The fallback icon is used for windows that
    # haven't had `Gtk::Window#icon_name=`
    # called on them.
    def self.default_icon_name=(name : ::String) : Nil
      # gtk_window_set_default_icon_name: (None)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_set_default_icon_name(name)

      # Return value handling
    end

    # Opens or closes the [interactive debugger](running.html#interactive-debugging).
    #
    # The debugger offers access to the widget hierarchy of the application
    # and to useful debugging tools.
    def self.interactive_debugging=(enable : Bool) : Nil
      # gtk_window_set_interactive_debugging: (None)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_set_interactive_debugging(enable)

      # Return value handling
    end

    # Requests that the window is closed.
    #
    # This is similar to what happens when a window manager
    # close button is clicked.
    #
    # This function can be used with close buttons in custom
    # titlebars.
    def close : Nil
      # gtk_window_close: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_close(@pointer)

      # Return value handling
    end

    # Drop the internal reference GTK holds on toplevel windows.
    def destroy : Nil
      # gtk_window_destroy: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_destroy(@pointer)

      # Return value handling
    end

    # Asks to place @window in the fullscreen state.
    #
    # Note that you shouldn’t assume the window is definitely fullscreen
    # afterward, because other entities (e.g. the user or window manager
    # unfullscreen it again, and not all window managers honor requests
    # to fullscreen windows.
    #
    # You can track the result of this operation via the
    # `Gdk::Toplevel#state` property, or by listening to
    # notifications of the `Gtk::Window#fullscreened` property.
    def fullscreen : Nil
      # gtk_window_fullscreen: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_fullscreen(@pointer)

      # Return value handling
    end

    # Asks to place @window in the fullscreen state on the given @monitor.
    #
    # Note that you shouldn't assume the window is definitely fullscreen
    # afterward, or that the windowing system allows fullscreen windows on
    # any given monitor.
    #
    # You can track the result of this operation via the
    # `Gdk::Toplevel#state` property, or by listening to
    # notifications of the `Gtk::Window#fullscreened` property.
    def fullscreen_on_monitor(monitor : Gdk::Monitor) : Nil
      # gtk_window_fullscreen_on_monitor: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_fullscreen_on_monitor(@pointer, monitor)

      # Return value handling
    end

    # Gets the `GtkApplication` associated with the window.
    def application : Gtk::Application?
      # gtk_window_get_application: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_get_application(@pointer)

      # Return value handling

      Gtk::Application.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the child widget of @window.
    def child : Gtk::Widget?
      # gtk_window_get_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_get_child(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether the window has been set to have decorations.
    def decorated : Bool
      # gtk_window_get_decorated: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_get_decorated(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the default size of the window.
    #
    # A value of 0 for the width or height indicates that a default
    # size has not been explicitly set for that dimension, so the
    # “natural” size of the window will be used.
    def default_size : Nil
      # gtk_window_get_default_size: (Method)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      width = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      height = Pointer(Int32).null
      # C call
      LibGtk.gtk_window_get_default_size(@pointer, width, height)

      # Return value handling
    end

    # Returns the default widget for @window.
    def default_widget : Gtk::Widget?
      # gtk_window_get_default_widget: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_get_default_widget(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether the window has been set to have a close button.
    def deletable : Bool
      # gtk_window_get_deletable: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_get_deletable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the window will be destroyed with its transient parent.
    def destroy_with_parent : Bool
      # gtk_window_get_destroy_with_parent: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_get_destroy_with_parent(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves the current focused widget within the window.
    #
    # Note that this is the widget that would have the focus
    # if the toplevel window focused; if the toplevel window
    # is not focused then `gtk_widget_has_focus (widget)` will
    # not be %TRUE for the widget.
    def focus : Gtk::Widget?
      # gtk_window_get_focus: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_get_focus(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets whether “focus rectangles” are supposed to be visible.
    def focus_visible : Bool
      # gtk_window_get_focus_visible: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_get_focus_visible(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the group for @window.
    #
    # If the window has no group, then the default group is returned.
    def group : Gtk::WindowGroup
      # gtk_window_get_group: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_get_group(@pointer)

      # Return value handling

      Gtk::WindowGroup.new(_retval, GICrystal::Transfer::None)
    end

    # Returns whether this window reacts to F10 key presses by
    # activating a menubar it contains.
    def handle_menubar_accel : Bool
      # gtk_window_get_handle_menubar_accel: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_get_handle_menubar_accel(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the window will be hidden when the close button is clicked.
    def hide_on_close : Bool
      # gtk_window_get_hide_on_close: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_get_hide_on_close(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the name of the themed icon for the window.
    def icon_name : ::String?
      # gtk_window_get_icon_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_get_icon_name(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets whether mnemonics are supposed to be visible.
    def mnemonics_visible : Bool
      # gtk_window_get_mnemonics_visible: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_get_mnemonics_visible(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the window is modal.
    def modal : Bool
      # gtk_window_get_modal: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_get_modal(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the value set by gtk_window_set_resizable().
    def resizable : Bool
      # gtk_window_get_resizable: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_get_resizable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves the title of the window.
    def title : ::String?
      # gtk_window_get_title: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_get_title(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns the custom titlebar that has been set with
    # gtk_window_set_titlebar().
    def titlebar : Gtk::Widget?
      # gtk_window_get_titlebar: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_get_titlebar(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Fetches the transient parent for this window.
    def transient_for : Gtk::Window?
      # gtk_window_get_transient_for: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_get_transient_for(@pointer)

      # Return value handling

      Gtk::Window.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether @window has an explicit window group.
    def has_group : Bool
      # gtk_window_has_group: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_has_group(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the window is part of the current active toplevel.
    #
    # The active toplevel is the window receiving keystrokes.
    #
    # The return value is %TRUE if the window is active toplevel itself.
    # You might use this function if you wanted to draw a widget
    # differently in an active window from a widget in an inactive window.
    def is_active? : Bool
      # gtk_window_is_active: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_is_active(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves the current fullscreen state of @window.
    #
    # Note that since fullscreening is ultimately handled by the window
    # manager and happens asynchronously to an application request, you
    # shouldn’t assume the return value of this function changing
    # immediately (or at all), as an effect of calling
    # `Gtk::Window#fullscreen` or `Gtk::Window#unfullscreen`.
    #
    # If the window isn't yet mapped, the value returned will whether the
    # initial requested state is fullscreen.
    def is_fullscreen : Bool
      # gtk_window_is_fullscreen: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_is_fullscreen(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves the current maximized state of @window.
    #
    # Note that since maximization is ultimately handled by the window
    # manager and happens asynchronously to an application request, you
    # shouldn’t assume the return value of this function changing
    # immediately (or at all), as an effect of calling
    # `Gtk::Window#maximize` or `Gtk::Window#unmaximize`.
    #
    # If the window isn't yet mapped, the value returned will whether the
    # initial requested state is maximized.
    def is_maximized : Bool
      # gtk_window_is_maximized: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_window_is_maximized(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Asks to maximize @window, so that it fills the screen.
    #
    # Note that you shouldn’t assume the window is definitely maximized
    # afterward, because other entities (e.g. the user or window manager
    # could unmaximize it again, and not all window managers support
    # maximization.
    #
    # It’s permitted to call this function before showing a window,
    # in which case the window will be maximized when it appears onscreen
    # initially.
    #
    # You can track the result of this operation via the
    # `Gdk::Toplevel#state` property, or by listening to
    # notifications on the `Gtk::Window#maximized`
    # property.
    def maximize : Nil
      # gtk_window_maximize: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_maximize(@pointer)

      # Return value handling
    end

    # Asks to minimize the specified @window.
    #
    # Note that you shouldn’t assume the window is definitely minimized
    # afterward, because the windowing system might not support this
    # functionality; other entities (e.g. the user or the window manager
    # could unminimize it again, or there may not be a window manager in
    # which case minimization isn’t possible, etc.
    #
    # It’s permitted to call this function before showing a window,
    # in which case the window will be minimized before it ever appears
    # onscreen.
    #
    # You can track result of this operation via the
    # `Gdk::Toplevel#state` property.
    def minimize : Nil
      # gtk_window_minimize: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_minimize(@pointer)

      # Return value handling
    end

    # Presents a window to the user.
    #
    # This function should not be used as when it is called,
    # it is too late to gather a valid timestamp to allow focus
    # stealing prevention to work correctly.
    def present : Nil
      # gtk_window_present: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_present(@pointer)

      # Return value handling
    end

    # Presents a window to the user.
    #
    # This may mean raising the window in the stacking order,
    # unminimizing it, moving it to the current desktop, and/or
    # giving it the keyboard focus, possibly dependent on the user’s
    # platform, window manager, and preferences.
    #
    # If @window is hidden, this function calls `Gtk::Widget#show`
    # as well.
    #
    # This function should be used when the user tries to open a window
    # that’s already open. Say for example the preferences dialog is
    # currently open, and the user chooses Preferences from the menu
    # a second time; use `Gtk::Window#present` to move the
    # already-open dialog where the user can see it.
    #
    # Presents a window to the user in response to a user interaction.
    # The timestamp should be gathered when the window was requested
    # to be shown (when clicking a link for example), rather than once
    # the window is ready to be shown.
    def present_with_time(timestamp : UInt32) : Nil
      # gtk_window_present_with_time: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_present_with_time(@pointer, timestamp)

      # Return value handling
    end

    # Sets or unsets the `GtkApplication` associated with the window.
    #
    # The application will be kept alive for at least as long as it has
    # any windows associated with it (see g_application_hold() for a way
    # to keep it alive without windows).
    #
    # Normally, the connection between the application and the window will
    # remain until the window is destroyed, but you can explicitly remove
    # it by setting the @application to %NULL.
    #
    # This is equivalent to calling `Gtk::Application#remove_window`
    # and/or `Gtk::Application#add_window` on the old/new applications
    # as relevant.
    def application=(application : Gtk::Application?) : Nil
      # gtk_window_set_application: (Method | Setter)
      # @application: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      application = if application.nil?
                      Pointer(Void).null
                    else
                      application.to_unsafe
                    end

      # C call
      LibGtk.gtk_window_set_application(@pointer, application)

      # Return value handling
    end

    # Sets the child widget of @window.
    def child=(child : Gtk::Widget?) : Nil
      # gtk_window_set_child: (Method | Setter)
      # @child: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      # C call
      LibGtk.gtk_window_set_child(@pointer, child)

      # Return value handling
    end

    # Sets whether the window should be decorated.
    #
    # By default, windows are decorated with a title bar, resize
    # controls, etc. Some window managers allow GTK to disable these
    # decorations, creating a borderless window. If you set the decorated
    # property to %FALSE using this function, GTK will do its best to
    # convince the window manager not to decorate the window. Depending on
    # the system, this function may not have any effect when called on a
    # window that is already visible, so you should call it before calling
    # `Gtk::Widget#show`.
    #
    # On Windows, this function always works, since there’s no window manager
    # policy involved.
    def decorated=(setting : Bool) : Nil
      # gtk_window_set_decorated: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_set_decorated(@pointer, setting)

      # Return value handling
    end

    # Sets the default size of a window.
    #
    # If the window’s “natural” size (its size request) is larger than
    # the default, the default will be ignored.
    #
    # Unlike `Gtk::Widget#size_request=`, which sets a size
    # request for a widget and thus would keep users from shrinking
    # the window, this function only sets the initial size, just as
    # if the user had resized the window themselves. Users can still
    # shrink the window again as they normally would. Setting a default
    # size of -1 means to use the “natural” default size (the size request
    # of the window).
    #
    # The default size of a window only affects the first time a window is
    # shown; if a window is hidden and re-shown, it will remember the size
    # it had prior to hiding, rather than using the default size.
    #
    # Windows can’t actually be 0x0 in size, they must be at least 1x1, but
    # passing 0 for @width and @height is OK, resulting in a 1x1 default size.
    #
    # If you use this function to reestablish a previously saved window size,
    # note that the appropriate size to save is the one returned by
    # `Gtk::Window#default_size`. Using the window allocation
    # directly will not work in all circumstances and can lead to growing
    # or shrinking windows.
    def set_default_size(width : Int32, height : Int32) : Nil
      # gtk_window_set_default_size: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_set_default_size(@pointer, width, height)

      # Return value handling
    end

    # Sets the default widget.
    #
    # The default widget is the widget that is activated when the user
    # presses Enter in a dialog (for example).
    def default_widget=(default_widget : Gtk::Widget?) : Nil
      # gtk_window_set_default_widget: (Method | Setter)
      # @default_widget: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      default_widget = if default_widget.nil?
                         Pointer(Void).null
                       else
                         default_widget.to_unsafe
                       end

      # C call
      LibGtk.gtk_window_set_default_widget(@pointer, default_widget)

      # Return value handling
    end

    # Sets whether the window should be deletable.
    #
    # By default, windows have a close button in the window frame.
    # Some  window managers allow GTK to disable this button. If you
    # set the deletable property to %FALSE using this function, GTK
    # will do its best to convince the window manager not to show a
    # close button. Depending on the system, this function may not
    # have any effect when called on a window that is already visible,
    # so you should call it before calling `Gtk::Widget#show`.
    #
    # On Windows, this function always works, since there’s no window
    # manager policy involved.
    def deletable=(setting : Bool) : Nil
      # gtk_window_set_deletable: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_set_deletable(@pointer, setting)

      # Return value handling
    end

    # If @setting is %TRUE, then destroying the transient parent of @window
    # will also destroy @window itself.
    #
    # This is useful for dialogs that shouldn’t persist beyond the lifetime
    # of the main window they are associated with, for example.
    def destroy_with_parent=(setting : Bool) : Nil
      # gtk_window_set_destroy_with_parent: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_set_destroy_with_parent(@pointer, setting)

      # Return value handling
    end

    # Sets the `GdkDisplay` where the @window is displayed.
    #
    # If the window is already mapped, it will be unmapped,
    # and then remapped on the new display.
    def display=(display : Gdk::Display) : Nil
      # gtk_window_set_display: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_set_display(@pointer, display)

      # Return value handling
    end

    # Sets the focus widget.
    #
    # If @focus is not the current focus widget, and is focusable,
    # sets it as the focus widget for the window. If @focus is %NULL,
    # unsets the focus widget for this window. To set the focus to a
    # particular widget in the toplevel, it is usually more convenient
    # to use `Gtk::Widget#grab_focus` instead of this function.
    def focus=(focus : Gtk::Widget?) : Nil
      # gtk_window_set_focus: (Method)
      # @focus: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      focus = if focus.nil?
                Pointer(Void).null
              else
                focus.to_unsafe
              end

      # C call
      LibGtk.gtk_window_set_focus(@pointer, focus)

      # Return value handling
    end

    # Sets whether “focus rectangles” are supposed to be visible.
    def focus_visible=(setting : Bool) : Nil
      # gtk_window_set_focus_visible: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_set_focus_visible(@pointer, setting)

      # Return value handling
    end

    # Sets whether this window should react to F10 key presses
    # by activating a menubar it contains.
    def handle_menubar_accel=(handle_menubar_accel : Bool) : Nil
      # gtk_window_set_handle_menubar_accel: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_set_handle_menubar_accel(@pointer, handle_menubar_accel)

      # Return value handling
    end

    # If @setting is %TRUE, then clicking the close button on the window
    # will not destroy it, but only hide it.
    def hide_on_close=(setting : Bool) : Nil
      # gtk_window_set_hide_on_close: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_set_hide_on_close(@pointer, setting)

      # Return value handling
    end

    # Sets the icon for the window from a named themed icon.
    #
    # See the docs for `Gtk#IconTheme` for more details.
    # On some platforms, the window icon is not used at all.
    #
    # Note that this has nothing to do with the WM_ICON_NAME
    # property which is mentioned in the ICCCM.
    def icon_name=(name : ::String?) : Nil
      # gtk_window_set_icon_name: (Method | Setter)
      # @name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      LibGtk.gtk_window_set_icon_name(@pointer, name)

      # Return value handling
    end

    # Sets whether mnemonics are supposed to be visible.
    def mnemonics_visible=(setting : Bool) : Nil
      # gtk_window_set_mnemonics_visible: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_set_mnemonics_visible(@pointer, setting)

      # Return value handling
    end

    # Sets a window modal or non-modal.
    #
    # Modal windows prevent interaction with other windows in the same
    # application. To keep modal dialogs on top of main application windows,
    # use `Gtk::Window#transient_for=` to make the dialog transient
    # for the parent; most window managers will then disallow lowering the
    # dialog below the parent.
    def modal=(modal : Bool) : Nil
      # gtk_window_set_modal: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_set_modal(@pointer, modal)

      # Return value handling
    end

    # Sets whether the user can resize a window.
    #
    # Windows are user resizable by default.
    def resizable=(resizable : Bool) : Nil
      # gtk_window_set_resizable: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_set_resizable(@pointer, resizable)

      # Return value handling
    end

    # Sets the startup notification ID.
    #
    # Startup notification identifiers are used by desktop environment
    # to track application startup, to provide user feedback and other
    # features. This function changes the corresponding property on the
    # underlying `GdkSurface`.
    #
    # Normally, startup identifier is managed automatically and you should
    # only use this function in special cases like transferring focus from
    # other processes. You should use this function before calling
    # `Gtk::Window#present` or any equivalent function generating
    # a window map event.
    #
    # This function is only useful on X11, not with other GTK targets.
    def startup_id=(startup_id : ::String) : Nil
      # gtk_window_set_startup_id: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_set_startup_id(@pointer, startup_id)

      # Return value handling
    end

    # Sets the title of the `GtkWindow`.
    #
    # The title of a window will be displayed in its title bar; on the
    # X Window System, the title bar is rendered by the window manager
    # so exactly how the title appears to users may vary according to a
    # user’s exact configuration. The title should help a user distinguish
    # this window from other windows they may have open. A good title might
    # include the application name and current document filename, for example.
    #
    # Passing %NULL does the same as setting the title to an empty string.
    def title=(title : ::String?) : Nil
      # gtk_window_set_title: (Method | Setter)
      # @title: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      title = if title.nil?
                Pointer(LibC::Char).null
              else
                title.to_unsafe
              end

      # C call
      LibGtk.gtk_window_set_title(@pointer, title)

      # Return value handling
    end

    # Sets a custom titlebar for @window.
    #
    # A typical widget used here is `Gtk#HeaderBar`, as it
    # provides various features expected of a titlebar while allowing
    # the addition of child widgets to it.
    #
    # If you set a custom titlebar, GTK will do its best to convince
    # the window manager not to put its own titlebar on the window.
    # Depending on the system, this function may not work for a window
    # that is already visible, so you set the titlebar before calling
    # `Gtk::Widget#show`.
    def titlebar=(titlebar : Gtk::Widget?) : Nil
      # gtk_window_set_titlebar: (Method | Setter)
      # @titlebar: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      titlebar = if titlebar.nil?
                   Pointer(Void).null
                 else
                   titlebar.to_unsafe
                 end

      # C call
      LibGtk.gtk_window_set_titlebar(@pointer, titlebar)

      # Return value handling
    end

    # Dialog windows should be set transient for the main application
    # window they were spawned from. This allows window managers to e.g.
    # keep the dialog on top of the main window, or center the dialog
    # over the main window. `Gtk::Dialog#new_with_buttons` and other
    # convenience functions in GTK will sometimes call
    # gtk_window_set_transient_for() on your behalf.
    #
    # Passing %NULL for @parent unsets the current transient window.
    #
    # On Windows, this function puts the child window on top of the parent,
    # much as the window manager would have done on X.
    def transient_for=(parent : Gtk::Window?) : Nil
      # gtk_window_set_transient_for: (Method | Setter)
      # @parent: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end

      # C call
      LibGtk.gtk_window_set_transient_for(@pointer, parent)

      # Return value handling
    end

    # Asks to remove the fullscreen state for @window, and return to
    # its previous state.
    #
    # Note that you shouldn’t assume the window is definitely not
    # fullscreen afterward, because other entities (e.g. the user or
    # window manager could fullscreen it again, and not all window
    # managers honor requests to unfullscreen windows; normally the
    # window will end up restored to its normal state. Just don’t
    # write code that crashes if not.
    #
    # You can track the result of this operation via the
    # `Gdk::Toplevel#state` property, or by listening to
    # notifications of the `Gtk::Window#fullscreened` property.
    def unfullscreen : Nil
      # gtk_window_unfullscreen: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_unfullscreen(@pointer)

      # Return value handling
    end

    # Asks to unmaximize @window.
    #
    # Note that you shouldn’t assume the window is definitely unmaximized
    # afterward, because other entities (e.g. the user or window manager
    # maximize it again, and not all window managers honor requests to
    # unmaximize.
    #
    # You can track the result of this operation via the
    # `Gdk::Toplevel#state` property, or by listening to
    # notifications on the `Gtk::Window#maximized` property.
    def unmaximize : Nil
      # gtk_window_unmaximize: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_unmaximize(@pointer)

      # Return value handling
    end

    # Asks to unminimize the specified @window.
    #
    # Note that you shouldn’t assume the window is definitely unminimized
    # afterward, because the windowing system might not support this
    # functionality; other entities (e.g. the user or the window manager
    # could minimize it again, or there may not be a window manager in
    # which case minimization isn’t possible, etc.
    #
    # You can track result of this operation via the
    # `Gdk::Toplevel#state` property.
    def unminimize : Nil
      # gtk_window_unminimize: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_window_unminimize(@pointer)

      # Return value handling
    end

    # Emitted when the user activates the default widget
    # of @window.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    struct ActivateDefaultSignal < GObject::Signal
      def name : String
        @detail ? "activate-default::#{@detail}" : "activate-default"
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

      def connect(handler : Proc(Gtk::Window, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Window.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Window, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate-default")
      end
    end

    def activate_default_signal
      ActivateDefaultSignal.new(self)
    end

    # Emitted when the user activates the currently focused
    # widget of @window.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    struct ActivateFocusSignal < GObject::Signal
      def name : String
        @detail ? "activate-focus::#{@detail}" : "activate-focus"
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

      def connect(handler : Proc(Gtk::Window, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Window.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Window, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate-focus")
      end
    end

    def activate_focus_signal
      ActivateFocusSignal.new(self)
    end

    # Emitted when the user clicks on the close button of the window.
    struct CloseRequestSignal < GObject::Signal
      def name : String
        @detail ? "close-request::#{@detail}" : "close-request"
      end

      def connect(*, after : Bool = false, &block : Proc(Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(_lib_box).call
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Window, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Window.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Window, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "close-request")
      end
    end

    def close_request_signal
      CloseRequestSignal.new(self)
    end

    # Emitted when the user enables or disables interactive debugging.
    #
    # When @toggle is %TRUE, interactive debugging is toggled on or off,
    # when it is %FALSE, the debugger will be pointed at the widget
    # under the pointer.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # The default bindings for this signal are Ctrl-Shift-I
    # and Ctrl-Shift-D.
    struct EnableDebuggingSignal < GObject::Signal
      def name : String
        @detail ? "enable-debugging::#{@detail}" : "enable-debugging"
      end

      def connect(*, after : Bool = false, &block : Proc(Bool, Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Bool, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_toggle : LibC::Int, _lib_box : Pointer(Void)) {
          toggle = lib_toggle
          ::Box(Proc(Bool, Bool)).unbox(_lib_box).call(toggle)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Window, Bool, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_toggle : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::Window.new(_lib_sender, GICrystal::Transfer::None)
          toggle = lib_toggle
          ::Box(Proc(Gtk::Window, Bool, Bool)).unbox(_lib_box).call(_sender, toggle)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(toggle : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "enable-debugging", toggle)
      end
    end

    def enable_debugging_signal
      EnableDebuggingSignal.new(self)
    end

    # emitted when the set of accelerators or mnemonics that
    # are associated with @window changes.
    struct KeysChangedSignal < GObject::Signal
      def name : String
        @detail ? "keys-changed::#{@detail}" : "keys-changed"
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

      def connect(handler : Proc(Gtk::Window, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Window.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Window, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "keys-changed")
      end
    end

    def keys_changed_signal
      KeysChangedSignal.new(self)
    end
  end
end
