module Gio
  # Information about a specific attribute.
  class FileAttributeInfo
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

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

    def name : ::String
      # Property getter
      _var = (@pointer + 0).as(Pointer(Pointer(LibC::Char)))
      ::String.new(_var.value)
    end

    def name=(value : ::String)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def type : Gio::FileAttributeType
      # Property getter
      _var = (@pointer + 8).as(Pointer(UInt32))
      Gio::FileAttributeType.from_value(_var.value)
    end

    def type=(value : Gio::FileAttributeType)
      # Property setter
      _var = (@pointer + 8).as(Pointer(UInt32)).value = value.to_unsafe
      value
    end

    def flags : Gio::FileAttributeInfoFlags
      # Property getter
      _var = (@pointer + 12).as(Pointer(UInt32))
      Gio::FileAttributeInfoFlags.from_value(_var.value)
    end

    def flags=(value : Gio::FileAttributeInfoFlags)
      # Property setter
      _var = (@pointer + 12).as(Pointer(UInt32)).value = value.to_unsafe
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
