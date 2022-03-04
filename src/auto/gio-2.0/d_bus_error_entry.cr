module Gio
  # Struct used in g_dbus_error_register_error_domain().
  class DBusErrorEntry
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGio::DBusErrorEntry))
      @pointer.copy_from(pointer, sizeof(LibGio::DBusErrorEntry))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(error_code : Int32? = nil, dbus_error_name : ::String? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.error_code = error_code unless error_code.nil?
      _instance.dbus_error_name = dbus_error_name unless dbus_error_name.nil?
      _instance
    end

    def finalize
    end

    def error_code : Int32
      # Property getter
      _var = (@pointer + 0).as(Pointer(Int32))
      _var.value
    end

    def error_code=(value : Int32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Int32)).value = value
      value
    end

    def dbus_error_name : ::String
      # Property getter
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char)))
      ::String.new(_var.value)
    end

    def dbus_error_name=(value : ::String)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
