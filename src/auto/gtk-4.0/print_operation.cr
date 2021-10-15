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
  # uses its own, see [class@Gtk.PrintUnixDialog].
  #
  # The typical way to use the high-level printing API is to create
  # a `GtkPrintOperation` object with [ctor@Gtk.PrintOperation.new]
  # when the user selects to print. Then you set some properties on it,
  # e.g. the page size, any [class@Gtk.PrintSettings] from previous print
  # operations, the number of pages, the current page, etc.
  #
  # Then you start the print operation by calling [method@Gtk.PrintOperation.run].
  # It will then show a dialog, let the user select a printer and options.
  # When the user finished the dialog, various signals will be emitted on
  # the `GtkPrintOperation`, the main one being
  # [signal@Gtk.PrintOperation::draw-page], which you are supposed to handle
  # and render the page on the provided [class@Gtk.PrintContext] using Cairo.
  #
  # # The high-level printing API
  #
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
  # [method@Gtk.PrintOperationPreview.render_page],
  # [method@Gtk.PrintOperationPreview.end_preview] and
  # [method@Gtk.PrintOperationPreview.is_selected]
  # are useful when implementing a print preview.
  class PrintOperation < GObject::Object
    include PrintOperationPreview

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, allow_async : Bool? = nil, current_page : Int32? = nil, custom_tab_label : ::String? = nil, default_page_setup : Gtk::PageSetup? = nil, embed_page_setup : Bool? = nil, export_filename : ::String? = nil, has_selection : Bool? = nil, job_name : ::String? = nil, n_pages : Int32? = nil, n_pages_to_print : Int32? = nil, print_settings : Gtk::PrintSettings? = nil, show_progress : Bool? = nil, status : Gtk::PrintStatus? = nil, status_string : ::String? = nil, support_selection : Bool? = nil, track_print_status : Bool? = nil, unit : Gtk::Unit? = nil, use_full_page : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[18]
      _values = StaticArray(LibGObject::Value, 18).new(LibGObject::Value.new)
      _n = 0

      if allow_async
        (_names.to_unsafe + _n).value = "allow-async".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allow_async)
        _n += 1
      end
      if current_page
        (_names.to_unsafe + _n).value = "current-page".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, current_page)
        _n += 1
      end
      if custom_tab_label
        (_names.to_unsafe + _n).value = "custom-tab-label".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, custom_tab_label)
        _n += 1
      end
      if default_page_setup
        (_names.to_unsafe + _n).value = "default-page-setup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_page_setup)
        _n += 1
      end
      if embed_page_setup
        (_names.to_unsafe + _n).value = "embed-page-setup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, embed_page_setup)
        _n += 1
      end
      if export_filename
        (_names.to_unsafe + _n).value = "export-filename".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, export_filename)
        _n += 1
      end
      if has_selection
        (_names.to_unsafe + _n).value = "has-selection".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_selection)
        _n += 1
      end
      if job_name
        (_names.to_unsafe + _n).value = "job-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, job_name)
        _n += 1
      end
      if n_pages
        (_names.to_unsafe + _n).value = "n-pages".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, n_pages)
        _n += 1
      end
      if n_pages_to_print
        (_names.to_unsafe + _n).value = "n-pages-to-print".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, n_pages_to_print)
        _n += 1
      end
      if print_settings
        (_names.to_unsafe + _n).value = "print-settings".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, print_settings)
        _n += 1
      end
      if show_progress
        (_names.to_unsafe + _n).value = "show-progress".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_progress)
        _n += 1
      end
      if status
        (_names.to_unsafe + _n).value = "status".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, status)
        _n += 1
      end
      if status_string
        (_names.to_unsafe + _n).value = "status-string".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, status_string)
        _n += 1
      end
      if support_selection
        (_names.to_unsafe + _n).value = "support-selection".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, support_selection)
        _n += 1
      end
      if track_print_status
        (_names.to_unsafe + _n).value = "track-print-status".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, track_print_status)
        _n += 1
      end
      if unit
        (_names.to_unsafe + _n).value = "unit".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, unit)
        _n += 1
      end
      if use_full_page
        (_names.to_unsafe + _n).value = "use-full-page".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_full_page)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(PrintOperation.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_print_operation_get_type
    end

    def initialize
      # gtk_print_operation_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_print_operation_new
      @pointer = _retval
    end

    def cancel : Nil
      # gtk_print_operation_cancel: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_operation_cancel(self)
    end

    def draw_page_finish : Nil
      # gtk_print_operation_draw_page_finish: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_operation_draw_page_finish(self)
    end

    def default_page_setup : Gtk::PageSetup
      # gtk_print_operation_get_default_page_setup: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_operation_get_default_page_setup(self)
      Gtk::PageSetup.new(_retval, GICrystal::Transfer::None)
    end

    def embed_page_setup? : Bool
      # gtk_print_operation_get_embed_page_setup: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_operation_get_embed_page_setup(self)
      GICrystal.to_bool(_retval)
    end

    def error : Nil
      # gtk_print_operation_get_error: (Method | Throws)
      # Returns: (transfer none)

      LibGtk.gtk_print_operation_get_error(self)
    end

    def has_selection? : Bool
      # gtk_print_operation_get_has_selection: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_operation_get_has_selection(self)
      GICrystal.to_bool(_retval)
    end

    def n_pages_to_print : Int32
      # gtk_print_operation_get_n_pages_to_print: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_operation_get_n_pages_to_print(self)
      _retval
    end

    def print_settings : Gtk::PrintSettings
      # gtk_print_operation_get_print_settings: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_operation_get_print_settings(self)
      Gtk::PrintSettings.new(_retval, GICrystal::Transfer::None)
    end

    def status : Gtk::PrintStatus
      # gtk_print_operation_get_status: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_operation_get_status(self)
      Gtk::PrintStatus.from_value(_retval)
    end

    def status_string : ::String
      # gtk_print_operation_get_status_string: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_operation_get_status_string(self)
      ::String.new(_retval)
    end

    def support_selection? : Bool
      # gtk_print_operation_get_support_selection: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_operation_get_support_selection(self)
      GICrystal.to_bool(_retval)
    end

    def is_finished : Bool
      # gtk_print_operation_is_finished: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_operation_is_finished(self)
      GICrystal.to_bool(_retval)
    end

    def run(action : Gtk::PrintOperationAction, parent : Gtk::Window?) : Gtk::PrintOperationResult
      # gtk_print_operation_run: (Method | Throws)
      # @parent: (nullable)
      # Returns: (transfer none)

      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end

      _retval = LibGtk.gtk_print_operation_run(self, action, parent)
      Gtk::PrintOperationResult.from_value(_retval)
    end

    def allow_async=(allow_async : Bool) : Nil
      # gtk_print_operation_set_allow_async: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_operation_set_allow_async(self, allow_async)
    end

    def current_page=(current_page : Int32) : Nil
      # gtk_print_operation_set_current_page: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_operation_set_current_page(self, current_page)
    end

    def custom_tab_label=(label : ::String?) : Nil
      # gtk_print_operation_set_custom_tab_label: (Method)
      # @label: (nullable)
      # Returns: (transfer none)

      label = if label.nil?
                Pointer(LibC::Char).null
              else
                label.to_unsafe
              end

      LibGtk.gtk_print_operation_set_custom_tab_label(self, label)
    end

    def default_page_setup=(default_page_setup : Gtk::PageSetup?) : Nil
      # gtk_print_operation_set_default_page_setup: (Method)
      # @default_page_setup: (nullable)
      # Returns: (transfer none)

      default_page_setup = if default_page_setup.nil?
                             Pointer(Void).null
                           else
                             default_page_setup.to_unsafe
                           end

      LibGtk.gtk_print_operation_set_default_page_setup(self, default_page_setup)
    end

    def set_defer_drawing : Nil
      # gtk_print_operation_set_defer_drawing: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_operation_set_defer_drawing(self)
    end

    def embed_page_setup=(embed : Bool) : Nil
      # gtk_print_operation_set_embed_page_setup: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_operation_set_embed_page_setup(self, embed)
    end

    def export_filename=(filename : ::String) : Nil
      # gtk_print_operation_set_export_filename: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_operation_set_export_filename(self, filename)
    end

    def has_selection=(has_selection : Bool) : Nil
      # gtk_print_operation_set_has_selection: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_operation_set_has_selection(self, has_selection)
    end

    def job_name=(job_name : ::String) : Nil
      # gtk_print_operation_set_job_name: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_operation_set_job_name(self, job_name)
    end

    def n_pages=(n_pages : Int32) : Nil
      # gtk_print_operation_set_n_pages: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_operation_set_n_pages(self, n_pages)
    end

    def print_settings=(print_settings : Gtk::PrintSettings?) : Nil
      # gtk_print_operation_set_print_settings: (Method)
      # @print_settings: (nullable)
      # Returns: (transfer none)

      print_settings = if print_settings.nil?
                         Pointer(Void).null
                       else
                         print_settings.to_unsafe
                       end

      LibGtk.gtk_print_operation_set_print_settings(self, print_settings)
    end

    def show_progress=(show_progress : Bool) : Nil
      # gtk_print_operation_set_show_progress: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_operation_set_show_progress(self, show_progress)
    end

    def support_selection=(support_selection : Bool) : Nil
      # gtk_print_operation_set_support_selection: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_operation_set_support_selection(self, support_selection)
    end

    def track_print_status=(track_status : Bool) : Nil
      # gtk_print_operation_set_track_print_status: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_operation_set_track_print_status(self, track_status)
    end

    def unit=(unit : Gtk::Unit) : Nil
      # gtk_print_operation_set_unit: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_operation_set_unit(self, unit)
    end

    def use_full_page=(full_page : Bool) : Nil
      # gtk_print_operation_set_use_full_page: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_operation_set_use_full_page(self, full_page)
    end

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
          ::Box(Proc(GObject::Object)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(GObject::Object))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(GObject::Object)).unbox(box).call.to_unsafe
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
          arg0 = Gtk::PrintOperationResult.from_value(lib_arg0)
          ::Box(Proc(Gtk::PrintOperationResult, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintOperationResult, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::PrintOperationResult.from_value(lib_arg0)
          ::Box(Proc(Gtk::PrintOperationResult, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::PrintOperation, Gtk::PrintOperationResult, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PrintOperationResult.from_value(lib_arg0)
          ::Box(Proc(Gtk::PrintOperation, Gtk::PrintOperationResult, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintOperation, Gtk::PrintOperationResult, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PrintOperationResult.from_value(lib_arg0)
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
          ::Box(Proc(Gtk::PrintContext, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintContext, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::PrintContext.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintContext, Bool)).unbox(box).call(arg0).to_unsafe
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

      def connect(&block : Proc(Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::Window, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::Window, Bool))
        connect(block)
      end

      def connect(block : Proc(Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::Window, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::PrintOperationPreview__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::PrintContext.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gtk::Window.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::Window, Bool)).unbox(box).call(arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::Window, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::PrintOperationPreview__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::PrintContext.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gtk::Window.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::Window, Bool)).unbox(box).call(arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::PrintOperation, Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::Window, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PrintOperationPreview__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::PrintContext.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gtk::Window.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintOperation, Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::Window, Bool)).unbox(box).call(sender, arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintOperation, Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::Window, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintOperation.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PrintOperationPreview__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::PrintContext.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gtk::Window.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintOperation, Gtk::PrintOperationPreview, Gtk::PrintContext, Gtk::Window, Bool)).unbox(box).call(sender, arg0, arg1, arg2).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(preview : Gtk::PrintOperationPreview, context : Gtk::PrintContext, parent : Gtk::Window) : Nil
        LibGObject.g_signal_emit_by_name(@source, "preview", preview, context, parent)
      end
    end

    def preview_signal
      PreviewSignal.new(self)
    end

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
