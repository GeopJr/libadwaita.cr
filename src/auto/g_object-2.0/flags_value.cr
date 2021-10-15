module GObject
  # A structure which contains a single flags value, its name, and its
  # nickname.
  class FlagsValue
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::FlagsValue))
      @pointer.copy_from(pointer, sizeof(LibGObject::FlagsValue))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(value : UInt32? = nil, value_name : ::String? = nil, value_nick : ::String? = nil)
      _ptr = Pointer(Void).malloc(24)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.value = value unless value.nil?
      _instance.value_name = value_name unless value_name.nil?
      _instance.value_nick = value_nick unless value_nick.nil?
      _instance
    end

    def finalize
    end

    def value : UInt32
      # Property getter
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.value
    end

    def value=(value : UInt32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value
      value
    end

    def value_name : ::String
      # Property getter
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char)))
      GICrystal.transfer_full(_var.value)
    end

    def value_name=(value : ::String)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def value_nick : ::String
      # Property getter
      _var = (@pointer + 16).as(Pointer(Pointer(LibC::Char)))
      GICrystal.transfer_full(_var.value)
    end

    def value_nick=(value : ::String)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
