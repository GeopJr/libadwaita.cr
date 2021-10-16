require "../g_object-2.0/object"

module Gdk
  # A physical tool associated to a `GdkDevice`.
  class DeviceTool < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, axes : Gdk::AxisFlags? = nil, hardware_id : UInt64? = nil, serial : UInt64? = nil, tool_type : Gdk::DeviceToolType? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if axes
        (_names.to_unsafe + _n).value = "axes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, axes)
        _n += 1
      end
      if hardware_id
        (_names.to_unsafe + _n).value = "hardware-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hardware_id)
        _n += 1
      end
      if serial
        (_names.to_unsafe + _n).value = "serial".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, serial)
        _n += 1
      end
      if tool_type
        (_names.to_unsafe + _n).value = "tool-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tool_type)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DeviceTool.g_type, _n, _names, _values)
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
      Gdk::AxisFlags.from_value(value)
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
      Gdk::DeviceToolType.from_value(value)
    end

    def axes : Gdk::AxisFlags
      # gdk_device_tool_get_axes: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_device_tool_get_axes(self)
      Gdk::AxisFlags.from_value(_retval)
    end

    def hardware_id : UInt64
      # gdk_device_tool_get_hardware_id: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_device_tool_get_hardware_id(self)
      _retval
    end

    def serial : UInt64
      # gdk_device_tool_get_serial: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_device_tool_get_serial(self)
      _retval
    end

    def tool_type : Gdk::DeviceToolType
      # gdk_device_tool_get_tool_type: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_device_tool_get_tool_type(self)
      Gdk::DeviceToolType.from_value(_retval)
    end
  end
end
