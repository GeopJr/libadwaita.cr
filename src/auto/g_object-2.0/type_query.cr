module GObject
  # A structure holding information for a specific type.
  #
  # See also: g_type_query()
  class TypeQuery
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::TypeQuery))
      @pointer.copy_from(pointer, sizeof(LibGObject::TypeQuery))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(type : UInt64? = nil, type_name : ::String? = nil, class_size : UInt32? = nil, instance_size : UInt32? = nil)
      _ptr = Pointer(Void).malloc(24)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.type = type unless type.nil?
      _instance.type_name = type_name unless type_name.nil?
      _instance.class_size = class_size unless class_size.nil?
      _instance.instance_size = instance_size unless instance_size.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGObject::TypeQuery)).zero?
    end

    def type : UInt64
      _var = (@pointer + 0).as(Pointer(UInt64))
      _var.value
    end

    def type=(value : UInt64)
      _var = (@pointer + 0).as(Pointer(UInt64)).value = value
      value
    end

    def type_name!
      self.type_name.not_nil!
    end

    def type_name : ::String?
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char)))
      return if _var.value.null?
      ::String.new(_var.value)
    end

    def type_name=(value : ::String?)
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char))).value = value.nil? ? Pointer(LibC::Char).null : value.to_unsafe
      value
    end

    def class_size : UInt32
      _var = (@pointer + 16).as(Pointer(UInt32))
      _var.value
    end

    def class_size=(value : UInt32)
      _var = (@pointer + 16).as(Pointer(UInt32)).value = value
      value
    end

    def instance_size : UInt32
      _var = (@pointer + 20).as(Pointer(UInt32))
      _var.value
    end

    def instance_size=(value : UInt32)
      _var = (@pointer + 20).as(Pointer(UInt32)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
