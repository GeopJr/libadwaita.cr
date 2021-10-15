module GObject
  # A structure that provides information to the type system which is
  # used specifically for managing interface types.
  class InterfaceInfo
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::InterfaceInfo))
      @pointer.copy_from(pointer, sizeof(LibGObject::InterfaceInfo))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(interface_init : Pointer(Void)? = nil, interface_finalize : Pointer(Void)? = nil, interface_data : Pointer(Nil)? = nil)
      _ptr = Pointer(Void).malloc(24)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.interface_init = interface_init unless interface_init.nil?
      _instance.interface_finalize = interface_finalize unless interface_finalize.nil?
      _instance.interface_data = interface_data unless interface_data.nil?
      _instance
    end

    def finalize
    end

    def interface_init : Pointer(Void)
      # Property getter
      _var = (@pointer + 0).as(Pointer(LibGObject::InterfaceInitFunc))
      Pointer(Void).new(_var.value, GICrystal::Transfer::Full)
    end

    def interface_init=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 0).as(Pointer(LibGObject::InterfaceInitFunc)).value = value.to_unsafe
      value
    end

    def interface_finalize : Pointer(Void)
      # Property getter
      _var = (@pointer + 8).as(Pointer(LibGObject::InterfaceFinalizeFunc))
      Pointer(Void).new(_var.value, GICrystal::Transfer::Full)
    end

    def interface_finalize=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 8).as(Pointer(LibGObject::InterfaceFinalizeFunc)).value = value.to_unsafe
      value
    end

    def interface_data : Pointer(Nil)
      # Property getter
      _var = (@pointer + 16).as(Pointer(Pointer(Void)))
      Pointer(Void)
    end

    def interface_data=(value : Pointer(Nil))
      # Property setter
      _var = (@pointer + 16).as(Pointer(Pointer(Void))).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
