# Dependencies
require "../g_lib-2.0/g_lib.cr"

# C lib declaration
require "./lib_g_module.cr"

# Wrappers
require "./module.cr"

module GModule
  # Callbacks

  # Specifies the type of the module initialization function.
  # If a module contains a function named g_module_check_init() it is called
  # automatically when the module is loaded. It is passed the #GModule structure
  # and should return %NULL on success or a string describing the initialization
  # error.
  alias ModuleCheckInit = Proc(::String)

  # Specifies the type of the module function called when it is unloaded.
  # If a module contains a function named g_module_unload() it is called
  # automatically when the module is unloaded.
  # It is passed the #GModule structure.
  alias ModuleUnload = Proc(Nil)

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

  def self.module_build_path(directory : ::String?, module_name : ::String) : ::String
    # g_module_build_path: (None)
    # @directory: (nullable)
    # Returns: (transfer full)

    # Generator::NullableArrayPlan
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

  def self.module_error : ::String
    # g_module_error: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGModule.g_module_error

    # Return value handling

    ::String.new(_retval)
  end

  def self.module_error_quark : UInt32
    # g_module_error_quark: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGModule.g_module_error_quark

    # Return value handling

    _retval
  end

  def self.module_supported : Bool
    # g_module_supported: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGModule.g_module_supported

    # Return value handling

    GICrystal.to_bool(_retval)
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
