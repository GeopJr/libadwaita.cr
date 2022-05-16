require "../g_object-2.0/object"

module Gdk
  # `GdkMonitor` objects represent the individual outputs that are
  # associated with a `GdkDisplay`.
  #
  # `GdkDisplay` keeps a `GListModel` to enumerate and monitor
  # monitors with `Gdk::Display#monitors`. You can use
  # `Gdk::Display#monitor_at_surface` to find a particular
  # monitor.
  @[GObject::GeneratedWrapper]
  class Monitor < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGdk::MonitorClass), class_init,
        sizeof(LibGdk::Monitor), instance_init, 0)
    end

    GICrystal.define_new_method(Monitor, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Monitor`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, connector : ::String? = nil, display : Gdk::Display? = nil, geometry : Gdk::Rectangle? = nil, height_mm : Int32? = nil, manufacturer : ::String? = nil, model : ::String? = nil, refresh_rate : Int32? = nil, scale_factor : Int32? = nil, subpixel_layout : Gdk::SubpixelLayout? = nil, valid : Bool? = nil, width_mm : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[11]
      _values = StaticArray(LibGObject::Value, 11).new(LibGObject::Value.new)
      _n = 0

      if !connector.nil?
        (_names.to_unsafe + _n).value = "connector".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, connector)
        _n += 1
      end
      if !display.nil?
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if !geometry.nil?
        (_names.to_unsafe + _n).value = "geometry".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, geometry)
        _n += 1
      end
      if !height_mm.nil?
        (_names.to_unsafe + _n).value = "height-mm".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height_mm)
        _n += 1
      end
      if !manufacturer.nil?
        (_names.to_unsafe + _n).value = "manufacturer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, manufacturer)
        _n += 1
      end
      if !model.nil?
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end
      if !refresh_rate.nil?
        (_names.to_unsafe + _n).value = "refresh-rate".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, refresh_rate)
        _n += 1
      end
      if !scale_factor.nil?
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if !subpixel_layout.nil?
        (_names.to_unsafe + _n).value = "subpixel-layout".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, subpixel_layout)
        _n += 1
      end
      if !valid.nil?
        (_names.to_unsafe + _n).value = "valid".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, valid)
        _n += 1
      end
      if !width_mm.nil?
        (_names.to_unsafe + _n).value = "width-mm".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_mm)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Monitor.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_monitor_get_type
    end

    def connector : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "connector", pointerof(value), Pointer(Void).null)
      ::String.new(value)
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

    def geometry : Gdk::Rectangle?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "geometry", pointerof(value), Pointer(Void).null)
      Gdk::Rectangle.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def height_mm : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "height-mm", pointerof(value), Pointer(Void).null)
      value
    end

    def manufacturer : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "manufacturer", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def model : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "model", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def refresh_rate : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "refresh-rate", pointerof(value), Pointer(Void).null)
      value
    end

    def scale_factor : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "scale-factor", pointerof(value), Pointer(Void).null)
      value
    end

    def subpixel_layout : Gdk::SubpixelLayout
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "subpixel-layout", pointerof(value), Pointer(Void).null)
      Gdk::SubpixelLayout.new(value)
    end

    def valid? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "valid", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def width_mm : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "width-mm", pointerof(value), Pointer(Void).null)
      value
    end

    # Gets the name of the monitor's connector, if available.
    def connector : ::String?
      # gdk_monitor_get_connector: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_monitor_get_connector(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the display that this monitor belongs to.
    def display : Gdk::Display
      # gdk_monitor_get_display: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_monitor_get_display(@pointer)

      # Return value handling

      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the size and position of the monitor within the
    # display coordinate space.
    #
    # The returned geometry is in  ”application pixels”, not in
    # ”device pixels” (see `Gdk::Monitor#scale_factor`).
    def geometry : Gdk::Rectangle
      # gdk_monitor_get_geometry: (Method | Getter)
      # @geometry: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      geometry = Gdk::Rectangle.new
      # C call
      LibGdk.gdk_monitor_get_geometry(@pointer, geometry)

      # Return value handling

      geometry
    end

    # Gets the height in millimeters of the monitor.
    def height_mm : Int32
      # gdk_monitor_get_height_mm: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_monitor_get_height_mm(@pointer)

      # Return value handling

      _retval
    end

    # Gets the name or PNP ID of the monitor's manufacturer.
    #
    # Note that this value might also vary depending on actual
    # display backend.
    #
    # The PNP ID registry is located at
    # [https://uefi.org/pnp_id_list](https://uefi.org/pnp_id_list).
    def manufacturer : ::String?
      # gdk_monitor_get_manufacturer: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_monitor_get_manufacturer(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the string identifying the monitor model, if available.
    def model : ::String?
      # gdk_monitor_get_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_monitor_get_model(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the refresh rate of the monitor, if available.
    #
    # The value is in milli-Hertz, so a refresh rate of 60Hz
    # is returned as 60000.
    def refresh_rate : Int32
      # gdk_monitor_get_refresh_rate: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_monitor_get_refresh_rate(@pointer)

      # Return value handling

      _retval
    end

    # Gets the internal scale factor that maps from monitor coordinates
    # to device pixels.
    #
    # On traditional systems this is 1, but on very high density outputs
    # it can be a higher value (often 2).
    #
    # This can be used if you want to create pixel based data for a
    # particular monitor, but most of the time you’re drawing to a surface
    # where it is better to use `Gdk::Surface#scale_factor` instead.
    def scale_factor : Int32
      # gdk_monitor_get_scale_factor: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_monitor_get_scale_factor(@pointer)

      # Return value handling

      _retval
    end

    # Gets information about the layout of red, green and blue
    # primaries for pixels.
    def subpixel_layout : Gdk::SubpixelLayout
      # gdk_monitor_get_subpixel_layout: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_monitor_get_subpixel_layout(@pointer)

      # Return value handling

      Gdk::SubpixelLayout.new(_retval)
    end

    # Gets the width in millimeters of the monitor.
    def width_mm : Int32
      # gdk_monitor_get_width_mm: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_monitor_get_width_mm(@pointer)

      # Return value handling

      _retval
    end

    # Returns %TRUE if the @monitor object corresponds to a
    # physical monitor.
    #
    # The @monitor becomes invalid when the physical monitor
    # is unplugged or removed.
    def is_valid : Bool
      # gdk_monitor_is_valid: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_monitor_is_valid(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Emitted when the output represented by @monitor gets disconnected.
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

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gdk::Monitor, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::Monitor.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Monitor, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gdk::Monitor, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::Monitor.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Monitor, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
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
