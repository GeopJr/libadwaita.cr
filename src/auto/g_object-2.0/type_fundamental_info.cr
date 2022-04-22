module GObject
  # A structure that provides information to the type system which is
  # used specifically for managing fundamental types.
  class TypeFundamentalInfo
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::TypeFundamentalInfo))
      @pointer.copy_from(pointer, sizeof(LibGObject::TypeFundamentalInfo))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(type_flags : GObject::TypeFundamentalFlags? = nil)
      _ptr = Pointer(Void).malloc(4)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.type_flags = type_flags unless type_flags.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGObject::TypeFundamentalInfo)).zero?
    end

    def type_flags : GObject::TypeFundamentalFlags
      _var = (@pointer + 0).as(Pointer(UInt32))
      GObject::TypeFundamentalFlags.new(_var)
    end

    def type_flags=(value : GObject::TypeFundamentalFlags)
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::TypeFundamentalInfo))
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
