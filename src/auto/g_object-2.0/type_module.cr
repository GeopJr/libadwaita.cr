require "./object"
require "./type_plugin"

module GObject
  # #GTypeModule provides a simple implementation of the #GTypePlugin
  # interface.
  #
  # The model of #GTypeModule is a dynamically loaded module which
  # implements some number of types and interface implementations.
  #
  # When the module is loaded, it registers its types and interfaces
  # using g_type_module_register_type() and g_type_module_add_interface().
  # As long as any instances of these types and interface implementations
  # are in use, the module is kept loaded. When the types and interfaces
  # are gone, the module may be unloaded. If the types and interfaces
  # become used again, the module will be reloaded. Note that the last
  # reference cannot be released from within the module code, since that
  # would lead to the caller's code being unloaded before g_object_unref()
  # returns to it.
  #
  # Keeping track of whether the module should be loaded or not is done by
  # using a use count - it starts at zero, and whenever it is greater than
  # zero, the module is loaded. The use count is maintained internally by
  # the type system, but also can be explicitly controlled by
  # g_type_module_use() and g_type_module_unuse(). Typically, when loading
  # a module for the first type, g_type_module_use() will be used to load
  # it so that it can initialize its types. At some later point, when the
  # module no longer needs to be loaded except for the type
  # implementations it contains, g_type_module_unuse() is called.
  #
  # #GTypeModule does not actually provide any implementation of module
  # loading and unloading. To create a particular module type you must
  # derive from #GTypeModule and implement the load and unload functions
  # in #GTypeModuleClass.
  class TypeModule < Object
    include TypePlugin

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGObject.g_type_module_get_type
    end

    def add_interface(instance_type : UInt64, interface_type : UInt64, interface_info : GObject::InterfaceInfo) : Nil
      # g_type_module_add_interface: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGObject.g_type_module_add_interface(self, instance_type, interface_type, interface_info)

      # Return value handling
    end

    def register_enum(name : ::String, const_static_values : GObject::EnumValue) : UInt64
      # g_type_module_register_enum: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGObject.g_type_module_register_enum(self, name, const_static_values)

      # Return value handling
      _retval
    end

    def register_flags(name : ::String, const_static_values : GObject::FlagsValue) : UInt64
      # g_type_module_register_flags: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGObject.g_type_module_register_flags(self, name, const_static_values)

      # Return value handling
      _retval
    end

    def register_type(parent_type : UInt64, type_name : ::String, type_info : GObject::TypeInfo, flags : GObject::TypeFlags) : UInt64
      # g_type_module_register_type: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGObject.g_type_module_register_type(self, parent_type, type_name, type_info, flags)

      # Return value handling
      _retval
    end

    def name=(name : ::String) : Nil
      # g_type_module_set_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGObject.g_type_module_set_name(self, name)

      # Return value handling
    end

    def unuse : Nil
      # g_type_module_unuse: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGObject.g_type_module_unuse(self)

      # Return value handling
    end

    def use : Bool
      # g_type_module_use: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGObject.g_type_module_use(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end
  end
end
