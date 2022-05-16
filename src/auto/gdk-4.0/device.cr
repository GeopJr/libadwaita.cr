require "../g_object-2.0/object"

module Gdk
  # The `GdkDevice` object represents an input device, such
  # as a keyboard, a mouse, or a touchpad.
  #
  # See the `Gdk#Seat` documentation for more information
  # about the various kinds of devices, and their relationships.
  @[GObject::GeneratedWrapper]
  class Device < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::Device), instance_init, 0)
    end

    GICrystal.define_new_method(Device, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Device`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, caps_lock_state : Bool? = nil, direction : Pango::Direction? = nil, display : Gdk::Display? = nil, has_bidi_layouts : Bool? = nil, has_cursor : Bool? = nil, modifier_state : Gdk::ModifierType? = nil, n_axes : UInt32? = nil, name : ::String? = nil, num_lock_state : Bool? = nil, num_touches : UInt32? = nil, product_id : ::String? = nil, scroll_lock_state : Bool? = nil, seat : Gdk::Seat? = nil, source : Gdk::InputSource? = nil, tool : Gdk::DeviceTool? = nil, vendor_id : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[16]
      _values = StaticArray(LibGObject::Value, 16).new(LibGObject::Value.new)
      _n = 0

      if !caps_lock_state.nil?
        (_names.to_unsafe + _n).value = "caps-lock-state".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, caps_lock_state)
        _n += 1
      end
      if !direction.nil?
        (_names.to_unsafe + _n).value = "direction".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, direction)
        _n += 1
      end
      if !display.nil?
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if !has_bidi_layouts.nil?
        (_names.to_unsafe + _n).value = "has-bidi-layouts".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_bidi_layouts)
        _n += 1
      end
      if !has_cursor.nil?
        (_names.to_unsafe + _n).value = "has-cursor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_cursor)
        _n += 1
      end
      if !modifier_state.nil?
        (_names.to_unsafe + _n).value = "modifier-state".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, modifier_state)
        _n += 1
      end
      if !n_axes.nil?
        (_names.to_unsafe + _n).value = "n-axes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, n_axes)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !num_lock_state.nil?
        (_names.to_unsafe + _n).value = "num-lock-state".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, num_lock_state)
        _n += 1
      end
      if !num_touches.nil?
        (_names.to_unsafe + _n).value = "num-touches".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, num_touches)
        _n += 1
      end
      if !product_id.nil?
        (_names.to_unsafe + _n).value = "product-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, product_id)
        _n += 1
      end
      if !scroll_lock_state.nil?
        (_names.to_unsafe + _n).value = "scroll-lock-state".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scroll_lock_state)
        _n += 1
      end
      if !seat.nil?
        (_names.to_unsafe + _n).value = "seat".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, seat)
        _n += 1
      end
      if !source.nil?
        (_names.to_unsafe + _n).value = "source".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, source)
        _n += 1
      end
      if !tool.nil?
        (_names.to_unsafe + _n).value = "tool".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tool)
        _n += 1
      end
      if !vendor_id.nil?
        (_names.to_unsafe + _n).value = "vendor-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vendor_id)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Device.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_device_get_type
    end

    def caps_lock_state? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "caps-lock-state", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def direction : Pango::Direction
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "direction", pointerof(value), Pointer(Void).null)
      Pango::Direction.new(value)
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

    def has_bidi_layouts? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "has-bidi-layouts", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def has_cursor=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "has-cursor", unsafe_value, Pointer(Void).null)
      value
    end

    def has_cursor? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "has-cursor", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def modifier_state : Gdk::ModifierType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "modifier-state", pointerof(value), Pointer(Void).null)
      Gdk::ModifierType.new(value)
    end

    def n_axes : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "n-axes", pointerof(value), Pointer(Void).null)
      value
    end

    def name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "name", unsafe_value, Pointer(Void).null)
      value
    end

    def name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def num_lock_state? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "num-lock-state", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def num_touches=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "num-touches", unsafe_value, Pointer(Void).null)
      value
    end

    def num_touches : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "num-touches", pointerof(value), Pointer(Void).null)
      value
    end

    def product_id=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "product-id", unsafe_value, Pointer(Void).null)
      value
    end

    def product_id : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "product-id", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def scroll_lock_state? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "scroll-lock-state", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def seat=(value : Gdk::Seat?) : Gdk::Seat?
      unsafe_value = value

      LibGObject.g_object_set(self, "seat", unsafe_value, Pointer(Void).null)
      value
    end

    def seat : Gdk::Seat?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "seat", pointerof(value), Pointer(Void).null)
      Gdk::Seat.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def source=(value : Gdk::InputSource) : Gdk::InputSource
      unsafe_value = value

      LibGObject.g_object_set(self, "source", unsafe_value, Pointer(Void).null)
      value
    end

    def source : Gdk::InputSource
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "source", pointerof(value), Pointer(Void).null)
      Gdk::InputSource.new(value)
    end

    def tool : Gdk::DeviceTool?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "tool", pointerof(value), Pointer(Void).null)
      Gdk::DeviceTool.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def vendor_id=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "vendor-id", unsafe_value, Pointer(Void).null)
      value
    end

    def vendor_id : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "vendor-id", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Retrieves whether the Caps Lock modifier of the keyboard is locked.
    #
    # This is only relevant for keyboard devices.
    def caps_lock_state : Bool
      # gdk_device_get_caps_lock_state: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_device_get_caps_lock_state(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves the current tool for @device.
    def device_tool : Gdk::DeviceTool?
      # gdk_device_get_device_tool: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_device_get_device_tool(@pointer)

      # Return value handling

      Gdk::DeviceTool.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the direction of effective layout of the keyboard.
    #
    # This is only relevant for keyboard devices.
    #
    # The direction of a layout is the direction of the majority
    # of its symbols. See `Pango#unichar_direction`.
    def direction : Pango::Direction
      # gdk_device_get_direction: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_device_get_direction(@pointer)

      # Return value handling

      Pango::Direction.new(_retval)
    end

    # Returns the `GdkDisplay` to which @device pertains.
    def display : Gdk::Display
      # gdk_device_get_display: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_device_get_display(@pointer)

      # Return value handling

      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    # Determines whether the pointer follows device motion.
    #
    # This is not meaningful for keyboard devices, which
    # don't have a pointer.
    def has_cursor : Bool
      # gdk_device_get_has_cursor: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_device_get_has_cursor(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves the current modifier state of the keyboard.
    #
    # This is only relevant for keyboard devices.
    def modifier_state : Gdk::ModifierType
      # gdk_device_get_modifier_state: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_device_get_modifier_state(@pointer)

      # Return value handling

      Gdk::ModifierType.new(_retval)
    end

    # The name of the device, suitable for showing in a user interface.
    def name : ::String
      # gdk_device_get_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_device_get_name(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Retrieves whether the Num Lock modifier of the keyboard is locked.
    #
    # This is only relevant for keyboard devices.
    def num_lock_state : Bool
      # gdk_device_get_num_lock_state: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_device_get_num_lock_state(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves the number of touch points associated to @device.
    def num_touches : UInt32
      # gdk_device_get_num_touches: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_device_get_num_touches(@pointer)

      # Return value handling

      _retval
    end

    # Returns the product ID of this device.
    #
    # This ID is retrieved from the device, and does not change.
    # See `Gdk::Device#vendor_id` for more information.
    def product_id : ::String?
      # gdk_device_get_product_id: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_device_get_product_id(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Retrieves whether the Scroll Lock modifier of the keyboard is locked.
    #
    # This is only relevant for keyboard devices.
    def scroll_lock_state : Bool
      # gdk_device_get_scroll_lock_state: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_device_get_scroll_lock_state(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the `GdkSeat` the device belongs to.
    def seat : Gdk::Seat
      # gdk_device_get_seat: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_device_get_seat(@pointer)

      # Return value handling

      Gdk::Seat.new(_retval, GICrystal::Transfer::None)
    end

    # Determines the type of the device.
    def source : Gdk::InputSource
      # gdk_device_get_source: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_device_get_source(@pointer)

      # Return value handling

      Gdk::InputSource.new(_retval)
    end

    # Obtains the surface underneath @device, returning the location of the
    # device in @win_x and @win_y.
    #
    # Returns %NULL if the surface tree under @device is not known to GDK
    # (for example, belongs to another application).
    def surface_at_position : Gdk::Surface?
      # gdk_device_get_surface_at_position: (Method)
      # @win_x: (out) (transfer full) (optional)
      # @win_y: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      win_x = Pointer(Float64).null # Generator::OutArgUsedInReturnPlan
      win_y = Pointer(Float64).null
      # C call
      _retval = LibGdk.gdk_device_get_surface_at_position(@pointer, win_x, win_y)

      # Return value handling

      Gdk::Surface.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the timestamp of the last activity for this device.
    #
    # In practice, this means the timestamp of the last event that was
    # received from the OS for this device. (GTK may occasionally produce
    # events for a device that are not received from the OS, and will not
    # update the timestamp).
    def timestamp : UInt32
      # gdk_device_get_timestamp: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_device_get_timestamp(@pointer)

      # Return value handling

      _retval
    end

    # Returns the vendor ID of this device.
    #
    # This ID is retrieved from the device, and does not change.
    #
    # This function, together with `Gdk::Device#product_id`,
    # can be used to eg. compose `GSettings` paths to store settings
    # for this device.
    #
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    #  static GSettings *
    #  get_device_settings (GdkDevice *device)
    #  {
    #    const char *vendor, *product;
    #    GSettings *settings;
    #    GdkDevice *device;
    #    char *path;
    #
    #    vendor = gdk_device_get_vendor_id (device);
    #    product = gdk_device_get_product_id (device);
    #
    #    path = g_strdup_printf ("/org/example/app/devices/%s:%s/", vendor, product);
    #    settings = g_settings_new_with_path (DEVICE_SCHEMA, path);
    #    g_free (path);
    #
    #    return settings;
    #  }
    # ```
    def vendor_id : ::String?
      # gdk_device_get_vendor_id: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_device_get_vendor_id(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Determines if layouts for both right-to-left and
    # left-to-right languages are in use on the keyboard.
    #
    # This is only relevant for keyboard devices.
    def has_bidi_layouts : Bool
      # gdk_device_has_bidi_layouts: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_device_has_bidi_layouts(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Emitted either when the number of either axes or keys changes.
    #
    # On X11 this will normally happen when the physical device
    # routing events through the logical device changes (for
    # example, user switches from the USB mouse to a tablet); in
    # that case the logical device will change to reflect the axes
    # and keys on the new physical device.
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

      def connect(handler : Proc(Gdk::Device, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::Device.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Device, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gdk::Device, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::Device.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Device, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed")
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end

    # Emitted on pen/eraser devices whenever tools enter or leave proximity.
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

      def connect(handler : Proc(Gdk::DeviceTool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tool : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          tool = Gdk::DeviceTool.new(lib_tool, :none)
          ::Box(Proc(Gdk::DeviceTool, Nil)).unbox(_lib_box).call(tool)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gdk::DeviceTool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tool : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          tool = Gdk::DeviceTool.new(lib_tool, :none)
          ::Box(Proc(Gdk::DeviceTool, Nil)).unbox(_lib_box).call(tool)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gdk::Device, Gdk::DeviceTool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tool : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::Device.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          tool = Gdk::DeviceTool.new(lib_tool, :none)
          ::Box(Proc(Gdk::Device, Gdk::DeviceTool, Nil)).unbox(_lib_box).call(_sender, tool)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gdk::Device, Gdk::DeviceTool, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tool : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::Device.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          tool = Gdk::DeviceTool.new(lib_tool, :none)
          ::Box(Proc(Gdk::Device, Gdk::DeviceTool, Nil)).unbox(_lib_box).call(_sender, tool)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
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
