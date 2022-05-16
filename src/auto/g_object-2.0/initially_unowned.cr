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

    GICrystal.define_new_method(InitiallyUnowned, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `InitiallyUnowned`.
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
      LibGObject.g_initially_unowned_get_type
    end
  end
end
