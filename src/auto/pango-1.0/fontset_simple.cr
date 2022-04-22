require "./fontset"

module Pango
  # `PangoFontsetSimple` is a implementation of the abstract
  # `PangoFontset` base class as an array of fonts.
  #
  # When creating a `PangoFontsetSimple`, you have to provide
  # the array of fonts that make up the fontset.
  @[GObject::GeneratedWrapper]
  class FontsetSimple < Fontset
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibPango::FontsetSimpleClass), class_init,
        sizeof(LibPango::FontsetSimple), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_fontset_simple_get_type
    end

    # Creates a new `PangoFontsetSimple` for the given language.
    def initialize(language : Pango::Language)
      # pango_fontset_simple_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_fontset_simple_new(language)

      # Return value handling

      @pointer = _retval
    end

    # Adds a font to the fontset.
    #
    # The fontset takes ownership of @font.
    def append(font : Pango::Font) : Nil
      # pango_fontset_simple_append: (Method)
      # @font: (transfer full)
      # Returns: (transfer none)

      # Generator::TransferFullArgPlan
      LibGObject.g_object_ref_sink(font)

      # C call
      LibPango.pango_fontset_simple_append(self, font)

      # Return value handling
    end

    # Returns the number of fonts in the fontset.
    def size : Int32
      # pango_fontset_simple_size: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_fontset_simple_size(self)

      # Return value handling

      _retval
    end
  end
end
