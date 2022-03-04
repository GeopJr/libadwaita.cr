require "../g_object-2.0/object"

module Pango
  # A `PangoFontFamily` is used to represent a family of related
  # font faces.
  #
  # The font faces in a family share a common design, but differ in
  # slant, weight, width or other aspects.
  class FontFamily < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_font_family_get_type
    end

    def face(name : ::String?) : Pango::FontFace?
      # pango_font_family_get_face: (Method)
      # @name: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      _retval = LibPango.pango_font_family_get_face(self, name)

      # Return value handling
      Pango::FontFace.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def name : ::String
      # pango_font_family_get_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_font_family_get_name(self)

      # Return value handling
      ::String.new(_retval)
    end

    def is_monospace : Bool
      # pango_font_family_is_monospace: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_font_family_is_monospace(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def is_variable : Bool
      # pango_font_family_is_variable: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_font_family_is_variable(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def list_faces(faces : Enumerable(Pango::FontFace)) : Nil
      # pango_font_family_list_faces: (Method)
      # @faces: (out) (transfer container) (optional) (array length=n_faces element-type Interface)
      # @n_faces: (out) (transfer full)
      # Returns: (transfer none)

      # Handle parameters
      n_faces = faces.size
      faces = Pointer(Pointer(Pointer(Void))).null
      faces = faces.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibPango.pango_font_family_list_faces(self, faces, n_faces)

      # Return value handling
    end

    def list_faces(*faces : Pango::FontFace)
      list_faces(faces)
    end
  end
end
