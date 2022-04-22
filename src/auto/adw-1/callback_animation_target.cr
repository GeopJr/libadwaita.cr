require "./animation_target"

module Adw
  # An `#AnimationTarget` that calls a given callback during the
  # animation.
  @[GObject::GeneratedWrapper]
  class CallbackAnimationTarget < AnimationTarget
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::CallbackAnimationTargetClass), class_init,
        sizeof(LibAdw::CallbackAnimationTarget), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_callback_animation_target_get_type
    end

    # Creates a new `AdwAnimationTarget` that calls the given @callback during
    # the animation.
    def initialize(callback : Pointer(Void)?, user_data : Pointer(Void)?, destroy : Pointer(Void))
      # adw_callback_animation_target_new: (Constructor)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      callback = if callback.nil?
                   LibAdw::AnimationTargetFunc.null
                 else
                   callback.to_unsafe
                 end

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      _retval = LibAdw.adw_callback_animation_target_new(callback, user_data, destroy)

      # Return value handling

      @pointer = _retval
    end
  end
end
