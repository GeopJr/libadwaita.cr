require "./param_spec"

module GObject
  # A #GParamSpec derived structure that redirects operations to
  # other types of #GParamSpec.
  #
  # All operations other than getting or setting the value are redirected,
  # including accessing the nick and blurb, validating a value, and so
  # forth.
  #
  # See g_param_spec_get_redirect_target() for retrieving the overridden
  # property. #GParamSpecOverride is used in implementing
  # g_object_class_override_property(), and will not be directly useful
  # unless you are implementing a new base type similar to GObject.
  @[GObject::GeneratedWrapper]
  class ParamSpecOverride < ParamSpec
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGObject::ParamSpecOverride), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGObject.intern
    end
  end
end
