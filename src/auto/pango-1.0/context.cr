require "../g_object-2.0/object"

module Pango
  # A `PangoContext` stores global information used to control the
  # itemization process.
  #
  # The information stored by `PangoContext` includes the fontmap used
  # to look up fonts, and default values such as the default language,
  # default gravity, or default font.
  #
  # To obtain a `PangoContext`, use `Pango::FontMap#create_context`.
  @[GObject::GeneratedWrapper]
  class Context < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibPango::ContextClass), class_init,
        sizeof(LibPango::Context), instance_init, 0)
    end

    GICrystal.define_new_method(Context, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Context`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_context_get_type
    end

    # Creates a new `PangoContext` initialized to default values.
    #
    # This function is not particularly useful as it should always
    # be followed by a `Pango::Context#font_map=` call, and the
    # function `Pango::FontMap#create_context` does these two steps
    # together and hence users are recommended to use that.
    #
    # If you are using Pango as part of a higher-level system,
    # that system may have it's own way of create a `PangoContext`.
    # For instance, the GTK toolkit has, among others,
    # `gtk_widget_get_pango_context()`. Use those instead.
    def initialize
      # pango_context_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_context_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Forces a change in the context, which will cause any `PangoLayout`
    # using this context to re-layout.
    #
    # This function is only useful when implementing a new backend
    # for Pango, something applications won't do. Backends should
    # call this function if they have attached extra data to the context
    # and such data is changed.
    def changed : Nil
      # pango_context_changed: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_context_changed(@pointer)

      # Return value handling
    end

    # Retrieves the base direction for the context.
    #
    # See `Pango::Context#base_dir=`.
    def base_dir : Pango::Direction
      # pango_context_get_base_dir: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_context_get_base_dir(@pointer)

      # Return value handling

      Pango::Direction.new(_retval)
    end

    # Retrieves the base gravity for the context.
    #
    # See `Pango::Context#base_gravity=`.
    def base_gravity : Pango::Gravity
      # pango_context_get_base_gravity: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_context_get_base_gravity(@pointer)

      # Return value handling

      Pango::Gravity.new(_retval)
    end

    # Retrieve the default font description for the context.
    def font_description : Pango::FontDescription
      # pango_context_get_font_description: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_context_get_font_description(@pointer)

      # Return value handling

      Pango::FontDescription.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the `PangoFontMap` used to look up fonts for this context.
    def font_map : Pango::FontMap
      # pango_context_get_font_map: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_context_get_font_map(@pointer)

      # Return value handling

      Pango::FontMap.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the gravity for the context.
    #
    # This is similar to `Pango::Context#base_gravity`,
    # except for when the base gravity is %PANGO_GRAVITY_AUTO for
    # which `Pango::Gravity#for_matrix` is used to return the
    # gravity from the current context matrix.
    def gravity : Pango::Gravity
      # pango_context_get_gravity: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_context_get_gravity(@pointer)

      # Return value handling

      Pango::Gravity.new(_retval)
    end

    # Retrieves the gravity hint for the context.
    #
    # See `Pango::Context#gravity_hint=` for details.
    def gravity_hint : Pango::GravityHint
      # pango_context_get_gravity_hint: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_context_get_gravity_hint(@pointer)

      # Return value handling

      Pango::GravityHint.new(_retval)
    end

    # Retrieves the global language tag for the context.
    def language : Pango::Language
      # pango_context_get_language: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_context_get_language(@pointer)

      # Return value handling

      Pango::Language.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the transformation matrix that will be applied when
    # rendering with this context.
    #
    # See `Pango::Context#matrix=`.
    def matrix : Pango::Matrix?
      # pango_context_get_matrix: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_context_get_matrix(@pointer)

      # Return value handling

      Pango::Matrix.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Get overall metric information for a particular font description.
    #
    # Since the metrics may be substantially different for different scripts,
    # a language tag can be provided to indicate that the metrics should be
    # retrieved that correspond to the script(s) used by that language.
    #
    # The `PangoFontDescription` is interpreted in the same way as by `#itemize`,
    # and the family name may be a comma separated list of names. If characters
    # from multiple of these families would be used to render the string, then
    # the returned fonts would be a composite of the metrics for the fonts loaded
    # for the individual families.
    def metrics(desc : Pango::FontDescription?, language : Pango::Language?) : Pango::FontMetrics
      # pango_context_get_metrics: (Method)
      # @desc: (nullable)
      # @language: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      desc = if desc.nil?
               Pointer(Void).null
             else
               desc.to_unsafe
             end
      # Generator::NullableArrayPlan
      language = if language.nil?
                   Pointer(Void).null
                 else
                   language.to_unsafe
                 end

      # C call
      _retval = LibPango.pango_context_get_metrics(@pointer, desc, language)

      # Return value handling

      Pango::FontMetrics.new(_retval, GICrystal::Transfer::Full)
    end

    # Returns whether font rendering with this context should
    # round glyph positions and widths.
    def round_glyph_positions : Bool
      # pango_context_get_round_glyph_positions: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_context_get_round_glyph_positions(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the current serial number of @context.
    #
    # The serial number is initialized to an small number larger than zero
    # when a new context is created and is increased whenever the context
    # is changed using any of the setter functions, or the `PangoFontMap` it
    # uses to find fonts has changed. The serial may wrap, but will never
    # have the value 0. Since it can wrap, never compare it with "less than",
    # always use "not equals".
    #
    # This can be used to automatically detect changes to a `PangoContext`,
    # and is only useful when implementing objects that need update when their
    # `PangoContext` changes, like `PangoLayout`.
    def serial : UInt32
      # pango_context_get_serial: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_context_get_serial(@pointer)

      # Return value handling

      _retval
    end

    # List all families for a context.
    def list_families(families : Enumerable(Pango::FontFamily)) : Nil
      # pango_context_list_families: (Method)
      # @families: (out) (transfer container) (array length=n_families element-type Interface)
      # @n_families: (out) (transfer full)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_families = families.size # Generator::ArrayArgPlan
      families = families.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibPango.pango_context_list_families(@pointer, families, n_families)

      # Return value handling
    end

    def list_families(*families : Pango::FontFamily)
      list_families(families)
    end

    # Loads the font in one of the fontmaps in the context
    # that is the closest match for @desc.
    def load_font(desc : Pango::FontDescription) : Pango::Font?
      # pango_context_load_font: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_context_load_font(@pointer, desc)

      # Return value handling

      Pango::Font.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Load a set of fonts in the context that can be used to render
    # a font matching @desc.
    def load_fontset(desc : Pango::FontDescription, language : Pango::Language) : Pango::Fontset?
      # pango_context_load_fontset: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_context_load_fontset(@pointer, desc, language)

      # Return value handling

      Pango::Fontset.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Sets the base direction for the context.
    #
    # The base direction is used in applying the Unicode bidirectional
    # algorithm; if the @direction is %PANGO_DIRECTION_LTR or
    # %PANGO_DIRECTION_RTL, then the value will be used as the paragraph
    # direction in the Unicode bidirectional algorithm. A value of
    # %PANGO_DIRECTION_WEAK_LTR or %PANGO_DIRECTION_WEAK_RTL is used only
    # for paragraphs that do not contain any strong characters themselves.
    def base_dir=(direction : Pango::Direction) : Nil
      # pango_context_set_base_dir: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_context_set_base_dir(@pointer, direction)

      # Return value handling
    end

    # Sets the base gravity for the context.
    #
    # The base gravity is used in laying vertical text out.
    def base_gravity=(gravity : Pango::Gravity) : Nil
      # pango_context_set_base_gravity: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_context_set_base_gravity(@pointer, gravity)

      # Return value handling
    end

    # Set the default font description for the context
    def font_description=(desc : Pango::FontDescription) : Nil
      # pango_context_set_font_description: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_context_set_font_description(@pointer, desc)

      # Return value handling
    end

    # Sets the font map to be searched when fonts are looked-up
    # in this context.
    #
    # This is only for internal use by Pango backends, a `PangoContext`
    # obtained via one of the recommended methods should already have a
    # suitable font map.
    def font_map=(font_map : Pango::FontMap) : Nil
      # pango_context_set_font_map: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_context_set_font_map(@pointer, font_map)

      # Return value handling
    end

    # Sets the gravity hint for the context.
    #
    # The gravity hint is used in laying vertical text out, and
    # is only relevant if gravity of the context as returned by
    # `Pango::Context#gravity` is set to %PANGO_GRAVITY_EAST
    # or %PANGO_GRAVITY_WEST.
    def gravity_hint=(hint : Pango::GravityHint) : Nil
      # pango_context_set_gravity_hint: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_context_set_gravity_hint(@pointer, hint)

      # Return value handling
    end

    # Sets the global language tag for the context.
    #
    # The default language for the locale of the running process
    # can be found using `Pango::Language#default`.
    def language=(language : Pango::Language) : Nil
      # pango_context_set_language: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_context_set_language(@pointer, language)

      # Return value handling
    end

    # Sets the transformation matrix that will be applied when rendering
    # with this context.
    #
    # Note that reported metrics are in the user space coordinates before
    # the application of the matrix, not device-space coordinates after the
    # application of the matrix. So, they don't scale with the matrix, though
    # they may change slightly for different matrices, depending on how the
    # text is fit to the pixel grid.
    def matrix=(matrix : Pango::Matrix?) : Nil
      # pango_context_set_matrix: (Method)
      # @matrix: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      matrix = if matrix.nil?
                 Pointer(Void).null
               else
                 matrix.to_unsafe
               end

      # C call
      LibPango.pango_context_set_matrix(@pointer, matrix)

      # Return value handling
    end

    # Sets whether font rendering with this context should
    # round glyph positions and widths to integral positions,
    # in device units.
    #
    # This is useful when the renderer can't handle subpixel
    # positioning of glyphs.
    #
    # The default value is to round glyph positions, to remain
    # compatible with previous Pango behavior.
    def round_glyph_positions=(round_positions : Bool) : Nil
      # pango_context_set_round_glyph_positions: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_context_set_round_glyph_positions(@pointer, round_positions)

      # Return value handling
    end
  end
end
