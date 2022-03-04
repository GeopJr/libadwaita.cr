module HarfBuzz
  # Data structure for holding user-data keys.
  class UserDataKeyT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibHarfBuzz::UserDataKeyT))
      @pointer.copy_from(pointer, sizeof(LibHarfBuzz::UserDataKeyT))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(unused : Int8? = nil)
      _ptr = Pointer(Void).malloc(1)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.unused = unused unless unused.nil?
      _instance
    end

    def finalize
    end

    def unused : Int8
      # Property getter
      _var = (@pointer + 0).as(Pointer(Int8))
      _var.value
    end

    def unused=(value : Int8)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Int8)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibHarfBuzz.hb_gobject_user_data_key_get_type
    end

    def to_unsafe
      @pointer
    end
  end
end
