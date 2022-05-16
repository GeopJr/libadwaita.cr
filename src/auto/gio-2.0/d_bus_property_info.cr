module Gio
  # Information about a D-Bus property on a D-Bus interface.
  class DBusPropertyInfo
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGio::DBusPropertyInfo))
      @pointer.copy_from(pointer, sizeof(LibGio::DBusPropertyInfo))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(ref_count : Int32? = nil, name : ::String? = nil, signature : ::String? = nil, flags : Gio::DBusPropertyInfoFlags? = nil, annotations : Enumerable(Gio::DBusAnnotationInfo)? = nil)
      _ptr = Pointer(Void).malloc(40)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.ref_count = ref_count unless ref_count.nil?
      _instance.name = name unless name.nil?
      _instance.signature = signature unless signature.nil?
      _instance.flags = flags unless flags.nil?
      _instance.annotations = annotations unless annotations.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGio::DBusPropertyInfo)).zero?
    end

    def ref_count : Int32
      _var = (@pointer + 0).as(Pointer(Int32))
      _var.value
    end

    def ref_count=(value : Int32)
      _var = (@pointer + 0).as(Pointer(Int32)).value = value
      value
    end

    def name!
      self.name.not_nil!
    end

    def name : ::String?
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char)))
      return if _var.value.null?
      ::String.new(_var.value)
    end

    def name=(value : ::String?)
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char))).value = value.nil? ? Pointer(LibC::Char).null : value.to_unsafe
      value
    end

    def signature!
      self.signature.not_nil!
    end

    def signature : ::String?
      _var = (@pointer + 16).as(Pointer(Pointer(LibC::Char)))
      return if _var.value.null?
      ::String.new(_var.value)
    end

    def signature=(value : ::String?)
      _var = (@pointer + 16).as(Pointer(Pointer(LibC::Char))).value = value.nil? ? Pointer(LibC::Char).null : value.to_unsafe
      value
    end

    def flags : Gio::DBusPropertyInfoFlags
      _var = (@pointer + 24).as(Pointer(UInt32))
      Gio::DBusPropertyInfoFlags.new(_var)
    end

    def flags=(value : Gio::DBusPropertyInfoFlags)
      _var = (@pointer + 24).as(Pointer(UInt32))
      _var.copy_from(value.to_unsafe, sizeof(LibGio::DBusPropertyInfo))
      value
    end

    def annotations!
      self.annotations.not_nil!
    end

    def annotations : Enumerable(Gio::DBusAnnotationInfo)?
      _var = (@pointer + 32).as(Pointer(Pointer(Pointer(Void))))
      return if _var.value.null?
      GICrystal.transfer_null_ended_array(_var.value, GICrystal::Transfer::None)
    end

    def annotations=(value : Enumerable(Gio::DBusAnnotationInfo)?)
      _var = (@pointer + 32).as(Pointer(Pointer(Pointer(Void)))).value = value.nil? ? Pointer(Pointer(Void)).null : value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_property_info_get_type
    end

    def ref : Gio::DBusPropertyInfo
      # g_dbus_property_info_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_property_info_ref(@pointer)

      # Return value handling

      Gio::DBusPropertyInfo.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # g_dbus_property_info_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_property_info_unref(@pointer)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
