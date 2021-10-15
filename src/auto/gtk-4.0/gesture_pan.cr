require "./gesture_drag"

module Gtk
  # `GtkGesturePan` is a `GtkGesture` for pan gestures.
  #
  # These are drags that are locked to happen along one axis. The axis
  # that a `GtkGesturePan` handles is defined at construct time, and
  # can be changed through [method@Gtk.GesturePan.set_orientation].
  #
  # When the gesture starts to be recognized, `GtkGesturePan` will
  # attempt to determine as early as possible whether the sequence
  # is moving in the expected direction, and denying the sequence if
  # this does not happen.
  #
  # Once a panning gesture along the expected axis is recognized,
  # the [signal@Gtk.GesturePan::pan] signal will be emitted as input
  # events are received, containing the offset in the given axis.
  class GesturePan < GestureDrag
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, button : UInt32? = nil, exclusive : Bool? = nil, n_points : UInt32? = nil, name : ::String? = nil, orientation : Gtk::Orientation? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, touch_only : Bool? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[9]
      _values = StaticArray(LibGObject::Value, 9).new(LibGObject::Value.new)
      _n = 0

      if button
        (_names.to_unsafe + _n).value = "button".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, button)
        _n += 1
      end
      if exclusive
        (_names.to_unsafe + _n).value = "exclusive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, exclusive)
        _n += 1
      end
      if n_points
        (_names.to_unsafe + _n).value = "n-points".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, n_points)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if orientation
        (_names.to_unsafe + _n).value = "orientation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, orientation)
        _n += 1
      end
      if propagation_limit
        (_names.to_unsafe + _n).value = "propagation-limit".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_limit)
        _n += 1
      end
      if propagation_phase
        (_names.to_unsafe + _n).value = "propagation-phase".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_phase)
        _n += 1
      end
      if touch_only
        (_names.to_unsafe + _n).value = "touch-only".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, touch_only)
        _n += 1
      end
      if widget
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(GesturePan.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_gesture_pan_get_type
    end

    def initialize(orientation : Gtk::Orientation)
      # gtk_gesture_pan_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_gesture_pan_new(orientation)
      @pointer = _retval
    end

    def orientation : Gtk::Orientation
      # gtk_gesture_pan_get_orientation: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_gesture_pan_get_orientation(self)
      Gtk::Orientation.from_value(_retval)
    end

    def orientation=(orientation : Gtk::Orientation) : Nil
      # gtk_gesture_pan_set_orientation: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_gesture_pan_set_orientation(self, orientation)
    end

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

      def connect(block : Proc(Gtk::PanDirection, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = Gtk::PanDirection.from_value(lib_arg0)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::PanDirection, Float64, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::PanDirection, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = Gtk::PanDirection.from_value(lib_arg0)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::PanDirection, Float64, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::GesturePan, Gtk::PanDirection, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::GesturePan.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PanDirection.from_value(lib_arg0)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::GesturePan, Gtk::PanDirection, Float64, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::GesturePan, Gtk::PanDirection, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Gtk::GesturePan.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::PanDirection.from_value(lib_arg0)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::GesturePan, Gtk::PanDirection, Float64, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
