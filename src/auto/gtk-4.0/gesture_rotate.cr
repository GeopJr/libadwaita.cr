require "./gesture"

module Gtk
  # `GtkGestureRotate` is a `GtkGesture` for 2-finger rotations.
  #
  # Whenever the angle between both handled sequences changes, the
  # [signal@Gtk.GestureRotate::angle-changed] signal is emitted.
  @[GObject::GeneratedWrapper]
  class GestureRotate < Gesture
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::GestureRotateClass), class_init,
        sizeof(LibGtk::GestureRotate), instance_init, 0)
    end

    GICrystal.define_new_method(GestureRotate, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `GestureRotate`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, n_points : UInt32? = nil, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

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
      if !widget.nil?
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(GestureRotate.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_gesture_rotate_get_type
    end

    # Returns a newly created `GtkGesture` that recognizes 2-touch
    # rotation gestures.
    def initialize
      # gtk_gesture_rotate_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_gesture_rotate_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the angle delta in radians.
    #
    # If @gesture is active, this function returns the angle difference
    # in radians since the gesture was first recognized. If @gesture is
    # not active, 0 is returned.
    def angle_delta : Float64
      # gtk_gesture_rotate_get_angle_delta: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gesture_rotate_get_angle_delta(@pointer)

      # Return value handling

      _retval
    end

    # Emitted when the angle between both tracked points changes.
    struct AngleChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "angle-changed::#{@detail}" : "angle-changed"
      end

      def connect(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect(handler : Proc(Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_angle : Float64, lib_angle_delta : Float64, _lib_box : Pointer(Void)) {
          angle = lib_angle
          angle_delta = lib_angle_delta
          ::Box(Proc(Float64, Float64, Nil)).unbox(_lib_box).call(angle, angle_delta)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_angle : Float64, lib_angle_delta : Float64, _lib_box : Pointer(Void)) {
          angle = lib_angle
          angle_delta = lib_angle_delta
          ::Box(Proc(Float64, Float64, Nil)).unbox(_lib_box).call(angle, angle_delta)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::GestureRotate, Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_angle : Float64, lib_angle_delta : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureRotate.new(_lib_sender, GICrystal::Transfer::None)
          angle = lib_angle
          angle_delta = lib_angle_delta
          ::Box(Proc(Gtk::GestureRotate, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, angle, angle_delta)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::GestureRotate, Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_angle : Float64, lib_angle_delta : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureRotate.new(_lib_sender, GICrystal::Transfer::None)
          angle = lib_angle
          angle_delta = lib_angle_delta
          ::Box(Proc(Gtk::GestureRotate, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, angle, angle_delta)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(angle : Float64, angle_delta : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "angle-changed", angle, angle_delta)
      end
    end

    def angle_changed_signal
      AngleChangedSignal.new(self)
    end
  end
end
