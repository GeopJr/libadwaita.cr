module Pango
  # A `PangoFontDescription` describes a font in an implementation-independent
  # manner.
  #
  # `PangoFontDescription` structures are used both to list what fonts are
  # available on the system and also for specifying the characteristics of
  # a font to load.
  class FontDescription
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(FontDescription.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(FontDescription.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_font_description_get_type
    end

    def initialize
      # pango_font_description_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibPango.pango_font_description_new
      @pointer = _retval
    end

    def better_match(old_match : Pango::FontDescription?, new_match : Pango::FontDescription) : Bool
      # pango_font_description_better_match: (Method)
      # @old_match: (nullable)
      # Returns: (transfer none)

      old_match = if old_match.nil?
                    Pointer(Void).null
                  else
                    old_match.to_unsafe
                  end

      _retval = LibPango.pango_font_description_better_match(self, old_match, new_match)
      GICrystal.to_bool(_retval)
    end

    def copy : Pango::FontDescription?
      # pango_font_description_copy: (Method)
      # Returns: (transfer full)

      _retval = LibPango.pango_font_description_copy(self)
      Pango::FontDescription.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def copy_static : Pango::FontDescription?
      # pango_font_description_copy_static: (Method)
      # Returns: (transfer full)

      _retval = LibPango.pango_font_description_copy_static(self)
      Pango::FontDescription.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def equal(desc2 : Pango::FontDescription) : Bool
      # pango_font_description_equal: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_font_description_equal(self, desc2)
      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # pango_font_description_free: (Method)
      # Returns: (transfer none)

      LibPango.pango_font_description_free(self)
    end

    def family : ::String?
      # pango_font_description_get_family: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_font_description_get_family(self)
      ::String.new(_retval) unless _retval.null?
    end

    def gravity : Pango::Gravity
      # pango_font_description_get_gravity: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_font_description_get_gravity(self)
      Pango::Gravity.from_value(_retval)
    end

    def set_fields : Pango::FontMask
      # pango_font_description_get_set_fields: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_font_description_get_set_fields(self)
      Pango::FontMask.from_value(_retval)
    end

    def size : Int32
      # pango_font_description_get_size: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_font_description_get_size(self)
      _retval
    end

    def size_is_absolute? : Bool
      # pango_font_description_get_size_is_absolute: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_font_description_get_size_is_absolute(self)
      GICrystal.to_bool(_retval)
    end

    def stretch : Pango::Stretch
      # pango_font_description_get_stretch: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_font_description_get_stretch(self)
      Pango::Stretch.from_value(_retval)
    end

    def style : Pango::Style
      # pango_font_description_get_style: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_font_description_get_style(self)
      Pango::Style.from_value(_retval)
    end

    def variant : Pango::Variant
      # pango_font_description_get_variant: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_font_description_get_variant(self)
      Pango::Variant.from_value(_retval)
    end

    def variations : ::String?
      # pango_font_description_get_variations: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_font_description_get_variations(self)
      ::String.new(_retval) unless _retval.null?
    end

    def weight : Pango::Weight
      # pango_font_description_get_weight: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_font_description_get_weight(self)
      Pango::Weight.from_value(_retval)
    end

    def hash : UInt32
      # pango_font_description_hash: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_font_description_hash(self)
      _retval
    end

    def merge(desc_to_merge : Pango::FontDescription?, replace_existing : Bool) : Nil
      # pango_font_description_merge: (Method)
      # @desc_to_merge: (nullable)
      # Returns: (transfer none)

      desc_to_merge = if desc_to_merge.nil?
                        Pointer(Void).null
                      else
                        desc_to_merge.to_unsafe
                      end

      LibPango.pango_font_description_merge(self, desc_to_merge, replace_existing)
    end

    def merge_static(desc_to_merge : Pango::FontDescription, replace_existing : Bool) : Nil
      # pango_font_description_merge_static: (Method)
      # Returns: (transfer none)

      LibPango.pango_font_description_merge_static(self, desc_to_merge, replace_existing)
    end

    def absolute_size=(size : Float64) : Nil
      # pango_font_description_set_absolute_size: (Method)
      # Returns: (transfer none)

      LibPango.pango_font_description_set_absolute_size(self, size)
    end

    def family=(family : ::String) : Nil
      # pango_font_description_set_family: (Method)
      # Returns: (transfer none)

      LibPango.pango_font_description_set_family(self, family)
    end

    def family_static=(family : ::String) : Nil
      # pango_font_description_set_family_static: (Method)
      # Returns: (transfer none)

      LibPango.pango_font_description_set_family_static(self, family)
    end

    def gravity=(gravity : Pango::Gravity) : Nil
      # pango_font_description_set_gravity: (Method)
      # Returns: (transfer none)

      LibPango.pango_font_description_set_gravity(self, gravity)
    end

    def size=(size : Int32) : Nil
      # pango_font_description_set_size: (Method)
      # Returns: (transfer none)

      LibPango.pango_font_description_set_size(self, size)
    end

    def stretch=(stretch : Pango::Stretch) : Nil
      # pango_font_description_set_stretch: (Method)
      # Returns: (transfer none)

      LibPango.pango_font_description_set_stretch(self, stretch)
    end

    def style=(style : Pango::Style) : Nil
      # pango_font_description_set_style: (Method)
      # Returns: (transfer none)

      LibPango.pango_font_description_set_style(self, style)
    end

    def variant=(variant : Pango::Variant) : Nil
      # pango_font_description_set_variant: (Method)
      # Returns: (transfer none)

      LibPango.pango_font_description_set_variant(self, variant)
    end

    def variations=(variations : ::String) : Nil
      # pango_font_description_set_variations: (Method)
      # Returns: (transfer none)

      LibPango.pango_font_description_set_variations(self, variations)
    end

    def variations_static=(variations : ::String) : Nil
      # pango_font_description_set_variations_static: (Method)
      # Returns: (transfer none)

      LibPango.pango_font_description_set_variations_static(self, variations)
    end

    def weight=(weight : Pango::Weight) : Nil
      # pango_font_description_set_weight: (Method)
      # Returns: (transfer none)

      LibPango.pango_font_description_set_weight(self, weight)
    end

    def to_filename : ::String
      # pango_font_description_to_filename: (Method)
      # Returns: (transfer full)

      _retval = LibPango.pango_font_description_to_filename(self)
      GICrystal.transfer_full(_retval)
    end

    def to_string : ::String
      # pango_font_description_to_string: (Method)
      # Returns: (transfer full)

      _retval = LibPango.pango_font_description_to_string(self)
      GICrystal.transfer_full(_retval)
    end

    def unset_fields(to_unset : Pango::FontMask) : Nil
      # pango_font_description_unset_fields: (Method)
      # Returns: (transfer none)

      LibPango.pango_font_description_unset_fields(self, to_unset)
    end

    def self.from_string(str : ::String) : Pango::FontDescription
      # pango_font_description_from_string: (None)
      # Returns: (transfer full)

      _retval = LibPango.pango_font_description_from_string(str)
      Pango::FontDescription.new(_retval, GICrystal::Transfer::Full)
    end

    def to_unsafe
      @pointer
    end
  end
end
