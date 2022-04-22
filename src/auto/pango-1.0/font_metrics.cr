module Pango
  # A `PangoFontMetrics` structure holds the overall metric information
  # for a font.
  #
  # The information in a `PangoFontMetrics` structure may be restricted
  # to a script. The fields of this structure are private to implementations
  # of a font backend. See the documentation of the corresponding getters
  # for documentation of their meaning.
  #
  # For an overview of the most important metrics, see:
  #
  # <picture>
  #   <source srcset="fontmetrics-dark.png" media="(prefers-color-scheme: dark)">
  #   <img alt="Font metrics" src="fontmetrics-light.png">
  # </picture>
  class FontMetrics
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::FontMetrics))
      @pointer.copy_from(pointer, sizeof(LibPango::FontMetrics))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(ref_count : UInt32? = nil, ascent : Int32? = nil, descent : Int32? = nil, height : Int32? = nil, approximate_char_width : Int32? = nil, approximate_digit_width : Int32? = nil, underline_position : Int32? = nil, underline_thickness : Int32? = nil, strikethrough_position : Int32? = nil, strikethrough_thickness : Int32? = nil)
      _ptr = Pointer(Void).malloc(40)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.ref_count = ref_count unless ref_count.nil?
      _instance.ascent = ascent unless ascent.nil?
      _instance.descent = descent unless descent.nil?
      _instance.height = height unless height.nil?
      _instance.approximate_char_width = approximate_char_width unless approximate_char_width.nil?
      _instance.approximate_digit_width = approximate_digit_width unless approximate_digit_width.nil?
      _instance.underline_position = underline_position unless underline_position.nil?
      _instance.underline_thickness = underline_thickness unless underline_thickness.nil?
      _instance.strikethrough_position = strikethrough_position unless strikethrough_position.nil?
      _instance.strikethrough_thickness = strikethrough_thickness unless strikethrough_thickness.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibPango::FontMetrics)).zero?
    end

    def ref_count : UInt32
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.value
    end

    def ref_count=(value : UInt32)
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value
      value
    end

    def ascent : Int32
      _var = (@pointer + 4).as(Pointer(Int32))
      _var.value
    end

    def ascent=(value : Int32)
      _var = (@pointer + 4).as(Pointer(Int32)).value = value
      value
    end

    def descent : Int32
      _var = (@pointer + 8).as(Pointer(Int32))
      _var.value
    end

    def descent=(value : Int32)
      _var = (@pointer + 8).as(Pointer(Int32)).value = value
      value
    end

    def height : Int32
      _var = (@pointer + 12).as(Pointer(Int32))
      _var.value
    end

    def height=(value : Int32)
      _var = (@pointer + 12).as(Pointer(Int32)).value = value
      value
    end

    def approximate_char_width : Int32
      _var = (@pointer + 16).as(Pointer(Int32))
      _var.value
    end

    def approximate_char_width=(value : Int32)
      _var = (@pointer + 16).as(Pointer(Int32)).value = value
      value
    end

    def approximate_digit_width : Int32
      _var = (@pointer + 20).as(Pointer(Int32))
      _var.value
    end

    def approximate_digit_width=(value : Int32)
      _var = (@pointer + 20).as(Pointer(Int32)).value = value
      value
    end

    def underline_position : Int32
      _var = (@pointer + 24).as(Pointer(Int32))
      _var.value
    end

    def underline_position=(value : Int32)
      _var = (@pointer + 24).as(Pointer(Int32)).value = value
      value
    end

    def underline_thickness : Int32
      _var = (@pointer + 28).as(Pointer(Int32))
      _var.value
    end

    def underline_thickness=(value : Int32)
      _var = (@pointer + 28).as(Pointer(Int32)).value = value
      value
    end

    def strikethrough_position : Int32
      _var = (@pointer + 32).as(Pointer(Int32))
      _var.value
    end

    def strikethrough_position=(value : Int32)
      _var = (@pointer + 32).as(Pointer(Int32)).value = value
      value
    end

    def strikethrough_thickness : Int32
      _var = (@pointer + 36).as(Pointer(Int32))
      _var.value
    end

    def strikethrough_thickness=(value : Int32)
      _var = (@pointer + 36).as(Pointer(Int32)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_font_metrics_get_type
    end

    def approximate_char_width : Int32
      # pango_font_metrics_get_approximate_char_width: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_metrics_get_approximate_char_width(self)

      # Return value handling

      _retval
    end

    def approximate_digit_width : Int32
      # pango_font_metrics_get_approximate_digit_width: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_metrics_get_approximate_digit_width(self)

      # Return value handling

      _retval
    end

    def ascent : Int32
      # pango_font_metrics_get_ascent: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_metrics_get_ascent(self)

      # Return value handling

      _retval
    end

    def descent : Int32
      # pango_font_metrics_get_descent: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_metrics_get_descent(self)

      # Return value handling

      _retval
    end

    def height : Int32
      # pango_font_metrics_get_height: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_metrics_get_height(self)

      # Return value handling

      _retval
    end

    def strikethrough_position : Int32
      # pango_font_metrics_get_strikethrough_position: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_metrics_get_strikethrough_position(self)

      # Return value handling

      _retval
    end

    def strikethrough_thickness : Int32
      # pango_font_metrics_get_strikethrough_thickness: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_metrics_get_strikethrough_thickness(self)

      # Return value handling

      _retval
    end

    def underline_position : Int32
      # pango_font_metrics_get_underline_position: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_metrics_get_underline_position(self)

      # Return value handling

      _retval
    end

    def underline_thickness : Int32
      # pango_font_metrics_get_underline_thickness: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_font_metrics_get_underline_thickness(self)

      # Return value handling

      _retval
    end

    def ref : Pango::FontMetrics?
      # pango_font_metrics_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_font_metrics_ref(self)

      # Return value handling

      Pango::FontMetrics.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def unref : Nil
      # pango_font_metrics_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_font_metrics_unref(self)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
