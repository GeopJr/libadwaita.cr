require "../g_object-2.0/object"

module Adw
  # Represents a value [class@Animation] can animate.
  #
  # Currently the only implementation is [class@CallbackAnimationTarget].
  class AnimationTarget < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_animation_target_get_type
    end
  end
end
