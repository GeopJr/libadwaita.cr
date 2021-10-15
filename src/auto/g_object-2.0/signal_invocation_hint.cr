module GObject
  # The #GSignalInvocationHint structure is used to pass on additional information
  # to callbacks during a signal emission.
  class SignalInvocationHint
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::SignalInvocationHint))
      @pointer.copy_from(pointer, sizeof(LibGObject::SignalInvocationHint))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(signal_id : UInt32? = nil, detail : UInt32? = nil, run_type : GObject::SignalFlags? = nil)
      _ptr = Pointer(Void).malloc(12)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.signal_id = signal_id unless signal_id.nil?
      _instance.detail = detail unless detail.nil?
      _instance.run_type = run_type unless run_type.nil?
      _instance
    end

    def finalize
    end

    def signal_id : UInt32
      # Property getter
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.value
    end

    def signal_id=(value : UInt32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value
      value
    end

    def detail : UInt32
      # Property getter
      _var = (@pointer + 4).as(Pointer(UInt32))
      _var.value
    end

    def detail=(value : UInt32)
      # Property setter
      _var = (@pointer + 4).as(Pointer(UInt32)).value = value
      value
    end

    def run_type : GObject::SignalFlags
      # Property getter
      _var = (@pointer + 8).as(Pointer(UInt32))
      GObject::SignalFlags.from_value(_var.value)
    end

    def run_type=(value : GObject::SignalFlags)
      # Property setter
      _var = (@pointer + 8).as(Pointer(UInt32)).value = value.to_unsafe
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
