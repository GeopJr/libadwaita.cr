require "../g_object-2.0/object"

module Gdk
  # A physical tool associated to a `GdkDevice`.
  @[GObject::GeneratedWrapper]
  class DeviceTool < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::DeviceTool), instance_init, 0)
    end

    GICrystal.define_new_method(DeviceTool, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `DeviceTool`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, axes : Gdk::AxisFlags? = nil, hardware_id : UInt64? = nil, serial : UInt64? = nil, tool_type : Gdk::DeviceToolType? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if !axes.nil?
        (_names.to_unsafe + _n).value = "axes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, axes)
        _n += 1
      end
      if !hardware_id.nil?
        (_names.to_unsafe + _n).value = "hardware-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hardware_id)
        _n += 1
      end
      if !serial.nil?
        (_names.to_unsafe + _n).value = "serial".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, serial)
        _n += 1
      end
      if !tool_type.nil?
        (_names.to_unsafe + _n).value = "tool-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tool_type)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DeviceTool.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_device_tool_get_type
    end

    def axes=(value : Gdk::AxisFlags) : Gdk::AxisFlags
      unsafe_value = value

      LibGObject.g_object_set(self, "axes", unsafe_value, Pointer(Void).null)
      value
    end

    def axes : Gdk::AxisFlags
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "axes", pointerof(value), Pointer(Void).null)
      Gdk::AxisFlags.new(value)
    end

    def hardware_id=(value : UInt64) : UInt64
      unsafe_value = value

      LibGObject.g_object_set(self, "hardware-id", unsafe_value, Pointer(Void).null)
      value
    end

    def hardware_id : UInt64
      # Returns: None

      value = uninitialized UInt64
      LibGObject.g_object_get(self, "hardware-id", pointerof(value), Pointer(Void).null)
      value
    end

    def serial=(value : UInt64) : UInt64
      unsafe_value = value

      LibGObject.g_object_set(self, "serial", unsafe_value, Pointer(Void).null)
      value
    end

    def serial : UInt64
      # Returns: None

      value = uninitialized UInt64
      LibGObject.g_object_get(self, "serial", pointerof(value), Pointer(Void).null)
      value
    end

    def tool_type=(value : Gdk::DeviceToolType) : Gdk::DeviceToolType
      unsafe_value = value

      LibGObject.g_object_set(self, "tool-type", unsafe_value, Pointer(Void).null)
      value
    end

    def tool_type : Gdk::DeviceToolType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "tool-type", pointerof(value), Pointer(Void).null)
      Gdk::DeviceToolType.new(value)
    end

    # Gets the axes of the tool.
    def axes : Gdk::AxisFlags
      # gdk_device_tool_get_axes: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_device_tool_get_axes(@pointer)

      # Return value handling

      Gdk::AxisFlags.new(_retval)
    end

    # Gets the hardware ID of this tool, or 0 if it's not known.
    #
    # When non-zero, the identificator is unique for the given tool model,
    # meaning that two identical tools will share the same @hardware_id,
    # but will have different serial numbers (see
    # `Gdk::DeviceTool#serial`).
    #
    # This is a more concrete (and device specific) method to identify
    # a `GdkDeviceTool` than `Gdk::DeviceTool#tool_type`,
    # as a tablet may support multiple devices with the same
    # `GdkDeviceToolType`, but different hardware identificators.
    def hardware_id : UInt64
      # gdk_device_tool_get_hardware_id: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_device_tool_get_hardware_id(@pointer)

      # Return value handling

      _retval
    end

    # Gets the serial number of this tool.
    #
    # This value can be used to identify a physical tool
    # (eg. a tablet pen) across program executions.
    def serial : UInt64
      # gdk_device_tool_get_serial: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_device_tool_get_serial(@pointer)

      # Return value handling

      _retval
    end

    # Gets the `GdkDeviceToolType` of the tool.
    def tool_type : Gdk::DeviceToolType
      # gdk_device_tool_get_tool_type: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_device_tool_get_tool_type(@pointer)

      # Return value handling

      Gdk::DeviceToolType.new(_retval)
    end
  end
end
