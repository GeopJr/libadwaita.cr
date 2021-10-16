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
  # The `GtkWindow` implementation of the [iface@Gtk.Buildable] interface supports
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
  class Window < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Native
    include Root
    include ShortcutManager

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, application : Gtk::Application? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, decorated : Bool? = nil, default_height : Int32? = nil, default_widget : Gtk::Widget? = nil, default_width : Int32? = nil, deletable : Bool? = nil, destroy_with_parent : Bool? = nil, display : Gdk::Display? = nil, focus_on_click : Bool? = nil, focus_visible : Bool? = nil, focus_widget : Gtk::Widget? = nil, focusable : Bool? = nil, fullscreened : Bool? = nil, halign : Gtk::Align? = nil, handle_menubar_accel : Bool? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hide_on_close : Bool? = nil, icon_name : ::String? = nil, is_active : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, maximized : Bool? = nil, mnemonics_visible : Bool? = nil, modal : Bool? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, resizable : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, startup_id : ::String? = nil, title : ::String? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, transient_for : Gtk::Window? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[58]
      _values = StaticArray(LibGObject::Value, 58).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if application
        (_names.to_unsafe + _n).value = "application".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, application)
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
      if child
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
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
      if decorated
        (_names.to_unsafe + _n).value = "decorated".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, decorated)
        _n += 1
      end
      if default_height
        (_names.to_unsafe + _n).value = "default-height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_height)
        _n += 1
      end
      if default_widget
        (_names.to_unsafe + _n).value = "default-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_widget)
        _n += 1
      end
      if default_width
        (_names.to_unsafe + _n).value = "default-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_width)
        _n += 1
      end
      if deletable
        (_names.to_unsafe + _n).value = "deletable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, deletable)
        _n += 1
      end
      if destroy_with_parent
        (_names.to_unsafe + _n).value = "destroy-with-parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, destroy_with_parent)
        _n += 1
      end
      if display
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if focus_on_click
        (_names.to_unsafe + _n).value = "focus-on-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_on_click)
        _n += 1
      end
      if focus_visible
        (_names.to_unsafe + _n).value = "focus-visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_visible)
        _n += 1
      end
      if focus_widget
        (_names.to_unsafe + _n).value = "focus-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_widget)
        _n += 1
      end
      if focusable
        (_names.to_unsafe + _n).value = "focusable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focusable)
        _n += 1
      end
      if fullscreened
        (_names.to_unsafe + _n).value = "fullscreened".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fullscreened)
        _n += 1
      end
      if halign
        (_names.to_unsafe + _n).value = "halign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, halign)
        _n += 1
      end
      if handle_menubar_accel
        (_names.to_unsafe + _n).value = "handle-menubar-accel".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, handle_menubar_accel)
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
      if hide_on_close
        (_names.to_unsafe + _n).value = "hide-on-close".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hide_on_close)
        _n += 1
      end
      if icon_name
        (_names.to_unsafe + _n).value = "icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_name)
        _n += 1
      end
      if is_active
        (_names.to_unsafe + _n).value = "is-active".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_active)
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
      if maximized
        (_names.to_unsafe + _n).value = "maximized".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, maximized)
        _n += 1
      end
      if mnemonics_visible
        (_names.to_unsafe + _n).value = "mnemonics-visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mnemonics_visible)
        _n += 1
      end
      if modal
        (_names.to_unsafe + _n).value = "modal".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, modal)
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
      if resizable
        (_names.to_unsafe + _n).value = "resizable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, resizable)
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
      if startup_id
        (_names.to_unsafe + _n).value = "startup-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, startup_id)
        _n += 1
      end
      if title
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
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
      if transient_for
        (_names.to_unsafe + _n).value = "transient-for".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transient_for)
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

      @pointer = LibGObject.g_object_new_with_properties(Window.g_type, _n, _names, _values)
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

    def initialize
      # gtk_window_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_new
      @pointer = _retval
    end

    def self.default_icon_name : ::String?
      # gtk_window_get_default_icon_name: (None)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_get_default_icon_name
      ::String.new(_retval) unless _retval.null?
    end

    def self.toplevels : Gio::ListModel
      # gtk_window_get_toplevels: (None)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_get_toplevels
      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def self.list_toplevels : GLib::List
      # gtk_window_list_toplevels: (None)
      # Returns: (transfer container)

      _retval = LibGtk.gtk_window_list_toplevels
      GLib::List(Gtk::Widget).new(_retval, GICrystal::Transfer::Container)
    end

    def self.auto_startup_notification=(setting : Bool) : Nil
      # gtk_window_set_auto_startup_notification: (None)
      # Returns: (transfer none)

      LibGtk.gtk_window_set_auto_startup_notification(setting)
    end

    def self.default_icon_name=(name : ::String) : Nil
      # gtk_window_set_default_icon_name: (None)
      # Returns: (transfer none)

      LibGtk.gtk_window_set_default_icon_name(name)
    end

    def self.interactive_debugging=(enable : Bool) : Nil
      # gtk_window_set_interactive_debugging: (None)
      # Returns: (transfer none)

      LibGtk.gtk_window_set_interactive_debugging(enable)
    end

    def close : Nil
      # gtk_window_close: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_close(self)
    end

    def destroy : Nil
      # gtk_window_destroy: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_destroy(self)
    end

    def fullscreen : Nil
      # gtk_window_fullscreen: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_fullscreen(self)
    end

    def fullscreen_on_monitor(monitor : Gdk::Monitor) : Nil
      # gtk_window_fullscreen_on_monitor: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_fullscreen_on_monitor(self, monitor)
    end

    def application : Gtk::Application?
      # gtk_window_get_application: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_get_application(self)
      Gtk::Application.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def child : Gtk::Widget?
      # gtk_window_get_child: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_get_child(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def decorated : Bool
      # gtk_window_get_decorated: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_get_decorated(self)
      GICrystal.to_bool(_retval)
    end

    def default_size : Nil
      # gtk_window_get_default_size: (Method)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      width = Pointer(Int32).null
      height = Pointer(Int32).null

      LibGtk.gtk_window_get_default_size(self, width, height)
    end

    def default_widget : Gtk::Widget?
      # gtk_window_get_default_widget: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_get_default_widget(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def deletable : Bool
      # gtk_window_get_deletable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_get_deletable(self)
      GICrystal.to_bool(_retval)
    end

    def destroy_with_parent : Bool
      # gtk_window_get_destroy_with_parent: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_get_destroy_with_parent(self)
      GICrystal.to_bool(_retval)
    end

    def focus : Gtk::Widget?
      # gtk_window_get_focus: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_get_focus(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def focus_visible : Bool
      # gtk_window_get_focus_visible: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_get_focus_visible(self)
      GICrystal.to_bool(_retval)
    end

    def group : Gtk::WindowGroup
      # gtk_window_get_group: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_get_group(self)
      Gtk::WindowGroup.new(_retval, GICrystal::Transfer::None)
    end

    def handle_menubar_accel : Bool
      # gtk_window_get_handle_menubar_accel: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_get_handle_menubar_accel(self)
      GICrystal.to_bool(_retval)
    end

    def hide_on_close : Bool
      # gtk_window_get_hide_on_close: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_get_hide_on_close(self)
      GICrystal.to_bool(_retval)
    end

    def icon_name : ::String?
      # gtk_window_get_icon_name: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_get_icon_name(self)
      ::String.new(_retval) unless _retval.null?
    end

    def mnemonics_visible : Bool
      # gtk_window_get_mnemonics_visible: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_get_mnemonics_visible(self)
      GICrystal.to_bool(_retval)
    end

    def modal : Bool
      # gtk_window_get_modal: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_get_modal(self)
      GICrystal.to_bool(_retval)
    end

    def resizable : Bool
      # gtk_window_get_resizable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_get_resizable(self)
      GICrystal.to_bool(_retval)
    end

    def title : ::String?
      # gtk_window_get_title: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_get_title(self)
      ::String.new(_retval) unless _retval.null?
    end

    def titlebar : Gtk::Widget?
      # gtk_window_get_titlebar: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_get_titlebar(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def transient_for : Gtk::Window?
      # gtk_window_get_transient_for: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_get_transient_for(self)
      Gtk::Window.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def has_group : Bool
      # gtk_window_has_group: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_has_group(self)
      GICrystal.to_bool(_retval)
    end

    def is_active : Bool
      # gtk_window_is_active: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_is_active(self)
      GICrystal.to_bool(_retval)
    end

    def is_fullscreen : Bool
      # gtk_window_is_fullscreen: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_is_fullscreen(self)
      GICrystal.to_bool(_retval)
    end

    def is_maximized : Bool
      # gtk_window_is_maximized: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_window_is_maximized(self)
      GICrystal.to_bool(_retval)
    end

    def maximize : Nil
      # gtk_window_maximize: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_maximize(self)
    end

    def minimize : Nil
      # gtk_window_minimize: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_minimize(self)
    end

    def present : Nil
      # gtk_window_present: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_present(self)
    end

    def present_with_time(timestamp : UInt32) : Nil
      # gtk_window_present_with_time: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_present_with_time(self, timestamp)
    end

    def application=(application : Gtk::Application?) : Nil
      # gtk_window_set_application: (Method)
      # @application: (nullable)
      # Returns: (transfer none)

      application = if application.nil?
                      Pointer(Void).null
                    else
                      application.to_unsafe
                    end

      LibGtk.gtk_window_set_application(self, application)
    end

    def child=(child : Gtk::Widget?) : Nil
      # gtk_window_set_child: (Method)
      # @child: (nullable)
      # Returns: (transfer none)

      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      LibGtk.gtk_window_set_child(self, child)
    end

    def decorated=(setting : Bool) : Nil
      # gtk_window_set_decorated: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_set_decorated(self, setting)
    end

    def set_default_size(width : Int32, height : Int32) : Nil
      # gtk_window_set_default_size: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_set_default_size(self, width, height)
    end

    def default_widget=(default_widget : Gtk::Widget?) : Nil
      # gtk_window_set_default_widget: (Method)
      # @default_widget: (nullable)
      # Returns: (transfer none)

      default_widget = if default_widget.nil?
                         Pointer(Void).null
                       else
                         default_widget.to_unsafe
                       end

      LibGtk.gtk_window_set_default_widget(self, default_widget)
    end

    def deletable=(setting : Bool) : Nil
      # gtk_window_set_deletable: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_set_deletable(self, setting)
    end

    def destroy_with_parent=(setting : Bool) : Nil
      # gtk_window_set_destroy_with_parent: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_set_destroy_with_parent(self, setting)
    end

    def display=(display : Gdk::Display) : Nil
      # gtk_window_set_display: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_set_display(self, display)
    end

    def focus=(focus : Gtk::Widget?) : Nil
      # gtk_window_set_focus: (Method)
      # @focus: (nullable)
      # Returns: (transfer none)

      focus = if focus.nil?
                Pointer(Void).null
              else
                focus.to_unsafe
              end

      LibGtk.gtk_window_set_focus(self, focus)
    end

    def focus_visible=(setting : Bool) : Nil
      # gtk_window_set_focus_visible: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_set_focus_visible(self, setting)
    end

    def handle_menubar_accel=(handle_menubar_accel : Bool) : Nil
      # gtk_window_set_handle_menubar_accel: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_set_handle_menubar_accel(self, handle_menubar_accel)
    end

    def hide_on_close=(setting : Bool) : Nil
      # gtk_window_set_hide_on_close: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_set_hide_on_close(self, setting)
    end

    def icon_name=(name : ::String?) : Nil
      # gtk_window_set_icon_name: (Method)
      # @name: (nullable)
      # Returns: (transfer none)

      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      LibGtk.gtk_window_set_icon_name(self, name)
    end

    def mnemonics_visible=(setting : Bool) : Nil
      # gtk_window_set_mnemonics_visible: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_set_mnemonics_visible(self, setting)
    end

    def modal=(modal : Bool) : Nil
      # gtk_window_set_modal: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_set_modal(self, modal)
    end

    def resizable=(resizable : Bool) : Nil
      # gtk_window_set_resizable: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_set_resizable(self, resizable)
    end

    def startup_id=(startup_id : ::String) : Nil
      # gtk_window_set_startup_id: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_set_startup_id(self, startup_id)
    end

    def title=(title : ::String?) : Nil
      # gtk_window_set_title: (Method)
      # @title: (nullable)
      # Returns: (transfer none)

      title = if title.nil?
                Pointer(LibC::Char).null
              else
                title.to_unsafe
              end

      LibGtk.gtk_window_set_title(self, title)
    end

    def titlebar=(titlebar : Gtk::Widget?) : Nil
      # gtk_window_set_titlebar: (Method)
      # @titlebar: (nullable)
      # Returns: (transfer none)

      titlebar = if titlebar.nil?
                   Pointer(Void).null
                 else
                   titlebar.to_unsafe
                 end

      LibGtk.gtk_window_set_titlebar(self, titlebar)
    end

    def transient_for=(parent : Gtk::Window?) : Nil
      # gtk_window_set_transient_for: (Method)
      # @parent: (nullable)
      # Returns: (transfer none)

      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end

      LibGtk.gtk_window_set_transient_for(self, parent)
    end

    def unfullscreen : Nil
      # gtk_window_unfullscreen: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_unfullscreen(self)
    end

    def unmaximize : Nil
      # gtk_window_unmaximize: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_unmaximize(self)
    end

    def unminimize : Nil
      # gtk_window_unminimize: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_window_unminimize(self)
    end

    struct ActivateDefaultSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "activate-default::#{@detail}" : "activate-default"
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

      def connect(block : Proc(Gtk::Window, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Window.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Window, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Window, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Window.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Window, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate-default")
      end
    end

    def activate_default_signal
      ActivateDefaultSignal.new(self)
    end

    struct ActivateFocusSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "activate-focus::#{@detail}" : "activate-focus"
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

      def connect(block : Proc(Gtk::Window, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Window.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Window, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Window, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Window.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Window, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate-focus")
      end
    end

    def activate_focus_signal
      ActivateFocusSignal.new(self)
    end

    struct CloseRequestSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "close-request::#{@detail}" : "close-request"
      end

      def connect(&block : Proc(Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Bool))
        connect(block)
      end

      def connect(block : Proc(Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Window, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Window.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Window, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Window, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Window.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Window, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "close-request")
      end
    end

    def close_request_signal
      CloseRequestSignal.new(self)
    end

    struct EnableDebuggingSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "enable-debugging::#{@detail}" : "enable-debugging"
      end

      def connect(&block : Proc(Bool, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Bool, Bool))
        connect(block)
      end

      def connect(block : Proc(Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Bool, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Bool, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Window, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::Window.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Gtk::Window, Bool, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Window, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::Window.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Gtk::Window, Bool, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(toggle : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "enable-debugging", toggle)
      end
    end

    def enable_debugging_signal
      EnableDebuggingSignal.new(self)
    end

    struct KeysChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "keys-changed::#{@detail}" : "keys-changed"
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

      def connect(block : Proc(Gtk::Window, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Window.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Window, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Window, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Window.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Window, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
