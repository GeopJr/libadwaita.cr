module Gio
  # Information about a specific attribute.
  class FileAttributeInfo
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGio::FileAttributeInfo))
      @pointer.copy_from(pointer, sizeof(LibGio::FileAttributeInfo))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(name : ::String? = nil, type : Gio::FileAttributeType? = nil, flags : Gio::FileAttributeInfoFlags? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.name = name unless name.nil?
      _instance.type = type unless type.nil?
      _instance.flags = flags unless flags.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGio::FileAttributeInfo)).zero?
    end

    def name!
      self.name.not_nil!
    end

    def name : ::String?
      _var = (@pointer + 0).as(Pointer(Pointer(LibC::Char)))
      return if _var.value.null?
      ::String.new(_var.value)
    end

    def name=(value : ::String?)
      _var = (@pointer + 0).as(Pointer(Pointer(LibC::Char))).value = value.nil? ? Pointer(LibC::Char).null : value.to_unsafe
      value
    end

    def type : Gio::FileAttributeType
      _var = (@pointer + 8).as(Pointer(UInt32))
      Gio::FileAttributeType.new(_var)
    end

    def type=(value : Gio::FileAttributeType)
      _var = (@pointer + 8).as(Pointer(UInt32))
      _var.copy_from(value.to_unsafe, sizeof(LibGio::FileAttributeInfo))
      value
    end

    def flags : Gio::FileAttributeInfoFlags
      _var = (@pointer + 12).as(Pointer(UInt32))
      Gio::FileAttributeInfoFlags.new(_var)
    end

    def flags=(value : Gio::FileAttributeInfoFlags)
      _var = (@pointer + 12).as(Pointer(UInt32))
      _var.copy_from(value.to_unsafe, sizeof(LibGio::FileAttributeInfo))
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
