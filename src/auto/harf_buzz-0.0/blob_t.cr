module HarfBuzz
  # Data type for blobs. A blob wraps a chunk of binary
  # data and facilitates its lifecycle management between
  # a client program and HarfBuzz.
  class BlobT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(BlobT.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(BlobT.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibHarfBuzz.hb_gobject_blob_get_type
    end

    def to_unsafe
      @pointer
    end
  end
end
