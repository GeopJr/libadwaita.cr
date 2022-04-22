module GLib
  # The #GMappedFile represents a file mapping created with
  # g_mapped_file_new(). It has only private members and should
  # not be accessed directly.
  class MappedFile
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(MappedFile.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(MappedFile.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGLib::MappedFile)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGLib.g_mapped_file_get_type
    end

    def initialize(filename : ::String, writable : Bool)
      # g_mapped_file_new: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGLib.g_mapped_file_new(filename, writable, pointerof(_error))

      # Error check
      GLib.raise_exception(_error) unless _error.null?

      # Return value handling

      @pointer = _retval
    end

    def self.new_from_fd(fd : Int32, writable : Bool) : self
      # g_mapped_file_new_from_fd: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGLib.g_mapped_file_new_from_fd(fd, writable, pointerof(_error))

      # Error check
      GLib.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::MappedFile.new(_retval, GICrystal::Transfer::Full)
    end

    def free : Nil
      # g_mapped_file_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGLib.g_mapped_file_free(self)

      # Return value handling
    end

    def bytes : GLib::Bytes
      # g_mapped_file_get_bytes: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGLib.g_mapped_file_get_bytes(self)

      # Return value handling

      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    def contents : ::String
      # g_mapped_file_get_contents: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGLib.g_mapped_file_get_contents(self)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def length : UInt64
      # g_mapped_file_get_length: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_mapped_file_get_length(self)

      # Return value handling

      _retval
    end

    def ref : GLib::MappedFile
      # g_mapped_file_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGLib.g_mapped_file_ref(self)

      # Return value handling

      GLib::MappedFile.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # g_mapped_file_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGLib.g_mapped_file_unref(self)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
