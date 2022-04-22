module GObject
  # An opaque structure used as the base of all interface types.
  class TypeInterface
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

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

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGObject::TypeInterface)).zero?
    end

    def g_type : UInt64
      _var = (@pointer + 0).as(Pointer(UInt64))
      _var.value
    end

    def g_type=(value : UInt64)
      _var = (@pointer + 0).as(Pointer(UInt64)).value = value
      value
    end

    def g_instance_type : UInt64
      _var = (@pointer + 8).as(Pointer(UInt64))
      _var.value
    end

    def g_instance_type=(value : UInt64)
      _var = (@pointer + 8).as(Pointer(UInt64)).value = value
      value
    end

    def peek_parent : GObject::TypeInterface
      # g_type_interface_peek_parent: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_type_interface_peek_parent(self)

      # Return value handling

      GObject::TypeInterface.new(_retval, GICrystal::Transfer::None)
    end

    def to_unsafe
      @pointer
    end
  end
end
