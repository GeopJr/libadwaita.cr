module GObject
  # The #GTypeValueTable provides the functions required by the #GValue
  # implementation, to serve as a container for values of a type.
  class TypeValueTable
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::TypeValueTable))
      @pointer.copy_from(pointer, sizeof(LibGObject::TypeValueTable))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(value_init : GObject::ValueInit? = nil, value_free : GObject::ValueFree? = nil, value_copy : GObject::ValueCopy? = nil, value_peek_pointer : GObject::ValuePeekPointer? = nil, collect_format : ::String? = nil, collect_value : GObject::CollectValue? = nil, lcopy_format : ::String? = nil, lcopy_value : GObject::LcopyValue? = nil)
      _ptr = Pointer(Void).malloc(64)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.value_init = value_init unless value_init.nil?
      _instance.value_free = value_free unless value_free.nil?
      _instance.value_copy = value_copy unless value_copy.nil?
      _instance.value_peek_pointer = value_peek_pointer unless value_peek_pointer.nil?
      _instance.collect_format = collect_format unless collect_format.nil?
      _instance.collect_value = collect_value unless collect_value.nil?
      _instance.lcopy_format = lcopy_format unless lcopy_format.nil?
      _instance.lcopy_value = lcopy_value unless lcopy_value.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGObject::TypeValueTable)).zero?
    end

    def value_init : GObject::ValueInit
      _var = (@pointer + 0).as(Pointer(Void*))
      GObject::ValueInit.new(_var, GICrystal::Transfer::None)
    end

    def value_init=(value : GObject::ValueInit)
      _var = (@pointer + 0).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::TypeValueTable))
      value
    end

    def value_free : GObject::ValueFree
      _var = (@pointer + 8).as(Pointer(Void*))
      GObject::ValueFree.new(_var, GICrystal::Transfer::None)
    end

    def value_free=(value : GObject::ValueFree)
      _var = (@pointer + 8).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::TypeValueTable))
      value
    end

    def value_copy : GObject::ValueCopy
      _var = (@pointer + 16).as(Pointer(Void*))
      GObject::ValueCopy.new(_var, GICrystal::Transfer::None)
    end

    def value_copy=(value : GObject::ValueCopy)
      _var = (@pointer + 16).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::TypeValueTable))
      value
    end

    def value_peek_pointer : GObject::ValuePeekPointer
      _var = (@pointer + 24).as(Pointer(Void*))
      GObject::ValuePeekPointer.new(_var, GICrystal::Transfer::None)
    end

    def value_peek_pointer=(value : GObject::ValuePeekPointer)
      _var = (@pointer + 24).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::TypeValueTable))
      value
    end

    def collect_format!
      self.collect_format.not_nil!
    end

    def collect_format : ::String?
      _var = (@pointer + 32).as(Pointer(Pointer(LibC::Char)))
      return if _var.value.null?
      ::String.new(_var.value)
    end

    def collect_format=(value : ::String?)
      _var = (@pointer + 32).as(Pointer(Pointer(LibC::Char))).value = value.nil? ? Pointer(LibC::Char).null : value.to_unsafe
      value
    end

    def collect_value : GObject::CollectValue
      _var = (@pointer + 40).as(Pointer(Void*))
      GObject::CollectValue.new(_var, GICrystal::Transfer::None)
    end

    def collect_value=(value : GObject::CollectValue)
      _var = (@pointer + 40).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::TypeValueTable))
      value
    end

    def lcopy_format!
      self.lcopy_format.not_nil!
    end

    def lcopy_format : ::String?
      _var = (@pointer + 48).as(Pointer(Pointer(LibC::Char)))
      return if _var.value.null?
      ::String.new(_var.value)
    end

    def lcopy_format=(value : ::String?)
      _var = (@pointer + 48).as(Pointer(Pointer(LibC::Char))).value = value.nil? ? Pointer(LibC::Char).null : value.to_unsafe
      value
    end

    def lcopy_value : GObject::LcopyValue
      _var = (@pointer + 56).as(Pointer(Void*))
      GObject::LcopyValue.new(_var, GICrystal::Transfer::None)
    end

    def lcopy_value=(value : GObject::LcopyValue)
      _var = (@pointer + 56).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::TypeValueTable))
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
