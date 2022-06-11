require "../g_object-2.0/object"

module Gio
  # #GVolumeMonitor is for listing the user interesting devices and volumes
  # on the computer. In other words, what a file selector or file manager
  # would show in a sidebar.
  #
  # #GVolumeMonitor is not
  # [thread-default-context aware][g-main-context-push-thread-default],
  # and so should not be used other than from the main thread, with no
  # thread-default-context active.
  #
  # In order to receive updates about volumes and mounts monitored through GVFS,
  # a main loop must be running.
  @[GObject::GeneratedWrapper]
  class VolumeMonitor < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::VolumeMonitorClass), class_init,
        sizeof(LibGio::VolumeMonitor), instance_init, 0)
    end

    GICrystal.define_new_method(VolumeMonitor, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `VolumeMonitor`.
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
      LibGio.g_volume_monitor_get_type
    end

    # This function should be called by any #GVolumeMonitor
    # implementation when a new #GMount object is created that is not
    # associated with a #GVolume object. It must be called just before
    # emitting the @mount_added signal.
    #
    # If the return value is not %NULL, the caller must associate the
    # returned #GVolume object with the #GMount. This involves returning
    # it in its g_mount_get_volume() implementation. The caller must
    # also listen for the "removed" signal on the returned object
    # and give up its reference when handling that signal
    #
    # Similarly, if implementing g_volume_monitor_adopt_orphan_mount(),
    # the implementor must take a reference to @mount and return it in
    # its g_volume_get_mount() implemented. Also, the implementor must
    # listen for the "unmounted" signal on @mount and give up its
    # reference upon handling that signal.
    #
    # There are two main use cases for this function.
    #
    # One is when implementing a user space file system driver that reads
    # blocks of a block device that is already represented by the native
    # volume monitor (for example a CD Audio file system driver). Such
    # a driver will generate its own #GMount object that needs to be
    # associated with the #GVolume object that represents the volume.
    #
    # The other is for implementing a #GVolumeMonitor whose sole purpose
    # is to return #GVolume objects representing entries in the users
    # "favorite servers" list or similar.
    def self.adopt_orphan_mount(mount : Gio::Mount) : Gio::Volume
      # g_volume_monitor_adopt_orphan_mount: (None)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_volume_monitor_adopt_orphan_mount(mount)

      # Return value handling

      Gio::AbstractVolume.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the volume monitor used by gio.
    def self.get : Gio::VolumeMonitor
      # g_volume_monitor_get: (None)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_volume_monitor_get

      # Return value handling

      Gio::VolumeMonitor.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets a list of drives connected to the system.
    #
    # The returned list should be freed with g_list_free(), after
    # its elements have been unreffed with g_object_unref().
    def connected_drives : GLib::List
      # g_volume_monitor_get_connected_drives: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_volume_monitor_get_connected_drives(@pointer)

      # Return value handling

      GLib::List(Gio::Drive).new(_retval, GICrystal::Transfer::Full)
    end

    # Finds a #GMount object by its UUID (see g_mount_get_uuid())
    def mount_for_uuid(uuid : ::String) : Gio::Mount?
      # g_volume_monitor_get_mount_for_uuid: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_volume_monitor_get_mount_for_uuid(@pointer, uuid)

      # Return value handling

      Gio::AbstractMount.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets a list of the mounts on the system.
    #
    # The returned list should be freed with g_list_free(), after
    # its elements have been unreffed with g_object_unref().
    def mounts : GLib::List
      # g_volume_monitor_get_mounts: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_volume_monitor_get_mounts(@pointer)

      # Return value handling

      GLib::List(Gio::Mount).new(_retval, GICrystal::Transfer::Full)
    end

    # Finds a #GVolume object by its UUID (see g_volume_get_uuid())
    def volume_for_uuid(uuid : ::String) : Gio::Volume?
      # g_volume_monitor_get_volume_for_uuid: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_volume_monitor_get_volume_for_uuid(@pointer, uuid)

      # Return value handling

      Gio::AbstractVolume.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets a list of the volumes on the system.
    #
    # The returned list should be freed with g_list_free(), after
    # its elements have been unreffed with g_object_unref().
    def volumes : GLib::List
      # g_volume_monitor_get_volumes: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_volume_monitor_get_volumes(@pointer)

      # Return value handling

      GLib::List(Gio::Volume).new(_retval, GICrystal::Transfer::Full)
    end

    # Emitted when a drive changes.
    struct DriveChangedSignal < GObject::Signal
      def name : String
        @detail ? "drive-changed::#{@detail}" : "drive-changed"
      end

      def connect(*, after : Bool = false, &block : Proc(Gio::Drive, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gio::Drive, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drive : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          drive = Gio::Drive.new(lib_drive, :none)
          ::Box(Proc(Gio::Drive, Nil)).unbox(_lib_box).call(drive)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::VolumeMonitor, Gio::Drive, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drive : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::VolumeMonitor.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          drive = Gio::Drive.new(lib_drive, :none)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Drive, Nil)).unbox(_lib_box).call(_sender, drive)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(drive : Gio::Drive) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drive-changed", drive)
      end
    end

    def drive_changed_signal
      DriveChangedSignal.new(self)
    end

    # Emitted when a drive is connected to the system.
    struct DriveConnectedSignal < GObject::Signal
      def name : String
        @detail ? "drive-connected::#{@detail}" : "drive-connected"
      end

      def connect(*, after : Bool = false, &block : Proc(Gio::Drive, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gio::Drive, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drive : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          drive = Gio::Drive.new(lib_drive, :none)
          ::Box(Proc(Gio::Drive, Nil)).unbox(_lib_box).call(drive)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::VolumeMonitor, Gio::Drive, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drive : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::VolumeMonitor.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          drive = Gio::Drive.new(lib_drive, :none)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Drive, Nil)).unbox(_lib_box).call(_sender, drive)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(drive : Gio::Drive) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drive-connected", drive)
      end
    end

    def drive_connected_signal
      DriveConnectedSignal.new(self)
    end

    # Emitted when a drive is disconnected from the system.
    struct DriveDisconnectedSignal < GObject::Signal
      def name : String
        @detail ? "drive-disconnected::#{@detail}" : "drive-disconnected"
      end

      def connect(*, after : Bool = false, &block : Proc(Gio::Drive, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gio::Drive, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drive : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          drive = Gio::Drive.new(lib_drive, :none)
          ::Box(Proc(Gio::Drive, Nil)).unbox(_lib_box).call(drive)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::VolumeMonitor, Gio::Drive, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drive : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::VolumeMonitor.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          drive = Gio::Drive.new(lib_drive, :none)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Drive, Nil)).unbox(_lib_box).call(_sender, drive)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(drive : Gio::Drive) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drive-disconnected", drive)
      end
    end

    def drive_disconnected_signal
      DriveDisconnectedSignal.new(self)
    end

    # Emitted when the eject button is pressed on @drive.
    struct DriveEjectButtonSignal < GObject::Signal
      def name : String
        @detail ? "drive-eject-button::#{@detail}" : "drive-eject-button"
      end

      def connect(*, after : Bool = false, &block : Proc(Gio::Drive, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gio::Drive, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drive : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          drive = Gio::Drive.new(lib_drive, :none)
          ::Box(Proc(Gio::Drive, Nil)).unbox(_lib_box).call(drive)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::VolumeMonitor, Gio::Drive, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drive : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::VolumeMonitor.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          drive = Gio::Drive.new(lib_drive, :none)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Drive, Nil)).unbox(_lib_box).call(_sender, drive)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(drive : Gio::Drive) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drive-eject-button", drive)
      end
    end

    def drive_eject_button_signal
      DriveEjectButtonSignal.new(self)
    end

    # Emitted when the stop button is pressed on @drive.
    struct DriveStopButtonSignal < GObject::Signal
      def name : String
        @detail ? "drive-stop-button::#{@detail}" : "drive-stop-button"
      end

      def connect(*, after : Bool = false, &block : Proc(Gio::Drive, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gio::Drive, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drive : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          drive = Gio::Drive.new(lib_drive, :none)
          ::Box(Proc(Gio::Drive, Nil)).unbox(_lib_box).call(drive)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::VolumeMonitor, Gio::Drive, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_drive : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::VolumeMonitor.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          drive = Gio::Drive.new(lib_drive, :none)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Drive, Nil)).unbox(_lib_box).call(_sender, drive)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(drive : Gio::Drive) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drive-stop-button", drive)
      end
    end

    def drive_stop_button_signal
      DriveStopButtonSignal.new(self)
    end

    # Emitted when a mount is added.
    struct MountAddedSignal < GObject::Signal
      def name : String
        @detail ? "mount-added::#{@detail}" : "mount-added"
      end

      def connect(*, after : Bool = false, &block : Proc(Gio::Mount, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gio::Mount, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_mount : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          mount = Gio::Mount.new(lib_mount, :none)
          ::Box(Proc(Gio::Mount, Nil)).unbox(_lib_box).call(mount)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::VolumeMonitor, Gio::Mount, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_mount : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::VolumeMonitor.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          mount = Gio::Mount.new(lib_mount, :none)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Mount, Nil)).unbox(_lib_box).call(_sender, mount)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(mount : Gio::Mount) : Nil
        LibGObject.g_signal_emit_by_name(@source, "mount-added", mount)
      end
    end

    def mount_added_signal
      MountAddedSignal.new(self)
    end

    # Emitted when a mount changes.
    struct MountChangedSignal < GObject::Signal
      def name : String
        @detail ? "mount-changed::#{@detail}" : "mount-changed"
      end

      def connect(*, after : Bool = false, &block : Proc(Gio::Mount, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gio::Mount, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_mount : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          mount = Gio::Mount.new(lib_mount, :none)
          ::Box(Proc(Gio::Mount, Nil)).unbox(_lib_box).call(mount)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::VolumeMonitor, Gio::Mount, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_mount : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::VolumeMonitor.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          mount = Gio::Mount.new(lib_mount, :none)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Mount, Nil)).unbox(_lib_box).call(_sender, mount)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(mount : Gio::Mount) : Nil
        LibGObject.g_signal_emit_by_name(@source, "mount-changed", mount)
      end
    end

    def mount_changed_signal
      MountChangedSignal.new(self)
    end

    # May be emitted when a mount is about to be removed.
    #
    # This signal depends on the backend and is only emitted if
    # GIO was used to unmount.
    struct MountPreUnmountSignal < GObject::Signal
      def name : String
        @detail ? "mount-pre-unmount::#{@detail}" : "mount-pre-unmount"
      end

      def connect(*, after : Bool = false, &block : Proc(Gio::Mount, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gio::Mount, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_mount : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          mount = Gio::Mount.new(lib_mount, :none)
          ::Box(Proc(Gio::Mount, Nil)).unbox(_lib_box).call(mount)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::VolumeMonitor, Gio::Mount, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_mount : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::VolumeMonitor.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          mount = Gio::Mount.new(lib_mount, :none)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Mount, Nil)).unbox(_lib_box).call(_sender, mount)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(mount : Gio::Mount) : Nil
        LibGObject.g_signal_emit_by_name(@source, "mount-pre-unmount", mount)
      end
    end

    def mount_pre_unmount_signal
      MountPreUnmountSignal.new(self)
    end

    # Emitted when a mount is removed.
    struct MountRemovedSignal < GObject::Signal
      def name : String
        @detail ? "mount-removed::#{@detail}" : "mount-removed"
      end

      def connect(*, after : Bool = false, &block : Proc(Gio::Mount, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gio::Mount, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_mount : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          mount = Gio::Mount.new(lib_mount, :none)
          ::Box(Proc(Gio::Mount, Nil)).unbox(_lib_box).call(mount)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::VolumeMonitor, Gio::Mount, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_mount : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::VolumeMonitor.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          mount = Gio::Mount.new(lib_mount, :none)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Mount, Nil)).unbox(_lib_box).call(_sender, mount)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(mount : Gio::Mount) : Nil
        LibGObject.g_signal_emit_by_name(@source, "mount-removed", mount)
      end
    end

    def mount_removed_signal
      MountRemovedSignal.new(self)
    end

    # Emitted when a mountable volume is added to the system.
    struct VolumeAddedSignal < GObject::Signal
      def name : String
        @detail ? "volume-added::#{@detail}" : "volume-added"
      end

      def connect(*, after : Bool = false, &block : Proc(Gio::Volume, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gio::Volume, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_volume : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          volume = Gio::Volume.new(lib_volume, :none)
          ::Box(Proc(Gio::Volume, Nil)).unbox(_lib_box).call(volume)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::VolumeMonitor, Gio::Volume, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_volume : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::VolumeMonitor.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          volume = Gio::Volume.new(lib_volume, :none)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Volume, Nil)).unbox(_lib_box).call(_sender, volume)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(volume : Gio::Volume) : Nil
        LibGObject.g_signal_emit_by_name(@source, "volume-added", volume)
      end
    end

    def volume_added_signal
      VolumeAddedSignal.new(self)
    end

    # Emitted when mountable volume is changed.
    struct VolumeChangedSignal < GObject::Signal
      def name : String
        @detail ? "volume-changed::#{@detail}" : "volume-changed"
      end

      def connect(*, after : Bool = false, &block : Proc(Gio::Volume, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gio::Volume, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_volume : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          volume = Gio::Volume.new(lib_volume, :none)
          ::Box(Proc(Gio::Volume, Nil)).unbox(_lib_box).call(volume)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::VolumeMonitor, Gio::Volume, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_volume : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::VolumeMonitor.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          volume = Gio::Volume.new(lib_volume, :none)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Volume, Nil)).unbox(_lib_box).call(_sender, volume)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(volume : Gio::Volume) : Nil
        LibGObject.g_signal_emit_by_name(@source, "volume-changed", volume)
      end
    end

    def volume_changed_signal
      VolumeChangedSignal.new(self)
    end

    # Emitted when a mountable volume is removed from the system.
    struct VolumeRemovedSignal < GObject::Signal
      def name : String
        @detail ? "volume-removed::#{@detail}" : "volume-removed"
      end

      def connect(*, after : Bool = false, &block : Proc(Gio::Volume, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gio::Volume, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_volume : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          volume = Gio::Volume.new(lib_volume, :none)
          ::Box(Proc(Gio::Volume, Nil)).unbox(_lib_box).call(volume)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::VolumeMonitor, Gio::Volume, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_volume : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::VolumeMonitor.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          volume = Gio::Volume.new(lib_volume, :none)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Volume, Nil)).unbox(_lib_box).call(_sender, volume)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(volume : Gio::Volume) : Nil
        LibGObject.g_signal_emit_by_name(@source, "volume-removed", volume)
      end
    end

    def volume_removed_signal
      VolumeRemovedSignal.new(self)
    end
  end
end
