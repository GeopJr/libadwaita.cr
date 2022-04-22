require "../g_object-2.0/object"
require "./print_operation_preview"

module Gtk
  # `GtkPrintOperation` is the high-level, portable printing API.
  #
  # It looks a bit different than other GTK dialogs such as the
  # `GtkFileChooser`, since some platforms don’t expose enough
  # infrastructure to implement a good print dialog. On such
  # platforms, `GtkPrintOperation` uses the native print dialog.
  # On platforms which do not provide a native print dialog, GTK
  # uses its own, see `Gtk#PrintUnixDialog`.
  #
  # The typical way to use the high-level printing API is to create
  # a `GtkPrintOperation` object with `Gtk::PrintOperation.new`
  # when the user selects to print. Then you set some properties on it,
  # e.g. the page size, any `Gtk#PrintSettings` from previous print
  # operations, the number of pages, the current page, etc.
  #
  # Then you start the print operation by calling `Gtk::PrintOperation#run`.
  # It will then show a dialog, let the user select a printer and options.
  # When the user finished the dialog, various signals will be emitted on
  # the `GtkPrintOperation`, the main one being
  # [signal@Gtk.PrintOperation::draw-page], which you are supposed to handle
  # and render the page on the provided `Gtk#PrintContext` using Cairo.
  #
  # # The high-level printing API
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # static GtkPrintSettings *settings = NULL;
  #
  # static void
  # do_print (void)
  # {
  #   GtkPrintOperation *print;
  #   GtkPrintOperationResult res;
  #
  #   print = gtk_print_operation_new ();
  #
  #   if (settings != NULL)
  #     gtk_print_operation_set_print_settings (print, settings);
  #
  #   g_signal_connect (print, "begin_print", G_CALLBACK (begin_print), NULL);
  #   g_signal_connect (print, "draw_page", G_CALLBACK (draw_page), NULL);
  #
  #   res = gtk_print_operation_run (print, GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG,
  #                                  GTK_WINDOW (main_window), NULL);
  #
  #   if (res == GTK_PRINT_OPERATION_RESULT_APPLY)
  #     {
  #       if (settings != NULL)
  #         g_object_unref (settings);
  #       settings = g_object_ref (gtk_print_operation_get_print_settings (print));
  #     }
  #
  #   g_object_unref (print);
  # }
  # ```
  #
  # By default `GtkPrintOperation` uses an external application to do
  # print preview. To implement a custom print preview, an application
  # must connect to the preview signal. The functions
  # `Gtk::PrintOperationPreview#render_page`,
  # `Gtk::PrintOperationPreview#end_preview` and
  # `Gtk::PrintOperationPreview#is_selected?`
  # are useful when implementing a print preview.
  @[GObject::GeneratedWrapper]
  class PrintOperation < GObject::Object
    include PrintOperationPreview

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::PrintOperationClass), class_init,
        sizeof(LibGtk::PrintOperation), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, allow_async : Bool? = nil, current_page : Int32? = nil, custom_tab_label : ::String? = nil, default_page_setup : Gtk::PageSetup? = nil, embed_page_setup : Bool? = nil, export_filename : ::String? = nil, has_selection : Bool? = nil, job_name : ::String? = nil, n_pages : Int32? = nil, n_pages_to_print : Int32? = nil, print_settings : Gtk::PrintSettings? = nil, show_progress : Bool? = nil, status : Gtk::PrintStatus? = nil, status_string : ::String? = nil, support_selection : Bool? = nil, track_print_status : Bool? = nil, unit : Gtk::Unit? = nil, use_full_page : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[18]
      _values = StaticArray(LibGObject::Value, 18).new(LibGObject::Value.new)
      _n = 0

      if !allow_async.nil?
        (_names.to_unsafe + _n).value = "allow-async".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allow_async)
        _n += 1
      end
      if !current_page.nil?
        (_names.to_unsafe + _n).value = "current-page".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, current_page)
        _n += 1
      end
      if !custom_tab_label.nil?
        (_names.to_unsafe + _n).value = "custom-tab-label".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, custom_tab_label)
        _n += 1
      end
      if !default_page_setup.nil?
        (_names.to_unsafe + _n).value = "default-page-setup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_page_setup)
        _n += 1
      end
      if !embed_page_setup.nil?
        (_names.to_unsafe + _n).value = "embed-page-setup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, embed_page_setup)
        _n += 1
      end
      if !export_filename.nil?
        (_names.to_unsafe + _n).value = "export-filename".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, export_filename)
        _n += 1
      end
      if !has_selection.nil?
        (_names.to_unsafe + _n).value = "has-selection".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_selection)
        _n += 1
      end
      if !job_name.nil?
        (_names.to_unsafe + _n).value = "job-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, job_name)
        _n += 1
      end
      if !n_pages.nil?
        (_names.to_unsafe + _n).value = "n-pages".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, n_pages)
        _n += 1
      end
      if !n_pages_to_print.nil?
        (_names.to_unsafe + _n).value = "n-pages-to-print".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, n_pages_to_print)
        _n += 1
      end
      if !print_settings.nil?
        (_names.to_unsafe + _n).value = "print-settings".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, print_settings)
        _n += 1
      end
      if !show_progress.nil?
        (_names.to_unsafe + _n).value = "show-progress".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_progress)
        _n += 1
      end
      if !status.nil?
        (_names.to_unsafe + _n).value = "status".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, status)
        _n += 1
      end
      if !status_string.nil?
        (_names.to_unsafe + _n).value = "status-string".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, status_string)
        _n += 1
      end
      if !support_selection.nil?
        (_names.to_unsafe + _n).value = "support-selection".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, support_selection)
        _n += 1
      end
      if !track_print_status.nil?
        (_names.to_unsafe + _n).value = "track-print-status".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, track_print_status)
        _n += 1
      end
      if !unit.nil?
        (_names.to_unsafe + _n).value = "unit".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, unit)
        _n += 1
      end
      if !use_full_page.nil?
        (_names.to_unsafe + _n).value = "use-full-page".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_full_page)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(PrintOperation.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_print_operation_get_type
    end

    def allow_async=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "allow-async", unsafe_value, Pointer(Void).null)
      value
    end

    def allow_async? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "allow-async", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def current_page=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "current-page", unsafe_value, Pointer(Void).null)
      value
    end

    def current_page : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "current-page", pointerof(value), Pointer(Void).null)
      value
    end

    def custom_tab_label=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "custom-tab-label", unsafe_value, Pointer(Void).null)
      value
    end

    def custom_tab_label : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "custom-tab-label", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def default_page_setup=(value : Gtk::PageSetup?) : Gtk::PageSetup?
      unsafe_value = value

      LibGObject.g_object_set(self, "default-page-setup", unsafe_value, Pointer(Void).null)
      value
    end

    def default_page_setup : Gtk::PageSetup?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "default-page-setup", pointerof(value), Pointer(Void).null)
      Gtk::PageSetup.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def embed_page_setup=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "embed-page-setup", unsafe_value, Pointer(Void).null)
      value
    end

    def embed_page_setup? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "embed-page-setup", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def export_filename=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "export-filename", unsafe_value, Pointer(Void).null)
      value
    end

    def export_filename : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "export-filename", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def has_selection=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "has-selection", unsafe_value, Pointer(Void).null)
      value
    end

    def has_selection? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "has-selection", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def job_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "job-name", unsafe_value, Pointer(Void).null)
      value
    end

    def job_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "job-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def n_pages=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "n-pages", unsafe_value, Pointer(Void).null)
      value
    end

    def n_pages : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "n-pages", pointerof(value), Pointer(Void).null)
      value
    end

    def n_pages_to_print : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "n-pages-to-print", pointerof(value), Pointer(Void).null)
      value
    end

    def print_settings=(value : Gtk::PrintSettings?) : Gtk::PrintSettings?
      unsafe_value = value

      LibGObject.g_object_set(self, "print-settings", unsafe_value, Pointer(Void).null)
      value
    end

    def print_settings : Gtk::PrintSettings?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "print-settings", pointerof(value), Pointer(Void).null)
      Gtk::PrintSettings.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def show_progress=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-progress", unsafe_value, Pointer(Void).null)
      value
    end

    def show_progress? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-progress", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def status : Gtk::PrintStatus
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "status", pointerof(value), Pointer(Void).null)
      Gtk::PrintStatus.new(value)
    end

    def status_string : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "status-string", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def support_selection=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "support-selection", unsafe_value, Pointer(Void).null)
      value
    end

    def support_selection? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "support-selection", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def track_print_status=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "track-print-status", unsafe_value, Pointer(Void).null)
      value
    end

    def track_print_status? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "track-print-status", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def unit=(value : Gtk::Unit) : Gtk::Unit
      unsafe_value = value

      LibGObject.g_object_set(self, "unit", unsafe_value, Pointer(Void).null)
      value
    end

    def unit : Gtk::Unit
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "unit", pointerof(value), Pointer(Void).null)
      Gtk::Unit.new(value)
    end

    def use_full_page=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "use-full-page", unsafe_value, Pointer(Void).null)
      value
    end

    def use_full_page? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "use-full-page", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a new `GtkPrintOperation`.
    def initialize
      # gtk_print_operation_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_print_operation_new

      # Return value handling

      @pointer = _retval
    end

    # Cancels a running print operation.
    #
    # This function may be called from a [signal@Gtk.PrintOperation::begin-print],
    # `Gtk::PrintOperation::#paginate` or [signal@Gtk.PrintOperation::draw-page]
    # signal handler to stop the currently running print operation.
    def cancel : Nil
      # gtk_print_operation_cancel: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_operation_cancel(self)

      # Return value handling
    end

    # Signal that drawing of particular page is complete.
    #
    # It is called after completion of page drawing (e.g. drawing
    # in another thread). If `Gtk::PrintOperation#defer_drawing=`
    # was called before, then this function has to be called by application.
    # Otherwise it is called by GTK itself.
    def draw_page_finish : Nil
      # gtk_print_operation_draw_page_finish: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_operation_draw_page_finish(self)

      # Return value handling
    end

    # Returns the default page setup.
    def default_page_setup : Gtk::PageSetup
      # gtk_print_operation_get_default_page_setup: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_operation_get_default_page_setup(self)

      # Return value handling

      Gtk::PageSetup.new(_retval, GICrystal::Transfer::None)
    end

    # Gets whether page setup selection combos are embedded
    def embed_page_setup : Bool
      # gtk_print_operation_get_embed_page_setup: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_operation_get_embed_page_setup(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Call this when the result of a print operation is
    # %GTK_PRINT_OPERATION_RESULT_ERROR.
    #
    # It can be called either after `Gtk::PrintOperation#run`
    # returns, or in the `Gtk::PrintOperation::#done` signal
    # handler.
    #
    # The returned `GError` will contain more details on what went wrong.
    def error : Nil
      # gtk_print_operation_get_error: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      LibGtk.gtk_print_operation_get_error(self, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling
    end

    # Gets whether there is a selection.
    def has_selection : Bool
      # gtk_print_operation_get_has_selection: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_operation_get_has_selection(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the number of pages that will be printed.
    #
    # Note that this value is set during print preparation phase
    # (%GTK_PRINT_STATUS_PREPARING), so this function should never be
    # called before the data generation phase (%GTK_PRINT_STATUS_GENERATING_DATA).
    # You can connect to the [signal@Gtk.PrintOperation::status-changed]
    # signal and call gtk_print_operation_get_n_pages_to_print() when
    # print status is %GTK_PRINT_STATUS_GENERATING_DATA.
    #
    # This is typically used to track the progress of print operation.
    def n_pages_to_print : Int32
      # gtk_print_operation_get_n_pages_to_print: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_operation_get_n_pages_to_print(self)

      # Return value handling

      _retval
    end

    # Returns the current print settings.
    #
    # Note that the return value is %NULL until either
    # `Gtk::PrintOperation#print_settings=` or
    # `Gtk::PrintOperation#run` have been called.
    def print_settings : Gtk::PrintSettings?
      # gtk_print_operation_get_print_settings: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_operation_get_print_settings(self)

      # Return value handling

      Gtk::PrintSettings.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the status of the print operation.
    #
    # Also see `Gtk::PrintOperation#status_string`.
    def status : Gtk::PrintStatus
      # gtk_print_operation_get_status: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_operation_get_status(self)

      # Return value handling

      Gtk::PrintStatus.new(_retval)
    end

    # Returns a string representation of the status of the
    # print operation.
    #
    # The string is translated and suitable for displaying
    # the print status e.g. in a `GtkStatusbar`.
    #
    # Use `Gtk::PrintOperation#status` to obtain
    # a status value that is suitable for programmatic use.
    def status_string : ::String
      # gtk_print_operation_get_status_string: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_operation_get_status_string(self)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets whether the application supports print of selection
    def support_selection : Bool
      # gtk_print_operation_get_support_selection: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_operation_get_support_selection(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # A convenience function to find out if the print operation
    # is finished.
    #
    # a print operation is finished if its status is either
    # %GTK_PRINT_STATUS_FINISHED or %GTK_PRINT_STATUS_FINISHED_ABORTED.
    #
    # Note: when you enable print status tracking the print operation
    # can be in a non-finished state even after done has been called, as
    # the operation status then tracks the print job status on the printer.
    def is_finished : Bool
      # gtk_print_operation_is_finished: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_operation_is_finished(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Runs the print operation.
    #
    # Normally that this function does not return until the rendering
    # of all pages is complete. You can connect to the
    # [signal@Gtk.PrintOperation::status-changed] signal on @op to obtain
    # some information about the progress of the print operation.
    #
    # Furthermore, it may use a recursive mainloop to show the print dialog.
    #
    # If you set the [Gtk.PrintOperation:allow-async] property, the operation
    # will run asynchronously if this is supported on the platform. The
    # `Gtk::PrintOperation::#done` signal will be emitted with the result
    # of the operation when the it is done (i.e. when the dialog is canceled,
    # or when the print succeeds or fails).
    #
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # if (settings != NULL)
    #   gtk_print_operation_set_print_settings (print, settings);
    #
    # if (page_setup != NULL)
    #   gtk_print_operation_set_default_page_setup (print, page_setup);
    #
    # g_signal_connect (print, "begin-print",
    #                   G_CALLBACK (begin_print), &data);
    # g_signal_connect (print, "draw-page",
    #                   G_CALLBACK (draw_page), &data);
    #
    # res = gtk_print_operation_run (print,
    #                                GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG,
    #                                parent,
    #                                &error);
    #
    # if (res == GTK_PRINT_OPERATION_RESULT_ERROR)
    #  {
    #    error_dialog = gtk_message_dialog_new (GTK_WINDOW (parent),
    #   			                     GTK_DIALOG_DESTROY_WITH_PARENT,
    # 					     GTK_MESSAGE_ERROR,
    # 					     GTK_BUTTONS_CLOSE,
    # 					     "Error printing file:\n%s",
    # 					     error->message);
    #    g_signal_connect (error_dialog, "response",
    #                      G_CALLBACK (gtk_window_destroy), NULL);
    #    gtk_widget_show (error_dialog);
    #    g_error_free (error);
    #  }
    # else if (res == GTK_PRINT_OPERATION_RESULT_APPLY)
    #  {
    #    if (settings != NULL)
    # g_object_unref (settings);
    #    settings = g_object_ref (gtk_print_operation_get_print_settings (print));
    #  }
    # ```
    #
    # Note that gtk_print_operation_run() can only be called once on a
    # given `GtkPrintOperation`.
    def run(action : Gtk::PrintOperationAction, parent : Gtk::Window?) : Gtk::PrintOperationResult
      # gtk_print_operation_run: (Method | Throws)
      # @parent: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end

      # C call
      _retval = LibGtk.gtk_print_operation_run(self, action, parent, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      Gtk::PrintOperationResult.new(_retval)
    end

    # Sets whether gtk_print_operation_run() may return
    # before the print operation is completed.
    #
    # Note that some platforms may not allow asynchronous
    # operation.
    def allow_async=(allow_async : Bool) : Nil
      # gtk_print_operation_set_allow_async: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_operation_set_allow_async(self, allow_async)

      # Return value handling
    end

    # Sets the current page.
    #
    # If this is called before `Gtk::PrintOperation#run`,
    # the user will be able to select to print only the current page.
    #
    # Note that this only makes sense for pre-paginated documents.
    def current_page=(current_page : Int32) : Nil
      # gtk_print_operation_set_current_page: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_operation_set_current_page(self, current_page)

      # Return value handling
    end

    # Sets the label for the tab holding custom widgets.
    def custom_tab_label=(label : ::String?) : Nil
      # gtk_print_operation_set_custom_tab_label: (Method | Setter)
      # @label: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      # C call
      LibGtk.gtk_print_operation_set_custom_tab_label(self, label)

      # Return value handling
    end

    # Makes @default_page_setup the default page setup for @op.
    #
    # This page setup will be used by `Gtk::PrintOperation#run`,
    # but it can be overridden on a per-page basis by connecting
    # to the [signal@Gtk.PrintOperation::request-page-setup] signal.
    def default_page_setup=(default_page_setup : Gtk::PageSetup?) : Nil
      # gtk_print_operation_set_default_page_setup: (Method | Setter)
      # @default_page_setup: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      default_page_setup = if default_page_setup.nil?
                             Pointer(Void).null
                           else
                             default_page_setup.to_unsafe
                           end

      # C call
      LibGtk.gtk_print_operation_set_default_page_setup(self, default_page_setup)

      # Return value handling
    end

    # Sets up the `GtkPrintOperation` to wait for calling of
    # [method@Gtk.PrintOperation.draw_page_finish from application.
    #
    # This can be used for drawing page in another thread.
    #
    # This function must be called in the callback of the
    # [signal@Gtk.PrintOperation::draw-page] signal.
    def set_defer_drawing : Nil
      # gtk_print_operation_set_defer_drawing: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_operation_set_defer_drawing(self)

      # Return value handling
    end

    # Embed page size combo box and orientation combo box into page setup page.
    #
    # Selected page setup is stored as default page setup in `GtkPrintOperation`.
    def embed_page_setup=(embed : Bool) : Nil
      # gtk_print_operation_set_embed_page_setup: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_operation_set_embed_page_setup(self, embed)

      # Return value handling
    end

    # Sets up the `GtkPrintOperation` to generate a file instead
    # of showing the print dialog.
    #
    # The intended use of this function is for implementing
    # “Export to PDF” actions. Currently, PDF is the only supported
    # format.
    #
    # “Print to PDF” support is independent of this and is done
    # by letting the user pick the “Print to PDF” item from the list
    # of printers in the print dialog.
    def export_filename=(filename : ::String) : Nil
      # gtk_print_operation_set_export_filename: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_operation_set_export_filename(self, filename)

      # Return value handling
    end

    # Sets whether there is a selection to print.
    #
    # Application has to set number of pages to which the selection
    # will draw by `Gtk::PrintOperation#n_pages=` in a handler
    # for the [signal@Gtk.PrintOperation::begin-print] signal.
    def has_selection=(has_selection : Bool) : Nil
      # gtk_print_operation_set_has_selection: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_operation_set_has_selection(self, has_selection)

      # Return value handling
    end

    # Sets the name of the print job.
    #
    # The name is used to identify the job (e.g. in monitoring
    # applications like eggcups).
    #
    # If you don’t set a job name, GTK picks a default one by
    # numbering successive print jobs.
    def job_name=(job_name : ::String) : Nil
      # gtk_print_operation_set_job_name: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_operation_set_job_name(self, job_name)

      # Return value handling
    end

    # Sets the number of pages in the document.
    #
    # This must be set to a positive number before the rendering
    # starts. It may be set in a [signal@Gtk.PrintOperation::begin-print]
    # signal handler.
    #
    # Note that the page numbers passed to the
    # [signal@Gtk.PrintOperation::request-page-setup]
    # and [signal@Gtk.PrintOperation::draw-page] signals are 0-based, i.e.
    # if the user chooses to print all pages, the last ::draw-page signal
    # will be for page @n_pages - 1.
    def n_pages=(n_pages : Int32) : Nil
      # gtk_print_operation_set_n_pages: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_operation_set_n_pages(self, n_pages)

      # Return value handling
    end

    # Sets the print settings for @op.
    #
    # This is typically used to re-establish print settings
    # from a previous print operation, see `Gtk::PrintOperation#run`.
    def print_settings=(print_settings : Gtk::PrintSettings?) : Nil
      # gtk_print_operation_set_print_settings: (Method | Setter)
      # @print_settings: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      print_settings = if print_settings.nil?
                         Pointer(Void).null
                       else
                         print_settings.to_unsafe
                       end

      # C call
      LibGtk.gtk_print_operation_set_print_settings(self, print_settings)

      # Return value handling
    end

    # If @show_progress is %TRUE, the print operation will show
    # a progress dialog during the print operation.
    def show_progress=(show_progress : Bool) : Nil
      # gtk_print_operation_set_show_progress: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_operation_set_show_progress(self, show_progress)

      # Return value handling
    end

    # Sets whether selection is supported by `GtkPrintOperation`.
    def support_selection=(support_selection : Bool) : Nil
      # gtk_print_operation_set_support_selection: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_operation_set_support_selection(self, support_selection)

      # Return value handling
    end

    # If track_status is %TRUE, the print operation will try to continue
    # report on the status of the print job in the printer queues and printer.
    #
    # This can allow your application to show things like “out of paper”
    # issues, and when the print job actually reaches the printer.
    #
    # This function is often implemented using some form of polling,
    # so it should not be enabled unless needed.
    def track_print_status=(track_status : Bool) : Nil
      # gtk_print_operation_set_track_print_status: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_operation_set_track_print_status(self, track_status)

      # Return value handling
    end

    # Sets up the transformation for the cairo context obtained from
    # `GtkPrintContext` in such a way that distances are measured in
    # units of @unit.
    def unit=(unit : Gtk::Unit) : Nil
      # gtk_print_operation_set_unit: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_operation_set_unit(self, unit)

      # Return value handling
    end

    # If @full_page is %TRUE, the transformation for the cairo context
    # obtained from `GtkPrintContext` puts the origin at the top left
    # corner of the page.
    #
    # This may not be the top left corner of the sheet, depending on page
    # orientation and the number of pages per sheet). Otherwise, the origin
    # is at the top left corner of the imageable area (i.e. inside the margins).
    def use_full_page=(full_page : Bool) : Nil
      # gtk_print_operation_set_use_full_page: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_operation_set_use_full_page(self, full_page)

      # Return value handling
    end

    # Emitted after the user has finished changing print settings
    # in the dialog, before the actual rendering starts.
    #
    # A typical use for ::begin-print is to use the parameters from the
    # `Gtk#PrintContext` and paginate the document accordingly,
    # and then set the number of pages with
    # `Gtk::PrintOperation#n_pages=`.
    struct BeginPrintSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "begin-print::#{@detail}" : "begin-print"
      end

      def connect(&block : Proc(Gtk::PrintContext, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::PrintContext, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::PrintContext, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::PrintContext.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintContext, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintContext, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::PrintContext.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintContext, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::PrintOperation, Gtk::PrintContext, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PrintContext.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintOperation, Gtk::PrintContext, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintOperation, Gtk::PrintContext, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PrintContext.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintOperation, Gtk::PrintContext, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(context : Gtk::PrintContext) : Nil
        LibGObject.g_signal_emit_by_name(@source, "begin-print", context)
      end
    end

    def begin_print_signal
      BeginPrintSignal.new(self)
    end

    # Emitted when displaying the print dialog.
    #
    # If you return a widget in a handler for this signal it will be
    # added to a custom tab in the print dialog. You typically return a
    # container widget with multiple widgets in it.
    #
    # The print dialog owns the returned widget, and its lifetime is not
    # controlled by the application. However, the widget is guaranteed
    # to stay around until the [signal@Gtk.PrintOperation::custom-widget-apply]
    # signal is emitted on the operation. Then you can read out any
    # information you need from the widgets.
    struct CreateCustomWidgetSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "create-custom-widget::#{@detail}" : "create-custom-widget"
      end

      def connect(&block : Proc(GObject::Object))
        connect(block)
      end

      def connect_after(&block : Proc(GObject::Object))
        connect(block)
      end

      def connect(block : Proc(GObject::Object))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          _retval = ::Box(Proc(GObject::Object)).unbox(box).call
          _retval.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(GObject::Object))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          _retval = ::Box(Proc(GObject::Object)).unbox(box).call
          _retval.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::PrintOperation, GObject::Object))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintOperation, GObject::Object)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintOperation, GObject::Object))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintOperation, GObject::Object)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "create-custom-widget")
      end
    end

    def create_custom_widget_signal
      CreateCustomWidgetSignal.new(self)
    end

    # Emitted right before ::begin-print if you added
    # a custom widget in the ::create-custom-widget handler.
    #
    # When you get this signal you should read the information from the
    # custom widgets, as the widgets are not guaranteed to be around at a
    # later time.
    struct CustomWidgetApplySignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "custom-widget-apply::#{@detail}" : "custom-widget-apply"
      end

      def connect(&block : Proc(Gtk::Widget, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::Widget, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::Widget, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::PrintOperation, Gtk::Widget, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintOperation, Gtk::Widget, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintOperation, Gtk::Widget, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintOperation, Gtk::Widget, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(widget : Gtk::Widget) : Nil
        LibGObject.g_signal_emit_by_name(@source, "custom-widget-apply", widget)
      end
    end

    def custom_widget_apply_signal
      CustomWidgetApplySignal.new(self)
    end

    # Emitted when the print operation run has finished doing
    # everything required for printing.
    #
    # @result gives you information about what happened during the run.
    # If @result is %GTK_PRINT_OPERATION_RESULT_ERROR then you can call
    # `Gtk::PrintOperation#error` for more information.
    #
    # If you enabled print status tracking then
    # `Gtk::PrintOperation#is_finished?` may still return %FALSE
    # after the ::done signal was emitted.
    struct DoneSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "done::#{@detail}" : "done"
      end

      def connect(&block : Proc(Gtk::PrintOperationResult, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::PrintOperationResult, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::PrintOperationResult, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::PrintOperationResult.new(lib_arg0)
          ::Box(Proc(Gtk::PrintOperationResult, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintOperationResult, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::PrintOperationResult.new(lib_arg0)
          ::Box(Proc(Gtk::PrintOperationResult, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::PrintOperation, Gtk::PrintOperationResult, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PrintOperationResult.new(lib_arg0)
          ::Box(Proc(Gtk::PrintOperation, Gtk::PrintOperationResult, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintOperation, Gtk::PrintOperationResult, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PrintOperationResult.new(lib_arg0)
          ::Box(Proc(Gtk::PrintOperation, Gtk::PrintOperationResult, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(result : Gtk::PrintOperationResult) : Nil
        LibGObject.g_signal_emit_by_name(@source, "done", result)
      end
    end

    def done_signal
      DoneSignal.new(self)
    end

    # Emitted for every page that is printed.
    #
    # The signal handler must render the @page_nr's page onto the cairo
    # context obtained from @context using
    # `Gtk::PrintContext#cairo_context`.
    #
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # static void
    # draw_page (GtkPrintOperation *operation,
    #            GtkPrintContext   *context,
    #            int                page_nr,
    #            gpointer           user_data)
    # {
    #   cairo_t *cr;
    #   PangoLayout *layout;
    #   double width, text_height;
    #   int layout_height;
    #   PangoFontDescription *desc;
    #
    #   cr = gtk_print_context_get_cairo_context (context);
    #   width = gtk_print_context_get_width (context);
    #
    #   cairo_rectangle (cr, 0, 0, width, HEADER_HEIGHT);
    #
    #   cairo_set_source_rgb (cr, 0.8, 0.8, 0.8);
    #   cairo_fill (cr);
    #
    #   layout = gtk_print_context_create_pango_layout (context);
    #
    #   desc = pango_font_description_from_string ("sans 14");
    #   pango_layout_set_font_description (layout, desc);
    #   pango_font_description_free (desc);
    #
    #   pango_layout_set_text (layout, "some text", -1);
    #   pango_layout_set_width (layout, width * PANGO_SCALE);
    #   pango_layout_set_alignment (layout, PANGO_ALIGN_CENTER);
    #
    #   pango_layout_get_size (layout, NULL, &layout_height);
    #   text_height = (double)layout_height / PANGO_SCALE;
    #
    #   cairo_move_to (cr, width / 2,  (HEADER_HEIGHT - text_height) / 2);
    #   pango_cairo_show_layout (cr, layout);
    #
    #   g_object_unref (layout);
    # }
    # ```
    #
    # Use `Gtk::PrintOperation#use_full_page=` and
    # `Gtk::PrintOperation#unit=` before starting the print
    # operation to set up the transformation of the cairo context
    # according to your needs.
    struct DrawPageSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "draw-page::#{@detail}" : "draw-page"
      end

      def connect(&block : Proc(Gtk::PrintContext, Int32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::PrintContext, Int32, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::PrintContext, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = Gtk::PrintContext.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::PrintContext, Int32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintContext, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = Gtk::PrintContext.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::PrintContext, Int32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::PrintOperation, Gtk::PrintContext, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PrintContext.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::PrintOperation, Gtk::PrintContext, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintOperation, Gtk::PrintContext, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PrintContext.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::PrintOperation, Gtk::PrintContext, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(context : Gtk::PrintContext, page_nr : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "draw-page", context, page_nr)
      end
    end

    def draw_page_signal
      DrawPageSignal.new(self)
    end

    # Emitted after all pages have been rendered.
    #
    # A handler for this signal can clean up any resources that have
    # been allocated in the [signal@Gtk.PrintOperation::begin-print] handler.
    struct EndPrintSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "end-print::#{@detail}" : "end-print"
      end

      def connect(&block : Proc(Gtk::PrintContext, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::PrintContext, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::PrintContext, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::PrintContext.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintContext, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintContext, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::PrintContext.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintContext, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::PrintOperation, Gtk::PrintContext, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PrintContext.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintOperation, Gtk::PrintContext, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintOperation, Gtk::PrintContext, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PrintContext.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintOperation, Gtk::PrintContext, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(context : Gtk::PrintContext) : Nil
        LibGObject.g_signal_emit_by_name(@source, "end-print", context)
      end
    end

    def end_print_signal
      EndPrintSignal.new(self)
    end

    # Emitted after the ::begin-print signal, but before the actual rendering
    # starts.
    #
    # It keeps getting emitted until a connected signal handler returns %TRUE.
    #
    # The ::paginate signal is intended to be used for paginating a document
    # in small chunks, to avoid blocking the user interface for a long
    # time. The signal handler should update the number of pages using
    # `Gtk::PrintOperation#n_pages=`, and return %TRUE if the document
    # has been completely paginated.
    #
    # If you don't need to do pagination in chunks, you can simply do
    # it all in the ::begin-print handler, and set the number of pages
    # from there.
    struct PaginateSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "paginate::#{@detail}" : "paginate"
      end

      def connect(&block : Proc(Gtk::PrintContext, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::PrintContext, Bool))
        connect(block)
      end

      def connect(block : Proc(Gtk::PrintContext, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::PrintContext.new(lib_arg0, GICrystal::Transfer::None)
          _retval = ::Box(Proc(Gtk::PrintContext, Bool)).unbox(box).call(arg0)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintContext, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::PrintContext.new(lib_arg0, GICrystal::Transfer::None)
          _retval = ::Box(Proc(Gtk::PrintContext, Bool)).unbox(box).call(arg0)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::PrintOperation, Gtk::PrintContext, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PrintContext.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintOperation, Gtk::PrintContext, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintOperation, Gtk::PrintContext, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PrintContext.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintOperation, Gtk::PrintContext, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(context : Gtk::PrintContext) : Nil
        LibGObject.g_signal_emit_by_name(@source, "paginate", context)
      end
    end

    def paginate_signal
      PaginateSignal.new(self)
    end

    # Gets emitted when a preview is requested from the native dialog.
    #
    # The default handler for this signal uses an external viewer
    # application to preview.
    #
    # To implement a custom print preview, an application must return
    # %TRUE from its handler for this signal. In order to use the
    # provided @context for the preview implementation, it must be
    # given a suitable cairo context with
    # `Gtk::PrintContext#cairo_context=`.
    #
    # The custom preview implementation can use
    # `Gtk::PrintOperationPreview#is_selected?` and
    # `Gtk::PrintOperationPreview#render_page` to find pages which
    # are selected for print and render them. The preview must be
    # finished by calling `Gtk::PrintOperationPreview#end_preview`
    # (typically in response to the user clicking a close button).
    struct PreviewSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "preview::#{@detail}" : "preview"
      end

      def connect(&block : Proc(Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::Window?, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::Window?, Bool))
        connect(block)
      end

      def connect(block : Proc(Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::Window?, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::PrintOperationPreview__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::PrintContext.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = (lib_arg2.null? ? nil : Gtk::Window.new(lib_arg2, GICrystal::Transfer::None))
          _retval = ::Box(Proc(Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::Window?, Bool)).unbox(box).call(arg0, arg1, arg2)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::Window?, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::PrintOperationPreview__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::PrintContext.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = (lib_arg2.null? ? nil : Gtk::Window.new(lib_arg2, GICrystal::Transfer::None))
          _retval = ::Box(Proc(Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::Window?, Bool)).unbox(box).call(arg0, arg1, arg2)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::PrintOperation, Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::Window?, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PrintOperationPreview__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::PrintContext.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = (lib_arg2.null? ? nil : Gtk::Window.new(lib_arg2, GICrystal::Transfer::None))
          ::Box(Proc(Gtk::PrintOperation, Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::Window?, Bool)).unbox(box).call(sender, arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintOperation, Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::Window?, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PrintOperationPreview__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::PrintContext.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = (lib_arg2.null? ? nil : Gtk::Window.new(lib_arg2, GICrystal::Transfer::None))
          ::Box(Proc(Gtk::PrintOperation, Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::Window?, Bool)).unbox(box).call(sender, arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(preview : Gtk::PrintOperationPreview, context : Gtk::PrintContext, parent : Gtk::Window?) : Nil
        LibGObject.g_signal_emit_by_name(@source, "preview", preview, context, parent)
      end
    end

    def preview_signal
      PreviewSignal.new(self)
    end

    # Emitted once for every page that is printed.
    #
    # This gives the application a chance to modify the page setup.
    # Any changes done to @setup will be in force only for printing
    # this page.
    struct RequestPageSetupSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "request-page-setup::#{@detail}" : "request-page-setup"
      end

      def connect(&block : Proc(Gtk::PrintContext, Int32, Gtk::PageSetup, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::PrintContext, Int32, Gtk::PageSetup, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::PrintContext, Int32, Gtk::PageSetup, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::PrintContext.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          arg2 = Gtk::PageSetup.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintContext, Int32, Gtk::PageSetup, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintContext, Int32, Gtk::PageSetup, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::PrintContext.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          arg2 = Gtk::PageSetup.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintContext, Int32, Gtk::PageSetup, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::PrintOperation, Gtk::PrintContext, Int32, Gtk::PageSetup, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PrintContext.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          arg2 = Gtk::PageSetup.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintOperation, Gtk::PrintContext, Int32, Gtk::PageSetup, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintOperation, Gtk::PrintContext, Int32, Gtk::PageSetup, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PrintContext.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          arg2 = Gtk::PageSetup.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintOperation, Gtk::PrintContext, Int32, Gtk::PageSetup, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(context : Gtk::PrintContext, page_nr : Int32, setup : Gtk::PageSetup) : Nil
        LibGObject.g_signal_emit_by_name(@source, "request-page-setup", context, page_nr, setup)
      end
    end

    def request_page_setup_signal
      RequestPageSetupSignal.new(self)
    end

    # Emitted at between the various phases of the print operation.
    #
    # See `Gtk#PrintStatus` for the phases that are being discriminated.
    # Use `Gtk::PrintOperation#status` to find out the current
    # status.
    struct StatusChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "status-changed::#{@detail}" : "status-changed"
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

      def connect(block : Proc(Gtk::PrintOperation, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintOperation, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintOperation, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintOperation, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "status-changed")
      end
    end

    def status_changed_signal
      StatusChangedSignal.new(self)
    end

    # Emitted after change of selected printer.
    #
    # The actual page setup and print settings are passed to the custom
    # widget, which can actualize itself according to this change.
    struct UpdateCustomWidgetSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "update-custom-widget::#{@detail}" : "update-custom-widget"
      end

      def connect(&block : Proc(Gtk::Widget, Gtk::PageSetup, Gtk::PrintSettings, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::Widget, Gtk::PageSetup, Gtk::PrintSettings, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::Widget, Gtk::PageSetup, Gtk::PrintSettings, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::PageSetup.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gtk::PrintSettings.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Gtk::PageSetup, Gtk::PrintSettings, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, Gtk::PageSetup, Gtk::PrintSettings, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::PageSetup.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gtk::PrintSettings.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Gtk::PageSetup, Gtk::PrintSettings, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::PrintOperation, Gtk::Widget, Gtk::PageSetup, Gtk::PrintSettings, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::PageSetup.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gtk::PrintSettings.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintOperation, Gtk::Widget, Gtk::PageSetup, Gtk::PrintSettings, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintOperation, Gtk::Widget, Gtk::PageSetup, Gtk::PrintSettings, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::PageSetup.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gtk::PrintSettings.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintOperation, Gtk::Widget, Gtk::PageSetup, Gtk::PrintSettings, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(widget : Gtk::Widget, setup : Gtk::PageSetup, settings : Gtk::PrintSettings) : Nil
        LibGObject.g_signal_emit_by_name(@source, "update-custom-widget", widget, setup, settings)
      end
    end

    def update_custom_widget_signal
      UpdateCustomWidgetSignal.new(self)
    end
  end
end
