module HarfBuzz
  # Data type containing a set of virtual methods used for
  # accessing various Unicode character properties.
  #
  # HarfBuzz provides a default function for each of the
  # methods in #hb_unicode_funcs_t. Client programs can implement
  # their own replacements for the individual Unicode functions, as
  # needed, and replace the default by calling the setter for a
  # method.
  class UnicodeFuncsT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(UnicodeFuncsT.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(UnicodeFuncsT.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibHarfBuzz.hb_gobject_unicode_funcs_get_type
    end

    def to_unsafe
      @pointer
    end
  end
end
