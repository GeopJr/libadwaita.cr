module GObject
  # A structure that provides information to the type system which is
  # used specifically for managing interface types.
  class InterfaceInfo
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::InterfaceInfo))
      @pointer.copy_from(pointer, sizeof(LibGObject::InterfaceInfo))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(interface_init : GObject::InterfaceInitFunc? = nil, interface_finalize : GObject::InterfaceFinalizeFunc? = nil, interface_data : Pointer(Void)? = nil)
      _ptr = Pointer(Void).malloc(24)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.interface_init = interface_init unless interface_init.nil?
      _instance.interface_finalize = interface_finalize unless interface_finalize.nil?
      _instance.interface_data = interface_data unless interface_data.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGObject::InterfaceInfo)).zero?
    end

    def interface_init : GObject::InterfaceInitFunc
      _var = (@pointer + 0).as(Pointer(Void*))
      GObject::InterfaceInitFunc.new(_var, GICrystal::Transfer::None)
    end

    def interface_init=(value : GObject::InterfaceInitFunc)
      _var = (@pointer + 0).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::InterfaceInfo))
      value
    end

    def interface_finalize : GObject::InterfaceFinalizeFunc
      _var = (@pointer + 8).as(Pointer(Void*))
      GObject::InterfaceFinalizeFunc.new(_var, GICrystal::Transfer::None)
    end

    def interface_finalize=(value : GObject::InterfaceFinalizeFunc)
      _var = (@pointer + 8).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::InterfaceInfo))
      value
    end

    def interface_data!
      self.interface_data.not_nil!
    end

    def interface_data : Pointer(Void)?
      _var = (@pointer + 16).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      _var.value
    end

    def interface_data=(value : Pointer(Void)?)
      _var = (@pointer + 16).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
