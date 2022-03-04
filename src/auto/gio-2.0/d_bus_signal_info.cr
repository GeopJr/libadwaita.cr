module Gio
  # Information about a signal on a D-Bus interface.
  class DBusSignalInfo
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGio::DBusSignalInfo))
      @pointer.copy_from(pointer, sizeof(LibGio::DBusSignalInfo))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(ref_count : Int32? = nil, name : ::String? = nil, args : Enumerable(Gio::DBusArgInfo)? = nil, annotations : Enumerable(Gio::DBusAnnotationInfo)? = nil)
      _ptr = Pointer(Void).malloc(32)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.ref_count = ref_count unless ref_count.nil?
      _instance.name = name unless name.nil?
      _instance.args = args unless args.nil?
      _instance.annotations = annotations unless annotations.nil?
      _instance
    end

    def finalize
    end

    def ref_count : Int32
      # Property getter
      _var = (@pointer + 0).as(Pointer(Int32))
      _var.value
    end

    def ref_count=(value : Int32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Int32)).value = value
      value
    end

    def name : ::String
      # Property getter
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char)))
      ::String.new(_var.value)
    end

    def name=(value : ::String)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def args : Enumerable(Gio::DBusArgInfo)
      # Property getter
      _var = (@pointer + 16).as(Pointer(Pointer(Pointer(Void))))
      GICrystal.transfer_null_ended_array(_var.value, GICrystal::Transfer::None)
    end

    def args=(value : Enumerable(Gio::DBusArgInfo))
      # Property setter
      _var = (@pointer + 16).as(Pointer(Pointer(Pointer(Void)))).value = value
      value
    end

    def annotations : Enumerable(Gio::DBusAnnotationInfo)
      # Property getter
      _var = (@pointer + 24).as(Pointer(Pointer(Pointer(Void))))
      GICrystal.transfer_null_ended_array(_var.value, GICrystal::Transfer::None)
    end

    def annotations=(value : Enumerable(Gio::DBusAnnotationInfo))
      # Property setter
      _var = (@pointer + 24).as(Pointer(Pointer(Pointer(Void)))).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_signal_info_get_type
    end

    def ref : Gio::DBusSignalInfo
      # g_dbus_signal_info_ref: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_signal_info_ref(self)

      # Return value handling
      Gio::DBusSignalInfo.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # g_dbus_signal_info_unref: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_dbus_signal_info_unref(self)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
