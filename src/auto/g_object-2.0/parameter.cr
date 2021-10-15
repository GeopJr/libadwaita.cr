module GObject
  # The GParameter struct is an auxiliary structure used
  # to hand parameter name/value pairs to g_object_newv().
  class Parameter
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

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

    def name : ::String
      # Property getter
      _var = (@pointer + 0).as(Pointer(Pointer(LibC::Char)))
      GICrystal.transfer_full(_var.value)
    end

    def name=(value : ::String)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def value : GObject::Value
      # Property getter
      _var = (@pointer + 8).as(Pointer(LibGObject::Value))
      GObject::Value.new(_var.value, GICrystal::Transfer::Full)
    end

    def value=(value : GObject::Value)
      # Property setter
      _var = (@pointer + 8).as(Pointer(LibGObject::Value)).value = value.to_unsafe
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
