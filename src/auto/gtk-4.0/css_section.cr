module Gtk
  # Defines a part of a CSS document.
  #
  # Because sections are nested into one another, you can use
  # `CssSection#parent` to get the containing region.
  class CssSection
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(CssSection.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(CssSection.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGtk::CssSection)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_css_section_get_type
    end

    def initialize(file : Gio::File?, start : Gtk::CssLocation, end _end : Gtk::CssLocation)
      # gtk_css_section_new: (Constructor)
      # @file: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      file = if file.nil?
               Pointer(Void).null
             else
               file.to_unsafe
             end

      # C call
      _retval = LibGtk.gtk_css_section_new(file, start, _end)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    def end_location : Gtk::CssLocation
      # gtk_css_section_get_end_location: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_css_section_get_end_location(self)

      # Return value handling

      Gtk::CssLocation.new(_retval, GICrystal::Transfer::None)
    end

    def file : Gio::File?
      # gtk_css_section_get_file: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_css_section_get_file(self)

      # Return value handling

      Gio::File__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def parent : Gtk::CssSection?
      # gtk_css_section_get_parent: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_css_section_get_parent(self)

      # Return value handling

      Gtk::CssSection.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def start_location : Gtk::CssLocation
      # gtk_css_section_get_start_location: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_css_section_get_start_location(self)

      # Return value handling

      Gtk::CssLocation.new(_retval, GICrystal::Transfer::None)
    end

    def print(string : GLib::String) : Nil
      # gtk_css_section_print: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_css_section_print(self, string)

      # Return value handling
    end

    def ref : Gtk::CssSection
      # gtk_css_section_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_css_section_ref(self)

      # Return value handling

      Gtk::CssSection.new(_retval, GICrystal::Transfer::Full)
    end

    def to_string : ::String
      # gtk_css_section_to_string: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_css_section_to_string(self)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def unref : Nil
      # gtk_css_section_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_css_section_unref(self)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
