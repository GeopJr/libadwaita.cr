module Gdk
  # A `GdkToplevel` is a freestanding toplevel surface.
  #
  # The `GdkToplevel` interface provides useful APIs for interacting with
  # the windowing system, such as controlling maximization and size of the
  # surface, setting icons and transient parents for dialogs.
  module Toplevel
    def decorated=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "decorated", unsafe_value, Pointer(Void).null)
      value
    end

    def decorated? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "decorated", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def deletable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "deletable", unsafe_value, Pointer(Void).null)
      value
    end

    def deletable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "deletable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def fullscreen_mode=(value : Gdk::FullscreenMode) : Gdk::FullscreenMode
      unsafe_value = value

      LibGObject.g_object_set(self, "fullscreen-mode", unsafe_value, Pointer(Void).null)
      value
    end

    def fullscreen_mode : Gdk::FullscreenMode
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "fullscreen-mode", pointerof(value), Pointer(Void).null)
      Gdk::FullscreenMode.new(value)
    end

    def icon_list=(value : Pointer(Void)) : Pointer(Void)
      unsafe_value = value

      LibGObject.g_object_set(self, "icon-list", unsafe_value, Pointer(Void).null)
      value
    end

    def icon_list : Pointer(Void)
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "icon-list", pointerof(value), Pointer(Void).null)
      value
    end

    def modal=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "modal", unsafe_value, Pointer(Void).null)
      value
    end

    def modal? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "modal", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def shortcuts_inhibited? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "shortcuts-inhibited", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def startup_id=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "startup-id", unsafe_value, Pointer(Void).null)
      value
    end

    def startup_id : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "startup-id", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def state : Gdk::ToplevelState
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "state", pointerof(value), Pointer(Void).null)
      Gdk::ToplevelState.new(value)
    end

    def title=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "title", unsafe_value, Pointer(Void).null)
      value
    end

    def title : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "title", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def transient_for=(value : Gdk::Surface?) : Gdk::Surface?
      unsafe_value = value

      LibGObject.g_object_set(self, "transient-for", unsafe_value, Pointer(Void).null)
      value
    end

    def transient_for : Gdk::Surface?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "transient-for", pointerof(value), Pointer(Void).null)
      Gdk::Surface.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def begin_move(device : Gdk::Device, button : Int32, x : Float64, y : Float64, timestamp : UInt32) : Nil
      # gdk_toplevel_begin_move: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_toplevel_begin_move(@pointer, device, button, x, y, timestamp)

      # Return value handling
    end

    def begin_resize(edge : Gdk::SurfaceEdge, device : Gdk::Device?, button : Int32, x : Float64, y : Float64, timestamp : UInt32) : Nil
      # gdk_toplevel_begin_resize: (Method)
      # @device: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      device = if device.nil?
                 Pointer(Void).null
               else
                 device.to_unsafe
               end

      # C call
      LibGdk.gdk_toplevel_begin_resize(@pointer, edge, device, button, x, y, timestamp)

      # Return value handling
    end

    def focus(timestamp : UInt32) : Nil
      # gdk_toplevel_focus: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_toplevel_focus(@pointer, timestamp)

      # Return value handling
    end

    def state : Gdk::ToplevelState
      # gdk_toplevel_get_state: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_toplevel_get_state(@pointer)

      # Return value handling

      Gdk::ToplevelState.new(_retval)
    end

    def inhibit_system_shortcuts(event : Gdk::Event?) : Nil
      # gdk_toplevel_inhibit_system_shortcuts: (Method)
      # @event: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      event = if event.nil?
                Pointer(Void).null
              else
                event.to_unsafe
              end

      # C call
      LibGdk.gdk_toplevel_inhibit_system_shortcuts(@pointer, event)

      # Return value handling
    end

    def lower : Bool
      # gdk_toplevel_lower: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_toplevel_lower(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def minimize : Bool
      # gdk_toplevel_minimize: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_toplevel_minimize(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def present(layout : Gdk::ToplevelLayout) : Nil
      # gdk_toplevel_present: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_toplevel_present(@pointer, layout)

      # Return value handling
    end

    def restore_system_shortcuts : Nil
      # gdk_toplevel_restore_system_shortcuts: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_toplevel_restore_system_shortcuts(@pointer)

      # Return value handling
    end

    def decorated=(decorated : Bool) : Nil
      # gdk_toplevel_set_decorated: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_toplevel_set_decorated(@pointer, decorated)

      # Return value handling
    end

    def deletable=(deletable : Bool) : Nil
      # gdk_toplevel_set_deletable: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_toplevel_set_deletable(@pointer, deletable)

      # Return value handling
    end

    def icon_list=(surfaces : GLib::List) : Nil
      # gdk_toplevel_set_icon_list: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_toplevel_set_icon_list(@pointer, surfaces)

      # Return value handling
    end

    def modal=(modal : Bool) : Nil
      # gdk_toplevel_set_modal: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_toplevel_set_modal(@pointer, modal)

      # Return value handling
    end

    def startup_id=(startup_id : ::String) : Nil
      # gdk_toplevel_set_startup_id: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_toplevel_set_startup_id(@pointer, startup_id)

      # Return value handling
    end

    def title=(title : ::String) : Nil
      # gdk_toplevel_set_title: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_toplevel_set_title(@pointer, title)

      # Return value handling
    end

    def transient_for=(parent : Gdk::Surface) : Nil
      # gdk_toplevel_set_transient_for: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_toplevel_set_transient_for(@pointer, parent)

      # Return value handling
    end

    def show_window_menu(event : Gdk::Event) : Bool
      # gdk_toplevel_show_window_menu: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_toplevel_show_window_menu(@pointer, event)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def supports_edge_constraints : Bool
      # gdk_toplevel_supports_edge_constraints: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_toplevel_supports_edge_constraints(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def titlebar_gesture(gesture : Gdk::TitlebarGesture) : Bool
      # gdk_toplevel_titlebar_gesture: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_toplevel_titlebar_gesture(@pointer, gesture)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    struct ComputeSizeSignal < GObject::Signal
      def name : String
        @detail ? "compute-size::#{@detail}" : "compute-size"
      end

      def connect(*, after : Bool = false, &block : Proc(Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_size : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::CallerAllocatesPlan
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gdk::Toplevel, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_size : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::AbstractToplevel.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::CallerAllocatesPlan
          ::Box(Proc(Gdk::Toplevel, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        # Generator::CallerAllocatesPlan
        size = Gdk::ToplevelSize.new
        LibGObject.g_signal_emit_by_name(@source, "compute-size", size)
      end
    end

    def compute_size_signal
      ComputeSizeSignal.new(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractToplevel < GObject::Object
    include Toplevel

    GICrystal.define_new_method(Gdk::AbstractToplevel, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_toplevel_get_type
    end

    # Cast a `GObject::Object` to `Toplevel`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Toplevel")
    end

    # Cast a `GObject::Object` to `Toplevel`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
