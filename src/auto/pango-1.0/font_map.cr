require "../g_object-2.0/object"

module Pango
  # A `PangoFontMap` represents the set of fonts available for a
  # particular rendering system.
  #
  # This is a virtual object with implementations being specific to
  # particular rendering systems.
  class FontMap < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_font_map_get_type
    end

    def changed : Nil
      # pango_font_map_changed: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_font_map_changed(self)

      # Return value handling
    end

    def create_context : Pango::Context
      # pango_font_map_create_context: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_font_map_create_context(self)

      # Return value handling
      Pango::Context.new(_retval, GICrystal::Transfer::Full)
    end

    def family(name : ::String) : Pango::FontFamily
      # pango_font_map_get_family: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_font_map_get_family(self, name)

      # Return value handling
      Pango::FontFamily.new(_retval, GICrystal::Transfer::None)
    end

    def serial : UInt32
      # pango_font_map_get_serial: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_font_map_get_serial(self)

      # Return value handling
      _retval
    end

    def list_families(families : Enumerable(Pango::FontFamily)) : Nil
      # pango_font_map_list_families: (Method)
      # @families: (out) (transfer container) (array length=n_families element-type Interface)
      # @n_families: (out) (transfer full)
      # Returns: (transfer none)

      # Handle parameters
      n_families = families.size
      families = families.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibPango.pango_font_map_list_families(self, families, n_families)

      # Return value handling
    end

    def list_families(*families : Pango::FontFamily)
      list_families(families)
    end

    def load_font(context : Pango::Context, desc : Pango::FontDescription) : Pango::Font?
      # pango_font_map_load_font: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_font_map_load_font(self, context, desc)

      # Return value handling
      Pango::Font.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def load_fontset(context : Pango::Context, desc : Pango::FontDescription, language : Pango::Language) : Pango::Fontset?
      # pango_font_map_load_fontset: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_font_map_load_fontset(self, context, desc, language)

      # Return value handling
      Pango::Fontset.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end
  end
end
