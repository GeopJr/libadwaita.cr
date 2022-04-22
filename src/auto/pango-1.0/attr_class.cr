module Pango
  # The `PangoAttrClass` structure stores the type and operations for
  # a particular type of attribute.
  #
  # The functions in this structure should not be called directly. Instead,
  # one should use the wrapper functions provided for `PangoAttribute`.
  class AttrClass
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

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

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibPango::AttrClass)).zero?
    end

    def type : Pango::AttrType
      _var = (@pointer + 0).as(Pointer(UInt32))
      Pango::AttrType.new(_var)
    end

    def type=(value : Pango::AttrType)
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.copy_from(value.to_unsafe, sizeof(LibPango::AttrClass))
      value
    end

    def copy : Pointer(Void)
      _var = (@pointer + 8).as(Pointer(-> Void))
      Pointer(Void).new(_var, GICrystal::Transfer::None)
    end

    def copy=(value : Pointer(Void))
      _var = (@pointer + 8).as(Pointer(-> Void))
      _var.copy_from(value.to_unsafe, sizeof(LibPango::AttrClass))
      value
    end

    def destroy : Pointer(Void)
      _var = (@pointer + 16).as(Pointer(-> Void))
      Pointer(Void).new(_var, GICrystal::Transfer::None)
    end

    def destroy=(value : Pointer(Void))
      _var = (@pointer + 16).as(Pointer(-> Void))
      _var.copy_from(value.to_unsafe, sizeof(LibPango::AttrClass))
      value
    end

    def equal : Pointer(Void)
      _var = (@pointer + 24).as(Pointer(-> Void))
      Pointer(Void).new(_var, GICrystal::Transfer::None)
    end

    def equal=(value : Pointer(Void))
      _var = (@pointer + 24).as(Pointer(-> Void))
      _var.copy_from(value.to_unsafe, sizeof(LibPango::AttrClass))
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
