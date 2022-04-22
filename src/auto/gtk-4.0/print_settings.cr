require "../g_object-2.0/object"

module Gtk
  # A `GtkPrintSettings` object represents the settings of a print dialog in
  # a system-independent way.
  #
  # The main use for this object is that once you’ve printed you can get a
  # settings object that represents the settings the user chose, and the next
  # time you print you can pass that object in so that the user doesn’t have
  # to re-set all his settings.
  #
  # Its also possible to enumerate the settings so that you can easily save
  # the settings for the next time your app runs, or even store them in a
  # document. The predefined keys try to use shared values as much as possible
  # so that moving such a document between systems still works.
  @[GObject::GeneratedWrapper]
  class PrintSettings < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::PrintSettings), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_print_settings_get_type
    end

    # Creates a new `GtkPrintSettings` object.
    def initialize
      # gtk_print_settings_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_print_settings_new

      # Return value handling

      @pointer = _retval
    end

    # Reads the print settings from @file_name.
    #
    # Returns a new `GtkPrintSettings` object with the restored settings,
    # or %NULL if an error occurred. If the file could not be loaded then
    # error is set to either a `GFileError` or `GKeyFileError`.
    #
    # See `Gtk::PrintSettings#to_file`.
    def self.new_from_file(file_name : ::String) : self
      # gtk_print_settings_new_from_file: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGtk.gtk_print_settings_new_from_file(file_name, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      Gtk::PrintSettings.new(_retval, GICrystal::Transfer::Full)
    end

    # Deserialize print settings from an a{sv} variant.
    #
    # The variant must be in the format produced by
    # `Gtk::PrintSettings#to_gvariant`.
    def self.new_from_gvariant(variant : _) : self
      # gtk_print_settings_new_from_gvariant: (Constructor)
      # Returns: (transfer full)

      # Generator::HandmadeArgPlan
      variant = if !variant.is_a?(GLib::Variant)
                  GLib::Variant.new(variant).to_unsafe
                else
                  variant.to_unsafe
                end

      # C call
      _retval = LibGtk.gtk_print_settings_new_from_gvariant(variant)

      # Return value handling

      Gtk::PrintSettings.new(_retval, GICrystal::Transfer::Full)
    end

    # Reads the print settings from the group @group_name in @key_file.
    #
    # Returns a new `GtkPrintSettings` object with the restored settings,
    # or %NULL if an error occurred. If the file could not be loaded then
    # error is set to either `GFileError` or `GKeyFileError`.
    def self.new_from_key_file(key_file : GLib::KeyFile, group_name : ::String?) : self
      # gtk_print_settings_new_from_key_file: (Constructor | Throws)
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
      _retval = LibGtk.gtk_print_settings_new_from_key_file(key_file, group_name, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      Gtk::PrintSettings.new(_retval, GICrystal::Transfer::Full)
    end

    # Copies a `GtkPrintSettings` object.
    def copy : Gtk::PrintSettings
      # gtk_print_settings_copy: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_print_settings_copy(self)

      # Return value handling

      Gtk::PrintSettings.new(_retval, GICrystal::Transfer::Full)
    end

    # Calls @func for each key-value pair of @settings.
    def foreach(func : Pointer(Void), user_data : Pointer(Void)?) : Nil
      # gtk_print_settings_foreach: (Method)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGtk.gtk_print_settings_foreach(self, func, user_data)

      # Return value handling
    end

    # Looks up the string value associated with @key.
    def get(key : ::String) : ::String?
      # gtk_print_settings_get: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get(self, key)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns the boolean represented by the value
    # that is associated with @key.
    #
    # The string “true” represents %TRUE, any other
    # string %FALSE.
    def bool(key : ::String) : Bool
      # gtk_print_settings_get_bool: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_bool(self, key)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the value of %GTK_PRINT_SETTINGS_COLLATE.
    def collate : Bool
      # gtk_print_settings_get_collate: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_collate(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the value of %GTK_PRINT_SETTINGS_DEFAULT_SOURCE.
    def default_source : ::String?
      # gtk_print_settings_get_default_source: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_default_source(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the value of %GTK_PRINT_SETTINGS_DITHER.
    def dither : ::String?
      # gtk_print_settings_get_dither: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_dither(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns the double value associated with @key, or 0.
    def double(key : ::String) : Float64
      # gtk_print_settings_get_double: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_double(self, key)

      # Return value handling

      _retval
    end

    # Returns the floating point number represented by
    # the value that is associated with @key, or @default_val
    # if the value does not represent a floating point number.
    #
    # Floating point numbers are parsed with g_ascii_strtod().
    def double_with_default(key : ::String, def _def : Float64) : Float64
      # gtk_print_settings_get_double_with_default: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_double_with_default(self, key, _def)

      # Return value handling

      _retval
    end

    # Gets the value of %GTK_PRINT_SETTINGS_DUPLEX.
    def duplex : Gtk::PrintDuplex
      # gtk_print_settings_get_duplex: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_duplex(self)

      # Return value handling

      Gtk::PrintDuplex.new(_retval)
    end

    # Gets the value of %GTK_PRINT_SETTINGS_FINISHINGS.
    def finishings : ::String?
      # gtk_print_settings_get_finishings: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_finishings(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns the integer value of @key, or 0.
    def int(key : ::String) : Int32
      # gtk_print_settings_get_int: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_int(self, key)

      # Return value handling

      _retval
    end

    # Returns the value of @key, interpreted as
    # an integer, or the default value.
    def int_with_default(key : ::String, def _def : Int32) : Int32
      # gtk_print_settings_get_int_with_default: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_int_with_default(self, key, _def)

      # Return value handling

      _retval
    end

    # Returns the value associated with @key, interpreted
    # as a length.
    #
    # The returned value is converted to @units.
    def length(key : ::String, unit : Gtk::Unit) : Float64
      # gtk_print_settings_get_length: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_length(self, key, unit)

      # Return value handling

      _retval
    end

    # Gets the value of %GTK_PRINT_SETTINGS_MEDIA_TYPE.
    #
    # The set of media types is defined in PWG 5101.1-2002 PWG.
    def media_type : ::String?
      # gtk_print_settings_get_media_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_media_type(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the value of %GTK_PRINT_SETTINGS_N_COPIES.
    def n_copies : Int32
      # gtk_print_settings_get_n_copies: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_n_copies(self)

      # Return value handling

      _retval
    end

    # Gets the value of %GTK_PRINT_SETTINGS_NUMBER_UP.
    def number_up : Int32
      # gtk_print_settings_get_number_up: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_number_up(self)

      # Return value handling

      _retval
    end

    # Gets the value of %GTK_PRINT_SETTINGS_NUMBER_UP_LAYOUT.
    def number_up_layout : Gtk::NumberUpLayout
      # gtk_print_settings_get_number_up_layout: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_number_up_layout(self)

      # Return value handling

      Gtk::NumberUpLayout.new(_retval)
    end

    # Get the value of %GTK_PRINT_SETTINGS_ORIENTATION,
    # converted to a `GtkPageOrientation`.
    def orientation : Gtk::PageOrientation
      # gtk_print_settings_get_orientation: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_orientation(self)

      # Return value handling

      Gtk::PageOrientation.new(_retval)
    end

    # Gets the value of %GTK_PRINT_SETTINGS_OUTPUT_BIN.
    def output_bin : ::String?
      # gtk_print_settings_get_output_bin: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_output_bin(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the value of %GTK_PRINT_SETTINGS_PAGE_RANGES.
    def page_ranges : Enumerable(Gtk::PageRange)
      # gtk_print_settings_get_page_ranges: (Method)
      # @num_ranges: (out) (transfer full)
      # Returns: (transfer full) (array length=num_ranges element-type Interface)

      # Generator::OutArgUsedInReturnPlan
      num_ranges = 0

      # C call
      _retval = LibGtk.gtk_print_settings_get_page_ranges(self, pointerof(num_ranges))

      # Return value handling

      GICrystal.transfer_array(_retval, num_ranges, GICrystal::Transfer::Full)
    end

    # Gets the value of %GTK_PRINT_SETTINGS_PAGE_SET.
    def page_set : Gtk::PageSet
      # gtk_print_settings_get_page_set: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_page_set(self)

      # Return value handling

      Gtk::PageSet.new(_retval)
    end

    # Gets the value of %GTK_PRINT_SETTINGS_PAPER_HEIGHT,
    # converted to @unit.
    def paper_height(unit : Gtk::Unit) : Float64
      # gtk_print_settings_get_paper_height: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_paper_height(self, unit)

      # Return value handling

      _retval
    end

    # Gets the value of %GTK_PRINT_SETTINGS_PAPER_FORMAT,
    # converted to a `GtkPaperSize`.
    def paper_size : Gtk::PaperSize?
      # gtk_print_settings_get_paper_size: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_print_settings_get_paper_size(self)

      # Return value handling

      Gtk::PaperSize.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets the value of %GTK_PRINT_SETTINGS_PAPER_WIDTH,
    # converted to @unit.
    def paper_width(unit : Gtk::Unit) : Float64
      # gtk_print_settings_get_paper_width: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_paper_width(self, unit)

      # Return value handling

      _retval
    end

    # Gets the value of %GTK_PRINT_SETTINGS_PRINT_PAGES.
    def print_pages : Gtk::PrintPages
      # gtk_print_settings_get_print_pages: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_print_pages(self)

      # Return value handling

      Gtk::PrintPages.new(_retval)
    end

    # Convenience function to obtain the value of
    # %GTK_PRINT_SETTINGS_PRINTER.
    def printer : ::String?
      # gtk_print_settings_get_printer: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_printer(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the value of %GTK_PRINT_SETTINGS_PRINTER_LPI.
    def printer_lpi : Float64
      # gtk_print_settings_get_printer_lpi: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_printer_lpi(self)

      # Return value handling

      _retval
    end

    # Gets the value of %GTK_PRINT_SETTINGS_QUALITY.
    def quality : Gtk::PrintQuality
      # gtk_print_settings_get_quality: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_quality(self)

      # Return value handling

      Gtk::PrintQuality.new(_retval)
    end

    # Gets the value of %GTK_PRINT_SETTINGS_RESOLUTION.
    def resolution : Int32
      # gtk_print_settings_get_resolution: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_resolution(self)

      # Return value handling

      _retval
    end

    # Gets the value of %GTK_PRINT_SETTINGS_RESOLUTION_X.
    def resolution_x : Int32
      # gtk_print_settings_get_resolution_x: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_resolution_x(self)

      # Return value handling

      _retval
    end

    # Gets the value of %GTK_PRINT_SETTINGS_RESOLUTION_Y.
    def resolution_y : Int32
      # gtk_print_settings_get_resolution_y: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_resolution_y(self)

      # Return value handling

      _retval
    end

    # Gets the value of %GTK_PRINT_SETTINGS_REVERSE.
    def reverse : Bool
      # gtk_print_settings_get_reverse: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_reverse(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the value of %GTK_PRINT_SETTINGS_SCALE.
    def scale : Float64
      # gtk_print_settings_get_scale: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_scale(self)

      # Return value handling

      _retval
    end

    # Gets the value of %GTK_PRINT_SETTINGS_USE_COLOR.
    def use_color : Bool
      # gtk_print_settings_get_use_color: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_get_use_color(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns %TRUE, if a value is associated with @key.
    def has_key(key : ::String) : Bool
      # gtk_print_settings_has_key: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_has_key(self, key)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Reads the print settings from @file_name.
    #
    # If the file could not be loaded then error is set to either
    # a `GFileError` or `GKeyFileError`.
    #
    # See `Gtk::PrintSettings#to_file`.
    def load_file(file_name : ::String) : Bool
      # gtk_print_settings_load_file: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGtk.gtk_print_settings_load_file(self, file_name, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Reads the print settings from the group @group_name in @key_file.
    #
    # If the file could not be loaded then error is set to either a
    # `GFileError` or `GKeyFileError`.
    def load_key_file(key_file : GLib::KeyFile, group_name : ::String?) : Bool
      # gtk_print_settings_load_key_file: (Method | Throws)
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
      _retval = LibGtk.gtk_print_settings_load_key_file(self, key_file, group_name, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Associates @value with @key.
    def set(key : ::String, value : ::String?) : Nil
      # gtk_print_settings_set: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      value = if value.nil?
                Pointer(LibC::Char).null
              else
                value.to_unsafe
              end

      # C call
      LibGtk.gtk_print_settings_set(self, key, value)

      # Return value handling
    end

    # Sets @key to a boolean value.
    def set_bool(key : ::String, value : Bool) : Nil
      # gtk_print_settings_set_bool: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_bool(self, key, value)

      # Return value handling
    end

    # Sets the value of %GTK_PRINT_SETTINGS_COLLATE.
    def collate=(collate : Bool) : Nil
      # gtk_print_settings_set_collate: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_collate(self, collate)

      # Return value handling
    end

    # Sets the value of %GTK_PRINT_SETTINGS_DEFAULT_SOURCE.
    def default_source=(default_source : ::String) : Nil
      # gtk_print_settings_set_default_source: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_default_source(self, default_source)

      # Return value handling
    end

    # Sets the value of %GTK_PRINT_SETTINGS_DITHER.
    def dither=(dither : ::String) : Nil
      # gtk_print_settings_set_dither: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_dither(self, dither)

      # Return value handling
    end

    # Sets @key to a double value.
    def set_double(key : ::String, value : Float64) : Nil
      # gtk_print_settings_set_double: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_double(self, key, value)

      # Return value handling
    end

    # Sets the value of %GTK_PRINT_SETTINGS_DUPLEX.
    def duplex=(duplex : Gtk::PrintDuplex) : Nil
      # gtk_print_settings_set_duplex: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_duplex(self, duplex)

      # Return value handling
    end

    # Sets the value of %GTK_PRINT_SETTINGS_FINISHINGS.
    def finishings=(finishings : ::String) : Nil
      # gtk_print_settings_set_finishings: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_finishings(self, finishings)

      # Return value handling
    end

    # Sets @key to an integer value.
    def set_int(key : ::String, value : Int32) : Nil
      # gtk_print_settings_set_int: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_int(self, key, value)

      # Return value handling
    end

    # Associates a length in units of @unit with @key.
    def set_length(key : ::String, value : Float64, unit : Gtk::Unit) : Nil
      # gtk_print_settings_set_length: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_length(self, key, value, unit)

      # Return value handling
    end

    # Sets the value of %GTK_PRINT_SETTINGS_MEDIA_TYPE.
    #
    # The set of media types is defined in PWG 5101.1-2002 PWG.
    def media_type=(media_type : ::String) : Nil
      # gtk_print_settings_set_media_type: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_media_type(self, media_type)

      # Return value handling
    end

    # Sets the value of %GTK_PRINT_SETTINGS_N_COPIES.
    def n_copies=(num_copies : Int32) : Nil
      # gtk_print_settings_set_n_copies: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_n_copies(self, num_copies)

      # Return value handling
    end

    # Sets the value of %GTK_PRINT_SETTINGS_NUMBER_UP.
    def number_up=(number_up : Int32) : Nil
      # gtk_print_settings_set_number_up: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_number_up(self, number_up)

      # Return value handling
    end

    # Sets the value of %GTK_PRINT_SETTINGS_NUMBER_UP_LAYOUT.
    def number_up_layout=(number_up_layout : Gtk::NumberUpLayout) : Nil
      # gtk_print_settings_set_number_up_layout: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_number_up_layout(self, number_up_layout)

      # Return value handling
    end

    # Sets the value of %GTK_PRINT_SETTINGS_ORIENTATION.
    def orientation=(orientation : Gtk::PageOrientation) : Nil
      # gtk_print_settings_set_orientation: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_orientation(self, orientation)

      # Return value handling
    end

    # Sets the value of %GTK_PRINT_SETTINGS_OUTPUT_BIN.
    def output_bin=(output_bin : ::String) : Nil
      # gtk_print_settings_set_output_bin: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_output_bin(self, output_bin)

      # Return value handling
    end

    # Sets the value of %GTK_PRINT_SETTINGS_PAGE_RANGES.
    def set_page_ranges(page_ranges : Enumerable(Gtk::PageRange)) : Nil
      # gtk_print_settings_set_page_ranges: (Method)
      # @page_ranges: (array length=num_ranges element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      num_ranges = page_ranges.size
      # Generator::ArrayArgPlan
      page_ranges = page_ranges.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_print_settings_set_page_ranges(self, page_ranges, num_ranges)

      # Return value handling
    end

    def set_page_ranges(*page_ranges : Gtk::PageRange)
      set_page_ranges(page_ranges)
    end

    # Sets the value of %GTK_PRINT_SETTINGS_PAGE_SET.
    def page_set=(page_set : Gtk::PageSet) : Nil
      # gtk_print_settings_set_page_set: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_page_set(self, page_set)

      # Return value handling
    end

    # Sets the value of %GTK_PRINT_SETTINGS_PAPER_HEIGHT.
    def set_paper_height(height : Float64, unit : Gtk::Unit) : Nil
      # gtk_print_settings_set_paper_height: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_paper_height(self, height, unit)

      # Return value handling
    end

    # Sets the value of %GTK_PRINT_SETTINGS_PAPER_FORMAT,
    # %GTK_PRINT_SETTINGS_PAPER_WIDTH and
    # %GTK_PRINT_SETTINGS_PAPER_HEIGHT.
    def paper_size=(paper_size : Gtk::PaperSize) : Nil
      # gtk_print_settings_set_paper_size: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_paper_size(self, paper_size)

      # Return value handling
    end

    # Sets the value of %GTK_PRINT_SETTINGS_PAPER_WIDTH.
    def set_paper_width(width : Float64, unit : Gtk::Unit) : Nil
      # gtk_print_settings_set_paper_width: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_paper_width(self, width, unit)

      # Return value handling
    end

    # Sets the value of %GTK_PRINT_SETTINGS_PRINT_PAGES.
    def print_pages=(pages : Gtk::PrintPages) : Nil
      # gtk_print_settings_set_print_pages: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_print_pages(self, pages)

      # Return value handling
    end

    # Convenience function to set %GTK_PRINT_SETTINGS_PRINTER
    # to @printer.
    def printer=(printer : ::String) : Nil
      # gtk_print_settings_set_printer: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_printer(self, printer)

      # Return value handling
    end

    # Sets the value of %GTK_PRINT_SETTINGS_PRINTER_LPI.
    def printer_lpi=(lpi : Float64) : Nil
      # gtk_print_settings_set_printer_lpi: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_printer_lpi(self, lpi)

      # Return value handling
    end

    # Sets the value of %GTK_PRINT_SETTINGS_QUALITY.
    def quality=(quality : Gtk::PrintQuality) : Nil
      # gtk_print_settings_set_quality: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_quality(self, quality)

      # Return value handling
    end

    # Sets the values of %GTK_PRINT_SETTINGS_RESOLUTION,
    # %GTK_PRINT_SETTINGS_RESOLUTION_X and
    # %GTK_PRINT_SETTINGS_RESOLUTION_Y.
    def resolution=(resolution : Int32) : Nil
      # gtk_print_settings_set_resolution: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_resolution(self, resolution)

      # Return value handling
    end

    # Sets the values of %GTK_PRINT_SETTINGS_RESOLUTION,
    # %GTK_PRINT_SETTINGS_RESOLUTION_X and
    # %GTK_PRINT_SETTINGS_RESOLUTION_Y.
    def set_resolution_xy(resolution_x : Int32, resolution_y : Int32) : Nil
      # gtk_print_settings_set_resolution_xy: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_resolution_xy(self, resolution_x, resolution_y)

      # Return value handling
    end

    # Sets the value of %GTK_PRINT_SETTINGS_REVERSE.
    def reverse=(reverse : Bool) : Nil
      # gtk_print_settings_set_reverse: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_reverse(self, reverse)

      # Return value handling
    end

    # Sets the value of %GTK_PRINT_SETTINGS_SCALE.
    def scale=(scale : Float64) : Nil
      # gtk_print_settings_set_scale: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_scale(self, scale)

      # Return value handling
    end

    # Sets the value of %GTK_PRINT_SETTINGS_USE_COLOR.
    def use_color=(use_color : Bool) : Nil
      # gtk_print_settings_set_use_color: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_set_use_color(self, use_color)

      # Return value handling
    end

    # This function saves the print settings from @settings to @file_name.
    #
    # If the file could not be written then error is set to either a
    # `GFileError` or `GKeyFileError`.
    def to_file(file_name : ::String) : Bool
      # gtk_print_settings_to_file: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGtk.gtk_print_settings_to_file(self, file_name, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Serialize print settings to an a{sv} variant.
    def to_gvariant : GLib::Variant
      # gtk_print_settings_to_gvariant: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_settings_to_gvariant(self)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::None)
    end

    # This function adds the print settings from @settings to @key_file.
    def to_key_file(key_file : GLib::KeyFile, group_name : ::String?) : Nil
      # gtk_print_settings_to_key_file: (Method)
      # @group_name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      group_name = if group_name.nil?
                     Pointer(LibC::Char).null
                   else
                     group_name.to_unsafe
                   end

      # C call
      LibGtk.gtk_print_settings_to_key_file(self, key_file, group_name)

      # Return value handling
    end

    # Removes any value associated with @key.
    #
    # This has the same effect as setting the value to %NULL.
    def unset(key : ::String) : Nil
      # gtk_print_settings_unset: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_settings_unset(self, key)

      # Return value handling
    end
  end
end
