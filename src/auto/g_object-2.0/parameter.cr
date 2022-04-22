module GObject
  # The GParameter struct is an auxiliary structure used
  # to hand parameter name/value pairs to g_object_newv().
  class Parameter
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::Parameter))
      @pointer.copy_from(pointer, sizeof(LibGObject::Parameter))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(name : ::String? = nil, value : GObject::Value? = nil)
      _ptr = Pointer(Void).malloc(32)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.name = name unless name.nil?
      _instance.value = value unless value.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGObject::Parameter)).zero?
    end

    def name!
      self.name.not_nil!
    end

    def name : ::String?
      _var = (@pointer + 0).as(Pointer(Pointer(LibC::Char)))
      return if _var.value.null?
      ::String.new(_var.value)
    end

    def name=(value : ::String?)
      _var = (@pointer + 0).as(Pointer(Pointer(LibC::Char))).value = value.nil? ? Pointer(LibC::Char).null : value.to_unsafe
      value
    end

    def value : GObject::Value
      _var = (@pointer + 8).as(Pointer(Void))
      GObject::Value.new(_var, GICrystal::Transfer::None)
    end

    def value=(value : GObject::Value)
      _var = (@pointer + 8).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::Parameter))
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
