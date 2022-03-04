module GObject
  # An opaque structure used as the base of all type instances.
  class TypeInstance
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::TypeInstance))
      @pointer.copy_from(pointer, sizeof(LibGObject::TypeInstance))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(g_class : GObject::TypeClass? = nil)
      _ptr = Pointer(Void).malloc(8)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.g_class = g_class unless g_class.nil?
      _instance
    end

    def finalize
    end

    def g_class : GObject::TypeClass
      # Property getter
      _var = (@pointer + 0).as(Pointer(Pointer(Void)))
      GObject::TypeClass.new(_var.value, GICrystal::Transfer::None)
    end

    def g_class=(value : GObject::TypeClass)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Pointer(Void))).value = value.to_unsafe
      value
    end

    def private(private_type : UInt64) : Pointer(Void)?
      # g_type_instance_get_private: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGObject.g_type_instance_get_private(self, private_type)

      # Return value handling
      _retval unless _retval.null?
    end

    def to_unsafe
      @pointer
    end
  end
end
