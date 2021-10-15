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

      n_descs = descs.try(&.size) || 0
      descs = if descs.nil?
                Pointer(Pointer(Void)).null
              else
                descs.to_a.map(&.to_unsafe).to_unsafe
              end

      LibPango.pango_font_descriptions_free(descs, n_descs)
    end

    def self.descriptions_free(*descs : Pango::FontDescription)
      self.descriptions_free(descs)
    end

    def describe : Pango::FontDescription
      # pango_font_describe: (Method)
      # Returns: (transfer full)

      _retval = LibPango.pango_font_describe(self)
      Pango::FontDescription.new(_retval, GICrystal::Transfer::Full)
    end

    def describe_with_absolute_size : Pango::FontDescription
      # pango_font_describe_with_absolute_size: (Method)
      # Returns: (transfer full)

      _retval = LibPango.pango_font_describe_with_absolute_size(self)
      Pango::FontDescription.new(_retval, GICrystal::Transfer::Full)
    end

    def coverage(language : Pango::Language) : Pango::Coverage
      # pango_font_get_coverage: (Method)
      # Returns: (transfer full)

      _retval = LibPango.pango_font_get_coverage(self, language)
      Pango::Coverage.new(_retval, GICrystal::Transfer::Full)
    end

    def face : Pango::FontFace
      # pango_font_get_face: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_font_get_face(self)
      Pango::FontFace.new(_retval, GICrystal::Transfer::None)
    end

    def features(features : Enumerable(HarfBuzz::FeatureT), num_features : UInt32) : Nil
      # pango_font_get_features: (Method)
      # @features: (out) (caller-allocates) (array length=len element-type Interface)
      # @len: (out) (transfer full)
      # @num_features: (inout) (transfer full)
      # Returns: (transfer none)

      len = features.size
      features = features.to_a.map(&.to_unsafe).to_unsafe

      LibPango.pango_font_get_features(self, features, len, num_features)
    end

    def font_map : Pango::FontMap?
      # pango_font_get_font_map: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_font_get_font_map(self)
      Pango::FontMap.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def glyph_extents(glyph : UInt32) : Pango::Rectangle
      # pango_font_get_glyph_extents: (Method)
      # @ink_rect: (out) (caller-allocates) (optional)
      # @logical_rect: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      ink_rect = Pointer(Void).null
      logical_rect = Pointer(Void).null
      ink_rect = Pango::Rectangle.new

      LibPango.pango_font_get_glyph_extents(self, glyph, ink_rect, logical_rect)
      ink_rect
    end

    def metrics(language : Pango::Language?) : Pango::FontMetrics
      # pango_font_get_metrics: (Method)
      # @language: (nullable)
      # Returns: (transfer full)

      language = if language.nil?
                   Pointer(Void).null
                 else
                   language.to_unsafe
                 end

      _retval = LibPango.pango_font_get_metrics(self, language)
      Pango::FontMetrics.new(_retval, GICrystal::Transfer::Full)
    end

    def has_char(wc : UInt32) : Bool
      # pango_font_has_char: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_font_has_char(self, wc)
      GICrystal.to_bool(_retval)
    end
  end
end
