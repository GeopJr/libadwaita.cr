module HarfBuzz
  # Data type to hold math kerning (cut-in) information for a glyph.
  class OtMathKernEntryT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibHarfBuzz::OtMathKernEntryT))
      @pointer.copy_from(pointer, sizeof(LibHarfBuzz::OtMathKernEntryT))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(max_correction_height : Int32? = nil, kern_value : Int32? = nil)
      _ptr = Pointer(Void).malloc(8)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.max_correction_height = max_correction_height unless max_correction_height.nil?
      _instance.kern_value = kern_value unless kern_value.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibHarfBuzz::OtMathKernEntryT)).zero?
    end

    def max_correction_height : Int32
      _var = (@pointer + 0).as(Pointer(Int32))
      _var.value
    end

    def max_correction_height=(value : Int32)
      _var = (@pointer + 0).as(Pointer(Int32)).value = value
      value
    end

    def kern_value : Int32
      _var = (@pointer + 4).as(Pointer(Int32))
      _var.value
    end

    def kern_value=(value : Int32)
      _var = (@pointer + 4).as(Pointer(Int32)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
