require "../g_object-2.0/object"

module Pango
  # A `PangoContext` stores global information used to control the
  # itemization process.
  #
  # The information stored by `PangoContext` includes the fontmap used
  # to look up fonts, and default values such as the default language,
  # default gravity, or default font.
  #
  # To obtain a `PangoContext`, use [method@Pango.FontMap.create_context].
  class Context < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_context_get_type
    end

    def initialize
      # pango_context_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_context_new

      # Return value handling
      @pointer = _retval
    end

    def changed : Nil
      # pango_context_changed: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_context_changed(self)

      # Return value handling
    end

    def base_dir : Pango::Direction
      # pango_context_get_base_dir: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_context_get_base_dir(self)

      # Return value handling
      Pango::Direction.from_value(_retval)
    end

    def base_gravity : Pango::Gravity
      # pango_context_get_base_gravity: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_context_get_base_gravity(self)

      # Return value handling
      Pango::Gravity.from_value(_retval)
    end

    def font_description : Pango::FontDescription
      # pango_context_get_font_description: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_context_get_font_description(self)

      # Return value handling
      Pango::FontDescription.new(_retval, GICrystal::Transfer::None)
    end

    def font_map : Pango::FontMap
      # pango_context_get_font_map: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_context_get_font_map(self)

      # Return value handling
      Pango::FontMap.new(_retval, GICrystal::Transfer::None)
    end

    def gravity : Pango::Gravity
      # pango_context_get_gravity: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_context_get_gravity(self)

      # Return value handling
      Pango::Gravity.from_value(_retval)
    end

    def gravity_hint : Pango::GravityHint
      # pango_context_get_gravity_hint: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_context_get_gravity_hint(self)

      # Return value handling
      Pango::GravityHint.from_value(_retval)
    end

    def language : Pango::Language
      # pango_context_get_language: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_context_get_language(self)

      # Return value handling
      Pango::Language.new(_retval, GICrystal::Transfer::Full)
    end

    def matrix : Pango::Matrix?
      # pango_context_get_matrix: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_context_get_matrix(self)

      # Return value handling
      Pango::Matrix.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def metrics(desc : Pango::FontDescription?, language : Pango::Language?) : Pango::FontMetrics
      # pango_context_get_metrics: (Method)
      # @desc: (nullable)
      # @language: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      desc = if desc.nil?
               Pointer(Void).null
             else
               desc.to_unsafe
             end
      language = if language.nil?
                   Pointer(Void).null
                 else
                   language.to_unsafe
                 end

      # C call
      _retval = LibPango.pango_context_get_metrics(self, desc, language)

      # Return value handling
      Pango::FontMetrics.new(_retval, GICrystal::Transfer::Full)
    end

    def round_glyph_positions : Bool
      # pango_context_get_round_glyph_positions: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_context_get_round_glyph_positions(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def serial : UInt32
      # pango_context_get_serial: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_context_get_serial(self)

      # Return value handling
      _retval
    end

    def list_families(families : Enumerable(Pango::FontFamily)) : Nil
      # pango_context_list_families: (Method)
      # @families: (out) (transfer container) (array length=n_families element-type Interface)
      # @n_families: (out) (transfer full)
      # Returns: (transfer none)

      # Handle parameters
      n_families = families.size
      families = families.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibPango.pango_context_list_families(self, families, n_families)

      # Return value handling
    end

    def list_families(*families : Pango::FontFamily)
      list_families(families)
    end

    def load_font(desc : Pango::FontDescription) : Pango::Font?
      # pango_context_load_font: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_context_load_font(self, desc)

      # Return value handling
      Pango::Font.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def load_fontset(desc : Pango::FontDescription, language : Pango::Language) : Pango::Fontset?
      # pango_context_load_fontset: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_context_load_fontset(self, desc, language)

      # Return value handling
      Pango::Fontset.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def base_dir=(direction : Pango::Direction) : Nil
      # pango_context_set_base_dir: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_context_set_base_dir(self, direction)

      # Return value handling
    end

    def base_gravity=(gravity : Pango::Gravity) : Nil
      # pango_context_set_base_gravity: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_context_set_base_gravity(self, gravity)

      # Return value handling
    end

    def font_description=(desc : Pango::FontDescription) : Nil
      # pango_context_set_font_description: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_context_set_font_description(self, desc)

      # Return value handling
    end

    def font_map=(font_map : Pango::FontMap) : Nil
      # pango_context_set_font_map: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_context_set_font_map(self, font_map)

      # Return value handling
    end

    def gravity_hint=(hint : Pango::GravityHint) : Nil
      # pango_context_set_gravity_hint: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_context_set_gravity_hint(self, hint)

      # Return value handling
    end

    def language=(language : Pango::Language) : Nil
      # pango_context_set_language: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_context_set_language(self, language)

      # Return value handling
    end

    def matrix=(matrix : Pango::Matrix?) : Nil
      # pango_context_set_matrix: (Method)
      # @matrix: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      matrix = if matrix.nil?
                 Pointer(Void).null
               else
                 matrix.to_unsafe
               end

      # C call
      LibPango.pango_context_set_matrix(self, matrix)

      # Return value handling
    end

    def round_glyph_positions=(round_positions : Bool) : Nil
      # pango_context_set_round_glyph_positions: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_context_set_round_glyph_positions(self, round_positions)

      # Return value handling
    end
  end
end
