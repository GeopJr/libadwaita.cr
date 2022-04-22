module HarfBuzz
  # Structure representing a name ID in a particular language.
  class OtNameEntryT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

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

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibHarfBuzz::OtNameEntryT)).zero?
    end

    def name_id : UInt32
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.value
    end

    def name_id=(value : UInt32)
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value
      value
    end

    def var : HarfBuzz::VarIntT
      _var = (@pointer + 4).as(Pointer(LibHarfBuzz::VarIntT))
      HarfBuzz::VarIntT.new(_var, GICrystal::Transfer::None)
    end

    def var=(value : HarfBuzz::VarIntT)
      _var = (@pointer + 4).as(Pointer(LibHarfBuzz::VarIntT))
      _var.copy_from(value.to_unsafe, sizeof(LibHarfBuzz::OtNameEntryT))
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

    def to_unsafe
      @pointer
    end
  end
end
