module HarfBuzz
  # Structure representing a name ID in a particular language.
  class OtNameEntryT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibHarfBuzz::OtNameEntryT))
      @pointer.copy_from(pointer, sizeof(LibHarfBuzz::OtNameEntryT))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(name_id : UInt32? = nil, var : HarfBuzz::VarIntT? = nil, language : HarfBuzz::LanguageT? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.name_id = name_id unless name_id.nil?
      _instance.var = var unless var.nil?
      _instance.language = language unless language.nil?
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

    def var : HarfBuzz::VarIntT
      # Property getter
      _var = (@pointer + 4).as(Pointer(LibHarfBuzz::VarIntT))
      HarfBuzz::VarIntT.new(_var.value, GICrystal::Transfer::Full)
    end

    def var=(value : HarfBuzz::VarIntT)
      # Property setter
      _var = (@pointer + 4).as(Pointer(LibHarfBuzz::VarIntT)).value = value.to_unsafe
      value
    end

    def language : HarfBuzz::LanguageT
      # Property getter
      _var = (@pointer + 8).as(Pointer(Pointer(LibHarfBuzz::LanguageT)))
      HarfBuzz::LanguageT.new(_var.value, GICrystal::Transfer::Full)
    end

    def language=(value : HarfBuzz::LanguageT)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Pointer(LibHarfBuzz::LanguageT))).value = value.to_unsafe
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
