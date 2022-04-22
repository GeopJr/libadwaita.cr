module HarfBuzz
  # Data type for holding variation-axis values.
  #
  # The minimum, default, and maximum values are in un-normalized, user scales.
  #
  # <note>Note: at present, the only flag defined for @flags is
  # #HB_OT_VAR_AXIS_FLAG_HIDDEN.</note>
  class OtVarAxisInfoT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibHarfBuzz::OtVarAxisInfoT))
      @pointer.copy_from(pointer, sizeof(LibHarfBuzz::OtVarAxisInfoT))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(axis_index : UInt32? = nil, tag : UInt32? = nil, name_id : UInt32? = nil, flags : HarfBuzz::OtVarAxisFlagsT? = nil, min_value : Float32? = nil, default_value : Float32? = nil, max_value : Float32? = nil, reserved : UInt32? = nil)
      _ptr = Pointer(Void).malloc(32)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.axis_index = axis_index unless axis_index.nil?
      _instance.tag = tag unless tag.nil?
      _instance.name_id = name_id unless name_id.nil?
      _instance.flags = flags unless flags.nil?
      _instance.min_value = min_value unless min_value.nil?
      _instance.default_value = default_value unless default_value.nil?
      _instance.max_value = max_value unless max_value.nil?
      _instance.reserved = reserved unless reserved.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibHarfBuzz::OtVarAxisInfoT)).zero?
    end

    def axis_index : UInt32
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.value
    end

    def axis_index=(value : UInt32)
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value
      value
    end

    def tag : UInt32
      _var = (@pointer + 4).as(Pointer(UInt32))
      _var.value
    end

    def tag=(value : UInt32)
      _var = (@pointer + 4).as(Pointer(UInt32)).value = value
      value
    end

    def name_id : UInt32
      _var = (@pointer + 8).as(Pointer(UInt32))
      _var.value
    end

    def name_id=(value : UInt32)
      _var = (@pointer + 8).as(Pointer(UInt32)).value = value
      value
    end

    def flags : HarfBuzz::OtVarAxisFlagsT
      _var = (@pointer + 12).as(Pointer(UInt32))
      HarfBuzz::OtVarAxisFlagsT.new(_var)
    end

    def flags=(value : HarfBuzz::OtVarAxisFlagsT)
      _var = (@pointer + 12).as(Pointer(UInt32))
      _var.copy_from(value.to_unsafe, sizeof(LibHarfBuzz::OtVarAxisInfoT))
      value
    end

    def min_value : Float32
      _var = (@pointer + 16).as(Pointer(Float32))
      _var.value
    end

    def min_value=(value : Float32)
      _var = (@pointer + 16).as(Pointer(Float32)).value = value
      value
    end

    def default_value : Float32
      _var = (@pointer + 20).as(Pointer(Float32))
      _var.value
    end

    def default_value=(value : Float32)
      _var = (@pointer + 20).as(Pointer(Float32)).value = value
      value
    end

    def max_value : Float32
      _var = (@pointer + 24).as(Pointer(Float32))
      _var.value
    end

    def max_value=(value : Float32)
      _var = (@pointer + 24).as(Pointer(Float32)).value = value
      value
    end

    def reserved : UInt32
      _var = (@pointer + 28).as(Pointer(UInt32))
      _var.value
    end

    def reserved=(value : UInt32)
      _var = (@pointer + 28).as(Pointer(UInt32)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
