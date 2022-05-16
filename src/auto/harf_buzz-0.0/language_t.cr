module HarfBuzz
  # Data type for languages. Each #hb_language_t corresponds to a BCP 47
  # language tag.
  class LanguageT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = pointer
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibHarfBuzz::LanguageT)).zero?
    end

    def _string : ::String
      # hb_language_to_string: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibHarfBuzz.hb_language_to_string(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    def to_unsafe
      @pointer
    end
  end
end
