module Gtk
  # Defines a part of a CSS document.
  #
  # Because sections are nested into one another, you can use
  # gtk_css_section_get_parent() to get the containing region.
  class CssSection
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(CssSection.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(CssSection.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_css_section_get_type
    end

    def initialize(file : Gio::File?, start : Gtk::CssLocation, end _end : Gtk::CssLocation)
      # gtk_css_section_new: (Constructor)
      # @file: (nullable)
      # Returns: (transfer full)

      file = if file.nil?
               Pointer(Void).null
             else
               file.to_unsafe
             end

      _retval = LibGtk.gtk_css_section_new(file, start, _end)
      @pointer = _retval
    end

    def end_location : Gtk::CssLocation
      # gtk_css_section_get_end_location: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_css_section_get_end_location(self)
      Gtk::CssLocation.new(_retval, GICrystal::Transfer::None)
    end

    def file : Gio::File
      # gtk_css_section_get_file: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_css_section_get_file(self)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def parent : Gtk::CssSection?
      # gtk_css_section_get_parent: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_css_section_get_parent(self)
      Gtk::CssSection.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def start_location : Gtk::CssLocation
      # gtk_css_section_get_start_location: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_css_section_get_start_location(self)
      Gtk::CssLocation.new(_retval, GICrystal::Transfer::None)
    end

    def print(string : GLib::String) : Nil
      # gtk_css_section_print: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_css_section_print(self, string)
    end

    def ref : Gtk::CssSection
      # gtk_css_section_ref: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_css_section_ref(self)
      Gtk::CssSection.new(_retval, GICrystal::Transfer::Full)
    end

    def to_string : ::String
      # gtk_css_section_to_string: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_css_section_to_string(self)
      GICrystal.transfer_full(_retval)
    end

    def unref : Nil
      # gtk_css_section_unref: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_css_section_unref(self)
    end

    def to_unsafe
      @pointer
    end
  end
end
