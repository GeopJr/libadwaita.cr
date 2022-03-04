module GObject
  # An opaque structure used as the base of all interface types.
  class TypeInterface
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::TypeInterface))
      @pointer.copy_from(pointer, sizeof(LibGObject::TypeInterface))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(g_type : UInt64? = nil, g_instance_type : UInt64? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.g_type = g_type unless g_type.nil?
      _instance.g_instance_type = g_instance_type unless g_instance_type.nil?
      _instance
    end

    def finalize
    end

    def g_type : UInt64
      # Property getter
      _var = (@pointer + 0).as(Pointer(UInt64))
      _var.value
    end

    def g_type=(value : UInt64)
      # Property setter
      _var = (@pointer + 0).as(Pointer(UInt64)).value = value
      value
    end

    def g_instance_type : UInt64
      # Property getter
      _var = (@pointer + 8).as(Pointer(UInt64))
      _var.value
    end

    def g_instance_type=(value : UInt64)
      # Property setter
      _var = (@pointer + 8).as(Pointer(UInt64)).value = value
      value
    end

    def peek_parent : GObject::TypeInterface
      # g_type_interface_peek_parent: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGObject.g_type_interface_peek_parent(self)

      # Return value handling
      GObject::TypeInterface.new(_retval, GICrystal::Transfer::None)
    end

    def self.add_prerequisite(interface_type : UInt64, prerequisite_type : UInt64) : Nil
      # g_type_interface_add_prerequisite: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGObject.g_type_interface_add_prerequisite(interface_type, prerequisite_type)

      # Return value handling
    end

    def self.plugin(instance_type : UInt64, interface_type : UInt64) : GObject::TypePlugin
      # g_type_interface_get_plugin: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGObject.g_type_interface_get_plugin(instance_type, interface_type)

      # Return value handling
      GObject::TypePlugin__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def self.instantiatable_prerequisite(interface_type : UInt64) : UInt64
      # g_type_interface_instantiatable_prerequisite: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGObject.g_type_interface_instantiatable_prerequisite(interface_type)

      # Return value handling
      _retval
    end

    def self.peek(instance_class : GObject::TypeClass, iface_type : UInt64) : GObject::TypeInterface
      # g_type_interface_peek: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGObject.g_type_interface_peek(instance_class, iface_type)

      # Return value handling
      GObject::TypeInterface.new(_retval, GICrystal::Transfer::None)
    end

    def to_unsafe
      @pointer
    end
  end
end
