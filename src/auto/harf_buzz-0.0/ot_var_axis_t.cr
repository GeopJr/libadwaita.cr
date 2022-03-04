module HarfBuzz
  # Use #hb_ot_var_axis_info_t instead.
  class OtVarAxisT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibHarfBuzz::OtVarAxisT))
      @pointer.copy_from(pointer, sizeof(LibHarfBuzz::OtVarAxisT))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(tag : UInt32? = nil, name_id : UInt32? = nil, min_value : Float32? = nil, default_value : Float32? = nil, max_value : Float32? = nil)
      _ptr = Pointer(Void).malloc(20)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.tag = tag unless tag.nil?
      _instance.name_id = name_id unless name_id.nil?
      _instance.min_value = min_value unless min_value.nil?
      _instance.default_value = default_value unless default_value.nil?
      _instance.max_value = max_value unless max_value.nil?
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

    def name_id : UInt32
      # Property getter
      _var = (@pointer + 4).as(Pointer(UInt32))
      _var.value
    end

    def name_id=(value : UInt32)
      # Property setter
      _var = (@pointer + 4).as(Pointer(UInt32)).value = value
      value
    end

    def min_value : Float32
      # Property getter
      _var = (@pointer + 8).as(Pointer(Float32))
      _var.value
    end

    def min_value=(value : Float32)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Float32)).value = value
      value
    end

    def default_value : Float32
      # Property getter
      _var = (@pointer + 12).as(Pointer(Float32))
      _var.value
    end

    def default_value=(value : Float32)
      # Property setter
      _var = (@pointer + 12).as(Pointer(Float32)).value = value
      value
    end

    def max_value : Float32
      # Property getter
      _var = (@pointer + 16).as(Pointer(Float32))
      _var.value
    end

    def max_value=(value : Float32)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Float32)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
