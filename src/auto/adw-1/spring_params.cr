module Adw
  # Physical parameters of a spring for `#SpringAnimation`.
  #
  # Any spring can be described by three parameters: mass, stiffness and damping.
  #
  # An undamped spring will produce an oscillatory motion which will go on
  # forever.
  #
  # The frequency and amplitude of the oscillations will be determined by the
  # stiffness (how "strong" the spring is) and its mass (how much "inertia" it
  # has).
  #
  # If damping is larger than 0, the amplitude of that oscillating motion will
  # exponientally decrease over time. If that damping is strong enough that the
  # spring can't complete a full oscillation, it's called an overdamped spring.
  #
  # If we the spring can oscillate, it's called an underdamped spring.
  #
  # The value between these two behaviors is called critical damping; a
  # critically damped spring will comes to rest in the minimum possible time
  # without producing oscillations.
  #
  # The damping can be replaced by damping ratio, which produces the following
  # springs:
  #
  # * 0: an undamped spring.
  # * Between 0 and 1: an underdamped spring.
  # * 1: a critically damped spring.
  # * Larger than 1: an overdamped spring.
  #
  # As such
  class SpringParams
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(SpringParams.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(SpringParams.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibAdw::SpringParams)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_spring_params_get_type
    end

    def initialize(damping_ratio : Float64, mass : Float64, stiffness : Float64)
      # adw_spring_params_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibAdw.adw_spring_params_new(damping_ratio, mass, stiffness)

      # Return value handling

      @pointer = _retval
    end

    def self.new_full(damping : Float64, mass : Float64, stiffness : Float64) : self
      # adw_spring_params_new_full: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibAdw.adw_spring_params_new_full(damping, mass, stiffness)

      # Return value handling

      Adw::SpringParams.new(_retval, GICrystal::Transfer::Full)
    end

    def damping : Float64
      # adw_spring_params_get_damping: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_spring_params_get_damping(self)

      # Return value handling

      _retval
    end

    def damping_ratio : Float64
      # adw_spring_params_get_damping_ratio: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_spring_params_get_damping_ratio(self)

      # Return value handling

      _retval
    end

    def mass : Float64
      # adw_spring_params_get_mass: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_spring_params_get_mass(self)

      # Return value handling

      _retval
    end

    def stiffness : Float64
      # adw_spring_params_get_stiffness: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_spring_params_get_stiffness(self)

      # Return value handling

      _retval
    end

    def ref : Adw::SpringParams
      # adw_spring_params_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibAdw.adw_spring_params_ref(self)

      # Return value handling

      Adw::SpringParams.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # adw_spring_params_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_spring_params_unref(self)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
