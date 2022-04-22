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
  # - `Gtk::Gesture::#begin` when the gesture is recognized.
  # - `Gtk::Gesture::#update`, whenever an input event is processed.
  # - `Gtk::Gesture::#end` when the gesture is no longer recognized.
  #
  # ## Event propagation
  #
  # In order to receive events, a gesture needs to set a propagation phase
  # through `Gtk::EventController#propagation_phase=`.
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
  # Within a widget, gestures can be grouped through `Gtk::Gesture#group`.
  # Grouped gestures synchronize the state of sequences, so calling
  # `Gtk::Gesture#sequence_state=` on one will effectively propagate
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
  # - Emitting `Gtk::Gesture::#cancel` on every gesture in widgets
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
  # See `Gtk::Gesture#sequence_state=` to know about the possible
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
  @[GObject::GeneratedWrapper]
  class Gesture < EventController
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::GestureClass), class_init,
        sizeof(LibGtk::Gesture), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, n_points : UInt32? = nil, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

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
      if !widget.nil?
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Gesture.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
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

    # If there are touch sequences being currently handled by @gesture,
    # returns %TRUE and fills in @rect with the bounding box containing
    # all active touches.
    #
    # Otherwise, %FALSE will be returned.
    #
    # Note: This function will yield unexpected results on touchpad
    # gestures. Since there is no correlation between physical and
    # pixel distances, these will look as if constrained in an
    # infinitely small area, @rect width and height will thus be 0
    # regardless of the number of touchpoints.
    def bounding_box : Gdk::Rectangle
      # gtk_gesture_get_bounding_box: (Method)
      # @rect: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      rect = Gdk::Rectangle.new

      # C call
      _retval = LibGtk.gtk_gesture_get_bounding_box(self, rect)

      # Return value handling

      rect
    end

    # If there are touch sequences being currently handled by @gesture,
    # returns %TRUE and fills in @x and @y with the center of the bounding
    # box containing all active touches.
    #
    # Otherwise, %FALSE will be returned.
    def bounding_box_center(x : Float64, y : Float64) : Bool
      # gtk_gesture_get_bounding_box_center: (Method)
      # @x: (out) (transfer full)
      # @y: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gesture_get_bounding_box_center(self, x, y)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the logical `GdkDevice` that is currently operating
    # on @gesture.
    #
    # This returns %NULL if the gesture is not being interacted.
    def device : Gdk::Device?
      # gtk_gesture_get_device: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gesture_get_device(self)

      # Return value handling

      Gdk::Device.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns all gestures in the group of @gesture
    def group : GLib::List
      # gtk_gesture_get_group: (Method)
      # Returns: (transfer container)

      # C call
      _retval = LibGtk.gtk_gesture_get_group(self)

      # Return value handling

      GLib::List(Gtk::Gesture).new(_retval, GICrystal::Transfer::Container)
    end

    # Returns the last event that was processed for @sequence.
    #
    # Note that the returned pointer is only valid as long as the
    # @sequence is still interpreted by the @gesture. If in doubt,
    # you should make a copy of the event.
    def last_event(sequence : Gdk::EventSequence?) : Gdk::Event?
      # gtk_gesture_get_last_event: (Method)
      # @sequence: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      sequence = if sequence.nil?
                   Pointer(Void).null
                 else
                   sequence.to_unsafe
                 end

      # C call
      _retval = LibGtk.gtk_gesture_get_last_event(self, sequence)

      # Return value handling

      Gdk::Event.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the `GdkEventSequence` that was last updated on @gesture.
    def last_updated_sequence : Gdk::EventSequence?
      # gtk_gesture_get_last_updated_sequence: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gesture_get_last_updated_sequence(self)

      # Return value handling

      Gdk::EventSequence.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # If @sequence is currently being interpreted by @gesture,
    # returns %TRUE and fills in @x and @y with the last coordinates
    # stored for that event sequence.
    #
    # The coordinates are always relative to the widget allocation.
    def point(sequence : Gdk::EventSequence?) : Bool
      # gtk_gesture_get_point: (Method)
      # @sequence: (nullable)
      # @x: (out) (transfer full) (optional)
      # @y: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      sequence = if sequence.nil?
                   Pointer(Void).null
                 else
                   sequence.to_unsafe
                 end

      # Generator::OutArgUsedInReturnPlan
      x = Pointer(Float64).null
      # Generator::OutArgUsedInReturnPlan
      y = Pointer(Float64).null

      # C call
      _retval = LibGtk.gtk_gesture_get_point(self, sequence, x, y)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the @sequence state, as seen by @gesture.
    def sequence_state(sequence : Gdk::EventSequence) : Gtk::EventSequenceState
      # gtk_gesture_get_sequence_state: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gesture_get_sequence_state(self, sequence)

      # Return value handling

      Gtk::EventSequenceState.new(_retval)
    end

    # Returns the list of `GdkEventSequences` currently being interpreted
    # by @gesture.
    def sequences : GLib::List
      # gtk_gesture_get_sequences: (Method)
      # Returns: (transfer container)

      # C call
      _retval = LibGtk.gtk_gesture_get_sequences(self)

      # Return value handling

      GLib::List(Gdk::EventSequence).new(_retval, GICrystal::Transfer::Container)
    end

    # Adds @gesture to the same group than @group_gesture.
    #
    # Gestures are by default isolated in their own groups.
    #
    # Both gestures must have been added to the same widget before
    # they can be grouped.
    #
    # When gestures are grouped, the state of `GdkEventSequences`
    # is kept in sync for all of those, so calling
    # `Gtk::Gesture#sequence_state=`, on one will transfer
    # the same value to the others.
    #
    # Groups also perform an "implicit grabbing" of sequences, if a
    # `GdkEventSequence` state is set to %GTK_EVENT_SEQUENCE_CLAIMED
    # on one group, every other gesture group attached to the same
    # `GtkWidget` will switch the state for that sequence to
    # %GTK_EVENT_SEQUENCE_DENIED.
    def group(gesture : Gtk::Gesture) : Nil
      # gtk_gesture_group: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_gesture_group(self, gesture)

      # Return value handling
    end

    # Returns %TRUE if @gesture is currently handling events
    # corresponding to @sequence.
    def handles_sequence(sequence : Gdk::EventSequence?) : Bool
      # gtk_gesture_handles_sequence: (Method)
      # @sequence: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      sequence = if sequence.nil?
                   Pointer(Void).null
                 else
                   sequence.to_unsafe
                 end

      # C call
      _retval = LibGtk.gtk_gesture_handles_sequence(self, sequence)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns %TRUE if the gesture is currently active.
    #
    # A gesture is active while there are touch sequences
    # interacting with it.
    def is_active : Bool
      # gtk_gesture_is_active: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gesture_is_active(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns %TRUE if both gestures pertain to the same group.
    def is_grouped_with(other : Gtk::Gesture) : Bool
      # gtk_gesture_is_grouped_with: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gesture_is_grouped_with(self, other)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns %TRUE if the gesture is currently recognized.
    #
    # A gesture is recognized if there are as many interacting
    # touch sequences as required by @gesture.
    def is_recognized : Bool
      # gtk_gesture_is_recognized: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gesture_is_recognized(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the state of @sequence in @gesture.
    #
    # Sequences start in state %GTK_EVENT_SEQUENCE_NONE, and whenever
    # they change state, they can never go back to that state. Likewise,
    # sequences in state %GTK_EVENT_SEQUENCE_DENIED cannot turn back to
    # a not denied state. With these rules, the lifetime of an event
    # sequence is constrained to the next four:
    #
    # * None
    # * None → Denied
    # * None → Claimed
    # * None → Claimed → Denied
    #
    # Note: Due to event handling ordering, it may be unsafe to set the
    # state on another gesture within a `Gtk::Gesture::#begin` signal
    # handler, as the callback might be executed before the other gesture
    # knows about the sequence. A safe way to perform this could be:
    #
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # static void
    # first_gesture_begin_cb (GtkGesture       *first_gesture,
    #                         GdkEventSequence *sequence,
    #                         gpointer          user_data)
    # {
    #   gtk_gesture_set_sequence_state (first_gesture, sequence, GTK_EVENT_SEQUENCE_CLAIMED);
    #   gtk_gesture_set_sequence_state (second_gesture, sequence, GTK_EVENT_SEQUENCE_DENIED);
    # }
    #
    # static void
    # second_gesture_begin_cb (GtkGesture       *second_gesture,
    #                          GdkEventSequence *sequence,
    #                          gpointer          user_data)
    # {
    #   if (gtk_gesture_get_sequence_state (first_gesture, sequence) == GTK_EVENT_SEQUENCE_CLAIMED)
    #     gtk_gesture_set_sequence_state (second_gesture, sequence, GTK_EVENT_SEQUENCE_DENIED);
    # }
    # ```
    #
    # If both gestures are in the same group, just set the state on
    # the gesture emitting the event, the sequence will be already
    # be initialized to the group's global state when the second
    # gesture processes the event.
    def set_sequence_state(sequence : Gdk::EventSequence, state : Gtk::EventSequenceState) : Bool
      # gtk_gesture_set_sequence_state: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gesture_set_sequence_state(self, sequence, state)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the state of all sequences that @gesture is currently
    # interacting with.
    #
    # See `Gtk::Gesture#sequence_state=` for more details
    # on sequence states.
    def state=(state : Gtk::EventSequenceState) : Bool
      # gtk_gesture_set_state: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_gesture_set_state(self, state)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Separates @gesture into an isolated group.
    def ungroup : Nil
      # gtk_gesture_ungroup: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_gesture_ungroup(self)

      # Return value handling
    end

    # Emitted when the gesture is recognized.
    #
    # This means the number of touch sequences matches
    # [property@Gtk.Gesture:n-points].
    #
    # Note: These conditions may also happen when an extra touch
    # (eg. a third touch on a 2-touches gesture) is lifted, in that
    # situation @sequence won't pertain to the current set of active
    # touches, so don't rely on this being true.
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

      def connect(&block : Proc(Gdk::EventSequence?, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::EventSequence?, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::EventSequence?, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = (lib_arg0.null? ? nil : Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None))
          ::Box(Proc(Gdk::EventSequence?, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::EventSequence?, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = (lib_arg0.null? ? nil : Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None))
          ::Box(Proc(Gdk::EventSequence?, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Gesture, Gdk::EventSequence?, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Gesture.new(lib_sender, GICrystal::Transfer::None)
          arg0 = (lib_arg0.null? ? nil : Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None))
          ::Box(Proc(Gtk::Gesture, Gdk::EventSequence?, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Gesture, Gdk::EventSequence?, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Gesture.new(lib_sender, GICrystal::Transfer::None)
          arg0 = (lib_arg0.null? ? nil : Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None))
          ::Box(Proc(Gtk::Gesture, Gdk::EventSequence?, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(sequence : Gdk::EventSequence?) : Nil
        LibGObject.g_signal_emit_by_name(@source, "begin", sequence)
      end
    end

    def begin_signal
      BeginSignal.new(self)
    end

    # Emitted whenever a sequence is cancelled.
    #
    # This usually happens on active touches when
    # `Gtk::EventController#reset` is called on @gesture
    # (manually, due to grabs...), or the individual @sequence
    # was claimed by parent widgets' controllers (see
    # `Gtk::Gesture#sequence_state=`).
    #
    # @gesture must forget everything about @sequence as in
    # response to this signal.
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

      def connect(&block : Proc(Gdk::EventSequence?, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::EventSequence?, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::EventSequence?, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = (lib_arg0.null? ? nil : Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None))
          ::Box(Proc(Gdk::EventSequence?, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::EventSequence?, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = (lib_arg0.null? ? nil : Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None))
          ::Box(Proc(Gdk::EventSequence?, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Gesture, Gdk::EventSequence?, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Gesture.new(lib_sender, GICrystal::Transfer::None)
          arg0 = (lib_arg0.null? ? nil : Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None))
          ::Box(Proc(Gtk::Gesture, Gdk::EventSequence?, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Gesture, Gdk::EventSequence?, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Gesture.new(lib_sender, GICrystal::Transfer::None)
          arg0 = (lib_arg0.null? ? nil : Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None))
          ::Box(Proc(Gtk::Gesture, Gdk::EventSequence?, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(sequence : Gdk::EventSequence?) : Nil
        LibGObject.g_signal_emit_by_name(@source, "cancel", sequence)
      end
    end

    def cancel_signal
      CancelSignal.new(self)
    end

    # Emitted when @gesture either stopped recognizing the event
    # sequences as something to be handled, or the number of touch
    # sequences became higher or lower than [property@Gtk.Gesture:n-points].
    #
    # Note: @sequence might not pertain to the group of sequences that
    # were previously triggering recognition on @gesture (ie. a just
    # pressed touch sequence that exceeds [property@Gtk.Gesture:n-points]).
    # This situation may be detected by checking through
    # `Gtk::Gesture#handles_sequence`.
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

      def connect(&block : Proc(Gdk::EventSequence?, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::EventSequence?, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::EventSequence?, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = (lib_arg0.null? ? nil : Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None))
          ::Box(Proc(Gdk::EventSequence?, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::EventSequence?, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = (lib_arg0.null? ? nil : Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None))
          ::Box(Proc(Gdk::EventSequence?, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Gesture, Gdk::EventSequence?, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Gesture.new(lib_sender, GICrystal::Transfer::None)
          arg0 = (lib_arg0.null? ? nil : Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None))
          ::Box(Proc(Gtk::Gesture, Gdk::EventSequence?, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Gesture, Gdk::EventSequence?, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Gesture.new(lib_sender, GICrystal::Transfer::None)
          arg0 = (lib_arg0.null? ? nil : Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None))
          ::Box(Proc(Gtk::Gesture, Gdk::EventSequence?, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(sequence : Gdk::EventSequence?) : Nil
        LibGObject.g_signal_emit_by_name(@source, "end", sequence)
      end
    end

    def end_signal
      EndSignal.new(self)
    end

    # Emitted whenever a sequence state changes.
    #
    # See `Gtk::Gesture#sequence_state=` to know
    # more about the expectable sequence lifetimes.
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

      def connect(&block : Proc(Gdk::EventSequence?, Gtk::EventSequenceState, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::EventSequence?, Gtk::EventSequenceState, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::EventSequence?, Gtk::EventSequenceState, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          arg0 = (lib_arg0.null? ? nil : Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None))
          arg1 = Gtk::EventSequenceState.new(lib_arg1)
          ::Box(Proc(Gdk::EventSequence?, Gtk::EventSequenceState, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::EventSequence?, Gtk::EventSequenceState, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          arg0 = (lib_arg0.null? ? nil : Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None))
          arg1 = Gtk::EventSequenceState.new(lib_arg1)
          ::Box(Proc(Gdk::EventSequence?, Gtk::EventSequenceState, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Gesture, Gdk::EventSequence?, Gtk::EventSequenceState, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Gesture.new(lib_sender, GICrystal::Transfer::None)
          arg0 = (lib_arg0.null? ? nil : Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None))
          arg1 = Gtk::EventSequenceState.new(lib_arg1)
          ::Box(Proc(Gtk::Gesture, Gdk::EventSequence?, Gtk::EventSequenceState, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Gesture, Gdk::EventSequence?, Gtk::EventSequenceState, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Gesture.new(lib_sender, GICrystal::Transfer::None)
          arg0 = (lib_arg0.null? ? nil : Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None))
          arg1 = Gtk::EventSequenceState.new(lib_arg1)
          ::Box(Proc(Gtk::Gesture, Gdk::EventSequence?, Gtk::EventSequenceState, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(sequence : Gdk::EventSequence?, state : Gtk::EventSequenceState) : Nil
        LibGObject.g_signal_emit_by_name(@source, "sequence-state-changed", sequence, state)
      end
    end

    def sequence_state_changed_signal
      SequenceStateChangedSignal.new(self)
    end

    # Emitted whenever an event is handled while the gesture is recognized.
    #
    # @sequence is guaranteed to pertain to the set of active touches.
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

      def connect(&block : Proc(Gdk::EventSequence?, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::EventSequence?, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::EventSequence?, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = (lib_arg0.null? ? nil : Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None))
          ::Box(Proc(Gdk::EventSequence?, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::EventSequence?, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = (lib_arg0.null? ? nil : Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None))
          ::Box(Proc(Gdk::EventSequence?, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Gesture, Gdk::EventSequence?, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Gesture.new(lib_sender, GICrystal::Transfer::None)
          arg0 = (lib_arg0.null? ? nil : Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None))
          ::Box(Proc(Gtk::Gesture, Gdk::EventSequence?, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Gesture, Gdk::EventSequence?, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Gesture.new(lib_sender, GICrystal::Transfer::None)
          arg0 = (lib_arg0.null? ? nil : Gdk::EventSequence.new(lib_arg0, GICrystal::Transfer::None))
          ::Box(Proc(Gtk::Gesture, Gdk::EventSequence?, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(sequence : Gdk::EventSequence?) : Nil
        LibGObject.g_signal_emit_by_name(@source, "update", sequence)
      end
    end

    def update_signal
      UpdateSignal.new(self)
    end
  end
end
