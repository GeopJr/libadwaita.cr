module GObject
  # The class of a flags type holds information about its
  # possible values.
  class FlagsClass
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::FlagsClass))
      @pointer.copy_from(pointer, sizeof(LibGObject::FlagsClass))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(g_type_class : GObject::TypeClass? = nil, mask : UInt32? = nil, n_values : UInt32? = nil, values : GObject::FlagsValue? = nil)
      _ptr = Pointer(Void).malloc(24)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.g_type_class = g_type_class unless g_type_class.nil?
      _instance.mask = mask unless mask.nil?
      _instance.n_values = n_values unless n_values.nil?
      _instance.values = values unless values.nil?
      _instance
    end

    def finalize
    end

    def g_type_class : GObject::TypeClass
      # Property getter
      _var = (@pointer + 0).as(Pointer(LibGObject::TypeClass))
      GObject::TypeClass.new(_var.value, GICrystal::Transfer::Full)
    end

    def g_type_class=(value : GObject::TypeClass)
      # Property setter
      _var = (@pointer + 0).as(Pointer(LibGObject::TypeClass)).value = value.to_unsafe
      value
    end

    def mask : UInt32
      # Property getter
      _var = (@pointer + 8).as(Pointer(UInt32))
      _var.value
    end

    def mask=(value : UInt32)
      # Property setter
      _var = (@pointer + 8).as(Pointer(UInt32)).value = value
      value
    end

    def n_values : UInt32
      # Property getter
      _var = (@pointer + 12).as(Pointer(UInt32))
      _var.value
    end

    def n_values=(value : UInt32)
      # Property setter
      _var = (@pointer + 12).as(Pointer(UInt32)).value = value
      value
    end

    def values : GObject::FlagsValue
      # Property getter
      _var = (@pointer + 16).as(Pointer(Pointer(LibGObject::FlagsValue)))
      GObject::FlagsValue.new(_var.value, GICrystal::Transfer::Full)
    end

    def values=(value : GObject::FlagsValue)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Pointer(LibGObject::FlagsValue))).value = value.to_unsafe
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
