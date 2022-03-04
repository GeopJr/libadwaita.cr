module Pango
  # The `PangoAttrFloat` structure is used to represent attributes with
  # a float or double value.
  class AttrFloat
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::AttrFloat))
      @pointer.copy_from(pointer, sizeof(LibPango::AttrFloat))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(attr : Pango::Attribute? = nil, value : Float64? = nil)
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
      _var = (@pointer + 0).as(Pointer(Void))
      Pango::Attribute.new(_var.value, GICrystal::Transfer::None)
    end

    def attr=(value : Pango::Attribute)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Void)).value = value.to_unsafe
      value
    end

    def value : Float64
      # Property getter
      _var = (@pointer + 16).as(Pointer(Float64))
      _var.value
    end

    def value=(value : Float64)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Float64)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
