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
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(FontDescription.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(FontDescription.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibPango::FontDescription)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_font_description_get_type
    end

    def better_match(old_match : Pango::FontDescription?, new_match : Pango::FontDescription) : Bool
      # pango_font_description_better_match: (Method)
      # @old_match: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      old_match = if old_match.nil?
                    Pointer(Void).null
                  else
                    old_match.to_unsafe
                  end

      # C call
      _retval = LibPango.pango_font_description_better_match(@pointer, old_match, new_match)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def copy : Pango::FontDescription?
      # pango_font_description_copy: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_font_description_copy(@pointer)

      # Return value handling

      Pango::FontDescription.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def copy_static : Pango::FontDescription?
      # pango_font_description_copy_static: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_font_description_copy_static(@pointer)

      # Return value handling

      Pango::FontDescription.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def equal(desc2 : Pango::FontDescription) : Bool
      # pango_font_description_equal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_description_equal(@pointer, desc2)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # pango_font_description_free: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_font_description_free(@pointer)

      # Return value handling
    end

    def family : ::String?
      # pango_font_description_get_family: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_description_get_family(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    def gravity : Pango::Gravity
      # pango_font_description_get_gravity: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_description_get_gravity(@pointer)

      # Return value handling

      Pango::Gravity.new(_retval)
    end

    def set_fields : Pango::FontMask
      # pango_font_description_get_set_fields: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_description_get_set_fields(@pointer)

      # Return value handling

      Pango::FontMask.new(_retval)
    end

    def size : Int32
      # pango_font_description_get_size: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_description_get_size(@pointer)

      # Return value handling

      _retval
    end

    def size_is_absolute : Bool
      # pango_font_description_get_size_is_absolute: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_description_get_size_is_absolute(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def stretch : Pango::Stretch
      # pango_font_description_get_stretch: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_description_get_stretch(@pointer)

      # Return value handling

      Pango::Stretch.new(_retval)
    end

    def style : Pango::Style
      # pango_font_description_get_style: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_description_get_style(@pointer)

      # Return value handling

      Pango::Style.new(_retval)
    end

    def variant : Pango::Variant
      # pango_font_description_get_variant: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_description_get_variant(@pointer)

      # Return value handling

      Pango::Variant.new(_retval)
    end

    def variations : ::String?
      # pango_font_description_get_variations: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_description_get_variations(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    def weight : Pango::Weight
      # pango_font_description_get_weight: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_description_get_weight(@pointer)

      # Return value handling

      Pango::Weight.new(_retval)
    end

    def hash : UInt32
      # pango_font_description_hash: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_description_hash(@pointer)

      # Return value handling

      _retval
    end

    def merge(desc_to_merge : Pango::FontDescription?, replace_existing : Bool) : Nil
      # pango_font_description_merge: (Method)
      # @desc_to_merge: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      desc_to_merge = if desc_to_merge.nil?
                        Pointer(Void).null
                      else
                        desc_to_merge.to_unsafe
                      end

      # C call
      LibPango.pango_font_description_merge(@pointer, desc_to_merge, replace_existing)

      # Return value handling
    end

    def merge_static(desc_to_merge : Pango::FontDescription, replace_existing : Bool) : Nil
      # pango_font_description_merge_static: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_font_description_merge_static(@pointer, desc_to_merge, replace_existing)

      # Return value handling
    end

    def absolute_size=(size : Float64) : Nil
      # pango_font_description_set_absolute_size: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_font_description_set_absolute_size(@pointer, size)

      # Return value handling
    end

    def family=(family : ::String) : Nil
      # pango_font_description_set_family: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_font_description_set_family(@pointer, family)

      # Return value handling
    end

    def family_static=(family : ::String) : Nil
      # pango_font_description_set_family_static: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_font_description_set_family_static(@pointer, family)

      # Return value handling
    end

    def gravity=(gravity : Pango::Gravity) : Nil
      # pango_font_description_set_gravity: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_font_description_set_gravity(@pointer, gravity)

      # Return value handling
    end

    def size=(size : Int32) : Nil
      # pango_font_description_set_size: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_font_description_set_size(@pointer, size)

      # Return value handling
    end

    def stretch=(stretch : Pango::Stretch) : Nil
      # pango_font_description_set_stretch: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_font_description_set_stretch(@pointer, stretch)

      # Return value handling
    end

    def style=(style : Pango::Style) : Nil
      # pango_font_description_set_style: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_font_description_set_style(@pointer, style)

      # Return value handling
    end

    def variant=(variant : Pango::Variant) : Nil
      # pango_font_description_set_variant: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_font_description_set_variant(@pointer, variant)

      # Return value handling
    end

    def variations=(variations : ::String?) : Nil
      # pango_font_description_set_variations: (Method)
      # @variations: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      variations = if variations.nil?
                     Pointer(LibC::Char).null
                   else
                     variations.to_unsafe
                   end

      # C call
      LibPango.pango_font_description_set_variations(@pointer, variations)

      # Return value handling
    end

    def variations_static=(variations : ::String) : Nil
      # pango_font_description_set_variations_static: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_font_description_set_variations_static(@pointer, variations)

      # Return value handling
    end

    def weight=(weight : Pango::Weight) : Nil
      # pango_font_description_set_weight: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_font_description_set_weight(@pointer, weight)

      # Return value handling
    end

    def to_filename : ::String
      # pango_font_description_to_filename: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_font_description_to_filename(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def to_string : ::String
      # pango_font_description_to_string: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_font_description_to_string(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def unset_fields(to_unset : Pango::FontMask) : Nil
      # pango_font_description_unset_fields: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_font_description_unset_fields(@pointer, to_unset)

      # Return value handling
    end

    def self.from_string(str : ::String) : Pango::FontDescription
      # pango_font_description_from_string: (None)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_font_description_from_string(str)

      # Return value handling

      Pango::FontDescription.new(_retval, GICrystal::Transfer::Full)
    end

    def to_unsafe
      @pointer
    end
  end
end
