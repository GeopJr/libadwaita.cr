require "./gesture_single"

module Gtk
  # `GtkGestureClick` is a `GtkGesture` implementation for clicks.
  #
  # It is able to recognize multiple clicks on a nearby zone, which
  # can be listened for through the `Gtk::GestureClick::#pressed`
  # signal. Whenever time or distance between clicks exceed the GTK
  # defaults, `Gtk::GestureClick::#stopped` is emitted, and the
  # click counter is reset.
  @[GObject::GeneratedWrapper]
  class GestureClick < GestureSingle
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::GestureClickClass), class_init,
        sizeof(LibGtk::GestureClick), instance_init, 0)
    end

    GICrystal.define_new_method(GestureClick, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `GestureClick`.
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

      @pointer = LibGObject.g_object_new_with_properties(GestureClick.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_gesture_click_get_type
    end

    # Emitted whenever a button or touch press happens.
    struct PressedSignal < GObject::Signal
      def name : String
        @detail ? "pressed::#{@detail}" : "pressed"
      end

      def connect(*, after : Bool = false, &block : Proc(Int32, Float64, Float64, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Int32, Float64, Float64, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_n_press : Int32, lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          n_press = lib_n_press
          x = lib_x
          y = lib_y
          ::Box(Proc(Int32, Float64, Float64, Nil)).unbox(_lib_box).call(n_press, x, y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::GestureClick, Int32, Float64, Float64, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_n_press : Int32, lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureClick.new(_lib_sender, GICrystal::Transfer::None)
          n_press = lib_n_press
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::GestureClick, Int32, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, n_press, x, y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(n_press : Int32, x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "pressed", n_press, x, y)
      end
    end

    def pressed_signal
      PressedSignal.new(self)
    end

    # Emitted when a button or touch is released.
    #
    # @n_press will report the number of press that is paired to
    # this event, note that `Gtk::GestureClick::#stopped` may
    # have been emitted between the press and its release, @n_press
    # will only start over at the next press.
    struct ReleasedSignal < GObject::Signal
      def name : String
        @detail ? "released::#{@detail}" : "released"
      end

      def connect(*, after : Bool = false, &block : Proc(Int32, Float64, Float64, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Int32, Float64, Float64, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_n_press : Int32, lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          n_press = lib_n_press
          x = lib_x
          y = lib_y
          ::Box(Proc(Int32, Float64, Float64, Nil)).unbox(_lib_box).call(n_press, x, y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::GestureClick, Int32, Float64, Float64, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_n_press : Int32, lib_x : Float64, lib_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureClick.new(_lib_sender, GICrystal::Transfer::None)
          n_press = lib_n_press
          x = lib_x
          y = lib_y
          ::Box(Proc(Gtk::GestureClick, Int32, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, n_press, x, y)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(n_press : Int32, x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "released", n_press, x, y)
      end
    end

    def released_signal
      ReleasedSignal.new(self)
    end

    # Emitted whenever any time/distance threshold has been exceeded.
    struct StoppedSignal < GObject::Signal
      def name : String
        @detail ? "stopped::#{@detail}" : "stopped"
      end

      def connect(*, after : Bool = false, &block : Proc(Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::GestureClick, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureClick.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::GestureClick, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "stopped")
      end
    end

    def stopped_signal
      StoppedSignal.new(self)
    end

    # Emitted whenever the gesture receives a release
    # event that had no previous corresponding press.
    #
    # Due to implicit grabs, this can only happen on situations
    # where input is grabbed elsewhere mid-press or the pressed
    # widget voluntarily relinquishes its implicit grab.
    struct UnpairedReleaseSignal < GObject::Signal
      def name : String
        @detail ? "unpaired-release::#{@detail}" : "unpaired-release"
      end

      def connect(*, after : Bool = false, &block : Proc(Float64, Float64, UInt32, Gdk::EventSequence, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Float64, Float64, UInt32, Gdk::EventSequence, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, lib_button : UInt32, lib_sequence : Pointer(Void), _lib_box : Pointer(Void)) {
          x = lib_x
          y = lib_y
          button = lib_button
          # Generator::BuiltInTypeArgPlan
          sequence = Gdk::EventSequence.new(lib_sequence, :none)
          ::Box(Proc(Float64, Float64, UInt32, Gdk::EventSequence, Nil)).unbox(_lib_box).call(x, y, button, sequence)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::GestureClick, Float64, Float64, UInt32, Gdk::EventSequence, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Float64, lib_y : Float64, lib_button : UInt32, lib_sequence : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::GestureClick.new(_lib_sender, GICrystal::Transfer::None)
          x = lib_x
          y = lib_y
          button = lib_button
          # Generator::BuiltInTypeArgPlan
          sequence = Gdk::EventSequence.new(lib_sequence, :none)
          ::Box(Proc(Gtk::GestureClick, Float64, Float64, UInt32, Gdk::EventSequence, Nil)).unbox(_lib_box).call(_sender, x, y, button, sequence)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(x : Float64, y : Float64, button : UInt32, sequence : Gdk::EventSequence) : Nil
        LibGObject.g_signal_emit_by_name(@source, "unpaired-release", x, y, button, sequence)
      end
    end

    def unpaired_release_signal
      UnpairedReleaseSignal.new(self)
    end
  end
end
