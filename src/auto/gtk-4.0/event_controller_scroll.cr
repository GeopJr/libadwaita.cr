require "./event_controller"

module Gtk
  # `GtkEventControllerScroll` is an event controller that handles scroll
  # events.
  #
  # It is capable of handling both discrete and continuous scroll
  # events from mice or touchpads, abstracting them both with the
  # `Gtk::EventControllerScroll::#scroll` signal. Deltas in
  # the discrete case are multiples of 1.
  #
  # In the case of continuous scroll events, `GtkEventControllerScroll`
  # encloses all `Gtk::EventControllerScroll::#scroll` emissions
  # between two [signal@Gtk.EventControllerScroll::scroll-begin] and
  # [signal@Gtk.EventControllerScroll::scroll-end] signals.
  #
  # The behavior of the event controller can be modified by the flags
  # given at creation time, or modified at a later point through
  # `Gtk::EventControllerScroll#flags=` (e.g. because the scrolling
  # conditions of the widget changed).
  #
  # The controller can be set up to emit motion for either/both vertical
  # and horizontal scroll events through %GTK_EVENT_CONTROLLER_SCROLL_VERTICAL,
  # %GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL and %GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES.
  # If any axis is disabled, the respective `Gtk::EventControllerScroll::#scroll`
  # delta will be 0. Vertical scroll events will be translated to horizontal
  # motion for the devices incapable of horizontal scrolling.
  #
  # The event controller can also be forced to emit discrete events on all
  # devices through %GTK_EVENT_CONTROLLER_SCROLL_DISCRETE. This can be used
  # to implement discrete actions triggered through scroll events (e.g.
  # switching across combobox options).
  #
  # The %GTK_EVENT_CONTROLLER_SCROLL_KINETIC flag toggles the emission of the
  # `Gtk::EventControllerScroll::#decelerate` signal, emitted at the end
  # of scrolling with two X/Y velocity arguments that are consistent with the
  # motion that was received.
  @[GObject::GeneratedWrapper]
  class EventControllerScroll < EventController
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::EventControllerScrollClass), class_init,
        sizeof(LibGtk::EventControllerScroll), instance_init, 0)
    end

    GICrystal.define_new_method(EventControllerScroll, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `EventControllerScroll`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, flags : Gtk::EventControllerScrollFlags? = nil, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if !flags.nil?
        (_names.to_unsafe + _n).value = "flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flags)
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

      @pointer = LibGObject.g_object_new_with_properties(EventControllerScroll.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_event_controller_scroll_get_type
    end

    def flags=(value : Gtk::EventControllerScrollFlags) : Gtk::EventControllerScrollFlags
      unsafe_value = value

      LibGObject.g_object_set(self, "flags", unsafe_value, Pointer(Void).null)
      value
    end

    def flags : Gtk::EventControllerScrollFlags
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "flags", pointerof(value), Pointer(Void).null)
      Gtk::EventControllerScrollFlags.new(value)
    end

    # Creates a new event controller that will handle scroll events.
    def initialize(flags : Gtk::EventControllerScrollFlags)
      # gtk_event_controller_scroll_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_event_controller_scroll_new(flags)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the flags conditioning the scroll controller behavior.
    def flags : Gtk::EventControllerScrollFlags
      # gtk_event_controller_scroll_get_flags: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_event_controller_scroll_get_flags(@pointer)

      # Return value handling

      Gtk::EventControllerScrollFlags.new(_retval)
    end

    # Sets the flags conditioning scroll controller behavior.
    def flags=(flags : Gtk::EventControllerScrollFlags) : Nil
      # gtk_event_controller_scroll_set_flags: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_event_controller_scroll_set_flags(@pointer, flags)

      # Return value handling
    end

    # Emitted after scroll is finished if the
    # %GTK_EVENT_CONTROLLER_SCROLL_KINETIC flag is set.
    #
    # @vel_x and @vel_y express the initial velocity that was
    # imprinted by the scroll events. @vel_x and @vel_y are expressed in
    # pixels/ms.
    struct DecelerateSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "decelerate::#{@detail}" : "decelerate"
      end

      def connect(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, Nil))
        connect(block)
      end

      def connect(handler : Proc(Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_vel_x : Float64, lib_vel_y : Float64, _lib_box : Pointer(Void)) {
          vel_x = lib_vel_x
          vel_y = lib_vel_y
          ::Box(Proc(Float64, Float64, Nil)).unbox(_lib_box).call(vel_x, vel_y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_vel_x : Float64, lib_vel_y : Float64, _lib_box : Pointer(Void)) {
          vel_x = lib_vel_x
          vel_y = lib_vel_y
          ::Box(Proc(Float64, Float64, Nil)).unbox(_lib_box).call(vel_x, vel_y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::EventControllerScroll, Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_vel_x : Float64, lib_vel_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::EventControllerScroll.new(_lib_sender, GICrystal::Transfer::None)
          vel_x = lib_vel_x
          vel_y = lib_vel_y
          ::Box(Proc(Gtk::EventControllerScroll, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, vel_x, vel_y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::EventControllerScroll, Float64, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_vel_x : Float64, lib_vel_y : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::EventControllerScroll.new(_lib_sender, GICrystal::Transfer::None)
          vel_x = lib_vel_x
          vel_y = lib_vel_y
          ::Box(Proc(Gtk::EventControllerScroll, Float64, Float64, Nil)).unbox(_lib_box).call(_sender, vel_x, vel_y)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(vel_x : Float64, vel_y : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "decelerate", vel_x, vel_y)
      end
    end

    def decelerate_signal
      DecelerateSignal.new(self)
    end

    # Signals that the widget should scroll by the
    # amount specified by @dx and @dy.
    struct ScrollSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "scroll::#{@detail}" : "scroll"
      end

      def connect(&block : Proc(Float64, Float64, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Float64, Bool))
        connect(block)
      end

      def connect(handler : Proc(Float64, Float64, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_dx : Float64, lib_dy : Float64, _lib_box : Pointer(Void)) {
          dx = lib_dx
          dy = lib_dy
          ::Box(Proc(Float64, Float64, Bool)).unbox(_lib_box).call(dx, dy)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Float64, Float64, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_dx : Float64, lib_dy : Float64, _lib_box : Pointer(Void)) {
          dx = lib_dx
          dy = lib_dy
          ::Box(Proc(Float64, Float64, Bool)).unbox(_lib_box).call(dx, dy)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::EventControllerScroll, Float64, Float64, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_dx : Float64, lib_dy : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::EventControllerScroll.new(_lib_sender, GICrystal::Transfer::None)
          dx = lib_dx
          dy = lib_dy
          ::Box(Proc(Gtk::EventControllerScroll, Float64, Float64, Bool)).unbox(_lib_box).call(_sender, dx, dy)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::EventControllerScroll, Float64, Float64, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_dx : Float64, lib_dy : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::EventControllerScroll.new(_lib_sender, GICrystal::Transfer::None)
          dx = lib_dx
          dy = lib_dy
          ::Box(Proc(Gtk::EventControllerScroll, Float64, Float64, Bool)).unbox(_lib_box).call(_sender, dx, dy)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(dx : Float64, dy : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "scroll", dx, dy)
      end
    end

    def scroll_signal
      ScrollSignal.new(self)
    end

    # Signals that a new scrolling operation has begun.
    #
    # It will only be emitted on devices capable of it.
    struct ScrollBeginSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "scroll-begin::#{@detail}" : "scroll-begin"
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

      def connect(handler : Proc(Gtk::EventControllerScroll, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::EventControllerScroll.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EventControllerScroll, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::EventControllerScroll, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::EventControllerScroll.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EventControllerScroll, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "scroll-begin")
      end
    end

    def scroll_begin_signal
      ScrollBeginSignal.new(self)
    end

    # Signals that a scrolling operation has finished.
    #
    # It will only be emitted on devices capable of it.
    struct ScrollEndSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "scroll-end::#{@detail}" : "scroll-end"
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

      def connect(handler : Proc(Gtk::EventControllerScroll, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::EventControllerScroll.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EventControllerScroll, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::EventControllerScroll, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::EventControllerScroll.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EventControllerScroll, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "scroll-end")
      end
    end

    def scroll_end_signal
      ScrollEndSignal.new(self)
    end
  end
end
