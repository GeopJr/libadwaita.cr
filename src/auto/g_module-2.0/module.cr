module GModule
  # The #GModule struct is an opaque data structure to represent a
  # [dynamically-loaded module][glib-Dynamic-Loading-of-Modules].
  # It should only be accessed via the following functions.
  class Module
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = pointer
    end

    def finalize
    end

    def close : Bool
      # g_module_close: (Method)
      # Returns: (transfer none)

      _retval = LibGModule.g_module_close(self)
      GICrystal.to_bool(_retval)
    end

    def make_resident : Nil
      # g_module_make_resident: (Method)
      # Returns: (transfer none)

      LibGModule.g_module_make_resident(self)
    end

    def name : ::String
      # g_module_name: (Method)
      # Returns: (transfer none)

      _retval = LibGModule.g_module_name(self)
      ::String.new(_retval)
    end

    def symbol(symbol_name : ::String, symbol : Pointer(Nil)?) : Bool
      # g_module_symbol: (Method)
      # @symbol: (out) (transfer full) (nullable)
      # Returns: (transfer none)

      symbol = if symbol.nil?
                 Pointer(Void).null
               else
                 symbol.to_unsafe
               end

      _retval = LibGModule.g_module_symbol(self, symbol_name, symbol)
      GICrystal.to_bool(_retval)
    end

    def self.build_path(directory : ::String?, module_name : ::String) : ::String
      # g_module_build_path: (None)
      # @directory: (nullable)
      # Returns: (transfer full)

      directory = if directory.nil?
                    Pointer(LibC::Char).null
                  else
                    directory.to_unsafe
                  end

      _retval = LibGModule.g_module_build_path(directory, module_name)
      GICrystal.transfer_full(_retval)
    end

    def self.error : ::String
      # g_module_error: (None)
      # Returns: (transfer none)

      _retval = LibGModule.g_module_error
      ::String.new(_retval)
    end

    def self.error_quark : UInt32
      # g_module_error_quark: (None)
      # Returns: (transfer none)

      _retval = LibGModule.g_module_error_quark
      _retval
    end

    def self.supported : Bool
      # g_module_supported: (None)
      # Returns: (transfer none)

      _retval = LibGModule.g_module_supported
      GICrystal.to_bool(_retval)
    end

    def to_unsafe
      @pointer
    end
  end
end
