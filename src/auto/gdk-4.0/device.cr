require "../g_object-2.0/object"

module Gdk
  # The `GdkDevice` object represents an input device, such
  # as a keyboard, a mouse, or a touchpad.
  #
  # See the [class@Gdk.Seat] documentation for more information
  # about the various kinds of devices, and their relationships.
  class Device < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, caps_lock_state : Bool? = nil, direction : Pango::Direction? = nil, display : Gdk::Display? = nil, has_bidi_layouts : Bool? = nil, has_cursor : Bool? = nil, modifier_state : Gdk::ModifierType? = nil, n_axes : UInt32? = nil, name : ::String? = nil, num_lock_state : Bool? = nil, num_touches : UInt32? = nil, product_id : ::String? = nil, scroll_lock_state : Bool? = nil, seat : Gdk::Seat? = nil, source : Gdk::InputSource? = nil, tool : Gdk::DeviceTool? = nil, vendor_id : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[16]
      _values = StaticArray(LibGObject::Value, 16).new(LibGObject::Value.new)
      _n = 0

      if caps_lock_state
        (_names.to_unsafe + _n).value = "caps-lock-state".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, caps_lock_state)
        _n += 1
      end
      if direction
        (_names.to_unsafe + _n).value = "direction".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, direction)
        _n += 1
      end
      if display
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if has_bidi_layouts
        (_names.to_unsafe + _n).value = "has-bidi-layouts".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_bidi_layouts)
        _n += 1
      end
      if has_cursor
        (_names.to_unsafe + _n).value = "has-cursor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_cursor)
        _n += 1
      end
      if modifier_state
        (_names.to_unsafe + _n).value = "modifier-state".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, modifier_state)
        _n += 1
      end
      if n_axes
        (_names.to_unsafe + _n).value = "n-axes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, n_axes)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if num_lock_state
        (_names.to_unsafe + _n).value = "num-lock-state".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, num_lock_state)
        _n += 1
      end
      if num_touches
        (_names.to_unsafe + _n).value = "num-touches".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, num_touches)
        _n += 1
      end
      if product_id
        (_names.to_unsafe + _n).value = "product-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, product_id)
        _n += 1
      end
      if scroll_lock_state
        (_names.to_unsafe + _n).value = "scroll-lock-state".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scroll_lock_state)
        _n += 1
      end
      if seat
        (_names.to_unsafe + _n).value = "seat".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, seat)
        _n += 1
      end
      if source
        (_names.to_unsafe + _n).value = "source".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, source)
        _n += 1
      end
      if tool
        (_names.to_unsafe + _n).value = "tool".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tool)
        _n += 1
      end
      if vendor_id
        (_names.to_unsafe + _n).value = "vendor-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vendor_id)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Device.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_device_get_type
    end

    def display=(value : Display?) : Display?
      unsafe_value = value

      LibGObject.g_object_set(self, "display", unsafe_value, Pointer(Void).null)
      value
    end

    def has_cursor=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "has-cursor", unsafe_value, Pointer(Void).null)
      value
    end

    def name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "name", unsafe_value, Pointer(Void).null)
      value
    end

    def num_touches=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "num-touches", unsafe_value, Pointer(Void).null)
      value
    end

    def product_id=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "product-id", unsafe_value, Pointer(Void).null)
      value
    end

    def source=(value : InputSource) : InputSource
      unsafe_value = value

      LibGObject.g_object_set(self, "source", unsafe_value, Pointer(Void).null)
      value
    end

    def vendor_id=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "vendor-id", unsafe_value, Pointer(Void).null)
      value
    end

    def caps_lock_state? : Bool
      # gdk_device_get_caps_lock_state: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_device_get_caps_lock_state(self)
      GICrystal.to_bool(_retval)
    end

    def device_tool : Gdk::DeviceTool
      # gdk_device_get_device_tool: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_device_get_device_tool(self)
      Gdk::DeviceTool.new(_retval, GICrystal::Transfer::None)
    end

    def direction : Pango::Direction
      # gdk_device_get_direction: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_device_get_direction(self)
      Pango::Direction.from_value(_retval)
    end

    def display : Gdk::Display
      # gdk_device_get_display: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_device_get_display(self)
      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    def has_cursor? : Bool
      # gdk_device_get_has_cursor: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_device_get_has_cursor(self)
      GICrystal.to_bool(_retval)
    end

    def modifier_state : Gdk::ModifierType
      # gdk_device_get_modifier_state: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_device_get_modifier_state(self)
      Gdk::ModifierType.from_value(_retval)
    end

    def name : ::String
      # gdk_device_get_name: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_device_get_name(self)
      ::String.new(_retval)
    end

    def num_lock_state? : Bool
      # gdk_device_get_num_lock_state: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_device_get_num_lock_state(self)
      GICrystal.to_bool(_retval)
    end

    def num_touches : UInt32
      # gdk_device_get_num_touches: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_device_get_num_touches(self)
      _retval
    end

    def product_id : ::String?
      # gdk_device_get_product_id: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_device_get_product_id(self)
      ::String.new(_retval) unless _retval.null?
    end

    def scroll_lock_state? : Bool
      # gdk_device_get_scroll_lock_state: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_device_get_scroll_lock_state(self)
      GICrystal.to_bool(_retval)
    end

    def seat : Gdk::Seat
      # gdk_device_get_seat: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_device_get_seat(self)
      Gdk::Seat.new(_retval, GICrystal::Transfer::None)
    end

    def source : Gdk::InputSource
      # gdk_device_get_source: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_device_get_source(self)
      Gdk::InputSource.from_value(_retval)
    end

    def surface_at_position : Gdk::Surface?
      # gdk_device_get_surface_at_position: (Method)
      # @win_x: (out) (transfer full) (optional)
      # @win_y: (out) (transfer full) (optional)
      # Returns: (transfer none)

      win_x = Pointer(Float64).null
      win_y = Pointer(Float64).null

      _retval = LibGdk.gdk_device_get_surface_at_position(self, win_x, win_y)
      Gdk::Surface.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def timestamp : UInt32
      # gdk_device_get_timestamp: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_device_get_timestamp(self)
      _retval
    end

    def vendor_id : ::String?
      # gdk_device_get_vendor_id: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_device_get_vendor_id(self)
      ::String.new(_retval) unless _retval.null?
    end

    def has_bidi_layouts : Bool
      # gdk_device_has_bidi_layouts: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_device_has_bidi_layouts(self)
      GICrystal.to_bool(_retval)
    end

    struct ChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "changed::#{@detail}" : "changed"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Device, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Device.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Device, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Device, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Device.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Device, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed")
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end

    struct ToolChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "tool-changed::#{@detail}" : "tool-changed"
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

      def connect(block : Proc(Gdk::Device, Gdk::DeviceTool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Device.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::DeviceTool.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Device, Gdk::DeviceTool, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Device, Gdk::DeviceTool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Device.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::DeviceTool.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Device, Gdk::DeviceTool, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(tool : Gdk::DeviceTool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "tool-changed", tool)
      end
    end

    def tool_changed_signal
      ToolChangedSignal.new(self)
    end
  end
end
