require "../g_object-2.0/object"

module Gdk
  # A `GdkSurface` is a rectangular region on the screen.
  #
  # It’s a low-level object, used to implement high-level objects
  # such as [class@Gtk.Window] or [class@Gtk.Dialog] in GTK.
  #
  # The surfaces you see in practice are either [iface@Gdk.Toplevel] or
  # [iface@Gdk.Popup], and those interfaces provide much of the required
  # API to interact with these surfaces. Other, more specialized surface
  # types exist, but you will rarely interact with them directly.
  class Surface < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, cursor : Gdk::Cursor? = nil, display : Gdk::Display? = nil, frame_clock : Gdk::FrameClock? = nil, height : Int32? = nil, mapped : Bool? = nil, scale_factor : Int32? = nil, width : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[7]
      _values = StaticArray(LibGObject::Value, 7).new(LibGObject::Value.new)
      _n = 0

      if cursor
        (_names.to_unsafe + _n).value = "cursor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor)
        _n += 1
      end
      if display
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if frame_clock
        (_names.to_unsafe + _n).value = "frame-clock".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, frame_clock)
        _n += 1
      end
      if height
        (_names.to_unsafe + _n).value = "height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height)
        _n += 1
      end
      if mapped
        (_names.to_unsafe + _n).value = "mapped".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mapped)
        _n += 1
      end
      if scale_factor
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if width
        (_names.to_unsafe + _n).value = "width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Surface.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_surface_get_type
    end

    def cursor=(value : Gdk::Cursor?) : Gdk::Cursor?
      unsafe_value = value

      LibGObject.g_object_set(self, "cursor", unsafe_value, Pointer(Void).null)
      value
    end

    def cursor : Gdk::Cursor?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "cursor", pointerof(value), Pointer(Void).null)
      Gdk::Cursor.new(value, GICrystal::Transfer::None) unless value.null?
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

    def frame_clock=(value : Gdk::FrameClock?) : Gdk::FrameClock?
      unsafe_value = value

      LibGObject.g_object_set(self, "frame-clock", unsafe_value, Pointer(Void).null)
      value
    end

    def frame_clock : Gdk::FrameClock?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "frame-clock", pointerof(value), Pointer(Void).null)
      Gdk::FrameClock.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def height : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "height", pointerof(value), Pointer(Void).null)
      value
    end

    def mapped? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "mapped", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def scale_factor : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "scale-factor", pointerof(value), Pointer(Void).null)
      value
    end

    def width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "width", pointerof(value), Pointer(Void).null)
      value
    end

    def self.new_popup(parent : Gdk::Surface, autohide : Bool) : self
      # gdk_surface_new_popup: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_surface_new_popup(parent, autohide)

      # Return value handling
      Gdk::Surface.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_toplevel(display : Gdk::Display) : self
      # gdk_surface_new_toplevel: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_surface_new_toplevel(display)

      # Return value handling
      Gdk::Surface.new(_retval, GICrystal::Transfer::Full)
    end

    def beep : Nil
      # gdk_surface_beep: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_surface_beep(self)

      # Return value handling
    end

    def create_cairo_context : Gdk::CairoContext
      # gdk_surface_create_cairo_context: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_surface_create_cairo_context(self)

      # Return value handling
      Gdk::CairoContext.new(_retval, GICrystal::Transfer::Full)
    end

    def create_gl_context : Gdk::GLContext
      # gdk_surface_create_gl_context: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_surface_create_gl_context(self, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?
      # Return value handling
      Gdk::GLContext.new(_retval, GICrystal::Transfer::Full)
    end

    def create_similar_surface(content : Cairo::Content, width : Int32, height : Int32) : Cairo::Surface
      # gdk_surface_create_similar_surface: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_surface_create_similar_surface(self, content, width, height)

      # Return value handling
      Cairo::Surface.new(_retval, GICrystal::Transfer::Full)
    end

    def create_vulkan_context : Gdk::VulkanContext
      # gdk_surface_create_vulkan_context: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_surface_create_vulkan_context(self, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?
      # Return value handling
      Gdk::VulkanContext.new(_retval, GICrystal::Transfer::Full)
    end

    def destroy : Nil
      # gdk_surface_destroy: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_surface_destroy(self)

      # Return value handling
    end

    def cursor : Gdk::Cursor?
      # gdk_surface_get_cursor: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_surface_get_cursor(self)

      # Return value handling
      Gdk::Cursor.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def device_cursor(device : Gdk::Device) : Gdk::Cursor?
      # gdk_surface_get_device_cursor: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_surface_get_device_cursor(self, device)

      # Return value handling
      Gdk::Cursor.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def device_position(device : Gdk::Device) : Bool
      # gdk_surface_get_device_position: (Method)
      # @x: (out) (transfer full) (optional)
      # @y: (out) (transfer full) (optional)
      # @mask: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      x = Pointer(Float64).null
      y = Pointer(Float64).null
      mask = Pointer(UInt32).null

      # C call
      _retval = LibGdk.gdk_surface_get_device_position(self, device, x, y, mask)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def display : Gdk::Display
      # gdk_surface_get_display: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_surface_get_display(self)

      # Return value handling
      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    def frame_clock : Gdk::FrameClock
      # gdk_surface_get_frame_clock: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_surface_get_frame_clock(self)

      # Return value handling
      Gdk::FrameClock.new(_retval, GICrystal::Transfer::None)
    end

    def height : Int32
      # gdk_surface_get_height: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_surface_get_height(self)

      # Return value handling
      _retval
    end

    def mapped : Bool
      # gdk_surface_get_mapped: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_surface_get_mapped(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def scale_factor : Int32
      # gdk_surface_get_scale_factor: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_surface_get_scale_factor(self)

      # Return value handling
      _retval
    end

    def width : Int32
      # gdk_surface_get_width: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_surface_get_width(self)

      # Return value handling
      _retval
    end

    def hide : Nil
      # gdk_surface_hide: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_surface_hide(self)

      # Return value handling
    end

    def is_destroyed : Bool
      # gdk_surface_is_destroyed: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_surface_is_destroyed(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def queue_render : Nil
      # gdk_surface_queue_render: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_surface_queue_render(self)

      # Return value handling
    end

    def request_layout : Nil
      # gdk_surface_request_layout: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_surface_request_layout(self)

      # Return value handling
    end

    def cursor=(cursor : Gdk::Cursor?) : Nil
      # gdk_surface_set_cursor: (Method | Setter)
      # @cursor: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      cursor = if cursor.nil?
                 Pointer(Void).null
               else
                 cursor.to_unsafe
               end

      # C call
      LibGdk.gdk_surface_set_cursor(self, cursor)

      # Return value handling
    end

    def set_device_cursor(device : Gdk::Device, cursor : Gdk::Cursor) : Nil
      # gdk_surface_set_device_cursor: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_surface_set_device_cursor(self, device, cursor)

      # Return value handling
    end

    def input_region=(region : Cairo::Region) : Nil
      # gdk_surface_set_input_region: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGdk.gdk_surface_set_input_region(self, region)

      # Return value handling
    end

    def opaque_region=(region : Cairo::Region?) : Nil
      # gdk_surface_set_opaque_region: (Method)
      # @region: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      region = if region.nil?
                 Pointer(Void).null
               else
                 region.to_unsafe
               end

      # C call
      LibGdk.gdk_surface_set_opaque_region(self, region)

      # Return value handling
    end

    def translate_coordinates(to : Gdk::Surface, x : Float64, y : Float64) : Bool
      # gdk_surface_translate_coordinates: (Method)
      # @x: (inout) (transfer full)
      # @y: (inout) (transfer full)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_surface_translate_coordinates(self, to, x, y)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    struct EnterMonitorSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "enter-monitor::#{@detail}" : "enter-monitor"
      end

      def connect(&block : Proc(Gdk::Monitor, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Monitor, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::Monitor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Monitor.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Monitor, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Monitor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Monitor.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Monitor, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Surface, Gdk::Monitor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Surface.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Monitor.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Surface, Gdk::Monitor, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Surface, Gdk::Monitor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Surface.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Monitor.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Surface, Gdk::Monitor, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(monitor : Gdk::Monitor) : Nil
        LibGObject.g_signal_emit_by_name(@source, "enter-monitor", monitor)
      end
    end

    def enter_monitor_signal
      EnterMonitorSignal.new(self)
    end

    struct EventSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "event::#{@detail}" : "event"
      end

      def connect(&block : Proc(Gdk::Event, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Event, Bool))
        connect(block)
      end

      def connect(block : Proc(Gdk::Event, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Event.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Event, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Event, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Event.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Event, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Surface, Gdk::Event, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Surface.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Event.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Surface, Gdk::Event, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Surface, Gdk::Event, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Surface.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Event.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Surface, Gdk::Event, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(event : Gdk::Event) : Nil
        LibGObject.g_signal_emit_by_name(@source, "event", event)
      end
    end

    def event_signal
      EventSignal.new(self)
    end

    struct LayoutSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "layout::#{@detail}" : "layout"
      end

      def connect(&block : Proc(Int32, Int32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Int32, Int32, Nil))
        connect(block)
      end

      def connect(block : Proc(Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Int32, Int32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Int32, Int32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Surface, Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Gdk::Surface.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gdk::Surface, Int32, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Surface, Int32, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Gdk::Surface.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Gdk::Surface, Int32, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(width : Int32, height : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "layout", width, height)
      end
    end

    def layout_signal
      LayoutSignal.new(self)
    end

    struct LeaveMonitorSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "leave-monitor::#{@detail}" : "leave-monitor"
      end

      def connect(&block : Proc(Gdk::Monitor, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Monitor, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::Monitor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Monitor.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Monitor, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Monitor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Monitor.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Monitor, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Surface, Gdk::Monitor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Surface.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Monitor.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Surface, Gdk::Monitor, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Surface, Gdk::Monitor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Surface.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Monitor.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Surface, Gdk::Monitor, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(monitor : Gdk::Monitor) : Nil
        LibGObject.g_signal_emit_by_name(@source, "leave-monitor", monitor)
      end
    end

    def leave_monitor_signal
      LeaveMonitorSignal.new(self)
    end

    struct RenderSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "render::#{@detail}" : "render"
      end

      def connect(&block : Proc(Cairo::Region, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Cairo::Region, Bool))
        connect(block)
      end

      def connect(block : Proc(Cairo::Region, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Cairo::Region.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Cairo::Region, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Cairo::Region, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Cairo::Region.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Cairo::Region, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Surface, Cairo::Region, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Surface.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Cairo::Region.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Surface, Cairo::Region, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Surface, Cairo::Region, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Surface.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Cairo::Region.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Surface, Cairo::Region, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(region : Cairo::Region) : Nil
        LibGObject.g_signal_emit_by_name(@source, "render", region)
      end
    end

    def render_signal
      RenderSignal.new(self)
    end
  end
end
