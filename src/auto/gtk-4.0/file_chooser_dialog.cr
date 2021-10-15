require "./dialog"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./file_chooser"

require "./native"

require "./root"

require "./shortcut_manager"

module Gtk
  # `GtkFileChooserDialog` is a dialog suitable for use with
  # “File Open” or “File Save” commands.
  #
  # ![An example GtkFileChooserDialog](filechooser.png)
  #
  # This widget works by putting a [class@Gtk.FileChooserWidget]
  # inside a [class@Gtk.Dialog]. It exposes the [iface@Gtk.FileChooser]
  # interface, so you can use all of the [iface@Gtk.FileChooser] functions
  # on the file chooser dialog as well as those for [class@Gtk.Dialog].
  #
  # Note that `GtkFileChooserDialog` does not have any methods of its
  # own. Instead, you should use the functions that work on a
  # [iface@Gtk.FileChooser].
  #
  # If you want to integrate well with the platform you should use the
  # [class@Gtk.FileChooserNative] API, which will use a platform-specific
  # dialog if available and fall back to `GtkFileChooserDialog`
  # otherwise.
  #
  # ## Typical usage
  #
  # In the simplest of cases, you can the following code to use
  # `GtkFileChooserDialog` to select a file for opening:
  #
  # ```c
  # static void
  # on_open_response (GtkDialog *dialog,
  #                   int        response)
  # {
  #   if (response == GTK_RESPONSE_ACCEPT)
  #     {
  #       GtkFileChooser *chooser = GTK_FILE_CHOOSER (dialog);
  #
  #       g_autoptr(GFile) file = gtk_file_chooser_get_file (chooser);
  #
  #       open_file (file);
  #     }
  #
  #   gtk_window_destroy (GTK_WINDOW (dialog));
  # }
  #
  #   // ...
  #   GtkWidget *dialog;
  #   GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_OPEN;
  #
  #   dialog = gtk_file_chooser_dialog_new ("Open File",
  #                                         parent_window,
  #                                         action,
  #                                         _("_Cancel"),
  #                                         GTK_RESPONSE_CANCEL,
  #                                         _("_Open"),
  #                                         GTK_RESPONSE_ACCEPT,
  #                                         NULL);
  #
  #   gtk_widget_show (dialog);
  #
  #   g_signal_connect (dialog, "response",
  #                     G_CALLBACK (on_open_response),
  #                     NULL);
  # ```
  #
  # To use a dialog for saving, you can use this:
  #
  # ```c
  # static void
  # on_save_response (GtkDialog *dialog,
  #                   int        response)
  # {
  #   if (response == GTK_RESPONSE_ACCEPT)
  #     {
  #       GtkFileChooser *chooser = GTK_FILE_CHOOSER (dialog);
  #
  #       g_autoptr(GFile) file = gtk_file_chooser_get_file (chooser);
  #
  #       save_to_file (file);
  #     }
  #
  #   gtk_window_destroy (GTK_WINDOW (dialog));
  # }
  #
  #   // ...
  #   GtkWidget *dialog;
  #   GtkFileChooser *chooser;
  #   GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_SAVE;
  #
  #   dialog = gtk_file_chooser_dialog_new ("Save File",
  #                                         parent_window,
  #                                         action,
  #                                         _("_Cancel"),
  #                                         GTK_RESPONSE_CANCEL,
  #                                         _("_Save"),
  #                                         GTK_RESPONSE_ACCEPT,
  #                                         NULL);
  #   chooser = GTK_FILE_CHOOSER (dialog);
  #
  #   if (user_edited_a_new_document)
  #     gtk_file_chooser_set_current_name (chooser, _("Untitled document"));
  #   else
  #     gtk_file_chooser_set_file (chooser, existing_filename);
  #
  #   gtk_widget_show (dialog);
  #
  #   g_signal_connect (dialog, "response",
  #                     G_CALLBACK (on_save_response),
  #                     NULL);
  # ```
  #
  # ## Setting up a file chooser dialog
  #
  # There are various cases in which you may need to use a `GtkFileChooserDialog`:
  #
  # - To select a file for opening, use %GTK_FILE_CHOOSER_ACTION_OPEN.
  #
  # - To save a file for the first time, use %GTK_FILE_CHOOSER_ACTION_SAVE,
  #   and suggest a name such as “Untitled” with
  #   [method@Gtk.FileChooser.set_current_name].
  #
  # - To save a file under a different name, use %GTK_FILE_CHOOSER_ACTION_SAVE,
  #   and set the existing file with [method@Gtk.FileChooser.set_file].
  #
  # - To choose a folder instead of a filem use %GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER.
  #
  # In general, you should only cause the file chooser to show a specific
  # folder when it is appropriate to use [method@Gtk.FileChooser.set_file],
  # i.e. when you are doing a “Save As” command and you already have a file
  # saved somewhere.
  #
  # ## Response Codes
  #
  # `GtkFileChooserDialog` inherits from [class@Gtk.Dialog], so buttons that
  # go in its action area have response codes such as %GTK_RESPONSE_ACCEPT and
  # %GTK_RESPONSE_CANCEL. For example, you could call
  # [ctor@Gtk.FileChooserDialog.new] as follows:
  #
  # ```c
  # GtkWidget *dialog;
  # GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_OPEN;
  #
  # dialog = gtk_file_chooser_dialog_new ("Open File",
  #                                       parent_window,
  #                                       action,
  #                                       _("_Cancel"),
  #                                       GTK_RESPONSE_CANCEL,
  #                                       _("_Open"),
  #                                       GTK_RESPONSE_ACCEPT,
  #                                       NULL);
  # ```
  #
  # This will create buttons for “Cancel” and “Open” that use predefined
  # response identifiers from [enum@Gtk.ResponseType].  For most dialog
  # boxes you can use your own custom response codes rather than the
  # ones in [enum@Gtk.ResponseType], but `GtkFileChooserDialog` assumes that
  # its “accept”-type action, e.g. an “Open” or “Save” button,
  # will have one of the following response codes:
  #
  # - %GTK_RESPONSE_ACCEPT
  # - %GTK_RESPONSE_OK
  # - %GTK_RESPONSE_YES
  # - %GTK_RESPONSE_APPLY
  #
  # This is because `GtkFileChooserDialog` must intercept responses and switch
  # to folders if appropriate, rather than letting the dialog terminate — the
  # implementation uses these known response codes to know which responses can
  # be blocked if appropriate.
  #
  # To summarize, make sure you use a predefined response code
  # when you use `GtkFileChooserDialog` to ensure proper operation.
  class FileChooserDialog < Dialog
    include Accessible
    include Buildable
    include ConstraintTarget
    include FileChooser
    include Native
    include Root
    include ShortcutManager

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, action : Gtk::FileChooserAction? = nil, application : Gtk::Application? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, create_folders : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, decorated : Bool? = nil, default_height : Int32? = nil, default_widget : Gtk::Widget? = nil, default_width : Int32? = nil, deletable : Bool? = nil, destroy_with_parent : Bool? = nil, display : Gdk::Display? = nil, filter : Gtk::FileFilter? = nil, filters : Gio::ListModel? = nil, focus_on_click : Bool? = nil, focus_visible : Bool? = nil, focus_widget : Gtk::Widget? = nil, focusable : Bool? = nil, fullscreened : Bool? = nil, halign : Gtk::Align? = nil, handle_menubar_accel : Bool? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hide_on_close : Bool? = nil, icon_name : ::String? = nil, is_active : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, maximized : Bool? = nil, mnemonics_visible : Bool? = nil, modal : Bool? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, resizable : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, select_multiple : Bool? = nil, sensitive : Bool? = nil, shortcut_folders : Gio::ListModel? = nil, startup_id : ::String? = nil, title : ::String? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, transient_for : Gtk::Window? = nil, use_header_bar : Int32? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[65]
      _values = StaticArray(LibGObject::Value, 65).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if action
        (_names.to_unsafe + _n).value = "action".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action)
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
      if create_folders
        (_names.to_unsafe + _n).value = "create-folders".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, create_folders)
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
      if filter
        (_names.to_unsafe + _n).value = "filter".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, filter)
        _n += 1
      end
      if filters
        (_names.to_unsafe + _n).value = "filters".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, filters)
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
      if select_multiple
        (_names.to_unsafe + _n).value = "select-multiple".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, select_multiple)
        _n += 1
      end
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if shortcut_folders
        (_names.to_unsafe + _n).value = "shortcut-folders".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, shortcut_folders)
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
      if use_header_bar
        (_names.to_unsafe + _n).value = "use-header-bar".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_header_bar)
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

      @pointer = LibGObject.g_object_new_with_properties(FileChooserDialog.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_file_chooser_dialog_get_type
    end
  end
end
