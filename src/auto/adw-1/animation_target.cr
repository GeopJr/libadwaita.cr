require "../g_object-2.0/object"

module Adw
  # Represents a value `#Animation` can animate.
  #
  # Currently the only implementation is `#CallbackAnimationTarget`.
  @[GObject::GeneratedWrapper]
  class AnimationTarget < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::AnimationTargetClass), class_init,
        sizeof(LibAdw::AnimationTarget), instance_init, 0)
    end

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
