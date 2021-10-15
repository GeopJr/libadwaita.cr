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
  class VolumeMonitor < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_volume_monitor_get_type
    end

    def self.adopt_orphan_mount(mount : Gio::Mount) : Gio::Volume
      # g_volume_monitor_adopt_orphan_mount: (None)
      # Returns: (transfer full)

      _retval = LibGio.g_volume_monitor_adopt_orphan_mount(mount)
      Gio::Volume__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def self.get : Gio::VolumeMonitor
      # g_volume_monitor_get: (None)
      # Returns: (transfer full)

      _retval = LibGio.g_volume_monitor_get
      Gio::VolumeMonitor.new(_retval, GICrystal::Transfer::Full)
    end

    def connected_drives : GLib::List
      # g_volume_monitor_get_connected_drives: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_volume_monitor_get_connected_drives(self)
      GLib::List(Gio::Drive).new(_retval, GICrystal::Transfer::Full)
    end

    def mount_for_uuid(uuid : ::String) : Gio::Mount?
      # g_volume_monitor_get_mount_for_uuid: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_volume_monitor_get_mount_for_uuid(self, uuid)
      Gio::Mount__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def mounts : GLib::List
      # g_volume_monitor_get_mounts: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_volume_monitor_get_mounts(self)
      GLib::List(Gio::Mount).new(_retval, GICrystal::Transfer::Full)
    end

    def volume_for_uuid(uuid : ::String) : Gio::Volume?
      # g_volume_monitor_get_volume_for_uuid: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_volume_monitor_get_volume_for_uuid(self, uuid)
      Gio::Volume__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def volumes : GLib::List
      # g_volume_monitor_get_volumes: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_volume_monitor_get_volumes(self)
      GLib::List(Gio::Volume).new(_retval, GICrystal::Transfer::Full)
    end

    struct DriveChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "drive-changed::#{@detail}" : "drive-changed"
      end

      def connect(&block : Proc(Gio::Drive, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::Drive, Nil))
        connect(block)
      end

      def connect(block : Proc(Gio::Drive, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Drive__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Drive, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Drive, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Drive__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Drive, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::VolumeMonitor, Gio::Drive, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Drive__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Drive, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::VolumeMonitor, Gio::Drive, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Drive__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Drive, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(drive : Gio::Drive) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drive-changed", drive)
      end
    end

    def drive_changed_signal
      DriveChangedSignal.new(self)
    end

    struct DriveConnectedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "drive-connected::#{@detail}" : "drive-connected"
      end

      def connect(&block : Proc(Gio::Drive, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::Drive, Nil))
        connect(block)
      end

      def connect(block : Proc(Gio::Drive, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Drive__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Drive, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Drive, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Drive__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Drive, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::VolumeMonitor, Gio::Drive, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Drive__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Drive, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::VolumeMonitor, Gio::Drive, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Drive__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Drive, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(drive : Gio::Drive) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drive-connected", drive)
      end
    end

    def drive_connected_signal
      DriveConnectedSignal.new(self)
    end

    struct DriveDisconnectedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "drive-disconnected::#{@detail}" : "drive-disconnected"
      end

      def connect(&block : Proc(Gio::Drive, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::Drive, Nil))
        connect(block)
      end

      def connect(block : Proc(Gio::Drive, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Drive__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Drive, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Drive, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Drive__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Drive, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::VolumeMonitor, Gio::Drive, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Drive__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Drive, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::VolumeMonitor, Gio::Drive, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Drive__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Drive, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(drive : Gio::Drive) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drive-disconnected", drive)
      end
    end

    def drive_disconnected_signal
      DriveDisconnectedSignal.new(self)
    end

    struct DriveEjectButtonSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "drive-eject-button::#{@detail}" : "drive-eject-button"
      end

      def connect(&block : Proc(Gio::Drive, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::Drive, Nil))
        connect(block)
      end

      def connect(block : Proc(Gio::Drive, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Drive__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Drive, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Drive, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Drive__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Drive, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::VolumeMonitor, Gio::Drive, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Drive__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Drive, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::VolumeMonitor, Gio::Drive, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Drive__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Drive, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(drive : Gio::Drive) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drive-eject-button", drive)
      end
    end

    def drive_eject_button_signal
      DriveEjectButtonSignal.new(self)
    end

    struct DriveStopButtonSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "drive-stop-button::#{@detail}" : "drive-stop-button"
      end

      def connect(&block : Proc(Gio::Drive, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::Drive, Nil))
        connect(block)
      end

      def connect(block : Proc(Gio::Drive, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Drive__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Drive, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Drive, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Drive__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Drive, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::VolumeMonitor, Gio::Drive, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Drive__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Drive, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::VolumeMonitor, Gio::Drive, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Drive__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Drive, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(drive : Gio::Drive) : Nil
        LibGObject.g_signal_emit_by_name(@source, "drive-stop-button", drive)
      end
    end

    def drive_stop_button_signal
      DriveStopButtonSignal.new(self)
    end

    struct MountAddedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "mount-added::#{@detail}" : "mount-added"
      end

      def connect(&block : Proc(Gio::Mount, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::Mount, Nil))
        connect(block)
      end

      def connect(block : Proc(Gio::Mount, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Mount__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Mount, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Mount, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Mount__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Mount, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::VolumeMonitor, Gio::Mount, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Mount__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Mount, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::VolumeMonitor, Gio::Mount, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Mount__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Mount, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(mount : Gio::Mount) : Nil
        LibGObject.g_signal_emit_by_name(@source, "mount-added", mount)
      end
    end

    def mount_added_signal
      MountAddedSignal.new(self)
    end

    struct MountChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "mount-changed::#{@detail}" : "mount-changed"
      end

      def connect(&block : Proc(Gio::Mount, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::Mount, Nil))
        connect(block)
      end

      def connect(block : Proc(Gio::Mount, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Mount__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Mount, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Mount, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Mount__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Mount, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::VolumeMonitor, Gio::Mount, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Mount__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Mount, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::VolumeMonitor, Gio::Mount, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Mount__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Mount, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(mount : Gio::Mount) : Nil
        LibGObject.g_signal_emit_by_name(@source, "mount-changed", mount)
      end
    end

    def mount_changed_signal
      MountChangedSignal.new(self)
    end

    struct MountPreUnmountSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "mount-pre-unmount::#{@detail}" : "mount-pre-unmount"
      end

      def connect(&block : Proc(Gio::Mount, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::Mount, Nil))
        connect(block)
      end

      def connect(block : Proc(Gio::Mount, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Mount__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Mount, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Mount, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Mount__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Mount, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::VolumeMonitor, Gio::Mount, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Mount__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Mount, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::VolumeMonitor, Gio::Mount, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Mount__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Mount, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(mount : Gio::Mount) : Nil
        LibGObject.g_signal_emit_by_name(@source, "mount-pre-unmount", mount)
      end
    end

    def mount_pre_unmount_signal
      MountPreUnmountSignal.new(self)
    end

    struct MountRemovedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "mount-removed::#{@detail}" : "mount-removed"
      end

      def connect(&block : Proc(Gio::Mount, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::Mount, Nil))
        connect(block)
      end

      def connect(block : Proc(Gio::Mount, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Mount__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Mount, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Mount, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Mount__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Mount, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::VolumeMonitor, Gio::Mount, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Mount__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Mount, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::VolumeMonitor, Gio::Mount, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Mount__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Mount, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(mount : Gio::Mount) : Nil
        LibGObject.g_signal_emit_by_name(@source, "mount-removed", mount)
      end
    end

    def mount_removed_signal
      MountRemovedSignal.new(self)
    end

    struct VolumeAddedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "volume-added::#{@detail}" : "volume-added"
      end

      def connect(&block : Proc(Gio::Volume, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::Volume, Nil))
        connect(block)
      end

      def connect(block : Proc(Gio::Volume, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Volume__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Volume, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Volume, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Volume__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Volume, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::VolumeMonitor, Gio::Volume, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Volume__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Volume, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::VolumeMonitor, Gio::Volume, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Volume__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Volume, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(volume : Gio::Volume) : Nil
        LibGObject.g_signal_emit_by_name(@source, "volume-added", volume)
      end
    end

    def volume_added_signal
      VolumeAddedSignal.new(self)
    end

    struct VolumeChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "volume-changed::#{@detail}" : "volume-changed"
      end

      def connect(&block : Proc(Gio::Volume, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::Volume, Nil))
        connect(block)
      end

      def connect(block : Proc(Gio::Volume, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Volume__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Volume, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Volume, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Volume__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Volume, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::VolumeMonitor, Gio::Volume, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Volume__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Volume, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::VolumeMonitor, Gio::Volume, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Volume__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Volume, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(volume : Gio::Volume) : Nil
        LibGObject.g_signal_emit_by_name(@source, "volume-changed", volume)
      end
    end

    def volume_changed_signal
      VolumeChangedSignal.new(self)
    end

    struct VolumeRemovedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "volume-removed::#{@detail}" : "volume-removed"
      end

      def connect(&block : Proc(Gio::Volume, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::Volume, Nil))
        connect(block)
      end

      def connect(block : Proc(Gio::Volume, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Volume__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Volume, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Volume, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::Volume__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Volume, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::VolumeMonitor, Gio::Volume, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Volume__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Volume, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::VolumeMonitor, Gio::Volume, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::VolumeMonitor.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::Volume__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::VolumeMonitor, Gio::Volume, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
