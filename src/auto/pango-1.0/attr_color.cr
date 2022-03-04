module Pango
  # The `PangoAttrColor` structure is used to represent attributes that
  # are colors.
  class AttrColor
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::AttrColor))
      @pointer.copy_from(pointer, sizeof(LibPango::AttrColor))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(attr : Pango::Attribute? = nil, color : Pango::Color? = nil)
      _ptr = Pointer(Void).malloc(24)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.attr = attr unless attr.nil?
      _instance.color = color unless color.nil?
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

    def color : Pango::Color
      # Property getter
      _var = (@pointer + 16).as(Pointer(Void))
      Pango::Color.new(_var.value, GICrystal::Transfer::None)
    end

    def color=(value : Pango::Color)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Void)).value = value.to_unsafe
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
