module Pango
  # The `PangoAttrInt` structure is used to represent attributes with
  # an integer or enumeration value.
  class AttrInt
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::AttrInt))
      @pointer.copy_from(pointer, sizeof(LibPango::AttrInt))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(attr : Pango::Attribute? = nil, value : Int32? = nil)
      _ptr = Pointer(Void).malloc(24)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.attr = attr unless attr.nil?
      _instance.value = value unless value.nil?
      _instance
    end

    def finalize
    end

    def attr : Pango::Attribute
      # Property getter
      _var = (@pointer + 0).as(Pointer(LibPango::Attribute))
      Pango::Attribute.new(_var.value, GICrystal::Transfer::Full)
    end

    def attr=(value : Pango::Attribute)
      # Property setter
      _var = (@pointer + 0).as(Pointer(LibPango::Attribute)).value = value.to_unsafe
      value
    end

    def value : Int32
      # Property getter
      _var = (@pointer + 16).as(Pointer(Int32))
      _var.value
    end

    def value=(value : Int32)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Int32)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
