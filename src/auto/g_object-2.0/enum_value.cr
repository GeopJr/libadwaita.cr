module GObject
  # A structure which contains a single enum value, its name, and its
  # nickname.
  class EnumValue
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

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

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGObject::EnumValue)).zero?
    end

    def value : Int32
      _var = (@pointer + 0).as(Pointer(Int32))
      _var.value
    end

    def value=(value : Int32)
      _var = (@pointer + 0).as(Pointer(Int32)).value = value
      value
    end

    def value_name!
      self.value_name.not_nil!
    end

    def value_name : ::String?
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char)))
      return if _var.value.null?
      ::String.new(_var.value)
    end

    def value_name=(value : ::String?)
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char))).value = value.nil? ? Pointer(LibC::Char).null : value.to_unsafe
      value
    end

    def value_nick!
      self.value_nick.not_nil!
    end

    def value_nick : ::String?
      _var = (@pointer + 16).as(Pointer(Pointer(LibC::Char)))
      return if _var.value.null?
      ::String.new(_var.value)
    end

    def value_nick=(value : ::String?)
      _var = (@pointer + 16).as(Pointer(Pointer(LibC::Char))).value = value.nil? ? Pointer(LibC::Char).null : value.to_unsafe
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
