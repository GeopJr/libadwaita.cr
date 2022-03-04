module HarfBuzz
  # The structure that holds various text properties of an #hb_buffer_t. Can be
  # set and retrieved using hb_buffer_set_segment_properties() and
  # hb_buffer_get_segment_properties(), respectively.
  class SegmentPropertiesT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibHarfBuzz::SegmentPropertiesT))
      @pointer.copy_from(pointer, sizeof(LibHarfBuzz::SegmentPropertiesT))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(direction : HarfBuzz::DirectionT? = nil, script : HarfBuzz::ScriptT? = nil, language : HarfBuzz::LanguageT? = nil, reserved1 : Pointer(Void)? = nil, reserved2 : Pointer(Void)? = nil)
      _ptr = Pointer(Void).malloc(32)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.direction = direction unless direction.nil?
      _instance.script = script unless script.nil?
      _instance.language = language unless language.nil?
      _instance.reserved1 = reserved1 unless reserved1.nil?
      _instance.reserved2 = reserved2 unless reserved2.nil?
      _instance
    end

    def finalize
    end

    def direction : HarfBuzz::DirectionT
      # Property getter
      _var = (@pointer + 0).as(Pointer(UInt32))
      HarfBuzz::DirectionT.from_value(_var.value)
    end

    def direction=(value : HarfBuzz::DirectionT)
      # Property setter
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value.to_unsafe
      value
    end

    def script : HarfBuzz::ScriptT
      # Property getter
      _var = (@pointer + 4).as(Pointer(UInt32))
      HarfBuzz::ScriptT.from_value(_var.value)
    end

    def script=(value : HarfBuzz::ScriptT)
      # Property setter
      _var = (@pointer + 4).as(Pointer(UInt32)).value = value.to_unsafe
      value
    end

    def language : HarfBuzz::LanguageT
      # Property getter
      _var = (@pointer + 8).as(Pointer(Pointer(Void)))
      HarfBuzz::LanguageT.new(_var.value, GICrystal::Transfer::None)
    end

    def language=(value : HarfBuzz::LanguageT)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Pointer(Void))).value = value.to_unsafe
      value
    end

    def reserved1 : Pointer(Void)
      # Property getter
      _var = (@pointer + 16).as(Pointer(Pointer(Void)))
      _var.value
    end

    def reserved1=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 16).as(Pointer(Pointer(Void))).value = value
      value
    end

    def reserved2 : Pointer(Void)
      # Property getter
      _var = (@pointer + 24).as(Pointer(Pointer(Void)))
      _var.value
    end

    def reserved2=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 24).as(Pointer(Pointer(Void))).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibHarfBuzz.hb_gobject_segment_properties_get_type
    end

    def to_unsafe
      @pointer
    end
  end
end
