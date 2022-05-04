require "./gesture_single"

module Gtk
  # `GtkGestureLongPress` is a `GtkGesture` for long presses.
  #
  # This gesture is also known as “Press and Hold”.
  #
  # When the timeout is exceeded, the gesture is triggering the
  # `Gtk::GestureLongPress::#pressed` signal.
  #
  # If the touchpoint is lifted before the timeout passes, or if
  # it drifts too far of the initial press point, the
  # `Gtk::GestureLongPress::#cancelled` signal will be emitted.
  #
  # How long the timeout is before the ::pressed signal gets emitted is
  # determined by the [property@Gtk.Settings:gtk-long-press-time] setting.
  # It can be modified by the [property@Gtk.GestureLongPress:delay-factor]
  # property.
  @[GObject::GeneratedWrapper]
  class GestureLongPress < GestureSingle
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::GestureLongPressClass), class_init,
        sizeof(LibGtk::GestureLongPress), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, button : UInt32? = nil, delay_factor : Float64? = nil, exclusive : Bool? = nil, n_points : UInt32? = nil, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, touch_only : Bool? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[9]
      _values = StaticArray(LibGObject::Value, 9).new(LibGObject::Value.new)
      _n = 0

      if !button.nil?
        (_names.to_unsafe + _n).value = "button".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, button)
        _n += 1
      end
      if !delay_factor.nil?
        (_names.to_unsafe + _n).value = "delay-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, delay_factor)
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

      @pointer = LibGObject.g_object_new_with_properties(GestureLongPress.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_gesture_long_press_get_type
    end

    def delay_factor=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "delay-factor", unsafe_value, Pointer(Void).null)
      value
    end

    def delay_factor : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "delay-factor", pointerof(value), Pointer(Void).null)
      value
    end

    # Returns a newly created `GtkGesture` that recognizes long presses.
    def initialize
      # gtk_gesture_long_press_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_gesture_long_press_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the delay factor.
    def delay_factor : Float64
      # gtk_gesture_long_press_get_delay_factor: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gesture_long_press_get_delay_factor(self)

      # Return value handling

      _retval
    end

    # Applies the given delay factor.
    #
    # The default long press time will be multiplied by this value.
    # Valid values are in the range [0.5..2.0].
    def delay_factor=(delay_factor : Float64) : Nil
      # gtk_gesture_long_press_set_delay_factor: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_gesture_long_press_set_delay_factor(self, delay_factor)

      # Return value handling
    end

    # Emitted whenever a press moved too far, or was released
    # before `Gtk::GestureLongPress::#pressed` happened.
    struct CancelledSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "cancelled::#{@detail}" : "cancelled"
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

      def connect(handler : Proc(Gtk::GestureLongPress, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureLongPress.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::GestureLongPress, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::GestureLongPress, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureLongPress.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::GestureLongPress, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "cancelled")
      end
    end

    def cancelled_signal
      CancelledSignal.new(self)
    end

    # Emitted whenever a press goes unmoved/unreleased longer than
    # what the GTK defaults tell.
    struct PressedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "pressed::#{@detail}" : "pressed"
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

      def connect(handler : Proc(Gtk::GestureLongPress, Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureLongPress.new(_lib_sender, GICrystal::Transfer::None)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::GestureLongPress, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::GestureLongPress, Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureLongPress.new(_lib_sender, GICrystal::Transfer::None)
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::GestureLongPress, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, x, y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "pressed", x, y)
      end
    end

    def pressed_signal
      PressedSignal.new(self)
    end
  end
end
