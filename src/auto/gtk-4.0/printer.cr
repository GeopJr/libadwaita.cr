require "../g_object-2.0/object"

module Gtk
  # A `GtkPrinter` object represents a printer.
  #
  # You only need to deal directly with printers if you use the
  # non-portable [class@Gtk.PrintUnixDialog] API.
  #
  # A `GtkPrinter` allows to get status information about the printer,
  # such as its description, its location, the number of queued jobs,
  # etc. Most importantly, a `GtkPrinter` object can be used to create
  # a [class@Gtk.PrintJob] object, which lets you print to the printer.
  class Printer < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accepting_jobs : Bool? = nil, accepts_pdf : Bool? = nil, accepts_ps : Bool? = nil, icon_name : ::String? = nil, is_virtual : Bool? = nil, job_count : Int32? = nil, location : ::String? = nil, name : ::String? = nil, paused : Bool? = nil, state_message : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[10]
      _values = StaticArray(LibGObject::Value, 10).new(LibGObject::Value.new)
      _n = 0

      if accepting_jobs
        (_names.to_unsafe + _n).value = "accepting-jobs".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accepting_jobs)
        _n += 1
      end
      if accepts_pdf
        (_names.to_unsafe + _n).value = "accepts-pdf".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accepts_pdf)
        _n += 1
      end
      if accepts_ps
        (_names.to_unsafe + _n).value = "accepts-ps".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accepts_ps)
        _n += 1
      end
      if icon_name
        (_names.to_unsafe + _n).value = "icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_name)
        _n += 1
      end
      if is_virtual
        (_names.to_unsafe + _n).value = "is-virtual".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_virtual)
        _n += 1
      end
      if job_count
        (_names.to_unsafe + _n).value = "job-count".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, job_count)
        _n += 1
      end
      if location
        (_names.to_unsafe + _n).value = "location".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, location)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if paused
        (_names.to_unsafe + _n).value = "paused".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, paused)
        _n += 1
      end
      if state_message
        (_names.to_unsafe + _n).value = "state-message".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, state_message)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Printer.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_printer_get_type
    end

    def accepts_pdf=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "accepts-pdf", unsafe_value, Pointer(Void).null)
      value
    end

    def accepts_ps=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "accepts-ps", unsafe_value, Pointer(Void).null)
      value
    end

    def is_virtual=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "is-virtual", unsafe_value, Pointer(Void).null)
      value
    end

    def name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "name", unsafe_value, Pointer(Void).null)
      value
    end

    def initialize(name : ::String, backend : Gtk::PrintBackend, virtual_ : Bool)
      # gtk_printer_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_printer_new(name, backend, virtual_)
      @pointer = _retval
    end

    def accepts_pdf : Bool
      # gtk_printer_accepts_pdf: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_printer_accepts_pdf(self)
      GICrystal.to_bool(_retval)
    end

    def accepts_ps : Bool
      # gtk_printer_accepts_ps: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_printer_accepts_ps(self)
      GICrystal.to_bool(_retval)
    end

    def compare(b : Gtk::Printer) : Int32
      # gtk_printer_compare: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_printer_compare(self, b)
      _retval
    end

    def backend : Gtk::PrintBackend
      # gtk_printer_get_backend: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_printer_get_backend(self)
      Gtk::PrintBackend.new(_retval, GICrystal::Transfer::None)
    end

    def capabilities : Gtk::PrintCapabilities
      # gtk_printer_get_capabilities: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_printer_get_capabilities(self)
      Gtk::PrintCapabilities.from_value(_retval)
    end

    def default_page_size : Gtk::PageSetup
      # gtk_printer_get_default_page_size: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_printer_get_default_page_size(self)
      Gtk::PageSetup.new(_retval, GICrystal::Transfer::Full)
    end

    def description : ::String
      # gtk_printer_get_description: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_printer_get_description(self)
      ::String.new(_retval)
    end

    def hard_margins(top : Float64, bottom : Float64, left : Float64, right : Float64) : Bool
      # gtk_printer_get_hard_margins: (Method)
      # @top: (out) (transfer full)
      # @bottom: (out) (transfer full)
      # @left: (out) (transfer full)
      # @right: (out) (transfer full)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_printer_get_hard_margins(self, top, bottom, left, right)
      GICrystal.to_bool(_retval)
    end

    def hard_margins_for_paper_size(paper_size : Gtk::PaperSize, top : Float64, bottom : Float64, left : Float64, right : Float64) : Bool
      # gtk_printer_get_hard_margins_for_paper_size: (Method)
      # @top: (out) (transfer full)
      # @bottom: (out) (transfer full)
      # @left: (out) (transfer full)
      # @right: (out) (transfer full)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_printer_get_hard_margins_for_paper_size(self, paper_size, top, bottom, left, right)
      GICrystal.to_bool(_retval)
    end

    def icon_name : ::String
      # gtk_printer_get_icon_name: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_printer_get_icon_name(self)
      ::String.new(_retval)
    end

    def job_count : Int32
      # gtk_printer_get_job_count: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_printer_get_job_count(self)
      _retval
    end

    def location : ::String
      # gtk_printer_get_location: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_printer_get_location(self)
      ::String.new(_retval)
    end

    def name : ::String
      # gtk_printer_get_name: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_printer_get_name(self)
      ::String.new(_retval)
    end

    def state_message : ::String
      # gtk_printer_get_state_message: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_printer_get_state_message(self)
      ::String.new(_retval)
    end

    def has_details : Bool
      # gtk_printer_has_details: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_printer_has_details(self)
      GICrystal.to_bool(_retval)
    end

    def is_accepting_jobs : Bool
      # gtk_printer_is_accepting_jobs: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_printer_is_accepting_jobs(self)
      GICrystal.to_bool(_retval)
    end

    def is_active : Bool
      # gtk_printer_is_active: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_printer_is_active(self)
      GICrystal.to_bool(_retval)
    end

    def is_default : Bool
      # gtk_printer_is_default: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_printer_is_default(self)
      GICrystal.to_bool(_retval)
    end

    def is_paused : Bool
      # gtk_printer_is_paused: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_printer_is_paused(self)
      GICrystal.to_bool(_retval)
    end

    def is_virtual : Bool
      # gtk_printer_is_virtual: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_printer_is_virtual(self)
      GICrystal.to_bool(_retval)
    end

    def list_papers : GLib::List
      # gtk_printer_list_papers: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_printer_list_papers(self)
      GLib::List(Gtk::PageSetup).new(_retval, GICrystal::Transfer::Full)
    end

    def request_details : Nil
      # gtk_printer_request_details: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_printer_request_details(self)
    end

    struct DetailsAcquiredSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "details-acquired::#{@detail}" : "details-acquired"
      end

      def connect(&block : Proc(Bool, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Bool, Nil))
        connect(block)
      end

      def connect(block : Proc(Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Bool, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Bool, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Printer, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::Printer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Gtk::Printer, Bool, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Printer, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::Printer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Gtk::Printer, Bool, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(success : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "details-acquired", success)
      end
    end

    def details_acquired_signal
      DetailsAcquiredSignal.new(self)
    end
  end
end
