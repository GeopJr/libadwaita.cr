module GLib
  # The `GSourceCallbackFuncs` struct contains
  # functions for managing callback objects.
  class SourceCallbackFuncs
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGLib::SourceCallbackFuncs))
      @pointer.copy_from(pointer, sizeof(LibGLib::SourceCallbackFuncs))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(ref : Pointer(Void)? = nil, unref : Pointer(Void)? = nil, get : Pointer(Void)? = nil)
      _ptr = Pointer(Void).malloc(24)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.ref = ref unless ref.nil?
      _instance.unref = unref unless unref.nil?
      _instance.get = get unless get.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGLib::SourceCallbackFuncs)).zero?
    end

    def ref : Pointer(Void)
      _var = (@pointer + 0).as(Pointer(-> Void))
      Pointer(Void).new(_var, GICrystal::Transfer::None)
    end

    def ref=(value : Pointer(Void))
      _var = (@pointer + 0).as(Pointer(-> Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGLib::SourceCallbackFuncs))
      value
    end

    def unref : Pointer(Void)
      _var = (@pointer + 8).as(Pointer(-> Void))
      Pointer(Void).new(_var, GICrystal::Transfer::None)
    end

    def unref=(value : Pointer(Void))
      _var = (@pointer + 8).as(Pointer(-> Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGLib::SourceCallbackFuncs))
      value
    end

    def get!
      self.get.not_nil!
    end

    def get : Pointer(Void)?
      _var = (@pointer + 16).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      _var.value
    end

    def get=(value : Pointer(Void)?)
      _var = (@pointer + 16).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
