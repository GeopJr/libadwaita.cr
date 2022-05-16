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

      # C call
      _retval = LibGio.g_memory_monitor_dup_default

      # Return value handling

      Gio::AbstractMemoryMonitor.new(_retval, GICrystal::Transfer::Full)
    end

    struct LowMemoryWarningSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "low-memory-warning::#{@detail}" : "low-memory-warning"
      end

      def connect(&block : Proc(Gio::MemoryMonitorWarningLevel, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::MemoryMonitorWarningLevel, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gio::MemoryMonitorWarningLevel, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_level : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          level = Gio::MemoryMonitorWarningLevel.new(lib_level)
          ::Box(Proc(Gio::MemoryMonitorWarningLevel, Nil)).unbox(_lib_box).call(level)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::MemoryMonitorWarningLevel, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_level : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          level = Gio::MemoryMonitorWarningLevel.new(lib_level)
          ::Box(Proc(Gio::MemoryMonitorWarningLevel, Nil)).unbox(_lib_box).call(level)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::MemoryMonitor, Gio::MemoryMonitorWarningLevel, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_level : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gio::AbstractMemoryMonitor.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          level = Gio::MemoryMonitorWarningLevel.new(lib_level)
          ::Box(Proc(Gio::MemoryMonitor, Gio::MemoryMonitorWarningLevel, Nil)).unbox(_lib_box).call(_sender, level)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::MemoryMonitor, Gio::MemoryMonitorWarningLevel, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_level : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gio::AbstractMemoryMonitor.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          level = Gio::MemoryMonitorWarningLevel.new(lib_level)
          ::Box(Proc(Gio::MemoryMonitor, Gio::MemoryMonitorWarningLevel, Nil)).unbox(_lib_box).call(_sender, level)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(level : Gio::MemoryMonitorWarningLevel) : Nil
        LibGObject.g_signal_emit_by_name(@source, "low-memory-warning", level)
      end
    end

    def low_memory_warning_signal
      LowMemoryWarningSignal.new(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractMemoryMonitor < GObject::Object
    include MemoryMonitor

    GICrystal.define_new_method(Gio::AbstractMemoryMonitor, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
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
