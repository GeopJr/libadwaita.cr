module HarfBuzz
  # Data type for holding a shaping plan.
  #
  # Shape plans contain information about how HarfBuzz will shape a
  # particular text segment, based on the segment's properties and the
  # capabilities in the font face in use.
  #
  # Shape plans can be queried about how shaping will perform, given a set
  # of specific input parameters (script, language, direction, features,
  # etc.).
  class ShapePlanT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(ShapePlanT.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(ShapePlanT.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibHarfBuzz::ShapePlanT)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibHarfBuzz.hb_gobject_shape_plan_get_type
    end

    def to_unsafe
      @pointer
    end
  end
end
