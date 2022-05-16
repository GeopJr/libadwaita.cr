module Gdk
  # The `GdkToplevelLayout` struct contains information that
  # is necessary to present a sovereign window on screen.
  #
  # The `GdkToplevelLayout` struct is necessary for using
  # `Gdk::Toplevel#present`.
  #
  # Toplevel surfaces are sovereign windows that can be presented
  # to the user in various states (maximized, on all workspaces,
  # etc).
  class ToplevelLayout
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(ToplevelLayout.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(ToplevelLayout.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGdk::ToplevelLayout)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_toplevel_layout_get_type
    end

    def initialize
      # gdk_toplevel_layout_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_toplevel_layout_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    def copy : Gdk::ToplevelLayout
      # gdk_toplevel_layout_copy: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_toplevel_layout_copy(@pointer)

      # Return value handling

      Gdk::ToplevelLayout.new(_retval, GICrystal::Transfer::Full)
    end

    def equal(other : Gdk::ToplevelLayout) : Bool
      # gdk_toplevel_layout_equal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_toplevel_layout_equal(@pointer, other)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def fullscreen(fullscreen : Bool) : Bool
      # gdk_toplevel_layout_get_fullscreen: (Method)
      # @fullscreen: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_toplevel_layout_get_fullscreen(@pointer, fullscreen)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def fullscreen_monitor : Gdk::Monitor?
      # gdk_toplevel_layout_get_fullscreen_monitor: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_toplevel_layout_get_fullscreen_monitor(@pointer)

      # Return value handling

      Gdk::Monitor.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def maximized(maximized : Bool) : Bool
      # gdk_toplevel_layout_get_maximized: (Method)
      # @maximized: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_toplevel_layout_get_maximized(@pointer, maximized)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def resizable : Bool
      # gdk_toplevel_layout_get_resizable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_toplevel_layout_get_resizable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def ref : Gdk::ToplevelLayout
      # gdk_toplevel_layout_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_toplevel_layout_ref(@pointer)

      # Return value handling

      Gdk::ToplevelLayout.new(_retval, GICrystal::Transfer::Full)
    end

    def set_fullscreen(fullscreen : Bool, monitor : Gdk::Monitor?) : Nil
      # gdk_toplevel_layout_set_fullscreen: (Method)
      # @monitor: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      monitor = if monitor.nil?
                  Pointer(Void).null
                else
                  monitor.to_unsafe
                end

      # C call
      LibGdk.gdk_toplevel_layout_set_fullscreen(@pointer, fullscreen, monitor)

      # Return value handling
    end

    def maximized=(maximized : Bool) : Nil
      # gdk_toplevel_layout_set_maximized: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_toplevel_layout_set_maximized(@pointer, maximized)

      # Return value handling
    end

    def resizable=(resizable : Bool) : Nil
      # gdk_toplevel_layout_set_resizable: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_toplevel_layout_set_resizable(@pointer, resizable)

      # Return value handling
    end

    def unref : Nil
      # gdk_toplevel_layout_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_toplevel_layout_unref(@pointer)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
