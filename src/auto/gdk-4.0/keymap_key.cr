module Gdk
  # A `GdkKeymapKey` is a hardware key that can be mapped to a keyval.
  class KeymapKey
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGdk::KeymapKey))
      @pointer.copy_from(pointer, sizeof(LibGdk::KeymapKey))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(keycode : UInt32? = nil, group : Int32? = nil, level : Int32? = nil)
      _ptr = Pointer(Void).malloc(12)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.keycode = keycode unless keycode.nil?
      _instance.group = group unless group.nil?
      _instance.level = level unless level.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGdk::KeymapKey)).zero?
    end

    def keycode : UInt32
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.value
    end

    def keycode=(value : UInt32)
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value
      value
    end

    def group : Int32
      _var = (@pointer + 4).as(Pointer(Int32))
      _var.value
    end

    def group=(value : Int32)
      _var = (@pointer + 4).as(Pointer(Int32)).value = value
      value
    end

    def level : Int32
      _var = (@pointer + 8).as(Pointer(Int32))
      _var.value
    end

    def level=(value : Int32)
      _var = (@pointer + 8).as(Pointer(Int32)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
