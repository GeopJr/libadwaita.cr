module GObject
  # The #GTypeValueTable provides the functions required by the #GValue
  # implementation, to serve as a container for values of a type.
  class TypeValueTable
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::TypeValueTable))
      @pointer.copy_from(pointer, sizeof(LibGObject::TypeValueTable))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(value_init : Pointer(Void)? = nil, value_free : Pointer(Void)? = nil, value_copy : Pointer(Void)? = nil, value_peek_pointer : Pointer(Void)? = nil, collect_format : ::String? = nil, collect_value : Pointer(Void)? = nil, lcopy_format : ::String? = nil, lcopy_value : Pointer(Void)? = nil)
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

    def value_init : Pointer(Void)
      # Property getter
      _var = (@pointer + 0).as(Pointer(-> Void))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def value_init=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 0).as(Pointer(-> Void)).value = value.to_unsafe
      value
    end

    def value_free : Pointer(Void)
      # Property getter
      _var = (@pointer + 8).as(Pointer(-> Void))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def value_free=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 8).as(Pointer(-> Void)).value = value.to_unsafe
      value
    end

    def value_copy : Pointer(Void)
      # Property getter
      _var = (@pointer + 16).as(Pointer(-> Void))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def value_copy=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 16).as(Pointer(-> Void)).value = value.to_unsafe
      value
    end

    def value_peek_pointer : Pointer(Void)
      # Property getter
      _var = (@pointer + 24).as(Pointer(-> Void))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def value_peek_pointer=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 24).as(Pointer(-> Void)).value = value.to_unsafe
      value
    end

    def collect_format : ::String
      # Property getter
      _var = (@pointer + 32).as(Pointer(Pointer(LibC::Char)))
      ::String.new(_var.value)
    end

    def collect_format=(value : ::String)
      # Property setter
      _var = (@pointer + 32).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def collect_value : Pointer(Void)
      # Property getter
      _var = (@pointer + 40).as(Pointer(-> Void))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def collect_value=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 40).as(Pointer(-> Void)).value = value.to_unsafe
      value
    end

    def lcopy_format : ::String
      # Property getter
      _var = (@pointer + 48).as(Pointer(Pointer(LibC::Char)))
      ::String.new(_var.value)
    end

    def lcopy_format=(value : ::String)
      # Property setter
      _var = (@pointer + 48).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def lcopy_value : Pointer(Void)
      # Property getter
      _var = (@pointer + 56).as(Pointer(-> Void))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def lcopy_value=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 56).as(Pointer(-> Void)).value = value.to_unsafe
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
