require "../g_object-2.0/object"

module Gtk
  # A `GtkPrinter` object represents a printer.
  #
  # You only need to deal directly with printers if you use the
  # non-portable `Gtk#PrintUnixDialog` API.
  #
  # A `GtkPrinter` allows to get status information about the printer,
  # such as its description, its location, the number of queued jobs,
  # etc. Most importantly, a `GtkPrinter` object can be used to create
  # a `Gtk#PrintJob` object, which lets you print to the printer.
  @[GObject::GeneratedWrapper]
  class Printer < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::Printer), instance_init, 0)
    end

    GICrystal.define_new_method(Printer, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Printer`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accepting_jobs : Bool? = nil, accepts_pdf : Bool? = nil, accepts_ps : Bool? = nil, icon_name : ::String? = nil, is_virtual : Bool? = nil, job_count : Int32? = nil, location : ::String? = nil, name : ::String? = nil, paused : Bool? = nil, state_message : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[10]
      _values = StaticArray(LibGObject::Value, 10).new(LibGObject::Value.new)
      _n = 0

      if !accepting_jobs.nil?
        (_names.to_unsafe + _n).value = "accepting-jobs".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accepting_jobs)
        _n += 1
      end
      if !accepts_pdf.nil?
        (_names.to_unsafe + _n).value = "accepts-pdf".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accepts_pdf)
        _n += 1
      end
      if !accepts_ps.nil?
        (_names.to_unsafe + _n).value = "accepts-ps".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accepts_ps)
        _n += 1
      end
      if !icon_name.nil?
        (_names.to_unsafe + _n).value = "icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_name)
        _n += 1
      end
      if !is_virtual.nil?
        (_names.to_unsafe + _n).value = "is-virtual".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_virtual)
        _n += 1
      end
      if !job_count.nil?
        (_names.to_unsafe + _n).value = "job-count".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, job_count)
        _n += 1
      end
      if !location.nil?
        (_names.to_unsafe + _n).value = "location".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, location)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !paused.nil?
        (_names.to_unsafe + _n).value = "paused".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, paused)
        _n += 1
      end
      if !state_message.nil?
        (_names.to_unsafe + _n).value = "state-message".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, state_message)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Printer.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_printer_get_type
    end

    def accepting_jobs? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "accepting-jobs", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def accepts_pdf=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "accepts-pdf", unsafe_value, Pointer(Void).null)
      value
    end

    def accepts_pdf? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "accepts-pdf", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def accepts_ps=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "accepts-ps", unsafe_value, Pointer(Void).null)
      value
    end

    def accepts_ps? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "accepts-ps", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def icon_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "icon-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def is_virtual=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "is-virtual", unsafe_value, Pointer(Void).null)
      value
    end

    def is_virtual? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-virtual", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def job_count : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "job-count", pointerof(value), Pointer(Void).null)
      value
    end

    def location : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "location", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "name", unsafe_value, Pointer(Void).null)
      value
    end

    def name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def paused? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "paused", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def state_message : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "state-message", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Creates a new `GtkPrinter`.
    def initialize(name : ::String, backend : Gtk::PrintBackend, virtual_ : Bool)
      # gtk_printer_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_printer_new(name, backend, virtual_)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns whether the printer accepts input in
    # PDF format.
    def accepts_pdf : Bool
      # gtk_printer_accepts_pdf: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_printer_accepts_pdf(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the printer accepts input in
    # PostScript format.
    def accepts_ps : Bool
      # gtk_printer_accepts_ps: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_printer_accepts_ps(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Compares two printers.
    def compare(b : Gtk::Printer) : Int32
      # gtk_printer_compare: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_printer_compare(@pointer, b)

      # Return value handling

      _retval
    end

    # Returns the backend of the printer.
    def backend : Gtk::PrintBackend
      # gtk_printer_get_backend: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_printer_get_backend(@pointer)

      # Return value handling

      Gtk::PrintBackend.new(_retval, GICrystal::Transfer::None)
    end

    # Returns the printer’s capabilities.
    #
    # This is useful when you’re using `GtkPrintUnixDialog`’s
    # manual-capabilities setting and need to know which settings
    # the printer can handle and which you must handle yourself.
    #
    # This will return 0 unless the printer’s details are
    # available, see `Gtk::Printer#has_details` and
    # `Gtk::Printer#request_details`.
    def capabilities : Gtk::PrintCapabilities
      # gtk_printer_get_capabilities: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_printer_get_capabilities(@pointer)

      # Return value handling

      Gtk::PrintCapabilities.new(_retval)
    end

    # Returns default page size of @printer.
    def default_page_size : Gtk::PageSetup
      # gtk_printer_get_default_page_size: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_printer_get_default_page_size(@pointer)

      # Return value handling

      Gtk::PageSetup.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the description of the printer.
    def description : ::String
      # gtk_printer_get_description: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_printer_get_description(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Retrieve the hard margins of @printer.
    #
    # These are the margins that define the area at the borders
    # of the paper that the printer cannot print to.
    #
    # Note: This will not succeed unless the printer’s details are
    # available, see `Gtk::Printer#has_details` and
    # `Gtk::Printer#request_details`.
    def hard_margins(top : Float64, bottom : Float64, left : Float64, right : Float64) : Bool
      # gtk_printer_get_hard_margins: (Method)
      # @top: (out) (transfer full)
      # @bottom: (out) (transfer full)
      # @left: (out) (transfer full)
      # @right: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_printer_get_hard_margins(@pointer, top, bottom, left, right)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieve the hard margins of @printer for @paper_size.
    #
    # These are the margins that define the area at the borders
    # of the paper that the printer cannot print to.
    #
    # Note: This will not succeed unless the printer’s details are
    # available, see `Gtk::Printer#has_details` and
    # `Gtk::Printer#request_details`.
    def hard_margins_for_paper_size(paper_size : Gtk::PaperSize, top : Float64, bottom : Float64, left : Float64, right : Float64) : Bool
      # gtk_printer_get_hard_margins_for_paper_size: (Method)
      # @top: (out) (transfer full)
      # @bottom: (out) (transfer full)
      # @left: (out) (transfer full)
      # @right: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_printer_get_hard_margins_for_paper_size(@pointer, paper_size, top, bottom, left, right)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the name of the icon to use for the printer.
    def icon_name : ::String
      # gtk_printer_get_icon_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_printer_get_icon_name(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the number of jobs currently queued on the printer.
    def job_count : Int32
      # gtk_printer_get_job_count: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_printer_get_job_count(@pointer)

      # Return value handling

      _retval
    end

    # Returns a description of the location of the printer.
    def location : ::String
      # gtk_printer_get_location: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_printer_get_location(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Returns the name of the printer.
    def name : ::String
      # gtk_printer_get_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_printer_get_name(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Returns the state message describing the current state
    # of the printer.
    def state_message : ::String
      # gtk_printer_get_state_message: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_printer_get_state_message(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Returns whether the printer details are available.
    def has_details : Bool
      # gtk_printer_has_details: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_printer_has_details(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the printer is accepting jobs
    def is_accepting_jobs : Bool
      # gtk_printer_is_accepting_jobs: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_printer_is_accepting_jobs(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the printer is currently active (i.e.
    # accepts new jobs).
    def is_active : Bool
      # gtk_printer_is_active: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_printer_is_active(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the printer is the default printer.
    def is_default : Bool
      # gtk_printer_is_default: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_printer_is_default(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the printer is currently paused.
    #
    # A paused printer still accepts jobs, but it is not
    # printing them.
    def is_paused : Bool
      # gtk_printer_is_paused: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_printer_is_paused(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the printer is virtual (i.e. does not
    # represent actual printer hardware, but something like
    # a CUPS class).
    def is_virtual : Bool
      # gtk_printer_is_virtual: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_printer_is_virtual(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Lists all the paper sizes @printer supports.
    #
    # This will return and empty list unless the printer’s details
    # are available, see `Gtk::Printer#has_details` and
    # `Gtk::Printer#request_details`.
    def list_papers : GLib::List
      # gtk_printer_list_papers: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_printer_list_papers(@pointer)

      # Return value handling

      GLib::List(Gtk::PageSetup).new(_retval, GICrystal::Transfer::Full)
    end

    # Requests the printer details.
    #
    # When the details are available, the
    # [signal@Gtk.Printer::details-acquired] signal
    # will be emitted on @printer.
    def request_details : Nil
      # gtk_printer_request_details: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_printer_request_details(@pointer)

      # Return value handling
    end

    # Emitted in response to a request for detailed information
    # about a printer from the print backend.
    #
    # The @success parameter indicates if the information was
    # actually obtained.
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

      def connect(handler : Proc(Bool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_success : LibC::Int, _lib_box : Pointer(Void)) {
          success = lib_success
          ::Box(Proc(Bool, Nil)).unbox(_lib_box).call(success)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Bool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_success : LibC::Int, _lib_box : Pointer(Void)) {
          success = lib_success
          ::Box(Proc(Bool, Nil)).unbox(_lib_box).call(success)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::Printer, Bool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_success : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::Printer.new(_lib_sender, GICrystal::Transfer::None)
          success = lib_success
          ::Box(Proc(Gtk::Printer, Bool, Nil)).unbox(_lib_box).call(_sender, success)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::Printer, Bool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_success : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::Printer.new(_lib_sender, GICrystal::Transfer::None)
          success = lib_success
          ::Box(Proc(Gtk::Printer, Bool, Nil)).unbox(_lib_box).call(_sender, success)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
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
