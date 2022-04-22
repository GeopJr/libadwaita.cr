module Gio
  # Information about a D-Bus interface.
  class DBusInterfaceInfo
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGio::DBusInterfaceInfo))
      @pointer.copy_from(pointer, sizeof(LibGio::DBusInterfaceInfo))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(ref_count : Int32? = nil, name : ::String? = nil, methods : Enumerable(Gio::DBusMethodInfo)? = nil, signals : Enumerable(Gio::DBusSignalInfo)? = nil, properties : Enumerable(Gio::DBusPropertyInfo)? = nil, annotations : Enumerable(Gio::DBusAnnotationInfo)? = nil)
      _ptr = Pointer(Void).malloc(48)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.ref_count = ref_count unless ref_count.nil?
      _instance.name = name unless name.nil?
      _instance.methods = methods unless methods.nil?
      _instance.signals = signals unless signals.nil?
      _instance.properties = properties unless properties.nil?
      _instance.annotations = annotations unless annotations.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGio::DBusInterfaceInfo)).zero?
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

    def methods!
      self.methods.not_nil!
    end

    def methods : Enumerable(Gio::DBusMethodInfo)?
      _var = (@pointer + 16).as(Pointer(Pointer(Pointer(Void))))
      return if _var.value.null?
      GICrystal.transfer_null_ended_array(_var.value, GICrystal::Transfer::None)
    end

    def methods=(value : Enumerable(Gio::DBusMethodInfo)?)
      _var = (@pointer + 16).as(Pointer(Pointer(Pointer(Void)))).value = value.nil? ? Pointer(Pointer(Void)).null : value
      value
    end

    def signals!
      self.signals.not_nil!
    end

    def signals : Enumerable(Gio::DBusSignalInfo)?
      _var = (@pointer + 24).as(Pointer(Pointer(Pointer(Void))))
      return if _var.value.null?
      GICrystal.transfer_null_ended_array(_var.value, GICrystal::Transfer::None)
    end

    def signals=(value : Enumerable(Gio::DBusSignalInfo)?)
      _var = (@pointer + 24).as(Pointer(Pointer(Pointer(Void)))).value = value.nil? ? Pointer(Pointer(Void)).null : value
      value
    end

    def properties!
      self.properties.not_nil!
    end

    def properties : Enumerable(Gio::DBusPropertyInfo)?
      _var = (@pointer + 32).as(Pointer(Pointer(Pointer(Void))))
      return if _var.value.null?
      GICrystal.transfer_null_ended_array(_var.value, GICrystal::Transfer::None)
    end

    def properties=(value : Enumerable(Gio::DBusPropertyInfo)?)
      _var = (@pointer + 32).as(Pointer(Pointer(Pointer(Void)))).value = value.nil? ? Pointer(Pointer(Void)).null : value
      value
    end

    def annotations!
      self.annotations.not_nil!
    end

    def annotations : Enumerable(Gio::DBusAnnotationInfo)?
      _var = (@pointer + 40).as(Pointer(Pointer(Pointer(Void))))
      return if _var.value.null?
      GICrystal.transfer_null_ended_array(_var.value, GICrystal::Transfer::None)
    end

    def annotations=(value : Enumerable(Gio::DBusAnnotationInfo)?)
      _var = (@pointer + 40).as(Pointer(Pointer(Pointer(Void)))).value = value.nil? ? Pointer(Pointer(Void)).null : value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_interface_info_get_type
    end

    def cache_build : Nil
      # g_dbus_interface_info_cache_build: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_interface_info_cache_build(self)

      # Return value handling
    end

    def cache_release : Nil
      # g_dbus_interface_info_cache_release: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_interface_info_cache_release(self)

      # Return value handling
    end

    def generate_xml(indent : UInt32, string_builder : GLib::String) : Nil
      # g_dbus_interface_info_generate_xml: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_interface_info_generate_xml(self, indent, string_builder)

      # Return value handling
    end

    def lookup_method(name : ::String) : Gio::DBusMethodInfo?
      # g_dbus_interface_info_lookup_method: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_interface_info_lookup_method(self, name)

      # Return value handling

      Gio::DBusMethodInfo.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def lookup_property(name : ::String) : Gio::DBusPropertyInfo?
      # g_dbus_interface_info_lookup_property: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_interface_info_lookup_property(self, name)

      # Return value handling

      Gio::DBusPropertyInfo.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def lookup_signal(name : ::String) : Gio::DBusSignalInfo?
      # g_dbus_interface_info_lookup_signal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_interface_info_lookup_signal(self, name)

      # Return value handling

      Gio::DBusSignalInfo.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def ref : Gio::DBusInterfaceInfo
      # g_dbus_interface_info_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_interface_info_ref(self)

      # Return value handling

      Gio::DBusInterfaceInfo.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # g_dbus_interface_info_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_interface_info_unref(self)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
