require "./gesture_single"

module Gtk
  # `GtkGestureClick` is a `GtkGesture` implementation for clicks.
  #
  # It is able to recognize multiple clicks on a nearby zone, which
  # can be listened for through the [signal@Gtk.GestureClick::pressed]
  # signal. Whenever time or distance between clicks exceed the GTK
  # defaults, [signal@Gtk.GestureClick::stopped] is emitted, and the
  # click counter is reset.
  class GestureClick < GestureSingle
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, button : UInt32? = nil, exclusive : Bool? = nil, n_points : UInt32? = nil, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, touch_only : Bool? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[8]
      _values = StaticArray(LibGObject::Value, 8).new(LibGObject::Value.new)
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

      @pointer = LibGObject.g_object_new_with_properties(GestureClick.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_gesture_click_get_type
    end

    def initialize
      # gtk_gesture_click_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_gesture_click_new

      # Return value handling
      @pointer = _retval
    end

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

      def connect(&block : Proc(Int32, Float64, Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Int32, Float64, Float64, Nil))
        connect(block)
      end

      def connect(block : Proc(Int32, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Int32, Float64, Float64, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Int32, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Int32, Float64, Float64, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::GestureClick, Int32, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          sender = Gtk::GestureClick.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Gtk::GestureClick, Int32, Float64, Float64, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::GestureClick, Int32, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          sender = Gtk::GestureClick.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Gtk::GestureClick, Int32, Float64, Float64, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(n_press : Int32, x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "pressed", n_press, x, y)
      end
    end

    def pressed_signal
      PressedSignal.new(self)
    end

    struct ReleasedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "released::#{@detail}" : "released"
      end

      def connect(&block : Proc(Int32, Float64, Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Int32, Float64, Float64, Nil))
        connect(block)
      end

      def connect(block : Proc(Int32, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Int32, Float64, Float64, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Int32, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Int32, Float64, Float64, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::GestureClick, Int32, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          sender = Gtk::GestureClick.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Gtk::GestureClick, Int32, Float64, Float64, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::GestureClick, Int32, Float64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, lib_arg1 : Float64, lib_arg2 : Float64, box : Pointer(Void)) {
          sender = Gtk::GestureClick.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = lib_arg2
          ::Box(Proc(Gtk::GestureClick, Int32, Float64, Float64, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(n_press : Int32, x : Float64, y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "released", n_press, x, y)
      end
    end

    def released_signal
      ReleasedSignal.new(self)
    end

    struct StoppedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "stopped::#{@detail}" : "stopped"
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

      def connect(block : Proc(Gtk::GestureClick, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::GestureClick.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::GestureClick, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::GestureClick, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::GestureClick.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::GestureClick, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "stopped")
      end
    end

    def stopped_signal
      StoppedSignal.new(self)
    end

    struct UnpairedReleaseSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "unpaired-release::#{@detail}" : "unpaired-release"
      end

      def connect(&block : Proc(Float64, Float64, UInt32, Gdk::EventSequence, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, UInt32, Gdk::EventSequence, Nil))
        connect(block)
      end

      def connect(block : Proc(Float64, Float64, UInt32, Gdk::EventSequence, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, lib_arg2 : UInt32, lib_arg3 : Pointer(Void), box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = lib_arg2
          arg3 = Gdk::EventSequence.new(lib_arg3, GICrystal::Transfer::None)
          ::Box(Proc(Float64, Float64, UInt32, Gdk::EventSequence, Nil)).unbox(box).call(arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Float64, Float64, UInt32, Gdk::EventSequence, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, lib_arg2 : UInt32, lib_arg3 : Pointer(Void), box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = lib_arg2
          arg3 = Gdk::EventSequence.new(lib_arg3, GICrystal::Transfer::None)
          ::Box(Proc(Float64, Float64, UInt32, Gdk::EventSequence, Nil)).unbox(box).call(arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::GestureClick, Float64, Float64, UInt32, Gdk::EventSequence, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, lib_arg2 : UInt32, lib_arg3 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::GestureClick.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = lib_arg2
          arg3 = Gdk::EventSequence.new(lib_arg3, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::GestureClick, Float64, Float64, UInt32, Gdk::EventSequence, Nil)).unbox(box).call(sender, arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::GestureClick, Float64, Float64, UInt32, Gdk::EventSequence, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, lib_arg1 : Float64, lib_arg2 : UInt32, lib_arg3 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::GestureClick.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          arg2 = lib_arg2
          arg3 = Gdk::EventSequence.new(lib_arg3, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::GestureClick, Float64, Float64, UInt32, Gdk::EventSequence, Nil)).unbox(box).call(sender, arg0, arg1, arg2, arg3)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
