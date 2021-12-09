module Gdk
  # An opaque type representing a list of files.
  class FileList
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(FileList.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(FileList.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_file_list_get_type
    end

    def files : GLib::SList
      # gdk_file_list_get_files: (Method)
      # Returns: (transfer container)

      _retval = LibGdk.gdk_file_list_get_files(self)
      GLib::SList(Gio::File).new(_retval, GICrystal::Transfer::Container)
    end

    def to_unsafe
      @pointer
    end
  end
end
