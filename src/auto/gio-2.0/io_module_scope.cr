module Gio
  # Represents a scope for loading IO modules. A scope can be used for blocking
  # duplicate modules, or blocking a module you don't want to load.
  #
  # The scope can be used with g_io_modules_load_all_in_directory_with_scope()
  # or g_io_modules_scan_all_in_directory_with_scope().
  class IOModuleScope
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = pointer
    end

    def finalize
    end

    def block(basename : ::String) : Nil
      # g_io_module_scope_block: (Method)
      # Returns: (transfer none)

      LibGio.g_io_module_scope_block(self, basename)
    end

    def free : Nil
      # g_io_module_scope_free: (Method)
      # Returns: (transfer none)

      LibGio.g_io_module_scope_free(self)
    end

    def to_unsafe
      @pointer
    end
  end
end
