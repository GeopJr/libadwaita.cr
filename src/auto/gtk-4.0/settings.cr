require "../g_object-2.0/object"
require "./style_provider"

module Gtk
  # `GtkSettings` provides a mechanism to share global settings between
  # applications.
  #
  # On the X window system, this sharing is realized by an
  # [XSettings](http://www.freedesktop.org/wiki/Specifications/xsettings-spec)
  # manager that is usually part of the desktop environment, along with
  # utilities that let the user change these settings.
  #
  # On Wayland, the settings are obtained either via a settings portal,
  # or by reading desktop settings from DConf.
  #
  # In the absence of these sharing mechanisms, GTK reads default values for
  # settings from `settings.ini` files in `/etc/gtk-4.0`, `$XDG_CONFIG_DIRS/gtk-4.0`
  # and `$XDG_CONFIG_HOME/gtk-4.0`. These files must be valid key files (see
  # `GKeyFile`), and have a section called Settings. Themes can also provide
  # default values for settings by installing a `settings.ini` file
  # next to their `gtk.css` file.
  #
  # Applications can override system-wide settings by setting the property
  # of the `GtkSettings` object with g_object_set(). This should be restricted
  # to special cases though; `GtkSettings` are not meant as an application
  # configuration facility.
  #
  # There is one `GtkSettings` instance per display. It can be obtained with
  # [func@Gtk.Settings.get_for_display], but in many cases, it is more
  # convenient to use [method@Gtk.Widget.get_settings].
  class Settings < GObject::Object
    include StyleProvider

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, gtk_alternative_button_order : Bool? = nil, gtk_alternative_sort_arrows : Bool? = nil, gtk_application_prefer_dark_theme : Bool? = nil, gtk_cursor_aspect_ratio : Float64? = nil, gtk_cursor_blink : Bool? = nil, gtk_cursor_blink_time : Int32? = nil, gtk_cursor_blink_timeout : Int32? = nil, gtk_cursor_theme_name : ::String? = nil, gtk_cursor_theme_size : Int32? = nil, gtk_decoration_layout : ::String? = nil, gtk_dialogs_use_header : Bool? = nil, gtk_dnd_drag_threshold : Int32? = nil, gtk_double_click_distance : Int32? = nil, gtk_double_click_time : Int32? = nil, gtk_enable_accels : Bool? = nil, gtk_enable_animations : Bool? = nil, gtk_enable_event_sounds : Bool? = nil, gtk_enable_input_feedback_sounds : Bool? = nil, gtk_enable_primary_paste : Bool? = nil, gtk_entry_password_hint_timeout : UInt32? = nil, gtk_entry_select_on_focus : Bool? = nil, gtk_error_bell : Bool? = nil, gtk_font_name : ::String? = nil, gtk_fontconfig_timestamp : UInt32? = nil, gtk_icon_theme_name : ::String? = nil, gtk_im_module : ::String? = nil, gtk_keynav_use_caret : Bool? = nil, gtk_label_select_on_focus : Bool? = nil, gtk_long_press_time : UInt32? = nil, gtk_overlay_scrolling : Bool? = nil, gtk_primary_button_warps_slider : Bool? = nil, gtk_print_backends : ::String? = nil, gtk_print_preview_command : ::String? = nil, gtk_recent_files_enabled : Bool? = nil, gtk_recent_files_max_age : Int32? = nil, gtk_shell_shows_app_menu : Bool? = nil, gtk_shell_shows_desktop : Bool? = nil, gtk_shell_shows_menubar : Bool? = nil, gtk_sound_theme_name : ::String? = nil, gtk_split_cursor : Bool? = nil, gtk_theme_name : ::String? = nil, gtk_titlebar_double_click : ::String? = nil, gtk_titlebar_middle_click : ::String? = nil, gtk_titlebar_right_click : ::String? = nil, gtk_xft_antialias : Int32? = nil, gtk_xft_dpi : Int32? = nil, gtk_xft_hinting : Int32? = nil, gtk_xft_hintstyle : ::String? = nil, gtk_xft_rgba : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[49]
      _values = StaticArray(LibGObject::Value, 49).new(LibGObject::Value.new)
      _n = 0

      if gtk_alternative_button_order
        (_names.to_unsafe + _n).value = "gtk-alternative-button-order".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_alternative_button_order)
        _n += 1
      end
      if gtk_alternative_sort_arrows
        (_names.to_unsafe + _n).value = "gtk-alternative-sort-arrows".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_alternative_sort_arrows)
        _n += 1
      end
      if gtk_application_prefer_dark_theme
        (_names.to_unsafe + _n).value = "gtk-application-prefer-dark-theme".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_application_prefer_dark_theme)
        _n += 1
      end
      if gtk_cursor_aspect_ratio
        (_names.to_unsafe + _n).value = "gtk-cursor-aspect-ratio".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_cursor_aspect_ratio)
        _n += 1
      end
      if gtk_cursor_blink
        (_names.to_unsafe + _n).value = "gtk-cursor-blink".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_cursor_blink)
        _n += 1
      end
      if gtk_cursor_blink_time
        (_names.to_unsafe + _n).value = "gtk-cursor-blink-time".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_cursor_blink_time)
        _n += 1
      end
      if gtk_cursor_blink_timeout
        (_names.to_unsafe + _n).value = "gtk-cursor-blink-timeout".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_cursor_blink_timeout)
        _n += 1
      end
      if gtk_cursor_theme_name
        (_names.to_unsafe + _n).value = "gtk-cursor-theme-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_cursor_theme_name)
        _n += 1
      end
      if gtk_cursor_theme_size
        (_names.to_unsafe + _n).value = "gtk-cursor-theme-size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_cursor_theme_size)
        _n += 1
      end
      if gtk_decoration_layout
        (_names.to_unsafe + _n).value = "gtk-decoration-layout".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_decoration_layout)
        _n += 1
      end
      if gtk_dialogs_use_header
        (_names.to_unsafe + _n).value = "gtk-dialogs-use-header".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_dialogs_use_header)
        _n += 1
      end
      if gtk_dnd_drag_threshold
        (_names.to_unsafe + _n).value = "gtk-dnd-drag-threshold".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_dnd_drag_threshold)
        _n += 1
      end
      if gtk_double_click_distance
        (_names.to_unsafe + _n).value = "gtk-double-click-distance".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_double_click_distance)
        _n += 1
      end
      if gtk_double_click_time
        (_names.to_unsafe + _n).value = "gtk-double-click-time".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_double_click_time)
        _n += 1
      end
      if gtk_enable_accels
        (_names.to_unsafe + _n).value = "gtk-enable-accels".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_enable_accels)
        _n += 1
      end
      if gtk_enable_animations
        (_names.to_unsafe + _n).value = "gtk-enable-animations".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_enable_animations)
        _n += 1
      end
      if gtk_enable_event_sounds
        (_names.to_unsafe + _n).value = "gtk-enable-event-sounds".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_enable_event_sounds)
        _n += 1
      end
      if gtk_enable_input_feedback_sounds
        (_names.to_unsafe + _n).value = "gtk-enable-input-feedback-sounds".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_enable_input_feedback_sounds)
        _n += 1
      end
      if gtk_enable_primary_paste
        (_names.to_unsafe + _n).value = "gtk-enable-primary-paste".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_enable_primary_paste)
        _n += 1
      end
      if gtk_entry_password_hint_timeout
        (_names.to_unsafe + _n).value = "gtk-entry-password-hint-timeout".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_entry_password_hint_timeout)
        _n += 1
      end
      if gtk_entry_select_on_focus
        (_names.to_unsafe + _n).value = "gtk-entry-select-on-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_entry_select_on_focus)
        _n += 1
      end
      if gtk_error_bell
        (_names.to_unsafe + _n).value = "gtk-error-bell".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_error_bell)
        _n += 1
      end
      if gtk_font_name
        (_names.to_unsafe + _n).value = "gtk-font-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_font_name)
        _n += 1
      end
      if gtk_fontconfig_timestamp
        (_names.to_unsafe + _n).value = "gtk-fontconfig-timestamp".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_fontconfig_timestamp)
        _n += 1
      end
      if gtk_icon_theme_name
        (_names.to_unsafe + _n).value = "gtk-icon-theme-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_icon_theme_name)
        _n += 1
      end
      if gtk_im_module
        (_names.to_unsafe + _n).value = "gtk-im-module".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_im_module)
        _n += 1
      end
      if gtk_keynav_use_caret
        (_names.to_unsafe + _n).value = "gtk-keynav-use-caret".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_keynav_use_caret)
        _n += 1
      end
      if gtk_label_select_on_focus
        (_names.to_unsafe + _n).value = "gtk-label-select-on-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_label_select_on_focus)
        _n += 1
      end
      if gtk_long_press_time
        (_names.to_unsafe + _n).value = "gtk-long-press-time".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_long_press_time)
        _n += 1
      end
      if gtk_overlay_scrolling
        (_names.to_unsafe + _n).value = "gtk-overlay-scrolling".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_overlay_scrolling)
        _n += 1
      end
      if gtk_primary_button_warps_slider
        (_names.to_unsafe + _n).value = "gtk-primary-button-warps-slider".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_primary_button_warps_slider)
        _n += 1
      end
      if gtk_print_backends
        (_names.to_unsafe + _n).value = "gtk-print-backends".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_print_backends)
        _n += 1
      end
      if gtk_print_preview_command
        (_names.to_unsafe + _n).value = "gtk-print-preview-command".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_print_preview_command)
        _n += 1
      end
      if gtk_recent_files_enabled
        (_names.to_unsafe + _n).value = "gtk-recent-files-enabled".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_recent_files_enabled)
        _n += 1
      end
      if gtk_recent_files_max_age
        (_names.to_unsafe + _n).value = "gtk-recent-files-max-age".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_recent_files_max_age)
        _n += 1
      end
      if gtk_shell_shows_app_menu
        (_names.to_unsafe + _n).value = "gtk-shell-shows-app-menu".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_shell_shows_app_menu)
        _n += 1
      end
      if gtk_shell_shows_desktop
        (_names.to_unsafe + _n).value = "gtk-shell-shows-desktop".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_shell_shows_desktop)
        _n += 1
      end
      if gtk_shell_shows_menubar
        (_names.to_unsafe + _n).value = "gtk-shell-shows-menubar".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_shell_shows_menubar)
        _n += 1
      end
      if gtk_sound_theme_name
        (_names.to_unsafe + _n).value = "gtk-sound-theme-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_sound_theme_name)
        _n += 1
      end
      if gtk_split_cursor
        (_names.to_unsafe + _n).value = "gtk-split-cursor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_split_cursor)
        _n += 1
      end
      if gtk_theme_name
        (_names.to_unsafe + _n).value = "gtk-theme-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_theme_name)
        _n += 1
      end
      if gtk_titlebar_double_click
        (_names.to_unsafe + _n).value = "gtk-titlebar-double-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_titlebar_double_click)
        _n += 1
      end
      if gtk_titlebar_middle_click
        (_names.to_unsafe + _n).value = "gtk-titlebar-middle-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_titlebar_middle_click)
        _n += 1
      end
      if gtk_titlebar_right_click
        (_names.to_unsafe + _n).value = "gtk-titlebar-right-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_titlebar_right_click)
        _n += 1
      end
      if gtk_xft_antialias
        (_names.to_unsafe + _n).value = "gtk-xft-antialias".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_xft_antialias)
        _n += 1
      end
      if gtk_xft_dpi
        (_names.to_unsafe + _n).value = "gtk-xft-dpi".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_xft_dpi)
        _n += 1
      end
      if gtk_xft_hinting
        (_names.to_unsafe + _n).value = "gtk-xft-hinting".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_xft_hinting)
        _n += 1
      end
      if gtk_xft_hintstyle
        (_names.to_unsafe + _n).value = "gtk-xft-hintstyle".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_xft_hintstyle)
        _n += 1
      end
      if gtk_xft_rgba
        (_names.to_unsafe + _n).value = "gtk-xft-rgba".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gtk_xft_rgba)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Settings.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_settings_get_type
    end

    def self.default : Gtk::Settings?
      # gtk_settings_get_default: (None)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_settings_get_default
      Gtk::Settings.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def self.for_display(display : Gdk::Display) : Gtk::Settings
      # gtk_settings_get_for_display: (None)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_settings_get_for_display(display)
      Gtk::Settings.new(_retval, GICrystal::Transfer::None)
    end

    def reset_property(name : ::String) : Nil
      # gtk_settings_reset_property: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_settings_reset_property(self, name)
    end
  end
end
