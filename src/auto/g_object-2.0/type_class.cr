module GObject
  # An opaque structure used as the base of all classes.
  class TypeClass
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

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

    def add_private(private_size : UInt64) : Nil
      # g_type_class_add_private: (Method)
      # Returns: (transfer none)

      LibGObject.g_type_class_add_private(self, private_size)
    end

    def private(private_type : UInt64) : Pointer(Nil)?
      # g_type_class_get_private: (Method)
      # Returns: (transfer none)

      _retval = LibGObject.g_type_class_get_private(self, private_type)
      Pointer(Void) unless _retval.null?
    end

    def peek_parent : GObject::TypeClass
      # g_type_class_peek_parent: (Method)
      # Returns: (transfer none)

      _retval = LibGObject.g_type_class_peek_parent(self)
      GObject::TypeClass.new(_retval, GICrystal::Transfer::None)
    end

    def unref : Nil
      # g_type_class_unref: (Method)
      # Returns: (transfer none)

      LibGObject.g_type_class_unref(self)
    end

    def self.adjust_private_offset(g_class : Pointer(Nil)?, private_size_or_offset : Pointer(Int32)) : Nil
      # g_type_class_adjust_private_offset: (None)
      # @g_class: (nullable)
      # Returns: (transfer none)

      g_class = if g_class.nil?
                  Pointer(Void).null
                else
                  g_class.to_unsafe
                end

      LibGObject.g_type_class_adjust_private_offset(g_class, private_size_or_offset)
    end

    def self.peek(type : UInt64) : GObject::TypeClass
      # g_type_class_peek: (None)
      # Returns: (transfer none)

      _retval = LibGObject.g_type_class_peek(type)
      GObject::TypeClass.new(_retval, GICrystal::Transfer::None)
    end

    def self.peek_static(type : UInt64) : GObject::TypeClass
      # g_type_class_peek_static: (None)
      # Returns: (transfer none)

      _retval = LibGObject.g_type_class_peek_static(type)
      GObject::TypeClass.new(_retval, GICrystal::Transfer::None)
    end

    def self.ref(type : UInt64) : GObject::TypeClass
      # g_type_class_ref: (None)
      # Returns: (transfer none)

      _retval = LibGObject.g_type_class_ref(type)
      GObject::TypeClass.new(_retval, GICrystal::Transfer::None)
    end

    def to_unsafe
      @pointer
    end
  end
end
