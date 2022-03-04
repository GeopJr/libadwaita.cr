module GObject
  # The class of an enumeration type holds information about its
  # possible values.
  class EnumClass
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::EnumClass))
      @pointer.copy_from(pointer, sizeof(LibGObject::EnumClass))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(g_type_class : GObject::TypeClass? = nil, minimum : Int32? = nil, maximum : Int32? = nil, n_values : UInt32? = nil, values : GObject::EnumValue? = nil)
      _ptr = Pointer(Void).malloc(32)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.g_type_class = g_type_class unless g_type_class.nil?
      _instance.minimum = minimum unless minimum.nil?
      _instance.maximum = maximum unless maximum.nil?
      _instance.n_values = n_values unless n_values.nil?
      _instance.values = values unless values.nil?
      _instance
    end

    def finalize
    end

    def g_type_class : GObject::TypeClass
      # Property getter
      _var = (@pointer + 0).as(Pointer(Void))
      GObject::TypeClass.new(_var.value, GICrystal::Transfer::None)
    end

    def g_type_class=(value : GObject::TypeClass)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Void)).value = value.to_unsafe
      value
    end

    def minimum : Int32
      # Property getter
      _var = (@pointer + 8).as(Pointer(Int32))
      _var.value
    end

    def minimum=(value : Int32)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Int32)).value = value
      value
    end

    def maximum : Int32
      # Property getter
      _var = (@pointer + 12).as(Pointer(Int32))
      _var.value
    end

    def maximum=(value : Int32)
      # Property setter
      _var = (@pointer + 12).as(Pointer(Int32)).value = value
      value
    end

    def n_values : UInt32
      # Property getter
      _var = (@pointer + 16).as(Pointer(UInt32))
      _var.value
    end

    def n_values=(value : UInt32)
      # Property setter
      _var = (@pointer + 16).as(Pointer(UInt32)).value = value
      value
    end

    def values : GObject::EnumValue
      # Property getter
      _var = (@pointer + 24).as(Pointer(Pointer(Void)))
      GObject::EnumValue.new(_var.value, GICrystal::Transfer::None)
    end

    def values=(value : GObject::EnumValue)
      # Property setter
      _var = (@pointer + 24).as(Pointer(Pointer(Void))).value = value.to_unsafe
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
