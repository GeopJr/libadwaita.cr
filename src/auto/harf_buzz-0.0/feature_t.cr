module HarfBuzz
  # The #hb_feature_t is the structure that holds information about requested
  # feature application. The feature will be applied with the given value to all
  # glyphs which are in clusters between @start (inclusive) and @end (exclusive).
  # Setting start to #HB_FEATURE_GLOBAL_START and end to #HB_FEATURE_GLOBAL_END
  # specifies that the feature always applies to the entire buffer.
  class FeatureT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibHarfBuzz::FeatureT))
      @pointer.copy_from(pointer, sizeof(LibHarfBuzz::FeatureT))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(tag : UInt32? = nil, value : UInt32? = nil, start : UInt32? = nil, end _end : UInt32? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.tag = tag unless tag.nil?
      _instance.value = value unless value.nil?
      _instance.start = start unless start.nil?
      _instance.end = _end unless _end.nil?
      _instance
    end

    def finalize
    end

    def tag : UInt32
      # Property getter
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.value
    end

    def tag=(value : UInt32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value
      value
    end

    def value : UInt32
      # Property getter
      _var = (@pointer + 4).as(Pointer(UInt32))
      _var.value
    end

    def value=(value : UInt32)
      # Property setter
      _var = (@pointer + 4).as(Pointer(UInt32)).value = value
      value
    end

    def start : UInt32
      # Property getter
      _var = (@pointer + 8).as(Pointer(UInt32))
      _var.value
    end

    def start=(value : UInt32)
      # Property setter
      _var = (@pointer + 8).as(Pointer(UInt32)).value = value
      value
    end

    def end : UInt32
      # Property getter
      _var = (@pointer + 12).as(Pointer(UInt32))
      _var.value
    end

    def end=(value : UInt32)
      # Property setter
      _var = (@pointer + 12).as(Pointer(UInt32)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibHarfBuzz.hb_gobject_feature_get_type
    end

    def _string(buf : Enumerable(::String)) : Nil
      # hb_feature_to_string: (Method)
      # @buf: (out) (transfer full) (array length=size element-type Utf8)
      # @size: (out) (transfer full)
      # Returns: (transfer none)

      size = buf.size
      buf = buf.to_a.map(&.to_unsafe).to_unsafe

      LibHarfBuzz.hb_feature_to_string(self, buf, size)
    end

    def _string(*buf : ::String)
      _string(buf)
    end

    def to_unsafe
      @pointer
    end
  end
end
