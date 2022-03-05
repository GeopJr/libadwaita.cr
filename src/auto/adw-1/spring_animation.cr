require "./animation"

module Adw
  # A spring-based [class@Animation].
  #
  # `AdwSpringAnimation` implements an animation driven by a physical model of a
  # spring described by [struct@SpringParams], with a resting position in
  # [property@SpringAnimation:value-to], stretched to
  # [property@SpringAnimation:value-from].
  #
  # Since the animation is physically simulated, spring animations don't have a
  # fixed duration. The animation will stop when the simulated spring comes to a
  # rest - when the amplitude of the oscillations becomes smaller than
  # [property@SpringAnimation:epsilon], or immediately when it reaches
  # [property@SpringAnimation:value-to] if
  # [property@SpringAnimation:clamp] is set to `TRUE`. The estimated duration can
  # be obtained with [property@SpringAnimation:estimated-duration].
  #
  # Due to the nature of spring-driven motion the animation can overshoot
  # [property@SpringAnimation:value-to] before coming to a rest. Whether the
  # animation will overshoot or not depends on the damping ratio of the spring.
  # See [struct@SpringParams] for more information about specific damping ratio
  # values.
  #
  # If [property@SpringAnimation:clamp] is `TRUE`, the animation will abruptly
  # end as soon as it reaches the final value, preventing overshooting.
  #
  # Animations can have an initial velocity value, set via
  # [property@SpringAnimation:initial-velocity], which adjusts the curve without
  # changing the duration. This makes spring animations useful for deceleration
  # at the end of gestures.
  #
  # If the initial and final values are equal, and the initial velocity is not 0,
  # the animation value will bounce and return to its resting position.
  class SpringAnimation < Animation
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, clamp : Bool? = nil, epsilon : Float64? = nil, estimated_duration : UInt32? = nil, initial_velocity : Float64? = nil, spring_params : Adw::SpringParams? = nil, state : Adw::AnimationState? = nil, target : Adw::AnimationTarget? = nil, value : Float64? = nil, value_from : Float64? = nil, value_to : Float64? = nil, velocity : Float64? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[12]
      _values = StaticArray(LibGObject::Value, 12).new(LibGObject::Value.new)
      _n = 0

      if clamp
        (_names.to_unsafe + _n).value = "clamp".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, clamp)
        _n += 1
      end
      if epsilon
        (_names.to_unsafe + _n).value = "epsilon".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, epsilon)
        _n += 1
      end
      if estimated_duration
        (_names.to_unsafe + _n).value = "estimated-duration".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, estimated_duration)
        _n += 1
      end
      if initial_velocity
        (_names.to_unsafe + _n).value = "initial-velocity".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, initial_velocity)
        _n += 1
      end
      if spring_params
        (_names.to_unsafe + _n).value = "spring-params".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, spring_params)
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
      if velocity
        (_names.to_unsafe + _n).value = "velocity".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, velocity)
        _n += 1
      end
      if widget
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SpringAnimation.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_spring_animation_get_type
    end

    def clamp=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "clamp", unsafe_value, Pointer(Void).null)
      value
    end

    def clamp? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "clamp", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def epsilon=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "epsilon", unsafe_value, Pointer(Void).null)
      value
    end

    def epsilon : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "epsilon", pointerof(value), Pointer(Void).null)
      value
    end

    def estimated_duration : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "estimated-duration", pointerof(value), Pointer(Void).null)
      value
    end

    def initial_velocity=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "initial-velocity", unsafe_value, Pointer(Void).null)
      value
    end

    def initial_velocity : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "initial-velocity", pointerof(value), Pointer(Void).null)
      value
    end

    def spring_params=(value : Adw::SpringParams?) : Adw::SpringParams?
      unsafe_value = value

      LibGObject.g_object_set(self, "spring-params", unsafe_value, Pointer(Void).null)
      value
    end

    def spring_params : Adw::SpringParams?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "spring-params", pointerof(value), Pointer(Void).null)
      Adw::SpringParams.new(value, GICrystal::Transfer::None) unless value.null?
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

    def velocity : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "velocity", pointerof(value), Pointer(Void).null)
      value
    end

    def initialize(widget : Gtk::Widget, from : Float64, to : Float64, spring_params : Adw::SpringParams, target : Adw::AnimationTarget)
      # adw_spring_animation_new: (Constructor)
      # @spring_params: (transfer full)
      # @target: (transfer full)
      # Returns: (transfer none)

      # Handle parameters
      LibGObject.g_object_ref(spring_params)
      LibGObject.g_object_ref(target)

      # C call
      _retval = LibAdw.adw_spring_animation_new(widget, from, to, spring_params, target)

      # Return value handling
      @pointer = _retval
      LibGObject.g_object_ref(_retval)
    end

    def clamp : Bool
      # adw_spring_animation_get_clamp: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_spring_animation_get_clamp(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def epsilon : Float64
      # adw_spring_animation_get_epsilon: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_spring_animation_get_epsilon(self)

      # Return value handling
      _retval
    end

    def estimated_duration : UInt32
      # adw_spring_animation_get_estimated_duration: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_spring_animation_get_estimated_duration(self)

      # Return value handling
      _retval
    end

    def initial_velocity : Float64
      # adw_spring_animation_get_initial_velocity: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_spring_animation_get_initial_velocity(self)

      # Return value handling
      _retval
    end

    def spring_params : Adw::SpringParams
      # adw_spring_animation_get_spring_params: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_spring_animation_get_spring_params(self)

      # Return value handling
      Adw::SpringParams.new(_retval, GICrystal::Transfer::None)
    end

    def value_from : Float64
      # adw_spring_animation_get_value_from: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_spring_animation_get_value_from(self)

      # Return value handling
      _retval
    end

    def value_to : Float64
      # adw_spring_animation_get_value_to: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_spring_animation_get_value_to(self)

      # Return value handling
      _retval
    end

    def velocity : Float64
      # adw_spring_animation_get_velocity: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_spring_animation_get_velocity(self)

      # Return value handling
      _retval
    end

    def clamp=(clamp : Bool) : Nil
      # adw_spring_animation_set_clamp: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_spring_animation_set_clamp(self, clamp)

      # Return value handling
    end

    def epsilon=(epsilon : Float64) : Nil
      # adw_spring_animation_set_epsilon: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_spring_animation_set_epsilon(self, epsilon)

      # Return value handling
    end

    def initial_velocity=(velocity : Float64) : Nil
      # adw_spring_animation_set_initial_velocity: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_spring_animation_set_initial_velocity(self, velocity)

      # Return value handling
    end

    def spring_params=(spring_params : Adw::SpringParams) : Nil
      # adw_spring_animation_set_spring_params: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_spring_animation_set_spring_params(self, spring_params)

      # Return value handling
    end

    def value_from=(value : Float64) : Nil
      # adw_spring_animation_set_value_from: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_spring_animation_set_value_from(self, value)

      # Return value handling
    end

    def value_to=(value : Float64) : Nil
      # adw_spring_animation_set_value_to: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_spring_animation_set_value_to(self, value)

      # Return value handling
    end
  end
end
