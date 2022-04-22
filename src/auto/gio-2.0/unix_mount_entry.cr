module Gio
  # Defines a Unix mount entry (e.g. <filename>/media/cdrom</filename>).
  # This corresponds roughly to a mtab entry.
  class UnixMountEntry
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(UnixMountEntry.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(UnixMountEntry.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGio::UnixMountEntry)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_unix_mount_entry_get_type
    end

    def to_unsafe
      @pointer
    end
  end
end
