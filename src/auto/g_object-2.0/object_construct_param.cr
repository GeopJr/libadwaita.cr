module GObject
  # The GObjectConstructParam struct is an auxiliary structure used to hand
  # #GParamSpec/#GValue pairs to the @constructor of a #GObjectClass.
  class ObjectConstructParam
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::ObjectConstructParam))
      @pointer.copy_from(pointer, sizeof(LibGObject::ObjectConstructParam))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(pspec : GObject::ParamSpec? = nil, value : GObject::Value? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.pspec = pspec unless pspec.nil?
      _instance.value = value unless value.nil?
      _instance
    end

    def finalize
    end

    def pspec : GObject::ParamSpec
      # Property getter
      _var = (@pointer + 0).as(Pointer(Pointer(LibGObject::ParamSpec)))
      GObject::ParamSpec.new(_var.value, GICrystal::Transfer::Full)
    end

    def pspec=(value : GObject::ParamSpec)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Pointer(LibGObject::ParamSpec))).value = value.to_unsafe
      value
    end

    def value : GObject::Value
      # Property getter
      _var = (@pointer + 8).as(Pointer(Pointer(LibGObject::Value)))
      GObject::Value.new(_var.value, GICrystal::Transfer::Full)
    end

    def value=(value : GObject::Value)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Pointer(LibGObject::Value))).value = value.to_unsafe
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
