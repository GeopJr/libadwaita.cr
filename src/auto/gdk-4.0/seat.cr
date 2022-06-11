require "../g_object-2.0/object"

module Gdk
  # The `GdkSeat` object represents a collection of input devices
  # that belong to a user.
  @[GObject::GeneratedWrapper]
  class Seat < GObject::Object
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(Seat, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Seat`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, display : Gdk::Display? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !display.nil?
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Seat.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_seat_get_type
    end

    def display=(value : Gdk::Display?) : Gdk::Display?
      unsafe_value = value

      LibGObject.g_object_set(self, "display", unsafe_value, Pointer(Void).null)
      value
    end

    def display : Gdk::Display?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "display", pointerof(value), Pointer(Void).null)
      Gdk::Display.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Returns the capabilities this `GdkSeat` currently has.
    def capabilities : Gdk::SeatCapabilities
      # gdk_seat_get_capabilities: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_seat_get_capabilities(@pointer)

      # Return value handling

      Gdk::SeatCapabilities.new(_retval)
    end

    # Returns the devices that match the given capabilities.
    def devices(capabilities : Gdk::SeatCapabilities) : GLib::List
      # gdk_seat_get_devices: (Method)
      # Returns: (transfer container)

      # C call
      _retval = LibGdk.gdk_seat_get_devices(@pointer, capabilities)

      # Return value handling

      GLib::List(Gdk::Device).new(_retval, GICrystal::Transfer::Container)
    end

    # Returns the `GdkDisplay` this seat belongs to.
    def display : Gdk::Display
      # gdk_seat_get_display: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_seat_get_display(@pointer)

      # Return value handling

      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    # Returns the device that routes keyboard events.
    def keyboard : Gdk::Device?
      # gdk_seat_get_keyboard: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_seat_get_keyboard(@pointer)

      # Return value handling

      Gdk::Device.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the device that routes pointer events.
    def pointer : Gdk::Device?
      # gdk_seat_get_pointer: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_seat_get_pointer(@pointer)

      # Return value handling

      Gdk::Device.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns all `GdkDeviceTools` that are known to the application.
    def tools : GLib::List
      # gdk_seat_get_tools: (Method)
      # Returns: (transfer container)

      # C call
      _retval = LibGdk.gdk_seat_get_tools(@pointer)

      # Return value handling

      GLib::List(Gdk::DeviceTool).new(_retval, GICrystal::Transfer::Container)
    end

    # Emitted when a new input device is related to this seat.
    struct DeviceAddedSignal < GObject::Signal
      def name : String
        @detail ? "device-added::#{@detail}" : "device-added"
      end

      def connect(*, after : Bool = false, &block : Proc(Gdk::Device, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gdk::Device, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_device : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          device = Gdk::Device.new(lib_device, :none)
          ::Box(Proc(Gdk::Device, Nil)).unbox(_lib_box).call(device)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gdk::Seat, Gdk::Device, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_device : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::Seat.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          device = Gdk::Device.new(lib_device, :none)
          ::Box(Proc(Gdk::Seat, Gdk::Device, Nil)).unbox(_lib_box).call(_sender, device)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(device : Gdk::Device) : Nil
        LibGObject.g_signal_emit_by_name(@source, "device-added", device)
      end
    end

    def device_added_signal
      DeviceAddedSignal.new(self)
    end

    # Emitted when an input device is removed (e.g. unplugged).
    struct DeviceRemovedSignal < GObject::Signal
      def name : String
        @detail ? "device-removed::#{@detail}" : "device-removed"
      end

      def connect(*, after : Bool = false, &block : Proc(Gdk::Device, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gdk::Device, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_device : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          device = Gdk::Device.new(lib_device, :none)
          ::Box(Proc(Gdk::Device, Nil)).unbox(_lib_box).call(device)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gdk::Seat, Gdk::Device, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_device : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::Seat.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          device = Gdk::Device.new(lib_device, :none)
          ::Box(Proc(Gdk::Seat, Gdk::Device, Nil)).unbox(_lib_box).call(_sender, device)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(device : Gdk::Device) : Nil
        LibGObject.g_signal_emit_by_name(@source, "device-removed", device)
      end
    end

    def device_removed_signal
      DeviceRemovedSignal.new(self)
    end

    # Emitted whenever a new tool is made known to the seat.
    #
    # The tool may later be assigned to a device (i.e. on
    # proximity with a tablet). The device will emit the
    # [signal@Gdk.Device::tool-changed] signal accordingly.
    #
    # A same tool may be used by several devices.
    struct ToolAddedSignal < GObject::Signal
      def name : String
        @detail ? "tool-added::#{@detail}" : "tool-added"
      end

      def connect(*, after : Bool = false, &block : Proc(Gdk::DeviceTool, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gdk::DeviceTool, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tool : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          tool = Gdk::DeviceTool.new(lib_tool, :none)
          ::Box(Proc(Gdk::DeviceTool, Nil)).unbox(_lib_box).call(tool)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gdk::Seat, Gdk::DeviceTool, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tool : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::Seat.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          tool = Gdk::DeviceTool.new(lib_tool, :none)
          ::Box(Proc(Gdk::Seat, Gdk::DeviceTool, Nil)).unbox(_lib_box).call(_sender, tool)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(tool : Gdk::DeviceTool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "tool-added", tool)
      end
    end

    def tool_added_signal
      ToolAddedSignal.new(self)
    end

    # Emitted whenever a tool is no longer known to this @seat.
    struct ToolRemovedSignal < GObject::Signal
      def name : String
        @detail ? "tool-removed::#{@detail}" : "tool-removed"
      end

      def connect(*, after : Bool = false, &block : Proc(Gdk::DeviceTool, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gdk::DeviceTool, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tool : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          tool = Gdk::DeviceTool.new(lib_tool, :none)
          ::Box(Proc(Gdk::DeviceTool, Nil)).unbox(_lib_box).call(tool)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gdk::Seat, Gdk::DeviceTool, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tool : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::Seat.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          tool = Gdk::DeviceTool.new(lib_tool, :none)
          ::Box(Proc(Gdk::Seat, Gdk::DeviceTool, Nil)).unbox(_lib_box).call(_sender, tool)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(tool : Gdk::DeviceTool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "tool-removed", tool)
      end
    end

    def tool_removed_signal
      ToolRemovedSignal.new(self)
    end
  end
end
