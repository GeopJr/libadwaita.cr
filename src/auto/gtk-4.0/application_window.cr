require "./window"
require "../gio-2.0/action_group"

require "../gio-2.0/action_map"

require "./accessible"

require "./buildable"

require "./constraint_target"

require "./native"

require "./root"

require "./shortcut_manager"

module Gtk
  # `GtkApplicationWindow` is a `GtkWindow` subclass that integrates with
  # `GtkApplication`.
  #
  # Notably, `GtkApplicationWindow` can handle an application menubar.
  #
  # This class implements the `GActionGroup` and `GActionMap` interfaces,
  # to let you add window-specific actions that will be exported by the
  # associated `Gtk#Application`, together with its application-wide
  # actions. Window-specific actions are prefixed with the “win.”
  # prefix and application-wide actions are prefixed with the “app.”
  # prefix. Actions must be addressed with the prefixed name when
  # referring to them from a `GMenuModel`.
  #
  # Note that widgets that are placed inside a `GtkApplicationWindow`
  # can also activate these actions, if they implement the
  # `Gtk#Actionable` interface.
  #
  # The settings [property@Gtk.Settings:gtk-shell-shows-app-menu] and
  # [property@Gtk.Settings:gtk-shell-shows-menubar] tell GTK whether the
  # desktop environment is showing the application menu and menubar
  # models outside the application as part of the desktop shell.
  # For instance, on OS X, both menus will be displayed remotely;
  # on Windows neither will be.
  #
  # If the desktop environment does not display the menubar, then
  # `GtkApplicationWindow` will automatically show a menubar for it.
  # This behaviour can be overridden with the
  # [property@Gtk.ApplicationWindow:show-menubar] property. If the
  # desktop environment does not display the application menu, then
  # it will automatically be included in the menubar or in the windows
  # client-side decorations.
  #
  # See `Gtk#PopoverMenu` for information about the XML language
  # used by `GtkBuilder` for menu models.
  #
  # See also: `Gtk::Application#menubar=`.
  #
  # ## A GtkApplicationWindow with a menubar
  #
  # The code sample below shows how to set up a `GtkApplicationWindow`
  # with a menu bar defined on the `Gtk#Application`:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # GtkApplication *app = gtk_application_new ("org.gtk.test", 0);
  #
  # GtkBuilder *builder = gtk_builder_new_from_string (
  #     "<interface>"
  #     "  <menu id='menubar'>"
  #     "    <submenu>"
  #     "      <attribute name='label' translatable='yes'>_Edit</attribute>"
  #     "      <item>"
  #     "        <attribute name='label' translatable='yes'>_Copy</attribute>"
  #     "        <attribute name='action'>win.copy</attribute>"
  #     "      </item>"
  #     "      <item>"
  #     "        <attribute name='label' translatable='yes'>_Paste</attribute>"
  #     "        <attribute name='action'>win.paste</attribute>"
  #     "      </item>"
  #     "    </submenu>"
  #     "  </menu>"
  #     "</interface>",
  #     -1);
  #
  # GMenuModel *menubar = G_MENU_MODEL (gtk_builder_get_object (builder, "menubar"));
  # gtk_application_set_menubar (GTK_APPLICATION (app), menubar);
  # g_object_unref (builder);
  #
  # // ...
  #
  # GtkWidget *window = gtk_application_window_new (app);
  # ```
  @[GObject::GeneratedWrapper]
  class ApplicationWindow < Window
    include Gio::ActionGroup
    include Gio::ActionMap
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
        sizeof(LibGtk::ApplicationWindowClass), class_init,
        sizeof(LibGtk::ApplicationWindow), instance_init, 0)
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

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, application : Gtk::Application? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, decorated : Bool? = nil, default_height : Int32? = nil, default_widget : Gtk::Widget? = nil, default_width : Int32? = nil, deletable : Bool? = nil, destroy_with_parent : Bool? = nil, display : Gdk::Display? = nil, focus_on_click : Bool? = nil, focus_visible : Bool? = nil, focus_widget : Gtk::Widget? = nil, focusable : Bool? = nil, fullscreened : Bool? = nil, halign : Gtk::Align? = nil, handle_menubar_accel : Bool? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hide_on_close : Bool? = nil, icon_name : ::String? = nil, is_active : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, maximized : Bool? = nil, mnemonics_visible : Bool? = nil, modal : Bool? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, resizable : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, show_menubar : Bool? = nil, startup_id : ::String? = nil, title : ::String? = nil, titlebar : Gtk::Widget? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, transient_for : Gtk::Window? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[60]
      _values = StaticArray(LibGObject::Value, 60).new(LibGObject::Value.new)
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
      if !show_menubar.nil?
        (_names.to_unsafe + _n).value = "show-menubar".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_menubar)
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

      @pointer = LibGObject.g_object_new_with_properties(ApplicationWindow.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_application_window_get_type
    end

    def show_menubar=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-menubar", unsafe_value, Pointer(Void).null)
      value
    end

    def show_menubar? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-menubar", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a new `GtkApplicationWindow`.
    def initialize(application : Gtk::Application)
      # gtk_application_window_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_application_window_new(application)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the `GtkShortcutsWindow` that is associated with @window.
    #
    # See `Gtk::ApplicationWindow#help_overlay=`.
    def help_overlay : Gtk::ShortcutsWindow?
      # gtk_application_window_get_help_overlay: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_application_window_get_help_overlay(self)

      # Return value handling

      Gtk::ShortcutsWindow.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the unique ID of the window.
    #
    #  If the window has not yet been added to a `GtkApplication`, returns `0`.
    def id : UInt32
      # gtk_application_window_get_id: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_application_window_get_id(self)

      # Return value handling

      _retval
    end

    # Returns whether the window will display a menubar for the app menu
    # and menubar as needed.
    def show_menubar : Bool
      # gtk_application_window_get_show_menubar: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_application_window_get_show_menubar(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Associates a shortcuts window with the application window.
    #
    # Additionally, sets up an action with the name
    # `win.show-help-overlay` to present it.
    #
    # @window takes responsibility for destroying @help_overlay.
    def help_overlay=(help_overlay : Gtk::ShortcutsWindow?) : Nil
      # gtk_application_window_set_help_overlay: (Method)
      # @help_overlay: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      help_overlay = if help_overlay.nil?
                       Pointer(Void).null
                     else
                       help_overlay.to_unsafe
                     end

      # C call
      LibGtk.gtk_application_window_set_help_overlay(self, help_overlay)

      # Return value handling
    end

    # Sets whether the window will display a menubar for the app menu
    # and menubar as needed.
    def show_menubar=(show_menubar : Bool) : Nil
      # gtk_application_window_set_show_menubar: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_application_window_set_show_menubar(self, show_menubar)

      # Return value handling
    end
  end
end
