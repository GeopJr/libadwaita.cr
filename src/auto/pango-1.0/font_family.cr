require "../g_object-2.0/object"

module Pango
  # A `PangoFontFamily` is used to represent a family of related
  # font faces.
  #
  # The font faces in a family share a common design, but differ in
  # slant, weight, width or other aspects.
  @[GObject::GeneratedWrapper]
  class FontFamily < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibPango::FontFamilyClass), class_init,
        sizeof(LibPango::FontFamily), instance_init, 0)
    end

    GICrystal.define_new_method(FontFamily, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `FontFamily`.
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
      LibPango.pango_font_family_get_type
    end

    # Gets the `PangoFontFace` of @family with the given name.
    def face(name : ::String?) : Pango::FontFace?
      # pango_font_family_get_face: (Method)
      # @name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      _retval = LibPango.pango_font_family_get_face(@pointer, name)

      # Return value handling

      Pango::FontFace.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the name of the family.
    #
    # The name is unique among all fonts for the font backend and can
    # be used in a `PangoFontDescription` to specify that a face from
    # this family is desired.
    def name : ::String
      # pango_font_family_get_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_family_get_name(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # A monospace font is a font designed for text display where the the
    # characters form a regular grid.
    #
    # For Western languages this would
    # mean that the advance width of all characters are the same, but
    # this categorization also includes Asian fonts which include
    # double-width characters: characters that occupy two grid cells.
    # g_unichar_iswide() returns a result that indicates whether a
    # character is typically double-width in a monospace font.
    #
    # The best way to find out the grid-cell size is to call
    # `Pango::FontMetrics#approximate_digit_width`, since the
    # results of `Pango::FontMetrics#approximate_char_width` may
    # be affected by double-width characters.
    def is_monospace : Bool
      # pango_font_family_is_monospace: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_family_is_monospace(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # A variable font is a font which has axes that can be modified to
    # produce different faces.
    #
    # Such axes are also known as _variations_; see
    # `Pango::FontDescription#variations=` for more information.
    def is_variable : Bool
      # pango_font_family_is_variable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_family_is_variable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Lists the different font faces that make up @family.
    #
    # The faces in a family share a common design, but differ in slant, weight,
    # width and other aspects.
    #
    # Note that the returned faces are not in any particular order, and
    # multiple faces may have the same name or characteristics.
    #
    # `PangoFontFamily` also implemented the `Gio#ListModel` interface
    # for enumerating faces.
    def list_faces : Nil
      # pango_font_family_list_faces: (Method)
      # @faces: (out) (transfer container) (optional) (array length=n_faces element-type Interface)
      # @n_faces: (out) (transfer full)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_faces = faces.size                         # Generator::OutArgUsedInReturnPlan
      faces = Pointer(Pointer(Pointer(Void))).null # Generator::ArrayArgPlan
      faces = faces.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibPango.pango_font_family_list_faces(@pointer, faces, n_faces)

      # Return value handling
    end
  end
end
