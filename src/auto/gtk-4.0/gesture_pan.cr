require "./gesture_drag"

module Gtk
  # `GtkGesturePan` is a `GtkGesture` for pan gestures.
  #
  # These are drags that are locked to happen along one axis. The axis
  # that a `GtkGesturePan` handles is defined at construct time, and
  # can be changed through `Gtk::GesturePan#orientation=`.
  #
  # When the gesture starts to be recognized, `GtkGesturePan` will
  # attempt to determine as early as possible whether the sequence
  # is moving in the expected direction, and denying the sequence if
  # this does not happen.
  #
  # Once a panning gesture along the expected axis is recognized,
  # the `Gtk::GesturePan::#pan` signal will be emitted as input
  # events are received, containing the offset in the given axis.
  @[GObject::GeneratedWrapper]
  class GesturePan < GestureDrag
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::GesturePanClass), class_init,
        sizeof(LibGtk::GesturePan), instance_init, 0)
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

    def initialize(*, button : UInt32? = nil, exclusive : Bool? = nil, n_points : UInt32? = nil, name : ::String? = nil, orientation : Gtk::Orientation? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, touch_only : Bool? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[9]
      _values = StaticArray(LibGObject::Value, 9).new(LibGObject::Value.new)
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
      if !orientation.nil?
        (_names.to_unsafe + _n).value = "orientation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, orientation)
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

      @pointer = LibGObject.g_object_new_with_properties(GesturePan.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_gesture_pan_get_type
    end

    def orientation=(value : Gtk::Orientation) : Gtk::Orientation
      unsafe_value = value

      LibGObject.g_object_set(self, "orientation", unsafe_value, Pointer(Void).null)
      value
    end

    def orientation : Gtk::Orientation
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "orientation", pointerof(value), Pointer(Void).null)
      Gtk::Orientation.new(value)
    end

    # Returns a newly created `GtkGesture` that recognizes pan gestures.
    def initialize(orientation : Gtk::Orientation)
      # gtk_gesture_pan_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_gesture_pan_new(orientation)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the orientation of the pan gestures that this @gesture expects.
    def orientation : Gtk::Orientation
      # gtk_gesture_pan_get_orientation: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gesture_pan_get_orientation(self)

      # Return value handling

      Gtk::Orientation.new(_retval)
    end

    # Sets the orientation to be expected on pan gestures.
    def orientation=(orientation : Gtk::Orientation) : Nil
      # gtk_gesture_pan_set_orientation: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_gesture_pan_set_orientation(self, orientation)

      # Return value handling
    end

    # Emitted once a panning gesture along the expected axis is detected.
    struct PanSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "pan::#{@detail}" : "pan"
      end

      def connect(&block : Proc(Gtk::PanDirection, Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::PanDirection, Float64, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gtk::PanDirection, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_direction : UInt32, lib_offset : Float64, _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          direction = Gtk::PanDirection.new(lib_direction, :none)
          offset = lib_offset
          ::Box(Proc(Gtk::PanDirection, Float64, Nil)).unbox(_lib_box).call(direction, offset)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::PanDirection, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_direction : UInt32, lib_offset : Float64, _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          direction = Gtk::PanDirection.new(lib_direction, :none)
          offset = lib_offset
          ::Box(Proc(Gtk::PanDirection, Float64, Nil)).unbox(_lib_box).call(direction, offset)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::GesturePan, Gtk::PanDirection, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_direction : UInt32, lib_offset : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::GesturePan.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          direction = Gtk::PanDirection.new(lib_direction, :none)
          offset = lib_offset
          ::Box(Proc(Gtk::GesturePan, Gtk::PanDirection, Float64, Nil)).unbox(_lib_box).call(_sender, direction, offset)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::GesturePan, Gtk::PanDirection, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_direction : UInt32, lib_offset : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::GesturePan.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          direction = Gtk::PanDirection.new(lib_direction, :none)
          offset = lib_offset
          ::Box(Proc(Gtk::GesturePan, Gtk::PanDirection, Float64, Nil)).unbox(_lib_box).call(_sender, direction, offset)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(direction : Gtk::PanDirection, offset : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "pan", direction, offset)
      end
    end

    def pan_signal
      PanSignal.new(self)
    end
  end
end
