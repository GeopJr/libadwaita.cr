require "../g_object-2.0/object"

module Gdk
  # `GdkDisplay` objects are the GDK representation of a workstation.
  #
  # Their purpose are two-fold:
  #
  # - To manage and provide information about input devices (pointers, keyboards, etc)
  # - To manage and provide information about output devices (monitors, projectors, etc)
  #
  # Most of the input device handling has been factored out into separate
  # [class@Gdk.Seat] objects. Every display has a one or more seats, which
  # can be accessed with [method@Gdk.Display.get_default_seat] and
  # [method@Gdk.Display.list_seats].
  #
  # Output devices are represented by [class@Gdk.Monitor] objects, which can
  # be accessed with [method@Gdk.Display.get_monitor_at_surface] and similar APIs.
  class Display < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, composited : Bool? = nil, input_shapes : Bool? = nil, rgba : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if composited
        (_names.to_unsafe + _n).value = "composited".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, composited)
        _n += 1
      end
      if input_shapes
        (_names.to_unsafe + _n).value = "input-shapes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_shapes)
        _n += 1
      end
      if rgba
        (_names.to_unsafe + _n).value = "rgba".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, rgba)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Display.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_display_get_type
    end

    def composited? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "composited", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def input_shapes? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "input-shapes", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def rgba? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "rgba", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def self.default : Gdk::Display?
      # gdk_display_get_default: (None)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_display_get_default
      Gdk::Display.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def self.open(display_name : ::String) : Gdk::Display?
      # gdk_display_open: (None)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_display_open(display_name)
      Gdk::Display.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def beep : Nil
      # gdk_display_beep: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_display_beep(self)
    end

    def close : Nil
      # gdk_display_close: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_display_close(self)
    end

    def device_is_grabbed(device : Gdk::Device) : Bool
      # gdk_display_device_is_grabbed: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_display_device_is_grabbed(self, device)
      GICrystal.to_bool(_retval)
    end

    def flush : Nil
      # gdk_display_flush: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_display_flush(self)
    end

    def app_launch_context : Gdk::AppLaunchContext
      # gdk_display_get_app_launch_context: (Method)
      # Returns: (transfer full)

      _retval = LibGdk.gdk_display_get_app_launch_context(self)
      Gdk::AppLaunchContext.new(_retval, GICrystal::Transfer::Full)
    end

    def clipboard : Gdk::Clipboard
      # gdk_display_get_clipboard: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_display_get_clipboard(self)
      Gdk::Clipboard.new(_retval, GICrystal::Transfer::None)
    end

    def default_seat : Gdk::Seat?
      # gdk_display_get_default_seat: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_display_get_default_seat(self)
      Gdk::Seat.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def monitor_at_surface(surface : Gdk::Surface) : Gdk::Monitor
      # gdk_display_get_monitor_at_surface: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_display_get_monitor_at_surface(self, surface)
      Gdk::Monitor.new(_retval, GICrystal::Transfer::None)
    end

    def monitors : Gio::ListModel
      # gdk_display_get_monitors: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_display_get_monitors(self)
      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def name : ::String
      # gdk_display_get_name: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_display_get_name(self)
      ::String.new(_retval)
    end

    def primary_clipboard : Gdk::Clipboard
      # gdk_display_get_primary_clipboard: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_display_get_primary_clipboard(self)
      Gdk::Clipboard.new(_retval, GICrystal::Transfer::None)
    end

    def setting(name : ::String, value : _) : Bool
      # gdk_display_get_setting: (Method)
      # Returns: (transfer none)

      value = GObject::Value.new(value) unless value.is_a?(GObject::Value)

      _retval = LibGdk.gdk_display_get_setting(self, name, value)
      GICrystal.to_bool(_retval)
    end

    def startup_notification_id : ::String?
      # gdk_display_get_startup_notification_id: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_display_get_startup_notification_id(self)
      ::String.new(_retval) unless _retval.null?
    end

    def is_closed : Bool
      # gdk_display_is_closed: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_display_is_closed(self)
      GICrystal.to_bool(_retval)
    end

    def is_composited : Bool
      # gdk_display_is_composited: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_display_is_composited(self)
      GICrystal.to_bool(_retval)
    end

    def is_rgba : Bool
      # gdk_display_is_rgba: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_display_is_rgba(self)
      GICrystal.to_bool(_retval)
    end

    def list_seats : GLib::List
      # gdk_display_list_seats: (Method)
      # Returns: (transfer container)

      _retval = LibGdk.gdk_display_list_seats(self)
      GLib::List(Gdk::Seat).new(_retval, GICrystal::Transfer::Container)
    end

    def map_keycode(keycode : UInt32, keys : Enumerable(Gdk::KeymapKey), keyvals : Enumerable(UInt32)) : Bool
      # gdk_display_map_keycode: (Method)
      # @keys: (out) (transfer full) (optional) (array length=n_entries element-type Interface)
      # @keyvals: (out) (transfer full) (optional) (array length=n_entries element-type UInt32)
      # @n_entries: (out) (transfer full)
      # Returns: (transfer none)

      n_entries = keys.size
      n_entries = keyvals.size
      keys = Pointer(Pointer(Void)).null
      keyvals = Pointer(Pointer(UInt32)).null
      keys = keys.to_a.map(&.to_unsafe).to_unsafe

      keyvals = keyvals.to_a.to_unsafe

      _retval = LibGdk.gdk_display_map_keycode(self, keycode, keys, keyvals, n_entries)
      GICrystal.to_bool(_retval)
    end

    def map_keyval(keyval : UInt32, keys : Enumerable(Gdk::KeymapKey)) : Bool
      # gdk_display_map_keyval: (Method)
      # @keys: (out) (transfer full) (array length=n_keys element-type Interface)
      # @n_keys: (out) (transfer full)
      # Returns: (transfer none)

      n_keys = keys.size
      keys = keys.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGdk.gdk_display_map_keyval(self, keyval, keys, n_keys)
      GICrystal.to_bool(_retval)
    end

    def notify_startup_complete(startup_id : ::String) : Nil
      # gdk_display_notify_startup_complete: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_display_notify_startup_complete(self, startup_id)
    end

    def prepare_gl : Bool
      # gdk_display_prepare_gl: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_display_prepare_gl(self)
      GICrystal.to_bool(_retval)
    end

    def put_event(event : Gdk::Event) : Nil
      # gdk_display_put_event: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_display_put_event(self, event)
    end

    def supports_input_shapes : Bool
      # gdk_display_supports_input_shapes: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_display_supports_input_shapes(self)
      GICrystal.to_bool(_retval)
    end

    def sync : Nil
      # gdk_display_sync: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_display_sync(self)
    end

    def translate_key(keycode : UInt32, state : Gdk::ModifierType, group : Int32) : Bool
      # gdk_display_translate_key: (Method)
      # @keyval: (out) (transfer full) (optional)
      # @effective_group: (out) (transfer full) (optional)
      # @level: (out) (transfer full) (optional)
      # @consumed: (out) (transfer full) (optional)
      # Returns: (transfer none)

      keyval = Pointer(UInt32).null
      effective_group = Pointer(Int32).null
      level = Pointer(Int32).null
      consumed = Pointer(UInt32).null

      _retval = LibGdk.gdk_display_translate_key(self, keycode, state, group, keyval, effective_group, level, consumed)
      GICrystal.to_bool(_retval)
    end

    struct ClosedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "closed::#{@detail}" : "closed"
      end

      def connect(&block : Proc(Bool, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Bool, Nil))
        connect(block)
      end

      def connect(block : Proc(Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Bool, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Bool, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Display, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          sender = Gdk::Display.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Gdk::Display, Bool, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Display, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          sender = Gdk::Display.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Gdk::Display, Bool, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(is_error : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "closed", is_error)
      end
    end

    def closed_signal
      ClosedSignal.new(self)
    end

    struct OpenedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "opened::#{@detail}" : "opened"
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

      def connect(block : Proc(Gdk::Display, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Display.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Display, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Display, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Display.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Display, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "opened")
      end
    end

    def opened_signal
      OpenedSignal.new(self)
    end

    struct SeatAddedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "seat-added::#{@detail}" : "seat-added"
      end

      def connect(&block : Proc(Gdk::Seat, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Seat, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::Seat, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Seat.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Seat, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Seat, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Seat.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Seat, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Display, Gdk::Seat, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Display.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Seat.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Display, Gdk::Seat, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Display, Gdk::Seat, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Display.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Seat.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Display, Gdk::Seat, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(seat : Gdk::Seat) : Nil
        LibGObject.g_signal_emit_by_name(@source, "seat-added", seat)
      end
    end

    def seat_added_signal
      SeatAddedSignal.new(self)
    end

    struct SeatRemovedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "seat-removed::#{@detail}" : "seat-removed"
      end

      def connect(&block : Proc(Gdk::Seat, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Seat, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::Seat, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Seat.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Seat, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Seat, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Seat.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Seat, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Display, Gdk::Seat, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Display.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Seat.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Display, Gdk::Seat, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Display, Gdk::Seat, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Display.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Seat.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Display, Gdk::Seat, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(seat : Gdk::Seat) : Nil
        LibGObject.g_signal_emit_by_name(@source, "seat-removed", seat)
      end
    end

    def seat_removed_signal
      SeatRemovedSignal.new(self)
    end

    struct SettingChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "setting-changed::#{@detail}" : "setting-changed"
      end

      def connect(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect(block : Proc(::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Display, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gdk::Display.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gdk::Display, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Display, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gdk::Display.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gdk::Display, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(setting : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "setting-changed", setting)
      end
    end

    def setting_changed_signal
      SettingChangedSignal.new(self)
    end
  end
end
