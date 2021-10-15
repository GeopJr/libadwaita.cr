module Gdk
  # A `GdkRGBA` is used to represent a color, in a way that is compatible
  # with cairo’s notion of color.
  #
  # `GdkRGBA` is a convenient way to pass colors around. It’s based on
  # cairo’s way to deal with colors and mirrors its behavior. All values
  # are in the range from 0.0 to 1.0 inclusive. So the color
  # (0.0, 0.0, 0.0, 0.0) represents transparent black and
  # (1.0, 1.0, 1.0, 1.0) is opaque white. Other values will
  # be clamped to this range when drawing.
  class RGBA
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGdk::RGBA))
      @pointer.copy_from(pointer, sizeof(LibGdk::RGBA))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(red : Float32? = nil, green : Float32? = nil, blue : Float32? = nil, alpha : Float32? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.red = red unless red.nil?
      _instance.green = green unless green.nil?
      _instance.blue = blue unless blue.nil?
      _instance.alpha = alpha unless alpha.nil?
      _instance
    end

    def finalize
    end

    def red : Float32
      # Property getter
      _var = (@pointer + 0).as(Pointer(Float32))
      _var.value
    end

    def red=(value : Float32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Float32)).value = value
      value
    end

    def green : Float32
      # Property getter
      _var = (@pointer + 4).as(Pointer(Float32))
      _var.value
    end

    def green=(value : Float32)
      # Property setter
      _var = (@pointer + 4).as(Pointer(Float32)).value = value
      value
    end

    def blue : Float32
      # Property getter
      _var = (@pointer + 8).as(Pointer(Float32))
      _var.value
    end

    def blue=(value : Float32)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Float32)).value = value
      value
    end

    def alpha : Float32
      # Property getter
      _var = (@pointer + 12).as(Pointer(Float32))
      _var.value
    end

    def alpha=(value : Float32)
      # Property setter
      _var = (@pointer + 12).as(Pointer(Float32)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_rgba_get_type
    end

    def copy : Gdk::RGBA
      # gdk_rgba_copy: (Method)
      # Returns: (transfer full)

      _retval = LibGdk.gdk_rgba_copy(self)
      Gdk::RGBA.new(_retval, GICrystal::Transfer::Full)
    end

    def equal(p2 : Gdk::RGBA) : Bool
      # gdk_rgba_equal: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_rgba_equal(self, p2)
      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # gdk_rgba_free: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_rgba_free(self)
    end

    def hash : UInt32
      # gdk_rgba_hash: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_rgba_hash(self)
      _retval
    end

    def is_clear : Bool
      # gdk_rgba_is_clear: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_rgba_is_clear(self)
      GICrystal.to_bool(_retval)
    end

    def is_opaque : Bool
      # gdk_rgba_is_opaque: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_rgba_is_opaque(self)
      GICrystal.to_bool(_retval)
    end

    def parse(spec : ::String) : Bool
      # gdk_rgba_parse: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_rgba_parse(self, spec)
      GICrystal.to_bool(_retval)
    end

    def to_string : ::String
      # gdk_rgba_to_string: (Method)
      # Returns: (transfer full)

      _retval = LibGdk.gdk_rgba_to_string(self)
      GICrystal.transfer_full(_retval)
    end

    def to_unsafe
      @pointer
    end
  end
end
