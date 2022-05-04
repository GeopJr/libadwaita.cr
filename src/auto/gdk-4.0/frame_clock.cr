require "../g_object-2.0/object"

module Gdk
  # A `GdkFrameClock` tells the application when to update and repaint
  # a surface.
  #
  # This may be synced to the vertical refresh rate of the monitor, for example.
  # Even when the frame clock uses a simple timer rather than a hardware-based
  # vertical sync, the frame clock helps because it ensures everything paints at
  # the same time (reducing the total number of frames).
  #
  # The frame clock can also automatically stop painting when it knows the frames
  # will not be visible, or scale back animation framerates.
  #
  # `GdkFrameClock` is designed to be compatible with an OpenGL-based implementation
  # or with mozRequestAnimationFrame in Firefox, for example.
  #
  # A frame clock is idle until someone requests a frame with
  # `Gdk::FrameClock#request_phase`. At some later point that makes sense
  # for the synchronization being implemented, the clock will process a frame and
  # emit signals for each phase that has been requested. (See the signals of the
  # `GdkFrameClock` class for documentation of the phases.
  # %GDK_FRAME_CLOCK_PHASE_UPDATE and the `GdkFrameClock::#update` signal
  # are most interesting for application writers, and are used to update the
  # animations, using the frame time given by `Gdk::FrameClock#frame_time`.
  #
  # The frame time is reported in microseconds and generally in the same
  # timescale as g_get_monotonic_time(), however, it is not the same
  # as g_get_monotonic_time(). The frame time does not advance during
  # the time a frame is being painted, and outside of a frame, an attempt
  # is made so that all calls to `Gdk::FrameClock#frame_time` that
  # are called at a “similar” time get the same value. This means that
  # if different animations are timed by looking at the difference in
  # time between an initial value from `Gdk::FrameClock#frame_time`
  # and the value inside the `GdkFrameClock::#update` signal of the clock,
  # they will stay exactly synchronized.
  @[GObject::GeneratedWrapper]
  class FrameClock < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGdk::FrameClockClass), class_init,
        sizeof(LibGdk::FrameClock), instance_init, 0)
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

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_frame_clock_get_type
    end

    # Starts updates for an animation.
    #
    # Until a matching call to `Gdk::FrameClock#end_updating` is made,
    # the frame clock will continually request a new frame with the
    # %GDK_FRAME_CLOCK_PHASE_UPDATE phase. This function may be called multiple
    # times and frames will be requested until gdk_frame_clock_end_updating()
    # is called the same number of times.
    def begin_updating : Nil
      # gdk_frame_clock_begin_updating: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_frame_clock_begin_updating(self)

      # Return value handling
    end

    # Stops updates for an animation.
    #
    # See the documentation for `Gdk::FrameClock#begin_updating`.
    def end_updating : Nil
      # gdk_frame_clock_end_updating: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_frame_clock_end_updating(self)

      # Return value handling
    end

    # Gets the frame timings for the current frame.
    def current_timings : Gdk::FrameTimings?
      # gdk_frame_clock_get_current_timings: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_frame_clock_get_current_timings(self)

      # Return value handling

      Gdk::FrameTimings.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Calculates the current frames-per-second, based on the
    # frame timings of @frame_clock.
    def fps : Float64
      # gdk_frame_clock_get_fps: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_frame_clock_get_fps(self)

      # Return value handling

      _retval
    end

    # `GdkFrameClock` maintains a 64-bit counter that increments for
    # each frame drawn.
    def frame_counter : Int64
      # gdk_frame_clock_get_frame_counter: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_frame_clock_get_frame_counter(self)

      # Return value handling

      _retval
    end

    # Gets the time that should currently be used for animations.
    #
    # Inside the processing of a frame, it’s the time used to compute the
    # animation position of everything in a frame. Outside of a frame, it's
    # the time of the conceptual “previous frame,” which may be either
    # the actual previous frame time, or if that’s too old, an updated
    # time.
    def frame_time : Int64
      # gdk_frame_clock_get_frame_time: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_frame_clock_get_frame_time(self)

      # Return value handling

      _retval
    end

    # Returns the frame counter for the oldest frame available in history.
    #
    # `GdkFrameClock` internally keeps a history of `GdkFrameTimings`
    # objects for recent frames that can be retrieved with
    # `Gdk::FrameClock#timings`. The set of stored frames
    # is the set from the counter values given by
    # `Gdk::FrameClock#history_start` and
    # `Gdk::FrameClock#frame_counter`, inclusive.
    def history_start : Int64
      # gdk_frame_clock_get_history_start: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_frame_clock_get_history_start(self)

      # Return value handling

      _retval
    end

    # Predicts a presentation time, based on history.
    #
    # Using the frame history stored in the frame clock, finds the last
    # known presentation time and refresh interval, and assuming that
    # presentation times are separated by the refresh interval,
    # predicts a presentation time that is a multiple of the refresh
    # interval after the last presentation time, and later than @base_time.
    def refresh_info(base_time : Int64, presentation_time_return : Int64) : Nil
      # gdk_frame_clock_get_refresh_info: (Method)
      # @refresh_interval_return: (out) (transfer full) (optional)
      # @presentation_time_return: (out) (transfer full)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      refresh_interval_return = Pointer(Int64).null
      # C call
      LibGdk.gdk_frame_clock_get_refresh_info(self, base_time, refresh_interval_return, presentation_time_return)

      # Return value handling
    end

    # Retrieves a `GdkFrameTimings` object holding timing information
    # for the current frame or a recent frame.
    #
    # The `GdkFrameTimings` object may not yet be complete: see
    # `Gdk::FrameTimings#complete` and
    # `Gdk::FrameClock#history_start`.
    def timings(frame_counter : Int64) : Gdk::FrameTimings?
      # gdk_frame_clock_get_timings: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_frame_clock_get_timings(self, frame_counter)

      # Return value handling

      Gdk::FrameTimings.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Asks the frame clock to run a particular phase.
    #
    # The signal corresponding the requested phase will be emitted the next
    # time the frame clock processes. Multiple calls to
    # gdk_frame_clock_request_phase() will be combined together
    # and only one frame processed. If you are displaying animated
    # content and want to continually request the
    # %GDK_FRAME_CLOCK_PHASE_UPDATE phase for a period of time,
    # you should use `Gdk::FrameClock#begin_updating` instead,
    # since this allows GTK to adjust system parameters to get maximally
    # smooth animations.
    def request_phase(phase : Gdk::FrameClockPhase) : Nil
      # gdk_frame_clock_request_phase: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_frame_clock_request_phase(self, phase)

      # Return value handling
    end

    # This signal ends processing of the frame.
    #
    # Applications should generally not handle this signal.
    struct AfterPaintSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "after-paint::#{@detail}" : "after-paint"
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

      def connect(handler : Proc(Gdk::FrameClock, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::FrameClock.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gdk::FrameClock, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::FrameClock.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "after-paint")
      end
    end

    def after_paint_signal
      AfterPaintSignal.new(self)
    end

    # Begins processing of the frame.
    #
    # Applications should generally not handle this signal.
    struct BeforePaintSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "before-paint::#{@detail}" : "before-paint"
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

      def connect(handler : Proc(Gdk::FrameClock, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::FrameClock.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gdk::FrameClock, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::FrameClock.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "before-paint")
      end
    end

    def before_paint_signal
      BeforePaintSignal.new(self)
    end

    # Used to flush pending motion events that are being batched up and
    # compressed together.
    #
    # Applications should not handle this signal.
    struct FlushEventsSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "flush-events::#{@detail}" : "flush-events"
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

      def connect(handler : Proc(Gdk::FrameClock, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::FrameClock.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gdk::FrameClock, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::FrameClock.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "flush-events")
      end
    end

    def flush_events_signal
      FlushEventsSignal.new(self)
    end

    # Emitted as the second step of toolkit and application processing
    # of the frame.
    #
    # Any work to update sizes and positions of application elements
    # should be performed. GTK normally handles this internally.
    struct LayoutSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "layout::#{@detail}" : "layout"
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

      def connect(handler : Proc(Gdk::FrameClock, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::FrameClock.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gdk::FrameClock, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::FrameClock.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "layout")
      end
    end

    def layout_signal
      LayoutSignal.new(self)
    end

    # Emitted as the third step of toolkit and application processing
    # of the frame.
    #
    # The frame is repainted. GDK normally handles this internally and
    # emits `Gdk::Surface::#render` signals which are turned into
    # `Gtk::Widget::#snapshot` signals by GTK.
    struct PaintSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "paint::#{@detail}" : "paint"
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

      def connect(handler : Proc(Gdk::FrameClock, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::FrameClock.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gdk::FrameClock, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::FrameClock.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "paint")
      end
    end

    def paint_signal
      PaintSignal.new(self)
    end

    # Emitted after processing of the frame is finished.
    #
    # This signal is handled internally by GTK to resume normal
    # event processing. Applications should not handle this signal.
    struct ResumeEventsSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "resume-events::#{@detail}" : "resume-events"
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

      def connect(handler : Proc(Gdk::FrameClock, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::FrameClock.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gdk::FrameClock, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::FrameClock.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "resume-events")
      end
    end

    def resume_events_signal
      ResumeEventsSignal.new(self)
    end

    # Emitted as the first step of toolkit and application processing
    # of the frame.
    #
    # Animations should be updated using `Gdk::FrameClock#frame_time`.
    # Applications can connect directly to this signal, or use
    # `Gtk::Widget#add_tick_callback` as a more convenient interface.
    struct UpdateSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "update::#{@detail}" : "update"
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

      def connect(handler : Proc(Gdk::FrameClock, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::FrameClock.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gdk::FrameClock, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::FrameClock.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "update")
      end
    end

    def update_signal
      UpdateSignal.new(self)
    end
  end
end
