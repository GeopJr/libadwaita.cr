require "../g_object-2.0/object"

module Gtk
  # A `GtkPrintJob` object represents a job that is sent to a printer.
  #
  # You only need to deal directly with print jobs if you use the
  # non-portable `Gtk#PrintUnixDialog` API.
  #
  # Use `Gtk::PrintJob#surface` to obtain the cairo surface
  # onto which the pages must be drawn. Use `Gtk::PrintJob#send`
  # to send the finished job to the printer. If you don’t use cairo
  # `GtkPrintJob` also supports printing of manually generated PostScript,
  # via `Gtk::PrintJob#source_file=`.
  @[GObject::GeneratedWrapper]
  class PrintJob < GObject::Object
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(PrintJob, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `PrintJob`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, page_setup : Gtk::PageSetup? = nil, printer : Gtk::Printer? = nil, settings : Gtk::PrintSettings? = nil, title : ::String? = nil, track_print_status : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if !page_setup.nil?
        (_names.to_unsafe + _n).value = "page-setup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, page_setup)
        _n += 1
      end
      if !printer.nil?
        (_names.to_unsafe + _n).value = "printer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, printer)
        _n += 1
      end
      if !settings.nil?
        (_names.to_unsafe + _n).value = "settings".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, settings)
        _n += 1
      end
      if !title.nil?
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end
      if !track_print_status.nil?
        (_names.to_unsafe + _n).value = "track-print-status".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, track_print_status)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(PrintJob.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Creates a new `GtkPrintJob`.
    def self.new(title : ::String, printer : Gtk::Printer, settings : Gtk::PrintSettings, page_setup : Gtk::PageSetup) : self
      # gtk_print_job_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_print_job_new(title, printer, settings, page_setup)

      # Return value handling

      Gtk::PrintJob.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets whether this job is printed collated.
    def collate : Bool
      # gtk_print_job_get_collate: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_job_get_collate(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the n-up setting for this job.
    def n_up : UInt32
      # gtk_print_job_get_n_up: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_job_get_n_up(@pointer)

      # Return value handling

      _retval
    end

    # Gets the n-up layout setting for this job.
    def n_up_layout : Gtk::NumberUpLayout
      # gtk_print_job_get_n_up_layout: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_job_get_n_up_layout(@pointer)

      # Return value handling

      Gtk::NumberUpLayout.new(_retval)
    end

    # Gets the number of copies of this job.
    def num_copies : Int32
      # gtk_print_job_get_num_copies: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_job_get_num_copies(@pointer)

      # Return value handling

      _retval
    end

    # Gets the page ranges for this job.
    def page_ranges : Enumerable(Gtk::PageRange)
      # gtk_print_job_get_page_ranges: (Method)
      # @n_ranges: (out) (transfer full)
      # Returns: (transfer none) (array length=n_ranges element-type Interface)

      # Generator::OutArgUsedInReturnPlan
      n_ranges = 0
      # C call
      _retval = LibGtk.gtk_print_job_get_page_ranges(@pointer, pointerof(n_ranges))

      # Return value handling

      GICrystal.transfer_array(_retval, n_ranges, GICrystal::Transfer::None)
    end

    # Gets the `GtkPageSet` setting for this job.
    def page_set : Gtk::PageSet
      # gtk_print_job_get_page_set: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_job_get_page_set(@pointer)

      # Return value handling

      Gtk::PageSet.new(_retval)
    end

    # Gets the `GtkPrintPages` setting for this job.
    def pages : Gtk::PrintPages
      # gtk_print_job_get_pages: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_job_get_pages(@pointer)

      # Return value handling

      Gtk::PrintPages.new(_retval)
    end

    # Gets the `GtkPrinter` of the print job.
    def printer : Gtk::Printer
      # gtk_print_job_get_printer: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_job_get_printer(@pointer)

      # Return value handling

      Gtk::Printer.new(_retval, GICrystal::Transfer::None)
    end

    # Gets whether this job is printed reversed.
    def reverse : Bool
      # gtk_print_job_get_reverse: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_job_get_reverse(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether the job is printed rotated.
    def rotate : Bool
      # gtk_print_job_get_rotate: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_job_get_rotate(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the scale for this job.
    def scale : Float64
      # gtk_print_job_get_scale: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_job_get_scale(@pointer)

      # Return value handling

      _retval
    end

    # Gets the `GtkPrintSettings` of the print job.
    def settings : Gtk::PrintSettings
      # gtk_print_job_get_settings: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_job_get_settings(@pointer)

      # Return value handling

      Gtk::PrintSettings.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the status of the print job.
    def status : Gtk::PrintStatus
      # gtk_print_job_get_status: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_job_get_status(@pointer)

      # Return value handling

      Gtk::PrintStatus.new(_retval)
    end

    # Gets a cairo surface onto which the pages of
    # the print job should be rendered.
    def surface : Cairo::Surface
      # gtk_print_job_get_surface: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGtk.gtk_print_job_get_surface(@pointer, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      Cairo::Surface.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the job title.
    def title : ::String
      # gtk_print_job_get_title: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_job_get_title(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Returns whether jobs will be tracked after printing.
    #
    # For details, see `Gtk::PrintJob#track_print_status=`.
    def track_print_status : Bool
      # gtk_print_job_get_track_print_status: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_job_get_track_print_status(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sends the print job off to the printer.
    def send(callback : Gtk::PrintJobCompleteFunc) : Nil
      # gtk_print_job_send: (Method)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if callback
        _box = ::Box.box(callback)
        callback = ->(lib_print_job : Pointer(Void), lib_user_data : Pointer(Void), lib_error : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          print_job = Gtk::PrintJob.new(lib_print_job, :none)
          # Generator::NullableArrayPlan
          user_data = (lib_user_data.null? ? nil : lib_user_data)
          ::Box(Proc(Gtk::PrintJob, Pointer(Void)?, Nil)).unbox(lib_error).call(print_job, user_data)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        dnotify = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        callback = user_data = dnotify = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_print_job_send(@pointer, callback, user_data, dnotify)

      # Return value handling
    end

    # Sets whether this job is printed collated.
    def collate=(collate : Bool) : Nil
      # gtk_print_job_set_collate: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_job_set_collate(@pointer, collate)

      # Return value handling
    end

    # Sets the n-up setting for this job.
    def n_up=(n_up : UInt32) : Nil
      # gtk_print_job_set_n_up: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_job_set_n_up(@pointer, n_up)

      # Return value handling
    end

    # Sets the n-up layout setting for this job.
    def n_up_layout=(layout : Gtk::NumberUpLayout) : Nil
      # gtk_print_job_set_n_up_layout: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_job_set_n_up_layout(@pointer, layout)

      # Return value handling
    end

    # Sets the number of copies for this job.
    def num_copies=(num_copies : Int32) : Nil
      # gtk_print_job_set_num_copies: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_job_set_num_copies(@pointer, num_copies)

      # Return value handling
    end

    # Sets the page ranges for this job.
    def page_ranges=(ranges : Enumerable(Gtk::PageRange)) : Nil
      # gtk_print_job_set_page_ranges: (Method)
      # @ranges: (transfer full) (array length=n_ranges element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_ranges = ranges.size # Generator::ArrayArgPlan
      ranges = ranges.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_print_job_set_page_ranges(@pointer, ranges, n_ranges)

      # Return value handling
    end

    # Sets the `GtkPageSet` setting for this job.
    def page_set=(page_set : Gtk::PageSet) : Nil
      # gtk_print_job_set_page_set: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_job_set_page_set(@pointer, page_set)

      # Return value handling
    end

    # Sets the `GtkPrintPages` setting for this job.
    def pages=(pages : Gtk::PrintPages) : Nil
      # gtk_print_job_set_pages: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_job_set_pages(@pointer, pages)

      # Return value handling
    end

    # Sets whether this job is printed reversed.
    def reverse=(reverse : Bool) : Nil
      # gtk_print_job_set_reverse: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_job_set_reverse(@pointer, reverse)

      # Return value handling
    end

    # Sets whether this job is printed rotated.
    def rotate=(rotate : Bool) : Nil
      # gtk_print_job_set_rotate: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_job_set_rotate(@pointer, rotate)

      # Return value handling
    end

    # Sets the scale for this job.
    #
    # 1.0 means unscaled.
    def scale=(scale : Float64) : Nil
      # gtk_print_job_set_scale: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_job_set_scale(@pointer, scale)

      # Return value handling
    end

    # Make the `GtkPrintJob` send an existing document to the
    # printing system.
    #
    # The file can be in any format understood by the platforms
    # printing system (typically PostScript, but on many platforms
    # PDF may work too). See `Gtk::Printer#accepts_pdf` and
    # `Gtk::Printer#accepts_ps`.
    #
    # This is similar to `Gtk::PrintJob#source_file=`,
    # but takes expects an open file descriptor for the file,
    # instead of a filename.
    def source_fd=(fd : Int32) : Bool
      # gtk_print_job_set_source_fd: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGtk.gtk_print_job_set_source_fd(@pointer, fd, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Make the `GtkPrintJob` send an existing document to the
    # printing system.
    #
    # The file can be in any format understood by the platforms
    # printing system (typically PostScript, but on many platforms
    # PDF may work too). See `Gtk::Printer#accepts_pdf` and
    # `Gtk::Printer#accepts_ps`.
    def source_file=(filename : ::String) : Bool
      # gtk_print_job_set_source_file: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGtk.gtk_print_job_set_source_file(@pointer, filename, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # If track_status is %TRUE, the print job will try to continue report
    # on the status of the print job in the printer queues and printer.
    #
    # This can allow your application to show things like “out of paper”
    # issues, and when the print job actually reaches the printer.
    #
    # This function is often implemented using some form of polling,
    # so it should not be enabled unless needed.
    def track_print_status=(track_status : Bool) : Nil
      # gtk_print_job_set_track_print_status: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_job_set_track_print_status(@pointer, track_status)

      # Return value handling
    end

    # Emitted when the status of a job changes.
    #
    # The signal handler can use `Gtk::PrintJob#status`
    # to obtain the new status.
    struct StatusChangedSignal < GObject::Signal
      def name : String
        @detail ? "status-changed::#{@detail}" : "status-changed"
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

      def connect(handler : Proc(Gtk::PrintJob, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::PrintJob.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::PrintJob, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
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
