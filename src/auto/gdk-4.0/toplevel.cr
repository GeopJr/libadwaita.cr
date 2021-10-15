module Gdk
  # A `GdkToplevel` is a freestanding toplevel surface.
  #
  # The `GdkToplevel` interface provides useful APIs for interacting with
  # the windowing system, such as controlling maximization and size of the
  # surface, setting icons and transient parents for dialogs.
  module Toplevel
    def begin_move(device : Gdk::Device, button : Int32, x : Float64, y : Float64, timestamp : UInt32) : Nil
      # gdk_toplevel_begin_move: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_toplevel_begin_move(self, device, button, x, y, timestamp)
    end

    def begin_resize(edge : Gdk::SurfaceEdge, device : Gdk::Device?, button : Int32, x : Float64, y : Float64, timestamp : UInt32) : Nil
      # gdk_toplevel_begin_resize: (Method)
      # @device: (nullable)
      # Returns: (transfer none)

      device = if device.nil?
                 Pointer(Void).null
               else
                 device.to_unsafe
               end

      LibGdk.gdk_toplevel_begin_resize(self, edge, device, button, x, y, timestamp)
    end

    def focus(timestamp : UInt32) : Nil
      # gdk_toplevel_focus: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_toplevel_focus(self, timestamp)
    end

    def state : Gdk::ToplevelState
      # gdk_toplevel_get_state: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_toplevel_get_state(self)
      Gdk::ToplevelState.from_value(_retval)
    end

    def inhibit_system_shortcuts(event : Gdk::Event?) : Nil
      # gdk_toplevel_inhibit_system_shortcuts: (Method)
      # @event: (nullable)
      # Returns: (transfer none)

      event = if event.nil?
                Pointer(Void).null
              else
                event.to_unsafe
              end

      LibGdk.gdk_toplevel_inhibit_system_shortcuts(self, event)
    end

    def lower : Bool
      # gdk_toplevel_lower: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_toplevel_lower(self)
      GICrystal.to_bool(_retval)
    end

    def minimize : Bool
      # gdk_toplevel_minimize: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_toplevel_minimize(self)
      GICrystal.to_bool(_retval)
    end

    def present(layout : Gdk::ToplevelLayout) : Nil
      # gdk_toplevel_present: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_toplevel_present(self, layout)
    end

    def restore_system_shortcuts : Nil
      # gdk_toplevel_restore_system_shortcuts: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_toplevel_restore_system_shortcuts(self)
    end

    def decorated=(decorated : Bool) : Nil
      # gdk_toplevel_set_decorated: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_toplevel_set_decorated(self, decorated)
    end

    def deletable=(deletable : Bool) : Nil
      # gdk_toplevel_set_deletable: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_toplevel_set_deletable(self, deletable)
    end

    def icon_list=(surfaces : GLib::List) : Nil
      # gdk_toplevel_set_icon_list: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_toplevel_set_icon_list(self, surfaces)
    end

    def modal=(modal : Bool) : Nil
      # gdk_toplevel_set_modal: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_toplevel_set_modal(self, modal)
    end

    def startup_id=(startup_id : ::String) : Nil
      # gdk_toplevel_set_startup_id: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_toplevel_set_startup_id(self, startup_id)
    end

    def title=(title : ::String) : Nil
      # gdk_toplevel_set_title: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_toplevel_set_title(self, title)
    end

    def transient_for=(parent : Gdk::Surface) : Nil
      # gdk_toplevel_set_transient_for: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_toplevel_set_transient_for(self, parent)
    end

    def show_window_menu(event : Gdk::Event) : Bool
      # gdk_toplevel_show_window_menu: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_toplevel_show_window_menu(self, event)
      GICrystal.to_bool(_retval)
    end

    def supports_edge_constraints : Bool
      # gdk_toplevel_supports_edge_constraints: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_toplevel_supports_edge_constraints(self)
      GICrystal.to_bool(_retval)
    end

    def titlebar_gesture(gesture : Gdk::TitlebarGesture) : Bool
      # gdk_toplevel_titlebar_gesture: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_toplevel_titlebar_gesture(self, gesture)
      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class Toplevel__Impl
    include Toplevel

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_toplevel_get_type
    end

    # Cast a `GObject::Object` to `Toplevel`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Toplevel")
    end

    # Cast a `GObject::Object` to `Toplevel`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
