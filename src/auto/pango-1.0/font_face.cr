require "../g_object-2.0/object"

module Pango
  # A `PangoFontFace` is used to represent a group of fonts with
  # the same family, slant, weight, and width, but varying sizes.
  @[GObject::GeneratedWrapper]
  class FontFace < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibPango::FontFaceClass), class_init,
        sizeof(LibPango::FontFace), instance_init, 0)
    end

    GICrystal.define_new_method(FontFace, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `FontFace`.
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
      LibPango.pango_font_face_get_type
    end

    # Returns a font description that matches the face.
    #
    # The resulting font description will have the family, style,
    # variant, weight and stretch of the face, but its size field
    # will be unset.
    def describe : Pango::FontDescription
      # pango_font_face_describe: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_font_face_describe(@pointer)

      # Return value handling

      Pango::FontDescription.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets a name representing the style of this face.
    #
    # Note that a font family may contain multiple faces
    # with the same name (e.g. a variable and a non-variable
    # face for the same style).
    def face_name : ::String
      # pango_font_face_get_face_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_face_get_face_name(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the `PangoFontFamily` that @face belongs to.
    def family : Pango::FontFamily
      # pango_font_face_get_family: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_face_get_family(@pointer)

      # Return value handling

      Pango::FontFamily.new(_retval, GICrystal::Transfer::None)
    end

    # Returns whether a `PangoFontFace` is synthesized.
    #
    # This will be the case if the underlying font rendering engine
    # creates this face from another face, by shearing, emboldening,
    # lightening or modifying it in some other way.
    def is_synthesized : Bool
      # pango_font_face_is_synthesized: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_face_is_synthesized(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # List the available sizes for a font.
    #
    # This is only applicable to bitmap fonts. For scalable fonts, stores
    # %NULL at the location pointed to by @sizes and 0 at the location pointed
    # to by @n_sizes. The sizes returned are in Pango units and are sorted
    # in ascending order.
    def list_sizes : Nil
      # pango_font_face_list_sizes: (Method)
      # @sizes: (out) (transfer full) (nullable) (optional) (array length=n_sizes element-type Int32)
      # @n_sizes: (out) (transfer full)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_sizes = sizes.try(&.size) || 0 # Generator::OutArgUsedInReturnPlan
      sizes = Pointer(Pointer(Int32)).null
      # C call
      LibPango.pango_font_face_list_sizes(@pointer, sizes, n_sizes)

      # Return value handling
    end
  end
end
