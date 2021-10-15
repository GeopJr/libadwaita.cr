module Pango
  # The `PangoAttrSize` structure is used to represent attributes which
  # set font size.
  class AttrSize
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::AttrSize))
      @pointer.copy_from(pointer, sizeof(LibPango::AttrSize))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(attr : Pango::Attribute? = nil, size : Int32? = nil, absolute : UInt32? = nil)
      _ptr = Pointer(Void).malloc(24)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.attr = attr unless attr.nil?
      _instance.size = size unless size.nil?
      _instance.absolute = absolute unless absolute.nil?
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

    def size : Int32
      # Property getter
      _var = (@pointer + 16).as(Pointer(Int32))
      _var.value
    end

    def size=(value : Int32)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Int32)).value = value
      value
    end

    def absolute : UInt32
      # Property getter
      _var = (@pointer + 20).as(Pointer(UInt32))
      _var.value
    end

    def absolute=(value : UInt32)
      # Property setter
      _var = (@pointer + 20).as(Pointer(UInt32)).value = value
      value
    end

    def self.new(size : Int32) : Pango::Attribute
      # pango_attr_size_new: (None)
      # Returns: (transfer full)

      _retval = LibPango.pango_attr_size_new(size)
      Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_absolute(size : Int32) : Pango::Attribute
      # pango_attr_size_new_absolute: (None)
      # Returns: (transfer full)

      _retval = LibPango.pango_attr_size_new_absolute(size)
      Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
    end

    def to_unsafe
      @pointer
    end
  end
end
