module GObject
  # This structure is used to provide the type system with the information
  # required to initialize and destruct (finalize) a parameter's class and
  # instances thereof.
  #
  # The initialized structure is passed to the g_param_type_register_static()
  # The type system will perform a deep copy of this structure, so its memory
  # does not need to be persistent across invocation of
  # g_param_type_register_static().
  class ParamSpecTypeInfo
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::ParamSpecTypeInfo))
      @pointer.copy_from(pointer, sizeof(LibGObject::ParamSpecTypeInfo))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(instance_size : UInt16? = nil, n_preallocs : UInt16? = nil, instance_init : Pointer(Void)? = nil, value_type : UInt64? = nil, finalize : Pointer(Void)? = nil, value_set_default : Pointer(Void)? = nil, value_validate : Pointer(Void)? = nil, values_cmp : Pointer(Void)? = nil)
      _ptr = Pointer(Void).malloc(56)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.instance_size = instance_size unless instance_size.nil?
      _instance.n_preallocs = n_preallocs unless n_preallocs.nil?
      _instance.instance_init = instance_init unless instance_init.nil?
      _instance.value_type = value_type unless value_type.nil?
      _instance.finalize = finalize unless finalize.nil?
      _instance.value_set_default = value_set_default unless value_set_default.nil?
      _instance.value_validate = value_validate unless value_validate.nil?
      _instance.values_cmp = values_cmp unless values_cmp.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGObject::ParamSpecTypeInfo)).zero?
    end

    def instance_size : UInt16
      _var = (@pointer + 0).as(Pointer(UInt16))
      _var.value
    end

    def instance_size=(value : UInt16)
      _var = (@pointer + 0).as(Pointer(UInt16)).value = value
      value
    end

    def n_preallocs : UInt16
      _var = (@pointer + 2).as(Pointer(UInt16))
      _var.value
    end

    def n_preallocs=(value : UInt16)
      _var = (@pointer + 2).as(Pointer(UInt16)).value = value
      value
    end

    def instance_init : Pointer(Void)
      _var = (@pointer + 8).as(Pointer(-> Void))
      Pointer(Void).new(_var, GICrystal::Transfer::None)
    end

    def instance_init=(value : Pointer(Void))
      _var = (@pointer + 8).as(Pointer(-> Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::ParamSpecTypeInfo))
      value
    end

    def value_type : UInt64
      _var = (@pointer + 16).as(Pointer(UInt64))
      _var.value
    end

    def value_type=(value : UInt64)
      _var = (@pointer + 16).as(Pointer(UInt64)).value = value
      value
    end

    def finalize : Pointer(Void)
      _var = (@pointer + 24).as(Pointer(-> Void))
      Pointer(Void).new(_var, GICrystal::Transfer::None)
    end

    def finalize=(value : Pointer(Void))
      _var = (@pointer + 24).as(Pointer(-> Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::ParamSpecTypeInfo))
      value
    end

    def value_set_default : Pointer(Void)
      _var = (@pointer + 32).as(Pointer(-> Void))
      Pointer(Void).new(_var, GICrystal::Transfer::None)
    end

    def value_set_default=(value : Pointer(Void))
      _var = (@pointer + 32).as(Pointer(-> Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::ParamSpecTypeInfo))
      value
    end

    def value_validate : Pointer(Void)
      _var = (@pointer + 40).as(Pointer(-> Void))
      Pointer(Void).new(_var, GICrystal::Transfer::None)
    end

    def value_validate=(value : Pointer(Void))
      _var = (@pointer + 40).as(Pointer(-> Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::ParamSpecTypeInfo))
      value
    end

    def values_cmp : Pointer(Void)
      _var = (@pointer + 48).as(Pointer(-> Void))
      Pointer(Void).new(_var, GICrystal::Transfer::None)
    end

    def values_cmp=(value : Pointer(Void))
      _var = (@pointer + 48).as(Pointer(-> Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::ParamSpecTypeInfo))
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
