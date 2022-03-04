module PangoCairo
  # `PangoCairoFontMap` is an interface exported by font maps for
  # use with Cairo.
  #
  # The actual type of the font map will depend on the particular
  # font technology Cairo was compiled to use.
  module FontMap
    def self.default : Pango::FontMap
      # pango_cairo_font_map_get_default: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPangoCairo.pango_cairo_font_map_get_default

      # Return value handling
      Pango::FontMap.new(_retval, GICrystal::Transfer::None)
    end

    def self.new : Pango::FontMap
      # pango_cairo_font_map_new: (None)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPangoCairo.pango_cairo_font_map_new

      # Return value handling
      Pango::FontMap.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_for_font_type(fonttype : Cairo::FontType) : Pango::FontMap?
      # pango_cairo_font_map_new_for_font_type: (None)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPangoCairo.pango_cairo_font_map_new_for_font_type(fonttype)

      # Return value handling
      Pango::FontMap.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def font_type : Cairo::FontType
      # pango_cairo_font_map_get_font_type: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPangoCairo.pango_cairo_font_map_get_font_type(self)

      # Return value handling
      Cairo::FontType.from_value(_retval)
    end

    def resolution : Float64
      # pango_cairo_font_map_get_resolution: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPangoCairo.pango_cairo_font_map_get_resolution(self)

      # Return value handling
      _retval
    end

    def set_default : Nil
      # pango_cairo_font_map_set_default: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPangoCairo.pango_cairo_font_map_set_default(self)

      # Return value handling
    end

    def resolution=(dpi : Float64) : Nil
      # pango_cairo_font_map_set_resolution: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPangoCairo.pango_cairo_font_map_set_resolution(self, dpi)

      # Return value handling
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class FontMap__Impl < GObject::Object
    include FontMap

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPangoCairo.pango_cairo_font_map_get_type
    end

    # Cast a `GObject::Object` to `FontMap`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to FontMap")
    end

    # Cast a `GObject::Object` to `FontMap`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
