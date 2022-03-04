module GObject
  # A structure which contains a single enum value, its name, and its
  # nickname.
  class EnumValue
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::EnumValue))
      @pointer.copy_from(pointer, sizeof(LibGObject::EnumValue))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(value : Int32? = nil, value_name : ::String? = nil, value_nick : ::String? = nil)
      _ptr = Pointer(Void).malloc(24)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.value = value unless value.nil?
      _instance.value_name = value_name unless value_name.nil?
      _instance.value_nick = value_nick unless value_nick.nil?
      _instance
    end

    def finalize
    end

    def value : Int32
      # Property getter
      _var = (@pointer + 0).as(Pointer(Int32))
      _var.value
    end

    def value=(value : Int32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Int32)).value = value
      value
    end

    def value_name : ::String
      # Property getter
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char)))
      ::String.new(_var.value)
    end

    def value_name=(value : ::String)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def value_nick : ::String
      # Property getter
      _var = (@pointer + 16).as(Pointer(Pointer(LibC::Char)))
      ::String.new(_var.value)
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
