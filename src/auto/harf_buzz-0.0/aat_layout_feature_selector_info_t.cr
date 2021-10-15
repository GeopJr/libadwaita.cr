module HarfBuzz
  # Structure representing a setting for an #hb_aat_layout_feature_type_t.
  class AatLayoutFeatureSelectorInfoT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibHarfBuzz::AatLayoutFeatureSelectorInfoT))
      @pointer.copy_from(pointer, sizeof(LibHarfBuzz::AatLayoutFeatureSelectorInfoT))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(name_id : UInt32? = nil, enable : HarfBuzz::AatLayoutFeatureSelectorT? = nil, disable : HarfBuzz::AatLayoutFeatureSelectorT? = nil, reserved : UInt32? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.name_id = name_id unless name_id.nil?
      _instance.enable = enable unless enable.nil?
      _instance.disable = disable unless disable.nil?
      _instance.reserved = reserved unless reserved.nil?
      _instance
    end

    def finalize
    end

    def name_id : UInt32
      # Property getter
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.value
    end

    def name_id=(value : UInt32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value
      value
    end

    def enable : HarfBuzz::AatLayoutFeatureSelectorT
      # Property getter
      _var = (@pointer + 4).as(Pointer(UInt32))
      HarfBuzz::AatLayoutFeatureSelectorT.from_value(_var.value)
    end

    def enable=(value : HarfBuzz::AatLayoutFeatureSelectorT)
      # Property setter
      _var = (@pointer + 4).as(Pointer(UInt32)).value = value.to_unsafe
      value
    end

    def disable : HarfBuzz::AatLayoutFeatureSelectorT
      # Property getter
      _var = (@pointer + 8).as(Pointer(UInt32))
      HarfBuzz::AatLayoutFeatureSelectorT.from_value(_var.value)
    end

    def disable=(value : HarfBuzz::AatLayoutFeatureSelectorT)
      # Property setter
      _var = (@pointer + 8).as(Pointer(UInt32)).value = value.to_unsafe
      value
    end

    def reserved : UInt32
      # Property getter
      _var = (@pointer + 12).as(Pointer(UInt32))
      _var.value
    end

    def reserved=(value : UInt32)
      # Property setter
      _var = (@pointer + 12).as(Pointer(UInt32)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
