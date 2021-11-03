require "./native_dialog"
require "./file_chooser"

module Gtk
  # `GtkFileChooserNative` is an abstraction of a dialog suitable
  # for use with “File Open” or “File Save as” commands.
  #
  # By default, this just uses a `GtkFileChooserDialog` to implement
  # the actual dialog. However, on some platforms, such as Windows and
  # macOS, the native platform file chooser is used instead. When the
  # application is running in a sandboxed environment without direct
  # filesystem access (such as Flatpak), `GtkFileChooserNative` may call
  # the proper APIs (portals) to let the user choose a file and make it
  # available to the application.
  #
  # While the API of `GtkFileChooserNative` closely mirrors `GtkFileChooserDialog`,
  # the main difference is that there is no access to any `GtkWindow` or `GtkWidget`
  # for the dialog. This is required, as there may not be one in the case of a
  # platform native dialog.
  #
  # Showing, hiding and running the dialog is handled by the
  # [class@Gtk.NativeDialog] functions.
  #
  # Note that unlike `GtkFileChooserDialog`, `GtkFileChooserNative` objects
  # are not toplevel widgets, and GTK does not keep them alive. It is your
  # responsibility to keep a reference until you are done with the
  # object.
  #
  # ## Typical usage
  #
  # In the simplest of cases, you can the following code to use
  # `GtkFileChooserNative` to select a file for opening:
  #
  # ```c
  # static void
  # on_response (GtkNativeDialog *native,
  #              int              response)
  # {
  #   if (response == GTK_RESPONSE_ACCEPT)
  #     {
  #       GtkFileChooser *chooser = GTK_FILE_CHOOSER (native);
  #       GFile *file = gtk_file_chooser_get_file (chooser);
  #
  #       open_file (file);
  #
  #       g_object_unref (file);
  #     }
  #
  #   g_object_unref (native);
  # }
  #
  #   // ...
  #   GtkFileChooserNative *native;
  #   GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_OPEN;
  #
  #   native = gtk_file_chooser_native_new ("Open File",
  #                                         parent_window,
  #                                         action,
  #                                         "_Open",
  #                                         "_Cancel");
  #
  #   g_signal_connect (native, "response", G_CALLBACK (on_response), NULL);
  #   gtk_native_dialog_show (GTK_NATIVE_DIALOG (native));
  # ```
  #
  # To use a `GtkFileChooserNative` for saving, you can use this:
  #
  # ```c
  # static void
  # on_response (GtkNativeDialog *native,
  #              int              response)
  # {
  #   if (response == GTK_RESPONSE_ACCEPT)
  #     {
  #       GtkFileChooser *chooser = GTK_FILE_CHOOSER (native);
  #       GFile *file = gtk_file_chooser_get_file (chooser);
  #
  #       save_to_file (file);
  #
  #       g_object_unref (file);
  #     }
  #
  #   g_object_unref (native);
  # }
  #
  #   // ...
  #   GtkFileChooserNative *native;
  #   GtkFileChooser *chooser;
  #   GtkFileChooserAction action = GTK_FILE_CHOOSER_ACTION_SAVE;
  #
  #   native = gtk_file_chooser_native_new ("Save File",
  #                                         parent_window,
  #                                         action,
  #                                         "_Save",
  #                                         "_Cancel");
  #   chooser = GTK_FILE_CHOOSER (native);
  #
  #   if (user_edited_a_new_document)
  #     gtk_file_chooser_set_current_name (chooser, _("Untitled document"));
  #   else
  #     gtk_file_chooser_set_file (chooser, existing_file, NULL);
  #
  #   g_signal_connect (native, "response", G_CALLBACK (on_response), NULL);
  #   gtk_native_dialog_show (GTK_NATIVE_DIALOG (native));
  # ```
  #
  # For more information on how to best set up a file dialog,
  # see the [class@Gtk.FileChooserDialog] documentation.
  #
  # ## Response Codes
  #
  # `GtkFileChooserNative` inherits from [class@Gtk.NativeDialog],
  # which means it will return %GTK_RESPONSE_ACCEPT if the user accepted,
  # and %GTK_RESPONSE_CANCEL if he pressed cancel. It can also return
  # %GTK_RESPONSE_DELETE_EVENT if the window was unexpectedly closed.
  #
  # ## Differences from `GtkFileChooserDialog`
  #
  # There are a few things in the [iface@Gtk.FileChooser] interface that
  # are not possible to use with `GtkFileChooserNative`, as such use would
  # prohibit the use of a native dialog.
  #
  # No operations that change the dialog work while the dialog is visible.
  # Set all the properties that are required before showing the dialog.
  #
  # ## Win32 details
  #
  # On windows the `IFileDialog` implementation (added in Windows Vista) is
  # used. It supports many of the features that `GtkFileChooser` has, but
  # there are some things it does not handle:
  #
  # * Any [class@Gtk.FileFilter] added using a mimetype
  #
  # If any of these features are used the regular `GtkFileChooserDialog`
  # will be used in place of the native one.
  #
  # ## Portal details
  #
  # When the `org.freedesktop.portal.FileChooser` portal is available on
  # the session bus, it is used to bring up an out-of-process file chooser.
  # Depending on the kind of session the application is running in, this may
  # or may not be a GTK file chooser.
  #
  # ## macOS details
  #
  # On macOS the `NSSavePanel` and `NSOpenPanel` classes are used to provide
  # native file chooser dialogs. Some features provided by `GtkFileChooser`
  # are not supported:
  #
  # * Shortcut folders.
  class FileChooserNative < NativeDialog
    include FileChooser

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accept_label : ::String? = nil, action : Gtk::FileChooserAction? = nil, cancel_label : ::String? = nil, create_folders : Bool? = nil, filter : Gtk::FileFilter? = nil, filters : Gio::ListModel? = nil, modal : Bool? = nil, select_multiple : Bool? = nil, shortcut_folders : Gio::ListModel? = nil, title : ::String? = nil, transient_for : Gtk::Window? = nil, visible : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[12]
      _values = StaticArray(LibGObject::Value, 12).new(LibGObject::Value.new)
      _n = 0

      if accept_label
        (_names.to_unsafe + _n).value = "accept-label".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accept_label)
        _n += 1
      end
      if action
        (_names.to_unsafe + _n).value = "action".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action)
        _n += 1
      end
      if cancel_label
        (_names.to_unsafe + _n).value = "cancel-label".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cancel_label)
        _n += 1
      end
      if create_folders
        (_names.to_unsafe + _n).value = "create-folders".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, create_folders)
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
      if modal
        (_names.to_unsafe + _n).value = "modal".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, modal)
        _n += 1
      end
      if select_multiple
        (_names.to_unsafe + _n).value = "select-multiple".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, select_multiple)
        _n += 1
      end
      if shortcut_folders
        (_names.to_unsafe + _n).value = "shortcut-folders".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, shortcut_folders)
        _n += 1
      end
      if title
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end
      if transient_for
        (_names.to_unsafe + _n).value = "transient-for".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transient_for)
        _n += 1
      end
      if visible
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(FileChooserNative.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_file_chooser_native_get_type
    end

    def accept_label=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "accept-label", unsafe_value, Pointer(Void).null)
      value
    end

    def accept_label : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "accept-label", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def cancel_label=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "cancel-label", unsafe_value, Pointer(Void).null)
      value
    end

    def cancel_label : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "cancel-label", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def initialize(title : ::String?, parent : Gtk::Window?, action : Gtk::FileChooserAction, accept_label : ::String?, cancel_label : ::String?)
      # gtk_file_chooser_native_new: (Constructor)
      # @title: (nullable)
      # @parent: (nullable)
      # @accept_label: (nullable)
      # @cancel_label: (nullable)
      # Returns: (transfer full)

      title = if title.nil?
                Pointer(LibC::Char).null
              else
                title.to_unsafe
              end
      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end
      accept_label = if accept_label.nil?
                       Pointer(LibC::Char).null
                     else
                       accept_label.to_unsafe
                     end
      cancel_label = if cancel_label.nil?
                       Pointer(LibC::Char).null
                     else
                       cancel_label.to_unsafe
                     end

      _retval = LibGtk.gtk_file_chooser_native_new(title, parent, action, accept_label, cancel_label)
      @pointer = _retval
    end

    def accept_label : ::String?
      # gtk_file_chooser_native_get_accept_label: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_file_chooser_native_get_accept_label(self)
      ::String.new(_retval) unless _retval.null?
    end

    def cancel_label : ::String?
      # gtk_file_chooser_native_get_cancel_label: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_file_chooser_native_get_cancel_label(self)
      ::String.new(_retval) unless _retval.null?
    end

    def accept_label=(accept_label : ::String?) : Nil
      # gtk_file_chooser_native_set_accept_label: (Method | Setter)
      # @accept_label: (nullable)
      # Returns: (transfer none)

      accept_label = if accept_label.nil?
                       Pointer(LibC::Char).null
                     else
                       accept_label.to_unsafe
                     end

      LibGtk.gtk_file_chooser_native_set_accept_label(self, accept_label)
    end

    def cancel_label=(cancel_label : ::String?) : Nil
      # gtk_file_chooser_native_set_cancel_label: (Method | Setter)
      # @cancel_label: (nullable)
      # Returns: (transfer none)

      cancel_label = if cancel_label.nil?
                       Pointer(LibC::Char).null
                     else
                       cancel_label.to_unsafe
                     end

      LibGtk.gtk_file_chooser_native_set_cancel_label(self, cancel_label)
    end
  end
end
