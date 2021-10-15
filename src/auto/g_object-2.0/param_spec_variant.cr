require "./param_spec"

module GObject
  # A #GParamSpec derived structure that contains the meta data for #GVariant properties.
  #
  # When comparing values with g_param_values_cmp(), scalar values with the same
  # type will be compared with g_variant_compare(). Other non-%NULL variants will
  # be checked for equality with g_variant_equal(), and their sort order is
  # otherwise undefined. %NULL is ordered before non-%NULL variants. Two %NULL
  # values compare equal.
  class ParamSpecVariant < ParamSpec
    @pointer : Pointer(Void)

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
