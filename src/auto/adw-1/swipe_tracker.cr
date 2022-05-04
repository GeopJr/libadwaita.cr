require "../g_object-2.0/object"
require "../gtk-4.0/orientable"

module Adw
  # A swipe tracker used in `#Carousel`, `#Flap` and `#Leaflet`.
  #
  # The `AdwSwipeTracker` object can be used for implementing widgets with swipe
  # gestures. It supports touch-based swipes, pointer dragging, and touchpad
  # scrolling.
  #
  # The widgets will probably want to expose the `SwipeTracker#enabled`
  # property. If they expect to use horizontal orientation,
  # `SwipeTracker#reversed` can be used for supporting RTL text
  # direction.
  @[GObject::GeneratedWrapper]
  class SwipeTracker < GObject::Object
    include Gtk::Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::SwipeTrackerClass), class_init,
        sizeof(LibAdw::SwipeTracker), instance_init, 0)
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

    def initialize(*, allow_long_swipes : Bool? = nil, allow_mouse_drag : Bool? = nil, enabled : Bool? = nil, orientation : Gtk::Orientation? = nil, reversed : Bool? = nil, swipeable : Adw::Swipeable? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if !allow_long_swipes.nil?
        (_names.to_unsafe + _n).value = "allow-long-swipes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allow_long_swipes)
        _n += 1
      end
      if !allow_mouse_drag.nil?
        (_names.to_unsafe + _n).value = "allow-mouse-drag".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allow_mouse_drag)
        _n += 1
      end
      if !enabled.nil?
        (_names.to_unsafe + _n).value = "enabled".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enabled)
        _n += 1
      end
      if !orientation.nil?
        (_names.to_unsafe + _n).value = "orientation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, orientation)
        _n += 1
      end
      if !reversed.nil?
        (_names.to_unsafe + _n).value = "reversed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, reversed)
        _n += 1
      end
      if !swipeable.nil?
        (_names.to_unsafe + _n).value = "swipeable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, swipeable)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SwipeTracker.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Creates a new `AdwSwipeTracker` for @widget.
    def initialize(swipeable : Adw::Swipeable)
      # adw_swipe_tracker_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibAdw.adw_swipe_tracker_new(swipeable)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets whether to allow swiping for more than one snap point at a time.
    def allow_long_swipes : Bool
      # adw_swipe_tracker_get_allow_long_swipes: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_swipe_tracker_get_allow_long_swipes(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether @self can be dragged with mouse pointer.
    def allow_mouse_drag : Bool
      # adw_swipe_tracker_get_allow_mouse_drag: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_swipe_tracker_get_allow_mouse_drag(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether @self is enabled.
    def enabled : Bool
      # adw_swipe_tracker_get_enabled: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_swipe_tracker_get_enabled(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether @self is reversing the swipe direction.
    def reversed : Bool
      # adw_swipe_tracker_get_reversed: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_swipe_tracker_get_reversed(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Get the widget @self is attached to.
    def swipeable : Adw::Swipeable
      # adw_swipe_tracker_get_swipeable: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_swipe_tracker_get_swipeable(self)

      # Return value handling

      Adw::Swipeable__Impl.new(_retval, GICrystal::Transfer::None)
    end

    # Sets whether to allow swiping for more than one snap point at a time.
    def allow_long_swipes=(allow_long_swipes : Bool) : Nil
      # adw_swipe_tracker_set_allow_long_swipes: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_swipe_tracker_set_allow_long_swipes(self, allow_long_swipes)

      # Return value handling
    end

    # Sets whether @self can be dragged with mouse pointer.
    def allow_mouse_drag=(allow_mouse_drag : Bool) : Nil
      # adw_swipe_tracker_set_allow_mouse_drag: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_swipe_tracker_set_allow_mouse_drag(self, allow_mouse_drag)

      # Return value handling
    end

    # Sets whether @self is enabled.
    def enabled=(enabled : Bool) : Nil
      # adw_swipe_tracker_set_enabled: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_swipe_tracker_set_enabled(self, enabled)

      # Return value handling
    end

    # Sets whether to reverse the swipe direction.
    def reversed=(reversed : Bool) : Nil
      # adw_swipe_tracker_set_reversed: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_swipe_tracker_set_reversed(self, reversed)

      # Return value handling
    end

    # Moves the current progress value by @delta.
    #
    # This can be used to adjust the current position if snap points move during
    # the gesture.
    def shift_position(delta : Float64) : Nil
      # adw_swipe_tracker_shift_position: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_swipe_tracker_shift_position(self, delta)

      # Return value handling
    end

    # This signal is emitted right before a swipe will be started, after the
    # drag threshold has been passed.
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

      def connect(handler : Proc(Adw::SwipeTracker, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Adw::SwipeTracker.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Adw::SwipeTracker, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Adw::SwipeTracker, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Adw::SwipeTracker.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Adw::SwipeTracker, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "begin-swipe")
      end
    end

    def begin_swipe_signal
      BeginSwipeSignal.new(self)
    end

    # This signal is emitted as soon as the gesture has stopped.
    #
    # The user is expected to animate the deceleration from the current progress
    # value to @to with an animation using @velocity as the initial velocity,
    # provided in pixels per second. `#SpringAnimation` is usually a good
    # fit for this.
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

      def connect(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect(handler : Proc(Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_velocity : Float64, lib_to : Float64, _lib_box : Pointer(Void)) {
          velocity = lib_velocity
          to = lib_to
          ::Box(Proc(Float64, Float64, Nil)).unbox(_lib_box).call(velocity, to)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_velocity : Float64, lib_to : Float64, _lib_box : Pointer(Void)) {
          velocity = lib_velocity
          to = lib_to
          ::Box(Proc(Float64, Float64, Nil)).unbox(_lib_box).call(velocity, to)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Adw::SwipeTracker, Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_velocity : Float64, lib_to : Float64, _lib_box : Pointer(Void)) {
          _sender = Adw::SwipeTracker.new(_lib_sender, GICrystal::Transfer::None)
          velocity = lib_velocity
          to = lib_to
          ::Box(Proc(Adw::SwipeTracker, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, velocity, to)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Adw::SwipeTracker, Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_velocity : Float64, lib_to : Float64, _lib_box : Pointer(Void)) {
          _sender = Adw::SwipeTracker.new(_lib_sender, GICrystal::Transfer::None)
          velocity = lib_velocity
          to = lib_to
          ::Box(Proc(Adw::SwipeTracker, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, velocity, to)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(velocity : Float64, to : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "end-swipe", velocity, to)
      end
    end

    def end_swipe_signal
      EndSwipeSignal.new(self)
    end

    # This signal is emitted when a possible swipe is detected.
    #
    # The @direction value can be used to restrict the swipe to a certain
    # direction.
    struct PrepareSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "prepare::#{@detail}" : "prepare"
      end

      def connect(&block : Proc(Adw::NavigationDirection, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Adw::NavigationDirection, Nil))
        connect(block)
      end

      def connect(handler : Proc(Adw::NavigationDirection, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_direction : UInt32, _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          direction = Adw::NavigationDirection.new(lib_direction, :none)
          ::Box(Proc(Adw::NavigationDirection, Nil)).unbox(_lib_box).call(direction)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Adw::NavigationDirection, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_direction : UInt32, _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          direction = Adw::NavigationDirection.new(lib_direction, :none)
          ::Box(Proc(Adw::NavigationDirection, Nil)).unbox(_lib_box).call(direction)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Adw::SwipeTracker, Adw::NavigationDirection, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_direction : UInt32, _lib_box : Pointer(Void)) {
          _sender = Adw::SwipeTracker.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          direction = Adw::NavigationDirection.new(lib_direction, :none)
          ::Box(Proc(Adw::SwipeTracker, Adw::NavigationDirection, Nil)).unbox(_lib_box).call(_sender, direction)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Adw::SwipeTracker, Adw::NavigationDirection, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_direction : UInt32, _lib_box : Pointer(Void)) {
          _sender = Adw::SwipeTracker.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          direction = Adw::NavigationDirection.new(lib_direction, :none)
          ::Box(Proc(Adw::SwipeTracker, Adw::NavigationDirection, Nil)).unbox(_lib_box).call(_sender, direction)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(direction : Adw::NavigationDirection) : Nil
        LibGObject.g_signal_emit_by_name(@source, "prepare", direction)
      end
    end

    def prepare_signal
      PrepareSignal.new(self)
    end

    # This signal is emitted every time the progress value changes.
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

      def connect(handler : Proc(Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_progress : Float64, _lib_box : Pointer(Void)) {
          progress = lib_progress
          ::Box(Proc(Float64, Nil)).unbox(_lib_box).call(progress)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_progress : Float64, _lib_box : Pointer(Void)) {
          progress = lib_progress
          ::Box(Proc(Float64, Nil)).unbox(_lib_box).call(progress)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Adw::SwipeTracker, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_progress : Float64, _lib_box : Pointer(Void)) {
          _sender = Adw::SwipeTracker.new(_lib_sender, GICrystal::Transfer::None)
          progress = lib_progress
          ::Box(Proc(Adw::SwipeTracker, Float64, Nil)).unbox(_lib_box).call(_sender, progress)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Adw::SwipeTracker, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_progress : Float64, _lib_box : Pointer(Void)) {
          _sender = Adw::SwipeTracker.new(_lib_sender, GICrystal::Transfer::None)
          progress = lib_progress
          ::Box(Proc(Adw::SwipeTracker, Float64, Nil)).unbox(_lib_box).call(_sender, progress)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
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
