require "../g_object-2.0/object"

module Gtk
  # A `GtkPageSetup` object stores the page size, orientation and margins.
  #
  # The idea is that you can get one of these from the page setup dialog
  # and then pass it to the `GtkPrintOperation` when printing.
  # The benefit of splitting this out of the `GtkPrintSettings` is that
  # these affect the actual layout of the page, and thus need to be set
  # long before user prints.
  #
  # ## Margins
  #
  # The margins specified in this object are the “print margins”, i.e. the
  # parts of the page that the printer cannot print on. These are different
  # from the layout margins that a word processor uses; they are typically
  # used to determine the minimal size for the layout margins.
  #
  # To obtain a `GtkPageSetup` use [ctor@Gtk.PageSetup.new] to get the defaults,
  # or use [func@Gtk.print_run_page_setup_dialog] to show the page setup dialog
  # and receive the resulting page setup.
  #
  # ## A page setup dialog
  #
  # ```c
  # static GtkPrintSettings *settings = NULL;
  # static GtkPageSetup *page_setup = NULL;
  #
  # static void
  # do_page_setup (void)
  # {
  #   GtkPageSetup *new_page_setup;
  #
  #   if (settings == NULL)
  #     settings = gtk_print_settings_new ();
  #
  #   new_page_setup = gtk_print_run_page_setup_dialog (GTK_WINDOW (main_window),
  #                                                     page_setup, settings);
  #
  #   if (page_setup)
  #     g_object_unref (page_setup);
  #
  #   page_setup = new_page_setup;
  # }
  # ```
  class PageSetup < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_page_setup_get_type
    end

    def initialize
      # gtk_page_setup_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_page_setup_new

      # Return value handling
      @pointer = _retval
    end

    def self.new_from_file(file_name : ::String) : self
      # gtk_page_setup_new_from_file: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_page_setup_new_from_file(file_name, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?
      # Return value handling
      Gtk::PageSetup.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_gvariant(variant : _) : self
      # gtk_page_setup_new_from_gvariant: (Constructor)
      # Returns: (transfer full)

      # Handle parameters
      variant = GLib::Variant.new(variant) unless variant.is_a?(GLib::Variant)

      # C call
      _retval = LibGtk.gtk_page_setup_new_from_gvariant(variant)

      # Return value handling
      Gtk::PageSetup.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_key_file(key_file : GLib::KeyFile, group_name : ::String?) : self
      # gtk_page_setup_new_from_key_file: (Constructor | Throws)
      # @group_name: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      group_name = if group_name.nil?
                     Pointer(LibC::Char).null
                   else
                     group_name.to_unsafe
                   end

      # C call
      _retval = LibGtk.gtk_page_setup_new_from_key_file(key_file, group_name, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?
      # Return value handling
      Gtk::PageSetup.new(_retval, GICrystal::Transfer::Full)
    end

    def copy : Gtk::PageSetup
      # gtk_page_setup_copy: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_page_setup_copy(self)

      # Return value handling
      Gtk::PageSetup.new(_retval, GICrystal::Transfer::Full)
    end

    def bottom_margin(unit : Gtk::Unit) : Float64
      # gtk_page_setup_get_bottom_margin: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_page_setup_get_bottom_margin(self, unit)

      # Return value handling
      _retval
    end

    def left_margin(unit : Gtk::Unit) : Float64
      # gtk_page_setup_get_left_margin: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_page_setup_get_left_margin(self, unit)

      # Return value handling
      _retval
    end

    def orientation : Gtk::PageOrientation
      # gtk_page_setup_get_orientation: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_page_setup_get_orientation(self)

      # Return value handling
      Gtk::PageOrientation.from_value(_retval)
    end

    def page_height(unit : Gtk::Unit) : Float64
      # gtk_page_setup_get_page_height: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_page_setup_get_page_height(self, unit)

      # Return value handling
      _retval
    end

    def page_width(unit : Gtk::Unit) : Float64
      # gtk_page_setup_get_page_width: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_page_setup_get_page_width(self, unit)

      # Return value handling
      _retval
    end

    def paper_height(unit : Gtk::Unit) : Float64
      # gtk_page_setup_get_paper_height: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_page_setup_get_paper_height(self, unit)

      # Return value handling
      _retval
    end

    def paper_size : Gtk::PaperSize
      # gtk_page_setup_get_paper_size: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_page_setup_get_paper_size(self)

      # Return value handling
      Gtk::PaperSize.new(_retval, GICrystal::Transfer::None)
    end

    def paper_width(unit : Gtk::Unit) : Float64
      # gtk_page_setup_get_paper_width: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_page_setup_get_paper_width(self, unit)

      # Return value handling
      _retval
    end

    def right_margin(unit : Gtk::Unit) : Float64
      # gtk_page_setup_get_right_margin: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_page_setup_get_right_margin(self, unit)

      # Return value handling
      _retval
    end

    def top_margin(unit : Gtk::Unit) : Float64
      # gtk_page_setup_get_top_margin: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_page_setup_get_top_margin(self, unit)

      # Return value handling
      _retval
    end

    def load_file(file_name : ::String) : Bool
      # gtk_page_setup_load_file: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_page_setup_load_file(self, file_name, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def load_key_file(key_file : GLib::KeyFile, group_name : ::String?) : Bool
      # gtk_page_setup_load_key_file: (Method | Throws)
      # @group_name: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      group_name = if group_name.nil?
                     Pointer(LibC::Char).null
                   else
                     group_name.to_unsafe
                   end

      # C call
      _retval = LibGtk.gtk_page_setup_load_key_file(self, key_file, group_name, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def set_bottom_margin(margin : Float64, unit : Gtk::Unit) : Nil
      # gtk_page_setup_set_bottom_margin: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_page_setup_set_bottom_margin(self, margin, unit)

      # Return value handling
    end

    def set_left_margin(margin : Float64, unit : Gtk::Unit) : Nil
      # gtk_page_setup_set_left_margin: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_page_setup_set_left_margin(self, margin, unit)

      # Return value handling
    end

    def orientation=(orientation : Gtk::PageOrientation) : Nil
      # gtk_page_setup_set_orientation: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_page_setup_set_orientation(self, orientation)

      # Return value handling
    end

    def paper_size=(size : Gtk::PaperSize) : Nil
      # gtk_page_setup_set_paper_size: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_page_setup_set_paper_size(self, size)

      # Return value handling
    end

    def paper_size_and_default_margins=(size : Gtk::PaperSize) : Nil
      # gtk_page_setup_set_paper_size_and_default_margins: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_page_setup_set_paper_size_and_default_margins(self, size)

      # Return value handling
    end

    def set_right_margin(margin : Float64, unit : Gtk::Unit) : Nil
      # gtk_page_setup_set_right_margin: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_page_setup_set_right_margin(self, margin, unit)

      # Return value handling
    end

    def set_top_margin(margin : Float64, unit : Gtk::Unit) : Nil
      # gtk_page_setup_set_top_margin: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_page_setup_set_top_margin(self, margin, unit)

      # Return value handling
    end

    def to_file(file_name : ::String) : Bool
      # gtk_page_setup_to_file: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_page_setup_to_file(self, file_name, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def to_gvariant : GLib::Variant
      # gtk_page_setup_to_gvariant: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_page_setup_to_gvariant(self)

      # Return value handling
      GLib::Variant.new(_retval, GICrystal::Transfer::None)
    end

    def to_key_file(key_file : GLib::KeyFile, group_name : ::String?) : Nil
      # gtk_page_setup_to_key_file: (Method)
      # @group_name: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      group_name = if group_name.nil?
                     Pointer(LibC::Char).null
                   else
                     group_name.to_unsafe
                   end

      # C call
      LibGtk.gtk_page_setup_to_key_file(self, key_file, group_name)

      # Return value handling
    end
  end
end
