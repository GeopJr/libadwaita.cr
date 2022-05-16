module Gio
  # Represents a scope for loading IO modules. A scope can be used for blocking
  # duplicate modules, or blocking a module you don't want to load.
  #
  # The scope can be used with g_io_modules_load_all_in_directory_with_scope()
  # or g_io_modules_scan_all_in_directory_with_scope().
  class IOModuleScope
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = pointer
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGio::IOModuleScope)).zero?
    end

    def block(basename : ::String) : Nil
      # g_io_module_scope_block: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_io_module_scope_block(@pointer, basename)

      # Return value handling
    end

    def free : Nil
      # g_io_module_scope_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_io_module_scope_free(@pointer)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
