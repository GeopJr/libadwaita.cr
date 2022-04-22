module GObject
  # The GObjectConstructParam struct is an auxiliary structure used to hand
  # #GParamSpec/#GValue pairs to the @constructor of a #GObjectClass.
  class ObjectConstructParam
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

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

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGObject::ObjectConstructParam)).zero?
    end

    def pspec!
      self.pspec.not_nil!
    end

    def pspec : GObject::ParamSpec?
      _var = (@pointer + 0).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      GObject::ParamSpec.new(_var.value, GICrystal::Transfer::None)
    end

    def pspec=(value : GObject::ParamSpec?)
      _var = (@pointer + 0).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value.to_unsafe
      value
    end

    def value!
      self.value.not_nil!
    end

    def value : GObject::Value?
      _var = (@pointer + 8).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      GObject::Value.new(_var.value, GICrystal::Transfer::None)
    end

    def value=(value : GObject::Value?)
      _var = (@pointer + 8).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value.to_unsafe
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
