require "../g_object-2.0/object"

module Pango
  # A `PangoFont` is used to represent a font in a
  # rendering-system-independent manner.
  @[GObject::GeneratedWrapper]
  class Font < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibPango::FontClass), class_init,
        sizeof(LibPango::Font), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_font_get_type
    end

    # Frees an array of font descriptions.
    def self.descriptions_free(descs : Enumerable(Pango::FontDescription)?) : Nil
      # pango_font_descriptions_free: (None)
      # @descs: (transfer full) (nullable) (array length=n_descs element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_descs = descs.try(&.size) || 0 # Generator::NullableArrayPlan
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

      # C call
      _retval = LibPango.pango_font_deserialize(context, bytes, pointerof(_error))

      # Error check
      Pango.raise_exception(_error) unless _error.null?

      # Return value handling

      Pango::Font.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Returns a description of the font, with font size set in points.
    #
    # Use `Pango::Font#describe_with_absolute_size` if you want
    # the font size in device units.
    def describe : Pango::FontDescription
      # pango_font_describe: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_font_describe(self)

      # Return value handling

      Pango::FontDescription.new(_retval, GICrystal::Transfer::Full)
    end

    # Returns a description of the font, with absolute font size set
    # in device units.
    #
    # Use `Pango::Font#describe` if you want the font size in points.
    def describe_with_absolute_size : Pango::FontDescription
      # pango_font_describe_with_absolute_size: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_font_describe_with_absolute_size(self)

      # Return value handling

      Pango::FontDescription.new(_retval, GICrystal::Transfer::Full)
    end

    # Computes the coverage map for a given font and language tag.
    def coverage(language : Pango::Language) : Pango::Coverage
      # pango_font_get_coverage: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_font_get_coverage(self, language)

      # Return value handling

      Pango::Coverage.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the `PangoFontFace` to which @font belongs.
    def face : Pango::FontFace
      # pango_font_get_face: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_get_face(self)

      # Return value handling

      Pango::FontFace.new(_retval, GICrystal::Transfer::None)
    end

    # Obtain the OpenType features that are provided by the font.
    #
    # These are passed to the rendering system, together with features
    # that have been explicitly set via attributes.
    #
    # Note that this does not include OpenType features which the
    # rendering system enables by default.
    def features(features : Enumerable(HarfBuzz::FeatureT), num_features : UInt32) : Nil
      # pango_font_get_features: (Method)
      # @features: (out) (caller-allocates) (array length=len element-type Interface)
      # @len: (out) (transfer full)
      # @num_features: (inout) (transfer full)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      len = features.size # Generator::ArrayArgPlan
      features = features.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibPango.pango_font_get_features(self, features, len, num_features)

      # Return value handling
    end

    # Gets the font map for which the font was created.
    #
    # Note that the font maintains a *weak* reference to
    # the font map, so if all references to font map are
    # dropped, the font map will be finalized even if there
    # are fonts created with the font map that are still alive.
    # In that case this function will return %NULL.
    #
    # It is the responsibility of the user to ensure that the
    # font map is kept alive. In most uses this is not an issue
    # as a `PangoContext` holds a reference to the font map.
    def font_map : Pango::FontMap?
      # pango_font_get_font_map: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_get_font_map(self)

      # Return value handling

      Pango::FontMap.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the logical and ink extents of a glyph within a font.
    #
    # The coordinate system for each rectangle has its origin at the
    # base line and horizontal origin of the character with increasing
    # coordinates extending to the right and down. The macros PANGO_ASCENT(),
    # PANGO_DESCENT(), PANGO_LBEARING(), and PANGO_RBEARING() can be used to convert
    # from the extents rectangle to more traditional font metrics. The units
    # of the rectangles are in 1/PANGO_SCALE of a device unit.
    #
    # If @font is %NULL, this function gracefully sets some sane values in the
    # output variables and returns.
    def glyph_extents(glyph : UInt32) : Pango::Rectangle
      # pango_font_get_glyph_extents: (Method)
      # @ink_rect: (out) (caller-allocates) (optional)
      # @logical_rect: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      ink_rect = Pointer(Void).null     # Generator::CallerAllocatesPlan
      ink_rect = Pango::Rectangle.new   # Generator::OutArgUsedInReturnPlan
      logical_rect = Pointer(Void).null # Generator::CallerAllocatesPlan
      logical_rect = Pango::Rectangle.new
      # C call
      LibPango.pango_font_get_glyph_extents(self, glyph, ink_rect, logical_rect)

      # Return value handling

      ink_rect
    end

    # Returns the languages that are supported by @font.
    #
    # If the font backend does not provide this information,
    # %NULL is returned. For the fontconfig backend, this
    # corresponds to the FC_LANG member of the FcPattern.
    #
    # The returned array is only valid as long as the font
    # and its fontmap are valid.
    def languages : Enumerable(Pango::Language)?
      # pango_font_get_languages: (Method)
      # Returns: (transfer none) (array zero-terminated=1 element-type Interface)

      # C call
      _retval = LibPango.pango_font_get_languages(self)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets overall metric information for a font.
    #
    # Since the metrics may be substantially different for different scripts,
    # a language tag can be provided to indicate that the metrics should be
    # retrieved that correspond to the script(s) used by that language.
    #
    # If @font is %NULL, this function gracefully sets some sane values in the
    # output variables and returns.
    def metrics(language : Pango::Language?) : Pango::FontMetrics
      # pango_font_get_metrics: (Method)
      # @language: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
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

    # Returns whether the font provides a glyph for this character.
    def has_char(wc : UInt32) : Bool
      # pango_font_has_char: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_has_char(self, wc)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Serializes the @font in a way that can be uniquely identified.
    #
    # There are no guarantees about the format of the output across different
    # versions of Pango.
    #
    # The intended use of this function is testing, benchmarking and debugging.
    # The format is not meant as a permanent storage format.
    #
    # To recreate a font from its serialized form, use `Pango::Font#deserialize`.
    def serialize : GLib::Bytes
      # pango_font_serialize: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_font_serialize(self)

      # Return value handling

      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end
  end
end
