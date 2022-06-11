require "../g_object-2.0/object"

module Gio
  # Watches #GUnixMounts for changes.
  @[GObject::GeneratedWrapper]
  class UnixMountMonitor < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::UnixMountMonitorClass), class_init,
        sizeof(LibGio::UnixMountMonitor), instance_init, 0)
    end

    GICrystal.define_new_method(UnixMountMonitor, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `UnixMountMonitor`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_unix_mount_monitor_get_type
    end

    # Gets the #GUnixMountMonitor for the current thread-default main
    # context.
    #
    # The mount monitor can be used to monitor for changes to the list of
    # mounted filesystems as well as the list of mount points (ie: fstab
    # entries).
    #
    # You must only call g_object_unref() on the return value from under
    # the same main context as you called this function.
    def self.get : Gio::UnixMountMonitor
      # g_unix_mount_monitor_get: (None)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_unix_mount_monitor_get

      # Return value handling

      Gio::UnixMountMonitor.new(_retval, GICrystal::Transfer::Full)
    end

    # This function does nothing.
    #
    # Before 2.44, this was a partially-effective way of controlling the
    # rate at which events would be reported under some uncommon
    # circumstances.  Since @mount_monitor is a singleton, it also meant
    # that calling this function would have side effects for other users of
    # the monitor.
    def rate_limit=(limit_msec : Int32) : Nil
      # g_unix_mount_monitor_set_rate_limit: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_unix_mount_monitor_set_rate_limit(@pointer, limit_msec)

      # Return value handling
    end

    # Emitted when the unix mount points have changed.
    struct MountpointsChangedSignal < GObject::Signal
      def name : String
        @detail ? "mountpoints-changed::#{@detail}" : "mountpoints-changed"
      end

      def connect(*, after : Bool = false, &block : Proc(Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::UnixMountMonitor, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::UnixMountMonitor.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::UnixMountMonitor, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "mountpoints-changed")
      end
    end

    def mountpoints_changed_signal
      MountpointsChangedSignal.new(self)
    end

    # Emitted when the unix mounts have changed.
    struct MountsChangedSignal < GObject::Signal
      def name : String
        @detail ? "mounts-changed::#{@detail}" : "mounts-changed"
      end

      def connect(*, after : Bool = false, &block : Proc(Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::UnixMountMonitor, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::UnixMountMonitor.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::UnixMountMonitor, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "mounts-changed")
      end
    end

    def mounts_changed_signal
      MountsChangedSignal.new(self)
    end
  end
end
