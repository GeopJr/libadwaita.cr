module Pango
  # The `PangoAttrFloat` structure is used to represent attributes with
  # a float or double value.
  class AttrFloat
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

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

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibPango::AttrFloat)).zero?
    end

    def attr : Pango::Attribute
      _var = (@pointer + 0).as(Pointer(Void))
      Pango::Attribute.new(_var, GICrystal::Transfer::None)
    end

    def attr=(value : Pango::Attribute)
      _var = (@pointer + 0).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibPango::AttrFloat))
      value
    end

    def value : Float64
      _var = (@pointer + 16).as(Pointer(Float64))
      _var.value
    end

    def value=(value : Float64)
      _var = (@pointer + 16).as(Pointer(Float64)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
