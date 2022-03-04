module GLib
  # The `GSourceCallbackFuncs` struct contains
  # functions for managing callback objects.
  class SourceCallbackFuncs
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

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

    def ref : Pointer(Void)
      # Property getter
      _var = (@pointer + 0).as(Pointer(-> Void))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def ref=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 0).as(Pointer(-> Void)).value = value.to_unsafe
      value
    end

    def unref : Pointer(Void)
      # Property getter
      _var = (@pointer + 8).as(Pointer(-> Void))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def unref=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 8).as(Pointer(-> Void)).value = value.to_unsafe
      value
    end

    def get : Pointer(Void)
      # Property getter
      _var = (@pointer + 16).as(Pointer(Pointer(Void)))
      _var.value
    end

    def get=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 16).as(Pointer(Pointer(Void))).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
