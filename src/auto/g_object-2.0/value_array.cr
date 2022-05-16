module GObject
  # A #GValueArray contains an array of #GValue elements.
  class ValueArray
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::ValueArray))
      @pointer.copy_from(pointer, sizeof(LibGObject::ValueArray))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(n_values : UInt32? = nil, values : GObject::Value? = nil, n_prealloced : UInt32? = nil)
      _ptr = Pointer(Void).malloc(24)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.n_values = n_values unless n_values.nil?
      _instance.values = values unless values.nil?
      _instance.n_prealloced = n_prealloced unless n_prealloced.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGObject::ValueArray)).zero?
    end

    def n_values : UInt32
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.value
    end

    def n_values=(value : UInt32)
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value
      value
    end

    def values!
      self.values.not_nil!
    end

    def values : GObject::Value?
      _var = (@pointer + 8).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      GObject::Value.new(_var.value, GICrystal::Transfer::None)
    end

    def values=(value : GObject::Value?)
      _var = (@pointer + 8).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value.to_unsafe
      value
    end

    def n_prealloced : UInt32
      _var = (@pointer + 16).as(Pointer(UInt32))
      _var.value
    end

    def n_prealloced=(value : UInt32)
      _var = (@pointer + 16).as(Pointer(UInt32)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGObject.g_value_array_get_type
    end

    def initialize(n_prealloced : UInt32)
      # g_value_array_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGObject.g_value_array_new(n_prealloced)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    def append(value : _?) : GObject::ValueArray
      # g_value_array_append: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if value.nil?
                Pointer(Void).null
              elsif !value.is_a?(GObject::Value)
                GObject::Value.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      _retval = LibGObject.g_value_array_append(@pointer, value)

      # Return value handling

      GObject::ValueArray.new(_retval, GICrystal::Transfer::None)
    end

    def copy : GObject::ValueArray
      # g_value_array_copy: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGObject.g_value_array_copy(@pointer)

      # Return value handling

      GObject::ValueArray.new(_retval, GICrystal::Transfer::Full)
    end

    def nth(index_ : UInt32) : GObject::Value
      # g_value_array_get_nth: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_value_array_get_nth(@pointer, index_)

      # Return value handling

      GObject::Value.new(_retval, GICrystal::Transfer::None)
    end

    def insert(index_ : UInt32, value : _?) : GObject::ValueArray
      # g_value_array_insert: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if value.nil?
                Pointer(Void).null
              elsif !value.is_a?(GObject::Value)
                GObject::Value.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      _retval = LibGObject.g_value_array_insert(@pointer, index_, value)

      # Return value handling

      GObject::ValueArray.new(_retval, GICrystal::Transfer::None)
    end

    def prepend(value : _?) : GObject::ValueArray
      # g_value_array_prepend: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if value.nil?
                Pointer(Void).null
              elsif !value.is_a?(GObject::Value)
                GObject::Value.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      _retval = LibGObject.g_value_array_prepend(@pointer, value)

      # Return value handling

      GObject::ValueArray.new(_retval, GICrystal::Transfer::None)
    end

    def remove(index_ : UInt32) : GObject::ValueArray
      # g_value_array_remove: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_value_array_remove(@pointer, index_)

      # Return value handling

      GObject::ValueArray.new(_retval, GICrystal::Transfer::None)
    end

    def sort(compare_func : GLib::CompareDataFunc, user_data : Pointer(Void)?) : GObject::ValueArray
      # g_value_array_sort_with_data: (Method)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      _retval = LibGObject.g_value_array_sort_with_data(@pointer, compare_func, user_data)

      # Return value handling

      GObject::ValueArray.new(_retval, GICrystal::Transfer::None)
    end

    def to_unsafe
      @pointer
    end
  end
end
