module Gdk
  # A `GdkTimeCoord` stores a single event in a motion history.
  class TimeCoord
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGdk::TimeCoord))
      @pointer.copy_from(pointer, sizeof(LibGdk::TimeCoord))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(time : UInt32? = nil, flags : Gdk::AxisFlags? = nil, axes : Enumerable(Float64)? = nil)
      _ptr = Pointer(Void).malloc(104)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.time = time unless time.nil?
      _instance.flags = flags unless flags.nil?
      _instance.axes = axes unless axes.nil?
      _instance
    end

    def finalize
    end

    def time : UInt32
      # Property getter
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.value
    end

    def time=(value : UInt32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value
      value
    end

    def flags : Gdk::AxisFlags
      # Property getter
      _var = (@pointer + 4).as(Pointer(UInt32))
      Gdk::AxisFlags.from_value(_var.value)
    end

    def flags=(value : Gdk::AxisFlags)
      # Property setter
      _var = (@pointer + 4).as(Pointer(UInt32)).value = value.to_unsafe
      value
    end

    def axes : Enumerable(Float64)
      # Property getter
      _var = (@pointer + 8).as(Pointer(Float64[12]))
      _var.value
    end

    def axes=(value : Enumerable(Float64))
      # Property setter
      _var = (@pointer + 8).as(Pointer(Float64[12])).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
