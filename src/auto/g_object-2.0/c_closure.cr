module GObject
  # A #GCClosure is a specialization of #GClosure for C function callbacks.
  class CClosure
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::CClosure))
      @pointer.copy_from(pointer, sizeof(LibGObject::CClosure))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(closure : GObject::Closure? = nil, callback : Pointer(Void)? = nil)
      _ptr = Pointer(Void).malloc(72)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.closure = closure unless closure.nil?
      _instance.callback = callback unless callback.nil?
      _instance
    end

    def finalize
    end

    def closure : GObject::Closure
      # Property getter
      _var = (@pointer + 0).as(Pointer(Void))
      GObject::Closure.new(_var.value, GICrystal::Transfer::None)
    end

    def closure=(value : GObject::Closure)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Void)).value = value.to_unsafe
      value
    end

    def callback : Pointer(Void)
      # Property getter
      _var = (@pointer + 64).as(Pointer(Pointer(Void)))
      _var.value
    end

    def callback=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 64).as(Pointer(Pointer(Void))).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
