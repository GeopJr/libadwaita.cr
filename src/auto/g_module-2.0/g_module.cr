# Dependencies
require "../g_lib-2.0/g_lib.cr"

# C lib declaration
require "./lib_g_module.cr"

# Wrappers
require "./module.cr"

module GModule
  enum ModuleError : UInt32
    Failed      = 0
    CheckFailed = 1
  end

  @[Flags]
  enum ModuleFlags : UInt32
    Lazy  = 1
    Local = 2
    Mask  = 3
  end

  extend self
end

# Extra includes
