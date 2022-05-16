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
  @[GObject::GeneratedWrapper]
  class TypeModule < Object
    include TypePlugin

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::TypeModuleClass), class_init,
        sizeof(LibGObject::TypeModule), instance_init, 0)
    end

    GICrystal.define_new_method(TypeModule, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `TypeModule`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGObject.g_type_module_get_type
    end

    # Registers an additional interface for a type, whose interface lives
    # in the given type plugin. If the interface was already registered
    # for the type in this plugin, nothing will be done.
    #
    # As long as any instances of the type exist, the type plugin will
    # not be unloaded.
    #
    # Since 2.56 if @module is %NULL this will call g_type_add_interface_static()
    # instead. This can be used when making a static build of the module.
    def add_interface(instance_type : UInt64, interface_type : UInt64, interface_info : GObject::InterfaceInfo) : Nil
      # g_type_module_add_interface: (Method)
      # Returns: (transfer none)

      # C call
      LibGObject.g_type_module_add_interface(@pointer, instance_type, interface_type, interface_info)

      # Return value handling
    end

    # Looks up or registers an enumeration that is implemented with a particular
    # type plugin. If a type with name @type_name was previously registered,
    # the #GType identifier for the type is returned, otherwise the type
    # is newly registered, and the resulting #GType identifier returned.
    #
    # As long as any instances of the type exist, the type plugin will
    # not be unloaded.
    #
    # Since 2.56 if @module is %NULL this will call g_type_register_static()
    # instead. This can be used when making a static build of the module.
    def register_enum(name : ::String, const_static_values : GObject::EnumValue) : UInt64
      # g_type_module_register_enum: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_type_module_register_enum(@pointer, name, const_static_values)

      # Return value handling

      _retval
    end

    # Looks up or registers a flags type that is implemented with a particular
    # type plugin. If a type with name @type_name was previously registered,
    # the #GType identifier for the type is returned, otherwise the type
    # is newly registered, and the resulting #GType identifier returned.
    #
    # As long as any instances of the type exist, the type plugin will
    # not be unloaded.
    #
    # Since 2.56 if @module is %NULL this will call g_type_register_static()
    # instead. This can be used when making a static build of the module.
    def register_flags(name : ::String, const_static_values : GObject::FlagsValue) : UInt64
      # g_type_module_register_flags: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_type_module_register_flags(@pointer, name, const_static_values)

      # Return value handling

      _retval
    end

    # Looks up or registers a type that is implemented with a particular
    # type plugin. If a type with name @type_name was previously registered,
    # the #GType identifier for the type is returned, otherwise the type
    # is newly registered, and the resulting #GType identifier returned.
    #
    # When reregistering a type (typically because a module is unloaded
    # then reloaded, and reinitialized), @module and @parent_type must
    # be the same as they were previously.
    #
    # As long as any instances of the type exist, the type plugin will
    # not be unloaded.
    #
    # Since 2.56 if @module is %NULL this will call g_type_register_static()
    # instead. This can be used when making a static build of the module.
    def register_type(parent_type : UInt64, type_name : ::String, type_info : GObject::TypeInfo, flags : GObject::TypeFlags) : UInt64
      # g_type_module_register_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_type_module_register_type(@pointer, parent_type, type_name, type_info, flags)

      # Return value handling

      _retval
    end

    # Sets the name for a #GTypeModule
    def name=(name : ::String) : Nil
      # g_type_module_set_name: (Method)
      # Returns: (transfer none)

      # C call
      LibGObject.g_type_module_set_name(@pointer, name)

      # Return value handling
    end

    # Decreases the use count of a #GTypeModule by one. If the
    # result is zero, the module will be unloaded. (However, the
    # #GTypeModule will not be freed, and types associated with the
    # #GTypeModule are not unregistered. Once a #GTypeModule is
    # initialized, it must exist forever.)
    def unuse : Nil
      # g_type_module_unuse: (Method)
      # Returns: (transfer none)

      # C call
      LibGObject.g_type_module_unuse(@pointer)

      # Return value handling
    end

    # Increases the use count of a #GTypeModule by one. If the
    # use count was zero before, the plugin will be loaded.
    # If loading the plugin fails, the use count is reset to
    # its prior value.
    def use : Bool
      # g_type_module_use: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_type_module_use(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
