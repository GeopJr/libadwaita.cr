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
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(PaperSize.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(PaperSize.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGtk::PaperSize)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_paper_size_get_type
    end

    def initialize(name : ::String?)
      # gtk_paper_size_new: (Constructor)
      # @name: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      _retval = LibGtk.gtk_paper_size_new(name)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    def self.new_custom(name : ::String, display_name : ::String, width : Float64, height : Float64, unit : Gtk::Unit) : self
      # gtk_paper_size_new_custom: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_paper_size_new_custom(name, display_name, width, height, unit)

      # Return value handling

      Gtk::PaperSize.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_gvariant(variant : _) : self
      # gtk_paper_size_new_from_gvariant: (Constructor)
      # Returns: (transfer full)

      # Generator::HandmadeArgPlan
      variant = if !variant.is_a?(GLib::Variant)
                  GLib::Variant.new(variant).to_unsafe
                else
                  variant.to_unsafe
                end

      # C call
      _retval = LibGtk.gtk_paper_size_new_from_gvariant(variant)

      # Return value handling

      Gtk::PaperSize.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_ipp(ipp_name : ::String, width : Float64, height : Float64) : self
      # gtk_paper_size_new_from_ipp: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_paper_size_new_from_ipp(ipp_name, width, height)

      # Return value handling

      Gtk::PaperSize.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_key_file(key_file : GLib::KeyFile, group_name : ::String?) : self
      # gtk_paper_size_new_from_key_file: (Constructor | Throws)
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
      _retval = LibGtk.gtk_paper_size_new_from_key_file(key_file, group_name, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      Gtk::PaperSize.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_ppd(ppd_name : ::String, ppd_display_name : ::String, width : Float64, height : Float64) : self
      # gtk_paper_size_new_from_ppd: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_paper_size_new_from_ppd(ppd_name, ppd_display_name, width, height)

      # Return value handling

      Gtk::PaperSize.new(_retval, GICrystal::Transfer::Full)
    end

    def copy : Gtk::PaperSize
      # gtk_paper_size_copy: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_paper_size_copy(self)

      # Return value handling

      Gtk::PaperSize.new(_retval, GICrystal::Transfer::Full)
    end

    def free : Nil
      # gtk_paper_size_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_paper_size_free(self)

      # Return value handling
    end

    def default_bottom_margin(unit : Gtk::Unit) : Float64
      # gtk_paper_size_get_default_bottom_margin: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paper_size_get_default_bottom_margin(self, unit)

      # Return value handling

      _retval
    end

    def default_left_margin(unit : Gtk::Unit) : Float64
      # gtk_paper_size_get_default_left_margin: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paper_size_get_default_left_margin(self, unit)

      # Return value handling

      _retval
    end

    def default_right_margin(unit : Gtk::Unit) : Float64
      # gtk_paper_size_get_default_right_margin: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paper_size_get_default_right_margin(self, unit)

      # Return value handling

      _retval
    end

    def default_top_margin(unit : Gtk::Unit) : Float64
      # gtk_paper_size_get_default_top_margin: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paper_size_get_default_top_margin(self, unit)

      # Return value handling

      _retval
    end

    def display_name : ::String
      # gtk_paper_size_get_display_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paper_size_get_display_name(self)

      # Return value handling

      ::String.new(_retval)
    end

    def height(unit : Gtk::Unit) : Float64
      # gtk_paper_size_get_height: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paper_size_get_height(self, unit)

      # Return value handling

      _retval
    end

    def name : ::String
      # gtk_paper_size_get_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paper_size_get_name(self)

      # Return value handling

      ::String.new(_retval)
    end

    def ppd_name : ::String
      # gtk_paper_size_get_ppd_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paper_size_get_ppd_name(self)

      # Return value handling

      ::String.new(_retval)
    end

    def width(unit : Gtk::Unit) : Float64
      # gtk_paper_size_get_width: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paper_size_get_width(self, unit)

      # Return value handling

      _retval
    end

    def is_custom : Bool
      # gtk_paper_size_is_custom: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paper_size_is_custom(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def is_equal(size2 : Gtk::PaperSize) : Bool
      # gtk_paper_size_is_equal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paper_size_is_equal(self, size2)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def is_ipp : Bool
      # gtk_paper_size_is_ipp: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paper_size_is_ipp(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def set_size(width : Float64, height : Float64, unit : Gtk::Unit) : Nil
      # gtk_paper_size_set_size: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_paper_size_set_size(self, width, height, unit)

      # Return value handling
    end

    def to_gvariant : GLib::Variant
      # gtk_paper_size_to_gvariant: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paper_size_to_gvariant(self)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::None)
    end

    def to_key_file(key_file : GLib::KeyFile, group_name : ::String) : Nil
      # gtk_paper_size_to_key_file: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_paper_size_to_key_file(self, key_file, group_name)

      # Return value handling
    end

    def self.default : ::String
      # gtk_paper_size_get_default: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_paper_size_get_default

      # Return value handling

      ::String.new(_retval)
    end

    def self.paper_sizes(include_custom : Bool) : GLib::List
      # gtk_paper_size_get_paper_sizes: (None)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_paper_size_get_paper_sizes(include_custom)

      # Return value handling

      GLib::List(Gtk::PaperSize).new(_retval, GICrystal::Transfer::Full)
    end

    def to_unsafe
      @pointer
    end
  end
end
