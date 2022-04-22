module HarfBuzz
  # Font-wide extent values, measured in font units.
  #
  # Note that typically @ascender is positive and @descender
  # negative, in coordinate systems that grow up.
  class FontExtentsT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibHarfBuzz::FontExtentsT))
      @pointer.copy_from(pointer, sizeof(LibHarfBuzz::FontExtentsT))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(ascender : Int32? = nil, descender : Int32? = nil, line_gap : Int32? = nil, reserved9 : Int32? = nil, reserved8 : Int32? = nil, reserved7 : Int32? = nil, reserved6 : Int32? = nil, reserved5 : Int32? = nil, reserved4 : Int32? = nil, reserved3 : Int32? = nil, reserved2 : Int32? = nil, reserved1 : Int32? = nil)
      _ptr = Pointer(Void).malloc(48)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.ascender = ascender unless ascender.nil?
      _instance.descender = descender unless descender.nil?
      _instance.line_gap = line_gap unless line_gap.nil?
      _instance.reserved9 = reserved9 unless reserved9.nil?
      _instance.reserved8 = reserved8 unless reserved8.nil?
      _instance.reserved7 = reserved7 unless reserved7.nil?
      _instance.reserved6 = reserved6 unless reserved6.nil?
      _instance.reserved5 = reserved5 unless reserved5.nil?
      _instance.reserved4 = reserved4 unless reserved4.nil?
      _instance.reserved3 = reserved3 unless reserved3.nil?
      _instance.reserved2 = reserved2 unless reserved2.nil?
      _instance.reserved1 = reserved1 unless reserved1.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibHarfBuzz::FontExtentsT)).zero?
    end

    def ascender : Int32
      _var = (@pointer + 0).as(Pointer(Int32))
      _var.value
    end

    def ascender=(value : Int32)
      _var = (@pointer + 0).as(Pointer(Int32)).value = value
      value
    end

    def descender : Int32
      _var = (@pointer + 4).as(Pointer(Int32))
      _var.value
    end

    def descender=(value : Int32)
      _var = (@pointer + 4).as(Pointer(Int32)).value = value
      value
    end

    def line_gap : Int32
      _var = (@pointer + 8).as(Pointer(Int32))
      _var.value
    end

    def line_gap=(value : Int32)
      _var = (@pointer + 8).as(Pointer(Int32)).value = value
      value
    end

    def reserved9 : Int32
      _var = (@pointer + 12).as(Pointer(Int32))
      _var.value
    end

    def reserved9=(value : Int32)
      _var = (@pointer + 12).as(Pointer(Int32)).value = value
      value
    end

    def reserved8 : Int32
      _var = (@pointer + 16).as(Pointer(Int32))
      _var.value
    end

    def reserved8=(value : Int32)
      _var = (@pointer + 16).as(Pointer(Int32)).value = value
      value
    end

    def reserved7 : Int32
      _var = (@pointer + 20).as(Pointer(Int32))
      _var.value
    end

    def reserved7=(value : Int32)
      _var = (@pointer + 20).as(Pointer(Int32)).value = value
      value
    end

    def reserved6 : Int32
      _var = (@pointer + 24).as(Pointer(Int32))
      _var.value
    end

    def reserved6=(value : Int32)
      _var = (@pointer + 24).as(Pointer(Int32)).value = value
      value
    end

    def reserved5 : Int32
      _var = (@pointer + 28).as(Pointer(Int32))
      _var.value
    end

    def reserved5=(value : Int32)
      _var = (@pointer + 28).as(Pointer(Int32)).value = value
      value
    end

    def reserved4 : Int32
      _var = (@pointer + 32).as(Pointer(Int32))
      _var.value
    end

    def reserved4=(value : Int32)
      _var = (@pointer + 32).as(Pointer(Int32)).value = value
      value
    end

    def reserved3 : Int32
      _var = (@pointer + 36).as(Pointer(Int32))
      _var.value
    end

    def reserved3=(value : Int32)
      _var = (@pointer + 36).as(Pointer(Int32)).value = value
      value
    end

    def reserved2 : Int32
      _var = (@pointer + 40).as(Pointer(Int32))
      _var.value
    end

    def reserved2=(value : Int32)
      _var = (@pointer + 40).as(Pointer(Int32)).value = value
      value
    end

    def reserved1 : Int32
      _var = (@pointer + 44).as(Pointer(Int32))
      _var.value
    end

    def reserved1=(value : Int32)
      _var = (@pointer + 44).as(Pointer(Int32)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
