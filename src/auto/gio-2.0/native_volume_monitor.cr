require "./volume_monitor"

module Gio
  class NativeVolumeMonitor < VolumeMonitor
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_native_volume_monitor_get_type
    end
  end
end
