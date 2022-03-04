module GObject
  class ClosureNotifyData
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::ClosureNotifyData))
      @pointer.copy_from(pointer, sizeof(LibGObject::ClosureNotifyData))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(data : Pointer(Void)? = nil, notify : Pointer(Void)? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.data = data unless data.nil?
      _instance.notify = notify unless notify.nil?
      _instance
    end

    def finalize
    end

    def data : Pointer(Void)
      # Property getter
      _var = (@pointer + 0).as(Pointer(Pointer(Void)))
      _var.value
    end

    def data=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 0).as(Pointer(Pointer(Void))).value = value
      value
    end

    def notify : Pointer(Void)
      # Property getter
      _var = (@pointer + 8).as(Pointer(LibGObject::ClosureNotify))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def notify=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 8).as(Pointer(LibGObject::ClosureNotify)).value = value.to_unsafe
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
