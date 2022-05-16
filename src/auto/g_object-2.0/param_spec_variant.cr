require "./param_spec"

module GObject
  # A #GParamSpec derived structure that contains the meta data for #GVariant properties.
  #
  # When comparing values with g_param_values_cmp(), scalar values with the same
  # type will be compared with g_variant_compare(). Other non-%NULL variants will
  # be checked for equality with g_variant_equal(), and their sort order is
  # otherwise undefined. %NULL is ordered before non-%NULL variants. Two %NULL
  # values compare equal.
  @[GObject::GeneratedWrapper]
  class ParamSpecVariant < ParamSpec
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGObject::ParamSpecVariant), instance_init, 0)
    end

    GICrystal.define_new_method(ParamSpecVariant, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ParamSpecVariant`.
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
