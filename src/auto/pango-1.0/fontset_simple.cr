require "./fontset"

module Pango
  # `PangoFontsetSimple` is a implementation of the abstract
  # `PangoFontset` base class as an array of fonts.
  #
  # When creating a `PangoFontsetSimple`, you have to provide
  # the array of fonts that make up the fontset.
  class FontsetSimple < Fontset
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_fontset_simple_get_type
    end

    def initialize(language : Pango::Language)
      # pango_fontset_simple_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_fontset_simple_new(language)

      # Return value handling
      @pointer = _retval
    end

    def append(font : Pango::Font) : Nil
      # pango_fontset_simple_append: (Method)
      # @font: (transfer full)
      # Returns: (transfer none)

      # Handle parameters
      LibGObject.g_object_ref(font)

      # C call
      LibPango.pango_fontset_simple_append(self, font)

      # Return value handling
    end

    def size : Int32
      # pango_fontset_simple_size: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_fontset_simple_size(self)

      # Return value handling
      _retval
    end
  end
end
