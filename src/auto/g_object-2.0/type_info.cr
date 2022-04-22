module GObject
  # This structure is used to provide the type system with the information
  # required to initialize and destruct (finalize) a type's class and
  # its instances.
  #
  # The initialized structure is passed to the g_type_register_static() function
  # (or is copied into the provided #GTypeInfo structure in the
  # g_type_plugin_complete_type_info()). The type system will perform a deep
  # copy of this structure, so its memory does not need to be persistent
  # across invocation of g_type_register_static().
  class TypeInfo
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::TypeInfo))
      @pointer.copy_from(pointer, sizeof(LibGObject::TypeInfo))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(class_size : UInt16? = nil, base_init : Pointer(Void)? = nil, base_finalize : Pointer(Void)? = nil, class_init : Pointer(Void)? = nil, class_finalize : Pointer(Void)? = nil, class_data : Pointer(Void)? = nil, instance_size : UInt16? = nil, n_preallocs : UInt16? = nil, instance_init : Pointer(Void)? = nil, value_table : GObject::TypeValueTable? = nil)
      _ptr = Pointer(Void).malloc(72)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.class_size = class_size unless class_size.nil?
      _instance.base_init = base_init unless base_init.nil?
      _instance.base_finalize = base_finalize unless base_finalize.nil?
      _instance.class_init = class_init unless class_init.nil?
      _instance.class_finalize = class_finalize unless class_finalize.nil?
      _instance.class_data = class_data unless class_data.nil?
      _instance.instance_size = instance_size unless instance_size.nil?
      _instance.n_preallocs = n_preallocs unless n_preallocs.nil?
      _instance.instance_init = instance_init unless instance_init.nil?
      _instance.value_table = value_table unless value_table.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGObject::TypeInfo)).zero?
    end

    def class_size : UInt16
      _var = (@pointer + 0).as(Pointer(UInt16))
      _var.value
    end

    def class_size=(value : UInt16)
      _var = (@pointer + 0).as(Pointer(UInt16)).value = value
      value
    end

    def base_init : Pointer(Void)
      _var = (@pointer + 8).as(Pointer(LibGObject::BaseInitFunc))
      Pointer(Void).new(_var, GICrystal::Transfer::None)
    end

    def base_init=(value : Pointer(Void))
      _var = (@pointer + 8).as(Pointer(LibGObject::BaseInitFunc))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::TypeInfo))
      value
    end

    def base_finalize : Pointer(Void)
      _var = (@pointer + 16).as(Pointer(LibGObject::BaseFinalizeFunc))
      Pointer(Void).new(_var, GICrystal::Transfer::None)
    end

    def base_finalize=(value : Pointer(Void))
      _var = (@pointer + 16).as(Pointer(LibGObject::BaseFinalizeFunc))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::TypeInfo))
      value
    end

    def class_init : Pointer(Void)
      _var = (@pointer + 24).as(Pointer(LibGObject::ClassInitFunc))
      Pointer(Void).new(_var, GICrystal::Transfer::None)
    end

    def class_init=(value : Pointer(Void))
      _var = (@pointer + 24).as(Pointer(LibGObject::ClassInitFunc))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::TypeInfo))
      value
    end

    def class_finalize : Pointer(Void)
      _var = (@pointer + 32).as(Pointer(LibGObject::ClassFinalizeFunc))
      Pointer(Void).new(_var, GICrystal::Transfer::None)
    end

    def class_finalize=(value : Pointer(Void))
      _var = (@pointer + 32).as(Pointer(LibGObject::ClassFinalizeFunc))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::TypeInfo))
      value
    end

    def class_data!
      self.class_data.not_nil!
    end

    def class_data : Pointer(Void)?
      _var = (@pointer + 40).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      _var.value
    end

    def class_data=(value : Pointer(Void)?)
      _var = (@pointer + 40).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value
      value
    end

    def instance_size : UInt16
      _var = (@pointer + 48).as(Pointer(UInt16))
      _var.value
    end

    def instance_size=(value : UInt16)
      _var = (@pointer + 48).as(Pointer(UInt16)).value = value
      value
    end

    def n_preallocs : UInt16
      _var = (@pointer + 50).as(Pointer(UInt16))
      _var.value
    end

    def n_preallocs=(value : UInt16)
      _var = (@pointer + 50).as(Pointer(UInt16)).value = value
      value
    end

    def instance_init : Pointer(Void)
      _var = (@pointer + 56).as(Pointer(LibGObject::InstanceInitFunc))
      Pointer(Void).new(_var, GICrystal::Transfer::None)
    end

    def instance_init=(value : Pointer(Void))
      _var = (@pointer + 56).as(Pointer(LibGObject::InstanceInitFunc))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::TypeInfo))
      value
    end

    def value_table!
      self.value_table.not_nil!
    end

    def value_table : GObject::TypeValueTable?
      _var = (@pointer + 64).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      GObject::TypeValueTable.new(_var.value, GICrystal::Transfer::None)
    end

    def value_table=(value : GObject::TypeValueTable?)
      _var = (@pointer + 64).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value.to_unsafe
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
