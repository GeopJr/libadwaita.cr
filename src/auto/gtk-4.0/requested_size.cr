module Gtk
  # Represents a request of a screen object in a given orientation. These
  # are primarily used in container implementations when allocating a natural
  # size for children calling. See `#distribute_natural_allocation`.
  class RequestedSize
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGtk::RequestedSize))
      @pointer.copy_from(pointer, sizeof(LibGtk::RequestedSize))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(data : Pointer(Void)? = nil, minimum_size : Int32? = nil, natural_size : Int32? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.data = data unless data.nil?
      _instance.minimum_size = minimum_size unless minimum_size.nil?
      _instance.natural_size = natural_size unless natural_size.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGtk::RequestedSize)).zero?
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

    def minimum_size : Int32
      _var = (@pointer + 8).as(Pointer(Int32))
      _var.value
    end

    def minimum_size=(value : Int32)
      _var = (@pointer + 8).as(Pointer(Int32)).value = value
      value
    end

    def natural_size : Int32
      _var = (@pointer + 12).as(Pointer(Int32))
      _var.value
    end

    def natural_size=(value : Int32)
      _var = (@pointer + 12).as(Pointer(Int32)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
