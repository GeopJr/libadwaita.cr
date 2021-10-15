module Gdk
  # The `GdkToplevelLayout` struct contains information that
  # is necessary to present a sovereign window on screen.
  #
  # The `GdkToplevelLayout` struct is necessary for using
  # [method@Gdk.Toplevel.present].
  #
  # Toplevel surfaces are sovereign windows that can be presented
  # to the user in various states (maximized, on all workspaces,
  # etc).
  class ToplevelLayout
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(ToplevelLayout.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(ToplevelLayout.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_toplevel_layout_get_type
    end

    def initialize
      # gdk_toplevel_layout_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGdk.gdk_toplevel_layout_new
      @pointer = _retval
    end

    def copy : Gdk::ToplevelLayout
      # gdk_toplevel_layout_copy: (Method)
      # Returns: (transfer full)

      _retval = LibGdk.gdk_toplevel_layout_copy(self)
      Gdk::ToplevelLayout.new(_retval, GICrystal::Transfer::Full)
    end

    def equal(other : Gdk::ToplevelLayout) : Bool
      # gdk_toplevel_layout_equal: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_toplevel_layout_equal(self, other)
      GICrystal.to_bool(_retval)
    end

    def fullscreen(fullscreen : Bool) : Bool
      # gdk_toplevel_layout_get_fullscreen: (Method)
      # @fullscreen: (out) (transfer full)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_toplevel_layout_get_fullscreen(self, fullscreen)
      GICrystal.to_bool(_retval)
    end

    def fullscreen_monitor : Gdk::Monitor?
      # gdk_toplevel_layout_get_fullscreen_monitor: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_toplevel_layout_get_fullscreen_monitor(self)
      Gdk::Monitor.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def maximized(maximized : Bool) : Bool
      # gdk_toplevel_layout_get_maximized: (Method)
      # @maximized: (out) (transfer full)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_toplevel_layout_get_maximized(self, maximized)
      GICrystal.to_bool(_retval)
    end

    def resizable? : Bool
      # gdk_toplevel_layout_get_resizable: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_toplevel_layout_get_resizable(self)
      GICrystal.to_bool(_retval)
    end

    def ref : Gdk::ToplevelLayout
      # gdk_toplevel_layout_ref: (Method)
      # Returns: (transfer full)

      _retval = LibGdk.gdk_toplevel_layout_ref(self)
      Gdk::ToplevelLayout.new(_retval, GICrystal::Transfer::Full)
    end

    def set_fullscreen(fullscreen : Bool, monitor : Gdk::Monitor?) : Nil
      # gdk_toplevel_layout_set_fullscreen: (Method)
      # @monitor: (nullable)
      # Returns: (transfer none)

      monitor = if monitor.nil?
                  Pointer(Void).null
                else
                  monitor.to_unsafe
                end

      LibGdk.gdk_toplevel_layout_set_fullscreen(self, fullscreen, monitor)
    end

    def maximized=(maximized : Bool) : Nil
      # gdk_toplevel_layout_set_maximized: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_toplevel_layout_set_maximized(self, maximized)
    end

    def resizable=(resizable : Bool) : Nil
      # gdk_toplevel_layout_set_resizable: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_toplevel_layout_set_resizable(self, resizable)
    end

    def unref : Nil
      # gdk_toplevel_layout_unref: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_toplevel_layout_unref(self)
    end

    def to_unsafe
      @pointer
    end
  end
end
