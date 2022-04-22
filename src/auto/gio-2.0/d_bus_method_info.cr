module Gio
  # Information about a method on an D-Bus interface.
  class DBusMethodInfo
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGio::DBusMethodInfo))
      @pointer.copy_from(pointer, sizeof(LibGio::DBusMethodInfo))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(ref_count : Int32? = nil, name : ::String? = nil, in_args : Enumerable(Gio::DBusArgInfo)? = nil, out_args : Enumerable(Gio::DBusArgInfo)? = nil, annotations : Enumerable(Gio::DBusAnnotationInfo)? = nil)
      _ptr = Pointer(Void).malloc(40)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.ref_count = ref_count unless ref_count.nil?
      _instance.name = name unless name.nil?
      _instance.in_args = in_args unless in_args.nil?
      _instance.out_args = out_args unless out_args.nil?
      _instance.annotations = annotations unless annotations.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGio::DBusMethodInfo)).zero?
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

    def in_args!
      self.in_args.not_nil!
    end

    def in_args : Enumerable(Gio::DBusArgInfo)?
      _var = (@pointer + 16).as(Pointer(Pointer(Pointer(Void))))
      return if _var.value.null?
      GICrystal.transfer_null_ended_array(_var.value, GICrystal::Transfer::None)
    end

    def in_args=(value : Enumerable(Gio::DBusArgInfo)?)
      _var = (@pointer + 16).as(Pointer(Pointer(Pointer(Void)))).value = value.nil? ? Pointer(Pointer(Void)).null : value
      value
    end

    def out_args!
      self.out_args.not_nil!
    end

    def out_args : Enumerable(Gio::DBusArgInfo)?
      _var = (@pointer + 24).as(Pointer(Pointer(Pointer(Void))))
      return if _var.value.null?
      GICrystal.transfer_null_ended_array(_var.value, GICrystal::Transfer::None)
    end

    def out_args=(value : Enumerable(Gio::DBusArgInfo)?)
      _var = (@pointer + 24).as(Pointer(Pointer(Pointer(Void)))).value = value.nil? ? Pointer(Pointer(Void)).null : value
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
      LibGio.g_dbus_method_info_get_type
    end

    def ref : Gio::DBusMethodInfo
      # g_dbus_method_info_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_method_info_ref(self)

      # Return value handling

      Gio::DBusMethodInfo.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # g_dbus_method_info_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_method_info_unref(self)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
