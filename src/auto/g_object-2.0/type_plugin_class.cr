module GObject
  # The #GTypePlugin interface is used by the type system in order to handle
  # the lifecycle of dynamically loaded types.
  class TypePluginClass
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::TypePluginClass))
      @pointer.copy_from(pointer, sizeof(LibGObject::TypePluginClass))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(base_iface : GObject::TypeInterface? = nil, use_plugin : Pointer(Void)? = nil, unuse_plugin : Pointer(Void)? = nil, complete_type_info : Pointer(Void)? = nil, complete_interface_info : Pointer(Void)? = nil)
      _ptr = Pointer(Void).malloc(48)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.base_iface = base_iface unless base_iface.nil?
      _instance.use_plugin = use_plugin unless use_plugin.nil?
      _instance.unuse_plugin = unuse_plugin unless unuse_plugin.nil?
      _instance.complete_type_info = complete_type_info unless complete_type_info.nil?
      _instance.complete_interface_info = complete_interface_info unless complete_interface_info.nil?
      _instance
    end

    def finalize
    end

    def base_iface : GObject::TypeInterface
      # Property getter
      _var = (@pointer + 0).as(Pointer(Void))
      GObject::TypeInterface.new(_var.value, GICrystal::Transfer::None)
    end

    def base_iface=(value : GObject::TypeInterface)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Void)).value = value.to_unsafe
      value
    end

    def use_plugin : Pointer(Void)
      # Property getter
      _var = (@pointer + 16).as(Pointer(LibGObject::TypePluginUse))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def use_plugin=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 16).as(Pointer(LibGObject::TypePluginUse)).value = value.to_unsafe
      value
    end

    def unuse_plugin : Pointer(Void)
      # Property getter
      _var = (@pointer + 24).as(Pointer(LibGObject::TypePluginUnuse))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def unuse_plugin=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 24).as(Pointer(LibGObject::TypePluginUnuse)).value = value.to_unsafe
      value
    end

    def complete_type_info : Pointer(Void)
      # Property getter
      _var = (@pointer + 32).as(Pointer(LibGObject::TypePluginCompleteTypeInfo))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def complete_type_info=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 32).as(Pointer(LibGObject::TypePluginCompleteTypeInfo)).value = value.to_unsafe
      value
    end

    def complete_interface_info : Pointer(Void)
      # Property getter
      _var = (@pointer + 40).as(Pointer(LibGObject::TypePluginCompleteInterfaceInfo))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def complete_interface_info=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 40).as(Pointer(LibGObject::TypePluginCompleteInterfaceInfo)).value = value.to_unsafe
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
