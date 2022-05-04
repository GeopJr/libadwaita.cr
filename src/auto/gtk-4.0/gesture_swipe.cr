require "./gesture_single"

module Gtk
  # `GtkGestureSwipe` is a `GtkGesture` for swipe gestures.
  #
  # After a press/move/.../move/release sequence happens, the
  # `Gtk::GestureSwipe::#swipe` signal will be emitted,
  # providing the velocity and directionality of the sequence
  # at the time it was lifted.
  #
  # If the velocity is desired in intermediate points,
  # `Gtk::GestureSwipe#velocity` can be called in a
  # `Gtk::Gesture::#update` handler.
  #
  # All velocities are reported in pixels/sec units.
  @[GObject::GeneratedWrapper]
  class GestureSwipe < GestureSingle
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::GestureSwipeClass), class_init,
        sizeof(LibGtk::GestureSwipe), instance_init, 0)
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

      @pointer = LibGObject.g_object_new_with_properties(GestureSwipe.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_gesture_swipe_get_type
    end

    # Returns a newly created `GtkGesture` that recognizes swipes.
    def initialize
      # gtk_gesture_swipe_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_gesture_swipe_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the current velocity.
    #
    # If the gesture is recognized, this function returns %TRUE and fills
    # in @velocity_x and @velocity_y with the recorded velocity, as per the
    # last events processed.
    def velocity(velocity_x : Float64, velocity_y : Float64) : Bool
      # gtk_gesture_swipe_get_velocity: (Method)
      # @velocity_x: (out) (transfer full)
      # @velocity_y: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gesture_swipe_get_velocity(self, velocity_x, velocity_y)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Emitted when the recognized gesture is finished.
    #
    # Velocity and direction are a product of previously recorded events.
    struct SwipeSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "swipe::#{@detail}" : "swipe"
      end

      def connect(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect(handler : Proc(Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_velocity_x : Float64, lib_velocity_y : Float64, _lib_box : Pointer(Void)) {
          velocity_x = lib_velocity_x
          velocity_y = lib_velocity_y
          ::Box(Proc(Float64, Float64, Nil)).unbox(_lib_box).call(velocity_x, velocity_y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_velocity_x : Float64, lib_velocity_y : Float64, _lib_box : Pointer(Void)) {
          velocity_x = lib_velocity_x
          velocity_y = lib_velocity_y
          ::Box(Proc(Float64, Float64, Nil)).unbox(_lib_box).call(velocity_x, velocity_y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::GestureSwipe, Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_velocity_x : Float64, lib_velocity_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureSwipe.new(_lib_sender, GICrystal::Transfer::None)
          velocity_x = lib_velocity_x
          velocity_y = lib_velocity_y
          ::Box(Proc(Gtk::GestureSwipe, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, velocity_x, velocity_y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::GestureSwipe, Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_velocity_x : Float64, lib_velocity_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureSwipe.new(_lib_sender, GICrystal::Transfer::None)
          velocity_x = lib_velocity_x
          velocity_y = lib_velocity_y
          ::Box(Proc(Gtk::GestureSwipe, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, velocity_x, velocity_y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(velocity_x : Float64, velocity_y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "swipe", velocity_x, velocity_y)
      end
    end

    def swipe_signal
      SwipeSignal.new(self)
    end
  end
end
