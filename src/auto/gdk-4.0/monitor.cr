require "../g_object-2.0/object"

module Gdk
  # `GdkMonitor` objects represent the individual outputs that are
  # associated with a `GdkDisplay`.
  #
  # `GdkDisplay` keeps a `GListModel` to enumerate and monitor
  # monitors with [method@Gdk.Display.get_monitors]. You can use
  # [method@Gdk.Display.get_monitor_at_surface] to find a particular
  # monitor.
  class Monitor < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, connector : ::String? = nil, display : Gdk::Display? = nil, geometry : Gdk::Rectangle? = nil, height_mm : Int32? = nil, manufacturer : ::String? = nil, model : ::String? = nil, refresh_rate : Int32? = nil, scale_factor : Int32? = nil, subpixel_layout : Gdk::SubpixelLayout? = nil, valid : Bool? = nil, width_mm : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[11]
      _values = StaticArray(LibGObject::Value, 11).new(LibGObject::Value.new)
      _n = 0

      if connector
        (_names.to_unsafe + _n).value = "connector".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, connector)
        _n += 1
      end
      if display
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if geometry
        (_names.to_unsafe + _n).value = "geometry".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, geometry)
        _n += 1
      end
      if height_mm
        (_names.to_unsafe + _n).value = "height-mm".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height_mm)
        _n += 1
      end
      if manufacturer
        (_names.to_unsafe + _n).value = "manufacturer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, manufacturer)
        _n += 1
      end
      if model
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end
      if refresh_rate
        (_names.to_unsafe + _n).value = "refresh-rate".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, refresh_rate)
        _n += 1
      end
      if scale_factor
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if subpixel_layout
        (_names.to_unsafe + _n).value = "subpixel-layout".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, subpixel_layout)
        _n += 1
      end
      if valid
        (_names.to_unsafe + _n).value = "valid".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, valid)
        _n += 1
      end
      if width_mm
        (_names.to_unsafe + _n).value = "width-mm".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_mm)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Monitor.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_monitor_get_type
    end

    def display=(value : Display?) : Display?
      unsafe_value = value

      LibGObject.g_object_set(self, "display", unsafe_value, Pointer(Void).null)
      value
    end

    def connector : ::String?
      # gdk_monitor_get_connector: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_monitor_get_connector(self)
      ::String.new(_retval) unless _retval.null?
    end

    def display : Gdk::Display
      # gdk_monitor_get_display: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_monitor_get_display(self)
      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    def geometry : Gdk::Rectangle
      # gdk_monitor_get_geometry: (Method)
      # @geometry: (out) (caller-allocates)
      # Returns: (transfer none)

      geometry = Gdk::Rectangle.new

      LibGdk.gdk_monitor_get_geometry(self, geometry)
      geometry
    end

    def height_mm : Int32
      # gdk_monitor_get_height_mm: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_monitor_get_height_mm(self)
      _retval
    end

    def manufacturer : ::String?
      # gdk_monitor_get_manufacturer: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_monitor_get_manufacturer(self)
      ::String.new(_retval) unless _retval.null?
    end

    def model : ::String?
      # gdk_monitor_get_model: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_monitor_get_model(self)
      ::String.new(_retval) unless _retval.null?
    end

    def refresh_rate : Int32
      # gdk_monitor_get_refresh_rate: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_monitor_get_refresh_rate(self)
      _retval
    end

    def scale_factor : Int32
      # gdk_monitor_get_scale_factor: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_monitor_get_scale_factor(self)
      _retval
    end

    def subpixel_layout : Gdk::SubpixelLayout
      # gdk_monitor_get_subpixel_layout: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_monitor_get_subpixel_layout(self)
      Gdk::SubpixelLayout.from_value(_retval)
    end

    def width_mm : Int32
      # gdk_monitor_get_width_mm: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_monitor_get_width_mm(self)
      _retval
    end

    def is_valid : Bool
      # gdk_monitor_is_valid: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_monitor_is_valid(self)
      GICrystal.to_bool(_retval)
    end

    struct InvalidateSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "invalidate::#{@detail}" : "invalidate"
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

      def connect(block : Proc(Gdk::Monitor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Monitor.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Monitor, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Monitor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Monitor.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Monitor, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "invalidate")
      end
    end

    def invalidate_signal
      InvalidateSignal.new(self)
    end
  end
end
