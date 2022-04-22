module Gdk
  # A `GdkTimeCoord` stores a single event in a motion history.
  class TimeCoord
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

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

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGdk::TimeCoord)).zero?
    end

    def time : UInt32
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.value
    end

    def time=(value : UInt32)
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value
      value
    end

    def flags : Gdk::AxisFlags
      _var = (@pointer + 4).as(Pointer(UInt32))
      Gdk::AxisFlags.new(_var)
    end

    def flags=(value : Gdk::AxisFlags)
      _var = (@pointer + 4).as(Pointer(UInt32))
      _var.copy_from(value.to_unsafe, sizeof(LibGdk::TimeCoord))
      value
    end

    def axes : Enumerable(Float64)
      _var = (@pointer + 8).as(Pointer(Float64[12]))
      _var.value
    end

    def axes=(value : Enumerable(Float64))
      _var = (@pointer + 8).as(Pointer(Float64[12])).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
