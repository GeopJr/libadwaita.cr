require "./object"

module GObject
  # A type for objects that have an initially floating reference.
  #
  # All the fields in the `GInitiallyUnowned` structure are private to the
  # implementation and should never be accessed directly.
  @[GObject::GeneratedWrapper]
  class InitiallyUnowned < Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::InitiallyUnownedClass), class_init,
        sizeof(LibGObject::InitiallyUnowned), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGObject.g_initially_unowned_get_type
    end
  end
end
