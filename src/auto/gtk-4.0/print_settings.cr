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
  class PrintSettings < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_print_settings_get_type
    end

    def initialize
      # gtk_print_settings_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_new

      # Return value handling
      @pointer = _retval
    end

    def self.new_from_file(file_name : ::String) : self
      # gtk_print_settings_new_from_file: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_new_from_file(file_name, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?
      # Return value handling
      Gtk::PrintSettings.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_gvariant(variant : _) : self
      # gtk_print_settings_new_from_gvariant: (Constructor)
      # Returns: (transfer full)

      # Handle parameters
      variant = GLib::Variant.new(variant) unless variant.is_a?(GLib::Variant)

      # C call
      _retval = LibGtk.gtk_print_settings_new_from_gvariant(variant)

      # Return value handling
      Gtk::PrintSettings.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_key_file(key_file : GLib::KeyFile, group_name : ::String?) : self
      # gtk_print_settings_new_from_key_file: (Constructor | Throws)
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
      _retval = LibGtk.gtk_print_settings_new_from_key_file(key_file, group_name, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?
      # Return value handling
      Gtk::PrintSettings.new(_retval, GICrystal::Transfer::Full)
    end

    def copy : Gtk::PrintSettings
      # gtk_print_settings_copy: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_copy(self)

      # Return value handling
      Gtk::PrintSettings.new(_retval, GICrystal::Transfer::Full)
    end

    def foreach(func : Pointer(Void), user_data : Pointer(Void)?) : Nil
      # gtk_print_settings_foreach: (Method)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGtk.gtk_print_settings_foreach(self, func, user_data)

      # Return value handling
    end

    def get(key : ::String) : ::String
      # gtk_print_settings_get: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get(self, key)

      # Return value handling
      ::String.new(_retval)
    end

    def bool(key : ::String) : Bool
      # gtk_print_settings_get_bool: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_bool(self, key)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def collate : Bool
      # gtk_print_settings_get_collate: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_collate(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def default_source : ::String
      # gtk_print_settings_get_default_source: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_default_source(self)

      # Return value handling
      ::String.new(_retval)
    end

    def dither : ::String
      # gtk_print_settings_get_dither: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_dither(self)

      # Return value handling
      ::String.new(_retval)
    end

    def double(key : ::String) : Float64
      # gtk_print_settings_get_double: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_double(self, key)

      # Return value handling
      _retval
    end

    def double_with_default(key : ::String, def _def : Float64) : Float64
      # gtk_print_settings_get_double_with_default: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_double_with_default(self, key, _def)

      # Return value handling
      _retval
    end

    def duplex : Gtk::PrintDuplex
      # gtk_print_settings_get_duplex: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_duplex(self)

      # Return value handling
      Gtk::PrintDuplex.from_value(_retval)
    end

    def finishings : ::String
      # gtk_print_settings_get_finishings: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_finishings(self)

      # Return value handling
      ::String.new(_retval)
    end

    def int(key : ::String) : Int32
      # gtk_print_settings_get_int: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_int(self, key)

      # Return value handling
      _retval
    end

    def int_with_default(key : ::String, def _def : Int32) : Int32
      # gtk_print_settings_get_int_with_default: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_int_with_default(self, key, _def)

      # Return value handling
      _retval
    end

    def length(key : ::String, unit : Gtk::Unit) : Float64
      # gtk_print_settings_get_length: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_length(self, key, unit)

      # Return value handling
      _retval
    end

    def media_type : ::String
      # gtk_print_settings_get_media_type: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_media_type(self)

      # Return value handling
      ::String.new(_retval)
    end

    def n_copies : Int32
      # gtk_print_settings_get_n_copies: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_n_copies(self)

      # Return value handling
      _retval
    end

    def number_up : Int32
      # gtk_print_settings_get_number_up: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_number_up(self)

      # Return value handling
      _retval
    end

    def number_up_layout : Gtk::NumberUpLayout
      # gtk_print_settings_get_number_up_layout: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_number_up_layout(self)

      # Return value handling
      Gtk::NumberUpLayout.from_value(_retval)
    end

    def orientation : Gtk::PageOrientation
      # gtk_print_settings_get_orientation: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_orientation(self)

      # Return value handling
      Gtk::PageOrientation.from_value(_retval)
    end

    def output_bin : ::String
      # gtk_print_settings_get_output_bin: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_output_bin(self)

      # Return value handling
      ::String.new(_retval)
    end

    def page_ranges : Enumerable(Gtk::PageRange)
      # gtk_print_settings_get_page_ranges: (Method)
      # @num_ranges: (out) (transfer full)
      # Returns: (transfer full) (array length=num_ranges element-type Interface)

      # Handle parameters
      num_ranges = 0

      # C call
      _retval = LibGtk.gtk_print_settings_get_page_ranges(self, pointerof(num_ranges))

      # Return value handling
      GICrystal.transfer_array(_retval, num_ranges, GICrystal::Transfer::Full)
    end

    def page_set : Gtk::PageSet
      # gtk_print_settings_get_page_set: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_page_set(self)

      # Return value handling
      Gtk::PageSet.from_value(_retval)
    end

    def paper_height(unit : Gtk::Unit) : Float64
      # gtk_print_settings_get_paper_height: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_paper_height(self, unit)

      # Return value handling
      _retval
    end

    def paper_size : Gtk::PaperSize
      # gtk_print_settings_get_paper_size: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_paper_size(self)

      # Return value handling
      Gtk::PaperSize.new(_retval, GICrystal::Transfer::Full)
    end

    def paper_width(unit : Gtk::Unit) : Float64
      # gtk_print_settings_get_paper_width: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_paper_width(self, unit)

      # Return value handling
      _retval
    end

    def print_pages : Gtk::PrintPages
      # gtk_print_settings_get_print_pages: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_print_pages(self)

      # Return value handling
      Gtk::PrintPages.from_value(_retval)
    end

    def printer : ::String
      # gtk_print_settings_get_printer: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_printer(self)

      # Return value handling
      ::String.new(_retval)
    end

    def printer_lpi : Float64
      # gtk_print_settings_get_printer_lpi: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_printer_lpi(self)

      # Return value handling
      _retval
    end

    def quality : Gtk::PrintQuality
      # gtk_print_settings_get_quality: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_quality(self)

      # Return value handling
      Gtk::PrintQuality.from_value(_retval)
    end

    def resolution : Int32
      # gtk_print_settings_get_resolution: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_resolution(self)

      # Return value handling
      _retval
    end

    def resolution_x : Int32
      # gtk_print_settings_get_resolution_x: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_resolution_x(self)

      # Return value handling
      _retval
    end

    def resolution_y : Int32
      # gtk_print_settings_get_resolution_y: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_resolution_y(self)

      # Return value handling
      _retval
    end

    def reverse : Bool
      # gtk_print_settings_get_reverse: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_reverse(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def scale : Float64
      # gtk_print_settings_get_scale: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_scale(self)

      # Return value handling
      _retval
    end

    def use_color : Bool
      # gtk_print_settings_get_use_color: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_get_use_color(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def has_key(key : ::String) : Bool
      # gtk_print_settings_has_key: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_has_key(self, key)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def load_file(file_name : ::String) : Bool
      # gtk_print_settings_load_file: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_load_file(self, file_name, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def load_key_file(key_file : GLib::KeyFile, group_name : ::String?) : Bool
      # gtk_print_settings_load_key_file: (Method | Throws)
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
      _retval = LibGtk.gtk_print_settings_load_key_file(self, key_file, group_name, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def set(key : ::String, value : ::String?) : Nil
      # gtk_print_settings_set: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      value = if value.nil?
                Pointer(LibC::Char).null
              else
                value.to_unsafe
              end

      # C call
      LibGtk.gtk_print_settings_set(self, key, value)

      # Return value handling
    end

    def set_bool(key : ::String, value : Bool) : Nil
      # gtk_print_settings_set_bool: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_bool(self, key, value)

      # Return value handling
    end

    def collate=(collate : Bool) : Nil
      # gtk_print_settings_set_collate: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_collate(self, collate)

      # Return value handling
    end

    def default_source=(default_source : ::String) : Nil
      # gtk_print_settings_set_default_source: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_default_source(self, default_source)

      # Return value handling
    end

    def dither=(dither : ::String) : Nil
      # gtk_print_settings_set_dither: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_dither(self, dither)

      # Return value handling
    end

    def set_double(key : ::String, value : Float64) : Nil
      # gtk_print_settings_set_double: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_double(self, key, value)

      # Return value handling
    end

    def duplex=(duplex : Gtk::PrintDuplex) : Nil
      # gtk_print_settings_set_duplex: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_duplex(self, duplex)

      # Return value handling
    end

    def finishings=(finishings : ::String) : Nil
      # gtk_print_settings_set_finishings: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_finishings(self, finishings)

      # Return value handling
    end

    def set_int(key : ::String, value : Int32) : Nil
      # gtk_print_settings_set_int: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_int(self, key, value)

      # Return value handling
    end

    def set_length(key : ::String, value : Float64, unit : Gtk::Unit) : Nil
      # gtk_print_settings_set_length: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_length(self, key, value, unit)

      # Return value handling
    end

    def media_type=(media_type : ::String) : Nil
      # gtk_print_settings_set_media_type: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_media_type(self, media_type)

      # Return value handling
    end

    def n_copies=(num_copies : Int32) : Nil
      # gtk_print_settings_set_n_copies: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_n_copies(self, num_copies)

      # Return value handling
    end

    def number_up=(number_up : Int32) : Nil
      # gtk_print_settings_set_number_up: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_number_up(self, number_up)

      # Return value handling
    end

    def number_up_layout=(number_up_layout : Gtk::NumberUpLayout) : Nil
      # gtk_print_settings_set_number_up_layout: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_number_up_layout(self, number_up_layout)

      # Return value handling
    end

    def orientation=(orientation : Gtk::PageOrientation) : Nil
      # gtk_print_settings_set_orientation: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_orientation(self, orientation)

      # Return value handling
    end

    def output_bin=(output_bin : ::String) : Nil
      # gtk_print_settings_set_output_bin: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_output_bin(self, output_bin)

      # Return value handling
    end

    def set_page_ranges(page_ranges : Enumerable(Gtk::PageRange)) : Nil
      # gtk_print_settings_set_page_ranges: (Method)
      # @page_ranges: (array length=num_ranges element-type Interface)
      # Returns: (transfer none)

      # Handle parameters
      num_ranges = page_ranges.size
      page_ranges = page_ranges.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_print_settings_set_page_ranges(self, page_ranges, num_ranges)

      # Return value handling
    end

    def set_page_ranges(*page_ranges : Gtk::PageRange)
      set_page_ranges(page_ranges)
    end

    def page_set=(page_set : Gtk::PageSet) : Nil
      # gtk_print_settings_set_page_set: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_page_set(self, page_set)

      # Return value handling
    end

    def set_paper_height(height : Float64, unit : Gtk::Unit) : Nil
      # gtk_print_settings_set_paper_height: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_paper_height(self, height, unit)

      # Return value handling
    end

    def paper_size=(paper_size : Gtk::PaperSize) : Nil
      # gtk_print_settings_set_paper_size: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_paper_size(self, paper_size)

      # Return value handling
    end

    def set_paper_width(width : Float64, unit : Gtk::Unit) : Nil
      # gtk_print_settings_set_paper_width: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_paper_width(self, width, unit)

      # Return value handling
    end

    def print_pages=(pages : Gtk::PrintPages) : Nil
      # gtk_print_settings_set_print_pages: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_print_pages(self, pages)

      # Return value handling
    end

    def printer=(printer : ::String) : Nil
      # gtk_print_settings_set_printer: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_printer(self, printer)

      # Return value handling
    end

    def printer_lpi=(lpi : Float64) : Nil
      # gtk_print_settings_set_printer_lpi: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_printer_lpi(self, lpi)

      # Return value handling
    end

    def quality=(quality : Gtk::PrintQuality) : Nil
      # gtk_print_settings_set_quality: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_quality(self, quality)

      # Return value handling
    end

    def resolution=(resolution : Int32) : Nil
      # gtk_print_settings_set_resolution: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_resolution(self, resolution)

      # Return value handling
    end

    def set_resolution_xy(resolution_x : Int32, resolution_y : Int32) : Nil
      # gtk_print_settings_set_resolution_xy: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_resolution_xy(self, resolution_x, resolution_y)

      # Return value handling
    end

    def reverse=(reverse : Bool) : Nil
      # gtk_print_settings_set_reverse: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_reverse(self, reverse)

      # Return value handling
    end

    def scale=(scale : Float64) : Nil
      # gtk_print_settings_set_scale: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_scale(self, scale)

      # Return value handling
    end

    def use_color=(use_color : Bool) : Nil
      # gtk_print_settings_set_use_color: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_set_use_color(self, use_color)

      # Return value handling
    end

    def to_file(file_name : ::String) : Bool
      # gtk_print_settings_to_file: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_to_file(self, file_name, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def to_gvariant : GLib::Variant
      # gtk_print_settings_to_gvariant: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_print_settings_to_gvariant(self)

      # Return value handling
      GLib::Variant.new(_retval, GICrystal::Transfer::None)
    end

    def to_key_file(key_file : GLib::KeyFile, group_name : ::String?) : Nil
      # gtk_print_settings_to_key_file: (Method)
      # @group_name: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      group_name = if group_name.nil?
                     Pointer(LibC::Char).null
                   else
                     group_name.to_unsafe
                   end

      # C call
      LibGtk.gtk_print_settings_to_key_file(self, key_file, group_name)

      # Return value handling
    end

    def unset(key : ::String) : Nil
      # gtk_print_settings_unset: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_print_settings_unset(self, key)

      # Return value handling
    end
  end
end
