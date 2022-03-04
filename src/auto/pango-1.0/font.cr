require "../g_object-2.0/object"

module Pango
  # A `PangoFont` is used to represent a font in a
  # rendering-system-independent manner.
  class Font < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_font_get_type
    end

    def self.descriptions_free(descs : Enumerable(Pango::FontDescription)?) : Nil
      # pango_font_descriptions_free: (None)
      # @descs: (transfer full) (nullable) (array length=n_descs element-type Interface)
      # Returns: (transfer none)

      # Handle parameters
      n_descs = descs.try(&.size) || 0
      descs = if descs.nil?
                Pointer(Pointer(Void)).null
              else
                descs.to_a.map(&.to_unsafe).to_unsafe
              end

      # C call
      LibPango.pango_font_descriptions_free(descs, n_descs)

      # Return value handling
    end

    def self.descriptions_free(*descs : Pango::FontDescription)
      self.descriptions_free(descs)
    end

    def deserialize(context : Pango::Context, bytes : GLib::Bytes) : Pango::Font?
      # pango_font_deserialize: (Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibPango.pango_font_deserialize(context, bytes, pointerof(_error))

      # Error check
      Pango.raise_exception(_error) unless _error.null?
      # Return value handling
      Pango::Font.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def describe : Pango::FontDescription
      # pango_font_describe: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_font_describe(self)

      # Return value handling
      Pango::FontDescription.new(_retval, GICrystal::Transfer::Full)
    end

    def describe_with_absolute_size : Pango::FontDescription
      # pango_font_describe_with_absolute_size: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_font_describe_with_absolute_size(self)

      # Return value handling
      Pango::FontDescription.new(_retval, GICrystal::Transfer::Full)
    end

    def coverage(language : Pango::Language) : Pango::Coverage
      # pango_font_get_coverage: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_font_get_coverage(self, language)

      # Return value handling
      Pango::Coverage.new(_retval, GICrystal::Transfer::Full)
    end

    def face : Pango::FontFace
      # pango_font_get_face: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_font_get_face(self)

      # Return value handling
      Pango::FontFace.new(_retval, GICrystal::Transfer::None)
    end

    def features(features : Enumerable(HarfBuzz::FeatureT), num_features : UInt32) : Nil
      # pango_font_get_features: (Method)
      # @features: (out) (caller-allocates) (array length=len element-type Interface)
      # @len: (out) (transfer full)
      # @num_features: (inout) (transfer full)
      # Returns: (transfer none)

      # Handle parameters
      len = features.size
      features = features.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibPango.pango_font_get_features(self, features, len, num_features)

      # Return value handling
    end

    def font_map : Pango::FontMap?
      # pango_font_get_font_map: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_font_get_font_map(self)

      # Return value handling
      Pango::FontMap.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def glyph_extents(glyph : UInt32) : Pango::Rectangle
      # pango_font_get_glyph_extents: (Method)
      # @ink_rect: (out) (caller-allocates) (optional)
      # @logical_rect: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Handle parameters
      ink_rect = Pointer(Void).null
      logical_rect = Pointer(Void).null
      ink_rect = Pango::Rectangle.new

      # C call
      LibPango.pango_font_get_glyph_extents(self, glyph, ink_rect, logical_rect)

      # Return value handling
      ink_rect
    end

    def languages : Enumerable(Pango::Language)?
      # pango_font_get_languages: (Method)
      # Returns: (transfer none) (array zero-terminated=1 element-type Interface)

      # Handle parameters

      # C call
      _retval = LibPango.pango_font_get_languages(self)

      # Return value handling
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def metrics(language : Pango::Language?) : Pango::FontMetrics
      # pango_font_get_metrics: (Method)
      # @language: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      language = if language.nil?
                   Pointer(Void).null
                 else
                   language.to_unsafe
                 end

      # C call
      _retval = LibPango.pango_font_get_metrics(self, language)

      # Return value handling
      Pango::FontMetrics.new(_retval, GICrystal::Transfer::Full)
    end

    def has_char(wc : UInt32) : Bool
      # pango_font_has_char: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_font_has_char(self, wc)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def serialize : GLib::Bytes
      # pango_font_serialize: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_font_serialize(self)

      # Return value handling
      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end
  end
end
