require "./volume_monitor"

module Gio
  @[GObject::GeneratedWrapper]
  class NativeVolumeMonitor < VolumeMonitor
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::NativeVolumeMonitorClass), class_init,
        sizeof(LibGio::NativeVolumeMonitor), instance_init, 0)
    end

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
