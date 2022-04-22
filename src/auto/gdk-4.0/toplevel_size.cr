module Gdk
  # The `GdkToplevelSize` struct contains information that is useful
  # to compute the size of a toplevel.
  class ToplevelSize
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = pointer
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGdk::ToplevelSize)).zero?
    end

    def bounds(bounds_width : Int32, bounds_height : Int32) : Nil
      # gdk_toplevel_size_get_bounds: (Method)
      # @bounds_width: (out) (transfer full)
      # @bounds_height: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_toplevel_size_get_bounds(self, bounds_width, bounds_height)

      # Return value handling
    end

    def set_min_size(min_width : Int32, min_height : Int32) : Nil
      # gdk_toplevel_size_set_min_size: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_toplevel_size_set_min_size(self, min_width, min_height)

      # Return value handling
    end

    def set_shadow_width(left : Int32, right : Int32, top : Int32, bottom : Int32) : Nil
      # gdk_toplevel_size_set_shadow_width: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_toplevel_size_set_shadow_width(self, left, right, top, bottom)

      # Return value handling
    end

    def set_size(width : Int32, height : Int32) : Nil
      # gdk_toplevel_size_set_size: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_toplevel_size_set_size(self, width, height)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
