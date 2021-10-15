module Gtk
  # `GtkPaperSize` handles paper sizes.
  #
  # It uses the standard called
  # [PWG 5101.1-2002 PWG: Standard for Media Standardized Names](http://www.pwg.org/standards.html)
  # to name the paper sizes (and to get the data for the page sizes).
  # In addition to standard paper sizes, `GtkPaperSize` allows to
  # construct custom paper sizes with arbitrary dimensions.
  #
  # The `GtkPaperSize` object stores not only the dimensions (width
  # and height) of a paper size and its name, it also provides
  # default print margins.
  class PaperSize
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(PaperSize.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(PaperSize.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_paper_size_get_type
    end

    def initialize(name : ::String?)
      # gtk_paper_size_new: (Constructor)
      # @name: (nullable)
      # Returns: (transfer full)

      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      _retval = LibGtk.gtk_paper_size_new(name)
      @pointer = _retval
    end

    def self.new_custom(name : ::String, display_name : ::String, width : Float64, height : Float64, unit : Gtk::Unit) : Gtk::PaperSize
      # gtk_paper_size_new_custom: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_paper_size_new_custom(name, display_name, width, height, unit)
      Gtk::PaperSize.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_gvariant(variant : _) : Gtk::PaperSize
      # gtk_paper_size_new_from_gvariant: (Constructor)
      # Returns: (transfer full)

      variant = GLib::Variant.new(variant) unless variant.is_a?(GLib::Variant)

      _retval = LibGtk.gtk_paper_size_new_from_gvariant(variant)
      Gtk::PaperSize.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_ipp(ipp_name : ::String, width : Float64, height : Float64) : Gtk::PaperSize
      # gtk_paper_size_new_from_ipp: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_paper_size_new_from_ipp(ipp_name, width, height)
      Gtk::PaperSize.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_key_file(key_file : GLib::KeyFile, group_name : ::String?) : Gtk::PaperSize
      # gtk_paper_size_new_from_key_file: (Constructor | Throws)
      # @group_name: (nullable)
      # Returns: (transfer full)

      group_name = if group_name.nil?
                     Pointer(LibC::Char).null
                   else
                     group_name.to_unsafe
                   end

      _retval = LibGtk.gtk_paper_size_new_from_key_file(key_file, group_name)
      Gtk::PaperSize.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_ppd(ppd_name : ::String, ppd_display_name : ::String, width : Float64, height : Float64) : Gtk::PaperSize
      # gtk_paper_size_new_from_ppd: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_paper_size_new_from_ppd(ppd_name, ppd_display_name, width, height)
      Gtk::PaperSize.new(_retval, GICrystal::Transfer::Full)
    end

    def copy : Gtk::PaperSize
      # gtk_paper_size_copy: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_paper_size_copy(self)
      Gtk::PaperSize.new(_retval, GICrystal::Transfer::Full)
    end

    def free : Nil
      # gtk_paper_size_free: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_paper_size_free(self)
    end

    def default_bottom_margin(unit : Gtk::Unit) : Float64
      # gtk_paper_size_get_default_bottom_margin: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_paper_size_get_default_bottom_margin(self, unit)
      _retval
    end

    def default_left_margin(unit : Gtk::Unit) : Float64
      # gtk_paper_size_get_default_left_margin: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_paper_size_get_default_left_margin(self, unit)
      _retval
    end

    def default_right_margin(unit : Gtk::Unit) : Float64
      # gtk_paper_size_get_default_right_margin: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_paper_size_get_default_right_margin(self, unit)
      _retval
    end

    def default_top_margin(unit : Gtk::Unit) : Float64
      # gtk_paper_size_get_default_top_margin: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_paper_size_get_default_top_margin(self, unit)
      _retval
    end

    def display_name : ::String
      # gtk_paper_size_get_display_name: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_paper_size_get_display_name(self)
      ::String.new(_retval)
    end

    def height(unit : Gtk::Unit) : Float64
      # gtk_paper_size_get_height: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_paper_size_get_height(self, unit)
      _retval
    end

    def name : ::String
      # gtk_paper_size_get_name: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_paper_size_get_name(self)
      ::String.new(_retval)
    end

    def ppd_name : ::String
      # gtk_paper_size_get_ppd_name: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_paper_size_get_ppd_name(self)
      ::String.new(_retval)
    end

    def width(unit : Gtk::Unit) : Float64
      # gtk_paper_size_get_width: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_paper_size_get_width(self, unit)
      _retval
    end

    def is_custom : Bool
      # gtk_paper_size_is_custom: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_paper_size_is_custom(self)
      GICrystal.to_bool(_retval)
    end

    def is_equal(size2 : Gtk::PaperSize) : Bool
      # gtk_paper_size_is_equal: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_paper_size_is_equal(self, size2)
      GICrystal.to_bool(_retval)
    end

    def is_ipp : Bool
      # gtk_paper_size_is_ipp: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_paper_size_is_ipp(self)
      GICrystal.to_bool(_retval)
    end

    def set_size(width : Float64, height : Float64, unit : Gtk::Unit) : Nil
      # gtk_paper_size_set_size: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_paper_size_set_size(self, width, height, unit)
    end

    def to_gvariant : GLib::Variant
      # gtk_paper_size_to_gvariant: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_paper_size_to_gvariant(self)
      GLib::Variant.new(_retval, GICrystal::Transfer::None)
    end

    def to_key_file(key_file : GLib::KeyFile, group_name : ::String) : Nil
      # gtk_paper_size_to_key_file: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_paper_size_to_key_file(self, key_file, group_name)
    end

    def self.default : ::String
      # gtk_paper_size_get_default: (None)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_paper_size_get_default
      ::String.new(_retval)
    end

    def self.paper_sizes(include_custom : Bool) : GLib::List
      # gtk_paper_size_get_paper_sizes: (None)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_paper_size_get_paper_sizes(include_custom)
      GLib::List(Gtk::PaperSize).new(_retval, GICrystal::Transfer::Full)
    end

    def to_unsafe
      @pointer
    end
  end
end
