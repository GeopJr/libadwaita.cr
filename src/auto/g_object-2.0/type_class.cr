module GObject
  # An opaque structure used as the base of all classes.
  class TypeClass
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::TypeClass))
      @pointer.copy_from(pointer, sizeof(LibGObject::TypeClass))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(g_type : UInt64? = nil)
      _ptr = Pointer(Void).malloc(8)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.g_type = g_type unless g_type.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGObject::TypeClass)).zero?
    end

    def g_type : UInt64
      _var = (@pointer + 0).as(Pointer(UInt64))
      _var.value
    end

    def g_type=(value : UInt64)
      _var = (@pointer + 0).as(Pointer(UInt64)).value = value
      value
    end

    def add_private(private_size : UInt64) : Nil
      # g_type_class_add_private: (Method)
      # Returns: (transfer none)

      # C call
      LibGObject.g_type_class_add_private(@pointer, private_size)

      # Return value handling
    end

    def private(private_type : UInt64) : Pointer(Void)?
      # g_type_class_get_private: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_type_class_get_private(@pointer, private_type)

      # Return value handling

      _retval unless _retval.null?
    end

    def peek_parent : GObject::TypeClass
      # g_type_class_peek_parent: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_type_class_peek_parent(@pointer)

      # Return value handling

      GObject::TypeClass.new(_retval, GICrystal::Transfer::None)
    end

    def unref : Nil
      # g_type_class_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGObject.g_type_class_unref(@pointer)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
