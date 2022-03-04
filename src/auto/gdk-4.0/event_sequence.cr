module Gdk
  # `GdkEventSequence` is an opaque type representing a sequence
  # of related touch events.
  class EventSequence
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(EventSequence.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(EventSequence.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_event_sequence_get_type
    end

    def to_unsafe
      @pointer
    end
  end
end
