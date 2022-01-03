require "./animation_target"

module Adw
  # An [class@AnimationTarget] that calls a given callback during the
  # animation.
  class CallbackAnimationTarget < AnimationTarget
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_callback_animation_target_get_type
    end

    def initialize(callback : Pointer(Void)?, user_data : Pointer(Nil)?, destroy : Pointer(Void))
      # adw_callback_animation_target_new: (Constructor)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer full)

      callback = if callback.nil?
                   LibAdw::AnimationTargetFunc.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      _retval = LibAdw.adw_callback_animation_target_new(callback, user_data, destroy)
      @pointer = _retval
    end
  end
end
