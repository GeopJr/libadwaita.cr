require "../g_object-2.0/object"

module Adw
  # A base class for animations.
  #
  # `AdwAnimation` represents an animation on a widget. It has a target that
  # provides a value to animate, and a state indicating whether the
  # animation hasn't been started yet, is playing, paused or finished.
  #
  # Currently there are two concrete animation types:
  # `#TimedAnimation` and `#SpringAnimation`.
  #
  # `AdwAnimation` will automatically skip the animation if
  # `Animation#widget` is unmapped, or if
  # [property@Gtk.Settings:gtk-enable-animations] is `FALSE`.
  #
  # The `Animation::#done` signal can be used to perform an action after
  # the animation ends, for example hiding a widget after animating its
  # `Gtk::Widget#opacity` to 0.
  #
  # `AdwAnimation` will be kept alive while the animation is playing. As such,
  # it's safe to create an animation, start it and immediately unref it:
  # A fire-and-forget animation:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # static void
  # animation_cb (double    value,
  #               MyObject *self)
  # {
  #   // Do something with @value
  # }
  #
  # static void
  # my_object_animate (MyObject *self)
  # {
  #   AdwAnimationTarget *target =
  #     adw_callback_animation_target_new ((AdwAnimationTargetFunc) animation_cb,
  #                                        self, NULL);
  #   g_autoptr (AdwAnimation) animation =
  #     adw_timed_animation_new (widget, 0, 1, 250, target);
  #
  #   adw_animation_play (animation);
  # }
  # ```
  #
  # If there's a chance the previous animation for the same target hasn't yet
  # finished, the previous animation should be stopped first, or the existing
  # `AdwAnimation` object can be reused.
  @[GObject::GeneratedWrapper]
  class Animation < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::AnimationClass), class_init,
        sizeof(LibAdw::Animation), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, state : Adw::AnimationState? = nil, target : Adw::AnimationTarget? = nil, value : Float64? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if !state.nil?
        (_names.to_unsafe + _n).value = "state".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, state)
        _n += 1
      end
      if !target.nil?
        (_names.to_unsafe + _n).value = "target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, target)
        _n += 1
      end
      if !value.nil?
        (_names.to_unsafe + _n).value = "value".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, value)
        _n += 1
      end
      if !widget.nil?
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Animation.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_animation_get_type
    end

    def state : Adw::AnimationState
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "state", pointerof(value), Pointer(Void).null)
      Adw::AnimationState.new(value)
    end

    def target=(value : Adw::AnimationTarget?) : Adw::AnimationTarget?
      unsafe_value = value

      LibGObject.g_object_set(self, "target", unsafe_value, Pointer(Void).null)
      value
    end

    def target : Adw::AnimationTarget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "target", pointerof(value), Pointer(Void).null)
      Adw::AnimationTarget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def value : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "value", pointerof(value), Pointer(Void).null)
      value
    end

    def widget=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "widget", unsafe_value, Pointer(Void).null)
      value
    end

    def widget : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "widget", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Gets the current value of @self.
    #
    # The state indicates whether @self is currently playing, paused, finished or
    # hasn't been started yet.
    def state : Adw::AnimationState
      # adw_animation_get_state: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_animation_get_state(self)

      # Return value handling

      Adw::AnimationState.new(_retval)
    end

    # Gets the target @self animates.
    def target : Adw::AnimationTarget
      # adw_animation_get_target: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_animation_get_target(self)

      # Return value handling

      Adw::AnimationTarget.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the current value of @self.
    def value : Float64
      # adw_animation_get_value: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_animation_get_value(self)

      # Return value handling

      _retval
    end

    # Gets the widget @self was created for.
    def widget : Gtk::Widget
      # adw_animation_get_widget: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_animation_get_widget(self)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    # Pauses a playing animation for @self.
    #
    # Does nothing if the current state of @self isn't `ADW_ANIMATION_PLAYING`.
    #
    # Sets `Animation#state` to `ADW_ANIMATION_PAUSED`.
    def pause : Nil
      # adw_animation_pause: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_animation_pause(self)

      # Return value handling
    end

    # Starts the animation for @self.
    #
    # If the animation is playing, paused or has been completed, restarts it from
    # the beginning. This allows to easily play an animation regardless of whether
    # it's already playing or not.
    #
    # Sets `Animation#state` to `ADW_ANIMATION_PLAYING`.
    #
    # The animation will be automatically skipped if `Animation#widget` is
    # unmapped, or if [property@Gtk.Settings:gtk-enable-animations] is `FALSE`.
    #
    # As such, it's not guaranteed that the animation will actually run. For
    # example, when using `GLib#idle_add` and starting an animation
    # immediately afterwards, it's entirely possible that the idle callback will
    # run after the animation has already finished, and not while it's playing.
    def play : Nil
      # adw_animation_play: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_animation_play(self)

      # Return value handling
    end

    # Resets the animation for @self.
    #
    # Sets `Animation#state` to `ADW_ANIMATION_IDLE`.
    def reset : Nil
      # adw_animation_reset: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_animation_reset(self)

      # Return value handling
    end

    # Resumes a paused animation for @self.
    #
    # This function must only be used if the animation has been paused with
    # `Animation#pause`.
    #
    # Sets `Animation#state` to `ADW_ANIMATION_PLAYING`.
    def resume : Nil
      # adw_animation_resume: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_animation_resume(self)

      # Return value handling
    end

    # Skips the animation for @self.
    #
    # If the animation hasn't been started yet, is playing, or is paused, instantly
    # skips the animation to the end and causes `Animation::#done` to be
    # emitted.
    #
    # Sets `Animation#state` to `ADW_ANIMATION_FINISHED`.
    def skip : Nil
      # adw_animation_skip: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_animation_skip(self)

      # Return value handling
    end

    # This signal is emitted when the animation has been completed, either on its
    # own or via calling `Animation#skip`.
    struct DoneSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "done::#{@detail}" : "done"
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

      def connect(block : Proc(Adw::Animation, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Adw::Animation.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Adw::Animation, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::Animation, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Adw::Animation.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Adw::Animation, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "done")
      end
    end

    def done_signal
      DoneSignal.new(self)
    end
  end
end
