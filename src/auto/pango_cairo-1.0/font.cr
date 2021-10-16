module PangoCairo
  # `PangoCairoFont` is an interface exported by fonts for
  # use with Cairo.
  #
  # The actual type of the font will depend on the particular
  # font technology Cairo was compiled to use.
  module Font
    def scaled_font : Cairo::ScaledFont?
      # pango_cairo_font_get_scaled_font: (Method)
      # Returns: (transfer none)

      _retval = LibPangoCairo.pango_cairo_font_get_scaled_font(self)
      Cairo::ScaledFont.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class Font__Impl
    include Font

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPangoCairo.pango_cairo_font_get_type
    end

    # Cast a `GObject::Object` to `Font`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Font")
    end

    # Cast a `GObject::Object` to `Font`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
