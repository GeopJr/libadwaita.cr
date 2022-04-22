module Pango
  # A `PangoGlyphVisAttr` structure communicates information between
  # the shaping and rendering phases.
  #
  # Currently, it contains cluster start and color information.
  # More attributes may be added in the future.
  #
  # Clusters are stored in visual order, within the cluster, glyphs
  # are always ordered in logical order, since visual order is meaningless;
  # that is, in Arabic text, accent glyphs follow the glyphs for the
  # base character.
  class GlyphVisAttr
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::GlyphVisAttr))
      @pointer.copy_from(pointer, sizeof(LibPango::GlyphVisAttr))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(is_cluster_start : UInt32? = nil, is_color : UInt32? = nil)
      _ptr = Pointer(Void).malloc(8)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.is_cluster_start = is_cluster_start unless is_cluster_start.nil?
      _instance.is_color = is_color unless is_color.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibPango::GlyphVisAttr)).zero?
    end

    def is_cluster_start : UInt32
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.value
    end

    def is_cluster_start=(value : UInt32)
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value
      value
    end

    def is_color : UInt32
      _var = (@pointer + 4).as(Pointer(UInt32))
      _var.value
    end

    def is_color=(value : UInt32)
      _var = (@pointer + 4).as(Pointer(UInt32)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
