require "../g_object-2.0/object"

module Pango
  # A `PangoFontset` represents a set of `PangoFont` to use when rendering text.
  #
  # A `PAngoFontset` is the result of resolving a `PangoFontDescription`
  # against a particular `PangoContext`. It has operations for finding the
  # component font for a particular Unicode character, and for finding a
  # composite set of metrics for the entire fontset.
  class Fontset < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_fontset_get_type
    end

    def foreach(func : Pointer(Void), data : Pointer(Nil)?) : Nil
      # pango_fontset_foreach: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      LibPango.pango_fontset_foreach(self, func, data)
    end

    def font(wc : UInt32) : Pango::Font
      # pango_fontset_get_font: (Method)
      # Returns: (transfer full)

      _retval = LibPango.pango_fontset_get_font(self, wc)
      Pango::Font.new(_retval, GICrystal::Transfer::Full)
    end

    def metrics : Pango::FontMetrics
      # pango_fontset_get_metrics: (Method)
      # Returns: (transfer full)

      _retval = LibPango.pango_fontset_get_metrics(self)
      Pango::FontMetrics.new(_retval, GICrystal::Transfer::Full)
    end
  end
end
