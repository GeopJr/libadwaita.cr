require "../g_object-2.0/object"

module Gdk
  # The `GdkSeat` object represents a collection of input devices
  # that belong to a user.
  @[GObject::GeneratedWrapper]
  class Seat < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::Seat), instance_init, 0)
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
      _retval = LibGdk.gdk_seat_get_capabilities(self)

      # Return value handling

      Gdk::SeatCapabilities.new(_retval)
    end

    # Returns the devices that match the given capabilities.
    def devices(capabilities : Gdk::SeatCapabilities) : GLib::List
      # gdk_seat_get_devices: (Method)
      # Returns: (transfer container)

      # C call
      _retval = LibGdk.gdk_seat_get_devices(self, capabilities)

      # Return value handling

      GLib::List(Gdk::Device).new(_retval, GICrystal::Transfer::Container)
    end

    # Returns the `GdkDisplay` this seat belongs to.
    def display : Gdk::Display
      # gdk_seat_get_display: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_seat_get_display(self)

      # Return value handling

      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    # Returns the device that routes keyboard events.
    def keyboard : Gdk::Device?
      # gdk_seat_get_keyboard: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_seat_get_keyboard(self)

      # Return value handling

      Gdk::Device.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the device that routes pointer events.
    def pointer : Gdk::Device?
      # gdk_seat_get_pointer: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_seat_get_pointer(self)

      # Return value handling

      Gdk::Device.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns all `GdkDeviceTools` that are known to the application.
    def tools : GLib::List
      # gdk_seat_get_tools: (Method)
      # Returns: (transfer container)

      # C call
      _retval = LibGdk.gdk_seat_get_tools(self)

      # Return value handling

      GLib::List(Gdk::DeviceTool).new(_retval, GICrystal::Transfer::Container)
    end

    # Emitted when a new input device is related to this seat.
    struct DeviceAddedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "device-added::#{@detail}" : "device-added"
      end

      def connect(&block : Proc(Gdk::Device, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Device, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::Device, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Device.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Device, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Device, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Device.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Device, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Seat, Gdk::Device, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Seat.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Device.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Seat, Gdk::Device, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Seat, Gdk::Device, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Seat.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Device.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Seat, Gdk::Device, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(device : Gdk::Device) : Nil
        LibGObject.g_signal_emit_by_name(@source, "device-added", device)
      end
    end

    def device_added_signal
      DeviceAddedSignal.new(self)
    end

    # Emitted when an input device is removed (e.g. unplugged).
    struct DeviceRemovedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "device-removed::#{@detail}" : "device-removed"
      end

      def connect(&block : Proc(Gdk::Device, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Device, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::Device, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Device.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Device, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Device, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Device.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Device, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Seat, Gdk::Device, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Seat.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Device.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Seat, Gdk::Device, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Seat, Gdk::Device, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Seat.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Device.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Seat, Gdk::Device, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
    struct ToolAddedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "tool-added::#{@detail}" : "tool-added"
      end

      def connect(&block : Proc(Gdk::DeviceTool, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::DeviceTool, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::DeviceTool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::DeviceTool.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::DeviceTool, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::DeviceTool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::DeviceTool.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::DeviceTool, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Seat, Gdk::DeviceTool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Seat.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::DeviceTool.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Seat, Gdk::DeviceTool, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Seat, Gdk::DeviceTool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Seat.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::DeviceTool.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Seat, Gdk::DeviceTool, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(tool : Gdk::DeviceTool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "tool-added", tool)
      end
    end

    def tool_added_signal
      ToolAddedSignal.new(self)
    end

    # Emitted whenever a tool is no longer known to this @seat.
    struct ToolRemovedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "tool-removed::#{@detail}" : "tool-removed"
      end

      def connect(&block : Proc(Gdk::DeviceTool, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::DeviceTool, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::DeviceTool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::DeviceTool.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::DeviceTool, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::DeviceTool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::DeviceTool.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::DeviceTool, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Seat, Gdk::DeviceTool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Seat.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::DeviceTool.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Seat, Gdk::DeviceTool, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Seat, Gdk::DeviceTool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Seat.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::DeviceTool.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Seat, Gdk::DeviceTool, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
