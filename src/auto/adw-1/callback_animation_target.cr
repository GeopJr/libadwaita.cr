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

    GICrystal.define_new_method(CallbackAnimationTarget, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `CallbackAnimationTarget`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
    def initialize(callback : Adw::AnimationTargetFunc?)
      # adw_callback_animation_target_new: (Constructor)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer full)

      # Generator::CallbackArgPlan
      if callback
        _box = ::Box.box(callback)
        callback = ->(lib_value : Float64, lib_user_data : Pointer(Void)) {
          value = lib_value
          ::Box(Proc(Float64, Nil)).unbox(lib_user_data).call(value)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        callback = user_data = destroy = Pointer(Void).null
      end

      # C call
      _retval = LibAdw.adw_callback_animation_target_new(callback, user_data, destroy)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end
  end
end
