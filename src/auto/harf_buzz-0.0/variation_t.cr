module HarfBuzz
  # Data type for holding variation data. Registered OpenType
  # variation-axis tags are listed in
  # [OpenType Axis Tag Registry](https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg).
  class VariationT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibHarfBuzz::VariationT))
      @pointer.copy_from(pointer, sizeof(LibHarfBuzz::VariationT))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(tag : UInt32? = nil, value : Float32? = nil)
      _ptr = Pointer(Void).malloc(8)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.tag = tag unless tag.nil?
      _instance.value = value unless value.nil?
      _instance
    end

    def finalize
    end

    def tag : UInt32
      # Property getter
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.value
    end

    def tag=(value : UInt32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value
      value
    end

    def value : Float32
      # Property getter
      _var = (@pointer + 4).as(Pointer(Float32))
      _var.value
    end

    def value=(value : Float32)
      # Property setter
      _var = (@pointer + 4).as(Pointer(Float32)).value = value
      value
    end

    def _string(buf : Enumerable(::String)) : Nil
      # hb_variation_to_string: (Method)
      # @buf: (out) (transfer full) (array length=size element-type Utf8)
      # @size: (out) (transfer full)
      # Returns: (transfer none)

      # Handle parameters
      size = buf.size
      buf = buf.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibHarfBuzz.hb_variation_to_string(self, buf, size)

      # Return value handling
    end

    def _string(*buf : ::String)
      _string(buf)
    end

    def to_unsafe
      @pointer
    end
  end
end
