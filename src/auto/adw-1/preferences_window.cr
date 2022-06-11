require "./window"
require "../gtk-4.0/accessible"

require "../gtk-4.0/buildable"

require "../gtk-4.0/constraint_target"

require "../gtk-4.0/native"

require "../gtk-4.0/root"

require "../gtk-4.0/shortcut_manager"

module Adw
  # A window to present an application's preferences.
  #
  # <picture>
  #   <source srcset="preferences-window-dark.png" media="(prefers-color-scheme: dark)">
  #   <img src="preferences-window.png" alt="preferences-window">
  # </picture>
  #
  # The `AdwPreferencesWindow` widget presents an application's preferences
  # gathered into pages and groups. The preferences are searchable by the user.
  #
  # ## CSS nodes
  #
  # `AdwPreferencesWindow` has a main CSS node with the name `window` and the
  # style class `.preferences`.
  @[GObject::GeneratedWrapper]
  class PreferencesWindow < Window
    include Gtk::Accessible
    include Gtk::Buildable
    include Gtk::ConstraintTarget
    include Gtk::Native
    include Gtk::Root
    include Gtk::ShortcutManager

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::PreferencesWindowClass), class_init,
        sizeof(LibAdw::PreferencesWindow), instance_init, 0)
    end

    GICrystal.define_new_method(PreferencesWindow, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `PreferencesWindow`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, application : Gtk::Application? = nil, can_focus : Bool? = nil, can_navigate_back : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, content : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, decorated : Bool? = nil, default_height : Int32? = nil, default_widget : Gtk::Widget? = nil, default_width : Int32? = nil, deletable : Bool? = nil, destroy_with_parent : Bool? = nil, display : Gdk::Display? = nil, focus_on_click : Bool? = nil, focus_visible : Bool? = nil, focus_widget : Gtk::Widget? = nil, focusable : Bool? = nil, fullscreened : Bool? = nil, halign : Gtk::Align? = nil, handle_menubar_accel : Bool? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hide_on_close : Bool? = nil, icon_name : ::String? = nil, is_active : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, maximized : Bool? = nil, mnemonics_visible : Bool? = nil, modal : Bool? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, resizable : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, search_enabled : Bool? = nil, sensitive : Bool? = nil, startup_id : ::String? = nil, title : ::String? = nil, titlebar : Gtk::Widget? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, transient_for : Gtk::Window? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, visible_page : Gtk::Widget? = nil, visible_page_name : ::String? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[64]
      _values = StaticArray(LibGObject::Value, 64).new(LibGObject::Value.new)
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
      if !can_navigate_back.nil?
        (_names.to_unsafe + _n).value = "can-navigate-back".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_navigate_back)
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
      if !content.nil?
        (_names.to_unsafe + _n).value = "content".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, content)
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
      if !search_enabled.nil?
        (_names.to_unsafe + _n).value = "search-enabled".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, search_enabled)
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
      if !visible_page.nil?
        (_names.to_unsafe + _n).value = "visible-page".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible_page)
        _n += 1
      end
      if !visible_page_name.nil?
        (_names.to_unsafe + _n).value = "visible-page-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible_page_name)
        _n += 1
      end
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(PreferencesWindow.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_preferences_window_get_type
    end

    def can_navigate_back=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "can-navigate-back", unsafe_value, Pointer(Void).null)
      value
    end

    def can_navigate_back? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "can-navigate-back", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def search_enabled=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "search-enabled", unsafe_value, Pointer(Void).null)
      value
    end

    def search_enabled? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "search-enabled", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def visible_page=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "visible-page", unsafe_value, Pointer(Void).null)
      value
    end

    def visible_page : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "visible-page", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def visible_page_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "visible-page-name", unsafe_value, Pointer(Void).null)
      value
    end

    def visible_page_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "visible-page-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Adds a preferences page to @self.
    def add(page : Adw::PreferencesPage) : Nil
      # adw_preferences_window_add: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_preferences_window_add(@pointer, page)

      # Return value handling
    end

    # Displays @toast.
    #
    # See `ToastOverlay#add_toast`.
    def add_toast(toast : Adw::Toast) : Nil
      # adw_preferences_window_add_toast: (Method)
      # @toast: (transfer full)
      # Returns: (transfer none)

      # Generator::TransferFullArgPlan
      LibGObject.g_object_ref_sink(toast)
      # C call
      LibAdw.adw_preferences_window_add_toast(@pointer, toast)

      # Return value handling
    end

    # Closes the current subpage.
    #
    # If there is no presented subpage, this does nothing.
    def close_subpage : Nil
      # adw_preferences_window_close_subpage: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_preferences_window_close_subpage(@pointer)

      # Return value handling
    end

    # Gets whether gestures and shortcuts for closing subpages are enabled.
    def can_navigate_back : Bool
      # adw_preferences_window_get_can_navigate_back: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_preferences_window_get_can_navigate_back(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether search is enabled for @self.
    def search_enabled : Bool
      # adw_preferences_window_get_search_enabled: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_preferences_window_get_search_enabled(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the currently visible page of @self.
    def visible_page : Adw::PreferencesPage?
      # adw_preferences_window_get_visible_page: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_preferences_window_get_visible_page(@pointer)

      # Return value handling

      Adw::PreferencesPage.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the name of currently visible page of @self.
    def visible_page_name : ::String?
      # adw_preferences_window_get_visible_page_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_preferences_window_get_visible_page_name(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Sets @subpage as the window's subpage and opens it.
    #
    # The transition can be cancelled by the user, in which case visible child will
    # change back to the previously visible child.
    def present_subpage(subpage : Gtk::Widget) : Nil
      # adw_preferences_window_present_subpage: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_preferences_window_present_subpage(@pointer, subpage)

      # Return value handling
    end

    # Removes a page from @self.
    def remove(page : Adw::PreferencesPage) : Nil
      # adw_preferences_window_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_preferences_window_remove(@pointer, page)

      # Return value handling
    end

    # Sets whether gestures and shortcuts for closing subpages are enabled.
    def can_navigate_back=(can_navigate_back : Bool) : Nil
      # adw_preferences_window_set_can_navigate_back: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_preferences_window_set_can_navigate_back(@pointer, can_navigate_back)

      # Return value handling
    end

    # Sets whether search is enabled for @self.
    def search_enabled=(search_enabled : Bool) : Nil
      # adw_preferences_window_set_search_enabled: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_preferences_window_set_search_enabled(@pointer, search_enabled)

      # Return value handling
    end

    # Makes @page the visible page of @self.
    def visible_page=(page : Adw::PreferencesPage) : Nil
      # adw_preferences_window_set_visible_page: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_preferences_window_set_visible_page(@pointer, page)

      # Return value handling
    end

    # Makes the page with the given name visible.
    def visible_page_name=(name : ::String) : Nil
      # adw_preferences_window_set_visible_page_name: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_preferences_window_set_visible_page_name(@pointer, name)

      # Return value handling
    end
  end
end
