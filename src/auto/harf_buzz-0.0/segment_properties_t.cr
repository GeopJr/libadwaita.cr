module HarfBuzz
  # The structure that holds various text properties of an #hb_buffer_t. Can be
  # set and retrieved using hb_buffer_set_segment_properties() and
  # hb_buffer_get_segment_properties(), respectively.
  class SegmentPropertiesT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

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

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibHarfBuzz::SegmentPropertiesT)).zero?
    end

    def direction : HarfBuzz::DirectionT
      _var = (@pointer + 0).as(Pointer(UInt32))
      HarfBuzz::DirectionT.new(_var)
    end

    def direction=(value : HarfBuzz::DirectionT)
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.copy_from(value.to_unsafe, sizeof(LibHarfBuzz::SegmentPropertiesT))
      value
    end

    def script : HarfBuzz::ScriptT
      _var = (@pointer + 4).as(Pointer(UInt32))
      HarfBuzz::ScriptT.new(_var)
    end

    def script=(value : HarfBuzz::ScriptT)
      _var = (@pointer + 4).as(Pointer(UInt32))
      _var.copy_from(value.to_unsafe, sizeof(LibHarfBuzz::SegmentPropertiesT))
      value
    end

    def language!
      self.language.not_nil!
    end

    def language : HarfBuzz::LanguageT?
      _var = (@pointer + 8).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      HarfBuzz::LanguageT.new(_var.value, GICrystal::Transfer::None)
    end

    def language=(value : HarfBuzz::LanguageT?)
      _var = (@pointer + 8).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value.to_unsafe
      value
    end

    def reserved1!
      self.reserved1.not_nil!
    end

    def reserved1 : Pointer(Void)?
      _var = (@pointer + 16).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      _var.value
    end

    def reserved1=(value : Pointer(Void)?)
      _var = (@pointer + 16).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value
      value
    end

    def reserved2!
      self.reserved2.not_nil!
    end

    def reserved2 : Pointer(Void)?
      _var = (@pointer + 24).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      _var.value
    end

    def reserved2=(value : Pointer(Void)?)
      _var = (@pointer + 24).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value
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
