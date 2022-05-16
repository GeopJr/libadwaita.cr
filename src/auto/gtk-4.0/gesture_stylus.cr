require "./gesture_single"

module Gtk
  # `GtkGestureStylus` is a `GtkGesture` specific to stylus input.
  #
  # The provided signals just relay the basic information of the
  # stylus events.
  @[GObject::GeneratedWrapper]
  class GestureStylus < GestureSingle
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::GestureStylusClass), class_init,
        sizeof(LibGtk::GestureStylus), instance_init, 0)
    end

    GICrystal.define_new_method(GestureStylus, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `GestureStylus`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, button : UInt32? = nil, exclusive : Bool? = nil, n_points : UInt32? = nil, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, touch_only : Bool? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[8]
      _values = StaticArray(LibGObject::Value, 8).new(LibGObject::Value.new)
      _n = 0

      if !button.nil?
        (_names.to_unsafe + _n).value = "button".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, button)
        _n += 1
      end
      if !exclusive.nil?
        (_names.to_unsafe + _n).value = "exclusive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, exclusive)
        _n += 1
      end
      if !n_points.nil?
        (_names.to_unsafe + _n).value = "n-points".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, n_points)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !propagation_limit.nil?
        (_names.to_unsafe + _n).value = "propagation-limit".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_limit)
        _n += 1
      end
      if !propagation_phase.nil?
        (_names.to_unsafe + _n).value = "propagation-phase".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_phase)
        _n += 1
      end
      if !touch_only.nil?
        (_names.to_unsafe + _n).value = "touch-only".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, touch_only)
        _n += 1
      end
      if !widget.nil?
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(GestureStylus.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_gesture_stylus_get_type
    end

    # Creates a new `GtkGestureStylus`.
    def initialize
      # gtk_gesture_stylus_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_gesture_stylus_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the current values for the requested @axes.
    #
    # This function must be called from the handler of one of the
    # `Gtk::GestureStylus::#down`, `Gtk::GestureStylus::#motion`,
    # `Gtk::GestureStylus::#up` or `Gtk::GestureStylus::#proximity`
    # signals.
    def axes(axes : Enumerable(Gdk::AxisUse), values : Enumerable(Float64)) : Bool
      # gtk_gesture_stylus_get_axes: (Method)
      # @axes: (array element-type Interface)
      # @values: (out) (transfer full) (array element-type Double)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      axes = axes.to_a.map(&.to_unsafe).to_unsafe
      # Generator::ArrayArgPlan
      values = values.to_a.to_unsafe

      # C call
      _retval = LibGtk.gtk_gesture_stylus_get_axes(@pointer, axes, values)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the current value for the requested @axis.
    #
    # This function must be called from the handler of one of the
    # `Gtk::GestureStylus::#down`, `Gtk::GestureStylus::#motion`,
    # `Gtk::GestureStylus::#up` or `Gtk::GestureStylus::#proximity`
    # signals.
    def axis(axis : Gdk::AxisUse, value : Float64) : Bool
      # gtk_gesture_stylus_get_axis: (Method)
      # @value: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gesture_stylus_get_axis(@pointer, axis, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the accumulated backlog of tracking information.
    #
    # By default, GTK will limit rate of input events. On stylus input
    # where accuracy of strokes is paramount, this function returns the
    # accumulated coordinate/timing state before the emission of the
    # current [Gtk.GestureStylus::motion] signal.
    #
    # This function may only be called within a `Gtk::GestureStylus::#motion`
    # signal handler, the state given in this signal and obtainable through
    # `Gtk::GestureStylus#axis` express the latest (most up-to-date)
    # state in motion history.
    #
    # The @backlog is provided in chronological order.
    def backlog(backlog : Enumerable(Gdk::TimeCoord)) : Bool
      # gtk_gesture_stylus_get_backlog: (Method)
      # @backlog: (out) (transfer full) (array length=n_elems element-type Interface)
      # @n_elems: (out) (transfer full)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_elems = backlog.size # Generator::ArrayArgPlan
      backlog = backlog.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGtk.gtk_gesture_stylus_get_backlog(@pointer, backlog, n_elems)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def backlog(*backlog : Gdk::TimeCoord)
      backlog(backlog)
    end

    # Returns the `GdkDeviceTool` currently driving input through this gesture.
    #
    # This function must be called from the handler of one of the
    # `Gtk::GestureStylus::#down`, `Gtk::GestureStylus::#motion`,
    # `Gtk::GestureStylus::#up` or `Gtk::GestureStylus::#proximity`
    # signals.
    def device_tool : Gdk::DeviceTool?
      # gtk_gesture_stylus_get_device_tool: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gesture_stylus_get_device_tool(@pointer)

      # Return value handling

      Gdk::DeviceTool.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Emitted when the stylus touches the device.
    struct DownSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "down::#{@detail}" : "down"
      end

      def connect(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect(handler : Proc(Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          x = lib_x
          y = lib_y
          ::Box(Proc(Float64, Float64, Nil)).unbox(_lib_box).call(x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          x = lib_x
          y = lib_y
          ::Box(Proc(Float64, Float64, Nil)).unbox(_lib_box).call(x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::GestureStylus, Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureStylus.new(_lib_sender, GICrystal::Transfer::None)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::GestureStylus, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::GestureStylus, Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureStylus.new(_lib_sender, GICrystal::Transfer::None)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::GestureStylus, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "down", x, y)
      end
    end

    def down_signal
      DownSignal.new(self)
    end

    # Emitted when the stylus moves while touching the device.
    struct MotionSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "motion::#{@detail}" : "motion"
      end

      def connect(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect(handler : Proc(Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          x = lib_x
          y = lib_y
          ::Box(Proc(Float64, Float64, Nil)).unbox(_lib_box).call(x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          x = lib_x
          y = lib_y
          ::Box(Proc(Float64, Float64, Nil)).unbox(_lib_box).call(x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::GestureStylus, Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureStylus.new(_lib_sender, GICrystal::Transfer::None)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::GestureStylus, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::GestureStylus, Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureStylus.new(_lib_sender, GICrystal::Transfer::None)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::GestureStylus, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "motion", x, y)
      end
    end

    def motion_signal
      MotionSignal.new(self)
    end

    # Emitted when the stylus is in proximity of the device.
    struct ProximitySignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "proximity::#{@detail}" : "proximity"
      end

      def connect(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect(handler : Proc(Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          x = lib_x
          y = lib_y
          ::Box(Proc(Float64, Float64, Nil)).unbox(_lib_box).call(x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          x = lib_x
          y = lib_y
          ::Box(Proc(Float64, Float64, Nil)).unbox(_lib_box).call(x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::GestureStylus, Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureStylus.new(_lib_sender, GICrystal::Transfer::None)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::GestureStylus, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::GestureStylus, Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureStylus.new(_lib_sender, GICrystal::Transfer::None)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::GestureStylus, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "proximity", x, y)
      end
    end

    def proximity_signal
      ProximitySignal.new(self)
    end

    # Emitted when the stylus no longer touches the device.
    struct UpSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "up::#{@detail}" : "up"
      end

      def connect(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect(handler : Proc(Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          x = lib_x
          y = lib_y
          ::Box(Proc(Float64, Float64, Nil)).unbox(_lib_box).call(x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          x = lib_x
          y = lib_y
          ::Box(Proc(Float64, Float64, Nil)).unbox(_lib_box).call(x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::GestureStylus, Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureStylus.new(_lib_sender, GICrystal::Transfer::None)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::GestureStylus, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::GestureStylus, Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureStylus.new(_lib_sender, GICrystal::Transfer::None)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::GestureStylus, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "up", x, y)
      end
    end

    def up_signal
      UpSignal.new(self)
    end
  end
end
