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

      # Handle parameters

      # C call
      _retval = LibGModule.g_module_close(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def make_resident : Nil
      # g_module_make_resident: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGModule.g_module_make_resident(self)

      # Return value handling
    end

    def name : ::String
      # g_module_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGModule.g_module_name(self)

      # Return value handling
      ::String.new(_retval)
    end

    def symbol(symbol_name : ::String, symbol : Pointer(Void)?) : Bool
      # g_module_symbol: (Method)
      # @symbol: (out) (transfer full) (nullable)
      # Returns: (transfer none)

      # Handle parameters
      symbol = if symbol.nil?
                 Pointer(Void).null
               else
                 symbol.to_unsafe
               end

      # C call
      _retval = LibGModule.g_module_symbol(self, symbol_name, symbol)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def self.build_path(directory : ::String?, module_name : ::String) : ::String
      # g_module_build_path: (None)
      # @directory: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      directory = if directory.nil?
                    Pointer(LibC::Char).null
                  else
                    directory.to_unsafe
                  end

      # C call
      _retval = LibGModule.g_module_build_path(directory, module_name)

      # Return value handling
      GICrystal.transfer_full(_retval)
    end

    def self.error : ::String
      # g_module_error: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGModule.g_module_error

      # Return value handling
      ::String.new(_retval)
    end

    def self.error_quark : UInt32
      # g_module_error_quark: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGModule.g_module_error_quark

      # Return value handling
      _retval
    end

    def self.supported : Bool
      # g_module_supported: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGModule.g_module_supported

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def to_unsafe
      @pointer
    end
  end
end
