# Dependencies
require "../g_lib-2.0/g_lib.cr"

# C lib declaration
require "./lib_g_module.cr"

# Wrappers
require "./module.cr"

module GModule
  # Base class for all errors in this module.
  class GModuleError < RuntimeError
    # :nodoc:
    def initialize(error : Pointer(LibGLib::Error))
      message_ptr = error.value.message
      super(String.new(message_ptr)) unless message_ptr.null?
      LibGLib.g_error_free(error)
    end
  end

  # Enums

  # Flags
  @[Flags]
  enum ModuleFlags : UInt32
    Lazy  = 1
    Local = 2
    Mask  = 3
  end

  # Errors

  # Errors returned by g_module_open_full().
  class ModuleError < GModuleError
    class Failed < ModuleError
      def code : Int32
        0
      end
    end

    class CheckFailed < ModuleError
      def code : Int32
        1
      end
    end
  end

  # :nodoc:
  def raise_exception(error : Pointer(LibGLib::Error))
    error_domain = error.value.domain
    error_code = error.value.code

    if error_domain == LibGLib.g_quark_try_string("g-module-error-quark")
      raise ModuleError::Failed.new(error) if error_code == 0
      raise ModuleError::CheckFailed.new(error) if error_code == 1
    end

    GLib.raise_exception(error)
  end

  extend self
end

# Extra includes
