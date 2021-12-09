require "./animation"

module Adw
  # A time-based [class@Adw.Animation].
  #
  # `AdwTimedAnimation` implements a simple animation interpolating the given
  # value from [property@Adw.TimedAnimation:value-from] to
  # [property@Adw.TimedAnimation:value-to] over
  # [property@Adw.TimedAnimation:duration] milliseconds using the curve described
  # by [property@Adw.TimedAnimation:easing].
  #
  # If [property@Adw.TimedAnimation:reverse] is set to `TRUE`,
  # `AdwTimedAnimation` will instead animate from
  # [property@Adw.TimedAnimation:value-to] to
  # [property@Adw.TimedAnimation:value-from], and the easing curve will be
  # inverted.
  #
  # The animation can repeat a certain amount of times, or endlessly, depending
  # on the [property@Adw.TimedAnimation:repeat-count] value. If
  # [property@Adw.TimedAnimation:alternate] is set to `TRUE`, it will also
  # change the direction every other iteration.
  class TimedAnimation < Animation
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, alternate : Bool? = nil, duration : UInt32? = nil, easing : Adw::Easing? = nil, repeat_count : UInt32? = nil, reverse : Bool? = nil, state : Adw::AnimationState? = nil, target : Adw::AnimationTarget? = nil, value : Float64? = nil, value_from : Float64? = nil, value_to : Float64? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[11]
      _values = StaticArray(LibGObject::Value, 11).new(LibGObject::Value.new)
      _n = 0

      if alternate
        (_names.to_unsafe + _n).value = "alternate".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, alternate)
        _n += 1
      end
      if duration
        (_names.to_unsafe + _n).value = "duration".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, duration)
        _n += 1
      end
      if easing
        (_names.to_unsafe + _n).value = "easing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, easing)
        _n += 1
      end
      if repeat_count
        (_names.to_unsafe + _n).value = "repeat-count".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, repeat_count)
        _n += 1
      end
      if reverse
        (_names.to_unsafe + _n).value = "reverse".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, reverse)
        _n += 1
      end
      if state
        (_names.to_unsafe + _n).value = "state".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, state)
        _n += 1
      end
      if target
        (_names.to_unsafe + _n).value = "target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, target)
        _n += 1
      end
      if value
        (_names.to_unsafe + _n).value = "value".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, value)
        _n += 1
      end
      if value_from
        (_names.to_unsafe + _n).value = "value-from".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, value_from)
        _n += 1
      end
      if value_to
        (_names.to_unsafe + _n).value = "value-to".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, value_to)
        _n += 1
      end
      if widget
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TimedAnimation.g_type, _n, _names, _values)
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
      Adw::Easing.from_value(value)
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

    def initialize(widget : Gtk::Widget, from : Float64, to : Float64, duration : UInt32, target : Adw::AnimationTarget)
      # adw_timed_animation_new: (Constructor)
      # @target: (transfer full)
      # Returns: (transfer none)

      LibGObject.g_object_ref(target)

      _retval = LibAdw.adw_timed_animation_new(widget, from, to, duration, target)
      @pointer = _retval
    end

    def alternate : Bool
      # adw_timed_animation_get_alternate: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_timed_animation_get_alternate(self)
      GICrystal.to_bool(_retval)
    end

    def duration : UInt32
      # adw_timed_animation_get_duration: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_timed_animation_get_duration(self)
      _retval
    end

    def easing : Adw::Easing
      # adw_timed_animation_get_easing: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_timed_animation_get_easing(self)
      Adw::Easing.from_value(_retval)
    end

    def repeat_count : UInt32
      # adw_timed_animation_get_repeat_count: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_timed_animation_get_repeat_count(self)
      _retval
    end

    def reverse : Bool
      # adw_timed_animation_get_reverse: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_timed_animation_get_reverse(self)
      GICrystal.to_bool(_retval)
    end

    def value_from : Float64
      # adw_timed_animation_get_value_from: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_timed_animation_get_value_from(self)
      _retval
    end

    def value_to : Float64
      # adw_timed_animation_get_value_to: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_timed_animation_get_value_to(self)
      _retval
    end

    def alternate=(alternate : Bool) : Nil
      # adw_timed_animation_set_alternate: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_timed_animation_set_alternate(self, alternate)
    end

    def duration=(duration : UInt32) : Nil
      # adw_timed_animation_set_duration: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_timed_animation_set_duration(self, duration)
    end

    def easing=(easing : Adw::Easing) : Nil
      # adw_timed_animation_set_easing: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_timed_animation_set_easing(self, easing)
    end

    def repeat_count=(repeat_count : UInt32) : Nil
      # adw_timed_animation_set_repeat_count: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_timed_animation_set_repeat_count(self, repeat_count)
    end

    def reverse=(reverse : Bool) : Nil
      # adw_timed_animation_set_reverse: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_timed_animation_set_reverse(self, reverse)
    end

    def value_from=(value : Float64) : Nil
      # adw_timed_animation_set_value_from: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_timed_animation_set_value_from(self, value)
    end

    def value_to=(value : Float64) : Nil
      # adw_timed_animation_set_value_to: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_timed_animation_set_value_to(self, value)
    end
  end
end
