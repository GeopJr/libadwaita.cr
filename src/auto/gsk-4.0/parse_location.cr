module Gsk
  # A location in a parse buffer.
  class ParseLocation
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGsk::ParseLocation))
      @pointer.copy_from(pointer, sizeof(LibGsk::ParseLocation))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(bytes : UInt64? = nil, chars : UInt64? = nil, lines : UInt64? = nil, line_bytes : UInt64? = nil, line_chars : UInt64? = nil)
      _ptr = Pointer(Void).malloc(40)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.bytes = bytes unless bytes.nil?
      _instance.chars = chars unless chars.nil?
      _instance.lines = lines unless lines.nil?
      _instance.line_bytes = line_bytes unless line_bytes.nil?
      _instance.line_chars = line_chars unless line_chars.nil?
      _instance
    end

    def finalize
    end

    def bytes : UInt64
      # Property getter
      _var = (@pointer + 0).as(Pointer(UInt64))
      _var.value
    end

    def bytes=(value : UInt64)
      # Property setter
      _var = (@pointer + 0).as(Pointer(UInt64)).value = value
      value
    end

    def chars : UInt64
      # Property getter
      _var = (@pointer + 8).as(Pointer(UInt64))
      _var.value
    end

    def chars=(value : UInt64)
      # Property setter
      _var = (@pointer + 8).as(Pointer(UInt64)).value = value
      value
    end

    def lines : UInt64
      # Property getter
      _var = (@pointer + 16).as(Pointer(UInt64))
      _var.value
    end

    def lines=(value : UInt64)
      # Property setter
      _var = (@pointer + 16).as(Pointer(UInt64)).value = value
      value
    end

    def line_bytes : UInt64
      # Property getter
      _var = (@pointer + 24).as(Pointer(UInt64))
      _var.value
    end

    def line_bytes=(value : UInt64)
      # Property setter
      _var = (@pointer + 24).as(Pointer(UInt64)).value = value
      value
    end

    def line_chars : UInt64
      # Property getter
      _var = (@pointer + 32).as(Pointer(UInt64))
      _var.value
    end

    def line_chars=(value : UInt64)
      # Property setter
      _var = (@pointer + 32).as(Pointer(UInt64)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
