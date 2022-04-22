module GObject
  # A #GCClosure is a specialization of #GClosure for C function callbacks.
  class CClosure
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

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

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGObject::CClosure)).zero?
    end

    def closure : GObject::Closure
      _var = (@pointer + 0).as(Pointer(Void))
      GObject::Closure.new(_var, GICrystal::Transfer::None)
    end

    def closure=(value : GObject::Closure)
      _var = (@pointer + 0).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::CClosure))
      value
    end

    def callback!
      self.callback.not_nil!
    end

    def callback : Pointer(Void)?
      _var = (@pointer + 64).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      _var.value
    end

    def callback=(value : Pointer(Void)?)
      _var = (@pointer + 64).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
