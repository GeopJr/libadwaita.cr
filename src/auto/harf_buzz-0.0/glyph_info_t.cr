module HarfBuzz
  # The #hb_glyph_info_t is the structure that holds information about the
  # glyphs and their relation to input text.
  class GlyphInfoT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibHarfBuzz::GlyphInfoT))
      @pointer.copy_from(pointer, sizeof(LibHarfBuzz::GlyphInfoT))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(codepoint : UInt32? = nil, mask : UInt32? = nil, cluster : UInt32? = nil, var1 : HarfBuzz::VarIntT? = nil, var2 : HarfBuzz::VarIntT? = nil)
      _ptr = Pointer(Void).malloc(20)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.codepoint = codepoint unless codepoint.nil?
      _instance.mask = mask unless mask.nil?
      _instance.cluster = cluster unless cluster.nil?
      _instance.var1 = var1 unless var1.nil?
      _instance.var2 = var2 unless var2.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibHarfBuzz::GlyphInfoT)).zero?
    end

    def codepoint : UInt32
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.value
    end

    def codepoint=(value : UInt32)
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value
      value
    end

    def mask : UInt32
      _var = (@pointer + 4).as(Pointer(UInt32))
      _var.value
    end

    def mask=(value : UInt32)
      _var = (@pointer + 4).as(Pointer(UInt32)).value = value
      value
    end

    def cluster : UInt32
      _var = (@pointer + 8).as(Pointer(UInt32))
      _var.value
    end

    def cluster=(value : UInt32)
      _var = (@pointer + 8).as(Pointer(UInt32)).value = value
      value
    end

    def var1 : HarfBuzz::VarIntT
      _var = (@pointer + 12).as(Pointer(LibHarfBuzz::VarIntT))
      HarfBuzz::VarIntT.new(_var, GICrystal::Transfer::None)
    end

    def var1=(value : HarfBuzz::VarIntT)
      _var = (@pointer + 12).as(Pointer(LibHarfBuzz::VarIntT))
      _var.copy_from(value.to_unsafe, sizeof(LibHarfBuzz::GlyphInfoT))
      value
    end

    def var2 : HarfBuzz::VarIntT
      _var = (@pointer + 16).as(Pointer(LibHarfBuzz::VarIntT))
      HarfBuzz::VarIntT.new(_var, GICrystal::Transfer::None)
    end

    def var2=(value : HarfBuzz::VarIntT)
      _var = (@pointer + 16).as(Pointer(LibHarfBuzz::VarIntT))
      _var.copy_from(value.to_unsafe, sizeof(LibHarfBuzz::GlyphInfoT))
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibHarfBuzz.hb_gobject_glyph_info_get_type
    end

    def to_unsafe
      @pointer
    end
  end
end
