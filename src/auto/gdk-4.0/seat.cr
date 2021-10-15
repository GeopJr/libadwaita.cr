require "../g_object-2.0/object"

module Gdk
  # The `GdkSeat` object represents a collection of input devices
  # that belong to a user.
  class Seat < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, display : Gdk::Display? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if display
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Seat.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_seat_get_type
    end

    def display=(value : Display?) : Display?
      unsafe_value = value

      LibGObject.g_object_set(self, "display", unsafe_value, Pointer(Void).null)
      value
    end

    def capabilities : Gdk::SeatCapabilities
      # gdk_seat_get_capabilities: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_seat_get_capabilities(self)
      Gdk::SeatCapabilities.from_value(_retval)
    end

    def devices(capabilities : Gdk::SeatCapabilities) : GLib::List
      # gdk_seat_get_devices: (Method)
      # Returns: (transfer container)

      _retval = LibGdk.gdk_seat_get_devices(self, capabilities)
      GLib::List(Gdk::Device).new(_retval, GICrystal::Transfer::Container)
    end

    def display : Gdk::Display
      # gdk_seat_get_display: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_seat_get_display(self)
      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    def keyboard : Gdk::Device?
      # gdk_seat_get_keyboard: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_seat_get_keyboard(self)
      Gdk::Device.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def pointer : Gdk::Device?
      # gdk_seat_get_pointer: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_seat_get_pointer(self)
      Gdk::Device.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def tools : GLib::List
      # gdk_seat_get_tools: (Method)
      # Returns: (transfer container)

      _retval = LibGdk.gdk_seat_get_tools(self)
      GLib::List(Gdk::DeviceTool).new(_retval, GICrystal::Transfer::Container)
    end

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
