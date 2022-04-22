module Gio
  # Information about nodes in a remote object hierarchy.
  class DBusNodeInfo
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGio::DBusNodeInfo))
      @pointer.copy_from(pointer, sizeof(LibGio::DBusNodeInfo))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(ref_count : Int32? = nil, path : ::String? = nil, interfaces : Enumerable(Gio::DBusInterfaceInfo)? = nil, nodes : Enumerable(Gio::DBusNodeInfo)? = nil, annotations : Enumerable(Gio::DBusAnnotationInfo)? = nil)
      _ptr = Pointer(Void).malloc(40)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.ref_count = ref_count unless ref_count.nil?
      _instance.path = path unless path.nil?
      _instance.interfaces = interfaces unless interfaces.nil?
      _instance.nodes = nodes unless nodes.nil?
      _instance.annotations = annotations unless annotations.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGio::DBusNodeInfo)).zero?
    end

    def ref_count : Int32
      _var = (@pointer + 0).as(Pointer(Int32))
      _var.value
    end

    def ref_count=(value : Int32)
      _var = (@pointer + 0).as(Pointer(Int32)).value = value
      value
    end

    def path!
      self.path.not_nil!
    end

    def path : ::String?
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char)))
      return if _var.value.null?
      ::String.new(_var.value)
    end

    def path=(value : ::String?)
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char))).value = value.nil? ? Pointer(LibC::Char).null : value.to_unsafe
      value
    end

    def interfaces!
      self.interfaces.not_nil!
    end

    def interfaces : Enumerable(Gio::DBusInterfaceInfo)?
      _var = (@pointer + 16).as(Pointer(Pointer(Pointer(Void))))
      return if _var.value.null?
      GICrystal.transfer_null_ended_array(_var.value, GICrystal::Transfer::None)
    end

    def interfaces=(value : Enumerable(Gio::DBusInterfaceInfo)?)
      _var = (@pointer + 16).as(Pointer(Pointer(Pointer(Void)))).value = value.nil? ? Pointer(Pointer(Void)).null : value
      value
    end

    def nodes!
      self.nodes.not_nil!
    end

    def nodes : Enumerable(Gio::DBusNodeInfo)?
      _var = (@pointer + 24).as(Pointer(Pointer(Pointer(Void))))
      return if _var.value.null?
      GICrystal.transfer_null_ended_array(_var.value, GICrystal::Transfer::None)
    end

    def nodes=(value : Enumerable(Gio::DBusNodeInfo)?)
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
      LibGio.g_dbus_node_info_get_type
    end

    def self.new_for_xml(xml_data : ::String) : self
      # g_dbus_node_info_new_for_xml: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_dbus_node_info_new_for_xml(xml_data, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::DBusNodeInfo.new(_retval, GICrystal::Transfer::Full)
    end

    def generate_xml(indent : UInt32, string_builder : GLib::String) : Nil
      # g_dbus_node_info_generate_xml: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_node_info_generate_xml(self, indent, string_builder)

      # Return value handling
    end

    def lookup_interface(name : ::String) : Gio::DBusInterfaceInfo?
      # g_dbus_node_info_lookup_interface: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_node_info_lookup_interface(self, name)

      # Return value handling

      Gio::DBusInterfaceInfo.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def ref : Gio::DBusNodeInfo
      # g_dbus_node_info_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_node_info_ref(self)

      # Return value handling

      Gio::DBusNodeInfo.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # g_dbus_node_info_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_node_info_unref(self)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
