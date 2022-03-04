require "../g_object-2.0/object"

module Gtk
  # A `GtkPrintJob` object represents a job that is sent to a printer.
  #
  # You only need to deal directly with print jobs if you use the
  # non-portable [class@Gtk.PrintUnixDialog] API.
  #
  # Use [method@Gtk.PrintJob.get_surface] to obtain the cairo surface
  # onto which the pages must be drawn. Use [method@Gtk.PrintJob.send]
  # to send the finished job to the printer. If you don’t use cairo
  # `GtkPrintJob` also supports printing of manually generated PostScript,
  # via [method@Gtk.PrintJob.set_source_file].
  class PrintJob < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, page_setup : Gtk::PageSetup? = nil, printer : Gtk::Printer? = nil, settings : Gtk::PrintSettings? = nil, title : ::String? = nil, track_print_status : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if page_setup
        (_names.to_unsafe + _n).value = "page-setup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, page_setup)
        _n += 1
      end
      if printer
        (_names.to_unsafe + _n).value = "printer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, printer)
        _n += 1
      end
      if settings
        (_names.to_unsafe + _n).value = "settings".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, settings)
        _n += 1
      end
      if title
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end
      if track_print_status
        (_names.to_unsafe + _n).value = "track-print-status".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, track_print_status)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(PrintJob.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_print_job_get_type
    end

    def page_setup=(value : Gtk::PageSetup?) : Gtk::PageSetup?
      unsafe_value = value

      LibGObject.g_object_set(self, "page-setup", unsafe_value, Pointer(Void).null)
      value
    end

    def page_setup : Gtk::PageSetup?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "page-setup", pointerof(value), Pointer(Void).null)
      Gtk::PageSetup.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def printer=(value : Gtk::Printer?) : Gtk::Printer?
      unsafe_value = value

      LibGObject.g_object_set(self, "printer", unsafe_value, Pointer(Void).null)
      value
    end

    def printer : Gtk::Printer?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "printer", pointerof(value), Pointer(Void).null)
      Gtk::Printer.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def settings=(value : Gtk::PrintSettings?) : Gtk::PrintSettings?
      unsafe_value = value

      LibGObject.g_object_set(self, "settings", unsafe_value, Pointer(Void).null)
      value
    end

    def settings : Gtk::PrintSettings?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "settings", pointerof(value), Pointer(Void).null)
      Gtk::PrintSettings.new(value, GICrystal::Transfer::None) unless value.null?
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

    def initialize(title : ::String, printer : Gtk::Printer, settings : Gtk::PrintSettings, page_setup : Gtk::PageSetup)
      # gtk_print_job_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_job_new(title, printer, settings, page_setup)

      # Return value handling
      @pointer = _retval
    end

    def collate : Bool
      # gtk_print_job_get_collate: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_job_get_collate(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def n_up : UInt32
      # gtk_print_job_get_n_up: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_job_get_n_up(self)

      # Return value handling
      _retval
    end

    def n_up_layout : Gtk::NumberUpLayout
      # gtk_print_job_get_n_up_layout: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_job_get_n_up_layout(self)

      # Return value handling
      Gtk::NumberUpLayout.from_value(_retval)
    end

    def num_copies : Int32
      # gtk_print_job_get_num_copies: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_job_get_num_copies(self)

      # Return value handling
      _retval
    end

    def page_ranges : Enumerable(Gtk::PageRange)
      # gtk_print_job_get_page_ranges: (Method)
      # @n_ranges: (out) (transfer full)
      # Returns: (transfer none) (array length=n_ranges element-type Interface)

      # Handle parameters
      n_ranges = 0

      # C call
      _retval = LibGtk.gtk_print_job_get_page_ranges(self, pointerof(n_ranges))

      # Return value handling
      GICrystal.transfer_array(_retval, n_ranges, GICrystal::Transfer::None)
    end

    def page_set : Gtk::PageSet
      # gtk_print_job_get_page_set: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_job_get_page_set(self)

      # Return value handling
      Gtk::PageSet.from_value(_retval)
    end

    def pages : Gtk::PrintPages
      # gtk_print_job_get_pages: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_job_get_pages(self)

      # Return value handling
      Gtk::PrintPages.from_value(_retval)
    end

    def printer : Gtk::Printer
      # gtk_print_job_get_printer: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_job_get_printer(self)

      # Return value handling
      Gtk::Printer.new(_retval, GICrystal::Transfer::None)
    end

    def reverse : Bool
      # gtk_print_job_get_reverse: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_job_get_reverse(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def rotate : Bool
      # gtk_print_job_get_rotate: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_job_get_rotate(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def scale : Float64
      # gtk_print_job_get_scale: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_job_get_scale(self)

      # Return value handling
      _retval
    end

    def settings : Gtk::PrintSettings
      # gtk_print_job_get_settings: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_job_get_settings(self)

      # Return value handling
      Gtk::PrintSettings.new(_retval, GICrystal::Transfer::None)
    end

    def status : Gtk::PrintStatus
      # gtk_print_job_get_status: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_job_get_status(self)

      # Return value handling
      Gtk::PrintStatus.from_value(_retval)
    end

    def surface : Cairo::Surface
      # gtk_print_job_get_surface: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_job_get_surface(self, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?
      # Return value handling
      Cairo::Surface.new(_retval, GICrystal::Transfer::None)
    end

    def title : ::String
      # gtk_print_job_get_title: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_job_get_title(self)

      # Return value handling
      ::String.new(_retval)
    end

    def track_print_status : Bool
      # gtk_print_job_get_track_print_status: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_job_get_track_print_status(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def send(callback : Pointer(Void), user_data : Pointer(Void)?, dnotify : Pointer(Void)) : Nil
      # gtk_print_job_send: (Method)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGtk.gtk_print_job_send(self, callback, user_data, dnotify)

      # Return value handling
    end

    def collate=(collate : Bool) : Nil
      # gtk_print_job_set_collate: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_job_set_collate(self, collate)

      # Return value handling
    end

    def n_up=(n_up : UInt32) : Nil
      # gtk_print_job_set_n_up: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_job_set_n_up(self, n_up)

      # Return value handling
    end

    def n_up_layout=(layout : Gtk::NumberUpLayout) : Nil
      # gtk_print_job_set_n_up_layout: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_job_set_n_up_layout(self, layout)

      # Return value handling
    end

    def num_copies=(num_copies : Int32) : Nil
      # gtk_print_job_set_num_copies: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_job_set_num_copies(self, num_copies)

      # Return value handling
    end

    def set_page_ranges(ranges : Enumerable(Gtk::PageRange)) : Nil
      # gtk_print_job_set_page_ranges: (Method)
      # @ranges: (transfer full) (array length=n_ranges element-type Interface)
      # Returns: (transfer none)

      # Handle parameters
      n_ranges = ranges.size
      ranges = ranges.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_print_job_set_page_ranges(self, ranges, n_ranges)

      # Return value handling
    end

    def set_page_ranges(*ranges : Gtk::PageRange)
      set_page_ranges(ranges)
    end

    def page_set=(page_set : Gtk::PageSet) : Nil
      # gtk_print_job_set_page_set: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_job_set_page_set(self, page_set)

      # Return value handling
    end

    def pages=(pages : Gtk::PrintPages) : Nil
      # gtk_print_job_set_pages: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_job_set_pages(self, pages)

      # Return value handling
    end

    def reverse=(reverse : Bool) : Nil
      # gtk_print_job_set_reverse: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_job_set_reverse(self, reverse)

      # Return value handling
    end

    def rotate=(rotate : Bool) : Nil
      # gtk_print_job_set_rotate: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_job_set_rotate(self, rotate)

      # Return value handling
    end

    def scale=(scale : Float64) : Nil
      # gtk_print_job_set_scale: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_job_set_scale(self, scale)

      # Return value handling
    end

    def source_fd=(fd : Int32) : Bool
      # gtk_print_job_set_source_fd: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_job_set_source_fd(self, fd, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def source_file=(filename : ::String) : Bool
      # gtk_print_job_set_source_file: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_job_set_source_file(self, filename, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def track_print_status=(track_status : Bool) : Nil
      # gtk_print_job_set_track_print_status: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_job_set_track_print_status(self, track_status)

      # Return value handling
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

      def connect(block : Proc(Gtk::PrintJob, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintJob.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintJob, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PrintJob, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::PrintJob.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintJob, Nil)).unbox(box).call(sender)
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
  end
end
