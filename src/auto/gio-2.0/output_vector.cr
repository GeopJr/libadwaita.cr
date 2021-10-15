module Gio
  # Structure used for scatter/gather data output.
  # You generally pass in an array of #GOutputVectors
  # and the operation will use all the buffers as if they were
  # one buffer.
  class OutputVector
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGio::OutputVector))
      @pointer.copy_from(pointer, sizeof(LibGio::OutputVector))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(buffer : Pointer(Nil)? = nil, size : UInt64? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.buffer = buffer unless buffer.nil?
      _instance.size = size unless size.nil?
      _instance
    end

    def finalize
    end

    def buffer : Pointer(Nil)
      # Property getter
      _var = (@pointer + 0).as(Pointer(Pointer(Void)))
      Pointer(Void)
    end

    def buffer=(value : Pointer(Nil))
      # Property setter
      _var = (@pointer + 0).as(Pointer(Pointer(Void))).value = value
      value
    end

    def size : UInt64
      # Property getter
      _var = (@pointer + 8).as(Pointer(UInt64))
      _var.value
    end

    def size=(value : UInt64)
      # Property setter
      _var = (@pointer + 8).as(Pointer(UInt64)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
