module Pango
  # The `PangoColor` structure is used to
  # represent a color in an uncalibrated RGB color-space.
  class Color
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::Color))
      @pointer.copy_from(pointer, sizeof(LibPango::Color))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(red : UInt16? = nil, green : UInt16? = nil, blue : UInt16? = nil)
      _ptr = Pointer(Void).malloc(6)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.red = red unless red.nil?
      _instance.green = green unless green.nil?
      _instance.blue = blue unless blue.nil?
      _instance
    end

    def finalize
    end

    def red : UInt16
      # Property getter
      _var = (@pointer + 0).as(Pointer(UInt16))
      _var.value
    end

    def red=(value : UInt16)
      # Property setter
      _var = (@pointer + 0).as(Pointer(UInt16)).value = value
      value
    end

    def green : UInt16
      # Property getter
      _var = (@pointer + 2).as(Pointer(UInt16))
      _var.value
    end

    def green=(value : UInt16)
      # Property setter
      _var = (@pointer + 2).as(Pointer(UInt16)).value = value
      value
    end

    def blue : UInt16
      # Property getter
      _var = (@pointer + 4).as(Pointer(UInt16))
      _var.value
    end

    def blue=(value : UInt16)
      # Property setter
      _var = (@pointer + 4).as(Pointer(UInt16)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_color_get_type
    end

    def copy : Pango::Color?
      # pango_color_copy: (Method)
      # Returns: (transfer full)

      _retval = LibPango.pango_color_copy(self)
      Pango::Color.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def free : Nil
      # pango_color_free: (Method)
      # Returns: (transfer none)

      LibPango.pango_color_free(self)
    end

    def parse(spec : ::String) : Bool
      # pango_color_parse: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_color_parse(self, spec)
      GICrystal.to_bool(_retval)
    end

    def parse_with_alpha(spec : ::String) : Bool
      # pango_color_parse_with_alpha: (Method)
      # @alpha: (out) (transfer full) (optional)
      # Returns: (transfer none)

      alpha = Pointer(UInt16).null

      _retval = LibPango.pango_color_parse_with_alpha(self, alpha, spec)
      GICrystal.to_bool(_retval)
    end

    def to_string : ::String
      # pango_color_to_string: (Method)
      # Returns: (transfer full)

      _retval = LibPango.pango_color_to_string(self)
      GICrystal.transfer_full(_retval)
    end

    def to_unsafe
      @pointer
    end
  end
end
