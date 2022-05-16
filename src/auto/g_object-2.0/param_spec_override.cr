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

    GICrystal.define_new_method(ParamSpecOverride, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ParamSpecOverride`.
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
      LibGObject.intern
    end
  end
end
