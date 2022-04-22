module Gio
  # #GPowerProfileMonitor makes it possible for applications as well as OS components
  # to monitor system power profiles and act upon them. It currently only exports
  # whether the system is in “Power Saver” mode (known as “Low Power” mode on
  # some systems).
  #
  # When in “Low Power” mode, it is recommended that applications:
  # - disabling automatic downloads
  # - reduce the rate of refresh from online sources such as calendar or
  #   email synchronisation
  # - if the application has expensive visual effects, reduce them
  #
  # It is also likely that OS components providing services to applications will
  # lower their own background activity, for the sake of the system.
  #
  # There are a variety of tools that exist for power consumption analysis, but those
  # usually depend on the OS and hardware used. On Linux, one could use `upower` to
  # monitor the battery discharge rate, `powertop` to check on the background activity
  # or activity at all), `sysprof` to inspect CPU usage, and `intel_gpu_time` to
  # profile GPU usage.
  #
  # Don't forget to disconnect the #GPowerProfileMonitor::notify::power-saver-enabled
  # signal, and unref the #GPowerProfileMonitor itself when exiting.
  module PowerProfileMonitor
    def power_saver_enabled? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "power-saver-enabled", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def self.dup_default : Gio::PowerProfileMonitor
      # g_power_profile_monitor_dup_default: (None)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_power_profile_monitor_dup_default

      # Return value handling

      Gio::PowerProfileMonitor__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def power_saver_enabled : Bool
      # g_power_profile_monitor_get_power_saver_enabled: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_power_profile_monitor_get_power_saver_enabled(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class PowerProfileMonitor__Impl < GObject::Object
    include PowerProfileMonitor

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_power_profile_monitor_get_type
    end

    # Cast a `GObject::Object` to `PowerProfileMonitor`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to PowerProfileMonitor")
    end

    # Cast a `GObject::Object` to `PowerProfileMonitor`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
