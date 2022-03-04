module Pango
  # The `PangoAttrClass` structure stores the type and operations for
  # a particular type of attribute.
  #
  # The functions in this structure should not be called directly. Instead,
  # one should use the wrapper functions provided for `PangoAttribute`.
  class AttrClass
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::AttrClass))
      @pointer.copy_from(pointer, sizeof(LibPango::AttrClass))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(type : Pango::AttrType? = nil, copy : Pointer(Void)? = nil, destroy : Pointer(Void)? = nil, equal : Pointer(Void)? = nil)
      _ptr = Pointer(Void).malloc(32)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.type = type unless type.nil?
      _instance.copy = copy unless copy.nil?
      _instance.destroy = destroy unless destroy.nil?
      _instance.equal = equal unless equal.nil?
      _instance
    end

    def finalize
    end

    def type : Pango::AttrType
      # Property getter
      _var = (@pointer + 0).as(Pointer(UInt32))
      Pango::AttrType.from_value(_var.value)
    end

    def type=(value : Pango::AttrType)
      # Property setter
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value.to_unsafe
      value
    end

    def copy : Pointer(Void)
      # Property getter
      _var = (@pointer + 8).as(Pointer(-> Void))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def copy=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 8).as(Pointer(-> Void)).value = value.to_unsafe
      value
    end

    def destroy : Pointer(Void)
      # Property getter
      _var = (@pointer + 16).as(Pointer(-> Void))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def destroy=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 16).as(Pointer(-> Void)).value = value.to_unsafe
      value
    end

    def equal : Pointer(Void)
      # Property getter
      _var = (@pointer + 24).as(Pointer(-> Void))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def equal=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 24).as(Pointer(-> Void)).value = value.to_unsafe
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
