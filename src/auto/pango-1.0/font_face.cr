require "../g_object-2.0/object"

module Pango
  # A `PangoFontFace` is used to represent a group of fonts with
  # the same family, slant, weight, and width, but varying sizes.
  class FontFace < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_font_face_get_type
    end

    def describe : Pango::FontDescription
      # pango_font_face_describe: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_font_face_describe(self)

      # Return value handling
      Pango::FontDescription.new(_retval, GICrystal::Transfer::Full)
    end

    def face_name : ::String
      # pango_font_face_get_face_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_font_face_get_face_name(self)

      # Return value handling
      ::String.new(_retval)
    end

    def family : Pango::FontFamily
      # pango_font_face_get_family: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_font_face_get_family(self)

      # Return value handling
      Pango::FontFamily.new(_retval, GICrystal::Transfer::None)
    end

    def is_synthesized : Bool
      # pango_font_face_is_synthesized: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_font_face_is_synthesized(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def list_sizes(sizes : Enumerable(Int32)?) : Nil
      # pango_font_face_list_sizes: (Method)
      # @sizes: (out) (transfer full) (nullable) (optional) (array length=n_sizes element-type Int32)
      # @n_sizes: (out) (transfer full)
      # Returns: (transfer none)

      # Handle parameters
      n_sizes = sizes.try(&.size) || 0
      sizes = Pointer(Pointer(Int32)).null
      sizes = if sizes.nil?
                Pointer(Int32).null
              else
                sizes.to_a.to_unsafe
              end

      # C call
      LibPango.pango_font_face_list_sizes(self, sizes, n_sizes)

      # Return value handling
    end

    def list_sizes(*sizes : Int32)
      list_sizes(sizes)
    end
  end
end
