require "../g_object-2.0/object"
require "../gtk-4.0/orientable"

module Adw
  # A swipe tracker used in [class@Adw.Carousel] and [class@Adw.Leaflet].
  #
  # The `AdwSwipeTracker` object can be used for implementing widgets with swipe
  # gestures. It supports touch-based swipes, pointer dragging, and touchpad
  # scrolling.
  #
  # The widgets will probably want to expose the
  # [property@Adw.SwipeTracker:enabled] property. If they expect to use
  # horizontal orientation, [property@Adw.SwipeTracker:reversed] can be used for
  # supporting RTL text direction.
  class SwipeTracker < GObject::Object
    include Gtk::Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, allow_long_swipes : Bool? = nil, allow_mouse_drag : Bool? = nil, enabled : Bool? = nil, orientation : Gtk::Orientation? = nil, reversed : Bool? = nil, swipeable : Adw::Swipeable? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if allow_long_swipes
        (_names.to_unsafe + _n).value = "allow-long-swipes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allow_long_swipes)
        _n += 1
      end
      if allow_mouse_drag
        (_names.to_unsafe + _n).value = "allow-mouse-drag".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allow_mouse_drag)
        _n += 1
      end
      if enabled
        (_names.to_unsafe + _n).value = "enabled".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enabled)
        _n += 1
      end
      if orientation
        (_names.to_unsafe + _n).value = "orientation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, orientation)
        _n += 1
      end
      if reversed
        (_names.to_unsafe + _n).value = "reversed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, reversed)
        _n += 1
      end
      if swipeable
        (_names.to_unsafe + _n).value = "swipeable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, swipeable)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SwipeTracker.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_swipe_tracker_get_type
    end

    def allow_long_swipes=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "allow-long-swipes", unsafe_value, Pointer(Void).null)
      value
    end

    def allow_long_swipes? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "allow-long-swipes", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def allow_mouse_drag=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "allow-mouse-drag", unsafe_value, Pointer(Void).null)
      value
    end

    def allow_mouse_drag? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "allow-mouse-drag", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def enabled=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "enabled", unsafe_value, Pointer(Void).null)
      value
    end

    def enabled? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "enabled", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def reversed=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "reversed", unsafe_value, Pointer(Void).null)
      value
    end

    def reversed? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "reversed", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def swipeable=(value : Adw::Swipeable?) : Adw::Swipeable?
      unsafe_value = value

      LibGObject.g_object_set(self, "swipeable", unsafe_value, Pointer(Void).null)
      value
    end

    def swipeable : Adw::Swipeable?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "swipeable", pointerof(value), Pointer(Void).null)
      Adw::Swipeable__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def initialize(swipeable : Adw::Swipeable)
      # adw_swipe_tracker_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_swipe_tracker_new(swipeable)

      # Return value handling
      @pointer = _retval
    end

    def allow_long_swipes : Bool
      # adw_swipe_tracker_get_allow_long_swipes: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_swipe_tracker_get_allow_long_swipes(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def allow_mouse_drag : Bool
      # adw_swipe_tracker_get_allow_mouse_drag: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_swipe_tracker_get_allow_mouse_drag(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def enabled : Bool
      # adw_swipe_tracker_get_enabled: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_swipe_tracker_get_enabled(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def reversed : Bool
      # adw_swipe_tracker_get_reversed: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_swipe_tracker_get_reversed(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def swipeable : Adw::Swipeable
      # adw_swipe_tracker_get_swipeable: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_swipe_tracker_get_swipeable(self)

      # Return value handling
      Adw::Swipeable__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def allow_long_swipes=(allow_long_swipes : Bool) : Nil
      # adw_swipe_tracker_set_allow_long_swipes: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_swipe_tracker_set_allow_long_swipes(self, allow_long_swipes)

      # Return value handling
    end

    def allow_mouse_drag=(allow_mouse_drag : Bool) : Nil
      # adw_swipe_tracker_set_allow_mouse_drag: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_swipe_tracker_set_allow_mouse_drag(self, allow_mouse_drag)

      # Return value handling
    end

    def enabled=(enabled : Bool) : Nil
      # adw_swipe_tracker_set_enabled: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_swipe_tracker_set_enabled(self, enabled)

      # Return value handling
    end

    def reversed=(reversed : Bool) : Nil
      # adw_swipe_tracker_set_reversed: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_swipe_tracker_set_reversed(self, reversed)

      # Return value handling
    end

    def shift_position(delta : Float64) : Nil
      # adw_swipe_tracker_shift_position: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_swipe_tracker_shift_position(self, delta)

      # Return value handling
    end

    struct BeginSwipeSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "begin-swipe::#{@detail}" : "begin-swipe"
      end

      def connect(&block : Proc(Adw::NavigationDirection, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Adw::NavigationDirection, Nil))
        connect(block)
      end

      def connect(block : Proc(Adw::NavigationDirection, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Adw::NavigationDirection.from_value(lib_arg0)
          ::Box(Proc(Adw::NavigationDirection, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::NavigationDirection, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Adw::NavigationDirection.from_value(lib_arg0)
          ::Box(Proc(Adw::NavigationDirection, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Adw::SwipeTracker, Adw::NavigationDirection, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Adw::SwipeTracker.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Adw::NavigationDirection.from_value(lib_arg0)
          ::Box(Proc(Adw::SwipeTracker, Adw::NavigationDirection, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::SwipeTracker, Adw::NavigationDirection, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Adw::SwipeTracker.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Adw::NavigationDirection.from_value(lib_arg0)
          ::Box(Proc(Adw::SwipeTracker, Adw::NavigationDirection, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(direction : Adw::NavigationDirection) : Nil
        LibGObject.g_signal_emit_by_name(@source, "begin-swipe", direction)
      end
    end

    def begin_swipe_signal
      BeginSwipeSignal.new(self)
    end

    struct EndSwipeSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "end-swipe::#{@detail}" : "end-swipe"
      end

      def connect(&block : Proc(Int64, Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Int64, Float64, Nil))
        connect(block)
      end

      def connect(block : Proc(Int64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Int64, Float64, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Int64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int64, lib_arg1 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Int64, Float64, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Adw::SwipeTracker, Int64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Adw::SwipeTracker.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Adw::SwipeTracker, Int64, Float64, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::SwipeTracker, Int64, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int64, lib_arg1 : Float64, box : Pointer(Void)) {
          sender = Adw::SwipeTracker.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          arg1 = lib_arg1
          ::Box(Proc(Adw::SwipeTracker, Int64, Float64, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(duration : Int64, to : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "end-swipe", duration, to)
      end
    end

    def end_swipe_signal
      EndSwipeSignal.new(self)
    end

    struct UpdateSwipeSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "update-swipe::#{@detail}" : "update-swipe"
      end

      def connect(&block : Proc(Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Nil))
        connect(block)
      end

      def connect(block : Proc(Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          ::Box(Proc(Float64, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          ::Box(Proc(Float64, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Adw::SwipeTracker, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, box : Pointer(Void)) {
          sender = Adw::SwipeTracker.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Adw::SwipeTracker, Float64, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::SwipeTracker, Float64, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, box : Pointer(Void)) {
          sender = Adw::SwipeTracker.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Adw::SwipeTracker, Float64, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(progress : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "update-swipe", progress)
      end
    end

    def update_swipe_signal
      UpdateSwipeSignal.new(self)
    end
  end
end
