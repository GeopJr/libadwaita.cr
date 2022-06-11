module Gio
  # #GNetworkMonitor provides an easy-to-use cross-platform API
  # for monitoring network connectivity. On Linux, the available
  # implementations are based on the kernel's netlink interface and
  # on NetworkManager.
  #
  # There is also an implementation for use inside Flatpak sandboxes.
  module NetworkMonitor
    def connectivity : Gio::NetworkConnectivity
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "connectivity", pointerof(value), Pointer(Void).null)
      Gio::NetworkConnectivity.new(value)
    end

    def network_available? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "network-available", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def network_metered? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "network-metered", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def self.default : Gio::NetworkMonitor
      # g_network_monitor_get_default: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_network_monitor_get_default

      # Return value handling

      Gio::AbstractNetworkMonitor.new(_retval, GICrystal::Transfer::None)
    end

    def can_reach(connectable : Gio::SocketConnectable, cancellable : Gio::Cancellable?) : Bool
      # g_network_monitor_can_reach: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_network_monitor_can_reach(@pointer, connectable, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def can_reach_async(connectable : Gio::SocketConnectable, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_network_monitor_can_reach_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_network_monitor_can_reach_async(@pointer, connectable, cancellable, callback, user_data)

      # Return value handling
    end

    def can_reach_finish(result : Gio::AsyncResult) : Bool
      # g_network_monitor_can_reach_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_network_monitor_can_reach_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def connectivity : Gio::NetworkConnectivity
      # g_network_monitor_get_connectivity: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_network_monitor_get_connectivity(@pointer)

      # Return value handling

      Gio::NetworkConnectivity.new(_retval)
    end

    def network_available : Bool
      # g_network_monitor_get_network_available: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_network_monitor_get_network_available(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def network_metered : Bool
      # g_network_monitor_get_network_metered: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_network_monitor_get_network_metered(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    struct NetworkChangedSignal < GObject::Signal
      def name : String
        @detail ? "network-changed::#{@detail}" : "network-changed"
      end

      def connect(*, after : Bool = false, &block : Proc(Bool, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Bool, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_network_available : LibC::Int, _lib_box : Pointer(Void)) {
          network_available = lib_network_available
          ::Box(Proc(Bool, Nil)).unbox(_lib_box).call(network_available)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::NetworkMonitor, Bool, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_network_available : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gio::AbstractNetworkMonitor.new(_lib_sender, GICrystal::Transfer::None)
          network_available = lib_network_available
          ::Box(Proc(Gio::NetworkMonitor, Bool, Nil)).unbox(_lib_box).call(_sender, network_available)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(network_available : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "network-changed", network_available)
      end
    end

    def network_changed_signal
      NetworkChangedSignal.new(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractNetworkMonitor < GObject::Object
    include NetworkMonitor

    GICrystal.define_new_method(Gio::AbstractNetworkMonitor, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_network_monitor_get_type
    end

    # Cast a `GObject::Object` to `NetworkMonitor`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to NetworkMonitor")
    end

    # Cast a `GObject::Object` to `NetworkMonitor`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
