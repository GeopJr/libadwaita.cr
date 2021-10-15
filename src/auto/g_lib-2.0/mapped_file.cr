module GLib
  # The #GMappedFile represents a file mapping created with
  # g_mapped_file_new(). It has only private members and should
  # not be accessed directly.
  class MappedFile
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(MappedFile.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(MappedFile.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGLib.g_mapped_file_get_type
    end

    def initialize(filename : ::String, writable : Bool)
      # g_mapped_file_new: (Constructor | Throws)
      # Returns: (transfer full)

      _retval = LibGLib.g_mapped_file_new(filename, writable)
      @pointer = _retval
    end

    def self.new_from_fd(fd : Int32, writable : Bool) : GLib::MappedFile
      # g_mapped_file_new_from_fd: (Constructor | Throws)
      # Returns: (transfer full)

      _retval = LibGLib.g_mapped_file_new_from_fd(fd, writable)
      GLib::MappedFile.new(_retval, GICrystal::Transfer::Full)
    end

    def free : Nil
      # g_mapped_file_free: (Method)
      # Returns: (transfer none)

      LibGLib.g_mapped_file_free(self)
    end

    def bytes : GLib::Bytes
      # g_mapped_file_get_bytes: (Method)
      # Returns: (transfer full)

      _retval = LibGLib.g_mapped_file_get_bytes(self)
      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    def contents : ::String
      # g_mapped_file_get_contents: (Method)
      # Returns: (transfer full)

      _retval = LibGLib.g_mapped_file_get_contents(self)
      GICrystal.transfer_full(_retval)
    end

    def length : UInt64
      # g_mapped_file_get_length: (Method)
      # Returns: (transfer none)

      _retval = LibGLib.g_mapped_file_get_length(self)
      _retval
    end

    def ref : GLib::MappedFile
      # g_mapped_file_ref: (Method)
      # Returns: (transfer full)

      _retval = LibGLib.g_mapped_file_ref(self)
      GLib::MappedFile.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # g_mapped_file_unref: (Method)
      # Returns: (transfer none)

      LibGLib.g_mapped_file_unref(self)
    end

    def to_unsafe
      @pointer
    end
  end
end
