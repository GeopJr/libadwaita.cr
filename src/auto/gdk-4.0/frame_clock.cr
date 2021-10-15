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
  # [method@Gdk.FrameClock.request_phase]. At some later point that makes sense
  # for the synchronization being implemented, the clock will process a frame and
  # emit signals for each phase that has been requested. (See the signals of the
  # `GdkFrameClock` class for documentation of the phases.
  # %GDK_FRAME_CLOCK_PHASE_UPDATE and the [signal@GdkFrameClock::update] signal
  # are most interesting for application writers, and are used to update the
  # animations, using the frame time given by [method@Gdk.FrameClock.get_frame_time].
  #
  # The frame time is reported in microseconds and generally in the same
  # timescale as g_get_monotonic_time(), however, it is not the same
  # as g_get_monotonic_time(). The frame time does not advance during
  # the time a frame is being painted, and outside of a frame, an attempt
  # is made so that all calls to [method@Gdk.FrameClock.get_frame_time] that
  # are called at a “similar” time get the same value. This means that
  # if different animations are timed by looking at the difference in
  # time between an initial value from [method@Gdk.FrameClock.get_frame_time]
  # and the value inside the [signal@GdkFrameClock::update] signal of the clock,
  # they will stay exactly synchronized.
  class FrameClock < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_frame_clock_get_type
    end

    def begin_updating : Nil
      # gdk_frame_clock_begin_updating: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_frame_clock_begin_updating(self)
    end

    def end_updating : Nil
      # gdk_frame_clock_end_updating: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_frame_clock_end_updating(self)
    end

    def current_timings : Gdk::FrameTimings?
      # gdk_frame_clock_get_current_timings: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_frame_clock_get_current_timings(self)
      Gdk::FrameTimings.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def fps : Float64
      # gdk_frame_clock_get_fps: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_frame_clock_get_fps(self)
      _retval
    end

    def frame_counter : Int64
      # gdk_frame_clock_get_frame_counter: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_frame_clock_get_frame_counter(self)
      _retval
    end

    def frame_time : Int64
      # gdk_frame_clock_get_frame_time: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_frame_clock_get_frame_time(self)
      _retval
    end

    def history_start : Int64
      # gdk_frame_clock_get_history_start: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_frame_clock_get_history_start(self)
      _retval
    end

    def refresh_info(base_time : Int64, presentation_time_return : Int64) : Nil
      # gdk_frame_clock_get_refresh_info: (Method)
      # @refresh_interval_return: (out) (transfer full) (optional)
      # @presentation_time_return: (out) (transfer full)
      # Returns: (transfer none)

      refresh_interval_return = Pointer(Int64).null

      LibGdk.gdk_frame_clock_get_refresh_info(self, base_time, refresh_interval_return, presentation_time_return)
    end

    def timings(frame_counter : Int64) : Gdk::FrameTimings?
      # gdk_frame_clock_get_timings: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_frame_clock_get_timings(self, frame_counter)
      Gdk::FrameTimings.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def request_phase(phase : Gdk::FrameClockPhase) : Nil
      # gdk_frame_clock_request_phase: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_frame_clock_request_phase(self, phase)
    end

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

      def connect(block : Proc(Gdk::FrameClock, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::FrameClock.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::FrameClock, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::FrameClock.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "after-paint")
      end
    end

    def after_paint_signal
      AfterPaintSignal.new(self)
    end

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

      def connect(block : Proc(Gdk::FrameClock, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::FrameClock.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::FrameClock, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::FrameClock.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "before-paint")
      end
    end

    def before_paint_signal
      BeforePaintSignal.new(self)
    end

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

      def connect(block : Proc(Gdk::FrameClock, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::FrameClock.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::FrameClock, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::FrameClock.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "flush-events")
      end
    end

    def flush_events_signal
      FlushEventsSignal.new(self)
    end

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

      def connect(block : Proc(Gdk::FrameClock, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::FrameClock.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::FrameClock, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::FrameClock.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "layout")
      end
    end

    def layout_signal
      LayoutSignal.new(self)
    end

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

      def connect(block : Proc(Gdk::FrameClock, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::FrameClock.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::FrameClock, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::FrameClock.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "paint")
      end
    end

    def paint_signal
      PaintSignal.new(self)
    end

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

      def connect(block : Proc(Gdk::FrameClock, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::FrameClock.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::FrameClock, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::FrameClock.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "resume-events")
      end
    end

    def resume_events_signal
      ResumeEventsSignal.new(self)
    end

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

      def connect(block : Proc(Gdk::FrameClock, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::FrameClock.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::FrameClock, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::FrameClock.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::FrameClock, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
