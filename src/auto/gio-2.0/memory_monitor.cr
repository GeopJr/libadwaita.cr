module Gio
  # #GMemoryMonitor will monitor system memory and suggest to the application
  # when to free memory so as to leave more room for other applications.
  # It is implemented on Linux using the [Low Memory Monitor](https://gitlab.freedesktop.org/hadess/low-memory-monitor/)
  # ([API documentation](https://hadess.pages.freedesktop.org/low-memory-monitor/)).
  #
  # There is also an implementation for use inside Flatpak sandboxes.
  #
  # Possible actions to take when the signal is received are:
  #
  #  - Free caches
  #  - Save files that haven't been looked at in a while to disk, ready to be reopened when needed
  #  - Run a garbage collection cycle
  #  - Try and compress fragmented allocations
  #  - Exit on idle if the process has no reason to stay around
  #  - Call [`malloc_trim(3)`](man:malloc_trim) to return cached heap pages to
  #    the kernel (if supported by your libc)
  #
  # Note that some actions may not always improve system performance, and so
  # should be profiled for your application. `malloc_trim()`, for example, may
  # make future heap allocations slower (due to releasing cached heap pages back
  # to the kernel).
  #
  # See #GMemoryMonitorWarningLevel for details on the various warning levels.
  #
  # |[<!-- language="C" -->
  # static void
  # warning_cb (GMemoryMonitor *m, GMemoryMonitorWarningLevel level)
  # {
  #   g_debug ("Warning level: %d", level);
  #   if (warning_level > G_MEMORY_MONITOR_WARNING_LEVEL_LOW)
  #     drop_caches ();
  # }
  #
  # static GMemoryMonitor *
  # monitor_low_memory (void)
  # {
  #   GMemoryMonitor *m;
  #   m = g_memory_monitor_dup_default ();
  #   g_signal_connect (G_OBJECT (m), "low-memory-warning",
  #                     G_CALLBACK (warning_cb), NULL);
  #   return m;
  # }
  # ]|
  #
  # Don't forget to disconnect the #GMemoryMonitor::low-memory-warning
  # signal, and unref the #GMemoryMonitor itself when exiting.
  module MemoryMonitor
    def self.dup_default : Gio::MemoryMonitor
      # g_memory_monitor_dup_default: (None)
      # Returns: (transfer full)

      _retval = LibGio.g_memory_monitor_dup_default
      Gio::MemoryMonitor__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class MemoryMonitor__Impl
    include MemoryMonitor

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
      LibGio.g_memory_monitor_get_type
    end

    # Cast a `GObject::Object` to `MemoryMonitor`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to MemoryMonitor")
    end

    # Cast a `GObject::Object` to `MemoryMonitor`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
