require "./event_controller"

module Gtk
  # `GtkGesture` is the base class for gesture recognition.
  #
  # Although `GtkGesture` is quite generalized to serve as a base for
  # multi-touch gestures, it is suitable to implement single-touch and
  # pointer-based gestures (using the special %NULL `GdkEventSequence`
  # value for these).
  #
  # The number of touches that a `GtkGesture` need to be recognized is
  # controlled by the [property@Gtk.Gesture:n-points] property, if a
  # gesture is keeping track of less or more than that number of sequences,
  # it won't check whether the gesture is recognized.
  #
  # As soon as the gesture has the expected number of touches, it will check
  # regularly if it is recognized, the criteria to consider a gesture as
  # "recognized" is left to `GtkGesture` subclasses.
  #
  # A recognized gesture will then emit the following signals:
  #
  # - [signal@Gtk.Gesture::begin] when the gesture is recognized.
  # - [signal@Gtk.Gesture::update], whenever an input event is processed.
  # - [signal@Gtk.Gesture::end] when the gesture is no longer recognized.
  #
  # ## Event propagation
  #
  # In order to receive events, a gesture needs to set a propagation phase
  # through [method@Gtk.EventController.set_propagation_phase].
  #
  # In the capture phase, events are propagated from the toplevel down
  # to the target widget, and gestures that are attached to containers
  # above the widget get a chance to interact with the event before it
  # reaches the target.
  #
  # In the bubble phase, events are propagated up from the target widget
  # to the toplevel, and gestures that are attached to containers above
  # the widget get a chance to interact with events that have not been
  # handled yet.
  #
  # ## States of a sequence
  #
  # Whenever input interaction happens, a single event may trigger a cascade
  # of `GtkGesture`s, both across the parents of the widget receiving the
  # event and in parallel within an individual widget. It is a responsibility
  # of the widgets using those gestures to set the state of touch sequences
  # accordingly in order to enable cooperation of gestures around the
  # `GdkEventSequence`s triggering those.
  #
  # Within a widget, gestures can be grouped through [method@Gtk.Gesture.group].
  # Grouped gestures synchronize the state of sequences, so calling
  # [method@Gtk.Gesture.set_sequence_state] on one will effectively propagate
  # the state throughout the group.
  #
  # By default, all sequences start out in the %GTK_EVENT_SEQUENCE_NONE state,
  # sequences in this state trigger the gesture event handler, but event
  # propagation will continue unstopped by gestures.
  #
  # If a sequence enters into the %GTK_EVENT_SEQUENCE_DENIED state, the gesture
  # group will effectively ignore the sequence, letting events go unstopped
  # through the gesture, but the "slot" will still remain occupied while
  # the touch is active.
  #
  # If a sequence enters in the %GTK_EVENT_SEQUENCE_CLAIMED state, the gesture
  # group will grab all interaction on the sequence, by:
  #
  # - Setting the same sequence to %GTK_EVENT_SEQUENCE_DENIED on every other
  #   gesture group within the widget, and every gesture on parent widgets
  #   in the propagation chain.
  # - Emitting [signal@Gtk.Gesture::cancel] on every gesture in widgets
  #   underneath in the propagation chain.
  # - Stopping event propagation after the gesture group handles the event.
  #
  # Note: if a sequence is set early to %GTK_EVENT_SEQUENCE_CLAIMED on
  # %GDK_TOUCH_BEGIN/%GDK_BUTTON_PRESS (so those events are captured before
  # reaching the event widget, this implies %GTK_PHASE_CAPTURE), one similar
  # event will be emulated if the sequence changes to %GTK_EVENT_SEQUENCE_DENIED.
  # This way event coherence is preserved before event propagation is unstopped
  # again.
  #
  # Sequence states can't be changed freely.
  # See [method@Gtk.Gesture.set_sequence_state] to know about the possible
  # lifetimes of a `GdkEventSequence`.
  #
  # ## Touchpad gestures
  #
  # On the platforms that support it, `GtkGesture` will handle transparently
  # touchpad gesture events. The only precautions users of `GtkGesture` should
  # do to enable this support are:
  #
  # - If the gesture has %GTK_PHASE_NONE, ensuring events of type
  #   %GDK_TOUCHPAD_SWIPE and %GDK_TOUCHPAD_PINCH are handled by the `GtkGesture`
  class Gesture < EventController
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, n_points : UInt32? = nil, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

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
      if widget
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Gesture.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_gesture_get_type
    end

    def n_points=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "n-points", unsafe_value, Pointer(Void).null)
      value
    end

    def n_points : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "n-points", pointerof(value), Pointer(Void).null)
      value
    end

    def bounding_box : Gdk::Rectangle
      # gtk_gesture_get_bounding_box: (Method)
      # @rect: (out) (caller-allocates)
      # Returns: (transfer none)

      rect = Gdk::Rectangle.new

      _retval = LibGtk.gtk_gesture_get_bounding_box(self, rect)
      rect
    end

    def bounding_box_center(x : Float64, y : Float64) : Bool
      # gtk_gesture_get_bounding_box_center: (Method)
      # @x: (out) (transfer full)
      # @y: (out) (transfer full)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_gesture_get_bounding_box_center(self, x, y)
      GICrystal.to_bool(_retval)
    end

    def device : Gdk::Device?
      # gtk_gesture_get_device: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_gesture_get_device(self)
      Gdk::Device.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def group : GLib::List
      # gtk_gesture_get_group: (Method)
      # Returns: (transfer container)

      _retval = LibGtk.gtk_gesture_get_group(self)
      GLib::List(Gtk::Gesture).new(_retval, GICrystal::Transfer::Container)
    end

    def last_event(sequence : Gdk::EventSequence?) : Gdk::Event?
      # gtk_gesture_get_last_event: (Method)
      # @sequence: (nullable)
      # Returns: (transfer none)

      sequence = if sequence.nil?
                   Pointer(Void).null
                 else
                   sequence.to_unsafe
                 end

      _retval = LibGtk.gtk_gesture_get_last_event(self, sequence)
      Gdk::Event.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def last_updated_sequence : Gdk::EventSequence?
      # gtk_gesture_get_last_updated_sequence: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_gesture_get_last_updated_sequence(self)
      Gdk::EventSequence.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def point(sequence : Gdk::EventSequence?) : Bool
      # gtk_gesture_get_point: (Method)
      # @sequence: (nullable)
      # @x: (out) (transfer full) (optional)
      # @y: (out) (transfer full) (optional)
      # Returns: (transfer none)

      x = Pointer(Float64).null
      y = Pointer(Float64).null
      sequence = if sequence.nil?
                   Pointer(Void).null
                 else
                   sequence.to_unsafe
                 end

      _retval = LibGtk.gtk_gesture_get_point(self, sequence, x, y)
      GICrystal.to_bool(_retval)
    end

    def sequence_state(sequence : Gdk::EventSequence) : Gtk::EventSequenceState
      # gtk_gesture_get_sequence_state: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_gesture_get_sequence_state(self, sequence)
      Gtk::EventSequenceState.from_value(_retval)
    end

    def sequences : GLib::List
      # gtk_gesture_get_sequences: (Method)
      # Returns: (transfer container)

      _retval = LibGtk.gtk_gesture_get_sequences(self)
      GLib::List(Gdk::EventSequence).new(_retval, GICrystal::Transfer::Container)
    end

    def group(gesture : Gtk::Gesture) : Nil
      # gtk_gesture_group: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_gesture_group(self, gesture)
    end

    def handles_sequence(sequence : Gdk::EventSequence?) : Bool
      # gtk_gesture_handles_sequence: (Method)
      # @sequence: (nullable)
      # Returns: (transfer none)

      sequence = if sequence.nil?
                   Pointer(Void).null
                 else
                   sequence.to_unsafe
                 end

      _retval = LibGtk.gtk_gesture_handles_sequence(self, sequence)
      GICrystal.to_bool(_retval)
    end

    def is_active : Bool
      # gtk_gesture_is_active: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_gesture_is_active(self)
      GICrystal.to_bool(_retval)
    end

    def is_grouped_with(other : Gtk::Gesture) : Bool
      # gtk_gesture_is_grouped_with: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_gesture_is_grouped_with(self, other)
      GICrystal.to_bool(_retval)
    end

    def is_recognized : Bool
      # gtk_gesture_is_recognized: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_gesture_is_recognized(self)
      GICrystal.to_bool(_retval)
    end

    def set_sequence_state(sequence : Gdk::EventSequence, state : Gtk::EventSequenceState) : Bool
      # gtk_gesture_set_sequence_state: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_gesture_set_sequence_state(self, sequence, state)
      GICrystal.to_bool(_retval)
    end

    def state=(state : Gtk::EventSequenceState) : Bool
      # gtk_gesture_set_state: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_gesture_set_state(self, state)
      GICrystal.to_bool(_retval)
    end

    def ungroup : Nil
      # gtk_gesture_ungroup: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_gesture_ungroup(self)
    end

    struct BeginSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "begin::#{@detail}" : "begin"
      end

      def connect(&block : Proc(Gdk::EventSequence, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::EventSequence, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::EventSequence, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::EventSequence, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::EventSequence, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::EventSequence, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Gesture, Gdk::EventSequence, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Gesture.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Gesture, Gdk::EventSequence, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Gesture, Gdk::EventSequence, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Gesture.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Gesture, Gdk::EventSequence, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(sequence : Gdk::EventSequence) : Nil
        LibGObject.g_signal_emit_by_name(@source, "begin", sequence)
      end
    end

    def begin_signal
      BeginSignal.new(self)
    end

    struct CancelSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "cancel::#{@detail}" : "cancel"
      end

      def connect(&block : Proc(Gdk::EventSequence, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::EventSequence, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::EventSequence, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::EventSequence, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::EventSequence, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::EventSequence, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Gesture, Gdk::EventSequence, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Gesture.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Gesture, Gdk::EventSequence, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Gesture, Gdk::EventSequence, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Gesture.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Gesture, Gdk::EventSequence, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(sequence : Gdk::EventSequence) : Nil
        LibGObject.g_signal_emit_by_name(@source, "cancel", sequence)
      end
    end

    def cancel_signal
      CancelSignal.new(self)
    end

    struct EndSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "end::#{@detail}" : "end"
      end

      def connect(&block : Proc(Gdk::EventSequence, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::EventSequence, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::EventSequence, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::EventSequence, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::EventSequence, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::EventSequence, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Gesture, Gdk::EventSequence, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Gesture.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Gesture, Gdk::EventSequence, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Gesture, Gdk::EventSequence, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Gesture.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Gesture, Gdk::EventSequence, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(sequence : Gdk::EventSequence) : Nil
        LibGObject.g_signal_emit_by_name(@source, "end", sequence)
      end
    end

    def end_signal
      EndSignal.new(self)
    end

    struct SequenceStateChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "sequence-state-changed::#{@detail}" : "sequence-state-changed"
      end

      def connect(&block : Proc(Gdk::EventSequence, Gtk::EventSequenceState, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::EventSequence, Gtk::EventSequenceState, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::EventSequence, Gtk::EventSequenceState, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          arg0 = Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::EventSequenceState.from_value(lib_arg1)
          ::Box(Proc(Gdk::EventSequence, Gtk::EventSequenceState, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::EventSequence, Gtk::EventSequenceState, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          arg0 = Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::EventSequenceState.from_value(lib_arg1)
          ::Box(Proc(Gdk::EventSequence, Gtk::EventSequenceState, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Gesture, Gdk::EventSequence, Gtk::EventSequenceState, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Gesture.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::EventSequenceState.from_value(lib_arg1)
          ::Box(Proc(Gtk::Gesture, Gdk::EventSequence, Gtk::EventSequenceState, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Gesture, Gdk::EventSequence, Gtk::EventSequenceState, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Gesture.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::EventSequenceState.from_value(lib_arg1)
          ::Box(Proc(Gtk::Gesture, Gdk::EventSequence, Gtk::EventSequenceState, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(sequence : Gdk::EventSequence, state : Gtk::EventSequenceState) : Nil
        LibGObject.g_signal_emit_by_name(@source, "sequence-state-changed", sequence, state)
      end
    end

    def sequence_state_changed_signal
      SequenceStateChangedSignal.new(self)
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

      def connect(&block : Proc(Gdk::EventSequence, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::EventSequence, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::EventSequence, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::EventSequence, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::EventSequence, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::EventSequence, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Gesture, Gdk::EventSequence, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Gesture.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Gesture, Gdk::EventSequence, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Gesture, Gdk::EventSequence, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Gesture.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Gesture, Gdk::EventSequence, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(sequence : Gdk::EventSequence) : Nil
        LibGObject.g_signal_emit_by_name(@source, "update", sequence)
      end
    end

    def update_signal
      UpdateSignal.new(self)
    end
  end
end
