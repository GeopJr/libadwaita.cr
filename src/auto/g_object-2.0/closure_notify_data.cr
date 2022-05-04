module GObject
  class ClosureNotifyData
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::ClosureNotifyData))
      @pointer.copy_from(pointer, sizeof(LibGObject::ClosureNotifyData))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(data : Pointer(Void)? = nil, notify : GObject::ClosureNotify? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.data = data unless data.nil?
      _instance.notify = notify unless notify.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGObject::ClosureNotifyData)).zero?
    end

    def data!
      self.data.not_nil!
    end

    def data : Pointer(Void)?
      _var = (@pointer + 0).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      _var.value
    end

    def data=(value : Pointer(Void)?)
      _var = (@pointer + 0).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value
      value
    end

    def notify : GObject::ClosureNotify
      _var = (@pointer + 8).as(Pointer(Void*))
      GObject::ClosureNotify.new(_var, GICrystal::Transfer::None)
    end

    def notify=(value : GObject::ClosureNotify)
      _var = (@pointer + 8).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::ClosureNotifyData))
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
