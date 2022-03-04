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
      Gio::NetworkConnectivity.from_value(value)
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

      # Handle parameters

      # C call
      _retval = LibGio.g_network_monitor_get_default

      # Return value handling
      Gio::NetworkMonitor__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def can_reach(connectable : Gio::SocketConnectable, cancellable : Gio::Cancellable?) : Bool
      # g_network_monitor_can_reach: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_network_monitor_can_reach(self, connectable, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def can_reach_async(connectable : Gio::SocketConnectable, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_network_monitor_can_reach_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_network_monitor_can_reach_async(self, connectable, cancellable, callback, user_data)

      # Return value handling
    end

    def can_reach_finish(result : Gio::AsyncResult) : Bool
      # g_network_monitor_can_reach_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_network_monitor_can_reach_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def connectivity : Gio::NetworkConnectivity
      # g_network_monitor_get_connectivity: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_network_monitor_get_connectivity(self)

      # Return value handling
      Gio::NetworkConnectivity.from_value(_retval)
    end

    def network_available : Bool
      # g_network_monitor_get_network_available: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_network_monitor_get_network_available(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def network_metered : Bool
      # g_network_monitor_get_network_metered: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_network_monitor_get_network_metered(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class NetworkMonitor__Impl < GObject::Object
    include NetworkMonitor

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
