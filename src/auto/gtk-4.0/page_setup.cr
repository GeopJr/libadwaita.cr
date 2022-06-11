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
  # To obtain a `GtkPageSetup` use `Gtk::PageSetup.new` to get the defaults,
  # or use `Gtk#print_run_page_setup_dialog` to show the page setup dialog
  # and receive the resulting page setup.
  #
  # ## A page setup dialog
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
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
  @[GObject::GeneratedWrapper]
  class PageSetup < GObject::Object
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(PageSetup, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `PageSetup`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_page_setup_get_type
    end

    # Reads the page setup from the file @file_name.
    #
    # Returns a new `GtkPageSetup` object with the restored
    # page setup, or %NULL if an error occurred.
    # See `Gtk::PageSetup#to_file`.
    def self.new_from_file(file_name : ::String) : self
      # gtk_page_setup_new_from_file: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGtk.gtk_page_setup_new_from_file(file_name, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      Gtk::PageSetup.new(_retval, GICrystal::Transfer::Full)
    end

    # Desrialize a page setup from an a{sv} variant.
    #
    # The variant must be in the format produced by
    # `Gtk::PageSetup#to_gvariant`.
    def self.new_from_gvariant(variant : _) : self
      # gtk_page_setup_new_from_gvariant: (Constructor)
      # Returns: (transfer full)

      # Generator::HandmadeArgPlan
      variant = if !variant.is_a?(GLib::Variant)
                  GLib::Variant.new(variant).to_unsafe
                else
                  variant.to_unsafe
                end

      # C call
      _retval = LibGtk.gtk_page_setup_new_from_gvariant(variant)

      # Return value handling

      Gtk::PageSetup.new(_retval, GICrystal::Transfer::Full)
    end

    # Reads the page setup from the group @group_name in the key file
    # @key_file.
    #
    # Returns a new `GtkPageSetup` object with the restored
    # page setup, or %NULL if an error occurred.
    def self.new_from_key_file(key_file : GLib::KeyFile, group_name : ::String?) : self
      # gtk_page_setup_new_from_key_file: (Constructor | Throws)
      # @group_name: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
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

    # Copies a `GtkPageSetup`.
    def copy : Gtk::PageSetup
      # gtk_page_setup_copy: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_page_setup_copy(@pointer)

      # Return value handling

      Gtk::PageSetup.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the bottom margin in units of @unit.
    def bottom_margin(unit : Gtk::Unit) : Float64
      # gtk_page_setup_get_bottom_margin: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_page_setup_get_bottom_margin(@pointer, unit)

      # Return value handling

      _retval
    end

    # Gets the left margin in units of @unit.
    def left_margin(unit : Gtk::Unit) : Float64
      # gtk_page_setup_get_left_margin: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_page_setup_get_left_margin(@pointer, unit)

      # Return value handling

      _retval
    end

    # Gets the page orientation of the `GtkPageSetup`.
    def orientation : Gtk::PageOrientation
      # gtk_page_setup_get_orientation: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_page_setup_get_orientation(@pointer)

      # Return value handling

      Gtk::PageOrientation.new(_retval)
    end

    # Returns the page height in units of @unit.
    #
    # Note that this function takes orientation
    # and margins into consideration.
    # See `Gtk::PageSetup#paper_height`.
    def page_height(unit : Gtk::Unit) : Float64
      # gtk_page_setup_get_page_height: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_page_setup_get_page_height(@pointer, unit)

      # Return value handling

      _retval
    end

    # Returns the page width in units of @unit.
    #
    # Note that this function takes orientation
    # and margins into consideration.
    # See `Gtk::PageSetup#paper_width`.
    def page_width(unit : Gtk::Unit) : Float64
      # gtk_page_setup_get_page_width: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_page_setup_get_page_width(@pointer, unit)

      # Return value handling

      _retval
    end

    # Returns the paper height in units of @unit.
    #
    # Note that this function takes orientation,
    # but not margins into consideration.
    # See `Gtk::PageSetup#page_height`.
    def paper_height(unit : Gtk::Unit) : Float64
      # gtk_page_setup_get_paper_height: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_page_setup_get_paper_height(@pointer, unit)

      # Return value handling

      _retval
    end

    # Gets the paper size of the `GtkPageSetup`.
    def paper_size : Gtk::PaperSize
      # gtk_page_setup_get_paper_size: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_page_setup_get_paper_size(@pointer)

      # Return value handling

      Gtk::PaperSize.new(_retval, GICrystal::Transfer::None)
    end

    # Returns the paper width in units of @unit.
    #
    # Note that this function takes orientation,
    # but not margins into consideration.
    # See `Gtk::PageSetup#page_width`.
    def paper_width(unit : Gtk::Unit) : Float64
      # gtk_page_setup_get_paper_width: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_page_setup_get_paper_width(@pointer, unit)

      # Return value handling

      _retval
    end

    # Gets the right margin in units of @unit.
    def right_margin(unit : Gtk::Unit) : Float64
      # gtk_page_setup_get_right_margin: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_page_setup_get_right_margin(@pointer, unit)

      # Return value handling

      _retval
    end

    # Gets the top margin in units of @unit.
    def top_margin(unit : Gtk::Unit) : Float64
      # gtk_page_setup_get_top_margin: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_page_setup_get_top_margin(@pointer, unit)

      # Return value handling

      _retval
    end

    # Reads the page setup from the file @file_name.
    #
    # See `Gtk::PageSetup#to_file`.
    def load_file(file_name : ::String) : Bool
      # gtk_page_setup_load_file: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGtk.gtk_page_setup_load_file(@pointer, file_name, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Reads the page setup from the group @group_name in the key file
    # @key_file.
    def load_key_file(key_file : GLib::KeyFile, group_name : ::String?) : Bool
      # gtk_page_setup_load_key_file: (Method | Throws)
      # @group_name: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      group_name = if group_name.nil?
                     Pointer(LibC::Char).null
                   else
                     group_name.to_unsafe
                   end

      # C call
      _retval = LibGtk.gtk_page_setup_load_key_file(@pointer, key_file, group_name, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the bottom margin of the `GtkPageSetup`.
    def set_bottom_margin(margin : Float64, unit : Gtk::Unit) : Nil
      # gtk_page_setup_set_bottom_margin: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_page_setup_set_bottom_margin(@pointer, margin, unit)

      # Return value handling
    end

    # Sets the left margin of the `GtkPageSetup`.
    def set_left_margin(margin : Float64, unit : Gtk::Unit) : Nil
      # gtk_page_setup_set_left_margin: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_page_setup_set_left_margin(@pointer, margin, unit)

      # Return value handling
    end

    # Sets the page orientation of the `GtkPageSetup`.
    def orientation=(orientation : Gtk::PageOrientation) : Nil
      # gtk_page_setup_set_orientation: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_page_setup_set_orientation(@pointer, orientation)

      # Return value handling
    end

    # Sets the paper size of the `GtkPageSetup` without
    # changing the margins.
    #
    # See `Gtk::PageSetup#paper_size_and_default_margins=`.
    def paper_size=(size : Gtk::PaperSize) : Nil
      # gtk_page_setup_set_paper_size: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_page_setup_set_paper_size(@pointer, size)

      # Return value handling
    end

    # Sets the paper size of the `GtkPageSetup` and modifies
    # the margins according to the new paper size.
    def paper_size_and_default_margins=(size : Gtk::PaperSize) : Nil
      # gtk_page_setup_set_paper_size_and_default_margins: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_page_setup_set_paper_size_and_default_margins(@pointer, size)

      # Return value handling
    end

    # Sets the right margin of the `GtkPageSetup`.
    def set_right_margin(margin : Float64, unit : Gtk::Unit) : Nil
      # gtk_page_setup_set_right_margin: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_page_setup_set_right_margin(@pointer, margin, unit)

      # Return value handling
    end

    # Sets the top margin of the `GtkPageSetup`.
    def set_top_margin(margin : Float64, unit : Gtk::Unit) : Nil
      # gtk_page_setup_set_top_margin: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_page_setup_set_top_margin(@pointer, margin, unit)

      # Return value handling
    end

    # This function saves the information from @setup to @file_name.
    def to_file(file_name : ::String) : Bool
      # gtk_page_setup_to_file: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGtk.gtk_page_setup_to_file(@pointer, file_name, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Serialize page setup to an a{sv} variant.
    def to_gvariant : GLib::Variant
      # gtk_page_setup_to_gvariant: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_page_setup_to_gvariant(@pointer)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::None)
    end

    # This function adds the page setup from @setup to @key_file.
    def to_key_file(key_file : GLib::KeyFile, group_name : ::String?) : Nil
      # gtk_page_setup_to_key_file: (Method)
      # @group_name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      group_name = if group_name.nil?
                     Pointer(LibC::Char).null
                   else
                     group_name.to_unsafe
                   end

      # C call
      LibGtk.gtk_page_setup_to_key_file(@pointer, key_file, group_name)

      # Return value handling
    end
  end
end
