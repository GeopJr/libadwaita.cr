require "../g_object-2.0/object"

module Pango
  # A `PangoFontset` represents a set of `PangoFont` to use when rendering text.
  #
  # A `PangoFontset` is the result of resolving a `PangoFontDescription`
  # against a particular `PangoContext`. It has operations for finding the
  # component font for a particular Unicode character, and for finding a
  # composite set of metrics for the entire fontset.
  @[GObject::GeneratedWrapper]
  class Fontset < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibPango::FontsetClass), class_init,
        sizeof(LibPango::Fontset), instance_init, 0)
    end

    GICrystal.define_new_method(Fontset, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Fontset`.
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
      LibPango.pango_fontset_get_type
    end

    # Iterates through all the fonts in a fontset, calling @func for
    # each one.
    #
    # If @func returns %TRUE, that stops the iteration.
    def foreach(func : Pango::FontsetForeachFunc, data : Pointer(Void)?) : Nil
      # pango_fontset_foreach: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      LibPango.pango_fontset_foreach(@pointer, func, data)

      # Return value handling
    end

    # Returns the font in the fontset that contains the best
    # glyph for a Unicode character.
    def font(wc : UInt32) : Pango::Font
      # pango_fontset_get_font: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_fontset_get_font(@pointer, wc)

      # Return value handling

      Pango::Font.new(_retval, GICrystal::Transfer::Full)
    end

    # Get overall metric information for the fonts in the fontset.
    def metrics : Pango::FontMetrics
      # pango_fontset_get_metrics: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_fontset_get_metrics(@pointer)

      # Return value handling

      Pango::FontMetrics.new(_retval, GICrystal::Transfer::Full)
    end
  end
end
