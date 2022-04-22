module GdkPixbuf
  # The signature prefix for a module.
  #
  # The signature of a module is a set of prefixes. Prefixes are encoded as
  # pairs of ordinary strings, where the second string, called the mask, if
  # not `NULL`, must be of the same length as the first one and may contain
  # ' ', '!', 'x', 'z', and 'n' to indicate bytes that must be matched,
  # not matched, "don't-care"-bytes, zeros and non-zeros, respectively.
  #
  # Each prefix has an associated integer that describes the relevance of
  # the prefix, with 0 meaning a mismatch and 100 a "perfect match".
  #
  # Starting with gdk-pixbuf 2.8, the first byte of the mask may be '*',
  # indicating an unanchored pattern that matches not only at the beginning,
  # but also in the middle. Versions prior to 2.8 will interpret the '*'
  # like an 'x'.
  #
  # The signature of a module is stored as an array of
  # `GdkPixbufModulePatterns`. The array is terminated by a pattern
  # where the `prefix` is `NULL`.
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # GdkPixbufModulePattern *signature[] = {
  #   { "abcdx", " !x z", 100 },
  #   { "bla", NULL,  90 },
  #   { NULL, NULL, 0 }
  # };
  # ```
  #
  # In the example above, the signature matches e.g. "auud\0" with
  # relevance 100, and "blau" with relevance 90.
  class PixbufModulePattern
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGdkPixbuf::PixbufModulePattern))
      @pointer.copy_from(pointer, sizeof(LibGdkPixbuf::PixbufModulePattern))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(prefix : ::String? = nil, mask : ::String? = nil, relevance : Int32? = nil)
      _ptr = Pointer(Void).malloc(24)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.prefix = prefix unless prefix.nil?
      _instance.mask = mask unless mask.nil?
      _instance.relevance = relevance unless relevance.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGdkPixbuf::PixbufModulePattern)).zero?
    end

    def prefix!
      self.prefix.not_nil!
    end

    def prefix : ::String?
      _var = (@pointer + 0).as(Pointer(Pointer(LibC::Char)))
      return if _var.value.null?
      ::String.new(_var.value)
    end

    def prefix=(value : ::String?)
      _var = (@pointer + 0).as(Pointer(Pointer(LibC::Char))).value = value.nil? ? Pointer(LibC::Char).null : value.to_unsafe
      value
    end

    def mask!
      self.mask.not_nil!
    end

    def mask : ::String?
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char)))
      return if _var.value.null?
      ::String.new(_var.value)
    end

    def mask=(value : ::String?)
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char))).value = value.nil? ? Pointer(LibC::Char).null : value.to_unsafe
      value
    end

    def relevance : Int32
      _var = (@pointer + 16).as(Pointer(Int32))
      _var.value
    end

    def relevance=(value : Int32)
      _var = (@pointer + 16).as(Pointer(Int32)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
