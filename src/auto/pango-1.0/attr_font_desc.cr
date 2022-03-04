module Pango
  # The `PangoAttrFontDesc` structure is used to store an attribute that
  # sets all aspects of the font description at once.
  class AttrFontDesc
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::AttrFontDesc))
      @pointer.copy_from(pointer, sizeof(LibPango::AttrFontDesc))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(attr : Pango::Attribute? = nil, desc : Pango::FontDescription? = nil)
      _ptr = Pointer(Void).malloc(24)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.attr = attr unless attr.nil?
      _instance.desc = desc unless desc.nil?
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

    def desc : Pango::FontDescription
      # Property getter
      _var = (@pointer + 16).as(Pointer(Pointer(Void)))
      Pango::FontDescription.new(_var.value, GICrystal::Transfer::None)
    end

    def desc=(value : Pango::FontDescription)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Pointer(Void))).value = value.to_unsafe
      value
    end

    def self.new(desc : Pango::FontDescription) : Pango::Attribute
      # pango_attr_font_desc_new: (None)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_attr_font_desc_new(desc)

      # Return value handling
      Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
    end

    def to_unsafe
      @pointer
    end
  end
end
