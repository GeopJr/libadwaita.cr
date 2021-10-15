require "./object"

module GObject
  # A type for objects that have an initially floating reference.
  #
  # All the fields in the `GInitiallyUnowned` structure are private to the
  # implementation and should never be accessed directly.
  class InitiallyUnowned < Object
    @pointer : Pointer(Void)

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
