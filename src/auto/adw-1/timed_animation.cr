require "./animation"

module Adw
  # A time-based `#Animation`.
  #
  # `AdwTimedAnimation` implements a simple animation interpolating the given
  # value from [property@TimedAnimation:value-from] to
  # [property@TimedAnimation:value-to] over
  # `TimedAnimation#duration` milliseconds using the curve described by
  # `TimedAnimation#easing`.
  #
  # If `TimedAnimation#reverse` is set to `TRUE`, `AdwTimedAnimation`
  # will instead animate from [property@TimedAnimation:value-to] to
  # [property@TimedAnimation:value-from], and the easing curve will be inverted.
  #
  # The animation can repeat a certain amount of times, or endlessly, depending
  # on the [property@TimedAnimation:repeat-count] value. If
  # `TimedAnimation#alternate` is set to `TRUE`, it will also change the
  # direction every other iteration.
  @[GObject::GeneratedWrapper]
  class TimedAnimation < Animation
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::TimedAnimationClass), class_init,
        sizeof(LibAdw::TimedAnimation), instance_init, 0)
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

    def initialize(*, alternate : Bool? = nil, duration : UInt32? = nil, easing : Adw::Easing? = nil, repeat_count : UInt32? = nil, reverse : Bool? = nil, state : Adw::AnimationState? = nil, target : Adw::AnimationTarget? = nil, value : Float64? = nil, value_from : Float64? = nil, value_to : Float64? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[11]
      _values = StaticArray(LibGObject::Value, 11).new(LibGObject::Value.new)
      _n = 0

      if !alternate.nil?
        (_names.to_unsafe + _n).value = "alternate".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, alternate)
        _n += 1
      end
      if !duration.nil?
        (_names.to_unsafe + _n).value = "duration".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, duration)
        _n += 1
      end
      if !easing.nil?
        (_names.to_unsafe + _n).value = "easing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, easing)
        _n += 1
      end
      if !repeat_count.nil?
        (_names.to_unsafe + _n).value = "repeat-count".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, repeat_count)
        _n += 1
      end
      if !reverse.nil?
        (_names.to_unsafe + _n).value = "reverse".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, reverse)
        _n += 1
      end
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
      if !value_from.nil?
        (_names.to_unsafe + _n).value = "value-from".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, value_from)
        _n += 1
      end
      if !value_to.nil?
        (_names.to_unsafe + _n).value = "value-to".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, value_to)
        _n += 1
      end
      if !widget.nil?
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TimedAnimation.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_timed_animation_get_type
    end

    def alternate=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "alternate", unsafe_value, Pointer(Void).null)
      value
    end

    def alternate? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "alternate", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def duration=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "duration", unsafe_value, Pointer(Void).null)
      value
    end

    def duration : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "duration", pointerof(value), Pointer(Void).null)
      value
    end

    def easing=(value : Adw::Easing) : Adw::Easing
      unsafe_value = value

      LibGObject.g_object_set(self, "easing", unsafe_value, Pointer(Void).null)
      value
    end

    def easing : Adw::Easing
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "easing", pointerof(value), Pointer(Void).null)
      Adw::Easing.new(value)
    end

    def repeat_count=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "repeat-count", unsafe_value, Pointer(Void).null)
      value
    end

    def repeat_count : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "repeat-count", pointerof(value), Pointer(Void).null)
      value
    end

    def reverse=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "reverse", unsafe_value, Pointer(Void).null)
      value
    end

    def reverse? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "reverse", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def value_from=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "value-from", unsafe_value, Pointer(Void).null)
      value
    end

    def value_from : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "value-from", pointerof(value), Pointer(Void).null)
      value
    end

    def value_to=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "value-to", unsafe_value, Pointer(Void).null)
      value
    end

    def value_to : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "value-to", pointerof(value), Pointer(Void).null)
      value
    end

    # Creates a new `AdwTimedAnimation` on @widget to animate @target from @from
    # to @to.
    def initialize(widget : Gtk::Widget, from : Float64, to : Float64, duration : UInt32, target : Adw::AnimationTarget)
      # adw_timed_animation_new: (Constructor)
      # @target: (transfer full)
      # Returns: (transfer none)

      # Generator::TransferFullArgPlan
      LibGObject.g_object_ref_sink(target)
      # C call
      _retval = LibAdw.adw_timed_animation_new(widget, from, to, duration, target)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets whether @self changes direction on every iteration.
    def alternate : Bool
      # adw_timed_animation_get_alternate: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_timed_animation_get_alternate(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the duration of @self.
    def duration : UInt32
      # adw_timed_animation_get_duration: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_timed_animation_get_duration(self)

      # Return value handling

      _retval
    end

    # Gets the easing function @self uses.
    def easing : Adw::Easing
      # adw_timed_animation_get_easing: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_timed_animation_get_easing(self)

      # Return value handling

      Adw::Easing.new(_retval)
    end

    # Gets the number of times @self will play.
    def repeat_count : UInt32
      # adw_timed_animation_get_repeat_count: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_timed_animation_get_repeat_count(self)

      # Return value handling

      _retval
    end

    # Gets whether @self plays backwards.
    def reverse : Bool
      # adw_timed_animation_get_reverse: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_timed_animation_get_reverse(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the value @self will animate from.
    def value_from : Float64
      # adw_timed_animation_get_value_from: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_timed_animation_get_value_from(self)

      # Return value handling

      _retval
    end

    # Gets the value @self will animate to.
    def value_to : Float64
      # adw_timed_animation_get_value_to: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_timed_animation_get_value_to(self)

      # Return value handling

      _retval
    end

    # Sets whether @self changes direction on every iteration.
    def alternate=(alternate : Bool) : Nil
      # adw_timed_animation_set_alternate: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_timed_animation_set_alternate(self, alternate)

      # Return value handling
    end

    # Sets the duration of @self.
    #
    # If the animation repeats more than once, sets the duration of one iteration.
    def duration=(duration : UInt32) : Nil
      # adw_timed_animation_set_duration: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_timed_animation_set_duration(self, duration)

      # Return value handling
    end

    # Sets the easing function @self will use.
    #
    # See `#Easing` for the description of specific easing functions.
    def easing=(easing : Adw::Easing) : Nil
      # adw_timed_animation_set_easing: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_timed_animation_set_easing(self, easing)

      # Return value handling
    end

    # Sets the number of times @self will play.
    #
    # If set to 0, @self will repeat endlessly.
    def repeat_count=(repeat_count : UInt32) : Nil
      # adw_timed_animation_set_repeat_count: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_timed_animation_set_repeat_count(self, repeat_count)

      # Return value handling
    end

    # Sets whether @self plays backwards.
    def reverse=(reverse : Bool) : Nil
      # adw_timed_animation_set_reverse: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_timed_animation_set_reverse(self, reverse)

      # Return value handling
    end

    # Sets the value @self will animate from.
    def value_from=(value : Float64) : Nil
      # adw_timed_animation_set_value_from: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_timed_animation_set_value_from(self, value)

      # Return value handling
    end

    # Sets the value @self will animate to.
    def value_to=(value : Float64) : Nil
      # adw_timed_animation_set_value_to: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_timed_animation_set_value_to(self, value)

      # Return value handling
    end
  end
end
