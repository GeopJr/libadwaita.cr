module HarfBuzz
  # Data type for holding a set of integers. #hb_set_t's are
  # used to gather and contain glyph IDs, Unicode code
  # points, and various other collections of discrete
  # values.
  class SetT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(SetT.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(SetT.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibHarfBuzz.hb_gobject_set_get_type
    end

    def to_unsafe
      @pointer
    end
  end
end
