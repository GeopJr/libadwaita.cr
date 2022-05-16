@[Link("gmodule-2.0", pkg_config: "gmodule-2.0")]
lib LibGModule
  # Flags
  type ModuleFlags = UInt32

  # Enums
  type ModuleError = UInt32

  # Callbacks
  alias ModuleCheckInit = Pointer(LibGModule::Module) -> Pointer(LibC::Char)
  alias ModuleUnload = Pointer(LibGModule::Module) -> Void

  # Interface types

  # Structs
  type Module = Void # Struct with zero bytes

  # Unions

  # Objects

  # All C Functions
  fun g_module_build_path(directory : Pointer(LibC::Char), module_name : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_module_build_path(directory : Pointer(LibC::Char), module_name : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun g_module_close(this : Void*) : LibC::Int
  fun g_module_error : Pointer(LibC::Char)
  fun g_module_error : Pointer(LibC::Char)
  fun g_module_error_quark : UInt32
  fun g_module_error_quark : UInt32
  fun g_module_make_resident(this : Void*) : Void
  fun g_module_name(this : Void*) : Pointer(LibC::Char)
  fun g_module_supported : LibC::Int
  fun g_module_supported : LibC::Int
  fun g_module_symbol(this : Void*, symbol_name : Pointer(LibC::Char), symbol : Pointer(Pointer(Void))) : LibC::Int
end
